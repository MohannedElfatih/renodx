/*
 * Copyright (C) 2024 Musa Haji
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0
#define DEBUG_SLIDERS_OFF
#define RENODX_MODS_SWAPCHAIN_VERSION 2

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>
#include <embed/shaders.h>
#include "../../mods/shader.hpp"
#include "../../utils/constants.hpp"
#include "../../utils/date.hpp"
#include "../../utils/resource_upgrade.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/random.hpp"
#include "./shared.h"

namespace {


renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

ShaderInjectData shader_injection;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 48.f,
        .max = 4000.f,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapGameNits",
        .binding = &shader_injection.diffuse_white_nits,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits",
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapUINits",
        .binding = &shader_injection.graphics_white_nits,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the brightness of UI and HUD elements in nits",
        .min = 48.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapGammaCorrection",
        .binding = &shader_injection.gamma_correction,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "SDR EOTF Emulation",
        .section = "Tone Mapping",
        .tooltip = "Overrides in-game contrast slider, emulates a 2.2 EOTF",
        .labels = {"Off", "2.2"},
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHueShift",
        .binding = &shader_injection.tone_map_hue_shift,
        .default_value = 0.f,
        .label = "Hue Shift",
        .section = "Tone Mapping",
        .tooltip = "Hue-shift emulation strength",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return false; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Purity Blowout",
        .section = "Tone Mapping",
        .tooltip = "Chrominance blowout emulation strength",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return false; },
    },
    new renodx::utils::settings::Setting{
        .key = "HueCorrection",
        .binding = &shader_injection.hue_correction,
        .default_value = 30.f,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tooltip = "Hue and purity correction strength via MacLeod-Boynton",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return false; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 2.f,
        .format = "%.2f",
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeDechroma",
        .binding = &shader_injection.tone_map_dechroma,
        .default_value = 0.f,
        .label = "Dechroma",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return false; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeScene",
        .binding = &shader_injection.color_grade_strength,
        .default_value = 100.f,
        .label = "Scene Grading",
        .section = "Color Grading",
        .tooltip = "Scene grading as applied by the game",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "CustomCurve",
        .binding = &shader_injection.custom_curve,
        .default_value = 50.f,
        .label = "Custom Curve",
        .section = "Color Grading",
        .tooltip = "Applies a contrast curve to compensate for skipped ACES tonemapping",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return false; },
    },
    new renodx::utils::settings::Setting({
            .key = "FxBloom",
            .binding = &shader_injection.custom_bloom,
            .default_value = 50.f,
            .label = "Bloom Strength",
            .section = "Effects",
            .parse = [](float value) { return value * 0.02f; },
        }),
    new renodx::utils::settings::Setting({
            .key = "FxGrainStrength",
            .binding = &shader_injection.custom_grain_strength,
            .default_value = 0.f,
            .label = "Perceptual Grain Strength",
            .section = "Effects",
            .parse = [](float value) { return value * 0.01f; },
        }),
    new renodx::utils::settings::Setting({
            .key = "RenderingMultiScatter",
            .binding = &shader_injection.rendering_multi_scatter,
            .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .label = "Multi-Scatter GGX",
            .section = "Rendering",
            .tooltip = "Adds Kulla-Conty energy compensation to specular GGX. Recovers lost energy on rough metals.",
            .labels = {"Off", "On"},
            .is_visible = []() { return false; },
        }),
    new renodx::utils::settings::Setting({
            .key = "RenderingCubemapMod",
            .binding = &shader_injection.rendering_cubemap_mod,
            .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .label = "IBL Modulation",
            .section = "Rendering",
            .tooltip = "Gates IBL reflections by sky irradiance luminance. Dims reflections in dark/shadowed environments.",
            .labels = {"Off", "On"},
        }),
    new renodx::utils::settings::Setting({
            .key = "RenderingAODirect",
            .binding = &shader_injection.rendering_ao_direct,
            .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .label = "AO on Direct Lights",
            .section = "Rendering",
            .tooltip = "Applies ambient occlusion to local light contributions, reducing light leak.",
            .labels = {"Off", "On"},
        }),
    new renodx::utils::settings::Setting({
            .key = "RenderingShadowImprovements",
            .binding = &shader_injection.rendering_shadow_improvements,
            .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .label = "Shadow Improvements",
            .section = "Rendering",
            .tooltip = "Applies CSM shadow data to ambient/indirect lighting in areas where the engine skips it (e.g. Grymforge).",
            .labels = {"Off", "On"},
        }),
    new renodx::utils::settings::Setting({
            .key = "RenderingMicroShadows",
            .binding = &shader_injection.rendering_micro_shadows,
            .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .label = "Micro Detail Shadows",
            .section = "Rendering",
            .tooltip = "Adds fine micro-detail shadows via depth-bias ray marching (Bend Studio technique). Enhances contact shadows from subtle geometry.",
            .labels = {"Off", "On"},
        }),
    new renodx::utils::settings::Setting({
            .key = "RenderingMicroShadowsDebug",
            .binding = &shader_injection.rendering_micro_shadows_debug,
            .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
            .default_value = 0.f,
            .label = "Micro Shadows Debug View",
            .section = "Rendering",
            .labels = {"Off", "On"},
            //.is_visible = []() { return false; },
        }),
    new renodx::utils::settings::Setting({
            .key = "CSMDebug",
            .binding = &shader_injection.csm_debug,
            .value_type = renodx::utils::settings::SettingValueType::INTEGER,
            .default_value = 0.f,
            .label = "CSM Debug View",
            .section = "Rendering",
            .tooltip = "0=Off, 1=Cascade, 2=SkipPCSS, 3=StableNrm, 4=Both, 5=JitterViz",
            .max = 5.f,
        }),
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Options",
        .group = "button-line-1",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          }
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "RenoDX Discord",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://discord.gg/", "Ce9bQHQrSV");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "HDR Den Discord",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0x5865F2,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://discord.gg/", "5WZXDpmbpP");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "More Mods",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0x2B3137,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx/wiki/Mods");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0x2B3137,
        .on_change = []() {
          renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx");
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Musa's Ko-Fi",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0xFF5A16,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://ko-fi.com/musaqh"); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "ShortFuse's Ko-Fi",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0xFF5A16,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://ko-fi.com/shortfuse"); },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "- Addon maintained by Musa & Forge.",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = std::string("- The off preset is an approximation of the game's vanilla HDR with Peak 1000, Brightness 100, Contrast 1.00"),
        .section = "About",
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapPeakNits", 1000.f},
      {"ToneMapGameNits", 225.f},
      {"ToneMapUINits", 300.f},
      {"ToneMapGammaCorrection", 0},
      {"ColorGradeExposure", 0.85f},
      {"ColorGradeHighlights", 49.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeDechroma", 0.f},
      {"ColorGradeFlare", 0.f},
      {"ColorGradeScene", 100.f},
      {"ColorGradeHueShift", 0.f},
      {"ColorGradeBlowout", 0.f},
      {"CustomCurve", 50.f},
      {"HueCorrection", 0.f},
      {"FxGrainStrength", 0.f},
      {"RenderingMultiScatter", 0.f},
      {"RenderingCubemapMod", 0.f},
      {"RenderingAODirect", 0.f},
      {"RenderingShadowImprovements", 0.f},
      {"RenderingMicroShadows", 0.f},
      {"RenderingMicroShadowsDebug", 0.f},
      {"CSMDebug", 0.f},
  });
}

bool initialized = false;

void OnInitDevice(reshade::api::device* device) {
  const auto target_format = reshade::api::format::r16g16b16a16_float;
  const auto view_upgrades = renodx::utils::resource::VIEW_UPGRADES_RGBA16F;

  const renodx::utils::resource::ResourceUpgradeInfo::Dimensions portrait_dim = {
      .width = 1400,
      .height = 1380,
      .depth = renodx::utils::resource::ResourceUpgradeInfo::ANY,
  };
  const renodx::utils::resource::ResourceUpgradeInfo::Dimensions portrait_dim2 = {
      .width = 828,
      .height = 1080,
      .depth = renodx::utils::resource::ResourceUpgradeInfo::ANY,
  };
  const renodx::utils::resource::ResourceUpgradeInfo::Dimensions portrait_dim3 = {
      .width = 645,
      .height = 913,
      .depth = renodx::utils::resource::ResourceUpgradeInfo::ANY,
  };
  const renodx::utils::resource::ResourceUpgradeInfo::Dimensions backbuffer_dim = {
      .width = renodx::utils::resource::ResourceUpgradeInfo::BACK_BUFFER,
      .height = renodx::utils::resource::ResourceUpgradeInfo::BACK_BUFFER,
      .depth = renodx::utils::resource::ResourceUpgradeInfo::ANY,
  };

  std::vector<renodx::utils::resource::ResourceUpgradeInfo> upgrade_infos = {
      // Fullscreen r8g8b8a8 UI RTs — back buffer resolution exact match
      {
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = backbuffer_dim,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r8g8b8a8_unorm,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = backbuffer_dim,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      // UI character portrait RT — 1400x1380 
      {
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r8g8b8a8_unorm,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r10g10b10a2_typeless,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r10g10b10a2_unorm,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      // UI character portrait RT — 828x1080
      {
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim2,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r8g8b8a8_unorm,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim2,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r10g10b10a2_typeless,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim2,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r10g10b10a2_unorm,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim2,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      // UI character portrait RT — 645x913
      {
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim3,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r8g8b8a8_unorm,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim3,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r10g10b10a2_typeless,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim3,
          .usage_include = reshade::api::resource_usage::render_target,
      },
      {
          .old_format = reshade::api::format::r10g10b10a2_unorm,
          .new_format = target_format,
          .view_upgrades = view_upgrades,
          .dimensions = portrait_dim3,
          .usage_include = reshade::api::resource_usage::render_target,
      },
  };

  renodx::utils::resource::upgrade::SetUpgradeInfos(device, upgrade_infos);
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Baldur's Gate 3 Vulkan";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      renodx::mods::shader::allow_multiple_push_constants = true;
      // renodx::mods::shader::expand_existing_constant_buffer = true;
      renodx::mods::shader::minimum_constant_buffer_stages = reshade::api::shader_stage::pixel | reshade::api::shader_stage::compute;

      renodx::utils::resource::upgrade::Use(fdw_reason);
      reshade::register_event<reshade::addon_event::init_device>(OnInitDevice);

      break;
    case DLL_PROCESS_DETACH:
      renodx::utils::resource::upgrade::Use(fdw_reason);
      reshade::unregister_event<reshade::addon_event::init_device>(OnInitDevice);
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::constants::Use(fdw_reason);
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  renodx::utils::random::binds.push_back(&shader_injection.custom_random);
  renodx::utils::random::Use(fdw_reason);

  return TRUE;
}