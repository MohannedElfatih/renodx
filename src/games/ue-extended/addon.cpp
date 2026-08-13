/*
 * Copyright (C) 2024 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64
#define DEBUG_LEVEL_0

#include <algorithm>

#include <deps/imgui/imgui.h>
#include <embed/shaders.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/date.hpp"
#include "../../utils/platform.hpp"
#include "../../utils/random.hpp"
#include "../../utils/settings.hpp"
#include "../../utils/shader.hpp"
#include "../../utils/swapchain.hpp"
#include "./dump_lutbuilder.hpp"
#include "./shared.h"

namespace {

std::unordered_set<std::uint32_t> drawn_shaders;

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

ShaderInjectData shader_injection;

float current_settings_mode = 0;

// start keybind code

struct ParsedKeybind {
  int vk = 0;
  bool ctrl = false;
  bool alt = false;
  bool shift = false;
};

static int KeyNameToVK(const std::string& name) {
  if (name.size() >= 2 && (name[0] == 'F' || name[0] == 'f') && isdigit(name[1])) {
    int fnum = atoi(name.c_str() + 1);
    if (fnum >= 1 && fnum <= 24) return VK_F1 + fnum - 1;
  }
  if (name.size() == 1 && isalpha(name[0])) return toupper(name[0]);
  if (name.size() == 1 && isdigit(name[0])) return name[0];
  if (_stricmp(name.c_str(), "Space") == 0)        return VK_SPACE;
  if (_stricmp(name.c_str(), "Tab") == 0)          return VK_TAB;
  if (_stricmp(name.c_str(), "Enter") == 0)        return VK_RETURN;
  if (_stricmp(name.c_str(), "Escape") == 0)       return VK_ESCAPE;
  if (_stricmp(name.c_str(), "Backspace") == 0)    return VK_BACK;
  if (_stricmp(name.c_str(), "Delete") == 0)       return VK_DELETE;
  if (_stricmp(name.c_str(), "Insert") == 0)       return VK_INSERT;
  if (_stricmp(name.c_str(), "Home") == 0)         return VK_HOME;
  if (_stricmp(name.c_str(), "End") == 0)          return VK_END;
  if (_stricmp(name.c_str(), "PageUp") == 0)       return VK_PRIOR;
  if (_stricmp(name.c_str(), "PageDown") == 0)     return VK_NEXT;
  if (_stricmp(name.c_str(), "Pause") == 0)        return VK_PAUSE;
  if (_stricmp(name.c_str(), "ScrollLock") == 0)   return VK_SCROLL;
  if (_stricmp(name.c_str(), "PrintScreen") == 0)  return VK_SNAPSHOT;
  if (_stricmp(name.c_str(), "LeftBracket") == 0)  return VK_OEM_4;
  if (_stricmp(name.c_str(), "RightBracket") == 0) return VK_OEM_6;
  if (_stricmp(name.c_str(), "Backslash") == 0)    return VK_OEM_5;
  if (_stricmp(name.c_str(), "Semicolon") == 0)    return VK_OEM_1;
  if (_stricmp(name.c_str(), "Apostrophe") == 0)   return VK_OEM_7;
  if (_stricmp(name.c_str(), "Comma") == 0)        return VK_OEM_COMMA;
  if (_stricmp(name.c_str(), "Period") == 0)       return VK_OEM_PERIOD;
  if (_stricmp(name.c_str(), "Slash") == 0)        return VK_OEM_2;
  if (_stricmp(name.c_str(), "GraveAccent") == 0)  return VK_OEM_3;
  if (_stricmp(name.c_str(), "Minus") == 0)        return VK_OEM_MINUS;
  if (_stricmp(name.c_str(), "Equal") == 0)        return VK_OEM_PLUS;
  if (_stricmp(name.c_str(), "UpArrow") == 0)      return VK_UP;
  if (_stricmp(name.c_str(), "DownArrow") == 0)    return VK_DOWN;
  if (_stricmp(name.c_str(), "LeftArrow") == 0)    return VK_LEFT;
  if (_stricmp(name.c_str(), "RightArrow") == 0)   return VK_RIGHT;
  if (_stricmp(name.c_str(), "NumLock") == 0)      return VK_NUMLOCK;
  if (_stricmp(name.c_str(), "CapsLock") == 0)     return VK_CAPITAL;
  if (_stricmp(name.c_str(), "Keypad0") == 0) return VK_NUMPAD0;
  if (_stricmp(name.c_str(), "Keypad1") == 0) return VK_NUMPAD1;
  if (_stricmp(name.c_str(), "Keypad2") == 0) return VK_NUMPAD2;
  if (_stricmp(name.c_str(), "Keypad3") == 0) return VK_NUMPAD3;
  if (_stricmp(name.c_str(), "Keypad4") == 0) return VK_NUMPAD4;
  if (_stricmp(name.c_str(), "Keypad5") == 0) return VK_NUMPAD5;
  if (_stricmp(name.c_str(), "Keypad6") == 0) return VK_NUMPAD6;
  if (_stricmp(name.c_str(), "Keypad7") == 0) return VK_NUMPAD7;
  if (_stricmp(name.c_str(), "Keypad8") == 0) return VK_NUMPAD8;
  if (_stricmp(name.c_str(), "Keypad9") == 0) return VK_NUMPAD9;
  if (name.size() >= 3 && name[0] == '0' && (name[1] == 'x' || name[1] == 'X'))
    return static_cast<int>(strtol(name.c_str(), nullptr, 16));
  return 0;
}

static ParsedKeybind ParseKeybind(const std::string& str) {
  ParsedKeybind kb;
  if (str.empty()) return kb;
  std::string s = str;
  auto consume = [&](const char* prefix) -> bool {
    size_t len = strlen(prefix);
    if (s.size() > len && _strnicmp(s.c_str(), prefix, len) == 0) {
      s = s.substr(len);
      return true;
    }
    return false;
  };
  while (true) {
    if (consume("Ctrl+"))  { kb.ctrl  = true; continue; }
    if (consume("Alt+"))   { kb.alt   = true; continue; }
    if (consume("Shift+")) { kb.shift = true; continue; }
    break;
  }
  kb.vk = KeyNameToVK(s);
  return kb;
}

static std::string ReadPresetKeybind(int preset_num) {
  const std::string section = renodx::utils::settings::global_name + "-preset" + std::to_string(preset_num);
  char buf[128] = "";
  size_t size = sizeof(buf);
  if (reshade::get_config_value(nullptr, section.c_str(), "PresetKeybind", buf, &size)) {
    return std::string(buf);
  }
  return "";
}

static void WritePresetKeybind(int preset_num, const std::string& value) {
  const std::string section = renodx::utils::settings::global_name + "-preset" + std::to_string(preset_num);
  reshade::set_config_value(nullptr, section.c_str(), "PresetKeybind", value.c_str());
}

static void SwitchPreset(int target_preset) {
  renodx::utils::settings::preset_index = target_preset;
  const std::string section = renodx::utils::settings::global_name + "-preset" + std::to_string(target_preset);
  renodx::utils::settings::LoadSettings(section);
  for (auto& cb : renodx::utils::settings::on_preset_changed_callbacks) cb();
}

static bool s_capturing[4] = {false, false, false, false};
static bool s_prev_pressed[4] = {false, false, false, false};

// end keybind code

// bool is_hdr_path = (shader_injection.processing_path == 0.f);

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "SettingsMode",
        .binding = &current_settings_mode,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .can_reset = false,
        .label = "Settings Mode",
        .labels = {"Simple", "Intermediate", "Advanced"},
        .is_global = true,
    },

    new renodx::utils::settings::Setting{
        .key = "ToneMapType",
        .binding = &shader_injection.tone_map_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .can_reset = false,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        // .labels = {"UE ACES (HDR)", "None", "ACES", "UE Filmic Extended (HDR)", "UE Filmic (SDR)"},
        .labels = {"UE Vanilla (SDR)", "UE Filmic Extended (HDR)"},
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ToneMapPeakNits",
        .binding = &shader_injection.peak_white_nits,
        .default_value = 1000.f,
        .can_reset = false,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of peak white in nits",
        .min = 48.f,
        .max = 4000.f,
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f; },
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
        .key = "UIVisibility",
        .binding = &shader_injection.custom_hide_ui,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "UI Visibility",
        .section = "Tone Mapping",
        .tooltip = "Sets the visibility of UI and HUD elements.\n"
                   "Only works with native HDR games.",
        .labels = {"Hide", "Show"},
        .is_enabled = []() { return shader_injection.processing_path == 0.f; },
        .is_visible = []() { return current_settings_mode >= 1.f && shader_injection.processing_path == 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapGammaCorrection",
        .binding = &shader_injection.gamma_correction,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "SDR EOTF Emulation",
        .section = "Tone Mapping",
        .tooltip = "Emulates a 2.2 EOTF",
        .labels = {"Off", "2.2"},
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapGammaCorrectionWorkingSpace",
        .binding = &shader_injection.gamma_correction_working_space,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "SDR EOTF Scaling",
        .section = "Tone Mapping",
        .tooltip = "Display Emulation: Matches the behavior of the display in SDR\n"
                   "Match Tone Map Scaling: Performs the correction in the working space of the selected tone map scaling. May have a preferrable look.",
        .labels = {"Display Emulation", "Match Tone Map Scaling"},
        .is_enabled = []() { return shader_injection.gamma_correction != 0.f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "BlendFactor",
        .binding = &shader_injection.blend_factor,
        .default_value = 50.f,
        .label = "Blend Factor",
        .section = "Tone Mapping",
        .tooltip = "Controls average scene brightness.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    // new renodx::utils::settings::Setting{
    //     .key = "ToneMapHueCorrectionType",
    //     .binding = &shader_injection.tone_map_hue_correction_type,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .label = "Hue Correction Type",
    //     .section = "Tone Mapping & Color Grading",
    //     .tooltip = "Selects how to apply hue correction.",
    //     .labels = {"Highlights, Midtones, & Shadows", "Midtones & Shadows"},
    //     .is_enabled = []() { return shader_injection.tone_map_type == 1.f; },
    // },

    // new renodx::utils::settings::Setting{
    //     .key = "ToneMapHueCorrection",
    //     .binding = &shader_injection.tone_map_hue_correction,
    //     .default_value = 100.f,
    //     .label = "Hue Correction",
    //     .section = "Tone Mapping & Color Grading",
    //     .tooltip = "Hue retention strength.",
    //     .max = 100.f,
    //     .is_enabled = []() { return shader_injection.tone_map_type == 1.f; },
    //     .parse = [](float value) { return value * 0.01f; },
    // },

    new renodx::utils::settings::Setting{
        .key = "ToneMapScaling",
        .binding = &shader_injection.tone_map_scaling,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Tonemap Scaling",
        .section = "Tone Mapping",
        .tooltip = "Max Channel: Hand-tuned to match the original tonemapper's behavior.\n"
                   "AP1: Applies grading and display mapping per channel in AP1.\n"
                   "LMS: Applies grading, filmic extension, and display mapping per channel in normalized LMS.",
        .labels = {"Max Channel", "AP1", "LMS"},
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ToneMapHueRestore",
        .binding = &shader_injection.tone_map_hue_restore,
        .default_value = 50.f,
        .label = "Hue Restore",
        .section = "Tone Mapping",
        .tooltip = "Controls LMS hue restoration for the extended and blended vanilla tonemaps.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f && shader_injection.tone_map_scaling == 2.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ForceBlueCorrect",
        .binding = &shader_injection.force_blue_correct,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Force Blue Correct",
        .section = "Tone Mapping",
        .tooltip = "Force Blue Correct when using AP1 Tonemap Scaling.",
        .labels = {"Off", "On"},
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f && shader_injection.tone_map_scaling == 1.f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ToneMapPerChPeak",
        .binding = &shader_injection.tone_map_per_ch_peak,
        .default_value = 5.f,
        .label = "Per Channel Peak",
        .section = "Scene Grading",
        .tooltip = "Used to control hue/chroma input peak.",
        .min = 1.f,
        .max = 11.f,
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f && shader_injection.tone_map_scaling == 0.f; },
        .parse = [](float value) { return value * 1.f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ToneMapHueShift",
        .binding = &shader_injection.tone_map_hue_shift,
        .default_value = 100.f,
        .label = "Hue Shift",
        .section = "Scene Grading",
        .tooltip = "Hue-shift emulation strength.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f && shader_injection.tone_map_scaling == 0.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeChromaCorrectBlowout",
        .binding = &shader_injection.tone_map_chroma_correct_blowout,
        .default_value = 100.f,
        .label = "Blowout",
        .section = "Scene Grading",
        .tooltip = "Emulates blowout from per channel tonemapping.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0 && shader_injection.tone_map_scaling == 0.f; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    // new renodx::utils::settings::Setting{
    //     .key = "ToneMapHueBlowoutWorkingSpace",
    //     .binding = &shader_injection.tone_map_hue_blowout_working_space,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 0.f,
    //     .label = "Hue/Blowout Working Space",
    //     .section = "Scene Grading",
    //     .tooltip = "Selects the perceptual working space used by the Max Channel hue-shift and blowout controls.",
    //     .labels = {"OKLab", "ICtCp"},
    //     .is_enabled = []() { return shader_injection.tone_map_type == 1.f && shader_injection.tone_map_scaling == 0.f; },
    //     .is_visible = []() { return current_settings_mode >= 1.f; },
    // },

    new renodx::utils::settings::Setting{
        .key = "OverrideBlackClip",
        .binding = &shader_injection.override_black_clip,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "Override Black Clip",
        .section = "Scene Grading",
        .tooltip = "Disables black clip in the tonemapper. Prevents crushing when the black clip parameter is used",
        .is_enabled = []() { return shader_injection.tone_map_type == 1.f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeExposure",
        .binding = &shader_injection.tone_map_exposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Custom Color Grading",
        .max = 2.f,
        .format = "%.2f",
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlights",
        .binding = &shader_injection.tone_map_highlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Custom Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeShadows",
        .binding = &shader_injection.tone_map_shadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Custom Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapContrastMethod",
        .binding = &shader_injection.tone_map_contrast_method,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Contrast Method",
        .section = "Custom Color Grading",
        .tooltip = "Adaptation: Uses an anchored adaptation response.\n"
                   "Power: Uses an anchored power curve.",
        .labels = {"Adaptation", "Power"},
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeContrast",
        .binding = &shader_injection.tone_map_contrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Custom Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeSaturation",
        .binding = &shader_injection.tone_map_saturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Custom Color Grading",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.tone_map_highlight_saturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Custom Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeBlowout",
        .binding = &shader_injection.tone_map_blowout,
        .default_value = 0.f,
        .label = "Dechroma",
        .section = "Custom Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeFlare",
        .binding = &shader_injection.tone_map_flare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Custom Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    new renodx::utils::settings::Setting{
        .key = "ColorGradeLUTStrength",
        .binding = &shader_injection.custom_lut_strength,
        .default_value = 100.f,
        .label = "LUT Strength",
        .section = "Color Grading LUTs",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeLUTScaling",
        .binding = &shader_injection.custom_lut_scaling,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Color Grading LUTs",
        .tooltip = "Scales the color grade LUT to full range when size is clamped.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value * 0.01f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeLUTScalingMethod",
        .binding = &shader_injection.custom_lut_scaling_method,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "LUT Scaling Mode",
        .section = "Color Grading LUTs",
        .tooltip = "Perceptual: Always scales the LUT to true black, and attempts to remap the LUT color back onto the image. This is how LUT Scaling worked originally.\n"
                   "Simple: Scales the LUT to the lowest point possible while maintaining the original look of the LUT.",
        .labels = {"Perceptual", "Simple"},
        .is_enabled = []() { return shader_injection.tone_map_type != 0 && shader_injection.custom_lut_scaling != 0.f; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeLUTGamutRestoration",
        .binding = &shader_injection.custom_lut_gamut_restoration,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "LUT Gamut Restoration",
        .section = "Color Grading LUTs",
        .tooltip = "Restores wide gamut colors clipped by the LUT",
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    // new renodx::utils::settings::Setting{
    //     .key = "ColorGradeLUTGamutCompressionDebug",
    //     .binding = &shader_injection.custom_lut_gamut_compression_method,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 1.f,
    //     .label = "LUT Gamut Compression Debug",
    //     .section = "Color Grading LUTs",
    //     .tooltip = "Compares the legacy gamma-domain LUT gamut compression against the adaptive-D65 replacement.",
    //     .labels = {"Legacy Gamma", "Adaptive D65"},
    //     .is_enabled = []() { return shader_injection.tone_map_type != 0 && shader_injection.custom_lut_gamut_restoration != 0.f; },
    //     .is_visible = []() { return current_settings_mode >= 2.f; },
    // },
    // new renodx::utils::settings::Setting{
    //     .key = "FixPostProcess",
    //     .binding = &shader_injection.fix_post_process,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 2.f,
    //     .label = "Fix Post Process",
    //     .section = "Color Grading",
    //     .tooltip = "Changes the color space post processing shaders are run in",
    //     .labels = {"Off (BT.2020 PQ)", "BT.709 sRGB Piecewise (most accurate)", "BT.2020 sRGB Piecewise (retains WCG)"},
    //     .is_enabled = []() { return shader_injection.tone_map_type != 0; },
    // },
    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::TEXT,
    //     .label = std::string("\nSliders in this section do not work with FSR Frame Generation enabled.\n\n"),
    //     .section = "Effects",
    // },

    new renodx::utils::settings::Setting{
        .key = "FxGrainType",
        .binding = &shader_injection.custom_grain_type,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Grain Type",
        .section = "Effects",
        .tooltip = "Replaces vanilla film grain with perceptual",
        .labels = {"Vanilla", "Perceptual"},
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f && shader_injection.processing_path == 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxGrainStrength",
        .binding = &shader_injection.custom_grain_strength,
        .default_value = 50.f,
        .label = "Film Grain",
        .section = "Effects",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.tone_map_type != 0 && shader_injection.custom_grain_type != 0; },
        .parse = [](float value) { return value * 0.02f; },
        .is_visible = []() { return current_settings_mode >= 1.f && shader_injection.processing_path == 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "FxSharpening",
        .binding = &shader_injection.custom_sharpness,
        .default_value = 0.f,
        .label = "Lilium RCAS Sharpening",
        .section = "Effects",
        .tooltip = "Adds RCAS, as implemented by Lilium for HDR.",
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .parse = [](float value) { return value == 0 ? 0.f : exp2(-(1.f - (value * 0.01f))); },
        .is_visible = []() { return current_settings_mode >= 1.f && shader_injection.processing_path == 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "TonemapUnderUI",
        .binding = &shader_injection.tm_under_ui,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "Tonemap Under UI",
        .section = "Other",
        .tooltip = "Helps blend UI elements when the scene is bright.",
        .labels = {"Off", "On"},
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f && shader_injection.processing_path == 0.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "UIGammaCorrection",
        .binding = &shader_injection.gamma_correction_ui,
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 1.f,
        .label = "UI SDR EOTF Emulation",
        .section = "Other",
        .tooltip = "Emulates a 2.2 EOTF for the UI",
        .labels = {"Off", "2.2"},
        .is_enabled = []() { return shader_injection.tone_map_type != 0; },
        .is_visible = []() { return current_settings_mode >= 1.f && shader_injection.processing_path == 0.f; },
    },

    // new renodx::utils::settings::Setting{
    //     .value_type = renodx::utils::settings::SettingValueType::BUTTON,
    //     .label = "Match SDR",
    //     .section = "Options",
    //     .group = "button-line-1",
    //     .on_change = []() {
    //       renodx::utils::settings::ResetSettings();
    //       renodx::utils::settings::UpdateSettings({
    //           {"ToneMapGammaCorrection", 1.f},
    //           {"ToneMapHueCorrection", 0.f},
    //           {"OverrideBlackClip", 0.f},
    //           {"ColorGradeLUTScaling", 0.f},
    //           {"ColorGradeLUTGamutRestoration", 0.f},
    //       });
    //     },
    // },

    // new renodx::utils::settings::Setting{
    //     .key = "ColorGradeColorSpace",
    //     .binding = &shader_injection.color_grade_color_space,
    //     .value_type = renodx::utils::settings::SettingValueType::INTEGER,
    //     .default_value = 0.f,
    //     .label = "Color Space",
    //     .section = "Custom Color Grading",
    //     .tooltip = "Selects output color space"
    //                "\nUS Modern for BT.709 D65."
    //                "\nJPN Modern for BT.709 D93."
    //                "\nUS CRT for BT.601 (NTSC-U)."
    //                "\nJPN CRT for BT.601 ARIB-TR-B9 D93 (NTSC-J)."
    //                "\nDefault: US CRT",
    //     .labels = {
    //         "US Modern",
    //         "JPN Modern",
    //         "US CRT",
    //         "JPN CRT",
    //     },
    //     .is_visible = []() { return settings[0]->GetValue() >= 1; },
    // },

};

const std::unordered_map<std::string, reshade::api::format> UPGRADE_TARGETS = {
    {"R8G8B8A8_TYPELESS", reshade::api::format::r8g8b8a8_typeless},
    {"B8G8R8A8_TYPELESS", reshade::api::format::b8g8r8a8_typeless},
    {"R8G8B8A8_UNORM", reshade::api::format::r8g8b8a8_unorm},
    {"B8G8R8A8_UNORM", reshade::api::format::b8g8r8a8_unorm},
    {"R8G8B8A8_SNORM", reshade::api::format::r8g8b8a8_snorm},
    {"R8G8B8A8_UNORM_SRGB", reshade::api::format::r8g8b8a8_unorm_srgb},
    {"B8G8R8A8_UNORM_SRGB", reshade::api::format::b8g8r8a8_unorm_srgb},
    {"R10G10B10A2_TYPELESS", reshade::api::format::r10g10b10a2_typeless},
    {"R10G10B10A2_UNORM", reshade::api::format::r10g10b10a2_unorm},
    {"B10G10R10A2_UNORM", reshade::api::format::b10g10r10a2_unorm},
    {"R11G11B10_FLOAT", reshade::api::format::r11g11b10_float},
    {"R16G16B16A16_TYPELESS", reshade::api::format::r16g16b16a16_typeless},
};

renodx::utils::settings::Settings info_settings = {

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Safe Grade",
        .section = "Options",
        .group = "button-line-1",
        .tooltip = "Safe grade that is closer to the game's SDR look. \r\n This is only meant to be used if something feels off with default settings.",
        .on_change = []() {
          renodx::utils::settings::ResetSettings();
          renodx::utils::settings::UpdateSettings({
              {"ToneMapScaling", 0.f},
              {"ToneMapPerChPeak", 5.f},
              {"ToneMapHueShift", 100.f},
              {"ColorGradeChromaCorrectBlowout", 100.f},
          }); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset Grading",
        .section = "Options",
        .group = "button-line-1",
        .tooltip = "Reset settings only related to tonemap settings and color grading to their default values.",
        .on_change = []() { renodx::utils::settings::ResetSettings(); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Reset All",
        .section = "Options",
        .group = "button-line-1",
        .tooltip = "Reset ALL settings to default values, including advanced settings.",
        .on_change = []() {
          for (auto* setting : settings) {
            if (setting->key.empty()) continue;
            if (!setting->can_reset) continue;
            renodx::utils::settings::UpdateSetting(setting->key, setting->default_value);
          } },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },

    // start keybind code
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::CUSTOM,
        .label = "Preset Keys",
        .section = "Options",
        .on_draw = []() -> bool {
          const float spacing = ImGui::GetStyle().ItemSpacing.x;
          for (int P = 1; P <= 3; P++) {
            if (P > 1) ImGui::SameLine(0, spacing * 2.f);
            ImGui::PushID(P);

            // "P#N:" label
            char plabel[8];
            snprintf(plabel, sizeof(plabel), "#%d:", P);
            ImGui::TextUnformatted(plabel);
            ImGui::SameLine(0, spacing);

            if (s_capturing[P]) {
              ImGui::TextColored(ImVec4(1, 1, 0.3f, 1), "...");
              if (ImGui::IsKeyPressed(ImGuiKey_Escape, false)) s_capturing[P] = false;
              for (int k = ImGuiKey_NamedKey_BEGIN; k < ImGuiKey_NamedKey_END; k++) {
                ImGuiKey key = static_cast<ImGuiKey>(k);
                if (key == ImGuiKey_Escape) continue;
                if (key == ImGuiKey_LeftCtrl || key == ImGuiKey_RightCtrl) continue;
                if (key == ImGuiKey_LeftShift || key == ImGuiKey_RightShift) continue;
                if (key == ImGuiKey_LeftAlt || key == ImGuiKey_RightAlt) continue;
                if (key == ImGuiKey_LeftSuper || key == ImGuiKey_RightSuper) continue;
                if (key >= ImGuiKey_MouseLeft && key <= ImGuiKey_MouseWheelY) continue;
                const char* kn = ImGui::GetKeyName(key);
                if (kn && kn[0] == 'M' && kn[1] == 'o' && kn[2] == 'd') continue;
                if (ImGui::IsKeyPressed(key, false)) {
                  std::string name;
                  if (ImGui::IsKeyDown(ImGuiMod_Ctrl))  name += "Ctrl+";
                  if (ImGui::IsKeyDown(ImGuiMod_Alt))   name += "Alt+";
                  if (ImGui::IsKeyDown(ImGuiMod_Shift)) name += "Shift+";
                  name += ImGui::GetKeyName(key);
                  WritePresetKeybind(P, name);
                  s_capturing[P] = false;
                  break;
                }
              }
            } else {
              std::string cur = ReadPresetKeybind(P);
              const char* btn_label = cur.empty() ? "Bind" : cur.c_str();
              if (ImGui::Button(btn_label)) s_capturing[P] = true;
              if (!cur.empty()) {
                if (!cur.empty()) ImGui::SetItemTooltip("Click to rebind. Current: %s", cur.c_str());
                ImGui::SameLine(0, 2.f);
                if (ImGui::Button("x")) WritePresetKeybind(P, "");
              }
            }
            ImGui::PopID();
          }
          return false;
        },
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },

    // end keybind code

    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Discord",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0x5865F2,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://discord.gg/", "F6AUTeWJHM"); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "More Mods",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0x2B3137,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx/wiki/Mods"); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "Links",
        .group = "button-line-2",
        .tint = 0x2B3137,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://github.com/clshortfuse/renodx"); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "ShortFuse's Ko-Fi",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0xFF5A16,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://ko-fi.com/shortfuse"); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Jon's Ko-Fi",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0xFF5A16,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://ko-fi.com/kickfister"); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Musa's Ko-Fi",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0xFF5A16,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://ko-fi.com/musaqh"); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Ritsu's Ko-Fi",
        .section = "Links",
        .group = "button-line-3",
        .tint = 0xFF5A16,
        .on_change = []() { renodx::utils::platform::LaunchURL("https://ko-fi.com/ritsucecil"); },
        .is_visible = []() { return current_settings_mode >= 0.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Marat - UE Extended Maintainer\n"
                 "ShortFuse - RenoDX Creator\n"
                 "Jon, Musa, and Ritsu - Contributors",
        .section = "About",
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = std::string("Build: ") + renodx::utils::date::ISO_DATE_TIME,
        .section = "About",
        .is_visible = []() { return current_settings_mode >= 1.f; },
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSettings({
      {"ToneMapType", 0.f},
      {"ToneMapPeakNits", 203.f},
      {"ToneMapGameNits", 203.f},
      {"ToneMapUINits", 203.f},
      {"ToneMapGammaCorrection", 0.f},
      {"UIGammaCorrection", 0.f},
      {"ToneMapHueCorrectionType", 0.f},
      {"ToneMapHueCorrection", 0.f},
      {"OverrideBlackClip", 0.f},
      {"ColorGradeExposure", 1.f},
      {"ColorGradeHighlights", 50.f},
      {"ColorGradeShadows", 50.f},
      {"ColorGradeContrast", 50.f},
      {"ColorGradeSaturation", 50.f},
      {"ColorGradeHighlightSaturation", 50.f},
      {"ColorGradeBlowout", 0.f},
      {"ColorGradeFlare", 0.f},
      {"ColorGradeLUTStrength", 100.f},
      {"ColorGradeLUTScaling", 0.f},
      {"ColorGradeLUTGamutRestoration", 0.f},
      {"FxGrainType", 0.f},
      {"FxGrainStrength", 50.f},
  });
}

bool fired_on_init_swapchain = false;

// start keybind code
void OnOverlay(reshade::api::effect_runtime* /*runtime*/) {
  if (s_capturing[1] || s_capturing[2] || s_capturing[3]) return;

  for (int P = 1; P <= 3; P++) {
    std::string bind = ReadPresetKeybind(P);
    if (bind.empty()) continue;
    ParsedKeybind kb = ParseKeybind(bind);
    if (kb.vk == 0) continue;

    bool key_down = (GetAsyncKeyState(kb.vk) & 0x8000) != 0;
    bool ctrl_held  = (GetAsyncKeyState(VK_LCONTROL) & 0x8000) || (GetAsyncKeyState(VK_RCONTROL) & 0x8000);
    bool alt_held   = (GetAsyncKeyState(VK_LMENU) & 0x8000)    || (GetAsyncKeyState(VK_RMENU) & 0x8000);
    bool shift_held = (GetAsyncKeyState(VK_LSHIFT) & 0x8000)   || (GetAsyncKeyState(VK_RSHIFT) & 0x8000);

    bool mods_ok = true;
    if (kb.ctrl  && !ctrl_held)  mods_ok = false;
    if (kb.alt   && !alt_held)   mods_ok = false;
    if (kb.shift && !shift_held) mods_ok = false;
    if (!kb.ctrl  && ctrl_held)  mods_ok = false;
    if (!kb.alt   && alt_held)   mods_ok = false;
    if (!kb.shift && shift_held) mods_ok = false;

    bool pressed = key_down && mods_ok;
    if (pressed && !s_prev_pressed[P]) SwitchPreset(P);
    s_prev_pressed[P] = pressed;
  }
}
// end keybind code

void OnInitSwapchain(reshade::api::swapchain* swapchain, bool resize) {
  if (fired_on_init_swapchain) return;
  auto peak = renodx::utils::swapchain::GetPeakNits(swapchain);
  if (peak.has_value()) {
    settings[2]->default_value = peak.value();
    settings[2]->can_reset = true;
    fired_on_init_swapchain = true;
  }
}

// Per game resource upgrades, where we need custom paramaters -- the sliders (output size/ratio/all) don't work
void AddExpedition33Upgrades() {
  // Portrait letterboxes screens
  renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      .old_format = reshade::api::format::r10g10b10a2_unorm,
      .new_format = reshade::api::format::r16g16b16a16_float,
      .use_resource_view_cloning = true,
      .aspect_ratio = 2880.f / 2160.f,
  });

  renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      .old_format = reshade::api::format::r10g10b10a2_unorm,
      .new_format = reshade::api::format::r16g16b16a16_float,
      .use_resource_view_cloning = true,
      .aspect_ratio = 3840.f / 1608.f,
  });
  // DLAA support
  renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      .old_format = reshade::api::format::r10g10b10a2_unorm,
      .new_format = reshade::api::format::r16g16b16a16_float,
      .use_resource_view_cloning = true,
      .aspect_ratio = 3044.f / 1712.f,
  });
}

void AddWuchangUpgrades() {
  renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      .old_format = reshade::api::format::r10g10b10a2_unorm,
      .new_format = reshade::api::format::r16g16b16a16_float,
      .use_resource_view_cloning = true,
      .usage_include = reshade::api::resource_usage::render_target | reshade::api::resource_usage::copy_dest,
  });

  renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      .old_format = reshade::api::format::r10g10b10a2_unorm,
      .new_format = reshade::api::format::r16g16b16a16_float,
      .use_resource_view_cloning = true,
      .aspect_ratio = 2560.f / 1024.f,
  });
}

void AddSonicRacingCrossWorldsUpgrades() {
  renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      .old_format = reshade::api::format::r10g10b10a2_unorm,
      .new_format = reshade::api::format::r16g16b16a16_float,
      .use_resource_view_cloning = true,
      .aspect_ratio = 16.f / 9.f,
  });
}

void AddMixtapeUpgrades() {
  renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
      .old_format = reshade::api::format::r10g10b10a2_unorm,
      .new_format = reshade::api::format::r16g16b16a16_float,
      .use_resource_view_cloning = true,
      .aspect_ratio = 1920.f / 803.f,
      .aspect_ratio_tolerance = 0.1f,
  });
}

void AddGamePatches() {
  auto process_path = renodx::utils::platform::GetCurrentProcessPath();
  auto filename = process_path.filename().string();
  auto product_name = renodx::utils::platform::GetProductName(process_path);

  if (product_name == "Expedition 33") {
    AddExpedition33Upgrades();
  } else if (product_name == "Project_Plague") {
    AddWuchangUpgrades();
  } else if (product_name == "SonicRacingCrossWorlds") {
    AddSonicRacingCrossWorldsUpgrades();
  } else if (product_name == "Mixtape") {
    AddMixtapeUpgrades();
  } else {
    return;
  }
  reshade::log::message(reshade::log::level::info, std::format("Applied patches for {} ({}).", filename, product_name).c_str());
}

const auto UPGRADE_TYPE_NONE = 0.f;
const auto UPGRADE_TYPE_OUTPUT_SIZE = 1.f;
const auto UPGRADE_TYPE_OUTPUT_RATIO = 2.f;
const auto UPGRADE_TYPE_ANY = 3.f;

// Defaults and additional settings use filename or whatever, so we use the same struct for both
struct GameSettings {
  using DefaultSettings = std::unordered_map<std::string, float>;

  DefaultSettings default_settings;
  renodx::utils::settings::Settings additional_settings;

  GameSettings(
    std::initializer_list<DefaultSettings::value_type> defaults,
    renodx::utils::settings::Settings additional = {})
    : default_settings(defaults), additional_settings(additional) {}
};

const std::unordered_map<std::string, GameSettings> GAME_SETTINGS = {
        {
            "Psychonauts2-WinGDK-Shipping.exe",
      GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"ForceBorderless", 0.f},
            },
        },
        {
            "CRISIS CORE -FINAL FANTASY VII- REUNION",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "P3R.exe",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "RainCodePlus-Win64-Shipping.exe",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_RATIO},
            },
        },
        {
            "Wuthering Waves",
          GameSettings{
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Expedition 33",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_B8G8R8A8_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "InfinityNikki",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },

        {
            "Stellar Blade",
          GameSettings{
                {"Upgrade_CopyDestinations", 1.f},
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Stellar Blade (Demo)",
          GameSettings{
                {"Upgrade_CopyDestinations", 1.f},
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Like a Dragon: Ishin!",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },

        {
            "Pal",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },

        {
            "Banishers: Ghosts of New Eden",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Borderlands3.exe",
          GameSettings{
                {"Upgrade_CopyDestinations", 1.f},
                {"Upgrade_R8G8B8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_RATIO},
                {"Upgrade_R11G11B10_FLOAT", UPGRADE_TYPE_OUTPUT_RATIO},
            },
        },
        {
            "SonicRacingCrossWorlds",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_RATIO},
            },
        },
        {
            "EM-Win64-Shipping.exe",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Mixtape",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Ace7Game.exe",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Proxy_Revert_State", 1.f},
            },
        },
        {
            "Ruiner Game",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Upgrade_R11G11B10_FLOAT", UPGRADE_TYPE_OUTPUT_SIZE},
                {"ToneMapGammaCorrection", 0.f},
            },
        },
        {
            "Tony Hawks(TM) Pro Skater(TM) 3 + 4",
          GameSettings{
                {"Proxy_Revert_State", 1.f},
            },
        },
        {
            "Astro-Win64-Shipping.exe",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Proxy_Revert_State", 1.f},
            },
        },
        {
            "The Adventures of Elliot_The Millennium Tales",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_RATIO},
            },
        },
        {
            "Rebuilder-Win64-Shipping.exe",  // Product name "UE4"
          GameSettings{
                {"Proxy_Revert_State", 1.f},
            },
        },
        {
            "SILAS",  // Sprawl Zero
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Marvel Rivals",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "PenguinHotel-Win64-Shipping.exe",  // Meccha Chameleon, product name "LINK"
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Delta",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_ANY},
                {"Proxy_Revert_State", 1.f},
            },
        },
        {
            "Hatred-Win64-Shipping.exe",  // Product name "Unreal Engine"
          GameSettings{
                {"Proxy_Revert_State", 1.f},
            },
        },
        {
            "Forgive Me Father",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
                {"Proxy_Revert_State", 1.f},
            },
        },
        {
            "BLACKTAIL",
          GameSettings{
                {"Upgrade_B8G8R8A8_TYPELESS", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Denshattack",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        {
            "Frostpunk2-Win64-Shipping.exe",
          GameSettings{
                {"Upgrade_R10G10B10A2_UNORM", UPGRADE_TYPE_OUTPUT_SIZE},
            },
        },
        // Native HDR on games (Path off)
        {
            "Hell is Us",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Mafia: The Old Country",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Returnal",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Marvel's Midnight Suns",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "MK12.exe",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Alone in the Dark",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Avowed",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Lost Soul Aside",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Lies of P",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Still Wakes The Deep",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "NINJAGAIDEN2BLACK-Win64-Shipping.exe",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Project_Plague",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Life is Strange: Reunion",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Life Is Strange: Double Exposure",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "MGSDelta-Win64-Shipping.exe",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "SILENT HILL f",
          GameSettings{
                {"Set_Path", 0.f},
                {"ForceBorderless", 0.f},
                {"PreventFullscreen", 0.f},
            },
        },
        {
            "Hellblade2",
          GameSettings{
                {"Set_Path", 0.f},
                {"ToneMapGammaCorrection", 0.f},
            },
        },
        {
            "Ghostwire: Tokyo",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "S.T.A.L.K.E.R. 2",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "NTE",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "CodeVein2",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Until Dawn",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "LEGOBatmanLotDK",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Borderlands4.exe",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Gothic 1 Remake",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "FarFarWest-Win64-Shipping.exe",  // Product name "UnrealGame"
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Mistfall Hunter",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "LegoHorizonAdventures-Win64-Shipping.exe",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "BeastOfReincarnation",
          GameSettings{
                {"Set_Path", 0.f},
            },
        },
        {
            "Polaris-Win64-Shipping.exe",
            GameSettings{
                {
                  {"Set_Path", 0.f},
                },
                {
                    new renodx::utils::settings::Setting{
                        .key = "HeroLightsStrength",
                        .binding = &shader_injection.custom_slider_1,
                        .default_value = 50.f,
                        .label = "Hero Lights Strength",
                        .section = "Tekken 8", // To specify it's only for Tekken 8
                        .tooltip = "Controls the intensity of hero lights.",
                        .max = 100.f,
                        .parse = [](float value) { return value * 0.01f; },
                    },
                },
            },
        },
};

auto FindGameSettings(const std::filesystem::path& process_path) {
  auto game_settings = GAME_SETTINGS.find(process_path.filename().string());
  if (game_settings == GAME_SETTINGS.end()) {
    game_settings = GAME_SETTINGS.find(renodx::utils::platform::GetProductName(process_path));
  }
  return game_settings;
}

void AddGameSettings() {
  const auto game_settings = FindGameSettings(renodx::utils::platform::GetCurrentProcessPath());
  if (game_settings == GAME_SETTINGS.end() || game_settings->second.additional_settings.empty()) return;

  // We want to add game settings just beneath Tone Mapping section
  const auto tone_mapping_end = std::find_if(settings.rbegin(), settings.rend(), [](const auto* setting) {
    return setting->section == "Tone Mapping";
  });
  settings.insert(
      tone_mapping_end.base(),
      game_settings->second.additional_settings.begin(),
      game_settings->second.additional_settings.end());
}

float g_upgrade_copy_destinations = 0.f;
float g_proxy_revert_state;
float g_path;

void AddAdvancedSettings() {
  auto process_path = renodx::utils::platform::GetCurrentProcessPath();
  auto filename = process_path.filename().string();
  auto product_name = renodx::utils::platform::GetProductName(process_path);
  auto game_settings = FindGameSettings(process_path);

  {
    std::stringstream s;
    if (game_settings == GAME_SETTINGS.end() || game_settings->second.default_settings.empty()) {
      s << "No default settings for ";
    } else {
      s << "Marked default values for ";
    }
    s << filename;
    s << " (" << product_name << ")";
    reshade::log::message(reshade::log::level::info, s.str().c_str());
  }

  auto add_setting = [&](auto* setting) {
    if (game_settings != GAME_SETTINGS.end()) {
      const auto& values = game_settings->second.default_settings;
      if (auto values_pair = values.find(setting->key);
          values_pair != values.end()) {
        setting->default_value = static_cast<float>(values_pair->second);
        std::stringstream s;
        s << "Default value for ";
        s << setting->key;
        s << ": ";
        s << setting->default_value;
        reshade::log::message(reshade::log::level::info, s.str().c_str());
      }
    }
    renodx::utils::settings::LoadSetting(renodx::utils::settings::global_name, setting);
    settings.push_back(setting);
  };

  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "DumpLUTShaders",
        .value_type = renodx::utils::settings::SettingValueType::BOOLEAN,
        .default_value = 0.f,
        .label = "Dump LUT Shaders",
        .section = "Resource Upgrades",
        .tooltip = "Traces and dumps LUT shaders.",
        .labels = {"Off", "On"},
        .on_change_value = [](float /*previous*/, float current) {
          dump_lutbuilder::SetEnabled(current != 0.f);
        },
        .is_global = true,
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(setting);
    dump_lutbuilder::SetEnabled(setting->GetValue() != 0.f);
  }
  
  // HDR // SDR path
  // 0 HDR // 1 SDR
  {
    auto* path = new renodx::utils::settings::Setting{
        .key = "Set_Path",
        .binding = &shader_injection.processing_path,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Upgrade Path",
        .section = "Resource Upgrades",
        .tooltip = "Use the game's Native HDR (Off), or Upgrade the game to SDR (On)",
        .labels = {
            "Off",
            "On",
        },
        .is_global = true,
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(path);

    g_path = path->GetValue();
  }

  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "Upgrade_CopyDestinations",
        .binding = &g_upgrade_copy_destinations,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Upgrade Copy Destinations",
        .section = "Resource Upgrades",
        .tooltip = "Includes upgrading texture copy destinations.",
        .labels = {
            "Off",
            "On",
        },
        .is_global = true,
        //.is_visible = []() { return current_settings_mode >= 2.f && shader_injection.processing_path == 1.f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(setting);

    g_upgrade_copy_destinations = setting->GetValue();
  }

  {
    auto* revert_state = new renodx::utils::settings::Setting{
        .key = "Proxy_Revert_State",
        .binding = &g_proxy_revert_state,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Proxy Revert State",
        .section = "Resource Upgrades",
        .tooltip = "If the game's UI has blocky artifacts, turn this on and restart the game.",
        .labels = {
            "Off",
            "On",
        },
        .is_global = true,
        //.is_visible = []() { return current_settings_mode >= 2.f && shader_injection.processing_path == 1.f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(revert_state);

    g_proxy_revert_state = revert_state->GetValue();

    if (g_proxy_revert_state != 0.f) {
      renodx::mods::swapchain::swapchain_proxy_revert_state = true;
    }
  }

  for (const auto& [key, format] : UPGRADE_TARGETS) {
    auto* new_setting = new renodx::utils::settings::Setting{
        .key = "Upgrade_" + key,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = key,
        .section = "Resource Upgrades",
        .labels = {
            "Off",
            "Output size",
            "Output ratio",
            "Any size",
        },
        .is_global = true,
        //.is_visible = []() { return current_settings_mode >= 2.f && shader_injection.processing_path == 1.f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(new_setting);

    auto value = new_setting->GetValue();
    if (value > 0) {
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = format,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .ignore_size = (value == UPGRADE_TYPE_ANY),
          .use_resource_view_cloning = true,
          .aspect_ratio = static_cast<float>((value == UPGRADE_TYPE_OUTPUT_RATIO)
                                                 ? renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER
                                                 : renodx::mods::swapchain::SwapChainUpgradeTarget::ANY),
          .usage_include = reshade::api::resource_usage::render_target
                           | (g_upgrade_copy_destinations == 0.f
                                  ? reshade::api::resource_usage::undefined
                                  : reshade::api::resource_usage::copy_dest),
      });
      std::stringstream s;
      s << "Applying user resource upgrade for ";
      s << format << ": " << value;
      reshade::log::message(reshade::log::level::info, s.str().c_str());
    }
  }

  {
    auto* swapchain_setting = new renodx::utils::settings::Setting{
        .key = "Upgrade_SwapChainCompatibility",
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Swap Chain Compatibility Mode",
        .section = "Resource Upgrades",
        .tooltip = "Enhances support for third-party addons to read the swap chain.",
        .labels = {
            "Off",
            "On",
        },
        .is_global = true,
        //.is_visible = []() { return current_settings_mode >= 2.f && shader_injection.processing_path == 1.f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(swapchain_setting);
    renodx::mods::swapchain::swapchain_proxy_compatibility_mode = swapchain_setting->GetValue() != 0;
  }

  {
    auto* scrgb_setting = new renodx::utils::settings::Setting{
        .key = "Upgrade_UseSCRGB",
        .binding = &shader_injection.processing_use_scrgb,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Swap Chain Format",
        .section = "Resource Upgrades",
        .tooltip = "Selects use of HDR10 or scRGB swapchain.",
        .labels = {
            "HDR10",
            "scRGB",
        },
        .is_global = true,
        //.is_visible = []() { return current_settings_mode >= 2.f && shader_injection.processing_path == 1.f; },
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(scrgb_setting);

    shader_injection.processing_use_scrgb = scrgb_setting->GetValue();
    renodx::mods::swapchain::SetUseHDR10(scrgb_setting->GetValue() == 0);
  }

  {
    auto* force_borderless_setting = new renodx::utils::settings::Setting{
        .key = "ForceBorderless",
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Force Borderless",
        .section = "Resource Upgrades",
        .tooltip = "Forces fullscreen to be borderless for proper HDR",
        .labels = {
            "Disabled",
            "Enabled",
        },
        .is_global = true,
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(force_borderless_setting);

    if (force_borderless_setting->GetValue() == 0) {
      renodx::mods::swapchain::force_borderless = false;
    }
  }

  {
    auto* setting = new renodx::utils::settings::Setting{
        .key = "PreventFullscreen",
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Prevent Fullscreen",
        .section = "Resource Upgrades",
        .tooltip = "Prevent exclusive fullscreen for proper HDR",
        .labels = {
            "Disabled",
            "Enabled",
        },
        .on_change_value = [](float previous, float current) { renodx::mods::swapchain::prevent_full_screen = (current == 1.f); },
        .is_global = true,
        .is_visible = []() { return current_settings_mode >= 2.f; },
    };
    add_setting(setting);

    renodx::mods::swapchain::prevent_full_screen = (setting->GetValue() == 1.f);
  }

  settings.push_back({new renodx::utils::settings::Setting{
      .value_type = renodx::utils::settings::SettingValueType::TEXT,
      .label = "The application must be restarted for upgrades to take effect.",
      .section = "Resource Upgrades",
      .is_visible = []() { return current_settings_mode >= 2.f; },
  }});
}

bool initialized = false;

bool IsCustomShader(std::uint32_t shader_hash) {
  return custom_shaders.contains(shader_hash);
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Unreal Engine";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      reshade::register_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      // start keybind code
      reshade::register_event<reshade::addon_event::reshade_overlay>(OnOverlay);
      // end keybind code

      renodx::mods::shader::on_create_pipeline_layout = [](auto, auto params) {
        return (params.size() < 20);
      };

      if (!initialized) {
        AddGameSettings();
        AddAdvancedSettings();

        for (auto* new_setting : info_settings) {
          settings.push_back(new_setting);
        }

        renodx::mods::shader::expected_constant_buffer_index = 13;
        renodx::mods::shader::expected_constant_buffer_space = 50;
        renodx::mods::shader::allow_multiple_push_constants = true;
        renodx::mods::shader::force_pipeline_cloning = true;

        renodx::mods::swapchain::expected_constant_buffer_index = 13;
        renodx::mods::swapchain::expected_constant_buffer_space = 50;

        renodx::mods::swapchain::use_resource_cloning = true;
        renodx::mods::swapchain::swap_chain_proxy_shaders = {
            {
                reshade::api::device_api::d3d11,
                {
                    .vertex_shader = __swap_chain_proxy_vertex_shader_dx11,
                    .pixel_shader = __swap_chain_proxy_pixel_shader_dx11,
                },
            },
            {
                reshade::api::device_api::d3d12,
                {
                    .vertex_shader = __swap_chain_proxy_vertex_shader_dx12,
                    .pixel_shader = __swap_chain_proxy_pixel_shader_dx12,
                },
            },
        };

        renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
            .old_format = reshade::api::format::r10g10b10a2_unorm,
            .new_format = reshade::api::format::r16g16b16a16_float,
            .dimensions = {.width = 32, .height = 32, .depth = 32},
            .resource_tag = dump_lutbuilder::RESOURCE_TAG,
        });

        AddGamePatches();

        initialized = true;
      }
      renodx::utils::random::binds.push_back(&shader_injection.custom_random);  // film grain

      break;
    case DLL_PROCESS_DETACH:
      renodx::utils::shader::Use(fdw_reason);
      renodx::utils::swapchain::Use(fdw_reason);
      renodx::utils::resource::Use(fdw_reason);
      reshade::unregister_event<reshade::addon_event::init_swapchain>(OnInitSwapchain);
      // start keybind code
      reshade::unregister_event<reshade::addon_event::reshade_overlay>(OnOverlay);
      // end keybind code
      reshade::unregister_addon(h_module);
      break;
  }

  dump_lutbuilder::SetShaderInAddonCallback(&IsCustomShader);
  dump_lutbuilder::Use(fdw_reason);
  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);

  // start last preset code
  if (fdw_reason == DLL_PROCESS_ATTACH) {
    int last_preset = 1;
    reshade::get_config_value(nullptr, renodx::utils::settings::global_name.c_str(), "SelectedProfile", last_preset);
    if (last_preset >= 1 && last_preset <= 3 && last_preset != 1) {
      renodx::utils::settings::preset_index = last_preset;
      renodx::utils::settings::LoadSettings(
          renodx::utils::settings::global_name + "-preset" + std::to_string(last_preset));
    }
    renodx::utils::settings::on_preset_changed_callbacks.emplace_back([]() {
      reshade::set_config_value(nullptr, renodx::utils::settings::global_name.c_str(),
                                "SelectedProfile", renodx::utils::settings::preset_index);
    });
  }
  // end last preset code
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);
  //
  if (g_path != 0.f) {
    renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  }
  renodx::utils::random::Use(fdw_reason);  // film grain

  if (fdw_reason == DLL_PROCESS_DETACH) {
    reshade::unregister_addon(h_module);
  }

  return TRUE;
}
