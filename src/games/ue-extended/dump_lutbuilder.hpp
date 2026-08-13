#pragma once

#include <atomic>
#include <cstddef>
#include <cstdint>
#include <limits>
#include <optional>
#include <shared_mutex>
#include <span>
#include <sstream>
#include <string>
#include <utility>
#include <vector>

#include <gtl/phmap.hpp>
#include <include/reshade.hpp>

#include "../../utils/bitwise.hpp"
#include "../../utils/data.hpp"
#include "../../utils/path.hpp"
#include "../../utils/pipeline_layout.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/resource.hpp"
#include "../../utils/shader.hpp"
#include "../../utils/shader_compiler_directx.hpp"
#include "../../utils/shader_dump.hpp"

namespace dump_lutbuilder {

inline constexpr float RESOURCE_TAG = 1.f;
inline constexpr std::uint32_t TARGET_LUT_SIZE = 32u;

using DescriptorLocation = std::pair<std::uint64_t, std::uint32_t>;

struct TargetMatch {
  reshade::api::resource resource = {0u};
  std::string binding;
};

enum class ComputeBindingType : std::uint8_t {
  DESCRIPTOR_TABLE,
  PUSH_DESCRIPTOR,
};

struct ComputeBinding {
  ComputeBindingType type = ComputeBindingType::DESCRIPTOR_TABLE;
  DescriptorLocation descriptor = {0u, 0u};
  reshade::api::resource resource = {0u};
};

enum class ShaderInvestigationStatus : std::uint8_t {
  INVESTIGATING,
  DUMPED,
  ALREADY_DUMPED,
  REJECTED,
};

inline constexpr std::size_t INITIAL_RESOURCE_COUNT = 64u;
inline constexpr std::size_t INITIAL_DESCRIPTOR_COUNT = 64u;
inline constexpr std::size_t INITIAL_SHADER_COUNT = 64u;

template <typename Key, typename Value>
using SingleShardMap = gtl::parallel_flat_hash_map<
    Key,
    Value,
    gtl::Hash<Key>,
    gtl::EqualTo<Key>,
    renodx::utils::platform::ProcessAllocator<std::pair<const Key, Value>>,
    0u,  // 2^0 = one submap.
    std::shared_mutex>;

using TargetResourceMap = SingleShardMap<std::uint64_t, std::uint8_t>;
using TargetDescriptorMap = SingleShardMap<DescriptorLocation, reshade::api::resource>;
using InvestigatedShaderMap = SingleShardMap<std::uint32_t, ShaderInvestigationStatus>;

struct __declspec(uuid("b5350f9e-a521-4f4f-8f76-0f870bb1c923")) DeviceData {
  TargetResourceMap target_resources{INITIAL_RESOURCE_COUNT};
  TargetDescriptorMap target_uav_descriptors{INITIAL_DESCRIPTOR_COUNT};
};

struct __declspec(uuid("a147f35c-bf7b-4f46-a34f-894a553bfc70")) CommandListData {
  std::optional<TargetMatch> pixel_target;
  std::optional<ComputeBinding> compute_binding;
  reshade::api::pipeline_layout compute_layout = {0u};
};

inline InvestigatedShaderMap investigated_shaders{INITIAL_SHADER_COUNT};
inline std::atomic_bool enabled = true;
inline bool (*is_shader_in_addon)(std::uint32_t shader_hash) = nullptr;

inline void SetEnabled(bool value) {
  enabled.store(value, std::memory_order_release);
}

inline bool IsEnabled() {
  return enabled.load(std::memory_order_acquire);
}

inline bool EraseTargetDescriptor(DeviceData* data, const DescriptorLocation& location) {
  return data != nullptr && data->target_uav_descriptors.erase(location) != 0u;
}

inline bool SetTargetDescriptor(
    DeviceData* data,
    const DescriptorLocation& location,
    reshade::api::resource resource) {
  if (data == nullptr || location.first == 0u) return false;
  if (resource.handle == 0u) return EraseTargetDescriptor(data, location);
  return data->target_uav_descriptors.insert_or_assign(location, resource).second;
}

#ifdef DEBUG_LEVEL_1
inline void LogDescriptorEvent(
    const char* event_name,
    std::uint32_t batch_count,
    std::uint64_t descriptor_count) {
  std::stringstream message;
  message << "DX12 LUT builder descriptor " << event_name
          << " event: " << batch_count << " batch"
          << (batch_count == 1u ? "" : "es")
          << ", " << descriptor_count << " descriptor"
          << (descriptor_count == 1u ? "" : "s")
          << ", tracker " << (IsEnabled() ? "enabled" : "disabled");
  reshade::log::message(reshade::log::level::debug, message.str().c_str());
}
#endif

inline void SetShaderInAddonCallback(bool (*callback)(std::uint32_t shader_hash)) {
  is_shader_in_addon = callback;
}

inline bool IsD3D12(const reshade::api::device* device) {
  return device != nullptr && device->get_api() == reshade::api::device_api::d3d12;
}

inline bool IsTargetLutDesc(const reshade::api::resource_desc& desc) {
  return desc.type == reshade::api::resource_type::texture_3d
         && desc.texture.width == TARGET_LUT_SIZE
         && desc.texture.height == TARGET_LUT_SIZE
         && desc.texture.depth_or_layers == TARGET_LUT_SIZE;
}

inline bool IsUavDescriptorType(reshade::api::descriptor_type type) {
  return type == reshade::api::descriptor_type::unordered_access_view
         || type == reshade::api::descriptor_type::buffer_unordered_access_view;
}

inline bool HasInvestigatedShader(std::uint32_t shader_hash) {
  return investigated_shaders.if_contains(shader_hash, [](const auto&) {});
}

inline bool TryBeginShaderInvestigation(std::uint32_t shader_hash) {
  return investigated_shaders.lazy_emplace_l(
      shader_hash,
      [](auto&) {},
      [shader_hash](const InvestigatedShaderMap::constructor& constructor) {
        constructor(shader_hash, ShaderInvestigationStatus::INVESTIGATING);
      });
}

inline void SetShaderInvestigationStatus(
    std::uint32_t shader_hash,
    ShaderInvestigationStatus status) {
  investigated_shaders.modify_if(shader_hash, [status](auto& pair) {
    pair.second = status;
  });
}

inline void ClearInvestigatedShaders() {
  investigated_shaders.clear();
}

inline DescriptorLocation GetDescriptorLocation(
    reshade::api::device* device,
    reshade::api::descriptor_table table,
    std::uint32_t binding,
    std::uint32_t array_offset = 0u) {
  if (!IsD3D12(device) || table.handle == 0u) return {0u, 0u};

  reshade::api::descriptor_heap heap = {0u};
  std::uint32_t offset = 0u;
  device->get_descriptor_heap_offset(table, binding, array_offset, &heap, &offset);
  return {heap.handle, offset};
}

inline bool IsTargetResource(DeviceData* data, reshade::api::resource resource) {
  if (data == nullptr || resource.handle == 0u) return false;
  return data->target_resources.if_contains(resource.handle, [](const auto&) {});
}

inline reshade::api::resource GetTargetResourceFromView(
    reshade::api::device* device,
    reshade::api::resource_view view) {
  if (!IsD3D12(device) || view.handle == 0u) return {0u};

  auto* data = renodx::utils::data::Get<DeviceData>(device);
  const auto resource = renodx::utils::resource::GetResourceFromView(device, view);
  return IsTargetResource(data, resource) ? resource : reshade::api::resource{0u};
}

inline CommandListData* GetCommandListData(reshade::api::command_list* cmd_list) {
  if (cmd_list == nullptr || !IsD3D12(cmd_list->get_device())) return nullptr;

  CommandListData* data = nullptr;
  renodx::utils::data::CreateOrGet(cmd_list, data);
  return data;
}

inline bool HasPixelLutBuilderSignature(std::span<std::uint8_t> shader_data) {
  const auto disassembly =
      renodx::utils::shader::compiler::directx::DisassembleShader(shader_data);
  const auto input_signature = disassembly.find("Input signature:");
  if (input_signature == std::string::npos) return false;

  const auto output_signature = disassembly.find("Output signature:", input_signature);
  if (output_signature == std::string::npos) return false;

  const auto semantic = disassembly.find("SV_RenderTargetArrayIndex", input_signature);
  if (semantic == std::string::npos || semantic >= output_signature) return false;

  std::uint32_t render_target_count = 0u;
  std::size_t position = output_signature;
  while ((position = disassembly.find("SV_Target", position)) != std::string::npos) {
    const auto line_start = disassembly.rfind('\n', position);
    const auto first_token = disassembly.find_first_not_of(
        " \t\r/;",
        line_start == std::string::npos ? output_signature : line_start + 1u);
    const auto semantic_end = position + sizeof("SV_Target") - 1u;
    if (first_token == position
        && (semantic_end == disassembly.size()
            || disassembly[semantic_end] == ' '
            || disassembly[semantic_end] == '\t')) {
      ++render_target_count;
    }
    position = semantic_end;
  }
  return render_target_count == 1u;
}

inline void DumpCurrentShader(
    renodx::utils::shader::StageState* stage_state,
    std::int32_t shader_stage_index,
    reshade::api::pipeline_subobject_type shader_type,
    std::uint32_t shader_hash,
    const TargetMatch& match,
    const char* stage_name) {
  if (shader_hash == 0u || HasInvestigatedShader(shader_hash)) return;

  const bool investigation_started = TryBeginShaderInvestigation(shader_hash);
  if (!investigation_started) return;
  try {
    auto shader_data = renodx::utils::shader::GetShaderData(stage_state, shader_stage_index);
    if (!shader_data.has_value()) {
      SetShaderInvestigationStatus(shader_hash, ShaderInvestigationStatus::REJECTED);
      return;
    }

    const auto shader_version = renodx::utils::shader::compiler::directx::DecodeShaderVersion(
        shader_data.value());
    if (shader_version.GetMajor() == 0u) {
      SetShaderInvestigationStatus(shader_hash, ShaderInvestigationStatus::REJECTED);
      return;
    }
    if (shader_type == reshade::api::pipeline_subobject_type::pixel_shader
        && !HasPixelLutBuilderSignature(shader_data.value())) {
      SetShaderInvestigationStatus(shader_hash, ShaderInvestigationStatus::REJECTED);
      return;
    }

    const bool is_known_shader = is_shader_in_addon != nullptr && is_shader_in_addon(shader_hash);
    const char* dump_prefix = is_known_shader ? "lutbuilder_" : "lutbuilder_new_";

    const auto dump_path = renodx::utils::shader::dump::GetShaderDumpPath(
        shader_hash,
        shader_data.value(),
        shader_type,
        dump_prefix,
        reshade::api::device_api::d3d12);
    if (renodx::utils::path::CheckExistsFile(dump_path)) {
      SetShaderInvestigationStatus(
          shader_hash,
          ShaderInvestigationStatus::ALREADY_DUMPED);
      return;
    }

    const bool dumped = renodx::utils::shader::dump::DumpShader(
        shader_hash,
        shader_data.value(),
        shader_type,
        dump_prefix,
        reshade::api::device_api::d3d12);
    SetShaderInvestigationStatus(
        shader_hash,
        dumped ? ShaderInvestigationStatus::DUMPED : ShaderInvestigationStatus::REJECTED);

#ifdef DEBUG_LEVEL_0
    if (dumped) {
      reshade::api::resource_desc resource_desc = {};
      reshade::api::resource_desc original_resource_desc = {};
      float resource_tag = -1.f;
      const bool found_resource_info =
          renodx::utils::resource::GetResourceInfo(
              match.resource,
              [&](const renodx::utils::resource::ResourceInfo& resource_info) {
                resource_desc = resource_info.desc;
                original_resource_desc =
                    resource_info.fallback_desc.type
                            != reshade::api::resource_type::unknown
                        ? resource_info.fallback_desc
                        : resource_info.desc;
                resource_tag = resource_info.resource_tag;
              });
      std::stringstream message;
      message << "DX12 LUT builder candidate passed and dumped: "
              << stage_name << " shader "
              << PRINT_CRC32(shader_hash)
              << (is_known_shader ? " (already in addon)" : " (new)")
              << "; output resource 0x" << std::hex << match.resource.handle << std::dec
              << " is currently bound via " << match.binding
              << ", Texture3D "
              << resource_desc.texture.width << 'x'
              << resource_desc.texture.height << 'x'
              << resource_desc.texture.depth_or_layers
              << ", format " << resource_desc.texture.format
              << ", tag " << resource_tag;
      if (found_resource_info) {
        message << "; original Texture3D "
                << original_resource_desc.texture.width << 'x'
                << original_resource_desc.texture.height << 'x'
                << original_resource_desc.texture.depth_or_layers
                << ", format " << original_resource_desc.texture.format;
      } else {
        message << "; original resource description unavailable";
      }
      message << "; passed because the output resource is tracked "
              << (resource_tag == RESOURCE_TAG
                      ? "by resource tag"
                      : "by exact 32x32x32 dimensions");
      if (shader_type == reshade::api::pipeline_subobject_type::pixel_shader) {
        message << " and the pixel input signature contains "
                   "SV_RenderTargetArrayIndex and has exactly one render target output";
      } else {
        message << " and the compute output binding resolves to this exact resource";
      }
      reshade::log::message(reshade::log::level::info, message.str().c_str());
    }
#else
    (void)stage_name;
#endif
  } catch (...) {
    SetShaderInvestigationStatus(shader_hash, ShaderInvestigationStatus::REJECTED);
    std::stringstream message;
    message << "DX12 LUT builder candidate failed to dump shader " << PRINT_CRC32(shader_hash);
    reshade::log::message(reshade::log::level::warning, message.str().c_str());
  }
}

inline void ProcessCurrentPixelShader(
    reshade::api::command_list* cmd_list,
    const std::optional<TargetMatch>& match) {
  if (!match.has_value()) return;

  auto* device_data = renodx::utils::data::Get<DeviceData>(cmd_list->get_device());
  if (!IsTargetResource(device_data, match->resource)) return;
  auto* shader_state = renodx::utils::shader::GetCurrentState(cmd_list);
  if (shader_state == nullptr) return;
  auto* pixel_state = renodx::utils::shader::GetCurrentPixelState(shader_state);
  if (pixel_state->pipeline.handle == 0u) return;
  const auto shader_hash = renodx::utils::shader::GetCurrentPixelShaderHash(pixel_state);
  if (shader_hash == 0u) return;
  DumpCurrentShader(
      pixel_state,
      renodx::utils::shader::PIXEL_INDEX,
      reshade::api::pipeline_subobject_type::pixel_shader,
      shader_hash,
      match.value(),
      "pixel");
}

inline std::optional<TargetMatch> ResolveComputeTarget(
    reshade::api::command_list* cmd_list,
    const ComputeBinding& binding) {
  auto* device_data = renodx::utils::data::Get<DeviceData>(cmd_list->get_device());
  if (device_data == nullptr) return std::nullopt;

  reshade::api::resource resource = {0u};
  const char* binding_name = nullptr;
  if (binding.type == ComputeBindingType::DESCRIPTOR_TABLE) {
    if (binding.descriptor.first == 0u) return std::nullopt;
    device_data->target_uav_descriptors.if_contains(
        binding.descriptor,
        [&resource](const auto& pair) {
          resource = pair.second;
        });
    binding_name = "u0, space0 (descriptor table)";
  } else {
    resource = binding.resource;
    binding_name = "u0, space0 (pushed descriptor)";
  }

  if (!IsTargetResource(device_data, resource)) return std::nullopt;
  return TargetMatch{
      .resource = resource,
      .binding = binding_name,
  };
}

inline void ProcessCurrentComputeShader(reshade::api::command_list* cmd_list) {
  auto* command_data = GetCommandListData(cmd_list);
  if (command_data == nullptr || !command_data->compute_binding.has_value()) return;

  auto* shader_state = renodx::utils::shader::GetCurrentState(cmd_list);
  if (shader_state == nullptr) return;
  auto* compute_state = renodx::utils::shader::GetCurrentComputeState(shader_state);
  if (compute_state->pipeline.handle == 0u) return;
  const auto shader_hash = renodx::utils::shader::GetCurrentComputeShaderHash(compute_state);
  if (shader_hash == 0u
      || compute_state->pipeline_details == nullptr
      || command_data->compute_layout.handle == 0u
      || compute_state->pipeline_details->layout != command_data->compute_layout) {
    return;
  }

  const auto match = ResolveComputeTarget(cmd_list, command_data->compute_binding.value());
  if (!match.has_value()) return;
  DumpCurrentShader(
      compute_state,
      renodx::utils::shader::COMPUTE_INDEX,
      reshade::api::pipeline_subobject_type::compute_shader,
      shader_hash,
      match.value(),
      "compute");
}

inline void OnInitDevice(reshade::api::device* device) {
  if (IsD3D12(device)) renodx::utils::data::Create<DeviceData>(device);
}

inline void OnDestroyDevice(reshade::api::device* device) {
  if (IsD3D12(device)) renodx::utils::data::Delete<DeviceData>(device);
}

inline void OnInitResource(
    reshade::api::device* device,
    const reshade::api::resource_desc& desc,
    const reshade::api::subresource_data* /*initial_data*/,
    reshade::api::resource_usage /*initial_state*/,
    reshade::api::resource resource) {
  auto* data = IsD3D12(device) ? renodx::utils::data::Get<DeviceData>(device) : nullptr;
  if (data == nullptr || resource.handle == 0u) return;

  const bool matched_resource_tag =
      renodx::utils::resource::GetResourceTag(resource) == RESOURCE_TAG;
  if (matched_resource_tag || IsTargetLutDesc(desc)) {
    data->target_resources.insert_or_assign(resource.handle, 0u);
  } else {
    data->target_resources.erase(resource.handle);
  }
}

inline void OnDestroyResource(
    reshade::api::device* device,
    reshade::api::resource resource) {
  auto* data = IsD3D12(device) ? renodx::utils::data::Get<DeviceData>(device) : nullptr;
  if (data == nullptr || resource.handle == 0u) return;

  data->target_resources.erase(resource.handle);
  std::vector<DescriptorLocation> descriptors;
  data->target_uav_descriptors.for_each([&](const auto& pair) {
    if (pair.second == resource) descriptors.push_back(pair.first);
  });
  for (const auto& descriptor : descriptors) {
    EraseTargetDescriptor(data, descriptor);
  }
}

inline bool OnUpdateDescriptorTables(
    reshade::api::device* device,
    std::uint32_t count,
    const reshade::api::descriptor_table_update* updates) {
  if (!IsEnabled()) return false;
  auto* data = IsD3D12(device) ? renodx::utils::data::Get<DeviceData>(device) : nullptr;
  if (data == nullptr || count == 0u || updates == nullptr) return false;
#ifdef DEBUG_LEVEL_1
  if (IsD3D12(device)) {
    std::uint64_t descriptor_count = 0u;
    for (std::uint32_t i = 0u; updates != nullptr && i < count; ++i) {
      descriptor_count += updates[i].count;
    }
    LogDescriptorEvent("update", count, descriptor_count);
  }
#endif
  for (std::uint32_t i = 0u; i < count; ++i) {
    const auto& update = updates[i];
    if (update.count == 0u) continue;

    const auto* views = IsUavDescriptorType(update.type)
                            ? static_cast<const reshade::api::resource_view*>(update.descriptors)
                            : nullptr;
    std::vector<std::pair<std::uint32_t, reshade::api::resource>> target_updates;
    if (views != nullptr) {
      for (std::uint32_t descriptor_index = 0u;
           descriptor_index < update.count;
           ++descriptor_index) {
        const auto resource = GetTargetResourceFromView(device, views[descriptor_index]);
        if (resource.handle != 0u) {
          target_updates.emplace_back(descriptor_index, resource);
        }
      }
    }

    if (target_updates.empty() && data->target_uav_descriptors.empty()) continue;

    const auto first = GetDescriptorLocation(
        device,
        update.table,
        update.binding,
        update.array_offset);
    if (first.first == 0u) continue;
    // O(C) vs O(N)
    if (static_cast<std::size_t>(update.count) <= data->target_uav_descriptors.size()) {
      for (std::uint32_t descriptor_index = 0u;
           descriptor_index < update.count;
           ++descriptor_index) {
        EraseTargetDescriptor(
            data,
            DescriptorLocation{first.first, first.second + descriptor_index});
      }
    } else {
      std::vector<DescriptorLocation> destination_targets;
      const auto end = static_cast<std::uint64_t>(first.second) + update.count;
      data->target_uav_descriptors.for_each([&](const auto& pair) {
        const auto& location = pair.first;
        if (location.first == first.first
            && location.second >= first.second
            && static_cast<std::uint64_t>(location.second) < end) {
          destination_targets.push_back(location);
        }
      });
      for (const auto& location : destination_targets) {
        EraseTargetDescriptor(data, location);
      }
    }

    for (const auto& [relative_offset, resource] : target_updates) {
      if (!IsTargetResource(data, resource)) continue;
      SetTargetDescriptor(
          data,
          DescriptorLocation{first.first, first.second + relative_offset},
          resource);
    }
  }
  return false;
}

inline bool OnCopyDescriptorTables(
    reshade::api::device* device,
    std::uint32_t count,
    const reshade::api::descriptor_table_copy* copies) {
  if (!IsEnabled()) return false;
  auto* data = IsD3D12(device) ? renodx::utils::data::Get<DeviceData>(device) : nullptr;
  if (data == nullptr
      || count == 0u
      || copies == nullptr
      || data->target_uav_descriptors.empty()) {
    return false;
  }
#ifdef DEBUG_LEVEL_1
  if (IsD3D12(device)) {
    std::uint64_t descriptor_count = 0u;
    for (std::uint32_t i = 0u; copies != nullptr && i < count; ++i) {
      descriptor_count += copies[i].count;
    }
    LogDescriptorEvent("copy", count, descriptor_count);
  }
#endif
  for (std::uint32_t i = 0u; i < count; ++i) {
    const auto& copy = copies[i];
    const auto source = GetDescriptorLocation(
        device,
        copy.source_table,
        copy.source_binding,
        copy.source_array_offset);
    const auto destination = GetDescriptorLocation(
        device,
        copy.dest_table,
        copy.dest_binding,
        copy.dest_array_offset);
    if (destination.first == 0u) continue;

    // Copy count is O(2C) while other path is O(N) where N is the number of tracked descriptors. Use the faster path if the copy count is small enough.
    if (static_cast<std::uint64_t>(copy.count) * 2u
        <= data->target_uav_descriptors.size()) {
      std::vector<reshade::api::resource> source_resources(copy.count);
      if (source.first != 0u) {
        for (std::uint32_t descriptor_index = 0u;
             descriptor_index < copy.count;
             ++descriptor_index) {
          data->target_uav_descriptors.if_contains(
              DescriptorLocation{source.first, source.second + descriptor_index},
              [&](const auto& pair) {
                source_resources[descriptor_index] = pair.second;
              });
        }
      }

      for (std::uint32_t descriptor_index = 0u;
           descriptor_index < copy.count;
           ++descriptor_index) {
        const DescriptorLocation location = {
            destination.first,
            destination.second + descriptor_index,
        };
        const auto resource = source_resources[descriptor_index];
        if (resource.handle != 0u && IsTargetResource(data, resource)) {
          SetTargetDescriptor(data, location, resource);
        } else {
          EraseTargetDescriptor(data, location);
        }
      }
      continue;
    }

    std::vector<DescriptorLocation> destination_targets;
    std::vector<std::pair<std::uint32_t, reshade::api::resource>> source_targets;
    const auto source_end = static_cast<std::uint64_t>(source.second) + copy.count;
    const auto destination_end = static_cast<std::uint64_t>(destination.second) + copy.count;
    data->target_uav_descriptors.for_each([&](const auto& pair) {
      const auto& location = pair.first;
      if (location.first == destination.first
          && location.second >= destination.second
          && static_cast<std::uint64_t>(location.second) < destination_end) {
        destination_targets.push_back(location);
      }

      if (source.first != 0u
          && location.first == source.first
          && location.second >= source.second
          && static_cast<std::uint64_t>(location.second) < source_end) {
        source_targets.emplace_back(location.second - source.second, pair.second);
      }
    });

    for (const auto& location : destination_targets) {
      EraseTargetDescriptor(data, location);
    }
    for (const auto& [relative_offset, resource] : source_targets) {
      if (!IsTargetResource(data, resource)) continue;
      SetTargetDescriptor(
          data,
          DescriptorLocation{
              destination.first,
              destination.second + relative_offset,
          },
          resource);
    }
  }
  return false;
}

inline void OnInitCommandList(reshade::api::command_list* cmd_list) {
  if (cmd_list != nullptr && IsD3D12(cmd_list->get_device())) {
    renodx::utils::data::Create<CommandListData>(cmd_list);
  }
}

inline void OnResetCommandList(reshade::api::command_list* cmd_list) {
  if (cmd_list == nullptr || !IsD3D12(cmd_list->get_device())) return;
  renodx::utils::data::Delete<CommandListData>(cmd_list);
  renodx::utils::data::Create<CommandListData>(cmd_list);
}

inline void OnDestroyCommandList(reshade::api::command_list* cmd_list) {
  if (cmd_list != nullptr && IsD3D12(cmd_list->get_device())) {
    renodx::utils::data::Delete<CommandListData>(cmd_list);
  }
}

inline std::optional<TargetMatch> FindTargetView(
    reshade::api::device* device,
    reshade::api::resource_view view,
    std::string binding) {
  const auto resource = GetTargetResourceFromView(device, view);
  if (resource.handle == 0u) return std::nullopt;
  return TargetMatch{
      .resource = resource,
      .binding = std::move(binding),
  };
}

inline void OnBindRenderTargetsAndDepthStencil(
    reshade::api::command_list* cmd_list,
    std::uint32_t count,
    const reshade::api::resource_view* render_targets,
    reshade::api::resource_view /*depth_stencil*/) {
  if (!IsEnabled()) return;
  auto* data = GetCommandListData(cmd_list);
  if (data == nullptr) return;

  data->pixel_target.reset();
  for (std::uint32_t i = 0u; render_targets != nullptr && i < count; ++i) {
    std::stringstream binding;
    binding << "rt" << i;
    auto match = FindTargetView(
        cmd_list->get_device(),
        render_targets[i],
        binding.str());
    if (!match.has_value()) continue;
    data->pixel_target = std::move(match);
    break;
  }
}

inline void OnBeginRenderPass(
    reshade::api::command_list* cmd_list,
    std::uint32_t count,
    const reshade::api::render_pass_render_target_desc* render_targets,
    const reshade::api::render_pass_depth_stencil_desc* /*depth_stencil*/) {
  if (!IsEnabled()) return;
  auto* data = GetCommandListData(cmd_list);
  if (data == nullptr) return;

  data->pixel_target.reset();
  for (std::uint32_t i = 0u; render_targets != nullptr && i < count; ++i) {
    std::stringstream binding;
    binding << "rt" << i << " (render pass)";
    auto match = FindTargetView(
        cmd_list->get_device(),
        render_targets[i].view,
        binding.str());
    if (!match.has_value()) continue;
    data->pixel_target = std::move(match);
    break;
  }
}

inline void OnEndRenderPass(reshade::api::command_list* cmd_list) {
  if (!IsEnabled()) return;
  auto* data = GetCommandListData(cmd_list);
  if (data != nullptr) data->pixel_target.reset();
}

inline bool IsComputeU0Range(const reshade::api::descriptor_range& range) {
  return IsUavDescriptorType(range.type)
         && range.count != 0u
         && range.dx_register_index == 0u
         && range.dx_register_space == 0u
         && renodx::utils::bitwise::HasFlag(
             range.visibility,
             reshade::api::shader_stage::compute);
}

inline void OnBindDescriptorTables(
    reshade::api::command_list* cmd_list,
    reshade::api::shader_stage stages,
    reshade::api::pipeline_layout layout,
    std::uint32_t first,
    std::uint32_t count,
    const reshade::api::descriptor_table* tables) {
  if (!IsEnabled()
      || !renodx::utils::bitwise::HasFlag(stages, reshade::api::shader_stage::compute)) {
    return;
  }

  auto* command_data = GetCommandListData(cmd_list);
  if (command_data == nullptr) return;
  if (command_data->compute_layout != layout) {
    command_data->compute_layout = layout;
    command_data->compute_binding.reset();
  }
  if (layout.handle == 0u || count == 0u || tables == nullptr) return;

  bool touched_u0 = false;
  std::optional<ComputeBinding> binding;
  (void)renodx::utils::pipeline_layout::GetPipelineLayoutData(layout, [&](const auto* layout_data) {
    if (layout_data == nullptr) return;

    for (std::uint32_t i = 0u; i < count && !touched_u0; ++i) {
      const auto param_index = first + i;
      if (param_index >= layout_data->params.size()) continue;

      const auto inspect_ranges = [&](std::uint32_t range_count,
                                      const reshade::api::descriptor_range* ranges) {
        for (std::uint32_t range_index = 0u;
             ranges != nullptr && range_index < range_count;
             ++range_index) {
          const auto& range = ranges[range_index];
          if (!IsComputeU0Range(range)) continue;
          touched_u0 = true;

          const auto location = GetDescriptorLocation(
              cmd_list->get_device(),
              tables[i],
              range.binding);
          if (location.first != 0u) {
            binding = ComputeBinding{
                .type = ComputeBindingType::DESCRIPTOR_TABLE,
                .descriptor = location,
            };
          }
          return;
        }
      };

      const auto& param = layout_data->params[param_index];
      if (param.type == reshade::api::pipeline_layout_param_type::descriptor_table) {
        inspect_ranges(param.descriptor_table.count, param.descriptor_table.ranges);
      } else if (param.type
                 == reshade::api::pipeline_layout_param_type::descriptor_table_with_static_samplers) {
        inspect_ranges(
            param.descriptor_table_with_static_samplers.count,
            param.descriptor_table_with_static_samplers.ranges);
      }
    }
  });

  if (!touched_u0) return;
  command_data->compute_binding = std::move(binding);
}

inline std::optional<std::pair<std::uint32_t, std::uint32_t>> GetPushDescriptorSlot(
    reshade::api::pipeline_layout layout,
    std::uint32_t layout_param,
    const reshade::api::descriptor_table_update& update,
    std::uint32_t descriptor_index) {
  std::optional<std::pair<std::uint32_t, std::uint32_t>> first_slot;

  (void)renodx::utils::pipeline_layout::GetPipelineLayoutData(layout, [&](const auto* layout_data) {
    if (layout_data == nullptr || layout_param >= layout_data->params.size()) return;

    const auto use_range = [&](const reshade::api::descriptor_range& range) {
      if (range.count == 0u || update.binding < range.binding) return false;
      if (range.count != std::numeric_limits<std::uint32_t>::max()
          && update.binding >= range.binding + range.count) {
        return false;
      }
      first_slot = {
          range.dx_register_index + (update.binding - range.binding),
          range.dx_register_space,
      };
      return true;
    };

    const auto& param = layout_data->params[layout_param];
    if (param.type == reshade::api::pipeline_layout_param_type::push_descriptors) {
      (void)use_range(param.push_descriptors);
    } else if (param.type
               == reshade::api::pipeline_layout_param_type::push_descriptors_with_ranges) {
      for (std::uint32_t i = 0u; i < param.descriptor_table.count; ++i) {
        if (use_range(param.descriptor_table.ranges[i])) break;
      }
    } else if (param.type
               == reshade::api::pipeline_layout_param_type::push_descriptors_with_static_samplers) {
      for (std::uint32_t i = 0u;
           i < param.descriptor_table_with_static_samplers.count;
           ++i) {
        if (use_range(param.descriptor_table_with_static_samplers.ranges[i])) break;
      }
    }
  });
  if (!first_slot.has_value()) return std::nullopt;
  first_slot->first += descriptor_index;
  return first_slot;
}

inline void OnPushDescriptors(
    reshade::api::command_list* cmd_list,
    reshade::api::shader_stage stages,
    reshade::api::pipeline_layout layout,
    std::uint32_t layout_param,
    const reshade::api::descriptor_table_update& update) {
  if (!IsEnabled()
      || !renodx::utils::bitwise::HasFlag(stages, reshade::api::shader_stage::compute)
      || !IsUavDescriptorType(update.type)) {
    return;
  }
#ifdef DEBUG_LEVEL_1
  if (cmd_list != nullptr && IsD3D12(cmd_list->get_device())) {
    LogDescriptorEvent("push", 1u, update.count);
  }
#endif
  auto* command_data = GetCommandListData(cmd_list);
  if (command_data == nullptr) return;
  if (command_data->compute_layout != layout) {
    command_data->compute_layout = layout;
    command_data->compute_binding.reset();
  }

  if (update.count == 0u
      || GetPushDescriptorSlot(layout, layout_param, update, 0u) != std::pair{0u, 0u}) {
    return;
  }

  const auto* views = static_cast<const reshade::api::resource_view*>(update.descriptors);
  const auto resource = GetTargetResourceFromView(
      cmd_list->get_device(),
      views == nullptr ? reshade::api::resource_view{0u} : views[0]);
  if (resource.handle == 0u) {
    command_data->compute_binding.reset();
  } else {
    command_data->compute_binding = ComputeBinding{
        .type = ComputeBindingType::PUSH_DESCRIPTOR,
        .resource = resource,
    };
  }
}

inline bool OnDraw(
    reshade::api::command_list* cmd_list,
    std::uint32_t /*vertex_count*/,
    std::uint32_t /*instance_count*/,
    std::uint32_t /*first_vertex*/,
    std::uint32_t /*first_instance*/) {
  if (!IsEnabled()) return false;
  auto* data = GetCommandListData(cmd_list);
  if (data != nullptr) ProcessCurrentPixelShader(cmd_list, data->pixel_target);
  return false;
}

inline bool OnDrawIndexed(
    reshade::api::command_list* cmd_list,
    std::uint32_t /*index_count*/,
    std::uint32_t /*instance_count*/,
    std::uint32_t /*first_index*/,
    std::int32_t /*vertex_offset*/,
    std::uint32_t /*first_instance*/) {
  if (!IsEnabled()) return false;
  auto* data = GetCommandListData(cmd_list);
  if (data != nullptr) ProcessCurrentPixelShader(cmd_list, data->pixel_target);
  return false;
}

inline bool OnDispatch(
    reshade::api::command_list* cmd_list,
    std::uint32_t /*group_count_x*/,
    std::uint32_t /*group_count_y*/,
    std::uint32_t /*group_count_z*/) {
  if (!IsEnabled()) return false;
  ProcessCurrentComputeShader(cmd_list);
  return false;
}

inline void Use(DWORD fdw_reason) {
  renodx::utils::shader::use_shader_cache = true;
  renodx::utils::shader::Use(fdw_reason);
  renodx::utils::resource::Use(fdw_reason);
  renodx::utils::pipeline_layout::Use(fdw_reason);

  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      ClearInvestigatedShaders();
      renodx::utils::path::default_output_folder = "renodx";
      renodx::utils::shader::dump::default_dump_folder = ".";
      reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::register_event<reshade::addon_event::destroy_device>(OnDestroyDevice);
      reshade::register_event<reshade::addon_event::init_resource>(OnInitResource);
      reshade::register_event<reshade::addon_event::destroy_resource>(OnDestroyResource);
      reshade::register_event<reshade::addon_event::update_descriptor_tables>(OnUpdateDescriptorTables);
      reshade::register_event<reshade::addon_event::init_command_list>(OnInitCommandList);
      reshade::register_event<reshade::addon_event::reset_command_list>(OnResetCommandList);
      reshade::register_event<reshade::addon_event::destroy_command_list>(OnDestroyCommandList);
      reshade::register_event<reshade::addon_event::bind_render_targets_and_depth_stencil>(
          OnBindRenderTargetsAndDepthStencil);
      reshade::register_event<reshade::addon_event::begin_render_pass>(OnBeginRenderPass);
      reshade::register_event<reshade::addon_event::end_render_pass>(OnEndRenderPass);
      reshade::register_event<reshade::addon_event::bind_descriptor_tables>(OnBindDescriptorTables);

      // I doubt lutbuilders use Copy or push descriptors, but for completeness
      reshade::register_event<reshade::addon_event::copy_descriptor_tables>(OnCopyDescriptorTables);
      // reshade::register_event<reshade::addon_event::push_descriptors>(OnPushDescriptors);

      reshade::register_event<reshade::addon_event::draw>(OnDraw);
      // reshade::register_event<reshade::addon_event::draw_indexed>(OnDrawIndexed);
      reshade::register_event<reshade::addon_event::dispatch>(OnDispatch);
      reshade::log::message(
          reshade::log::level::info,
          "DX12 LUT builder candidate tracker initialized.");
      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::unregister_event<reshade::addon_event::destroy_device>(OnDestroyDevice);
      reshade::unregister_event<reshade::addon_event::init_resource>(OnInitResource);
      reshade::unregister_event<reshade::addon_event::destroy_resource>(OnDestroyResource);
      reshade::unregister_event<reshade::addon_event::update_descriptor_tables>(OnUpdateDescriptorTables);
      reshade::unregister_event<reshade::addon_event::init_command_list>(OnInitCommandList);
      reshade::unregister_event<reshade::addon_event::reset_command_list>(OnResetCommandList);
      reshade::unregister_event<reshade::addon_event::destroy_command_list>(OnDestroyCommandList);
      reshade::unregister_event<reshade::addon_event::bind_render_targets_and_depth_stencil>(
          OnBindRenderTargetsAndDepthStencil);
      reshade::unregister_event<reshade::addon_event::begin_render_pass>(OnBeginRenderPass);
      reshade::unregister_event<reshade::addon_event::end_render_pass>(OnEndRenderPass);
      reshade::unregister_event<reshade::addon_event::bind_descriptor_tables>(OnBindDescriptorTables);

      reshade::unregister_event<reshade::addon_event::copy_descriptor_tables>(OnCopyDescriptorTables);
      // reshade::unregister_event<reshade::addon_event::push_descriptors>(OnPushDescriptors);

      reshade::unregister_event<reshade::addon_event::draw>(OnDraw);
      reshade::unregister_event<reshade::addon_event::draw_indexed>(OnDrawIndexed);
      reshade::unregister_event<reshade::addon_event::dispatch>(OnDispatch);
      ClearInvestigatedShaders();
      is_shader_in_addon = nullptr;
      break;
  }
}

}  // namespace dump_lutbuilder