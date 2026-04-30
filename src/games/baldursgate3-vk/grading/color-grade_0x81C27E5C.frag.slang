

#include "../shared.h"

static float3 _58 = (float3)0;

[[vk::binding(0, 1)]]
cbuffer _9_5 : register(b0, space1)
{
    float _5_m0 : packoffset(c0);
    float _5_m1 : packoffset(c0.y);
    float _5_m2 : packoffset(c0.z);
    float _5_m3 : packoffset(c0.w);
};

[[vk::binding(1, 1)]]
Texture2D<float4> _6 : register(t1, space1);
[[vk::binding(2, 1)]]
Texture3D<float4> _7 : register(t2, space1);
[[vk::binding(3, 1)]]
SamplerState _8 : register(s3, space1);

static float4 gl_FragCoord = (float4)0;
static float4 _4 = (float4)0;

struct SPIRV_Cross_Input
{
    float4 gl_FragCoord : SV_Position;
};

struct SPIRV_Cross_Output
{
    float4 _4 : SV_Target0;
};

void frag_main()
{
    float4 _68 = _6.Load(int3(int3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy, 0));
    float _70 = _68.z;
    float _71 = _68.y;
    float4 _76 = lerp(float4(_70, _71, -1.0f, 0.666666686534881591796875f), float4(_71, _70, 0.0f, -0.3333333432674407958984375f), step(_70, _71).xxxx);
    float _77 = _68.x;
    float _78 = _76.x;
    float4 _86 = lerp(float4(_78, _76.yw, _77), float4(_77, _76.yz, _78), step(_78, _77).xxxx);
    float _87 = _86.x;
    float _88 = _86.w;
    float _89 = _86.y;
    float _91 = _87 - min(_88, _89);
    float3 _103;
    _103.x = abs(_86.z + ((_88 - _89) / mad(6.0f, _91, 1.0000000133514319600180897396058e-10f))) + _5_m1;
    float3 _117 = lerp(1.0f.xxx, clamp(abs((frac(_103.xxx + float3(1.0f, 0.666666686534881591796875f, 0.3333333432674407958984375f)) * 6.0f) - 3.0f.xxx) - 1.0f.xxx, 0.0f.xxx, 1.0f.xxx), lerp(0.0f, _91 / (_87 + 1.0000000133514319600180897396058e-10f), _5_m0).xxx) * _87;
    bool3 _121 = (_5_m2 < 0.0f).xxx;
    float3 _123 = _117 * (1.0f + _5_m2);
    float3 _125 = lerp(_117, 1.0f.xxx, _5_m2.xxx);
    float3 graded = lerp(_68.xyz, float3(_121.x ? _123.x : _125.x, _121.y ? _123.y : _125.y, _121.z ? _123.z : _125.z), _5_m3.xxx);
    if (RENODX_COLOR_GRADE_STRENGTH != 1.f) {
        float3 ungraded = renodx::color::ap1::from::BT709(graded);
        float3 pq = renodx::color::pq::EncodeSafe(graded, 45.f);
        float3 lut_result = _7.SampleLevel(_8, pq, 0.0f).xyz;
        _4 = float4(lerp(ungraded, lut_result, RENODX_COLOR_GRADE_STRENGTH), 1.0f);
    } else {
        float3 pq = renodx::color::pq::EncodeSafe(graded, 45.f);
        _4 = float4(_7.SampleLevel(_8, pq, 0.0f).xyz, 1.0f);
    }
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    gl_FragCoord = stage_input.gl_FragCoord;
    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output._4 = _4;
    return stage_output;
}
