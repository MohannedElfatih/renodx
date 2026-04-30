#include "../shared.h"

[[vk::binding(4, 0)]]
cbuffer _10_6 : register(b4, space0)
{
    float2 _6_m0 : packoffset(c0);
    float2 _6_m1 : packoffset(c0.z);
    uint2 _6_m2 : packoffset(c1);
    uint2 _6_m3 : packoffset(c1.z);
    uint2 _6_m4 : packoffset(c2);
    uint _6_m5 : packoffset(c2.z);
    uint _6_m6 : packoffset(c2.w);
    float2 _6_m7 : packoffset(c3);
    float2 _6_m8 : packoffset(c3.z);
    float2 _6_m9 : packoffset(c4);
    float2 _6_m10 : packoffset(c4.z);
    float2 _6_m11 : packoffset(c5);
    float2 _6_m12 : packoffset(c5.z);
    float2 _6_m13 : packoffset(c6);
    float2 _6_m14 : packoffset(c6.z);
    float2 _6_m15 : packoffset(c7);
    float2 _6_m16 : packoffset(c7.z);
    uint2 _6_m17 : packoffset(c8);
    uint2 _6_m18 : packoffset(c8.z);
    uint2 _6_m19 : packoffset(c9);
    uint2 _6_m20 : packoffset(c9.z);
    float2 _6_m21 : packoffset(c10);
    float2 _6_m22 : packoffset(c10.z);
};

[[vk::binding(0, 1)]]
SamplerState _7 : register(s0, space1);
[[vk::binding(1, 1)]]
Texture2D<float4> _8 : register(t1, space1);
[[vk::binding(2, 1)]]
Texture2D<float4> _9 : register(t2, space1);

static float4 gl_FragCoord = (float4)0;
static float2 _4 = (float2)0;
static float4 _5 = (float4)0;

struct SPIRV_Cross_Input
{
    float2 _4 : TEXCOORD0;
    float4 gl_FragCoord : SV_Position;
};

struct SPIRV_Cross_Output
{
    float4 _5 : SV_Target0;
};

void frag_main()
{
    _5 = mad(_9.SampleLevel(_7, clamp(_4 * _6_m15, _6_m11, _6_m12), 0.0f), (0.20000000298023223876953125f * RENODX_CUSTOM_BLOOM).xxxx, _8.Load(int3(int3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy, 0)));
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    gl_FragCoord = stage_input.gl_FragCoord;
    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
    _4 = stage_input._4;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output._5 = _5;
    return stage_output;
}

