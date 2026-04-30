#include "./shared.h"

Texture2D t0 : register(t0);
SamplerState s0 : register(s0);
float4 main(float4 vpos: SV_POSITION, float2 uv: TEXCOORD0)
    : SV_TARGET {
  float4 output = t0.Sample(s0, uv); 

  if (uv.x > 0.95) {
    output.rgb = float3(1, 0, 0);
  }

  output = renodx::draw::SwapChainPass(output);
  return output;
}
