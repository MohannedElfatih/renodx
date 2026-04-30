#include "./shared.h"

float hash11(float p) {
  p = frac(p * 0.1031);
  p *= p + 33.33;
  p *= p + p;
  return frac(p);
}

float3 randomColor(float seed) {
  return float3(
      hash11(seed + 1.0),
      hash11(seed + 2.0),
      hash11(seed + 3.0));
}

Texture2D t0 : register(t0);
SamplerState s0 : register(s0);
float4 main(float4 vpos: SV_POSITION, float2 uv: TEXCOORD0)
    : SV_TARGET {
  float4 outputColor = t0.Sample(s0, uv);

  if (uv.x >= 0.95) {
    outputColor.rgb = float3(2, 2, 0);
    outputColor = float4(randomColor(CUSTOM_RANDOM), 1.0);
  }
  outputColor = renodx::draw::SwapChainPass(outputColor, uv);
  return outputColor;
}
