#include "./include/CBuffers.hlsl"
#include "./include/Registers.hlsl"
#include "./shared.h"
#include "./common.hlsl"

// Hash without Sine - David Hoskins - MIT License
// https://www.shadertoy.com/view/4djSRW
float hash13(float3 p3) {
  p3 = frac(p3 * .1031f);
  p3 += dot(p3, p3.zyx + 31.32f);
  return frac((p3.x + p3.y) * p3.z);
}

//
// Generic log lin transforms
//
float3 LogToLin(float3 LogColor) {
  const float LinearRange = 14;
  const float LinearGrey = 0.18f;
  const float ExposureGrey = 444;

  // Using stripped down, 'pure log', formula. Parameterized by grey points and dynamic range covered.
  float3 LinearColor = exp2((LogColor - ExposureGrey / 1023.0f) * LinearRange) * LinearGrey;

  return LinearColor;
}

float3 LinToLog(float3 LinearColor) {
  const float LinearRange = 14;
  const float LinearGrey = 0.18f;
  const float ExposureGrey = 444;

  // Using stripped down, 'pure log', formula. Parameterized by grey points and dynamic range covered.
  float3 LogColor = log2(LinearColor) / LinearRange - log2(LinearGrey) / LinearRange + ExposureGrey / 1023.0;  // scalar: 3log2 3mad
  LogColor = saturate(LogColor);

  return LogColor;
}

float4 Tonemap(
    float4 SV_POSITION: SV_Position,
    float2 input: TEXCOORD) {
  float4 output = 0;
  float exposure = 1.f;     // eyeAdaptation.Load( uint3(0,0,0) ).x;
  float invExposure = 1.f;  // / exposure;

  float2 screenUV = input.xy;

  // Film Grain - Compute film grain noise and pixel jitter
  float grain = 1.0f;
  if (g_useFilmGrain != 0.0f) {
    // Film Grain Noise
    float2 grainUV = (screenUV + float2(g_FilmGrainRandomUVOffset_U, g_FilmGrainRandomUVOffset_V)) * g_FilmGrainScale;
    grain = hash13(grainUV.xyx);
    // UE4s film grain pixel jitter
    screenUV += (1.0f - grain * grain) * g_FilmGrainJitter * float2(-0.5f, 0.5f);  // in UE4, offset is diagonal
  }

#if defined(USE_CHROMATIC_ABERRATION) || defined(USE_VIGNETTE)
  // Screen pos: [-0.5,0.5]x[-0.5,0.5]
  float2 screenPos = screenUV - 0.5f;
#endif  // USE_CHROMATIC_ABERRATION || USE_VIGNETTE

#if defined(USE_CHROMATIC_ABERRATION)
  // Chromatic Aberration UV
  float2 CAPos = float2(screenPos.x, screenPos.y * g_CAReciprocalAspectRatio);
  CAPos *= (saturate(CAPos.x * CAPos.x + CAPos.y * CAPos.y - g_CAStartOffset)) * g_CAIntensity;
  CAPos.y *= g_CAAspectRatio;

  // BloomTexture+AccumulationTexture with Chromatic Aberration
  output.x = texture0.Sample(samplerState0, screenUV).x * exposure;
  output.x += texture1.Sample(samplerState0, screenUV).x * invExposure;
  output.y = texture0.Sample(samplerState0, screenUV - CAPos * g_CAGreenChannelShiftingFactor).y * exposure;
  output.y += texture1.Sample(samplerState0, screenUV - CAPos * g_CAGreenChannelShiftingFactor).y * invExposure;
  output.z = texture0.Sample(samplerState0, screenUV - CAPos * g_CABlueChannelShiftingFactor).z * exposure;
  output.z += texture1.Sample(samplerState0, screenUV - CAPos * g_CABlueChannelShiftingFactor).z * invExposure;
  output.a = texture0.Sample(samplerState0, screenUV).a;
  output.a += texture1.Sample(samplerState0, screenUV).a;
#else   // USE_CHROMATIC_ABERRATION
        // Bloom + Accumulation
  output += texture0.Sample(samplerState0, screenUV) * exposure;
  output += texture1.Sample(samplerState0, screenUV) * invExposure;
#endif  // USE_CHROMATIC_ABERRATION

#if defined(USE_VIGNETTE)
  // Vignette
  // Squared Coord: (x^2, y^2)
  screenPos.y *= g_vignetteReciprocalAspectRatio;
  screenPos *= screenPos;
  // Circle: r^2 = x^2 + y^2
  float circlePos = (screenPos.x + screenPos.y);
  // Squircle: r^4 = x^4 + y^4 => r^2 = sqrt(x^4 + y^4)
  float squirclePos = sqrt(screenPos.x * screenPos.x + screenPos.y * screenPos.y);
  // Lerp of Circle & Squircle
  float vignetteRadius = lerp(squirclePos, circlePos, g_vignetteRoundness) * g_vignetteOffset;
  // Vignette mask : cos4( radius ) = natural light falloff
  float vignetteMultiplicator = pow(rsqrt(1.0f + vignetteRadius), g_vignetteSmoothness);
  // Blend with the color vignette
  vignetteMultiplicator = lerp(1.0f, vignetteMultiplicator, g_vignetteColor.w);
  output.xyz = lerp(g_vignetteColor.xyz, output.xyz * vignetteMultiplicator, vignetteMultiplicator);

#endif  // USE_VIGNETTE
  // Sample a prebaked LUT
  // Seems to always use this
  if (g_useTonemap_LUT != 0.0f || true) {
    float3 ungraded_bt709 = output.rgb;
    float3 logColor = LinToLog(output.rgb + LogToLin(0));
    float3 scale = (g_lutResolution - 1.0f) / g_lutResolution;
    float3 offset = 1.0f / (2.0f * g_lutResolution);
    float3 tonemapCorrectedLinear = lutTexture.Sample(samplerState1, scale * logColor + offset).rgb;
    if (RENODX_TONE_MAP_TYPE) {
      // tonemapCorrectedLinear = renodx::color::bt709::from::AP1(tonemapCorrectedLinear);
      tonemapCorrectedLinear = extractColorGradeAndApplyTonemap(ungraded_bt709, tonemapCorrectedLinear);
    }
    output.rgb = tonemapCorrectedLinear;
  }
  // else
  // // Evaluate tonemap in realtime
  // {
  //   // output.rgb = evaluateCurve(output.rgb);
  // }

  // Film Grain - Apply film grain noise
  if (g_useFilmGrain != 0.0f) {
    [branch]
    if (CUSTOM_FILM_GRAIN_TYPE) {
      output.rgb = renodx::effects::ApplyFilmGrain(
          output.rgb,
          screenUV,
          grain,
          g_FilmGrainIntensity * 0.03,
          1.f);
    } else {
      float luminanceGrain = (grain - 0.5f) * g_FilmGrainIntensity + 1.0f;
      output *= luminanceGrain;
    }
  }

  [branch]
  if (RENODX_TONE_MAP_TYPE) {
    output.rgb = renodx::draw::RenderIntermediatePass(output.rgb);
  }
  return max(output, float4(0, 0, 0, output.w));
}
