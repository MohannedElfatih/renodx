#include "./shared.h"

#ifndef LUT_EXTENSION_HLSL_
#define LUT_EXTENSION_HLSL_

#ifndef LUT_EXTENSION_SAMPLE
#error "Define LUT_EXTENSION_SAMPLE(color) before including lut_extension.hlsl"
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_HARDCODED
#define CUSTOM_HDR_LUT_SHOULDER_HARDCODED 0
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_PARAMS
#define CUSTOM_HDR_LUT_SHOULDER_PARAMS float3(0.4472f, 0.8562f, 0.3463f)
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_START
#define CUSTOM_HDR_LUT_SHOULDER_START CUSTOM_HDR_LUT_SHOULDER_PARAMS.x
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_SLOPE
#define CUSTOM_HDR_LUT_SHOULDER_SLOPE CUSTOM_HDR_LUT_SHOULDER_PARAMS.y
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_Y
#define CUSTOM_HDR_LUT_SHOULDER_Y CUSTOM_HDR_LUT_SHOULDER_PARAMS.z
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_BLEND_MIN
#define CUSTOM_HDR_LUT_SHOULDER_BLEND_MIN 0.020f
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_BLEND_MAX
#define CUSTOM_HDR_LUT_SHOULDER_BLEND_MAX 0.080f
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_BLEND_SCALE
#define CUSTOM_HDR_LUT_SHOULDER_BLEND_SCALE 1.0f
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT
#define CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT 10.f
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_PER_CHANNEL_HARDCODED
#define CUSTOM_HDR_LUT_SHOULDER_PER_CHANNEL_HARDCODED 0
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_PARAMS_RED_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_PARAMS_RED_CHANNEL float3(0.5067, 0.7721, 0.3896)
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_START_RED_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_START_RED_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_RED_CHANNEL.x
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_SLOPE_RED_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_SLOPE_RED_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_RED_CHANNEL.y
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_Y_RED_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_Y_RED_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_RED_CHANNEL.z
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_PARAMS_GREEN_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_PARAMS_GREEN_CHANNEL float3(0.4472f, 0.8550f, 0.3463f)
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_START_GREEN_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_START_GREEN_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_GREEN_CHANNEL.x
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_SLOPE_GREEN_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_SLOPE_GREEN_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_GREEN_CHANNEL.y
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_Y_GREEN_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_Y_GREEN_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_GREEN_CHANNEL.z
#endif

#ifndef CUSTOM_HDR_LUT_SHOULDER_PARAMS_BLUE_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_PARAMS_BLUE_CHANNEL float3(0.4472f, 0.8550f, 0.3463f)
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_START_BLUE_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_START_BLUE_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_BLUE_CHANNEL.x
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_SLOPE_BLUE_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_SLOPE_BLUE_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_BLUE_CHANNEL.y
#endif
#ifndef CUSTOM_HDR_LUT_SHOULDER_Y_BLUE_CHANNEL
#define CUSTOM_HDR_LUT_SHOULDER_Y_BLUE_CHANNEL CUSTOM_HDR_LUT_SHOULDER_PARAMS_BLUE_CHANNEL.z
#endif

float SampleLUTLuminanceCurve(float x) {
  float3 y = LUT_EXTENSION_SAMPLE(float3(x, x, x));
  return renodx::color::y::from::BT709(y);
}

float4 EstimateLUTShoulderParams(float y_limit) {
  const float kEpsilon = 1e-6f;
  const int kSamples = 25;
  const int kConsecutiveNeeded = 3;

  float x_min = clamp(max(y_limit * 0.01f, 0.03f), 0.03f, 0.20f);
  float x_max = clamp(max(y_limit, x_min * 4.f), 0.50f, 2.00f);
  if (x_max <= x_min + kEpsilon) {
    return float4(0.f, 0.f, 0.f, 0.f);
  }

  float xs[kSamples];
  float ys[kSamples];
  float slopes[kSamples];
  float concavities[kSamples];

  float growth = pow(x_max / x_min, 1.f / (kSamples - 1));
  float x = x_min;
  [unroll]
  for (int i = 0; i < kSamples; ++i) {
    xs[i] = x;
    ys[i] = SampleLUTLuminanceCurve(x);
    x *= growth;
  }

  float max_slope = 0.f;
  int max_slope_index = 1;
  [unroll]
  for (int i1 = 1; i1 < kSamples - 1; ++i1) {
    float dx = max(xs[i1 + 1] - xs[i1 - 1], kEpsilon);
    float m = (ys[i1 + 1] - ys[i1 - 1]) / dx;
    slopes[i1] = m;
    if (m > max_slope) {
      max_slope = m;
      max_slope_index = i1;
    }

    float m_lo = (ys[i1] - ys[i1 - 1]) / max(xs[i1] - xs[i1 - 1], kEpsilon);
    float m_hi = (ys[i1 + 1] - ys[i1]) / max(xs[i1 + 1] - xs[i1], kEpsilon);
    float dx_mid = max(0.5f * (xs[i1 + 1] - xs[i1 - 1]), kEpsilon);
    concavities[i1] = (m_hi - m_lo) / dx_mid;
  }

  if (max_slope <= kEpsilon) {
    return float4(0.f, 0.f, 0.f, 0.f);
  }

  float slope_gate = max_slope * 0.82f;
  float mid_slope_sum = 0.f;
  float mid_slope_count = 0.f;
  [unroll]
  for (int i2 = 1; i2 < kSamples - 1; ++i2) {
    float m = slopes[i2];
    if (m >= slope_gate) {
      mid_slope_sum += m;
      mid_slope_count += 1.f;
    }
  }
  float m_mid = mid_slope_count > 0.f ? (mid_slope_sum / mid_slope_count) : max_slope;
  m_mid = max(m_mid, 0.f);
  if (m_mid <= kEpsilon) {
    return float4(0.f, 0.f, 0.f, 0.f);
  }

  float shoulder_start = xs[max_slope_index];
  float y_shoulder = ys[max_slope_index];
  float shoulder_slope = m_mid;
  bool found = false;
  int run = 0;
  int run_start = 1;
  float drop_gate = 0.88f * m_mid;

  [unroll]
  for (int i3 = max_slope_index + 1; i3 < kSamples - 1; ++i3) {
    float local_curve_gate = -0.015f * m_mid / max(xs[i3], 0.05f);
    bool slope_dropped = slopes[i3] < drop_gate;
    bool curvature_negative = concavities[i3] < local_curve_gate;
    if (slope_dropped && curvature_negative) {
      if (run == 0) {
        run_start = i3;
      }
      run += 1;
      if (run >= kConsecutiveNeeded) {
        int shoulder_index = run_start;
        int pre_index = max(1, shoulder_index - 1);
        shoulder_start = xs[shoulder_index];
        y_shoulder = ys[shoulder_index];
        shoulder_slope = max(slopes[pre_index], 0.f);
        found = true;
        break;
      }
    } else {
      run = 0;
    }
  }

  return float4(shoulder_start, shoulder_slope, y_shoulder, found ? 1.f : 0.f);
}

float SampleLUTCurveChannel(float x, int channel) {
  float3 y = LUT_EXTENSION_SAMPLE(float3(x, x, x));
  if (channel == 0) return y.r;
  if (channel == 1) return y.g;
  return y.b;
}

float ComputeShoulderBlendWidth(float shoulder_start, float shoulder_slope, float y_shoulder) {
  const float kEpsilon = 1e-6f;
  float shoulder_span_from_slope = y_shoulder / max(shoulder_slope, kEpsilon);
  float shoulder_span_from_start = shoulder_start * 0.14f;
  float blend_width = 0.5f * (shoulder_span_from_slope + shoulder_span_from_start);
  blend_width *= CUSTOM_HDR_LUT_SHOULDER_BLEND_SCALE;
  return clamp(blend_width, CUSTOM_HDR_LUT_SHOULDER_BLEND_MIN, CUSTOM_HDR_LUT_SHOULDER_BLEND_MAX);
}

float4 EstimateLUTShoulderParamsChannel(float x_limit, int channel) {
  const float kEpsilon = 1e-6f;
  const int kSamples = 25;
  const int kConsecutiveNeeded = 3;

  float x_min = clamp(max(x_limit * 0.01f, 0.03f), 0.03f, 0.20f);
  float x_max = clamp(max(x_limit, x_min * 4.f), 0.50f, 2.00f);
  if (x_max <= x_min + kEpsilon) {
    return float4(0.f, 0.f, 0.f, 0.f);
  }

  float xs[kSamples];
  float ys[kSamples];
  float slopes[kSamples];
  float concavities[kSamples];

  float growth = pow(x_max / x_min, 1.f / (kSamples - 1));
  float x = x_min;
  [unroll]
  for (int i = 0; i < kSamples; ++i) {
    xs[i] = x;
    ys[i] = SampleLUTCurveChannel(x, channel);
    x *= growth;
  }

  float max_slope = 0.f;
  int max_slope_index = 1;
  [unroll]
  for (int c1 = 1; c1 < kSamples - 1; ++c1) {
    float dx = max(xs[c1 + 1] - xs[c1 - 1], kEpsilon);
    float m = (ys[c1 + 1] - ys[c1 - 1]) / dx;
    slopes[c1] = m;
    if (m > max_slope) {
      max_slope = m;
      max_slope_index = c1;
    }

    float m_lo = (ys[c1] - ys[c1 - 1]) / max(xs[c1] - xs[c1 - 1], kEpsilon);
    float m_hi = (ys[c1 + 1] - ys[c1]) / max(xs[c1 + 1] - xs[c1], kEpsilon);
    float dx_mid = max(0.5f * (xs[c1 + 1] - xs[c1 - 1]), kEpsilon);
    concavities[c1] = (m_hi - m_lo) / dx_mid;
  }

  if (max_slope <= kEpsilon) {
    return float4(0.f, 0.f, 0.f, 0.f);
  }

  float slope_gate = max_slope * 0.82f;
  float mid_slope_sum = 0.f;
  float mid_slope_count = 0.f;
  [unroll]
  for (int c2 = 1; c2 < kSamples - 1; ++c2) {
    float m = slopes[c2];
    if (m >= slope_gate) {
      mid_slope_sum += m;
      mid_slope_count += 1.f;
    }
  }
  float m_mid = mid_slope_count > 0.f ? (mid_slope_sum / mid_slope_count) : max_slope;
  m_mid = max(m_mid, 0.f);
  if (m_mid <= kEpsilon) {
    return float4(0.f, 0.f, 0.f, 0.f);
  }

  float shoulder_start = xs[max_slope_index];
  float y_shoulder = ys[max_slope_index];
  float shoulder_slope = m_mid;
  bool found = false;
  int run = 0;
  int run_start = 1;
  float drop_gate = 0.88f * m_mid;

  [unroll]
  for (int c3 = max_slope_index + 1; c3 < kSamples - 1; ++c3) {
    float local_curve_gate = -0.015f * m_mid / max(xs[c3], 0.05f);
    bool slope_dropped = slopes[c3] < drop_gate;
    bool curvature_negative = concavities[c3] < local_curve_gate;
    if (slope_dropped && curvature_negative) {
      if (run == 0) {
        run_start = c3;
      }
      run += 1;
      if (run >= kConsecutiveNeeded) {
        int shoulder_index = run_start;
        int pre_index = max(1, shoulder_index - 1);
        shoulder_start = xs[shoulder_index];
        y_shoulder = ys[shoulder_index];
        shoulder_slope = max(slopes[pre_index], 0.f);
        found = true;
        break;
      }
    } else {
      run = 0;
    }
  }

  return float4(shoulder_start, shoulder_slope, y_shoulder, found ? 1.f : 0.f);
}

float3 SampleHDRLUTShoulderExtendedPerChannel(float3 untonemapped) {
  float3 base = LUT_EXTENSION_SAMPLE(untonemapped);
  const float kEpsilon = 1e-6f;
  const float kMidB = 0.36f;
  float3 x_in = max(untonemapped, 0.f);
  float3 out_color = base;

  if (max(x_in.r, max(x_in.g, x_in.b)) <= kMidB) {
    return base;
  }

  if (x_in.r > kMidB) {
#if CUSTOM_HDR_LUT_SHOULDER_PER_CHANNEL_HARDCODED
    float start_r = CUSTOM_HDR_LUT_SHOULDER_START_RED_CHANNEL;
    float slope_r = max(CUSTOM_HDR_LUT_SHOULDER_SLOPE_RED_CHANNEL, 0.f);
    float y_r = max(CUSTOM_HDR_LUT_SHOULDER_Y_RED_CHANNEL, 0.f);
    if (slope_r > kEpsilon) {
      float blend_width_r = ComputeShoulderBlendWidth(start_r, slope_r, y_r);
      float r_extended = max(y_r + slope_r * (x_in.r - start_r), 0.f);
      float r_blend = smoothstep(start_r - blend_width_r, start_r + blend_width_r, x_in.r);
      out_color.r = lerp(base.r, r_extended, r_blend);
    }
#else
    float4 pr = EstimateLUTShoulderParamsChannel(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT, 0);
    if (pr.y > kEpsilon) {
      float blend_width_r = ComputeShoulderBlendWidth(pr.x, pr.y, pr.z);
      float r_extended = max(pr.z + pr.y * (x_in.r - pr.x), 0.f);
      float r_blend = smoothstep(pr.x - blend_width_r, pr.x + blend_width_r, x_in.r);
      out_color.r = lerp(base.r, r_extended, r_blend);
    }
#endif
  }

  if (x_in.g > kMidB) {
#if CUSTOM_HDR_LUT_SHOULDER_PER_CHANNEL_HARDCODED
    float start_g = CUSTOM_HDR_LUT_SHOULDER_START_GREEN_CHANNEL;
    float slope_g = max(CUSTOM_HDR_LUT_SHOULDER_SLOPE_GREEN_CHANNEL, 0.f);
    float y_g = max(CUSTOM_HDR_LUT_SHOULDER_Y_GREEN_CHANNEL, 0.f);
    if (slope_g > kEpsilon) {
      float blend_width_g = ComputeShoulderBlendWidth(start_g, slope_g, y_g);
      float g_extended = max(y_g + slope_g * (x_in.g - start_g), 0.f);
      float g_blend = smoothstep(start_g - blend_width_g, start_g + blend_width_g, x_in.g);
      out_color.g = lerp(base.g, g_extended, g_blend);
    }
#else
    float4 pg = EstimateLUTShoulderParamsChannel(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT, 1);
    if (pg.y > kEpsilon) {
      float blend_width_g = ComputeShoulderBlendWidth(pg.x, pg.y, pg.z);
      float g_extended = max(pg.z + pg.y * (x_in.g - pg.x), 0.f);
      float g_blend = smoothstep(pg.x - blend_width_g, pg.x + blend_width_g, x_in.g);
      out_color.g = lerp(base.g, g_extended, g_blend);
    }
#endif
  }

  if (x_in.b > kMidB) {
#if CUSTOM_HDR_LUT_SHOULDER_PER_CHANNEL_HARDCODED
    float start_b = CUSTOM_HDR_LUT_SHOULDER_START_BLUE_CHANNEL;
    float slope_b = max(CUSTOM_HDR_LUT_SHOULDER_SLOPE_BLUE_CHANNEL, 0.f);
    float y_b = max(CUSTOM_HDR_LUT_SHOULDER_Y_BLUE_CHANNEL, 0.f);
    if (slope_b > kEpsilon) {
      float blend_width_b = ComputeShoulderBlendWidth(start_b, slope_b, y_b);
      float b_extended = max(y_b + slope_b * (x_in.b - start_b), 0.f);
      float b_blend = smoothstep(start_b - blend_width_b, start_b + blend_width_b, x_in.b);
      out_color.b = lerp(base.b, b_extended, b_blend);
    }
#else
    float4 pb = EstimateLUTShoulderParamsChannel(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT, 2);
    if (pb.y > kEpsilon) {
      float blend_width_b = ComputeShoulderBlendWidth(pb.x, pb.y, pb.z);
      float b_extended = max(pb.z + pb.y * (x_in.b - pb.x), 0.f);
      float b_blend = smoothstep(pb.x - blend_width_b, pb.x + blend_width_b, x_in.b);
      out_color.b = lerp(base.b, b_extended, b_blend);
    }
#endif
  }

  return out_color;
}

float3 SampleHDRLUTShoulderExtended(float3 untonemapped) {
  float3 base = LUT_EXTENSION_SAMPLE(untonemapped);
  const float kEpsilon = 1e-6f;
  const float kMidB = 0.36f;

  float y_input = renodx::color::y::from::BT709(untonemapped);
  if (y_input <= kMidB) {
    return base;
  }

#if CUSTOM_HDR_LUT_SHOULDER_HARDCODED
  const float shoulder_start = CUSTOM_HDR_LUT_SHOULDER_START;
  const float m_mid = max(CUSTOM_HDR_LUT_SHOULDER_SLOPE, 0.f);
  const float y_shoulder = max(CUSTOM_HDR_LUT_SHOULDER_Y, 0.f);
  if (y_input <= shoulder_start || m_mid <= kEpsilon) {
    return base;
  }
#else
  float4 params = EstimateLUTShoulderParams(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT);
  float shoulder_start = params.x;
  float m_mid = params.y;
  float y_shoulder = params.z;
  if (y_input <= shoulder_start || m_mid <= kEpsilon) {
    return base;
  }
#endif

  float y_extended = max(y_shoulder + m_mid * (y_input - shoulder_start), 0.f);
  float y_base = renodx::color::y::from::BT709(base);
  float blend_width = ComputeShoulderBlendWidth(shoulder_start, m_mid, y_shoulder);
  float blend = smoothstep(shoulder_start - blend_width, shoulder_start + blend_width, y_input);
  float y_target = lerp(y_base, y_extended, blend);
  float scale = y_target / max(y_base, kEpsilon);
  return base * scale;
}

float4 LUTShoulderSelfCheckColor() {
  float4 measured = EstimateLUTShoulderParams(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT);
  float3 hardcoded = float3(
      CUSTOM_HDR_LUT_SHOULDER_START,
      CUSTOM_HDR_LUT_SHOULDER_SLOPE,
      CUSTOM_HDR_LUT_SHOULDER_Y);
  float3 abs_error = abs(hardcoded - measured.xyz);
  float3 scaled_error = saturate(abs_error / float3(0.05f, 0.05f, 0.03f));
  return float4(scaled_error, measured.w > 0.5f ? 1.f : 0.f);
}

float4 LUTShoulderCalibrateColor() {
  float4 shoulder_params = EstimateLUTShoulderParams(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT);
  return float4(shoulder_params.rgb, 1.f);
}

float3 DrawLUTShoulderUtility(float2 pixel_pos, float2 viewport_size, float3 color) {
  const float2 panel_size = float2(560.f, 250.f);
  const float2 panel_margin = float2(20.f, 20.f);
  float2 panel_min = float2(panel_margin.x, viewport_size.y - panel_size.y - panel_margin.y);
  float2 panel_max = panel_min + panel_size;
  // Unity flips after this pass. Pre-flip canvas Y so text is upright after presentation.
  float2 canvas_pos = float2(pixel_pos.x, viewport_size.y - pixel_pos.y);

  if (!renodx::canvas::TestRectCoverage(canvas_pos, panel_min, panel_max)) {
    return color;
  }

  float4 shoulder = EstimateLUTShoulderParams(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT);
  float4 shoulder_r = EstimateLUTShoulderParamsChannel(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT, 0);
  float4 shoulder_g = EstimateLUTShoulderParamsChannel(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT, 1);
  float4 shoulder_b = EstimateLUTShoulderParamsChannel(CUSTOM_HDR_LUT_SHOULDER_SCAN_LIMIT, 2);
  float blend_y = ComputeShoulderBlendWidth(shoulder.x, shoulder.y, shoulder.z);
  float blend_r = ComputeShoulderBlendWidth(shoulder_r.x, shoulder_r.y, shoulder_r.z);
  float blend_g = ComputeShoulderBlendWidth(shoulder_g.x, shoulder_g.y, shoulder_g.z);
  float blend_b = ComputeShoulderBlendWidth(shoulder_b.x, shoulder_b.y, shoulder_b.z);

  renodx::canvas::Context canvas = renodx::canvas::CreateContext(
      canvas_pos,
      panel_min + float2(16.f, 14.f),
      float2(10.f, 16.f),
      color,
      1.f);
  renodx::canvas::SetLineHeight(canvas, 1.2f);

  renodx::canvas::SetColor(canvas, 0x0E141F, 0.86f);
  renodx::canvas::FillRect(canvas, panel_min, panel_max);

  renodx::canvas::SetColor(canvas, 0x304A66, 0.95f);
  renodx::canvas::FillRect(canvas, panel_min, float2(panel_max.x, panel_min.y + 2.f));
  renodx::canvas::FillRect(canvas, float2(panel_min.x, panel_max.y - 2.f), panel_max);
  renodx::canvas::FillRect(canvas, panel_min, float2(panel_min.x + 2.f, panel_max.y));
  renodx::canvas::FillRect(canvas, float2(panel_max.x - 2.f, panel_min.y), panel_max);

  renodx::canvas::SetColor(canvas, 0xD3E1F2, 1.f);
  renodx::canvas::DrawText(canvas, 'L', 'U', 'T', ' ', 'S', 'h', 'o', 'u', 'l', 'd', 'e', 'r', ' ');
  renodx::canvas::DrawText(canvas, 'D', 'e', 'b', 'u', 'g');
  renodx::canvas::NewLine(canvas);

  renodx::canvas::SetColor(canvas, 0x8CB3D9, 1.f);
  renodx::canvas::DrawText(canvas, 'Y', ' ', 'S', 't', 'a', 'r', 't', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder.x, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'S', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder.y, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'Y', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder.z, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'B', ':', ' ');
  renodx::canvas::DrawFloat(canvas, blend_y, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'F', ':', ' ');
  renodx::canvas::DrawText(canvas, shoulder.w > 0.5f ? 'Y' : 'N');
  renodx::canvas::NewLine(canvas);

  renodx::canvas::DrawText(canvas, 'R', ' ', 'S', 't', 'a', 'r', 't', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_r.x, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'S', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_r.y, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'Y', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_r.z, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'B', ':', ' ');
  renodx::canvas::DrawFloat(canvas, blend_r, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'F', ':', ' ');
  renodx::canvas::DrawText(canvas, shoulder_r.w > 0.5f ? 'Y' : 'N');
  renodx::canvas::NewLine(canvas);

  renodx::canvas::DrawText(canvas, 'G', ' ', 'S', 't', 'a', 'r', 't', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_g.x, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'S', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_g.y, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'Y', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_g.z, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'B', ':', ' ');
  renodx::canvas::DrawFloat(canvas, blend_g, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'F', ':', ' ');
  renodx::canvas::DrawText(canvas, shoulder_g.w > 0.5f ? 'Y' : 'N');
  renodx::canvas::NewLine(canvas);

  renodx::canvas::DrawText(canvas, 'B', ' ', 'S', 't', 'a', 'r', 't', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_b.x, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'S', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_b.y, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'Y', ':', ' ');
  renodx::canvas::DrawFloat(canvas, shoulder_b.z, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'B', ':', ' ');
  renodx::canvas::DrawFloat(canvas, blend_b, 1.f, 4.f);
  renodx::canvas::DrawText(canvas, ' ', 'F', ':', ' ');
  renodx::canvas::DrawText(canvas, shoulder_b.w > 0.5f ? 'Y' : 'N');

  return renodx::canvas::GetOutput(canvas).rgb;
}
#endif  // LUT_EXTENSION_HLSL_
