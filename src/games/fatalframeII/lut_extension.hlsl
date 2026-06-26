#include "./shared.h"

#ifndef LUT_EXTENSION_HLSL_
#define LUT_EXTENSION_HLSL_

#ifndef LUT_EXTENSION_SAMPLE
#error "Define LUT_EXTENSION_SAMPLE(color) before including lut_extension.hlsl"
#endif

// Generic black-box LUT shoulder extension.
//
// Include contract:
//   #define LUT_EXTENSION_SAMPLE(color) YourLUTSampleFunction((color), ...)
//   YourLUTSampleFunction can be anything, as long as it's linear in/out BT709.
//   #include "lut_extension.hlsl"
//   #undef LUT_EXTENSION_SAMPLE
//
// Runtime helpers:
//   SampleHDRLUTShoulderExtended(color)           - luminance-preserving shoulder
//   SampleHDRLUTShoulderExtendedPerChannel(color) - independent RGB shoulder
//
// Calibrate LUT_EXTENSION_SHOULDER offline with lut-analyzer.

#ifndef USE_YF_LUMINANCE
#define USE_YF_LUMINANCE 1
#endif

float LuminanceFromBT709(float3 color) {
#if USE_YF_LUMINANCE
  return renodx::color::yf::from::BT709(color);
#else
  return renodx::color::y::from::BT709(color);
#endif
}

static const float kLUTExtensionMidB = 0.18f;

// x = input start, y = extension slope, z = LUT output at start.
#ifndef LUT_EXTENSION_SHOULDER
#define LUT_EXTENSION_SHOULDER float3(0.286689, 1.880185, 0.477661f)
#endif

#ifndef LUT_EXTENSION_SHOULDER_START_RGB
#define LUT_EXTENSION_SHOULDER_START_RGB                                       \
  float3((LUT_EXTENSION_SHOULDER).x, (LUT_EXTENSION_SHOULDER).x,               \
         (LUT_EXTENSION_SHOULDER).x)
#endif

#ifndef LUT_EXTENSION_SHOULDER_SLOPE_RGB
#define LUT_EXTENSION_SHOULDER_SLOPE_RGB                                       \
  float3((LUT_EXTENSION_SHOULDER).y, (LUT_EXTENSION_SHOULDER).y,               \
         (LUT_EXTENSION_SHOULDER).y)
#endif

#ifndef LUT_EXTENSION_SHOULDER_OUTPUT_RGB
#define LUT_EXTENSION_SHOULDER_OUTPUT_RGB                                      \
  float3((LUT_EXTENSION_SHOULDER).z, (LUT_EXTENSION_SHOULDER).z,               \
         (LUT_EXTENSION_SHOULDER).z)
#endif

void GetLUTShoulderParamsRGB(out float3 start, out float3 slope,
                             out float3 output_at_start) {
  start = LUT_EXTENSION_SHOULDER_START_RGB;
  slope = LUT_EXTENSION_SHOULDER_SLOPE_RGB;
  output_at_start = LUT_EXTENSION_SHOULDER_OUTPUT_RGB;
}

float3 SampleHDRLUTShoulderExtendedPerChannel(float3 untonemapped) {
  float3 base_bt709 = LUT_EXTENSION_SAMPLE(untonemapped);
  const float kEpsilon = 1e-6f;

  if (max(untonemapped.r, max(untonemapped.g, untonemapped.b)) <=
      kLUTExtensionMidB) {
    return base_bt709;
  }

  float3 start;
  float3 slope;
  float3 output_at_start;
  GetLUTShoulderParamsRGB(start, slope, output_at_start);
  float3 extended_bt709 = output_at_start + slope * (untonemapped - start);
  float3 use_extended = step(start, untonemapped) * step(kEpsilon, slope);
  return lerp(base_bt709, extended_bt709, use_extended);
}

float3 SampleHDRLUTShoulderExtended(float3 untonemapped) {
  float3 base_bt709 = LUT_EXTENSION_SAMPLE(untonemapped);
  const float kEpsilon = 1e-6f;

  float input_luminance = LuminanceFromBT709(untonemapped);
  float3 shoulder = LUT_EXTENSION_SHOULDER;

  if (input_luminance > kLUTExtensionMidB) {
    if (input_luminance > shoulder.x && shoulder.y > kEpsilon) {
      float extended_luminance =
          shoulder.z + shoulder.y * (input_luminance - shoulder.x);
      float base_luminance = LuminanceFromBT709(base_bt709);
      float scale = extended_luminance / max(base_luminance, kEpsilon);
      return base_bt709 * scale;
    }
  }

  return base_bt709;
}

#endif // LUT_EXTENSION_HLSL_
