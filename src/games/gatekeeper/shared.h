#ifndef SRC_GATEKEEPER_SHARED_H_
#define SRC_GATEKEEPER_SHARED_H_

#define RENODX_TONE_MAP_TYPE                 shader_injection.tone_map_type
#define RENODX_PEAK_WHITE_NITS               shader_injection.peak_white_nits
#define RENODX_DIFFUSE_WHITE_NITS            shader_injection.diffuse_white_nits
#define RENODX_GRAPHICS_WHITE_NITS           shader_injection.graphics_white_nits
#define RENODX_TONE_MAP_EXPOSURE             shader_injection.tone_map_exposure
#define RENODX_TONE_MAP_HIGHLIGHTS           shader_injection.tone_map_highlights
#define RENODX_TONE_MAP_SHADOWS              shader_injection.tone_map_shadows
#define RENODX_TONE_MAP_CONTRAST             shader_injection.tone_map_contrast
#define RENODX_TONE_MAP_SATURATION           shader_injection.tone_map_saturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION shader_injection.tone_map_highlight_saturation
#define RENODX_TONE_MAP_BLOWOUT              shader_injection.tone_map_blowout
#define RENODX_TONE_MAP_FLARE                shader_injection.tone_map_flare
#define RENODX_EFFECT_BLOOM                  shader_injection.fxBloom
#define RENODX_RENO_DRT_TONE_MAP_METHOD      renodx::tonemap::renodrt::config::tone_map_method::REINHARD
#define RENODX_TONE_MAP_PASS_AUTOCORRECTION  1.f
#define RENODX_GAMMA_CORRECTION              GAMMA_CORRECTION_NONE
#define RENODX_INTERMEDIATE_ENCODING         GAMMA_CORRECTION_NONE
#define RENODX_SWAP_CHAIN_GAMMA_CORRECTION   GAMMA_CORRECTION_GAMMA_2_2
// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float peak_white_nits;
  float diffuse_white_nits;
  float graphics_white_nits;
  float tone_map_type;
  float tone_map_exposure;
  float tone_map_highlights;
  float tone_map_shadows;
  float tone_map_contrast;
  float tone_map_saturation;
  float tone_map_highlight_saturation;
  float tone_map_blowout;

  float tone_map_flare;
  float fxBloom;
  float padding03;
  float padding04;
};

#ifndef __cplusplus
cbuffer cb13 : register(b13) {
  ShaderInjectData shader_injection : packoffset(c0);
}

#include "../../shaders/renodx.hlsl"
#endif

#endif  // SRC_GATEKEEPER_SHARED_H_