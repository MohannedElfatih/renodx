#include "../common.hlsl"


static const float _108[5] = {0.5, 1.0, 1.5, 2.0, 2.5};

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
    
    float2 _126 = _3 - _14._m0.xy;
    float _128 = sqrt(dot(_126, _126));
    float2 _138 = (_126 * pow(_128, _14._m0.w)) * lerp(1.0, 1.0 / max(0.00999999977648258209228515625, _128), _14._m25.z);
    float4 _142 = _9.SampleLevel(_12, _3, 0.0);
    float3 _146;
    _146 = _142.xyz;
    for (int _149 = 0; _149 < 5; )
    {
        _146 += _9.SampleLevel(_12, _3 - (_138 * (_108[_149] * _14._m0.z)), 0.0).xyz;
        _149++;
        continue;
    }
    float3 _165 = _146 * float3(0.16666667163372039794921875);
    float3 _171 = float3(_6._m22.z, _6._m22.w, 0.0);
    float2 _174 = _171.zy;
    float4 _177 = _9.SampleLevel(_12, _3 + _174, 0.0);
    float2 _180 = _171.xz;
    float4 _183 = _9.SampleLevel(_12, _3 - _180, 0.0);
    float4 _188 = _9.SampleLevel(_12, _3 + _180, 0.0);
    float4 _193 = _9.SampleLevel(_12, _3 - _174, 0.0);
    float _196 = _177.x;
    float _197 = _177.y;
    float _198 = _177.z;
    float _199 = _183.x;
    float _200 = _183.y;
    float _201 = _183.z;
    float _202 = _165.x;
    float _203 = _165.y;
    float _204 = _165.z;
    float _205 = _188.x;
    float _206 = _188.y;
    float _207 = _188.z;
    float _208 = _193.x;
    float _209 = _193.y;
    float _210 = _193.z;
    float _214 = (_198 * 0.5) + ((_196 * 0.5) + _197);
    float _218 = (_201 * 0.5) + ((_199 * 0.5) + _200);
    float _222 = (_204 * 0.5) + ((_202 * 0.5) + _203);
    float _226 = (_207 * 0.5) + ((_205 * 0.5) + _206);
    float _230 = (_210 * 0.5) + ((_208 * 0.5) + _209);
    float _253 = min(min(_196, min(_199, _205)), _208);
    float _256 = min(min(_197, min(_200, _206)), _209);
    float _259 = min(min(_198, min(_201, _207)), _210);
    float _262 = max(max(_196, max(_199, _205)), _208);
    float _265 = max(max(_197, max(_200, _206)), _209);
    float _268 = max(max(_198, max(_201, _207)), _210);
    float _301 = (max(-0.1875, min(max(max(-(_253 * (0.25 / _262)), (1.0 - _262) * (1.0 / ((4.0 * _253) + (-4.0)))), max(max(-(_256 * (0.25 / _265)), (1.0 - _265) * (1.0 / ((4.0 * _256) + (-4.0)))), max(-(_259 * (0.25 / _268)), (1.0 - _268) * (1.0 / ((4.0 * _259) + (-4.0)))))), 0.0)) * _14._m24.x) * (((-0.5) * clamp(abs((0.25 * (((_214 + _218) + _226) + _230)) - _222) * (1.0 / (max(max(_214, max(_218, _222)), max(_226, _230)) - min(min(_214, min(_218, _222)), min(_226, _230)))), 0.0, 1.0)) + 1.0);
    float _304 = 1.0 / ((4.0 * _301) + 1.0);
    float3 _326 = float3(((_301 * (((_196 + _199) + _208) + _205)) + _202) * _304, ((_301 * (((_197 + _200) + _209) + _206)) + _203) * _304, ((_301 * (((_198 + _201) + _210) + _207)) + _204) * _304) * _6._m42.x;
    float3 _331 = _10.SampleLevel(_12, _3, 0.0).xyz;
    float _349 = max(max(_326.x, _326.y), _326.z);
    float _353 = clamp(_349 - _14._m10.y, 0.0, _14._m10.z);
    float2 _383 = abs(_3 - _14._m1.xy) * lerp(_14._m2.x, 1.0, _14._m1.w);
    float _398 = _383.x * lerp(1.0, 1.5 * clamp(_14._m2.x * 1.0499999523162841796875, 0.0, 1.0), _14._m1.w);
    float2 _399 = float2(_398, clamp((_383.y * lerp(1.0, _14._m2.x * 2.0, _14._m1.w)) + (clamp(_14._m2.x - 2.7999999523162841796875, 0.0, 1.0) * 5.0), 0.0, 1.0));
    float _404 = _6._m22.x / _6._m22.y;
    _399.x = _398 * lerp(lerp(1.0, _404, _14._m2.w), _404 * 0.5625, _14._m1.w);
    float2 _416 = pow(clamp(_399, float2(0.0), float2(1.0)), float2(_14._m2.z));
    float3 untonemapped = (lerp(_326, (_326 - ((_326 * (max((_14._m10.w * _353) * _353, _349 - _14._m10.x) / max(_349, 9.9999997473787516355514526367188e-05))) * _14._m9.z)) + (lerp(_331, (pow(_331, float3(0.3300000131130218505859375)) * 1.49380004405975341796875) - float3(0.699999988079071044921875, 0.699999988079071044921875, 0.699999988079071044921875), (_331 * (1.0 - _14._m9.z) > float3(0.300000011920928955078125, 0.300000011920928955078125, 0.300000011920928955078125))) * _14._m11.xyz), float3(_14._m9.x, _14._m9.x, _14._m9.x)) * lerp(_14._m4.xyz, float3(1.0, 1.0, 1.0), float3(pow(clamp(1.0 - dot(_416, _416), 0.0, 1.0), _14._m2.y), pow(clamp(1.0 - dot(_416, _416), 0.0, 1.0), _14._m2.y), pow(clamp(1.0 - dot(_416, _416), 0.0, 1.0), _14._m2.y)))) * _14._m7.w;
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
    _4.w = min(1, _142.w);
    
    output._4 = _4;
    return output;
}