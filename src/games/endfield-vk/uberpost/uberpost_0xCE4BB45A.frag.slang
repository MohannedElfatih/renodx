#include "../common.hlsl"

[[vk::binding(6, 3)]]
cbuffer _5_6 : register(b6, space3)
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

[[vk::binding(5, 3)]]
cbuffer _13_14 : register(b5, space3)
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
} _14;

[[vk::binding(3, 3)]]
Texture2D<float4> _9 : register(t3, space3);
[[vk::binding(4, 3)]]
Texture2D<float4> _10 : register(t4, space3);
[[vk::binding(2, 3)]]
Texture2D<float4> _11 : register(t2, space3);
[[vk::binding(1, 3)]]
SamplerState _12 : register(s1, space3);


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
    
    float2 _114 = _3 - _14._m0.xy;
    float _116 = sqrt(dot(_114, _114));
    float _118 = 1.0 / max(0.00999999977648258209228515625, _116);
    float2 _124 = _114 * pow(_116 * _116, _14._m0.w * 0.5);
    float4 _128 = _9.SampleLevel(_12, _3, 0.0);
    float3 _131 = _128.xyz * float3(1.0, 0.0, 0.0);
    float3 _268;
    [branch]
    if (_14._m25.x > 3.0)
    {
        float2 _147 = lerp(_124, _124 * _118, bool2((_14._m25.w != 0.0) || (_14._m25.z != 0.0)));
        float _152 = _14._m0.z + _14._m25.y;
        float _181 = 2.0 * _14._m25.y;
        float _192 = 2.0 * _14._m0.z;
        float _193 = 3.0 * _14._m25.y;
    float3 _234 = ((((((((_131 + (_9.SampleLevel(_12, _3 - (_147 * _152), 0.0).xyz * float3(1.0, 0.0, 0.0))) + (_9.SampleLevel(_12, _3 - (_147 * (2.0 * _152)), 0.0).xyz * float3(1.0, 0.0, 0.0))) + (_9.SampleLevel(_12, _3 - (_147 * _14._m25.y), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_12, _3 - (_147 * (_14._m0.z + _181)), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_12, _3 - (_147 * (_192 + _193)), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_12, _3 - (_147 * _181), 0.0).xyz * float3(0.0, 0.0, 1.0))) + (_9.SampleLevel(_12, _3 - (_147 * (_14._m0.z + _193)), 0.0).xyz * float3(0.0, 0.0, 1.0))) + (_9.SampleLevel(_12, _3 - (_147 * (_192 + (4.0 * _14._m25.y))), 0.0).xyz * float3(0.0, 0.0, 1.0))) * 0.3333334028720855712890625;
        _268 = _234;
    }
    else
    {
        float2 _240 = lerp(_124, _124 * _118, bool2(_14._m25.w != 0.0));
        _268 = (_131 + (_9.SampleLevel(_12, _3 - (_240 * (_14._m0.z + (2.0 * _14._m25.y))), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_12, _3 - (_240 * ((2.0 * _14._m0.z) + (3.0 * _14._m25.y))), 0.0).xyz * float3(0.0, 0.0, 1.0));
    }
    float3 _274 = float3(_6._m22.z, _6._m22.w, 0.0);
    float2 _277 = _274.zy;
    float4 _280 = _9.SampleLevel(_12, _3 + _277, 0.0);
    float2 _283 = _274.xz;
    float4 _286 = _9.SampleLevel(_12, _3 - _283, 0.0);
    float4 _291 = _9.SampleLevel(_12, _3 + _283, 0.0);
    float4 _296 = _9.SampleLevel(_12, _3 - _277, 0.0);
    float _299 = _280.x;
    float _300 = _280.y;
    float _301 = _280.z;
    float _302 = _286.x;
    float _303 = _286.y;
    float _304 = _286.z;
    float _308 = _291.x;
    float _309 = _291.y;
    float _310 = _291.z;
    float _311 = _296.x;
    float _312 = _296.y;
    float _313 = _296.z;
    float _317 = (_301 * 0.5) + ((_299 * 0.5) + _300);
    float _321 = (_304 * 0.5) + ((_302 * 0.5) + _303);
    float _325 = (_268.z * 0.5) + ((_268.x * 0.5) + _268.y);
    float _329 = (_310 * 0.5) + ((_308 * 0.5) + _309);
    float _333 = (_313 * 0.5) + ((_311 * 0.5) + _312);
    float _356 = min(min(_299, min(_302, _308)), _311);
    float _359 = min(min(_300, min(_303, _309)), _312);
    float _362 = min(min(_301, min(_304, _310)), _313);
    float _365 = max(max(_299, max(_302, _308)), _311);
    float _368 = max(max(_300, max(_303, _309)), _312);
    float _371 = max(max(_301, max(_304, _310)), _313);
    float _404 = (max(-0.1875, min(max(max(-(_356 * (0.25 / _365)), (1.0 - _365) * (1.0 / ((4.0 * _356) + (-4.0)))), max(max(-(_359 * (0.25 / _368)), (1.0 - _368) * (1.0 / ((4.0 * _359) + (-4.0)))), max(-(_362 * (0.25 / _371)), (1.0 - _371) * (1.0 / ((4.0 * _362) + (-4.0)))))), 0.0)) * _14._m24.x) * (((-0.5) * clamp(abs((0.25 * (((_317 + _321) + _329) + _333)) - _325) * (1.0 / (max(max(_317, max(_321, _325)), max(_329, _333)) - min(min(_317, min(_321, _325)), min(_329, _333)))), 0.0, 1.0)) + 1.0);
    float _407 = 1.0 / ((4.0 * _404) + 1.0);
    float3 _429 = float3(((_404 * (((_299 + _302) + _311) + _308)) + _268.x) * _407, ((_404 * (((_300 + _303) + _312) + _309)) + _268.y) * _407, ((_404 * (((_301 + _304) + _313) + _310)) + _268.z) * _407) * _6._m42.x;
    float3 _434 = _10.SampleLevel(_12, _3, 0.0).xyz;
    float _452 = max(max(_429.x, _429.y), _429.z);
    float _456 = clamp(_452 - _14._m10.y, 0.0, _14._m10.z);
    float3 untonemapped = lerp(_429, (_429 - ((_429 * (max((_14._m10.w * _456) * _456, _452 - _14._m10.x) / max(_452, 9.9999997473787516355514526367188e-05))) * _14._m9.z)) + (lerp(_434, (pow(_434, float3(0.3300000131130218505859375)) * 1.49380004405975341796875) - float3(0.699999988079071044921875, 0.699999988079071044921875, 0.699999988079071044921875), (_434 * (1.0 - _14._m9.z) > float3(0.300000011920928955078125, 0.300000011920928955078125, 0.300000011920928955078125))) * _14._m11.xyz), float3(_14._m9.x, _14._m9.x, _14._m9.x)) * _14._m7.w;
    renodx::lut::Config lut_config = renodx::lut::config::Create(
        _12,
        shader_injection.color_grade_strength,
        0.f,
        renodx::lut::config::type::ARRI_C1000_NO_CUT,
        renodx::lut::config::type::LINEAR,
        _14._m7.xyz
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
    _4.w = min(1, _128.w);
    
    output._4 = _4;
    return output;
}