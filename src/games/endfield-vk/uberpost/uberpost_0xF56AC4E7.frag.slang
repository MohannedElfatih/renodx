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
    
    float4 _114 = _9.SampleLevel(_12, _3, 0.0);
    float3 _121 = float3(_6._m22.z, _6._m22.w, 0.0);
    float2 _124 = _121.zy;
    float4 _127 = _9.SampleLevel(_12, _3 + _124, 0.0);
    float2 _130 = _121.xz;
    float4 _133 = _9.SampleLevel(_12, _3 - _130, 0.0);
    float4 _138 = _9.SampleLevel(_12, _3 + _130, 0.0);
    float4 _143 = _9.SampleLevel(_12, _3 - _124, 0.0);
    float _146 = _127.x;
    float _147 = _127.y;
    float _148 = _127.z;
    float _149 = _133.x;
    float _150 = _133.y;
    float _151 = _133.z;
    float _152 = _114.x;
    float _153 = _114.y;
    float _154 = _114.z;
    float _155 = _138.x;
    float _156 = _138.y;
    float _157 = _138.z;
    float _158 = _143.x;
    float _159 = _143.y;
    float _160 = _143.z;
    float _164 = (_148 * 0.5) + ((_146 * 0.5) + _147);
    float _168 = (_151 * 0.5) + ((_149 * 0.5) + _150);
    float _172 = (_154 * 0.5) + ((_152 * 0.5) + _153);
    float _176 = (_157 * 0.5) + ((_155 * 0.5) + _156);
    float _180 = (_160 * 0.5) + ((_158 * 0.5) + _159);
    float _203 = min(min(_146, min(_149, _155)), _158);
    float _206 = min(min(_147, min(_150, _156)), _159);
    float _209 = min(min(_148, min(_151, _157)), _160);
    float _212 = max(max(_146, max(_149, _155)), _158);
    float _215 = max(max(_147, max(_150, _156)), _159);
    float _218 = max(max(_148, max(_151, _157)), _160);
    float _251 = (max(-0.1875, min(max(max(-(_203 * (0.25 / _212)), (1.0 - _212) * (1.0 / ((4.0 * _203) + (-4.0)))), max(max(-(_206 * (0.25 / _215)), (1.0 - _215) * (1.0 / ((4.0 * _206) + (-4.0)))), max(-(_209 * (0.25 / _218)), (1.0 - _218) * (1.0 / ((4.0 * _209) + (-4.0)))))), 0.0)) * _14._m24.x) * (((-0.5) * clamp(abs((0.25 * (((_164 + _168) + _176) + _180)) - _172) * (1.0 / (max(max(_164, max(_168, _172)), max(_176, _180)) - min(min(_164, min(_168, _172)), min(_176, _180)))), 0.0, 1.0)) + 1.0);
    float _254 = 1.0 / ((4.0 * _251) + 1.0);
    float3 _276 = float3(((_251 * (((_146 + _149) + _158) + _155)) + _152) * _254, ((_251 * (((_147 + _150) + _159) + _156)) + _153) * _254, ((_251 * (((_148 + _151) + _160) + _157)) + _154) * _254) * _6._m42.x;
    float3 _281 = _10.SampleLevel(_12, _3, 0.0).xyz;
    float _299 = max(max(_276.x, _276.y), _276.z);
    float _303 = clamp(_299 - _14._m10.y, 0.0, _14._m10.z);
    float2 _333 = abs(_3 - _14._m1.xy) * lerp(_14._m2.x, 1.0, _14._m1.w);
    float _348 = _333.x * lerp(1.0, 1.5 * clamp(_14._m2.x * 1.0499999523162841796875, 0.0, 1.0), _14._m1.w);
    float2 _349 = float2(_348, clamp((_333.y * lerp(1.0, _14._m2.x * 2.0, _14._m1.w)) + (clamp(_14._m2.x - 2.7999999523162841796875, 0.0, 1.0) * 5.0), 0.0, 1.0));
    float _354 = _6._m22.x / _6._m22.y;
    _349.x = _348 * lerp(lerp(1.0, _354, _14._m2.w), _354 * 0.5625, _14._m1.w);
    float2 _366 = pow(clamp(_349, float2(0.0), float2(1.0)), float2(_14._m2.z));
    float3 untonemapped = (lerp(_276, (_276 - ((_276 * (max((_14._m10.w * _303) * _303, _299 - _14._m10.x) / max(_299, 9.9999997473787516355514526367188e-05))) * _14._m9.z)) + (lerp(_281, (pow(_281, float3(0.3300000131130218505859375)) * 1.49380004405975341796875) - float3(0.699999988079071044921875, 0.699999988079071044921875, 0.699999988079071044921875), (_281 * (1.0 - _14._m9.z) > float3(0.300000011920928955078125, 0.300000011920928955078125, 0.300000011920928955078125))) * _14._m11.xyz), float3(_14._m9.x, _14._m9.x, _14._m9.x)) * lerp(_14._m4.xyz, float3(1.0, 1.0, 1.0), float3(pow(clamp(1.0 - dot(_366, _366), 0.0, 1.0), _14._m2.y), pow(clamp(1.0 - dot(_366, _366), 0.0, 1.0), _14._m2.y), pow(clamp(1.0 - dot(_366, _366), 0.0, 1.0), _14._m2.y)))) * _14._m7.w;
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
    _4.w = min(1, _114.w);
    
    output._4 = _4;
    return output;
}