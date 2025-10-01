#include "../../tonemap.hlsl"

Texture3D<float4> t1 : register(t1);
Texture2D<float4> t0 : register(t0);
SamplerState s1_s : register(s1);
SamplerState s0_s : register(s0);
cbuffer cb0 : register(b0){
  float4 cb0[3];
}

float3 weirdLutSample(float3 input){
float4 r0,r1;
  r0.xyz = input;
  r1.xyz = r0.xyz * cb0[2].yyy + cb0[2].zzz;
  r1.w = 0.5 * r1.z;
  r0.xyzw = t1.Sample(s1_s, r1.xyw).xyzw;
  r1.xyz = r1.xyz * float3(1,1,0.5) + float3(0,0,0.5);
  r1.xyzw = t1.Sample(s1_s, r1.xyz).xyzw;
  r1.xyz = r1.xyz + -r0.xyz;
  return cb0[2].xxx * r1.xyz + r0.xyz;
}

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  o0.w = r0.w;
  renodx::lut::Config lut_config = renodx::lut::config::Create();
  lut_config.strength = injectedData.colorGradeUserLUTStrength;
  lut_config.scaling = injectedData.colorGradeUserLUTScaling;
  if(injectedData.gammaSpace != 0.f){
  lut_config.type_input = renodx::lut::config::type::SRGB;
  lut_config.type_output = renodx::lut::config::type::SRGB;
  r0.xyz = renodx::color::srgb::DecodeSafe(r0.xyz);
  } else {
  lut_config.type_input = renodx::lut::config::type::LINEAR;
  lut_config.type_output = renodx::lut::config::type::LINEAR;
  }
  lut_config.recolor = injectedData.toneMapType == 0.f ? 0.f : 1.f;
  int encoding = injectedData.gammaSpace != 0.f ? 0 : 2;
    float3 neutralSDR = renodx::tonemap::renodrt::NeutralSDR(r0.xyz);
    float y = renodx::color::y::from::BT709(r0.xyz);
    float3 sdrColor = lerp(r0.xyz, neutralSDR, saturate(y));
    float3 lutLinearInput = injectedData.toneMapType <= 1.f ? min(1.f, r0.xyz) : sdrColor;
    float3 lutInputColor = ConvertInput(lutLinearInput, encoding);
    float3 lutOutputColor = weirdLutSample(lutInputColor);
    float3 color_output = LinearOutput(lutOutputColor, encoding);
    [branch]
    if (injectedData.colorGradeUserLUTScaling != 0.f) {
      float3 lutBlack = weirdLutSample(ConvertInput(0, encoding));
      float3 lutMid = weirdLutSample(ConvertInput(0.18f, encoding));
      float3 lutWhite = weirdLutSample(ConvertInput(1.f, encoding));
      float3 unclamped_gamma = renodx::lut::Unclamp(
          GammaOutput(lutOutputColor, encoding),
          GammaOutput(lutBlack, encoding),
          GammaOutput(lutMid, encoding),
          GammaOutput(lutWhite, encoding),
          GammaInput(r0.xyz, lutInputColor, encoding));
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
    r0.xyz = lerp(r0.xyz, color_output, lut_config.strength);
    } else {
    r0.xyz = renodx::tonemap::UpgradeToneMap(r0.xyz, lutLinearInput, color_output, injectedData.colorGradeUserLUTStrength);
    }
  if (injectedData.tonemapCheck == 1.f && (injectedData.count2Old == injectedData.count2New)) {
    r0.xyz = applyUserNoTonemap(r0.xyz);
  }
  if (injectedData.countOld == injectedData.countNew) {
    r0.xyz = PostToneMapScale(r0.xyz, injectedData.gammaSpace != 0.f);
  } else if(injectedData.gammaSpace != 0.f){
    r0.xyz = renodx::color::srgb::EncodeSafe(r0.xyz);
  }
  o0.xyz = r0.xyz;
  /*r1.xyz = r0.xyz * cb0[2].yyy + cb0[2].zzz;
  r1.w = 0.5 * r1.z;
  r0.xyzw = t1.Sample(s1_s, r1.xyw).xyzw;
  r1.xyz = r1.xyz * float3(1,1,0.5) + float3(0,0,0.5);
  r1.xyzw = t1.Sample(s1_s, r1.xyz).xyzw;
  r1.xyz = r1.xyz + -r0.xyz;
  o0.xyz = cb0[2].xxx * r1.xyz + r0.xyz;*/
  return;
}