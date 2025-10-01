#include "../../tonemap.hlsl"

Texture2D<float4> t7 : register(t7);
Texture2D<float4> t6 : register(t6);
Texture2D<float4> t5 : register(t5);
Texture2D<float4> t4 : register(t4);
Texture2D<float4> t3 : register(t3);
Texture2D<float4> t2 : register(t2);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t0 : register(t0);
SamplerState s0_s : register(s0);
cbuffer cb0 : register(b0){
  float4 cb0[21];
}

float3 vanillaNeutral(float3 color) {
float a = cb0[19].x;
float b = cb0[19].y;
float c = cb0[19].z;
float d = cb0[19].w;
float e = cb0[20].x;
float f = cb0[20].y;
float w1 = cb0[20].z;
float w2 = cb0[20].w;

float scale = 1.0 / renodx::tonemap::ApplyCurve(w1, a, b, c, d, e, f);
return renodx::tonemap::ApplyCurve(max(0.f, color) * scale, a, b, c, d, e, f) * scale / w2;
}

float setNeutralParam(float4 params0, float4 params1) {
  if (params0.y == 0.11666669 && params0.z == 0.58571965 && params0.w == 0.428) return 1;      // Pathfinder WotR
  if (params0.y == 0.29000002 && params0.z == 0.21322903 && params0.w == 0.272) return 2;      // Pathfinder WotR
return 0;
}

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.yz = -cb0[0].yz + v1.xy;
  r1.x = cb0[0].x * r0.y;
  r0.x = frac(r1.x);
  r1.x = r0.x / cb0[0].x;
  r0.w = -r1.x + r0.y;
  r0.xyz = r0.xzw * cb0[0].www;
  r0.xyz = lutShaper(r0.xyz, true);
  float3 preCG = r0.xyz;
  r1.x = dot(float3(0.390405,0.549941,0.00892632), r0.xyz);
  r1.y = dot(float3(0.0708416,0.963172,0.00135775), r0.xyz);
  r1.z = dot(float3(0.0231082,0.128021,0.936245), r0.xyz);
  r0.xyz = cb0[1].xyz * r1.xyz;
  r1.x = dot(float3(2.858470,-1.628790,-0.024891), r0.xyz);
  r1.y = dot(float3(-0.210182,1.158200,0.000324281), r0.xyz);
  r1.z = dot(float3(-0.041812,-0.118169,1.068670), r0.xyz);
  r0.xyz = renodx::color::arri::logc::c1000::Encode(r1.xyz, true);
  r0.xyz = r0.xyz * cb0[10].xyz + cb0[12].xyz;
  r1.xyz = log2(abs(r0.xyz));
  r1.xyz = cb0[11].xyz * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r0.xyz = (r0.xyz > (0.0).xxx) ? r1.xyz : r0.xyz;
  r0.xyz = float3(-0.4135884,-0.4135884,-0.4135884) + r0.xyz;
  r0.xyz = r0.xyz * cb0[6].zzz + float3(0.4135884,0.4135884,0.4135884);
  r0.xyz = renodx::color::arri::logc::c1000::Decode(r0.xyz, true);
  r0.xyz = cb0[2].xyz * r0.xyz;
  bool isWCG = r0.x < 0.0 || r0.y < 0.0 || r0.z < 0.0;
  if(injectedData.toneMapType != 0.f){
    r0.xyz = isWCG ? renodx::color::ap1::from::BT709(r0.xyz) : r0.xyz;
  }
  r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.xyz = pow(r0.xyz, 1.f / 2.2f);
  r1.xyz = r0.xyz + r0.xyz;
  r2.xyz = r0.xyz * r0.xyz;
  r3.xyz = min(float3(1,1,1), r0.xyz);
  r0.xyz = sqrt(r0.xyz);
  r0.w = dot(r3.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.w = saturate(cb0[17].w + r0.w);
  r1.w = 1 + -r0.w;
  r3.xyz = float3(-0.5,-0.5,-0.5) + cb0[17].xyz;
  r3.xyz = r1.www * r3.xyz + float3(0.5,0.5,0.5);
  r4.xyz = -r3.xyz * float3(2,2,2) + float3(1,1,1);
  r2.xyz = r4.xyz * r2.xyz;
  r2.xyz = r1.xyz * r3.xyz + r2.xyz;
  r4.xyz = step(0.5, r3.xyz);
  r5.xyz = 1.0 - r4.xyz;
  r2.xyz = r5.xyz * r2.xyz;
  r5.xyz = float3(1,1,1) + -r3.xyz;
  r3.xyz = r3.xyz * float3(2,2,2) + float3(-1,-1,-1);
  r1.xyz = r5.xyz * r1.xyz;
  r0.xyz = r0.xyz * r3.xyz + r1.xyz;
  r0.xyz = r0.xyz * r4.xyz + r2.xyz;
  r1.xyz = r0.xyz + r0.xyz;
  r2.xyz = r0.xyz * r0.xyz;
  r0.xyz = sqrt(r0.xyz);
  r3.xyz = float3(-0.5,-0.5,-0.5) + cb0[18].xyz;
  r3.xyz = r0.www * r3.xyz + float3(0.5,0.5,0.5);
  r4.xyz = -r3.xyz * float3(2,2,2) + float3(1,1,1);
  r2.xyz = r4.xyz * r2.xyz;
  r2.xyz = r1.xyz * r3.xyz + r2.xyz;
  r4.xyz = step(0.5, r3.xyz);
  r5.xyz = 1.0 - r4.xyz;
  r2.xyz = r5.xyz * r2.xyz;
  r5.xyz = float3(1,1,1) + -r3.xyz;
  r3.xyz = r3.xyz * float3(2,2,2) + float3(-1,-1,-1);
  r1.xyz = r5.xyz * r1.xyz;
  r0.xyz = r0.xyz * r3.xyz + r1.xyz;
  r0.xyz = r0.xyz * r4.xyz + r2.xyz;
  r0.xyz = pow(abs(r0.xyz), 2.2f);
  r1.x = dot(r0.xyz, cb0[3].xyz);
  r1.y = dot(r0.xyz, cb0[4].xyz);
  r1.z = dot(r0.xyz, cb0[5].xyz);
  r0.xyz = cb0[14].xyz * r1.xyz;
  r0.w = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r2.xy = -cb0[16].xz + r0.ww;
  r2.zw = cb0[16].yw + -cb0[16].xz;
  r2.zw = float2(1,1) / r2.zw;
  r2.xy = saturate(r2.xy * r2.zw);
  r2.zw = r2.xy * float2(-2,-2) + float2(3,3);
  r2.xy = r2.xy * r2.xy;
  r0.w = -r2.z * r2.x + 1;
  r1.w = 1 + -r0.w;
  r1.w = -r2.w * r2.y + r1.w;
  r2.x = r2.w * r2.y;
  r0.xyz = r1.www * r0.xyz;
  r2.yzw = cb0[13].xyz * r1.xyz;
  r1.xyz = cb0[15].xyz * r1.xyz;
  r0.xyz = r2.yzw * r0.www + r0.xyz;
  r0.xyz = r1.xyz * r2.xxx + r0.xyz;
  float3 preLGG = r0.xyz;
  r0.xyz = r0.xyz * cb0[9].xyz + cb0[7].xyz;
  r2.xyz = sign(r0.xyz) * pow(abs(r0.xyz), cb0[8].xyz);
  r2.xyz = liftGammaGainScaling(r2.xyz, preLGG, cb0[7].xyz, cb0[8].xyz, cb0[9].xyz);
  r3.xy = r2.zy;
  r0.xy = r2.yz + -r3.xy;
  r1.x = step(r2.z, r3.y);
  r3.zw = float2(-1.0, 2.0 / 3.0);
  r0.zw = float2(1,-1);
  r0.xyzw = r1.xxxx * r0.xywz + r3.xywz;
  r1.x = step(r0.x, r2.x);
  r3.z = r0.w;
  r0.w = r2.x;
  r2.x = dot(r2.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r3.xyw = r0.wyx;
  r3.xyzw = r3.xyzw + -r0.xyzw;
  r0.xyzw = r1.xxxx * r3.xyzw + r0.xyzw;
  r1.x = min(r0.w, r0.y);
  r1.x = -r1.x + r0.x;
  r1.y = r1.x * 6.0 + 0.0001;
  r0.y = r0.w + -r0.y;
  r0.y = r0.y / r1.y;
  r0.y = r0.z + r0.y;
  r3.x = abs(r0.y);
  r2.z = cb0[6].x + r3.x;
  r2.yw = float2(0,0);
  r4.xyzw = t4.Sample(s0_s, r2.zw).xyzw;
  r5.xyzw = t7.Sample(s0_s, r2.xy).xyzw;
  r5.x = saturate(r5.x);
  r4.x = saturate(r4.x);
  r0.y = r4.x + r2.z;
  r0.yzw = float3(-0.5,0.5,-1.5) + r0.yyy;
  r0.w = (r0.y > 1) ? r0.w : r0.y;
  r0.y = (r0.y < 0) ? r0.z : r0.w;
  r0.yzw = float3(1.0, 2.0 / 3.0, 1.0 / 3.0) + r0.yyy;
  r0.yzw = frac(r0.yzw);
  r0.yzw = r0.yzw * float3(6,6,6) + float3(-3,-3,-3);
  r0.yzw = saturate(float3(-1,-1,-1) + abs(r0.yzw));
  r0.yzw = float3(-1,-1,-1) + r0.yzw;
  r1.y = 0.0001 + r0.x;
  r3.z = r1.x / r1.y;
  r0.yzw = r3.zzz * r0.yzw + float3(1,1,1);
  r1.xyz = r0.xxx * r0.yzw;
  r1.x = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
  r0.xyz = r0.xxx * r0.yzw + -r1.xxx;
  r3.yw = float2(0,0);
  r2.xyzw = t5.Sample(s0_s, r3.xy).xyzw;
  r3.xyzw = t6.Sample(s0_s, r3.zw).xyzw;
  r3.x = saturate(r3.x);
  r2.x = saturate(r2.x);
  r0.w = r2.x + r2.x;
  r0.w = dot(r3.xx, r0.ww);
  r0.w = r5.x * r0.w;
  r0.w = dot(cb0[6].yy, r0.ww);
  r0.xyz = r0.www * r0.xyz + r1.xxx;
  r0.w = max(r0.x, r0.y);
  r0.w = max(r0.w, r0.z);
  r0.w = 1 + r0.w;
  r0.w = 1 / r0.w;
  r0.xyz = r0.xyz * r0.www + float3(0.00390625,0.00390625,0.00390625);
  r0.w = 0;
  r1.xyzw = t0.Sample(s0_s, r0.xw).xyzw;
  r1.x = saturate(r1.x);
  r2.xyzw = t0.Sample(s0_s, r0.yw).xyzw;
  r0.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  r1.z = saturate(r0.x);
  r1.y = saturate(r2.x);
  r0.xyz = float3(0.00390625,0.00390625,0.00390625) + r1.xyz;
  r0.w = 0;
  r1.xyzw = t1.Sample(s0_s, r0.xw).xyzw;
  r1.x = saturate(r1.x);
  r2.xyzw = t2.Sample(s0_s, r0.yw).xyzw;
  r0.xyzw = t3.Sample(s0_s, r0.zw).xyzw;
  r1.z = saturate(r0.x);
  r1.y = saturate(r2.x);
  r0.x = max(r1.x, r1.y);
  r0.x = max(r0.x, r1.z);
  r0.x = 1 + -r0.x;
  r0.x = 1 / r0.x;
  r0.xyz = r1.xyz * r0.xxx;
  if(injectedData.toneMapType != 0.f){
    r0.xyz = isWCG ? renodx::color::bt709::from::AP1(r0.xyz) : r0.xyz;
  }
  r0.xyz = lerp(preCG, r0.xyz, injectedData.colorGradeInternalLUTStrength);
  float midGray = vanillaNeutral(float3(0.18f, 0.18f, 0.18f)).x;
  float3 hueCorrectionColor = vanillaNeutral(r0.xyz);
  float neutralParam = setNeutralParam(cb0[19], cb0[20]);
  float defaultClip = 4.f;
  renodx::tonemap::Config config = renodx::tonemap::config::Create();
  config.type = neutralParam == 0.f ? 0.f : min(3, injectedData.toneMapType);
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
  if (neutralParam == 1.f) {
    defaultClip = 7.f;
    config.reno_drt_contrast = 1.09f;
    config.reno_drt_highlights = 1.04f;
  } else if (neutralParam == 1.f) {
    config.reno_drt_contrast = 1.03f;
  }
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
  config.reno_drt_white_clip = injectedData.colorGradeClip == 0.f ? defaultClip : injectedData.colorGradeClip;
  if(injectedData.toneMapType == 0.f){
    r0.xyz = hueCorrectionColor;
  }
  r0.xyz = renodx::tonemap::config::Apply(r0.xyz, config);
  //r0.xyz = vanillaNeutral(r0.xyz);
  o0.xyz = r0.xyz;
  /*r0.xyz = max(float3(0,0,0), r0.xyz);
  r0.w = cb0[19].z * cb0[19].y;
  r1.x = cb0[19].x * cb0[20].z + r0.w;
  r1.yz = cb0[20].xy * cb0[19].ww;
  r1.x = cb0[20].z * r1.x + r1.y;
  r1.w = cb0[19].x * cb0[20].z + cb0[19].y;
  r1.w = cb0[20].z * r1.w + r1.z;
  r1.x = r1.x / r1.w;
  r1.w = cb0[20].x / cb0[20].y;
  r1.x = r1.x + -r1.w;
  r1.x = 1 / r1.x;
  r0.xyz = r1.xxx * r0.xyz;
  r2.xyz = cb0[19].xxx * r0.xyz + r0.www;
  r2.xyz = r0.xyz * r2.xyz + r1.yyy;
  r3.xyz = cb0[19].xxx * r0.xyz + cb0[19].yyy;
  r0.xyz = r0.xyz * r3.xyz + r1.zzz;
  r0.xyz = r2.xyz / r0.xyz;
  r0.xyz = r0.xyz + -r1.www;
  r0.xyz = r0.xyz * r1.xxx;
  o0.xyz = r0.xyz / cb0[20].www;*/
  o0.w = 1;
  return;
}