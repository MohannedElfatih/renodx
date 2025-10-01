#include "../../tonemap.hlsl"

Texture2D<float4> t1 : register(t1);
Texture2D<float4> t0 : register(t0);
SamplerState s1_s : register(s1);
SamplerState s0_s : register(s0);

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  o0.w = r0.w;
  /*r0.xyz = saturate(r0.xyz);
  r1.xyz = log2(r0.xyz);
  r1.xyz = float3(0.416660011,0.416660011,0.416660011) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r1.xyz = r1.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
  r2.xyz = cmp(r0.xyz < float3(0.00313080009,0.00313080009,0.00313080009));
  r0.xyz = float3(12.9200001,12.9200001,12.9200001) * r0.xyz;
  r0.xyz = r2.xyz ? r0.xyz : r1.xyz;*/
  //r0.xyz = renodx::color::srgb::EncodeSafe(r0.xyz);
  r0.xyz = handleUserLUT(r0.xyz, t1, s1_s, float3(1 / 1024, 1 / 32, 31), 0, true);
  //r0.xyz = renodx::color::srgb::DecodeSafe(r0.xyz);
  if (injectedData.tonemapCheck == 1.f && (injectedData.count2Old == injectedData.count2New)) {
    r0.xyz = applyUserNoTonemap(r0.xyz);
  }
  if (injectedData.countOld == injectedData.countNew) {
    r0.xyz = PostToneMapScale(r0.xyz);
  }
  o0.xyz = r0.xyz;
  /*r0.w = 31 * r0.z;
  r0.xyz = r0.xyz * float3(0.0302734375,0.96875,31) + float3(0.00048828125,0.015625,0);
  r0.w = frac(r0.w);
  r0.z = r0.z + -r0.w;
  r0.xy = r0.zz * float2(0.03125,0) + r0.xy;
  r1.xy = float2(0.03125,0) + r0.xy;
  r2.xyzw = t1.Sample(s1_s, r0.xy).xyzw;
  r1.xyzw = t1.Sample(s1_s, r1.xy).xyzw;
  r1.xyzw = r1.xyzw + -r2.xyzw;
  r0.xyzw = r0.wwww * r1.xyzw + r2.xyzw;*/
  /*r1.xyz = r0.xyz * float3(0.947867274,0.947867274,0.947867274) + float3(0.0521326996,0.0521326996,0.0521326996);
  r1.xyz = log2(r1.xyz);
  r1.xyz = float3(2.4000001,2.4000001,2.4000001) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r2.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= r0.xyz);
  r0.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * r0.xyz;
  o0.xyz = r2.xyz ? r0.xyz : r1.xyz;*/
  o0.xyz = r0.xyz;
  return;
}