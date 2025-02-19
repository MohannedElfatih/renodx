#include "../shared.h"

static const float DEFAULT_BRIGHTNESS = 0.f;  // 50%
static const float DEFAULT_CONTRAST = 1.f;    // 50%
static const float DEFAULT_GAMMA = 1.f;

struct OutputSignature {
  float4 SV_Target : SV_Target0;
  float SV_Target_1 : SV_Target1;
};

float3 applyUserToneMap(float3 untonemapped) {
  renodx::tonemap::Config tm_config = renodx::tonemap::config::Create();

  float vanillaMidGray = 0.18f;  // ACES mid gray is 10%

  // RENOCES
  float renoDRTHighlights = 0.925f;
  float renoDRTShadows = 1.f;
  float renoDRTContrast = 1.485f;
  float renoDRTSaturation = 1.225f;
  float renoDRTDechroma = 0.8f;
  float renoDRTFlare = 0.0205f;

  float3 incorrect_hue_ap1 = renodx::color::ap1::from::BT709(untonemapped * 0.1f / 0.18f);
  float3 correct_hue = renodx::color::bt709::from::AP1(
      renodx::tonemap::ExponentialRollOff(incorrect_hue_ap1, vanillaMidGray, 2.f));

  tm_config.hue_correction_type = renodx::tonemap::renodrt::config::hue_correction_type::CUSTOM;
  tm_config.hue_correction_color = correct_hue;
  tm_config.hue_correction_strength = RENODX_TONE_MAP_HUE_SHIFT;

  tm_config.reno_drt_tone_map_method = renodx::tonemap::renodrt::config::tone_map_method::DANIELE;
  tm_config.reno_drt_per_channel = RENODX_TONE_MAP_PER_CHANNEL != 0;
  tm_config.type = RENODX_TONE_MAP_TYPE;
  tm_config.peak_nits = RENODX_PEAK_WHITE_NITS;
  tm_config.game_nits = RENODX_DIFFUSE_WHITE_NITS;
  tm_config.gamma_correction = 0;
  tm_config.exposure = RENODX_TONE_MAP_EXPOSURE;
  tm_config.highlights = RENODX_TONE_MAP_HIGHLIGHTS;
  tm_config.shadows = RENODX_TONE_MAP_SHADOWS;
  tm_config.contrast = RENODX_TONE_MAP_CONTRAST;
  tm_config.saturation = RENODX_TONE_MAP_SATURATION;
  tm_config.reno_drt_highlights = renoDRTHighlights;
  tm_config.reno_drt_shadows = renoDRTShadows;
  tm_config.reno_drt_contrast = renoDRTContrast;
  tm_config.reno_drt_saturation = renoDRTSaturation;
  tm_config.reno_drt_dechroma = RENODX_TONE_MAP_BLOWOUT;
  tm_config.reno_drt_blowout = -1.f * (RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f);
  tm_config.mid_gray_value = vanillaMidGray;
  tm_config.mid_gray_nits = vanillaMidGray * 100.f;
  tm_config.reno_drt_flare = 0.10f * pow(RENODX_TONE_MAP_FLARE, 10.f);

  float3 tonemapped = renodx::tonemap::config::Apply(untonemapped, tm_config);

  return tonemapped;
}

OutputSignature FinalizeLutTonemap(float3 color) {
  OutputSignature output;
  color *= 1.05f;
  output.SV_Target_1 = dot(color.rgb, float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));

  color = renodx::draw::RenderIntermediatePass(color);

  output.SV_Target = float4(color.rgb, 0.f);
  return output;
}

OutputSignature LutToneMap(float3 untonemapped, float3 lutInput, Texture3D<float4> lut, SamplerState colorGradingLUTSampler) {
  lutInput = renodx::color::srgb::DecodeSafe(lutInput); // unneeded but cleaner code
  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.tetrahedral = true;
  lut_config.type_input = renodx::lut::config::type::SRGB;
  lut_config.type_output = renodx::lut::config::type::SRGB;
  lut_config.scaling = 0.f;
  lut_config.lut_sampler = colorGradingLUTSampler;

  float3 final = renodx::lut::Sample(
      lutInput,
      lut_config,
      lut);

  if (RENODX_TONE_MAP_TYPE > 0.f) {
    final = renodx::draw::ToneMapPass(untonemapped.rgb, final);
  }

  return FinalizeLutTonemap(final);
}
