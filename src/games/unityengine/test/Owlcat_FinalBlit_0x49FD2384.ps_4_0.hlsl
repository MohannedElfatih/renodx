#include "../common.hlsl"

Texture2D<float4> t0 : register(t0);
SamplerState s0_s : register(s0);

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  o0.w = r0.w;
  if(injectedData.countOld < injectedData.countNew){
    r0.xyz = InvertToneMapScale(r0.xyz, true);
  } else {
    r0.xyz = renodx::color::srgb::DecodeSafe(r0.xyz);
  }
  if(injectedData.toneMapType == 0.f){
    r0.xyz = ((asuint(r0.x) & 0x7FFFFFFF) > 0x7F800000) || ((asuint(r0.y) & 0x7FFFFFFF) > 0x7F800000) || ((asuint(r0.z) & 0x7FFFFFFF) > 0x7F800000) ? float3(0,0,0) : r0.xyz;
  } else {
    r0.xyz = renodx::color::bt709::clamp::AP1(r0.xyz);
  }
  if (injectedData.countOld <= injectedData.countNew) {
    r0.xyz = PostToneMapScale(r0.xyz);
  }
  o0.xyz = r0.xyz;
  /*r1.xyz = (int3)r0.xyz & int3(0x7fffffff,0x7fffffff,0x7fffffff);
  r2.xyz = cmp(int3(0x7f800000,0x7f800000,0x7f800000) < (uint3)r1.xyz);
  r1.xyz = cmp((int3)r1.xyz == int3(0x7f800000,0x7f800000,0x7f800000));
  r0.w = (int)r2.y | (int)r2.x;
  r0.w = (int)r2.z | (int)r0.w;
  r1.x = (int)r1.y | (int)r1.x;
  r1.x = (int)r1.z | (int)r1.x;
  r0.w = (int)r0.w | (int)r1.x;
  o0.xyz = r0.www ? float3(0,0,0) : r0.xyz;*/
  return;
}