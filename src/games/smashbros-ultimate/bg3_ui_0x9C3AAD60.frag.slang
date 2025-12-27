#version 450

#include "./shared.h"

// ------------------------------------------------------------------
// Resources
// ------------------------------------------------------------------
struct UiParams {
  float _m0;
  float _m1;
  float _m2;
  float _m3;
};

[[vk::binding(1, 1)]]
ConstantBuffer<UiParams> _6;

[[vk::binding(2, 1)]]
Texture2D _4;

[[vk::binding(3, 1)]]
SamplerState _5;

// ------------------------------------------------------------------
// Inputs / Outputs
// ------------------------------------------------------------------
struct PsInput {
  [[vk::location(0)]]
  float2 _2 : TEXCOORD0;
};

struct PsOutput {
  float4 _3 : SV_Target0;
};

// ------------------------------------------------------------------
// Main
// ------------------------------------------------------------------
[shader("fragment")]
PsOutput main(PsInput IN) {
  PsOutput OUT;

  OUT._3 = float4(1.0, 1.0, 1.0, _6._m0) * _4.Sample(_5, IN._2);
  if (RENODX_TONE_MAP_TYPE != 0.0) {
    OUT._3.rgb = float3(5.0, 5.0, 0.0);
  }

  return OUT;
}
