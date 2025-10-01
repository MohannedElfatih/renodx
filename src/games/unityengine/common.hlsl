#include "./shared.h"

//-----EFFECTS-----//
float3 applyFilmGrain(float3 outputColor, float2 screen, float intensity = -1) {
  if (intensity == -1) {
    intensity = injectedData.fxFilmGrain;
  } else {}
  float3 grainedColor = renodx::effects::ApplyFilmGrain(
        outputColor,
        screen,
        injectedData.random,
        intensity * 0.03f,
        1.f);
  return grainedColor;
}

float3 applySharpen(Texture2DArray colorBuffer, int2 texCoord, float intensity) {
  float3 output;
  float3 center = colorBuffer.Load(int4(texCoord,0, 0)).xyz;
  float3 neighbors[4] =
      {
        colorBuffer.Load(int4(texCoord + int2(1, 1), 0, 0)).xyz,
        colorBuffer.Load(int4(texCoord + int2(-1, 1), 0, 0)).xyz,
        colorBuffer.Load(int4(texCoord + int2(1, -1), 0, 0)).xyz,
        colorBuffer.Load(int4(texCoord + int2(-1, -1), 0, 0)).xyz
      };
  if (injectedData.toneMapType != 0.f && injectedData.FSRcheck != 0.f) {
    center = renodx::color::pq::Decode(center);
    neighbors[0] = renodx::color::pq::Decode(neighbors[0]);
    neighbors[1] = renodx::color::pq::Decode(neighbors[1]);
    neighbors[2] = renodx::color::pq::Decode(neighbors[2]);
    neighbors[3] = renodx::color::pq::Decode(neighbors[3]);
  }
      float neighborDiff = 0;
      [unroll]
      for (uint i = 0; i < 4; ++i)
          {
        neighborDiff += injectedData.toneMapType != 0.f && injectedData.FSRcheck != 0.f ? renodx::color::y::from::BT2020(abs(neighbors[i] - center))
                                                        : renodx::color::y::from::BT709(abs(neighbors[i] - center));
      }
      float sharpening = (1 - saturate(2 * neighborDiff)) * intensity;
      float3 sharpened = float3(
                             0.0.xxx
                             + neighbors[0] * -sharpening
                             + neighbors[1] * -sharpening
                             + neighbors[2] * -sharpening
                             + neighbors[3] * -sharpening
                             + center * 5
      ) * 1.0 / (5.0 + sharpening * -4.0);
      output = injectedData.toneMapType != 0.f && injectedData.FSRcheck != 0.f ? renodx::color::bt709::from::BT2020(sharpened)
                                               : sharpened;
  return output;
}
float3 applySharpen(Texture2D colorBuffer, int2 texCoord, float intensity) {
  float3 output;
  float3 center = colorBuffer.Load(int3(texCoord, 0)).xyz;
  float3 neighbors[4] =
      {
        colorBuffer.Load(int3(texCoord + int2(1, 1), 0)).xyz,
        colorBuffer.Load(int3(texCoord + int2(-1, 1), 0)).xyz,
        colorBuffer.Load(int3(texCoord + int2(1, -1), 0)).xyz,
        colorBuffer.Load(int3(texCoord + int2(-1, -1), 0)).xyz
      };
  if (injectedData.toneMapType != 0.f && injectedData.FSRcheck != 0.f) {
  center = renodx::color::pq::Decode(center);
  neighbors[0] = renodx::color::pq::Decode(neighbors[0]);
  neighbors[1] = renodx::color::pq::Decode(neighbors[1]);
  neighbors[2] = renodx::color::pq::Decode(neighbors[2]);
  neighbors[3] = renodx::color::pq::Decode(neighbors[3]);
  }
  float neighborDiff = 0;
  [unroll]
  for (uint i = 0; i < 4; ++i)
          {
    neighborDiff += injectedData.toneMapType != 0.f && injectedData.FSRcheck != 0.f ? renodx::color::y::from::BT2020(abs(neighbors[i] - center))
                                                    : renodx::color::y::from::BT709(abs(neighbors[i] - center));
  }
  float sharpening = (1 - saturate(2 * neighborDiff)) * intensity;
  float3 sharpened = float3(
                         0.0.xxx
                         + neighbors[0] * -sharpening
                         + neighbors[1] * -sharpening
                         + neighbors[2] * -sharpening
                         + neighbors[3] * -sharpening
                         + center * 5
      ) * 1.0 / (5.0 + sharpening * -4.0);
  output = injectedData.toneMapType != 0.f && injectedData.FSRcheck != 0.f ? renodx::color::bt709::from::BT2020(sharpened)
                                           : sharpened;
  return output;
}

float3 RestoreSaturationLoss(float3 color_input, float3 color_output) {
  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.strength = 0.f;
  lut_config.scaling = 0.f;
  lut_config.type_input = renodx::lut::config::type::SRGB;
  lut_config.recolor = injectedData.toneMapType != 0.f ? 1.f : 0.f;
  return renodx::lut::RestoreSaturationLoss(min(1.f, color_input), color_output, lut_config);
}

float3 ApplyUserColorGrading(float3 bt709, renodx::color::grade::Config config) {
  if (config.saturation == 1.f && config.dechroma == 0.f && config.blowout == 0.f) {
    return bt709;
  }
  float3 color = bt709;
  float y = renodx::color::y::from::BT709(abs(color));
  if (config.saturation != 1.f || config.dechroma != 0.f || config.blowout != 0.f) {
    float3 perceptual_new;
    if (injectedData.toneMapHueProcessor == 0.f) {
      perceptual_new = renodx::color::oklab::from::BT709(color);
    } else if (injectedData.toneMapHueProcessor == 1.f) {
      perceptual_new = renodx::color::ictcp::from::BT709(color);
    } else if (injectedData.toneMapHueProcessor == 2.f) {
      perceptual_new = renodx::color::dtucs::uvY::from::BT709(color).zxy;
    }
    if (config.dechroma != 0.f) {
      perceptual_new.yz *= lerp(1.f, 0.f, saturate(pow(y / (10000.f / 100.f), (1.f - config.dechroma))));
    }
    if (config.blowout != 0.f) {
      float percent_max = saturate(y * 100.f / 10000.f);
      // positive = 1 to 0, negative = 1 to 2
      float blowout_strength = 100.f;
      float blowout_change = pow(1.f - percent_max, blowout_strength * abs(config.blowout));
      if (config.blowout < 0) {
        blowout_change = (2.f - blowout_change);
      }
      perceptual_new.yz *= blowout_change;
    }
    perceptual_new.yz *= config.saturation;
    if (injectedData.toneMapHueProcessor == 0.f) {
      color = renodx::color::bt709::from::OkLab(perceptual_new);
    } else if (injectedData.toneMapHueProcessor == 1.f) {
      color = renodx::color::bt709::from::ICtCp(perceptual_new);
    } else if (injectedData.toneMapHueProcessor == 2.f) {
      color = renodx::color::bt709::from::dtucs::uvY(perceptual_new.yzx);
    }
    color = renodx::color::bt709::clamp::AP1(color);
  }
  return color;
}

float3 grading(float3 input) {
 renodx::color::grade::Config CGconfig = renodx::color::grade::config::Create();
  CGconfig.saturation = injectedData.colorGradeSaturation;
  if (injectedData.toneMapType >= 3.f) {
    CGconfig.dechroma = injectedData.colorGradeDechroma;
    CGconfig.blowout = 1.f - injectedData.colorGradeBlowout;
  }
  return ApplyUserColorGrading(input, CGconfig);
}

float3 rolloff(float3 color, float ratio = 0.97f, bool UI = false) {
  if (injectedData.toneMapType <= 1.f) { return color;}
  float y_max = injectedData.toneMapPeakNits;
  if(UI){
    if (injectedData.countOld > injectedData.countNew) {
      return color;
    }
    y_max /= injectedData.toneMapUINits;
  } else {
    y_max /= injectedData.toneMapGameNits;
  }
  float old_y = renodx::color::y::from::BT709(color);
  if (injectedData.toneMapGammaCorrection != 0.f) {
    y_max = renodx::color::correct::Gamma(y_max, true, injectedData.toneMapGammaCorrection == 1.f ? 2.2f : 2.4f);
  }
  float new_y = renodx::tonemap::ExponentialRollOff(old_y, y_max * ratio, y_max); 
float3 output = color * renodx::math::DivideSafe(new_y, old_y, 1.f);
return output;
}

float3 rolloffSdr(float3 color, float ratio = 0.85f) {
  if (injectedData.toneMapType == 0.f) { return saturate(color);}
  float old_y = renodx::color::y::from::BT709(color);
  float y_max = 1.f;
  float new_y = renodx::tonemap::ExponentialRollOff(old_y, y_max * ratio, y_max); 
return saturate(color * renodx::math::DivideSafe(new_y, old_y));
}

float3 fastSrgbDecode(float3 color){
  return color * (color * (color * 0.305306011f + 0.682171111f) + 0.012522878f);
}
float3 fastSrgbEncode(float3 color){
  return max(1.055f * pow(max(0.f, color), 0.416666667f) - 0.055f, 0.f);
}
float3 fastSrgbEncodeSafe(float3 color){
  return sign(color) * fastSrgbEncode(abs(color));
}
float3 fastSrgbDecodeSafe(float3 color){
  return sign(color) * fastSrgbDecode(abs(color));
}

float3 ConvertInput(float3 color, int encoding) {
  if (encoding == 0) {
    color = renodx::color::srgb::Encode(saturate(color));
  } else if (encoding == 1) {
    color = fastSrgbEncode(saturate(color));
  } else if (encoding == 3){
    color = sqrt(saturate(color));
  }
  return color;
}
float3 LinearOutput(float3 color, int encoding) {
  if (encoding == 0) {
    color = renodx::color::srgb::DecodeSafe(color);
  } else if (encoding == 1) {
    color = fastSrgbDecodeSafe(color);
  } else if(encoding == 3){
    color = renodx::math::Sign(color) * color * color;
  }
  return color;
}
float3 GammaOutput(float3 lut_output_color, int encoding) {
  if (
      encoding == 0
      || encoding == 1 || encoding == 3) {
    return lut_output_color;
  } else {
    float3 linear_color = LinearOutput(lut_output_color, encoding);
    return renodx::color::srgb::Encode(max(0, linear_color));
  }
}
float3 GammaInput(float3 color_input, float3 color_input_converted, int encoding) {
  if (
      encoding == 0
      || encoding == 1 || encoding == 3) {
    return color_input_converted;
  } else {
    return renodx::color::srgb::Encode(max(0, color_input));
  }
}
float3 LinearUnclampedOutput(float3 color, int encoding) {
  if (encoding == 1) {
    color = fastSrgbDecodeSafe(color);
  } else if (encoding == 3){
    color = renodx::math::Sign(color) * color * color;
  } else {
    color = renodx::color::srgb::DecodeSafe(color);
  }
  return color;
}

float3 handleUserLUT(float3 hdrLinearColor, Texture2D lut_texture, SamplerState lut_sampler, float3 preCompute, int encoding = 0, bool linearOutput = false){
// 0 = SRGB, 1 = fastSRGB, 2 = linear, 3 = gamma 2_0
  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.lut_sampler = lut_sampler;
  lut_config.strength = injectedData.colorGradeUserLUTStrength;
  lut_config.scaling = injectedData.colorGradeUserLUTScaling;
  if(encoding == 2){
  lut_config.type_input = renodx::lut::config::type::LINEAR;
  lut_config.type_output = renodx::lut::config::type::LINEAR;
  } else if (encoding == 3) {
  lut_config.type_input = renodx::lut::config::type::GAMMA_2_0;
  lut_config.type_output = renodx::lut::config::type::GAMMA_2_0;
  } else {
  lut_config.type_input = renodx::lut::config::type::SRGB;
  lut_config.type_output = renodx::lut::config::type::SRGB;
  }
  lut_config.precompute = preCompute;
  lut_config.tetrahedral = injectedData.colorGradeLUTSampling != 0.f;
  lut_config.recolor = injectedData.toneMapType == 0.f ? 0.f : 1.f;
    float y = renodx::color::y::from::BT709(hdrLinearColor);
    float3 neutralSDR = renodx::tonemap::renodrt::NeutralSDR(hdrLinearColor);
    float3 sdrColor = lerp(hdrLinearColor, neutralSDR, saturate(y));
    float3 lutLinearInput = injectedData.toneMapType <= 1.f ? min(1.f, hdrLinearColor) : sdrColor;
    float3 lutInputColor = ConvertInput(lutLinearInput, encoding);
    float3 lutOutputColor = renodx::lut::SampleColor(lutInputColor, lut_config, lut_texture);
    float3 color_output = LinearOutput(lutOutputColor, encoding);
    [branch]
    if (lut_config.scaling != 0.f) {
      float3 lutBlack = renodx::lut::SampleColor(ConvertInput(0, encoding), lut_config, lut_texture);
      float3 lutMid = renodx::lut::SampleColor(ConvertInput(0.18f, encoding), lut_config, lut_texture);
      float3 lutWhite = renodx::lut::SampleColor(ConvertInput(1.f, encoding), lut_config, lut_texture);
      float3 unclamped_gamma = renodx::lut::Unclamp(
          GammaOutput(lutOutputColor, encoding),
          GammaOutput(lutBlack, encoding),
          GammaOutput(lutMid, encoding),
          GammaOutput(lutWhite, encoding),
          GammaInput(hdrLinearColor, lutInputColor, encoding));
      float3 unclamped_linear = LinearUnclampedOutput(unclamped_gamma, encoding);
      float3 recolored = renodx::lut::RecolorUnclamped(color_output, unclamped_linear, lut_config.scaling);
      color_output = recolored;
    } else {
    }
    if (lut_config.recolor != 0.f) {
      color_output = renodx::lut::RestoreSaturationLoss(min(1.f, lutLinearInput), color_output, lut_config);
    }
    [branch]
    if(injectedData.toneMapType == 0.f){
    color_output = lerp(hdrLinearColor, color_output, lut_config.strength);
    } else {
    color_output = renodx::tonemap::UpgradeToneMap(hdrLinearColor, lutLinearInput, color_output, injectedData.colorGradeUserLUTStrength);
    }
    if(!linearOutput){
    if(encoding == 0){
      return renodx::color::srgb::EncodeSafe(color_output);
    } else if(encoding == 1){
      return fastSrgbEncodeSafe(color_output);
    } else {
      return color_output;
    }
  } else {
    return color_output;
  }
}
float3 handleUserLUT(float3 hdrLinearColor, Texture3D lut_texture, SamplerState lut_sampler, float size = 0, int encoding = 0, bool linearOutput = false){
// 0 = SRGB, 1 = fastSRGB, 2 = linear, 3 = gamma 2_0
  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.lut_sampler = lut_sampler;
  lut_config.strength = injectedData.colorGradeUserLUTStrength;
  lut_config.scaling = injectedData.colorGradeUserLUTScaling;
  if(encoding == 2){
  lut_config.type_input = renodx::lut::config::type::LINEAR;
  lut_config.type_output = renodx::lut::config::type::LINEAR;
  } else if (encoding == 3) {
  lut_config.type_input = renodx::lut::config::type::GAMMA_2_0;
  lut_config.type_output = renodx::lut::config::type::GAMMA_2_0;
  } else {
  lut_config.type_input = renodx::lut::config::type::SRGB;
  lut_config.type_output = renodx::lut::config::type::SRGB;
  }
  if(size != 0){
  lut_config.size = size;
  }
  lut_config.tetrahedral = injectedData.colorGradeLUTSampling != 0.f;
  lut_config.recolor = injectedData.toneMapType == 0.f ? 0.f : 1.f;
    float3 neutralSDR = renodx::tonemap::renodrt::NeutralSDR(hdrLinearColor);
    float y = renodx::color::y::from::BT709(hdrLinearColor);
    float3 sdrColor = lerp(hdrLinearColor, neutralSDR, saturate(y));
    float3 lutLinearInput = injectedData.toneMapType <= 1.f ? min(1.f, hdrLinearColor) : sdrColor;
    float3 lutInputColor = ConvertInput(lutLinearInput, encoding);
    float3 lutOutputColor = renodx::lut::SampleColor(lutInputColor, lut_config, lut_texture);
    float3 color_output = LinearOutput(lutOutputColor, encoding);
    [branch]
    if (lut_config.scaling != 0.f) {
      float3 lutBlack = renodx::lut::SampleColor(ConvertInput(0, encoding), lut_config, lut_texture);
      float3 lutMid = renodx::lut::SampleColor(ConvertInput(0.18f, encoding), lut_config, lut_texture);
      float3 lutWhite = renodx::lut::SampleColor(ConvertInput(1.f, encoding), lut_config, lut_texture);
      float3 unclamped_gamma = renodx::lut::Unclamp(
          GammaOutput(lutOutputColor, encoding),
          GammaOutput(lutBlack, encoding),
          GammaOutput(lutMid, encoding),
          GammaOutput(lutWhite, encoding),
          GammaInput(hdrLinearColor, lutInputColor, encoding));
      float3 unclamped_linear = LinearUnclampedOutput(unclamped_gamma, encoding);
      float3 recolored = renodx::lut::RecolorUnclamped(color_output, unclamped_linear, lut_config.scaling);
      color_output = recolored;
    } else {
    }
    if (lut_config.recolor != 0.f) {
      color_output = renodx::lut::RestoreSaturationLoss(min(1.f, lutLinearInput), color_output, lut_config);
    }
    [branch]
    if(injectedData.toneMapType == 0.f){
    color_output = lerp(hdrLinearColor, color_output, lut_config.strength);
    } else {
    color_output = renodx::tonemap::UpgradeToneMap(hdrLinearColor, lutLinearInput, color_output, injectedData.colorGradeUserLUTStrength);
    }
    if(!linearOutput){
    if(encoding == 0){
      return renodx::color::srgb::EncodeSafe(color_output);
    } else if(encoding == 1){
      return fastSrgbEncodeSafe(color_output);
    } else {
      return color_output;
    }
  } else {
    return color_output;
  }
}

//-----SCALING-----//
float3 PostToneMapScale(float3 color, bool gamma = false) {
  if (gamma) {
    [branch]
    if (injectedData.toneMapGammaCorrection == 2.f) {
      color = renodx::color::srgb::EncodeSafe(color);
      color = renodx::color::gamma::DecodeSafe(color, 2.4f);
      color *= injectedData.toneMapGameNits / injectedData.toneMapUINits;
      color = renodx::color::gamma::EncodeSafe(color, 2.4f);
    } else if (injectedData.toneMapGammaCorrection == 1.f) {
      color = renodx::color::srgb::EncodeSafe(color);
      color = renodx::color::gamma::DecodeSafe(color, 2.2f);
      color *= injectedData.toneMapGameNits / injectedData.toneMapUINits;
      color = renodx::color::gamma::EncodeSafe(color, 2.2f);
    } else {
      color *= injectedData.toneMapGameNits / injectedData.toneMapUINits;
      color = renodx::color::srgb::EncodeSafe(color);
    }
  } else {
    [branch]
    if (injectedData.toneMapGammaCorrection == 2.f) {
      color = renodx::color::correct::GammaSafe(color, false, 2.4f);
      color *= injectedData.toneMapGameNits / injectedData.toneMapUINits;
      color = renodx::color::correct::GammaSafe(color, true, 2.4f);
    } else if (injectedData.toneMapGammaCorrection == 1.f) {
      color = renodx::color::correct::GammaSafe(color, false, 2.2f);
      color *= injectedData.toneMapGameNits / injectedData.toneMapUINits;
      color = renodx::color::correct::GammaSafe(color, true, 2.2f);
    } else {
      color *= injectedData.toneMapGameNits / injectedData.toneMapUINits;
    }
  }
  return color;
}

float3 FinalizeOutput(float3 color, bool gamma) {
  [branch]
  if (injectedData.toneMapGammaCorrection == 2.f) {
    color = gamma ? renodx::color::gamma::DecodeSafe(color, 2.4f) : renodx::color::correct::GammaSafe(color, false, 2.4f);
  } else if (injectedData.toneMapGammaCorrection == 1.f) {
    color = gamma ? renodx::color::gamma::DecodeSafe(color, 2.2f) : renodx::color::correct::GammaSafe(color, false, 2.2f);
  } else {
    color = gamma ? renodx::color::srgb::DecodeSafe(color) : color;
  }
  color *= injectedData.toneMapUINits;
  [branch]
  if (injectedData.colorGradeColorSpace == 1.f) {
    color = renodx::color::bt709::from::BT709D93(color);
  } else if (injectedData.colorGradeColorSpace == 2.f) {
    color = renodx::color::bt709::from::ARIBTRB9(color);
  } else if (injectedData.colorGradeColorSpace == 3.f) {
    color = renodx::color::bt709::from::ARIBTRB927MPCD(color);
  } else if (injectedData.colorGradeColorSpace == 4.f) {
    color = renodx::color::bt709::from::BT601NTSCU(color);
  }
  [branch]
  if (injectedData.toneMapType == 0.f) {
    color = renodx::color::bt709::clamp::BT709(color);
    color = min(injectedData.toneMapGameNits, color);
  } else if(injectedData.toneMapType >= 2.f) {
    color = renodx::color::bt709::clamp::BT2020(color);
    color = min(color, injectedData.toneMapPeakNits);
  }
  color /= 80.f;
  return color;
}

float3 InvertToneMapScale(float3 color, bool gamma = false) {
  if(gamma){
    if (injectedData.toneMapGammaCorrection == 2.f) {
      color = renodx::color::gamma::DecodeSafe(color, 2.4f);
      color *= injectedData.toneMapUINits / injectedData.toneMapGameNits;
      color = renodx::color::gamma::EncodeSafe(color, 2.4f);
      color = renodx::color::srgb::DecodeSafe(color);
    } else if (injectedData.toneMapGammaCorrection == 1.f) {
      color = renodx::color::gamma::DecodeSafe(color, 2.2f);
      color *= injectedData.toneMapUINits / injectedData.toneMapGameNits;
      color = renodx::color::gamma::EncodeSafe(color, 2.2f);
      color = renodx::color::srgb::DecodeSafe(color);
    } else {
      color = renodx::color::srgb::DecodeSafe(color);
      color *= injectedData.toneMapUINits / injectedData.toneMapGameNits;
    }
  } else {
    [branch]
    if (injectedData.toneMapGammaCorrection == 2.f) {
      color = renodx::color::correct::GammaSafe(color, false, 2.4f);
      color *= injectedData.toneMapUINits / injectedData.toneMapGameNits;
      color = renodx::color::correct::GammaSafe(color, true, 2.4f);
    } else if (injectedData.toneMapGammaCorrection == 1.f) {
      color = renodx::color::correct::GammaSafe(color, false, 2.2f);
      color *= injectedData.toneMapUINits / injectedData.toneMapGameNits;
      color = renodx::color::correct::GammaSafe(color, true, 2.2f);
    } else {
      color *= injectedData.toneMapUINits / injectedData.toneMapGameNits;
    }
  }
  return color;
}

float acesccEncode(float x) {
  return (x < 0.00003051757) ? (log2(0.00001525878 + x * 0.5) + 9.72) / 17.52 : (log2(x) + 9.72) / 17.52;
}

float3 acesccEncode(float3 x) {
  x = max(x, 0.0);
  x = min(x, renodx::math::FLT16_MAX);
  x.r = acesccEncode(x.r);
  x.g = acesccEncode(x.g);
  x.b = acesccEncode(x.b);
  return x;
}

// logc c1000 custom encoding
static const float arri_a = renodx::color::arri::logc::c1000::PARAMS.a;
static const float arri_b = renodx::color::arri::logc::c1000::PARAMS.b;
static const float arri_c = renodx::color::arri::logc::c1000::PARAMS.c;
static const float arri_d = renodx::color::arri::logc::c1000::PARAMS.d;

float3 arriDecode(float3 color) {
  return (pow(10.f, (color - arri_d) / arri_c) - arri_b) / arri_a;
}

float3 lutShaper(float3 color, bool builder = false, int type = 0) {
  if (type == 0) {
    [branch]
    if (injectedData.colorGradeInternalLUTShaper == 0.f) {
      color = builder ? arriDecode(color)
                      : saturate(renodx::color::arri::logc::c1000::Encode(color, false));
    } else {
      color = builder ? renodx::color::bt709::from::BT2020(renodx::color::pq::Decode(color, 100.f))
                      : saturate(renodx::color::pq::EncodeSafe(renodx::color::bt2020::from::BT709(color), 100.f));
    }
  } else if (type == 1) {
    [branch]
    if (injectedData.colorGradeInternalLUTShaper == 0.f) {
      color = builder ? color : saturate(color);
    } else {
      color = builder ? renodx::color::bt709::from::BT2020(renodx::color::pq::Decode(color, 100.f))
                      : saturate(renodx::color::pq::EncodeSafe(renodx::color::bt2020::from::BT709(color), 100.f));
    }
  } else if (type == 2) {
    [branch]
    if (injectedData.colorGradeInternalLUTShaper == 0.f) {
      color = builder ? color : renodx::color::srgb::Encode(saturate(color));
    } else {
      color = builder ? renodx::color::srgb::EncodeSafe(renodx::color::pq::Decode(color, 100.f))
                      : saturate(renodx::color::pq::EncodeSafe(color, 100.f));
    }
  }
  return color;
}