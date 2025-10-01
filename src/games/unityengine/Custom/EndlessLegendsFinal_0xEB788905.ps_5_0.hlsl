#include "../common.hlsl"

SamplerState _SourceTexture_s : register(s0);
Texture2D<float4> _SourceTexture : register(t0);

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = _SourceTexture.Sample(_SourceTexture_s, v1.xy).xyzw;
  r0.xyz = FinalizeOutput(r0.xyz, injectedData.gammaSpace != 0.f);
  o0.xyzw = r0.xyzw;
  return;
}