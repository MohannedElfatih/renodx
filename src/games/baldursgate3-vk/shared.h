#ifndef SRC_BALDURSGATE3_VK_SHARED_H
#define SRC_BALDURSGATE3_VK_SHARED_H

#define RENODX_TONE_MAP_TYPE 2.f

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float gamma_correction;
  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_highlight_saturation;
  float tone_map_dechroma;
  float tone_map_flare;
  float color_grade_strength;
  float tone_map_hue_shift;
  float tone_map_blowout;
  float custom_curve;
  float hue_correction;
  float custom_random;
  float custom_grain_strength;
  float custom_bloom;
  float rendering_multi_scatter;
  float rendering_cubemap_mod;
  float rendering_ao_direct;
  float rendering_shadow_improvements;
  float rendering_micro_shadows;
  float rendering_micro_shadows_debug;
  float csm_debug;
};

#ifndef __cplusplus
#ifdef __SLANG__
#ifdef USE_OUTPUT_PUSHCONSTANTS
#define PUSH_CONSTANTS_OFFSET 48
#endif

// Fallback
#ifndef PUSH_CONSTANTS_OFFSET
#define PUSH_CONSTANTS_OFFSET 0
#endif

struct PushData {
  [[vk::offset(PUSH_CONSTANTS_OFFSET)]]
  ShaderInjectData shader_injection;
};

[[vk::push_constant]]
PushData gPush;

#define shader_injection gPush.shader_injection
#else
#if ((__SHADER_TARGET_MAJOR == 5 && __SHADER_TARGET_MINOR >= 1) || __SHADER_TARGET_MAJOR >= 6)
cbuffer shader_injection : register(b13, space50) {
#elif (__SHADER_TARGET_MAJOR < 5) || ((__SHADER_TARGET_MAJOR == 5) && (__SHADER_TARGET_MINOR < 1))
cbuffer shader_injection : register(b13) {
#endif
  ShaderInjectData shader_injection : packoffset(c0);
}
#endif

#define RENODX_PEAK_WHITE_NITS               shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS            shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS           shader_injection.graphics_white_nits
#define RENODX_GAMMA_CORRECTION              shader_injection.gamma_correction
#define RENODX_TONE_MAP_EXPOSURE             shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS           shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS              shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST             shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION           shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_DECHROMA             shader_injection.tone_map_dechroma
#define RENODX_TONE_MAP_FLARE                shader_injection.tone_map_flare
#define RENODX_COLOR_GRADE_STRENGTH          shader_injection.color_grade_strength
#define RENODX_TONE_MAP_HUE_SHIFT            shader_injection.tone_map_hue_shift
#define RENODX_TONE_MAP_BLOWOUT              shader_injection.tone_map_blowout
#define RENODX_CUSTOM_CURVE                  shader_injection.custom_curve
#define RENODX_HUE_CORRECTION                shader_injection.hue_correction
#define RENODX_CUSTOM_RANDOM                 shader_injection.custom_random
#define RENODX_CUSTOM_GRAIN_STRENGTH         shader_injection.custom_grain_strength
#define RENODX_CUSTOM_BLOOM                  shader_injection.custom_bloom
#define RENODX_RENDERING_MULTI_SCATTER       shader_injection.rendering_multi_scatter
#define RENODX_RENDERING_CUBEMAP_MOD         shader_injection.rendering_cubemap_mod
#define RENODX_RENDERING_AO_DIRECT           shader_injection.rendering_ao_direct
#define RENODX_RENDERING_SHADOW_IMPROVEMENTS shader_injection.rendering_shadow_improvements
#define RENODX_RENDERING_MICRO_SHADOWS           shader_injection.rendering_micro_shadows
#define RENODX_RENDERING_MICRO_SHADOWS_DEBUG    shader_injection.rendering_micro_shadows_debug

#include "../../shaders/renodx.hlsl"

#endif

#endif  // SRC_BALDURSGATE3_VK_SHARED_H
