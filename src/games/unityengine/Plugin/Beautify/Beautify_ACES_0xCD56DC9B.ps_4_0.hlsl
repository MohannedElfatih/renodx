#include "../../common.hlsl"

Texture2D<float4> t4 : register(t4);
Texture2D<float4> t3 : register(t3);
Texture2D<float4> t2 : register(t2);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t0 : register(t0);
SamplerState s4_s : register(s4);
SamplerState s3_s : register(s3);
SamplerState s2_s : register(s2);
SamplerState s1_s : register(s1);
SamplerState s0_s : register(s0);
cbuffer cb1 : register(b1){
  float4 cb1[8];
}
cbuffer cb0 : register(b0){
  float4 cb0[22];
}

float3 vanillaNarkACES(float3 color) {
  const float a = 2.51f;
  const float b = 0.03f;
  const float c = 2.43f;
  const float d = 0.59f;
  const float e = 0.14f;
  float3 exposed_color = cb0[5].xxx * color;
  return (exposed_color * (a * exposed_color + b)) / (exposed_color * (c * exposed_color + d) + e);
}

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD2,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  r1.xw = float2(0,0);
  r1.yz = cb0[2].yx;
  r2.xyz = v2.xyw + -r1.xyx;
  r2.xyzw = t1.SampleLevel(s1_s, r2.xy, r2.z).xyzw;
  r2.x = cb1[7].x * r2.x + cb1[7].y;
  r2.x = 1 / r2.x;
  r2.yzw = v2.xyw + -r1.zww;
  r3.xyzw = t1.SampleLevel(s1_s, r2.yz, r2.w).xyzw;
  r2.y = cb1[7].x * r3.x + cb1[7].y;
  r2.y = 1 / r2.y;
  r3.xyz = v2.xyw + r1.zww;
  r3.xyzw = t1.SampleLevel(s1_s, r3.xy, r3.z).xyzw;
  r2.z = cb1[7].x * r3.x + cb1[7].y;
  r2.z = 1 / r2.z;
  r3.xyz = v2.xyw + r1.xyx;
  r3.xyzw = t1.SampleLevel(s1_s, r3.xy, r3.z).xyzw;
  r2.w = cb1[7].x * r3.x + cb1[7].y;
  r2.w = 1 / r2.w;
  r3.x = renodx::color::y::from::NTSC1953(r0.xyz);
  r3.yzw = saturate(r0.xyz);
  r3.yzw = float3(1,1,1) + -r3.yzw;
  r4.xyz = r3.zyy * r0.xyz;
  r3.yzw = r4.xyz * r3.wwz;
  r3.yzw = r3.yzw * cb0[5].www + float3(1,1,1);
  r0.xyz = r3.yzw * r0.xyz;
  r3.y = renodx::color::y::from::NTSC1953(r0.xyz);
  r3.y = 9.99999975e-05 + r3.y;
  r3.y = r3.x / r3.y;
  r0.xyz = r3.yyy * r0.xyz;
  r3.y = max(r2.w, r2.x);
  r3.y = max(r3.y, r2.y);
  r3.y = max(r3.y, r2.z);
  r2.x = min(r2.w, r2.x);
  r2.x = min(r2.x, r2.y);
  r2.x = min(r2.x, r2.z);
  r2.x = r3.y + -r2.x;
  r2.x = 9.99999975e-06 + r2.x;
  r2.x = saturate(cb0[6].y / r2.x);
  r4.xyzw = v1.xyxy + -r1.xyzw;
  r5.xyzw = t0.Sample(s0_s, r4.xy).xyzw;
  r4.xyzw = t0.Sample(s0_s, r4.zw).xyzw;
  r1.xyzw = v1.xyxy + r1.zwxy;
  r6.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r1.x = renodx::color::y::from::NTSC1953(r1.xyz);
  r1.y = renodx::color::y::from::NTSC1953(r6.xyz);
  r1.z = renodx::color::y::from::NTSC1953(r4.xyz);
  r1.w = renodx::color::y::from::NTSC1953(r5.xyz);
  r2.z = max(r1.x, r1.w);
  r2.z = max(r2.z, r1.z);
  r2.z = max(r2.z, r1.y);
  r1.x = min(r1.x, r1.w);
  r1.x = min(r1.x, r1.z);
  r1.x = min(r1.x, r1.y);
  r1.x = -9.99999997e-07 + r1.x;
  r1.y = r3.x * 2 + -r1.x;
  r1.y = r1.y + -r2.z;
  r1.x = r2.z + -r1.x;
  r1.x = saturate(cb0[6].w / r1.x);
  r1.z = -cb0[7].z + r2.y;
  r1.z = cb0[7].w / abs(r1.z);
  /*r1.w = cmp(1 < r1.z);
  r1.w = r1.w ? 1.000000 : 0;*/
  r1.w = step(1, r1.z);
  r1.z = saturate(cb0[14].x * r1.z);
  r1.z = max(r1.w, r1.z);
  r1.x = r1.y * r1.x;
  r1.x = r1.x * r2.x;
  r1.x = cb0[6].x * r1.x;
  r1.x = max(-cb0[6].z, r1.x);
  r1.x = min(cb0[6].z, r1.x);
  r1.x = r1.x * r1.z + 1;
  r1.yzw = r1.xxx * r0.xyz;
  r3.xyzw = t2.Sample(s4_s, v1.xy).wxyz;
  //r2.x = cmp(cb0[21].z < cb0[2].z);
  if (cb0[21].z < cb0[2].z) {
    r4.xyzw = t1.SampleLevel(s1_s, v2.xy, v2.w).xyzw;
    r2.x = cb1[7].z * r4.x + cb1[7].w;
    r2.x = 1 / r2.x;
    r2.z = -cb0[17].x + r2.x;
    /*r2.w = cmp(r2.x < cb0[17].x);
    r2.w = r2.w ? 1.000000 : 0;*/
    r2.w = step(r2.x, cb0[17].x);
    r2.z = -cb0[18].x * r2.w + abs(r2.z);
    r2.z = cb0[17].y * r2.z;
    r2.z = 0.5 * r2.z;
    r2.x = r2.z / r2.x;
    r2.z = cb0[21].z / cb0[2].z;
    r2.w = r3.x + -r2.x;
    r3.x = r2.z * r2.w + r2.x;
  }
  r3.x = saturate(r3.x);
  r0.xyz = -r0.xyz * r1.xxx + r3.yzw;
  r0.xyz = r3.xxx * r0.xyz + r1.yzw;
  r1.xyzw = t3.Sample(s2_s, v1.xy).xyzw;
  r0.xyz = r1.xyz * cb0[12].xxx * injectedData.fxBloom + r0.xyz;
  r1.xyzw = t4.Sample(s3_s, float2(0.5,0.5)).xyzw;
  /*r0.xyz = cb0[5].xxx * r0.xyz;
  r1.xzw = r0.xyz * float3(2.50999999,2.50999999,2.50999999) + float3(0.0299999993,0.0299999993,0.0299999993);
  r1.xzw = r1.xzw * r0.xyz;
  r2.xzw = r0.xyz * float3(2.43000007,2.43000007,2.43000007) + float3(0.589999974,0.589999974,0.589999974);
  r0.xyz = r0.xyz * r2.xzw + float3(0.140000001,0.140000001,0.140000001);
  r0.xyz = r1.xzw / r0.xyz;*/
  float midGray = vanillaNarkACES(float3(0.18f, 0.18f, 0.18f)).x;
  float3 hueCorrectionColor = vanillaNarkACES(r0.xyz);
  renodx::tonemap::Config config = renodx::tonemap::config::Create();
  config.type = min(3, injectedData.toneMapType);
  config.peak_nits = injectedData.toneMapPeakNits;
  config.game_nits = injectedData.toneMapGameNits;
  config.gamma_correction = injectedData.toneMapGammaCorrection;
  config.exposure = injectedData.colorGradeExposure;
  config.highlights = injectedData.colorGradeHighlights;
  config.shadows = injectedData.colorGradeShadows;
  config.contrast = injectedData.colorGradeContrast;
  config.saturation = injectedData.colorGradeSaturation;
  config.mid_gray_value = midGray;
  config.mid_gray_nits = midGray * 100;
  config.reno_drt_shadows = 0.95f;
  config.reno_drt_contrast = 1.45f;
  config.reno_drt_dechroma = injectedData.colorGradeDechroma;
  config.reno_drt_flare = 0.10f * pow(injectedData.colorGradeFlare, 10.f);
  config.hue_correction_type = injectedData.toneMapPerChannel != 0.f ? renodx::tonemap::config::hue_correction_type::INPUT
                                                                     : renodx::tonemap::config::hue_correction_type::CUSTOM;
  config.hue_correction_strength = injectedData.toneMapHueCorrection;
  config.hue_correction_color = lerp(r0.xyz, hueCorrectionColor, injectedData.toneMapHueShift);
  config.reno_drt_hue_correction_method = (int)injectedData.toneMapHueProcessor;
  config.reno_drt_tone_map_method = injectedData.toneMapType == 3.f ? renodx::tonemap::renodrt::config::tone_map_method::REINHARD
                                                                    : renodx::tonemap::renodrt::config::tone_map_method::DANIELE;
  config.reno_drt_working_color_space = 1;
  config.reno_drt_per_channel = injectedData.toneMapPerChannel != 0.f;
  config.reno_drt_blowout = 1.f - injectedData.colorGradeBlowout;
  config.reno_drt_white_clip = injectedData.colorGradeClip == 0.f ? 8.0f / cb0[5].x : injectedData.colorGradeClip;
  if(injectedData.toneMapType == 0.f){
    r0.xyz = hueCorrectionColor;
  }
  r0.xyz = renodx::tonemap::config::Apply(r0.xyz, config);
  r1.x = max(r0.y, r0.z);
  r1.x = max(r1.x, r0.x);
  r1.z = min(r0.y, r0.z);
  r1.z = min(r1.z, r0.x);
  r1.x = saturate(r1.x + -r1.z);
  r1.x = 1 + -r1.x;
  r1.x = cb0[5].z * r1.x;
  r1.z = renodx::color::y::from::NTSC1953(r0.xyz);
  r2.xzw = -r1.zzz + r0.xyz;
  r1.xzw = r1.xxx * r2.xzw + float3(1,1,1);
  r0.xyz = r1.xzw * r0.xyz;
  r1.xzw = r0.xyz * cb0[9].xyz + -r0.xyz;
  r0.xyz = cb0[9].www * r1.xzw + r0.xyz;
  r0.xyz = float3(-0.5,-0.5,-0.5) + r0.xyz;
  r0.xyz = r0.xyz * cb0[5].yyy + float3(0.5,0.5,0.5);
  r3.y = renodx::color::y::from::NTSC1953(r0.xyz);
  r1.xz = cb0[20].xx * float2(1.14,2.99) + float2(1,1);
  r3.x = r3.y / r1.x;
  r3.z = r3.y * r1.z;
  r1.xzw = saturate(r3.xyz);
  r1.y = 1.44269502 * r1.y;
  r1.y = exp2(r1.y);
  r1.y = saturate(-cb0[20].y + r1.y);
  r0.xyz = -r1.xzw + r0.xyz;
  r0.xyz = r1.yyy * r0.xyz + r1.xzw;
  r1.xy = float2(-0.5,-0.5) + w1.xy;
  r1.z = cb0[16].x * r1.x;
  r1.x = dot(r1.yz, r1.yz);
  r1.x = saturate(cb0[15].w * r1.x + cb0[20].z);
  r1.yzw = r3.yyy * cb0[15].xyz + -r0.xyz;
  r0.xyz = r1.xxx * r1.yzw + r0.xyz;
  r1.xy = cb1[6].xy * v1.xy;
  r1.x = dot(float2(171,231), r1.xy);
  r1.xyz = float3(0.00970873795,0.0140845068,0.010309278) * r1.xxx;
  r1.xyz = frac(r1.xyz);
  r1.xyz = float3(-0.5,-0.5,-0.5) + r1.xyz;
  /*r1.w = cmp(r2.y >= cb0[7].y);
  r1.w = r1.w ? 1.000000 : 0;*/
  r1.w = step(cb0[7].y, r2.y);
  r1.w = cb0[7].x * r1.w;
  r1.xyz = r1.www * r1.xyz + float3(1,1,1);
  o0.xyz = r1.xyz * r0.xyz;
  o0.w = r0.w;
  if (injectedData.countOld == injectedData.countNew) {
    o0.xyz = PostToneMapScale(o0.xyz);
  }
  return;
}