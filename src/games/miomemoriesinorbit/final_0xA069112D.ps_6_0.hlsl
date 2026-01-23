#include "./shared.h"

Texture2D<float4> tex : register(t0);

SamplerState sampler_screen_blit : register(s0);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 O_Uv : O_Uv
) : SV_Target {
  float4 SV_Target;
  float4 _5 = tex.Sample(sampler_screen_blit, float2(O_Uv.x, O_Uv.y));
  SV_Target.x = _5.x;
  SV_Target.y = _5.y;
  SV_Target.z = _5.z;

  SV_Target.rgb = renodx::draw::SwapChainPass(SV_Target.rgb);
  SV_Target.w = 1.0f;
  return SV_Target;
}
