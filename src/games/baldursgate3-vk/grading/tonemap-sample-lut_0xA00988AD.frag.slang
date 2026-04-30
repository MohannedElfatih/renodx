
#include "../shared.h"
#include "../common.hlsli"

[[vk::binding(0, 1)]]
cbuffer _9_5 : register(b0, space1)
{
    float _5_m0 : packoffset(c0);
    float _5_m1 : packoffset(c0.y);
    int _5_m2 : packoffset(c0.z);
    int _5_m3 : packoffset(c0.w);
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
    float4 _83 = _6.Load(int3(int3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy, 0));
    float3 _84 = _83.xyz;
    float3 _150;
    if (_5_m2 >= 20)
    {
        // z==21 UI character: bypass desaturation, LUT, and all intermediate processing
        if (RENODX_TONE_MAP_TYPE != 0.f && _5_m2 == 21) {
            float3 color = max(0, _84);
            color = ApplyUICharacterGrading(color);
            color = renodx::color::bt2020::from::BT709(color);
            if (RENODX_TONE_MAP_TYPE == 2.f) {
                color = renodx::tonemap::neutwo::MaxChannel(color, RENODX_PEAK_WHITE_NITS / RENODX_GRAPHICS_WHITE_NITS, 100.f);
            }
            color = renodx::color::bt709::from::BT2020(color);
            color = renodx::color::srgb::EncodeSafe(color);
            color = ApplyUICharacterReGrading(color);
            _4 = float4(color, 1);
            return;
        }

        float3 _123;
        [branch]
        if (_5_m2 == 21)
        {
            float _98 = max(_83.x, max(_83.y, _83.z));
            float3 _99 = _98.xxx;
            float _101 = abs(_98);
            float3 _103 = (_99 - _84) / _101.xxx;
            bool3 _104 = bool3(_103.x <= float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f).x, _103.y <= float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f).y, _103.z <= float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f).z);
            float3 _105 = float3(_104.x ? 1.0f.xxx.x : float3(0.327301919460296630859375f, 0.2859380543231964111328125f, 0.0f).x, _104.y ? 1.0f.xxx.y : float3(0.327301919460296630859375f, 0.2859380543231964111328125f, 0.0f).y, _104.z ? 1.0f.xxx.z : float3(0.327301919460296630859375f, 0.2859380543231964111328125f, 0.0f).z);
            bool3 _106 = bool3(_105.x > 9.9999999747524270787835121154785e-07f.xxx.x, _105.y > 9.9999999747524270787835121154785e-07f.xxx.y, _105.z > 9.9999999747524270787835121154785e-07f.xxx.z);
            float3 _108 = (_103 - float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f)) / _105;
            float3 _109 = float3(_106.x ? _108.x : 0.0f.xxx.x, _106.y ? _108.y : 0.0f.xxx.y, _106.z ? _108.z : 0.0f.xxx.z);
            bool3 _110 = bool3(_109.x > 0.0f.xxx.x, _109.y > 0.0f.xxx.y, _109.z > 0.0f.xxx.z);
            float3 _112 = pow(abs(_109), 1.2000000476837158203125f.xxx);
            bool3 _114 = bool3(_103.x < float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f).x, _103.y < float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f).y, _103.z < float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f).z);
            float3 _119 = float3(0.814999997615814208984375f, 0.802999973297119140625f, 1.0f) + ((_105 * _109) / pow(1.0f.xxx + float3(_110.x ? _112.x : 0.0f.xxx.x, _110.y ? _112.y : 0.0f.xxx.y, _110.z ? _112.z : 0.0f.xxx.z), 0.833333313465118408203125f.xxx));
            _123 = _99 - (float3(_114.x ? _103.x : _119.x, _114.y ? _103.y : _119.y, _114.z ? _103.z : _119.z) * _101);
        }
        else
        {
            _123 = _84;
        }
        float3 _124 = max(_123, 0.0f.xxx);
        bool3 _125 = bool3(_124.x <= 3.0517578125e-05f.xxx.x, _124.y <= 3.0517578125e-05f.xxx.y, _124.z <= 3.0517578125e-05f.xxx.z);
        float3 _127 = (_124 * 0.5f) + 1.52587890625e-05f.xxx;
        _150 = clamp((log2(float3(_125.x ? _127.x : _124.x, _125.y ? _127.y : _124.y, _125.z ? _127.z : _124.z)) + 9.72000026702880859375f.xxx) * 0.057077623903751373291015625f.xxx, 0.0f.xxx, 1.0f.xxx);
    }
    else
    {
        _150 = renodx::color::pq::EncodeSafe(_84, 10000.f / _5_m1);
    }
    float3 lut_output = _7.SampleLevel(_8, _150, 0.0f).xyz;

    if (RENODX_TONE_MAP_TYPE != 0.f) {
        lut_output = renodx::color::pq::DecodeSafe(lut_output, 100.f);

        lut_output = renodx::color::bt709::from::BT2020(lut_output);

        if (RENODX_CUSTOM_CURVE > 0.f) {
            lut_output = SplitContrast(lut_output, 1.f + RENODX_CUSTOM_CURVE * 0.5f, 1.f, 0.18f);
            lut_output *= 0.16f / 0.18f;
        }

        float3 pre_tonemap_bt709 = lut_output;

        lut_output = PsychoGrade(lut_output);
        lut_output = renodx::color::bt2020::from::BT709(lut_output);

        if (RENODX_HUE_CORRECTION > 0.f) {
            float3 tonemapped_bt709 = renodx::color::bt709::from::BT2020(lut_output);
            float peak = RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS;
            float3 hue_ref = renodx::tonemap::neutwo::PerChannel(
                max(0, _84), peak.xxx);
            tonemapped_bt709 = CorrectHueAndPurityMBGated(tonemapped_bt709, hue_ref, RENODX_HUE_CORRECTION, 0.05f, 0.5f, 0.f);
            lut_output = renodx::color::bt2020::from::BT709(tonemapped_bt709);
        }
        
        if (RENODX_GAMMA_CORRECTION == 0.f) {
          lut_output = GammaCorrectHuePreserving(lut_output, true);
        }

        if (RENODX_CUSTOM_GRAIN_STRENGTH > 0) {
            uint2 screen_size;
            _6.GetDimensions(screen_size.x, screen_size.y);
            lut_output = renodx::effects::ApplyFilmGrain(
                lut_output,
                gl_FragCoord.xy / float2(screen_size),
                RENODX_CUSTOM_RANDOM,
                RENODX_CUSTOM_GRAIN_STRENGTH * 0.03f);
        }
        lut_output = renodx::color::pq::EncodeSafe(lut_output, RENODX_DIFFUSE_WHITE_NITS);
    }

    _4 = lerp(float4(lut_output, 1.0f), float4(0.0f, 0.0f, 0.0f, 1.0f), _5_m0.xxxx);
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
