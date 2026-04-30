
#include "../shared.h"

[[vk::binding(0, 1)]]
cbuffer _9_8 : register(b0, space1)
{
    float _8_m0 : packoffset(c0);
    float _8_m1 : packoffset(c0.y);
    float _8_m2 : packoffset(c0.z);
    float _8_m3 : packoffset(c0.w);
};

[[vk::binding(1, 1)]]
Texture2D<float4> _5 : register(t1, space1);
[[vk::binding(2, 1)]]
Texture2D<float4> _6 : register(t2, space1);
[[vk::binding(3, 1)]]
SamplerState _7 : register(s3, space1);

static float2 _3 = (float2)0;
static float4 _4 = (float4)0;

struct SPIRV_Cross_Input
{
    float2 _3 : TEXCOORD0;
};

struct SPIRV_Cross_Output
{
    float4 _4 : SV_Target0;
};

void frag_main()
{
    float4 _79 = _6.SampleLevel(_7, _3, 0.0f);
    float _80 = _79.w;
    float4 _175;
    [branch]
    if (_80 < 0.001000000047497451305389404296875f)
    {
        _175 = float4(_5.SampleLevel(_7, _3, 0.0f).xyz, 1.0f);
    }
    else
    {
        float4 _174;
        if (_80 == 1.0f)
        {  // most UI elements
            float3 decoded;
            if (!RENODX_GAMMA_CORRECTION) {
                decoded = renodx::color::srgb::DecodeSafe(_79.xyz);
            } else {
                decoded = renodx::color::gamma::DecodeSafe(_79.xyz, 2.2f);
            }
            float3 bt2020 = renodx::color::bt2020::from::BT709(decoded);
            _174 = float4(renodx::color::pq::EncodeSafe(bt2020, RENODX_GRAPHICS_WHITE_NITS), 1.0f);
        }
        else
        {  // some other UI elements
            float3 bg = renodx::color::pq::DecodeSafe(_5.SampleLevel(_7, _3, 0.0f).xyz, 1.f);
            bg = bg - _80 * bg;  // bg * (1 - alpha)

            float3 overlay_decoded;
            if (!RENODX_GAMMA_CORRECTION) {
                overlay_decoded = renodx::color::srgb::DecodeSafe(_79.xyz);
            } else {
                overlay_decoded = renodx::color::gamma::DecodeSafe(_79.xyz, 2.2f);
            }

            float3 overlay_bt2020 = renodx::color::bt2020::from::BT709(overlay_decoded);
            float3 composited = bg - _80 * bg;  // bg * (1 - alpha)^2
            composited = overlay_bt2020 * RENODX_GRAPHICS_WHITE_NITS + composited;

            _174 = float4(renodx::color::pq::EncodeSafe(composited, 1.f), 1.0f);
        }
        _175 = _174;
    }
    _4 = _175;
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    _3 = stage_input._3;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output._4 = _4;
    return stage_output;
}
