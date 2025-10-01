#include "../tonemap.hlsl"

Texture2D<float4> t1 : register(t1);
Texture2D<float4> t0 : register(t0);
SamplerState s1_s : register(s1);
SamplerState s0_s : register(s0);
cbuffer cb0 : register(b0){
  float4 cb0[21];
}

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  float2 v2 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t1.Sample(s1_s, v1.xy).xyzw;
  r0.xyz = float3(1,1,1) + -r0.xyz;
  r0.xyz = -r0.xyz * cb0[20].yyy * injectedData.fxVignette + float3(1,1,1);
  r1.xyzw = t0.Sample(s0_s, w1.xy).xyzw;
  r0.xyz = abs(r1.xyz) * r0.xyz;
  r0.xyz = log2(r0.xyz);
  r0.xyz = cb0[20].xxx * r0.xyz;
  o0.xyz = exp2(r0.xyz);
  if (injectedData.tonemapCheck == 1.f && (injectedData.count2Old == injectedData.count2New)) {
    o0.xyz = applyUserNoTonemap(o0.xyz);
  }
  if (injectedData.countOld == injectedData.countNew) {
    o0.xyz = PostToneMapScale(o0.xyz);
  }
  o0.w = 1;
  return;
}