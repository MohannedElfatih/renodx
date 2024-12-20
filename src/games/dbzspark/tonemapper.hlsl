#include "./DICE.hlsl"
#include "./shared.h"

static const float DEFAULT_PQ_DECODE = 100.f;  // 50%
static const float DEFAULT_BRIGHTNESS = 0.f;   // 50%
static const float DEFAULT_CONTRAST = 1.f;     // 50%
static const float DEFAULT_GAMMA = 1.f;        // 50%
static const uint OUTPUT_OVERRIDE = 4u;        // TONEMAPPER_OUTPUT_ACES2000nitST2084

renodx::tonemap::Config getCommonConfig() {
  renodx::tonemap::Config config = renodx::tonemap::config::Create();
  config.type = injectedData.toneMapType;
  config.peak_nits = injectedData.toneMapPeakNits;
  config.game_nits = injectedData.toneMapGameNits;
  config.gamma_correction = 1.f;

  config.reno_drt_highlights = 1.0f;
  config.reno_drt_shadows = 1.0f;
  config.reno_drt_contrast = 1.1f;
  config.reno_drt_saturation = 1.1f;
  config.reno_drt_dechroma = 0;
  config.reno_drt_blowout = injectedData.colorGradeBlowout;
  config.reno_drt_flare = 0.05f;
  config.reno_drt_per_channel = true;
  config.reno_drt_hue_correction_method =
      renodx::tonemap::renodrt::config::hue_correction_method::DARKTABLE_UCS;
  config.hue_correction_type =
      renodx::tonemap::config::hue_correction_type::CUSTOM;
  config.hue_correction_strength = 1.f;

  return config;
}

/// Applies a customized version of RenoDRT tonemapper that tonemaps down to 1.0.
/// This function is used to compress HDR color to SDR range for use alongside `UpgradeToneMap`.
///
/// @param lutInputColor The color input that needs to be tonemapped.
/// @return The tonemapped color compressed to the SDR range, ensuring that it can be applied to SDR color grading with `UpgradeToneMap`.
float3 renoDRTSmoothClamp(float3 untonemapped, bool sdr = true) {
  renodx::tonemap::renodrt::Config renodrt_config = renodx::tonemap::renodrt::config::Create();
  renodrt_config.nits_peak = sdr ? 100.f : injectedData.toneMapPeakNits;
  renodrt_config.mid_gray_value = 0.18f;
  renodrt_config.mid_gray_nits = 18.f;
  renodrt_config.exposure = 1.f;
  renodrt_config.highlights = 1.f;
  renodrt_config.shadows = 1.f;
  renodrt_config.contrast = 1.05f;
  renodrt_config.saturation = 1.05f;
  renodrt_config.dechroma = 0.f;
  renodrt_config.flare = 0.f;
  renodrt_config.hue_correction_strength = 0.f;
  renodrt_config.tone_map_method =
      renodx::tonemap::renodrt::config::tone_map_method::DANIELE;
  renodrt_config.working_color_space = 2u;

  return renodx::tonemap::renodrt::BT709(untonemapped, renodrt_config);
}

float3 correctGamma(float3 color) {
  color = renodx::color::correct::GammaSafe(color);
  return color;
}

float UpgradeToneMapRatio(float ap1_color_hdr, float ap1_color_sdr, float ap1_post_process_color) {
  if (ap1_color_hdr < ap1_color_sdr) {
    // If substracting (user contrast or paperwhite) scale down instead
    // Should only apply on mismatched HDR
    return ap1_color_hdr / ap1_color_sdr;
  } else {
    float ap1_delta = ap1_color_hdr - ap1_color_sdr;
    ap1_delta = max(0, ap1_delta);  // Cleans up NaN
    const float ap1_new = ap1_post_process_color + ap1_delta;

    const bool ap1_valid = (ap1_post_process_color > 0);  // Cleans up NaN and ignore black
    return ap1_valid ? (ap1_new / ap1_post_process_color) : 0;
  }
}
float3 UpgradeToneMapPerChannel(float3 color_hdr, float3 color_sdr, float3 post_process_color, float post_process_strength) {
  // float ratio = 1.f;

  float3 ap1_hdr = max(0, renodx::color::ap1::from::BT709(color_hdr));
  float3 ap1_sdr = max(0, renodx::color::ap1::from::BT709(color_sdr));
  float3 ap1_post_process = max(0, renodx::color::ap1::from::BT709(post_process_color));

  float3 ratio = float3(
      UpgradeToneMapRatio(ap1_hdr.r, ap1_sdr.r, ap1_post_process.r),
      UpgradeToneMapRatio(ap1_hdr.g, ap1_sdr.g, ap1_post_process.g),
      UpgradeToneMapRatio(ap1_hdr.b, ap1_sdr.b, ap1_post_process.b));

  float3 color_scaled = max(0, ap1_post_process * ratio);
  color_scaled = renodx::color::bt709::from::AP1(color_scaled);
  float peak_correction = saturate(1.f - renodx::color::y::from::AP1(ap1_post_process));
  color_scaled = renodx::color::correct::Hue(color_scaled, post_process_color, peak_correction);
  return lerp(color_hdr, color_scaled, post_process_strength);
}

// input is always PQ, even for vanilla+
float3 pqTosRGB(float3 input, float customDecode = 0.f, bool clamp = false) {
  float3 output;
  renodx::tonemap::Config config = getCommonConfig();
  if (injectedData.toneMapType == 1.f) {
    output = input;
  } else {
    output = renodx::color::pq::Decode(input, injectedData.toneMapGameNits);
    output = renodx::color::bt709::from::BT2020(output);
    output = renodx::color::srgb::Encode(output);
  }

  return output;
}

float3 displayTonemap(float3 color) {
  float peak = injectedData.toneMapPeakNits;
  float tonemapper = injectedData.toneMapDisplay;
  /* I'm not dividing by 80.f because I'm using tonemapGameNits for encoding/decoding PQ
  Not sure if that's correct though */
  const float dicePaperWhite = injectedData.toneMapGameNits;
  const float dicePeakWhite = peak;
  const float frostReinPeak = peak / injectedData.toneMapGameNits;

  // Tonemap adjustments from color correctors
  if (tonemapper == 1.f) {
    const float paperWhite = injectedData.toneMapGameNits / renodx::color::srgb::REFERENCE_WHITE;
    color *= paperWhite;
    const float peakWhite = peak / renodx::color::srgb::REFERENCE_WHITE;
    const float highlightsShoulderStart = paperWhite;  // Don't tonemap the "SDR" range (in luminance), we want to keep it looking as it used to look in SDR
    color = renodx::tonemap::dice::BT709(color, peakWhite, highlightsShoulderStart);
    color /= paperWhite;

  } else if (tonemapper == 2.f) {
    color.rgb = renoDRTSmoothClamp(color, false);
  } else if (tonemapper == 3.f) {
    color.rgb = renodx::tonemap::frostbite::BT709(color.rgb, frostReinPeak);
  } else if (tonemapper == 4.f) {
    const float highlightsShoulderStart = 0.05;  // Low shoulders cuz game is too bright overall, with sharp highlights
    DICESettings config = DefaultDICESettings();
    config.Type = 1;
    config.ShoulderStart = highlightsShoulderStart;

    color.rgb = DICETonemap(color.rgb * dicePaperWhite, dicePeakWhite, config) / dicePaperWhite;
  }

  return color;
}

float3 upgradeSRGBtoPQ(float3 tonemapped, float3 post_srgb, float customDecode = 0.f, float strength = 1.f) {
  float3 hdr, post, output;

  if (injectedData.toneMapType == 1.f) {
    output = tonemapped;
  } else {
    hdr = renodx::color::pq::Decode(tonemapped, injectedData.toneMapGameNits);
    hdr = renodx::color::bt709::from::BT2020(hdr);

    post = post_srgb;
    post = renodx::color::srgb::Decode(post);

    // output = renodx::tonemap::UpgradeToneMap(hdr, saturate(hdr), saturate(post), strength);
    output = UpgradeToneMapPerChannel(hdr, saturate(hdr), post, strength);
    output = renodx::color::bt2020::from::BT709(output);
    output = renodx::color::pq::Encode(output, injectedData.toneMapGameNits);
  }

  return output;
}
