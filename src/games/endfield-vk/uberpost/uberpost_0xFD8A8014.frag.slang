#include "../common.hlsl"


static const float _106[5] = {0.5, 1.0, 1.5, 2.0, 2.5};

[[vk::binding(8, 3)]]
cbuffer _5_6 : register(b8, space3)
{
    row_major float4x4 _m0;
    row_major float4x4 _m1;
    row_major float4x4 _m2;
    row_major float4x4 _m3;
    row_major float4x4 _m4;
    row_major float4x4 _m5;
    row_major float4x4 _m6;
    row_major float4x4 _m7;
    row_major float4x4 _m8;
    row_major float4x4 _m9;
    row_major float4x4 _m10;
    float4 _m11;
    row_major float4x4 _m12;
    row_major float4x4 _m13;
    row_major float4x4 _m14;
    row_major float4x4 _m15;
    row_major float4x4 _m16;
    row_major float4x4 _m17;
    row_major float4x4 _m18;
    row_major float4x4 _m19;
    row_major float4x4 _m20;
    float4 _m21;
    float4 _m22;
    float4 _m23;
    float4 _m24;
    float4 _m25;
    float4 _m26;
    float4 _m27;
    float4 _m28[6];
    float4 _m29[6];
    float4 _m30;
    float4 _m31;
    float4 _m32;
    float4 _m33;
    float4 _m34;
    float4 _m35;
    float4 _m36;
    float4 _m37;
    float _m38;
    float _m39;
    float _m40;
    uint _m41;
    float4 _m42;
    int4 _m43;
    float4 _m44;
    float4 _m45;
    float4 _m46;
    float4 _m47;
    float4 _m48;
    float4 _m49;
    float4 _m50;
    float4 _m51;
    float4 _m52;
    float4 _m53;
    float4 _m54[4];
    float4 _m55[4];
    float4 _m56[4];
    float4 _m57[4];
    float4 _m58;
    float4 _m59;
    float4 _m60[4];
    float4 _m61[4];
    float4 _m62[4];
    float4 _m63;
    float4 _m64;
    float4 _m65;
    float4 _m66;
    float4 _m67;
    float4 _m68;
    float4 _m69;
    float4 _m70;
    float4 _m71;
    float4 _m72;
    float4 _m73;
    float4 _m74;
    float4 _m75;
    float4 _m76;
    float4 _m77;
    float4 _m78;
    float4 _m79;
    float4 _m80;
    float4 _m81;
    float4 _m82;
    float4 _m83;
    float4 _m84;
    float4 _m85;
    float4 _m86;
    float4 _m87;
    float4 _m88;
    float4 _m89;
    float4 _m90;
    float4 _m91;
    float4 _m92;
    float4 _m93;
    float4 _m94;
    float4 _m95;
    float4 _m96;
    float4 _m97;
    float4 _m98;
    float4 _m99;
    float4 _m100;
    float4 _m101;
    float4 _m102;
    float4 _m103;
    float4 _m104;
    float4 _m105;
    float4 _m106;
    float4 _m107;
    float4 _m108;
    float4 _m109;
    float4 _m110;
    float4 _m111;
    float4 _m112;
    float4 _m113;
    float4 _m114;
    float4 _m115;
    float4 _m116;
    float4 _m117[2];
    float4 _m118[2];
    float _m119;
    float _m120;
    float _m121;
    float _m122;
    float4 _m123;
    float4 _m124;
    float4 _m125;
    float4 _m126;
    float4 _m127;
    float4 _m128;
    float4 _m129;
    float4 _m130;
    float4 _m131;
    float4 _m132;
    float4 _m133;
    float4 _m134;
    float4 _m135;
    float4 _m136;
    float4 _m137;
    float4 _m138;
    float4 _m139;
    float4 _m140;
    float4 _m141;
    float4 _m142;
    float4 _m143;
    float4 _m144;
    float4 _m145;
    float4 _m146;
    float4 _m147;
    float4 _m148;
    float4 _m149;
    float4 _m150;
    float4 _m151;
    float4 _m152;
    row_major float4x4 _m153;
    float4 _m154;
    float4 _m155;
    float4 _m156[32];
} _6;

[[vk::binding(7, 3)]]
cbuffer _15_16 : register(b7, space3)
{
    float4 _m0;
    float4 _m1;
    float4 _m2;
    float4 _m3;
    float4 _m4;
    float4 _m5;
    float4 _m6;
    float4 _m7;
    float4 _m8;
    float4 _m9;
    float4 _m10;
    float4 _m11;
    float4 _m12;
    float4 _m13;
    float4 _m14;
    float4 _m15;
    float4 _m16;
    float4 _m17;
    float4 _m18;
    float4 _m19;
    float4 _m20;
    float4 _m21;
    float4 _m22;
    float4 _m23;
    float4 _m24;
    float4 _m25;
} _16;

[[vk::binding(4, 3)]]
Texture2D<float4> _9 : register(t4, space3);
[[vk::binding(6, 3)]]
Texture2D<float4> _10 : register(t6, space3);
[[vk::binding(3, 3)]]
Texture2D<float4> _11 : register(t3, space3);
[[vk::binding(5, 3)]]
Texture2D<float4> _12 : register(t5, space3);
[[vk::binding(2, 3)]]
SamplerState _13 : register(s2, space3);
[[vk::binding(1, 3)]]
SamplerState _14 : register(s1, space3);


struct PS_INPUT
{
    float2 _3 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 _4 : SV_Target0;
};

PS_OUTPUT main(PS_INPUT input)
{
    PS_OUTPUT output;
    float2 _3 = input._3;
    float4 _4;
    
    float2 _124 = _3 - _16._m0.xy;
    float _126 = sqrt(dot(_124, _124));
    float2 _136 = (_124 * pow(_126, _16._m0.w)) * lerp(1.0, 1.0 / max(0.00999999977648258209228515625, _126), _16._m25.z);
    float4 _140 = _9.SampleLevel(_14, _3, 0.0);
    float3 _144;
    _144 = _140.xyz;
    for (int _147 = 0; _147 < 5; )
    {
        _144 += _9.SampleLevel(_14, _3 - (_136 * (_106[_147] * _16._m0.z)), 0.0).xyz;
        _147++;
        continue;
    }
    float3 _166 = (_144 * float3(0.16666667163372039794921875)) * _6._m42.x;
    float3 _171 = _10.SampleLevel(_14, _3, 0.0).xyz;
    float _189 = max(max(_166.x, _166.y), _166.z);
    float _193 = clamp(_189 - _16._m10.y, 0.0, _16._m10.z);
    float4 _216 = _12.SampleLevel(_13, _3, 0.0);
    float2 _244 = abs(_3 - _16._m1.xy) * lerp(_16._m2.x, 1.0, _16._m1.w);
    float _259 = _244.x * lerp(1.0, 1.5 * clamp(_16._m2.x * 1.0499999523162841796875, 0.0, 1.0), _16._m1.w);
    float2 _260 = float2(_259, clamp((_244.y * lerp(1.0, _16._m2.x * 2.0, _16._m1.w)) + (clamp(_16._m2.x - 2.7999999523162841796875, 0.0, 1.0) * 5.0), 0.0, 1.0));
    float _266 = _6._m22.x / _6._m22.y;
    _260.x = _259 * lerp(lerp(1.0, _266, _16._m2.w), _266 * 0.5625, _16._m1.w);
    float2 _278 = pow(clamp(_260, float2(0.0), float2(1.0)), float2(_16._m2.z));
    float3 _294 = ((lerp(_166, (_166 - ((_166 * (max((_16._m10.w * _193) * _193, _189 - _16._m10.x) / max(_189, 9.9999997473787516355514526367188e-05))) * _16._m9.z)) + (lerp(_171, (pow(_171, float3(0.3300000131130218505859375)) * 1.49380004405975341796875) - float3(0.699999988079071044921875), (_171 * (1.0 - _16._m9.z) > float3(0.300000011920928955078125))) * _16._m11.xyz), float3(_16._m9.x)) * lerp(float3(1.0), _216.xyz, float3(lerp(_16._m3.x, clamp((_16._m3.x * 3.0) - 2.0, 0.0, 1.0), step(0.0, min(min(_216.x, _216.y), _216.z) - 0.20000000298023223876953125))))) * lerp(_16._m4.xyz, float3(1.0), float3(pow(clamp(1.0 - dot(_278, _278), 0.0, 1.0), _16._m2.y)))) * _16._m7.w;
    float3 untonemapped = _294;
    renodx::lut::Config lut_config = renodx::lut::config::Create(
        _14,
        shader_injection.color_grade_strength,
        0.f,
        renodx::lut::config::type::ARRI_C1000_NO_CUT,
        renodx::lut::config::type::LINEAR,
        _16._m7.xyz
    );
    float3 graded = renodx::lut::Sample(_11, lut_config, untonemapped);

    float y = renodx::color::y::from::BT709(graded);
    float3 graded_ap1 = renodx::color::ap1::from::BT709(graded);
    [branch]
    if (shader_injection.tone_map_type == 0.f) {
        float3 hue_chrominance_reference_color = renodx::color::bt709::from::AP1(renodx::tonemap::ReinhardPiecewise(graded_ap1, 2.f, 1.0f));
        UserGradingConfig cg_config;
        cg_config.saturation = 1.f;
        cg_config.dechroma = .1f;
        cg_config.hue_emulation_strength = 1.f;
        cg_config.chrominance_emulation_strength = .7f;
        cg_config.highlight_saturation = 0.f;
        _4.xyz = ApplySaturationBlowoutHueCorrectionHighlightSaturation(graded, hue_chrominance_reference_color, y, cg_config);
        _4.xyz = renodx::color::bt2020::from::BT709(_4.xyz);
        _4.xyz = renodx::tonemap::neutwo::MaxChannel(_4.xyz, 1.0f, 2.0f);
        _4.xyz = renodx::color::bt709::from::BT2020(_4.xyz);
    } else {
        float3 hue_chrominance_reference_color = renodx::color::bt709::from::AP1(renodx::tonemap::ReinhardPiecewise(graded_ap1, 2.f, 0.5f));
        UserGradingConfig cg_config = CreateColorGradeConfig();
        float3 graded_bt709 = ApplyExposureContrastFlareHighlightsShadowsByLuminance(graded, y, cg_config);
        _4.xyz = ApplySaturationBlowoutHueCorrectionHighlightSaturation(graded_bt709, hue_chrominance_reference_color, y, cg_config);
        _4.xyz = renodx::color::bt2020::from::BT709(_4.xyz);
        _4.xyz = renodx::tonemap::neutwo::MaxChannel(_4.xyz, shader_injection.peak_white_nits / shader_injection.diffuse_white_nits, 65.f);
        _4.xyz = renodx::color::bt709::from::BT2020(_4.xyz);
    }

    if (CUSTOM_GRAIN_STRENGTH > 0) {
        _4.xyz = renodx::effects::ApplyFilmGrain(
            _4.xyz,
            _3,
            CUSTOM_RANDOM,
            CUSTOM_GRAIN_STRENGTH * 0.03f);
    }

    _4.xyz = renodx::draw::RenderIntermediatePass(_4.xyz);
    _4.w = min(1, _140.w);
    
    output._4 = _4;
    return output;
}