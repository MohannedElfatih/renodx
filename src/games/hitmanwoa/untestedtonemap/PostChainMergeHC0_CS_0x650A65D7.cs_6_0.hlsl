#include "../common.hlsl"

cbuffer _24_26 : register(b5, space0) {
  float4 _26_m0[12] : packoffset(c0);
};

Texture2D<float4> _8 : register(t0, space0);
Texture2D<float4> _9 : register(t1, space0);
Texture3D<float4> _12 : register(t2, space0);
Texture2D<float4> _13 : register(t3, space0);
Buffer<uint4> _17 : register(t6, space0);
RWTexture2D<float4> _20 : register(u0, space0);
SamplerState _29 : register(s4, space0);

static uint3 gl_GlobalInvocationID;
struct SPIRV_Cross_Input {
  uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

void comp_main() {
  float _47 = float(int(gl_GlobalInvocationID.x));
  float _48 = float(int(gl_GlobalInvocationID.y));
  float _57 = _26_m0[0u].x * (_47 + 0.5f);
  float _58 = (_48 + 0.5f) * _26_m0[0u].y;
  float4 _72 = _13.SampleLevel(_29, float2((_57 * _26_m0[1u].x) + _26_m0[1u].z, (_58 * _26_m0[1u].y) + _26_m0[1u].w), 0.0f);
  float _77 = _72.z;
  float _78 = _72.w;
  float _85 = (_26_m0[10u].w * _72.x) + _57;
  float _86 = (_26_m0[10u].w * _72.y) + _58;
  float4 _104 = _8.SampleLevel(_29, float2(_85, _86), 0.0f);
  float4 _110 = _9.SampleLevel(_29, float2(_85, _86), 0.0f);
  float _138 = asfloat(_17.Load(5u).x);
  float _168 = clamp(1.0f - (_26_m0[9u].y * frac(sin((_26_m0[10u].z + floor(_26_m0[9u].z * _47)) + ((_26_m0[10u].z + floor(_26_m0[9u].z * _48)) * 0.0129898004233837127685546875f)) * 43758.546875f)), 0.0f, 1.0f);
#if 1

  float3 bloomed_color = ScaleBloom(_104.rgb, _110.rgb, _26_m0[9u].x);

  // this shader doesn't use a tonemapper, so our custom `HDR tonemap` will just be untonemapped with `saturate()` removed
  float3 color_combined = (bloomed_color * _26_m0[7u].xyz) * _138;
  // add vignette and grain
  float3 tonemapped = (_26_m0[4u].xyz * _78) + (((((_26_m0[5u].xyz - 0.5f) * _77) + 0.5f) * 2.0f) * color_combined * _26_m0[10u].y * _168);

  float3 final_color = ToneMapMaxCLLAndSampleGamma2LUT16AndFinalizeOutput(tonemapped, _12, _29, _26_m0[8u].y, _57, _58, _26_m0[11u].x);
  _20[uint2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)] = float4(final_color, 0.0f);
#else
  float4 _204 = _12.SampleLevel(_29, float3((clamp((_26_m0[4u].x * _78) + ((((((_26_m0[5u].x + (-0.5f)) * _77) + 0.5f) * 2.0f) * clamp(((((_26_m0[9u].x * _110.x) + _104.x) * _26_m0[7u].x) * _26_m0[10u].y) * _138, 0.0f, 1.0f)) * _168), 0.0f, 1.0f) * 0.9375f) + 0.03125f, (clamp((_26_m0[4u].y * _78) + ((((((_26_m0[5u].y + (-0.5f)) * _77) + 0.5f) * 2.0f) * clamp(((((_26_m0[9u].x * _110.y) + _104.y) * _26_m0[7u].y) * _26_m0[10u].y) * _138, 0.0f, 1.0f)) * _168), 0.0f, 1.0f) * 0.9375f) + 0.03125f, (clamp((_26_m0[4u].z * _78) + ((((((_26_m0[5u].z + (-0.5f)) * _77) + 0.5f) * 2.0f) * clamp(((((_26_m0[9u].x * _110.z) + _104.z) * _26_m0[7u].z) * _26_m0[10u].y) * _138, 0.0f, 1.0f)) * _168), 0.0f, 1.0f) * 0.9375f) + 0.03125f), 0.0f);
  float _220 = (frac(sin(dot(float2(_57, _58), float2(12.98980045318603515625f, 78.233001708984375f))) * 43758.546875f) * 0.0039215688593685626983642578125f) + (-0.00196078442968428134918212890625f);
  _20[uint2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)] = float4((_220 + _204.x) * _26_m0[11u].x, (_220 + _204.y) * _26_m0[11u].x, (_220 + _204.z) * _26_m0[11u].x, 0.0f);
#endif
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input) {
  gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
  comp_main();
}
