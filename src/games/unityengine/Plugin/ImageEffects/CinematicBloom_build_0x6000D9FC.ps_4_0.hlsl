#include "../../common.hlsl"

Texture2D<float4> t0 : register(t0);
SamplerState s0_s : register(s0);
cbuffer cb0 : register(b0){
  float4 cb0[11];
}

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = cb0[6].xyxy * cb0[9].xxxx + v1.xyxy;
  r1.xyzw = -cb0[6].xxxy * float4(1,0,0,1) + r0.zwzw;
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  if(injectedData.isClamped != 0.f){
  r2.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::DecodeSafe(r2.xyz) : r2.xyz;
  r1.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::DecodeSafe(r1.xyz) : r1.xyz;
  r2.xyz = rolloffSdr(r2.xyz);
  r1.xyz = rolloffSdr(r1.xyz);
  r2.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::EncodeSafe(r2.xyz) : r2.xyz;
  r1.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::EncodeSafe(r1.xyz) : r1.xyz;
  }
  r1.xyz = min(float3(65000,65000,65000), r1.xyz);
  r2.xyz = min(float3(65000,65000,65000), r2.xyz);
  r3.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  if(injectedData.isClamped != 0.f){
  r3.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::DecodeSafe(r3.xyz) : r3.xyz;
  r3.xyz = rolloffSdr(r3.xyz);
  r3.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::EncodeSafe(r3.xyz) : r3.xyz;
  }
  r0.xyzw = cb0[6].xxxy * float4(1,0,0,1) + r0.xyzw;
  r3.xyz = min(float3(65000,65000,65000), r3.xyz);
  r4.xyz = r3.xyz + r2.xyz;
  r5.xyzw = t0.Sample(s0_s, r0.xy).xyzw;
  r0.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  if(injectedData.isClamped != 0.f){
  r5.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::DecodeSafe(r5.xyz) : r5.xyz;
  r0.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::DecodeSafe(r0.xyz) : r0.xyz;
  r5.xyz = rolloffSdr(r5.xyz);
  r0.xyz = rolloffSdr(r0.xyz);
  r5.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::EncodeSafe(r5.xyz) : r5.xyz;
  r0.xyz = injectedData.gammaSpace != 0.f ? renodx::color::srgb::EncodeSafe(r0.xyz) : r0.xyz;
  }
  r0.xyz = min(float3(65000,65000,65000), r0.xyz);
  r5.xyz = min(float3(65000,65000,65000), r5.xyz);
  r4.xyz = r5.xyz + r4.xyz;
  r6.xyz = min(r3.xyz, r2.xyz);
  r2.xyz = max(r3.xyz, r2.xyz);
  r2.xyz = max(r2.xyz, r5.xyz);
  r3.xyz = min(r6.xyz, r5.xyz);
  r3.xyz = r4.xyz + -r3.xyz;
  r2.xyz = r3.xyz + -r2.xyz;
  r3.xyz = r2.xyz + r1.xyz;
  r3.xyz = r3.xyz + r0.xyz;
  r4.xyz = min(r2.xyz, r1.xyz);
  r1.xyz = max(r2.xyz, r1.xyz);
  r1.xyz = max(r1.xyz, r0.xyz);
  r0.xyz = min(r4.xyz, r0.xyz);
  r0.xyz = r3.xyz + -r0.xyz;
  r0.xyz = r0.xyz + -r1.xyz;
  r0.w = max(r0.x, r0.y);
  r0.w = max(r0.w, r0.z);
  r1.x = -cb0[10].x + r0.w;
  r1.x = max(0, r1.x);
  r1.x = min(cb0[10].y, r1.x);
  r1.x = r1.x * r1.x;
  r1.x = cb0[10].z * r1.x;
  r1.y = -cb0[9].y + r0.w;
  r0.w = max(9.99999975e-06, r0.w);
  r1.x = max(r1.x, r1.y);
  r0.w = r1.x / r0.w;
  o0.xyz = r0.xyz * r0.www;
  o0.w = 0;
  return;
}