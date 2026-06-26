/*
 * Copyright (C) 2026 RenoDX Contributors
 * SPDX-License-Identifier: MIT
 */

#pragma once

#include <atomic>
#include <cstdint>
#include <mutex>
#include <vector>

#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "assets/lut/hdr_lut_rgba16f.h"

namespace fatalframe::hdr_lut {

namespace detail {

inline reshade::api::resource hdr_lut_resource = {0};
inline reshade::api::resource_view hdr_lut_srv = {0};
inline std::atomic<bool> hdr_lut_created{false};
inline reshade::api::device* hdr_lut_owner_device = nullptr;
inline reshade::api::device* pending_device = nullptr;

inline constexpr uint32_t LUT_WIDTH = 32u;
inline constexpr uint32_t LUT_HEIGHT = 32u;
inline constexpr uint32_t LUT_DEPTH = 32u;
inline constexpr uint32_t LUT_TEXEL_COUNT = LUT_WIDTH * LUT_HEIGHT * LUT_DEPTH;
inline constexpr uint32_t LUT_BYTES_PER_TEXEL = 8u;
inline constexpr uint32_t LUT_ROW_PITCH = LUT_WIDTH * LUT_BYTES_PER_TEXEL;
inline constexpr uint32_t LUT_SLICE_PITCH = LUT_ROW_PITCH * LUT_HEIGHT;
inline constexpr uint32_t LUT_BYTE_COUNT = LUT_TEXEL_COUNT * LUT_BYTES_PER_TEXEL;

inline void CreateHdrLutTexture(reshade::api::device* device) {
  if (hdr_lut_created.load()) return;

  static_assert(sizeof(__hdr_lut_rgba16f_base) == LUT_BYTE_COUNT,
                "Embedded HDR LUT data size mismatch");

  static thread_local std::vector<std::uint8_t> upload_bytes;
  upload_bytes.assign(
      __hdr_lut_rgba16f_base,
      __hdr_lut_rgba16f_base + LUT_BYTE_COUNT);

  reshade::api::subresource_data initial_data = {};
  initial_data.data = upload_bytes.data();
  initial_data.row_pitch = LUT_ROW_PITCH;
  initial_data.slice_pitch = LUT_SLICE_PITCH;

  const reshade::api::resource_desc texture_desc(
      reshade::api::resource_type::texture_3d,
      LUT_WIDTH,
      LUT_HEIGHT,
      static_cast<uint16_t>(LUT_DEPTH),
      1u,
      reshade::api::format::r16g16b16a16_float,
      1u,
      reshade::api::memory_heap::gpu_only,
      reshade::api::resource_usage::shader_resource);

  if (!device->create_resource(
          texture_desc,
          &initial_data,
          reshade::api::resource_usage::shader_resource,
          &hdr_lut_resource)) {
    reshade::log::message(reshade::log::level::error,
                          "fatalframeII: Failed to create embedded HDR LUT texture");
    return;
  }

  const reshade::api::resource_view_desc srv_desc(
      reshade::api::resource_view_type::texture_3d,
      reshade::api::format::r16g16b16a16_float,
      0u,
      1u,
      0u,
      1u);

  if (!device->create_resource_view(
          hdr_lut_resource,
          reshade::api::resource_usage::shader_resource,
          srv_desc,
          &hdr_lut_srv)) {
    reshade::log::message(reshade::log::level::error,
                          "fatalframeII: Failed to create SRV for embedded HDR LUT");
    device->destroy_resource(hdr_lut_resource);
    hdr_lut_resource = {0};
    return;
  }

  hdr_lut_created.store(true);
  hdr_lut_owner_device = device;
  reshade::log::message(reshade::log::level::info,
                        "fatalframeII: Embedded 32x32x32 RGBA16F HDR LUT bound to t2, space50");
}

inline void DestroyHdrLutTexture(reshade::api::device* device) {
  if (!hdr_lut_created.load()) return;
  if (hdr_lut_srv.handle != 0u) {
    device->destroy_resource_view(hdr_lut_srv);
    hdr_lut_srv = {0};
  }
  if (hdr_lut_resource.handle != 0u) {
    device->destroy_resource(hdr_lut_resource);
    hdr_lut_resource = {0};
  }
  hdr_lut_created.store(false);
  hdr_lut_owner_device = nullptr;
}

inline reshade::api::resource_view GetHdrLutShaderResourceView(reshade::api::command_list* cmd_list) {
  if (!hdr_lut_created.load()) {
    static std::mutex creation_mutex;
    std::lock_guard lock(creation_mutex);
    if (!hdr_lut_created.load()) {
      reshade::api::device* device = cmd_list != nullptr ? cmd_list->get_device() : pending_device;
      if (device != nullptr) {
        pending_device = device;
        CreateHdrLutTexture(device);
      }
    }
  }
  return hdr_lut_srv;
}

}  // namespace detail

inline void AddOutputShaderView(renodx::mods::shader::CustomShader& shader) {
  shader.views.push_back({
      .type = reshade::api::descriptor_type::texture_shader_resource_view,
      .slot = 2u,
      .space = 50u,
      .get_view = &detail::GetHdrLutShaderResourceView,
  });
}

inline void OnInitDevice(reshade::api::device* device) {
  detail::pending_device = device;
}

inline void OnDestroyDevice(reshade::api::device* device) {
  if (detail::hdr_lut_created.load() && device == detail::hdr_lut_owner_device) {
    detail::DestroyHdrLutTexture(device);
  }
  if (device == detail::pending_device) {
    detail::pending_device = nullptr;
  }
}

}  // namespace fatalframe::hdr_lut
