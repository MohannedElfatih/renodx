Texture2D<float4> tex : register(t0);

cbuffer consts : register(b0) {
  struct Sharpen_constants {
    float weight;
  } consts : packoffset(c000.x);
};

SamplerState sampler_nearest : register(s0);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 O_Uv : O_Uv
) : SV_Target {
  float4 SV_Target;
  float4 _6 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y), -1);
  float4 _10 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y));
  float4 _14 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y), 1);
  float4 _18 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y), -1);
  float4 _22 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y));
  float4 _26 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y), 1);
  float4 _30 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y), -1);
  float4 _34 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y));
  float4 _38 = tex.Sample(sampler_nearest, float2(O_Uv.x, O_Uv.y), 1);
  float _51 = min(min(min(_18.x, _22.x), min(_26.x, _10.x)), _34.x);
  float _52 = min(min(min(_18.y, _22.y), min(_26.y, _10.y)), _34.y);
  float _53 = min(min(min(_18.z, _22.z), min(_26.z, _10.z)), _34.z);
  float _78 = max(max(max(_18.x, _22.x), max(_26.x, _10.x)), _34.x);
  float _79 = max(max(max(_18.y, _22.y), max(_26.y, _10.y)), _34.y);
  float _80 = max(max(max(_18.z, _22.z), max(_26.z, _10.z)), _34.z);
  float _93 = max(_78, max(max(_6.x, _14.x), max(_30.x, _38.x))) + _78;
  float _94 = max(_79, max(max(_6.y, _14.y), max(_30.y, _38.y))) + _79;
  float _95 = max(_80, max(max(_6.z, _14.z), max(_30.z, _38.z))) + _80;
  float _119 = 1.0f / (consts.weight * rsqrt(saturate(min((min(_51, min(min(_6.x, _14.x), min(_30.x, _38.x))) + _51), (2.0f - _93)) * (1.0f / _93))));
  float _120 = 1.0f / (consts.weight * rsqrt(saturate(min((min(_52, min(min(_6.y, _14.y), min(_30.y, _38.y))) + _52), (2.0f - _94)) * (1.0f / _94))));
  float _121 = 1.0f / (consts.weight * rsqrt(saturate(min((min(_53, min(min(_6.z, _14.z), min(_30.z, _38.z))) + _53), (2.0f - _95)) * (1.0f / _95))));
  SV_Target.x = ((1.0f / (1.0f - (_119 * 4.0f))) * (_22.x - (_119 * (((_18.x + _10.x) + _26.x) + _34.x))));
  SV_Target.y = ((1.0f / (1.0f - (_120 * 4.0f))) * (_22.y - (_120 * (((_18.y + _10.y) + _26.y) + _34.y))));
  SV_Target.z = ((1.0f / (1.0f - (_121 * 4.0f))) * (_22.z - (_121 * (((_18.z + _10.z) + _26.z) + _34.z))));
  SV_Target.w = 1.0f;

  return SV_Target;
}
