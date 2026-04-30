#include "../common.hlsl"

[[vk::binding(5, 3)]]
cbuffer _5_6 : register(b5, space3)
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

[[vk::binding(4, 3)]]
cbuffer _12_13 : register(b4, space3)
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
} _13;

[[vk::binding(3, 3)]]
Texture2D<float4> _9 : register(t3, space3);
[[vk::binding(2, 3)]]
Texture2D<float4> _10 : register(t2, space3);
[[vk::binding(1, 3)]]
SamplerState _11 : register(s1, space3);


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
    
    float2 _102 = _3 - _13._m0.xy;
    float _104 = sqrt(dot(_102, _102));
    float _106 = 1.0 / max(0.00999999977648258209228515625, _104);
    float2 _112 = _102 * pow(_104 * _104, _13._m0.w * 0.5);
    float4 _116 = _9.SampleLevel(_11, _3, 0.0);
    float3 _119 = _116.xyz * float3(1.0, 0.0, 0.0);
    float3 _256;
    [branch]
    if (_13._m25.x > 3.0)
    {
        float2 _135 = lerp(_112, _112 * _106, bool2((_13._m25.w != 0.0) || (_13._m25.z != 0.0)));
        float _140 = _13._m0.z + _13._m25.y;
        float _169 = 2.0 * _13._m25.y;
        float _180 = 2.0 * _13._m0.z;
        float _181 = 3.0 * _13._m25.y;
    float3 _222 = ((((((((_119 + (_9.SampleLevel(_11, _3 - (_135 * _140), 0.0).xyz * float3(1.0, 0.0, 0.0))) + (_9.SampleLevel(_11, _3 - (_135 * (2.0 * _140)), 0.0).xyz * float3(1.0, 0.0, 0.0))) + (_9.SampleLevel(_11, _3 - (_135 * _13._m25.y), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_11, _3 - (_135 * (_13._m0.z + _169)), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_11, _3 - (_135 * (_180 + _181)), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_11, _3 - (_135 * _169), 0.0).xyz * float3(0.0, 0.0, 1.0))) + (_9.SampleLevel(_11, _3 - (_135 * (_13._m0.z + _181)), 0.0).xyz * float3(0.0, 0.0, 1.0))) + (_9.SampleLevel(_11, _3 - (_135 * (_180 + (4.0 * _13._m25.y))), 0.0).xyz * float3(0.0, 0.0, 1.0))) * 0.3333334028720855712890625;
        _256 = _222;
    }
    else
    {
        float2 _228 = lerp(_112, _112 * _106, bool2(_13._m25.w != 0.0));
        _256 = (_119 + (_9.SampleLevel(_11, _3 - (_228 * (_13._m0.z + (2.0 * _13._m25.y))), 0.0).xyz * float3(0.0, 1.0, 0.0))) + (_9.SampleLevel(_11, _3 - (_228 * ((2.0 * _13._m0.z) + (3.0 * _13._m25.y))), 0.0).xyz * float3(0.0, 0.0, 1.0));
    }
    float3 _262 = float3(_6._m22.z, _6._m22.w, 0.0);
    float2 _265 = _262.zy;
    float4 _268 = _9.SampleLevel(_11, _3 + _265, 0.0);
    float2 _271 = _262.xz;
    float4 _274 = _9.SampleLevel(_11, _3 - _271, 0.0);
    float4 _279 = _9.SampleLevel(_11, _3 + _271, 0.0);
    float4 _284 = _9.SampleLevel(_11, _3 - _265, 0.0);
    float _287 = _268.x;
    float _288 = _268.y;
    float _289 = _268.z;
    float _290 = _274.x;
    float _291 = _274.y;
    float _292 = _274.z;
    float _296 = _279.x;
    float _297 = _279.y;
    float _298 = _279.z;
    float _299 = _284.x;
    float _300 = _284.y;
    float _301 = _284.z;
    float _305 = (_289 * 0.5) + ((_287 * 0.5) + _288);
    float _309 = (_292 * 0.5) + ((_290 * 0.5) + _291);
    float _313 = (_256.z * 0.5) + ((_256.x * 0.5) + _256.y);
    float _317 = (_298 * 0.5) + ((_296 * 0.5) + _297);
    float _321 = (_301 * 0.5) + ((_299 * 0.5) + _300);
    float _344 = min(min(_287, min(_290, _296)), _299);
    float _347 = min(min(_288, min(_291, _297)), _300);
    float _350 = min(min(_289, min(_292, _298)), _301);
    float _353 = max(max(_287, max(_290, _296)), _299);
    float _356 = max(max(_288, max(_291, _297)), _300);
    float _359 = max(max(_289, max(_292, _298)), _301);
    float _392 = (max(-0.1875, min(max(max(-(_344 * (0.25 / _353)), (1.0 - _353) * (1.0 / ((4.0 * _344) + (-4.0)))), max(max(-(_347 * (0.25 / _356)), (1.0 - _356) * (1.0 / ((4.0 * _347) + (-4.0)))), max(-(_350 * (0.25 / _359)), (1.0 - _359) * (1.0 / ((4.0 * _350) + (-4.0)))))), 0.0)) * _13._m24.x) * (((-0.5) * clamp(abs((0.25 * (((_305 + _309) + _317) + _321)) - _313) * (1.0 / (max(max(_305, max(_309, _313)), max(_317, _321)) - min(min(_305, min(_309, _313)), min(_317, _321)))), 0.0, 1.0)) + 1.0);
    float _395 = 1.0 / ((4.0 * _392) + 1.0);
    float3 untonemapped = ((float3(((_392 * (((_287 + _290) + _299) + _296)) + _256.x) * _395, ((_392 * (((_288 + _291) + _300) + _297)) + _256.y) * _395, ((_392 * (((_289 + _292) + _301) + _298)) + _256.z) * _395) * _6._m42.x) * _13._m7.w);
    renodx::lut::Config lut_config = renodx::lut::config::Create(
        _11,
        shader_injection.color_grade_strength,
        0.f,
        renodx::lut::config::type::ARRI_C1000_NO_CUT,
        renodx::lut::config::type::LINEAR,
        _13._m7.xyz
    );
    float3 graded = renodx::lut::Sample(_10, lut_config, untonemapped);

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
    _4.w = min(1, _116.w);
    
    output._4 = _4;
    return output;
}