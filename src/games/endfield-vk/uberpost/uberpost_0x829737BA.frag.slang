#include "../common.hlsl"

[[vk::binding(10, 3)]]
cbuffer _5_6 : register(b10, space3)
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

[[vk::binding(9, 3)]]
cbuffer _17_18 : register(b9, space3)
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
} _18;

[[vk::binding(6, 3)]]
Texture2D<float4> _9 : register(t6, space3);
[[vk::binding(8, 3)]]
Texture2D<float4> _10 : register(t8, space3);
[[vk::binding(5, 3)]]
Texture2D<float4> _11 : register(t5, space3);
[[vk::binding(4, 3)]]
Texture2D<float4> _12 : register(t4, space3);
[[vk::binding(1, 3)]]
SamplerState _13 : register(s1, space3);
[[vk::binding(7, 3)]]
Texture2D<float4> _14 : register(t7, space3);
[[vk::binding(3, 3)]]
SamplerState _15 : register(s3, space3);
[[vk::binding(2, 3)]]
SamplerState _16 : register(s2, space3);


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
    
    float2 _120 = _3 - _18._m0.xy;
    float _122 = sqrt(dot(_120, _120));
    float _124 = 1.0 / max(0.00999999977648258209228515625, _122);
    float2 _130 = _120 * pow(_122 * _122, _18._m0.w * 0.5);
    float4 _134 = _9.SampleLevel(_16, _3, 0.0);
    float3 _137 = _134.xyz * float3(1.0, 0.0, 0.0);
    float3 _274;
    [branch]
    if (_18._m25.x > 3.0)
    {
        float2 _153 = lerp(_130, _130 * _124, bool2((_18._m25.w != 0.0) || (_18._m25.z != 0.0)));
        float _158 = _18._m0.z + _18._m25.y;
        float _187 = 2.0 * _18._m25.y;
        float _198 = 2.0 * _18._m0.z;
        float _199 = 3.0 * _18._m25.y;
    float3 _240 = ((((((((_137 + (_9.SampleLevel(_16, _3 - (_153 * _158), 0.0).xyz * float3(1.0, 0.0, 0.0))) + (_9.SampleLevel(_16, _3 - (_153 * (2.0 * _158)), 0.0).xyz * float3(1.0, 0.0, 0.0))) + (_9.SampleLevel(_16, _3 - (_153 * _18._m25.y), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_16, _3 - (_153 * (_18._m0.z + _187)), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_16, _3 - (_153 * (_198 + _199)), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_16, _3 - (_153 * _187), 0.0).xyz * float3(0.0, 0.0, 1.0))) + (_9.SampleLevel(_16, _3 - (_153 * (_18._m0.z + _199)), 0.0).xyz * float3(0.0, 0.0, 1.0))) + (_9.SampleLevel(_16, _3 - (_153 * (_198 + (4.0 * _18._m25.y))), 0.0).xyz * float3(0.0, 0.0, 1.0))) * 0.3333334028720855712890625;
        _274 = _240;
    }
    else
    {
        float2 _246 = lerp(_130, _130 * _124, bool2(_18._m25.w != 0.0));
        _274 = (_137 + (_9.SampleLevel(_16, _3 - (_246 * (_18._m0.z + (2.0 * _18._m25.y))), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_16, _3 - (_246 * ((2.0 * _18._m0.z) + (3.0 * _18._m25.y))), 0.0).xyz * float3(0.0, 0.0, 1.0));
    }
    float3 _280 = float3(_6._m22.z, _6._m22.w, 0.0);
    float2 _283 = _280.zy;
    float4 _286 = _9.SampleLevel(_16, _3 + _283, 0.0);
    float2 _289 = _280.xz;
    float4 _292 = _9.SampleLevel(_16, _3 - _289, 0.0);
    float4 _297 = _9.SampleLevel(_16, _3 + _289, 0.0);
    float4 _302 = _9.SampleLevel(_16, _3 - _283, 0.0);
    float _305 = _286.x;
    float _306 = _286.y;
    float _307 = _286.z;
    float _308 = _292.x;
    float _309 = _292.y;
    float _310 = _292.z;
    float _314 = _297.x;
    float _315 = _297.y;
    float _316 = _297.z;
    float _317 = _302.x;
    float _318 = _302.y;
    float _319 = _302.z;
    float _323 = (_307 * 0.5) + ((_305 * 0.5) + _306);
    float _327 = (_310 * 0.5) + ((_308 * 0.5) + _309);
    float _331 = (_274.z * 0.5) + ((_274.x * 0.5) + _274.y);
    float _335 = (_316 * 0.5) + ((_314 * 0.5) + _315);
    float _339 = (_319 * 0.5) + ((_317 * 0.5) + _318);
    float _362 = min(min(_305, min(_308, _314)), _317);
    float _365 = min(min(_306, min(_309, _315)), _318);
    float _368 = min(min(_307, min(_310, _316)), _319);
    float _371 = max(max(_305, max(_308, _314)), _317);
    float _374 = max(max(_306, max(_309, _315)), _318);
    float _377 = max(max(_307, max(_310, _316)), _319);
    float _410 = (max(-0.1875, min(max(max(-(_362 * (0.25 / _371)), (1.0 - _371) * (1.0 / ((4.0 * _362) + (-4.0)))), max(max(-(_365 * (0.25 / _374)), (1.0 - _374) * (1.0 / ((4.0 * _365) + (-4.0)))), max(-(_368 * (0.25 / _377)), (1.0 - _377) * (1.0 / ((4.0 * _368) + (-4.0)))))), 0.0)) * _18._m24.x) * (((-0.5) * clamp(abs((0.25 * (((_323 + _327) + _335) + _339)) - _331) * (1.0 / (max(max(_323, max(_327, _331)), max(_335, _339)) - min(min(_323, min(_327, _331)), min(_335, _339)))), 0.0, 1.0)) + 1.0);
    float _413 = 1.0 / ((4.0 * _410) + 1.0);
    float3 _435 = float3(((_410 * (((_305 + _308) + _317) + _314)) + _274.x) * _413, ((_410 * (((_306 + _309) + _318) + _315)) + _274.y) * _413, ((_410 * (((_307 + _310) + _319) + _316)) + _274.z) * _413) * _6._m42.x;
    float3 _440 = _10.SampleLevel(_16, _3, 0.0).xyz;
    float _458 = max(max(_435.x, _435.y), _435.z);
    float _462 = clamp(_458 - _18._m10.y, 0.0, _18._m10.z);
    float4 _485 = _14.SampleLevel(_15, _3, 0.0);
    float3 _440_pow = exp2(log2(_440) * 0.3300000131130218505859375);
    _440_pow = (_440_pow * 1.49380004405975341796875) - float3(0.699999988079071044921875);
    float3 _440_mask = step(float3(0.300000011920928955078125), _440 * (1.0 - _18._m9.z));
    float3 _440_lerp = lerp(_440, _440_pow, _440_mask);
    float3 _tone_target = (_435 - ((_435 * (max((_18._m10.w * _462) * _462, _458 - _18._m10.x) / max(_458, 9.9999997473787516355514526367188e-05))) * _18._m9.z)) + (_440_lerp * _18._m11.xyz);
    float3 _extra_color = lerp(float3(1.0), _485.xyz, float3(lerp(_18._m3.x, clamp((_18._m3.x * 3.0) - 2.0, 0.0, 1.0), step(0.0, min(min(_485.x, _485.y), _485.z) - 0.20000000298023223876953125))));
    float3 untonemapped = lerp(_435, _tone_target, float3(_18._m9.x)) * _extra_color * _18._m7.w;
    renodx::lut::Config lut_config = renodx::lut::config::Create(
        _16,
        shader_injection.color_grade_strength,
        0.f,
        renodx::lut::config::type::ARRI_C1000_NO_CUT,
        renodx::lut::config::type::LINEAR,
        _18._m7.xyz
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
    _4.w = min(1, _134.w);
    
    output._4 = _4;
    return output;
}