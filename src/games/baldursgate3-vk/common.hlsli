#include "./shared.h"
#include "./macleod_boynton.hlsli"
#include "./psycho_test11.hlsl"

struct UserGradingConfig {
  float exposure;
  float highlights;
  float shadows;
  float contrast;
  float flare;
  float saturation;
  float dechroma;
  float hue_emulation_strength;
  float highlight_saturation;
  float chrominance_emulation_strength;
};

UserGradingConfig CreateColorGradeConfig() {
  const UserGradingConfig cg_config = {
    RENODX_TONE_MAP_EXPOSURE,                             // float exposure;
    RENODX_TONE_MAP_HIGHLIGHTS,                           // float highlights;
    RENODX_TONE_MAP_SHADOWS,                              // float shadows;
    RENODX_TONE_MAP_CONTRAST,                             // float contrast;
    0.10f * pow(RENODX_TONE_MAP_FLARE, 10.f),             // float flare;
    RENODX_TONE_MAP_SATURATION,                           // float saturation;
    RENODX_TONE_MAP_DECHROMA,                             // float dechroma;
    RENODX_TONE_MAP_HUE_SHIFT,                            // float hue_emulation_strength;
    -1.f * (RENODX_TONE_MAP_HIGHLIGHT_SATURATION - 1.f),  // float highlight_saturation;
    RENODX_TONE_MAP_BLOWOUT                               // float chrominance_emulation_strength;
  };
  return cg_config;
}

float Highlights(float x, float highlights, float mid_gray) {
  if (highlights == 1.f) return x;

  if (highlights > 1.f) {
    return max(x, lerp(x, mid_gray * pow(x / mid_gray, highlights), min(x, 10.f)));
  } else {  // highlights < 1.f
    x /= mid_gray;
    return lerp(x, pow(x, highlights), step(1.f, x)) * mid_gray;
  }
}

float Shadows(float x, float shadows, float mid_gray) {
  if (shadows == 1.f) return x;

  const float ratio = max(renodx::math::DivideSafe(x, mid_gray, 0.f), 0.f);
  const float base_term = x * mid_gray;
  const float base_scale = renodx::math::DivideSafe(base_term, ratio, 0.f);

  if (shadows > 1.f) {
    float raised = x * (1.f + renodx::math::DivideSafe(base_term, pow(ratio, shadows), 0.f));
    float reference = x * (1.f + base_scale);
    return max(x, x + (raised - reference));
  } else {  // shadows < 1.f
    float lowered = x * (1.f - renodx::math::DivideSafe(base_term, pow(ratio, 2.f - shadows), 0.f));
    float reference = x * (1.f - base_scale);
    return clamp(x + (lowered - reference), 0.f, x);
  }
}

float3 ApplyExposureContrastFlareHighlightsShadowsByLuminance(float3 untonemapped, float y, UserGradingConfig config, float mid_gray = 0.18f) {
  if (config.exposure == 1.f && config.shadows == 1.f && config.highlights == 1.f && config.contrast == 1.f && config.flare == 0.f) {
    return untonemapped;
  }
  float3 color = untonemapped;

  color *= config.exposure;

  // contrast & flare
  const float y_normalized = y / mid_gray;
  float flare = renodx::math::DivideSafe(y_normalized + config.flare, y_normalized, 1.f);
  float exponent = config.contrast * flare;
  const float y_contrasted = pow(y_normalized, exponent) * mid_gray;

  // highlights
  float y_highlighted = Highlights(y_contrasted, config.highlights, mid_gray);

  // shadows
  float y_shadowed = Shadows(y_highlighted, config.shadows, mid_gray);

  const float y_final = y_shadowed;

  color = renodx::color::correct::Luminance(color, y, y_final);

  return color;
}

float3 ApplySaturationBlowoutHueCorrectionHighlightSaturation(float3 tonemapped, float3 hue_reference_color, float y, UserGradingConfig config) {
  float3 color = tonemapped;
  if (config.saturation != 1.f || config.dechroma != 0.f || config.hue_emulation_strength != 0.f || config.chrominance_emulation_strength != 0.f || config.highlight_saturation != 0.f) {
    if (config.hue_emulation_strength != 0.0 || config.chrominance_emulation_strength != 0.0) {
      color = CorrectHueAndPurityMBGated(
          color,
          hue_reference_color,
          config.hue_emulation_strength,
          0.5f,
          1.f,
          config.chrominance_emulation_strength,
          1.f);
    }

    float mb_scale = max(config.saturation, 0.f);

    if (config.dechroma != 0.f) {
      float dechroma_scale = lerp(1.f, 0.f, saturate(pow(y / (10000.f / 100.f), (1.f - config.dechroma))));
      mb_scale *= max(dechroma_scale, 0.f);
    }

    if (config.highlight_saturation != 0.f) {
      float percent_max = saturate(y * 100.f / 10000.f);
      float highlight_saturation_strength = 100.f;
      float highlight_saturation_change = pow(1.f - percent_max, highlight_saturation_strength * abs(config.highlight_saturation));
      if (config.highlight_saturation < 0) {
        highlight_saturation_change = (2.f - highlight_saturation_change);
      }
      mb_scale *= max(highlight_saturation_change, 0.f);
    }

    if (abs(mb_scale - 1.f) > 1e-6f) {
      float3 color_bt2020 = renodx::color::bt2020::from::BT709(color);
      color = renodx::color::bt709::from::BT2020(
          renodx_custom::color::macleod_boynton::ApplyScaleBT2020(color_bt2020, mb_scale)
              .rgbOut);
    }

    color = renodx::color::bt709::clamp::AP1(color);
  }
  return color;
}

float3 SplitContrast(float3 color, float contrast_shadows = 1.f, float contrast_highlights = 1.f, float mid_gray = 0.18f,
                     float3x3 color_space = renodx::color::BT709_TO_XYZ_MAT) {
  float color_y = dot(color, color_space[1].rgb);

  float contrast = renodx::math::Select(color_y < mid_gray, contrast_shadows, contrast_highlights);
  float contrasted_y = pow(color_y / mid_gray, contrast) * mid_gray;

  return renodx::color::correct::Luminance(color, color_y, contrasted_y);
}

float3 GammaCorrectHuePreserving(float3 incorrect_color, bool pow_to_srgb = false) {
  float3 corrected_color = renodx::color::correct::GammaSafe(incorrect_color, pow_to_srgb);
  float3 result = renodx::color::correct::Hue(corrected_color, incorrect_color);
  return result;
}

float3 GamutCompress(float3 color_bt709, float3x3 color_space_matrix = renodx::color::BT709_TO_XYZ_MAT) {
  float grayscale = dot(color_bt709, color_space_matrix[1].rgb);

  const float MID_GRAY_LINEAR = 1 / (pow(10, 0.75));                          // ~0.18f
  const float MID_GRAY_PERCENT = 0.5f;                                        // 50%
  const float MID_GRAY_GAMMA = log(MID_GRAY_LINEAR) / log(MID_GRAY_PERCENT);  // ~2.49f
  float encode_gamma = MID_GRAY_GAMMA;

  float3 encoded = renodx::color::gamma::EncodeSafe(color_bt709, encode_gamma);
  float encoded_gray = renodx::color::gamma::Encode(grayscale, encode_gamma);

  float3 compressed = renodx::color::correct::GamutCompress(encoded, encoded_gray);
  float3 color_bt709_compressed = renodx::color::gamma::DecodeSafe(compressed, encode_gamma);

  return color_bt709_compressed;
}

float4 GenerateLUTbuilderOutput(float3 untonemapped_ap1) {
  float3 color_output = renodx::color::bt709::from::AP1(untonemapped_ap1);

  // apply contrast and midgray adjustment
  color_output = SplitContrast(color_output, 1.5f, 1.f, 0.18f);
  color_output *= 0.16f / 0.18f;

  // use reinhard to blow out and hue shift, peak of 5.5f found to look good in testing
  float3 hue_and_chrominance_source = renodx::tonemap::ReinhardPiecewise(color_output, 5.5f, 0.16f);

  // apply hue correction and purity matching via MacLeod-Boynton
  color_output = CorrectHueAndPurityMBGated(color_output, hue_and_chrominance_source, 1.f, 0.5f, 1.f, 1.f);

  // apply saturation boost via MB purity scaling
  float3 lut_bt2020 = renodx::color::bt2020::from::BT709(color_output);
  color_output = renodx::color::bt709::from::BT2020(
      renodx_custom::color::macleod_boynton::ApplyScaleBT2020(lut_bt2020, 1.325f).rgbOut);

  color_output = GammaCorrectHuePreserving(color_output);

  color_output = renodx::color::bt2020::from::BT709(color_output);
  color_output = GamutCompress(color_output, renodx::color::BT2020_TO_XYZ_MAT);

  color_output = renodx::color::pq::EncodeSafe(color_output, 100.f);

  return float4(color_output, 1.f);
}

float3 PsychoGrade(float3 ungraded_bt709) {
  UserGradingConfig cg_config = CreateColorGradeConfig();

  float peak_ratio = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
  float bleaching = cg_config.flare;

  float3 tonemapped = psychotm_test11(
      ungraded_bt709,
      peak_ratio,
      cg_config.exposure,
      cg_config.highlights,
      cg_config.shadows,
      cg_config.contrast,
      max(cg_config.saturation, 0.f),
      bleaching,
      65.f,
      1.f,
      1.f,
      0,
      1.f);

  if (cg_config.dechroma != 0.f || cg_config.highlight_saturation != 0.f) {
    float y_post = renodx::color::y::from::BT709(tonemapped);
    float mb_scale = 1.f;

    if (cg_config.dechroma != 0.f) {
      float dechroma_scale = lerp(1.f, 0.f, saturate(pow(y_post / (10000.f / 100.f), (1.f - cg_config.dechroma))));
      mb_scale *= max(dechroma_scale, 0.f);
    }

    if (cg_config.highlight_saturation != 0.f) {
      float percent_max = saturate(y_post * 100.f / 10000.f);
      float hs_strength = 100.f;
      float hs_change = pow(1.f - percent_max, hs_strength * abs(cg_config.highlight_saturation));
      if (cg_config.highlight_saturation < 0) {
        hs_change = (2.f - hs_change);
      }
      mb_scale *= max(hs_change, 0.f);
    }

    if (abs(mb_scale - 1.f) > 1e-6f) {
      float3 color_bt2020 = renodx::color::bt2020::from::BT709(tonemapped);
      tonemapped = renodx::color::bt709::from::BT2020(
          renodx_custom::color::macleod_boynton::ApplyScaleBT2020(color_bt2020, mb_scale).rgbOut);
    }

    tonemapped = renodx::color::bt709::clamp::AP1(tonemapped);
  }

  if (cg_config.hue_emulation_strength != 0.f || cg_config.chrominance_emulation_strength != 0.f) {
    float3 ungraded_clamped = max(0, ungraded_bt709);
    float3 hue_reference = renodx::tonemap::neutwo::PerChannel(ungraded_clamped, peak_ratio.xxx);
    float3 purity_reference = renodx::tonemap::neutwo::MaxChannel(ungraded_clamped, peak_ratio);
    if (cg_config.hue_emulation_strength != 0.f) {
      tonemapped = CorrectHueAndPurityMBGated(
          tonemapped,
          hue_reference,
          cg_config.hue_emulation_strength,
          0.5f,
          1.f,
          0.f);
    }
    if (cg_config.chrominance_emulation_strength != 0.f) {
      tonemapped = CorrectHueAndPurityMBGated(
          tonemapped,
          purity_reference,
          0.f,
          0.5f,
          1.f,
          cg_config.chrominance_emulation_strength);
    }
  }

  return tonemapped;
}

UserGradingConfig CreateUICharacterGradeConfig() {
  const UserGradingConfig cg_config = {
    1.0f,    // exposure
    1.0f,    // highlights (slider 50 * 0.02)
    1.0f,    // shadows (slider 50 * 0.02)
    1.4f,    // contrast (slider 70 * 0.02)
    0.0f,    // flare (slider 0)
    2.0f,    // saturation (slider 100 * 0.02)
    0.0f,    // dechroma (slider 0)
    0.0f,    // hue_emulation_strength (slider 0)
    0.0f,    // highlight_saturation = -1*(1.0-1.0)
    0.0f     // chrominance_emulation_strength (slider 0)
  };
  return cg_config;
}

float3 ApplyUICharacterGrading(float3 ungraded_bt709) {
  UserGradingConfig cg_config = CreateUICharacterGradeConfig();

  float y = renodx::color::y::from::BT709(ungraded_bt709);
  float3 graded_bt709 = ApplyExposureContrastFlareHighlightsShadowsByLuminance(ungraded_bt709, y, cg_config);

  float3 graded_ap1 = renodx::color::ap1::from::BT709(graded_bt709);
  float3 hue_reference = renodx::color::bt709::from::AP1(
      renodx::tonemap::ReinhardPiecewise(graded_ap1, 2.f, 0.5f));

  graded_bt709 = ApplySaturationBlowoutHueCorrectionHighlightSaturation(graded_bt709, hue_reference, y, cg_config);

  return graded_bt709;
}

// ============================================================================
//  ReGrading for UI characters (sRGB gamma space)
// ============================================================================

float regrading_linearstep(float a, float b, float x) {
  return saturate((x - a) / (b - a));
}

float regrading_rgb_to_hue(float3 rgb) {
  float cmax = max(max(rgb.r, rgb.g), rgb.b);
  float cmin = min(min(rgb.r, rgb.g), rgb.b);
  float delta = cmax - cmin;
  float hue = 0;
  if (delta > 1e-6) {
    if (cmax == rgb.r)
      hue = frac((rgb.g - rgb.b) / (delta * 6.0));
    else if (cmax == rgb.g)
      hue = (rgb.b - rgb.r) / (delta * 6.0) + 1.0 / 3.0;
    else
      hue = (rgb.r - rgb.g) / (delta * 6.0) + 2.0 / 3.0;
    if (hue < 0) hue += 1.0;
  }
  return hue;
}

// Lift Gamma Gain (ASC CDL mode 0)
// Only gamma blue channel differs: B=140/255 → gamma.b = 1.0 - 140/255 + 0.5
float3 UIChar_LiftGammaGain(float3 x) {
  float3 gamma_val = float3(1.0, 1.0, 1.0 - (140.0 / 255.0) + 0.5);
  return pow(saturate(x), gamma_val);
}

// Calibration — primary hue/sat only (temp=6500 neutral, lab=0)
// Mode 0 (ReGrade Legacy), primary_hues = (0, 0.40, 0), primary_sat = (0, 1.00, 0)
float3 UIChar_Calibration(float3 c) {
  static const float3 primary_hues = float3(0.0, 0.40, 0.0);
  static const float3 primary_sat = float3(0.0, 1.00, 0.0);

  float minc = min(min(c.x, c.y), c.z);
  c -= minc;

  float3 prim_R = float3(1, saturate(primary_hues.x), saturate(-primary_hues.x));
  float3 prim_G = float3(saturate(-primary_hues.y), 1, saturate(primary_hues.y));
  float3 prim_B = float3(saturate(primary_hues.z), saturate(-primary_hues.z), 1);

  // mode 0: dot product saturation formula
  float s = dot(c / max(dot(c, 1), 1e-6), 1 + primary_sat);
  prim_R = lerp(dot(prim_R, 0.33333), prim_R, s);
  prim_G = lerp(dot(prim_G, 0.33333), prim_G, s);
  prim_B = lerp(dot(prim_B, 0.33333), prim_B, s);

  prim_R = normalize(prim_R);
  prim_G = normalize(prim_G);
  prim_B = normalize(prim_B);

  float len_c = length(c);
  if (len_c > 1e-6) {
    c = normalize(c.r * prim_R + c.g * prim_G + c.b * prim_B) * len_c;
  }
  c += minc;
  c = saturate(c);
  return c;
}

// Color Remapping — Red (Sat=0.3, Value=-1.0), Aqua (Sat=0.3, Value=-1.0)
float3 UIChar_ColorRemap(float3 rgb) {
  static const float3 huemod[7] = {
    float3(0.0, 0.3, -1.0),   // Red
    float3(0.0, 0.0, 0.0),    // Orange
    float3(0.0, 0.0, 0.0),    // Yellow
    float3(0.0, 0.0, 0.0),    // Green
    float3(0.0, 0.3, -1.0),   // Aqua
    float3(0.0, 0.0, 0.0),    // Blue
    float3(0.0, 0.0, 0.0)     // Magenta
  };
  static const float hue_nodes[8] = {
    0.0, 1.0/12.0, 2.0/12.0, 4.0/12.0, 6.0/12.0, 8.0/12.0, 10.0/12.0, 1.0
  };

  float hue = regrading_rgb_to_hue(rgb);

  float risingedges[7];
  [unroll] for (int j = 0; j < 7; j++)
    risingedges[j] = regrading_linearstep(hue_nodes[j], hue_nodes[j + 1], hue);

  float hueweights[7];
  hueweights[0] = (1.0 - risingedges[0]) + risingedges[6];
  [unroll] for (int k = 1; k < 7; k++)
    hueweights[k] = (1.0 - risingedges[k]) * risingedges[k - 1];

  float3 oklab = renodx::color::oklab::from::BT709(rgb);
  float3 ret = 0;

  [loop]
  for (int h = 0; h < 7; h++) {
    float w = hueweights[h];
    w = w * w * (3.0 - 2.0 * w);
    if (w < 0.000001) continue;

    float3 new_hue = oklab;
    // Value: adjust L based on chroma
    new_hue.x = pow(max(0, new_hue.x), exp2(-huemod[h].z * 4 * length(new_hue.yz)));
    // Hue rotation
    float sn, cs;
    sincos(-3.14159265 * huemod[h].x, sn, cs);
    new_hue.yz = float2(new_hue.y * cs - new_hue.z * sn,
                        new_hue.y * sn + new_hue.z * cs);
    // Saturation
    if (huemod[h].y < 0) {
      new_hue.yz *= 1 + huemod[h].y;
    } else {
      float sat = length(new_hue.yz);
      new_hue.yz /= sat + 1e-7;
      sat = pow(sat * 2, exp2(-huemod[h].y * 0.5)) * 0.5;
      new_hue.yz *= sat;
    }
    ret += new_hue * w;
  }

  ret = renodx::color::bt709::from::OkLab(ret);
  ret = saturate(ret);
  return ret;
}

// Combined ReGrading pass for UI characters (operates on sRGB gamma-encoded data)
// Normalizes by peak channel to preserve HDR headroom through SDR-range grading.
float3 ApplyUICharacterReGrading(float3 srgb) {
  float peak = max(max(srgb.r, max(srgb.g, srgb.b)), 1e-6);
  float3 normalized = srgb / peak;

  normalized = UIChar_LiftGammaGain(normalized);
  normalized = UIChar_Calibration(normalized);
  normalized = UIChar_ColorRemap(normalized);

  return normalized * peak;
}

float3 ApplyUserGrading(float3 ungraded_bt709) {
  UserGradingConfig cg_config = CreateColorGradeConfig();

  float y = renodx::color::y::from::BT709(ungraded_bt709);
  float3 graded_bt709 = ApplyExposureContrastFlareHighlightsShadowsByLuminance(ungraded_bt709, y, cg_config);

  float3 graded_ap1 = renodx::color::ap1::from::BT709(graded_bt709);
  float3 hue_reference = renodx::color::bt709::from::AP1(
      renodx::tonemap::ReinhardPiecewise(graded_ap1, 2.f, 0.5f));

  graded_bt709 = ApplySaturationBlowoutHueCorrectionHighlightSaturation(graded_bt709, hue_reference, y, cg_config);

  return graded_bt709;
}
