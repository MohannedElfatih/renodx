#include "./output.hlsl"

#if 0
Texture2D<float4> SrcTexture : register(t0);

Texture3D<float4> SrcLUT : register(t1);

SamplerState PointBorder : register(s2, space32);

SamplerState TrilinearClamp : register(s9, space32);
#endif

struct OutputSignature {
  float4 SV_Target : SV_Target;
  float4 SV_Target_1 : SV_Target1;
};

OutputSignature main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD
) {
  float4 SV_Target;
  float4 SV_Target_1;

#if 0
  float4 _9 = SrcTexture.SampleLevel(PointBorder, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
  float _27;
  float _42;
  float _57;
  if (!(_9.x <= 0.0f)) {
    if (_9.x < 3.0517578125e-05f) {
      _27 = ((log2((_9.x * 0.5f) + 1.52587890625e-05f) * 0.05707760155200958f) + 0.5547950267791748f);
    } else {
      _27 = ((log2(_9.x) * 0.05707760155200958f) + 0.5547950267791748f);
    }
  } else {
    _27 = -0.35844698548316956f;
  }
  if (!(_9.y <= 0.0f)) {
    if (_9.y < 3.0517578125e-05f) {
      _42 = ((log2((_9.y * 0.5f) + 1.52587890625e-05f) * 0.05707760155200958f) + 0.5547950267791748f);
    } else {
      _42 = ((log2(_9.y) * 0.05707760155200958f) + 0.5547950267791748f);
    }
  } else {
    _42 = -0.35844698548316956f;
  }
  if (!(_9.z <= 0.0f)) {
    if (_9.z < 3.0517578125e-05f) {
      _57 = ((log2((_9.z * 0.5f) + 1.52587890625e-05f) * 0.05707760155200958f) + 0.5547950267791748f);
    } else {
      _57 = ((log2(_9.z) * 0.05707760155200958f) + 0.5547950267791748f);
    }
  } else {
    _57 = -0.35844698548316956f;
  }
  float4 _66 = SrcLUT.SampleLevel(TrilinearClamp, float3(((_27 * 0.984375f) + 0.0078125f), ((_42 * 0.984375f) + 0.0078125f), ((_57 * 0.984375f) + 0.0078125f)), 0.0f);
  SV_Target.x = (_66.x);
  SV_Target.y = (_66.y);
  SV_Target.z = (_66.z);
  SV_Target.w = 1.0f;
  SV_Target_1.x = (_66.x);
  SV_Target_1.y = (_66.y);
  SV_Target_1.z = (_66.z);
  SV_Target_1.w = 1.0f;
#else
  SV_Target = OutputTonemap(SV_Position, TEXCOORD, true);
  SV_Target_1 = SV_Target;
#endif

  OutputSignature output_signature = { SV_Target, SV_Target_1 };
  return output_signature;
}
