#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_KHR_shader_subgroup_basic : require
#extension GL_KHR_shader_subgroup_quad : require
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

struct _51
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    float _m3;
    float _m4;
    float _m5;
    uint _m6;
    uint _m7;
    float _m8;
    ivec2 _m9;
};

struct _54
{
    vec3 _m0;
    uint _m1;
    vec4 _m2;
    vec2 _m3;
    uint _m4;
    float _m5;
    mat4x3 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    float _m10;
};

struct _58
{
    vec4 _m0;
    mat4x3 _m1;
    vec4 _m2[4];
    float _m3;
    float _m4;
    uint _m5;
    uint _m6;
};

struct _63
{
    mat4 _m0;
    vec2 _m1;
    float _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    float _m6;
};

float _300;
const vec4 _311[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _339;
vec3 _343;
vec3 _344;

layout(set = 1, binding = 13, std430) readonly buffer _46_6
{
    float _m0[];
} _6;

layout(set = 1, binding = 23, std430) readonly buffer _48_8
{
    ivec4 _m0[];
} _8;

layout(set = 1, binding = 24, std430) readonly buffer _50_9
{
    int _m0[];
} _9;

layout(set = 1, binding = 25, std430) readonly buffer _53_10
{
    _51 _m0[];
} _10;

layout(set = 1, binding = 29, std430) readonly buffer _56_11
{
    layout(row_major) _54 _m0[];
} _11;

layout(set = 1, binding = 33, std430) readonly buffer _60_13
{
    layout(row_major) _58 _m0[];
} _13;

layout(set = 1, binding = 39, std140) uniform _62_19
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    float _m5;
    float _m6;
    float _m7;
    vec4 _m8;
    vec4 _m9;
    layout(row_major) mat4 _m10[4];
    float _m11;
    float _m12;
    float _m13;
    uint _m14;
    vec2 _m15;
    vec2 _m16;
    vec3 _m17;
    float _m18;
    layout(row_major) mat4x3 _m19;
    vec4 _m20[4];
    float _m21;
    float _m22;
    float _m23;
    float _m24;
    uint _m25;
    uint _m26;
    float _m27;
    float _m28;
    float _m29;
    float _m30;
    float _m31;
    float _m32;
    vec2 _m33;
    vec2 _m34;
} _19;

layout(set = 1, binding = 40, scalar) readonly buffer _65_20
{
    layout(row_major) _63 _m0[];
} _20;

layout(set = 0, binding = 1, std140) uniform _67_26
{
    vec3 _m0;
    float _m1;
    vec3 _m2;
    float _m3;
    vec3 _m4;
    float _m5;
    layout(row_major) mat4 _m6;
    vec4 _m7[3];
    vec4 _m8;
    vec4 _m9;
    float _m10;
    float _m11;
    float _m12;
    float _m13;
    float _m14;
    float _m15;
    float _m16;
    float _m17;
    vec4 _m18;
    float _m19;
    float _m20;
    float _m21;
    float _m22;
    vec4 _m23;
    vec3 _m24;
    float _m25;
    vec3 _m26;
    float _m27;
    vec4 _m28;
    vec3 _m29;
    float _m30;
    vec4 _m31;
    vec3 _m32;
    float _m33;
    vec3 _m34;
    float _m35;
    vec3 _m36;
    float _m37;
} _26;

layout(set = 0, binding = 2, std140) uniform _68_27
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    vec3 _m6;
    int _m7;
} _27;

layout(set = 0, binding = 4, std140) uniform _69_28
{
    vec2 _m0;
    vec2 _m1;
    uvec2 _m2;
    uvec2 _m3;
    uvec2 _m4;
    uint _m5;
    uint _m6;
    vec2 _m7;
    vec2 _m8;
    vec2 _m9;
    vec2 _m10;
    vec2 _m11;
    vec2 _m12;
    vec2 _m13;
    vec2 _m14;
    vec2 _m15;
    vec2 _m16;
    uvec2 _m17;
    uvec2 _m18;
    uvec2 _m19;
    uvec2 _m20;
    vec2 _m21;
    vec2 _m22;
} _28;

layout(set = 5, binding = 0, scalar) uniform _71_29
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    vec3 _m5;
    float _m6;
    vec3 _m7;
    vec3 _m8;
    float _m9;
} _29;

layout(set = 1, binding = 0, scalar) uniform _72_34
{
    vec4 _m0;
    uvec2 _m1;
    uint _m2;
    uint _m3;
    uint _m4;
    uvec3 _m5;
} _34;

layout(set = 1, binding = 9, std430) readonly buffer _73_42
{
    uint _m0[];
} _42;

layout(set = 1, binding = 16) uniform sampler _7;
layout(set = 1, binding = 32) uniform sampler _12;
layout(set = 1, binding = 34) uniform textureCube _14;
layout(set = 1, binding = 35) uniform textureCube _15;
layout(set = 1, binding = 36) uniform textureCube _16;
layout(set = 1, binding = 37) uniform textureCube _17;
layout(set = 1, binding = 38) uniform texture2D _18;
layout(set = 1, binding = 41) uniform texture2D _21;
layout(set = 1, binding = 42) uniform texture2D _22;
layout(set = 1, binding = 43) uniform texture2D _23;
layout(set = 1, binding = 45) uniform textureCube _24[];
layout(set = 1, binding = 45) uniform texture2D _25[];
layout(set = 5, binding = 1) uniform texture2D _30;
layout(set = 5, binding = 2) uniform texture3D _31;
layout(set = 5, binding = 4) uniform texture2D _32;
layout(set = 5, binding = 5) uniform texture2D _33;
layout(set = 1, binding = 1) uniform texture2D _35;
layout(set = 1, binding = 2) uniform texture2D _36;
layout(set = 1, binding = 3) uniform texture2D _37;
layout(set = 1, binding = 4) uniform texture2D _38;
layout(set = 1, binding = 5) uniform texture2D _39;
layout(set = 1, binding = 6) uniform texture2D _40;
layout(set = 1, binding = 7) uniform texture2D _41;
layout(set = 1, binding = 10, rgba32f) uniform writeonly image2D _43;
layout(set = 1, binding = 11, rgba32f) uniform writeonly image2D _44;

layout(push_constant) uniform RenoDXPushConstants {
    float peak_white_nits;              // 0
    float diffuse_white_nits;           // 4
    float graphics_white_nits;          // 8
    float gamma_correction;             // 12
    float tone_map_exposure;            // 16
    float tone_map_highlights;          // 20
    float tone_map_shadows;             // 24
    float tone_map_contrast;            // 28
    float tone_map_saturation;          // 32
    float tone_map_highlight_saturation;// 36
    float tone_map_dechroma;            // 40
    float tone_map_flare;               // 44
    float color_grade_strength;         // 48
    float tone_map_hue_shift;           // 52
    float tone_map_blowout;             // 56
    float custom_curve;                 // 60
    float hue_correction;               // 64
    float custom_random;                // 68
    float custom_grain_strength;        // 72
    float custom_bloom;                 // 76
    float rendering_multi_scatter;      // 80
    float rendering_cubemap_mod;        // 84
    float rendering_ao_direct;          // 88
    float rendering_shadow_improvements; // 92
    float rendering_micro_shadows;       // 96
    float rendering_micro_shadows_debug; // 100
} pc;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

// --- RenoDX: Depth-Bias Micro Detail Shadow (Bend Studio technique) ---
float rdx_micro_shadow_march(
    texture2D depthTex, sampler samp,
    vec2 pixelUV, vec2 marchDir,
    float originDepth, vec2 viewportSize)
{
    ivec2 baseCoord = ivec2(pixelUV * viewportSize);
    ivec2 vpSize = ivec2(viewportSize);
    float thickness = max(originDepth * 0.005, 0.0004);
    float occlusion = 0.0;
    for (int i = 1; i <= 16; i++) {
        ivec2 samplePos = baseCoord + ivec2(round(marchDir * 2.0 * float(i)));
        if (any(lessThan(samplePos, ivec2(0))) || any(greaterThanEqual(samplePos, vpSize)))
            break;
        float sd = texelFetch(sampler2D(depthTex, samp), samplePos, 0).x;
        float dd = originDepth - sd;
        if (dd > 0.0 && dd < thickness) {
            float depthWeight = smoothstep(0.0, thickness * 0.2, dd)
                              * (1.0 - smoothstep(thickness * 0.7, thickness, dd));
            float distFade = 1.0 - float(i) / 17.0;
            occlusion = max(occlusion, depthWeight * distFade);
        }
    }
    return 1.0 - occlusion * 0.5;
}

// --- RenoDX: Multi-Scatter GGX (Kulla-Conty) ---
float rdx_ggx_directional_albedo(float NdotV, float roughness) {
    float mu = NdotV, a = roughness, a2 = a * a, mu2 = mu * mu;
    return clamp(1.0
        + mu  * (-1.0816 + a * 0.0378)
        + mu2 * ( 0.1696 + a * 0.0856)
        + a   * (-0.6992 + a * (1.4424 + a * (-1.3616 + a * 0.4504))),
        0.0, 1.0);
}

float rdx_ggx_average_albedo(float roughness) {
    float a = roughness;
    return clamp(1.0 + a * (-0.7127 + a * (0.4364 + a * (-0.1188))), 0.0, 1.0);
}

vec3 rdx_multi_scatter_compensation(float NdotV, float roughness, vec3 F0) {
    float Eo   = rdx_ggx_directional_albedo(NdotV, roughness);
    float Eavg = rdx_ggx_average_albedo(roughness);
    vec3  Favg = F0 + (1.0 / 21.0) * (vec3(1.0) - F0);
    vec3  denom = max(vec3(1.0) - Favg * (1.0 - Eavg), vec3(1e-5));
    return min(vec3(1.0) + Favg * (1.0 - Eo) / (max(Eo, 1e-5) * denom), vec3(4.0));
}

// --- RenoDX: Cubemap / IBL Modulation ---
float rdx_cubemap_modulation(vec3 skyLight, float roughness) {
    float skyLum = max(0.0, dot(skyLight, vec3(0.2126, 0.7152, 0.0722)));
    float mod_factor = smoothstep(0.0, 0.25, skyLum)
                     * mix(0.5, 1.0, clamp(roughness, 0.0, 1.0));
    return mix(0.3, 1.0, mod_factor);
}

void main()
{
    do
    {
        uint _383 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _385 = _42._m0[_383];
        uvec2 _390 = (uvec2(_385 & 65535u, _385 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_390, _28._m3)) || any(greaterThan(_390, _28._m4)))
        {
            break;
        }
        vec2 _402 = vec2(_390);
        vec2 _407 = (_402 + vec2(0.5)) / vec2(_34._m1);
        vec2 _414 = ((_407 - _28._m1) / _28._m0) * 0.5;
        float _418 = _414.x;
        float _420 = _414.y;
        ivec2 _438 = ivec3(int(_390.x), int(_390.y), 0).xy;
        vec4 _442 = texelFetch(_36, _438, 0);
        vec4 _444 = texelFetch(_37, _438, 0);
        vec4 _446 = texelFetch(_38, _438, 0);
        vec4 _448 = texelFetch(_39, _438, 0);
        float _449 = _448.x;
        vec3 _467;
        do
        {
            vec3 _455 = fma(vec3(texelFetch(_35, _438, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _456 = dot(_455, _455);
            if (_456 > 54000001024.0)
            {
                _467 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _461 = 2.0 / _456;
                vec2 _463 = _455.xy * _461;
                vec3 _464 = vec3(_463.x, _463.y, _343.z);
                _464.z = 1.0 - _461;
                _467 = _464;
                break;
            }
            break; // unreachable workaround
        } while(false);
        vec3 _468 = _442.xyz;
        float _470 = _444.y;
        float _471 = _444.z;
        uint _475 = uint(roundEven(_444.w * 255.0));
        uint _476 = _475 & 7u;
        uint _478 = (_475 & 112u) >> 4u;
        vec3 _488 = _467 * mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        float _497 = spvNMax(0.0900000035762786865234375, _444.x);
        bool _498 = _476 == 6u;
        vec3 _507;
        vec4 _508;
        if (_498)
        {
            _507 = _446.xyz;
            _508 = vec4(_446.xyz, 0.0);
        }
        else
        {
            _507 = mix(vec3(0.1599999964237213134765625 * (_470 * _470)), _468, vec3(_471));
            _508 = vec4(0.0);
        }
        vec3 _510 = mix(vec3(_442.x, _442.y, _442.z) * (1.0 - _471), _468, bvec3(_498));
        vec3 _511 = (((_26._m7[0].xyz * ((1.0 - _418) - _420)) + (_26._m7[1].xyz * _418)) + (_26._m7[2].xyz * _420)) * _449;
        vec3 _513 = normalize(-_511);
        uint _515 = gl_SubgroupInvocationID & 3u;
        float _520 = ((_515 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _521 = (subgroupQuadSwapHorizontal(_467) - _467) * _520;
        float _526 = ((_515 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _527 = (subgroupQuadSwapVertical(_467) - _467) * _526;
        vec3 _531 = mix(_521, vec3(0.0), bvec3(any(isnan(_521))));
        vec3 _535 = mix(_527, vec3(0.0), bvec3(any(isnan(_527))));
        float _542 = sqrt(clamp(fma(_497, _497, spvNMin(dot(_531, _531) + dot(_535, _535), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _551 = ivec2(uvec2(_402) / uvec2(_19._m25));
        int _574 = int(fma(fma(float(int(clamp(fma(log2(_449 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_551.y)), _19._m23, float(_551.x)));
        float _577 = _402.x;
        float _578 = _402.y;
        float _583 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _577, 0.005837149918079376220703125 * _578)));
        float _590 = clamp(fma(_19._m34.y, length(_511), _19._m34.x), 0.0, 1.0);
        bool _591 = _476 == 0u;
        vec3 _2740;
        vec3 _2741;
        SPIRV_CROSS_BRANCH
        if (_591)
        {
            uvec4 _1702 = uvec4(_8._m0[uint(_574)]);
            uint _1703 = _1702.x;
            uint _1704 = _1702.y;
            uint _1707 = ((_1704 >> 0u) & 4095u) + _1703;
            uint _1710 = ((_1704 >> 12u) & 4095u) + _1707;
            uint _1714 = ((_1702.z >> 0u) & 1023u) + _1710;
            float _1716 = spvNMax(dot(_488, _513), 9.9999997473787516355514526367188e-06);
            float _1718;
            bool _1721;
            vec3 _1723;
            vec3 _1725;
            uint _1727;
            _1718 = _300;
            _1721 = false;
            _1723 = vec3(0.0);
            _1725 = vec3(0.0);
            _1727 = _1703;
            float _1719;
            bool _1722;
            vec3 _1724;
            vec3 _1726;
            for (; _1727 < _1707; _1718 = _1719, _1721 = _1722, _1723 = _1724, _1725 = _1726, _1727++)
            {
                uint _1734 = uint(_9._m0[_1727]);
                float _1752 = abs(_10._m0[_1734]._m5);
                if ((_10._m0[_1734]._m6 & (1u << (_478 & 31u))) != 0u)
                {
                    vec3 _1767 = _10._m0[_1734]._m0.xyz - _511;
                    float _1768 = dot(_1767, _1767);
                    vec3 _1771 = _1767 * inversesqrt(spvNMax(_1768, 1.0000000133514319600180897396058e-10));
                    float _1772 = _10._m0[_1734]._m0.w * _10._m0[_1734]._m0.w;
                    float _2010;
                    bool _2011;
                    vec3 _2012;
                    vec3 _2013;
                    if (_1768 < (1.0 / _1772))
                    {
                        vec3 _1777 = _513 + _1771;
                        vec3 _1781 = _1777 * inversesqrt(spvNMax(dot(_1777, _1777), 1.0000000133514319600180897396058e-10));
                        float _1783 = clamp(dot(_1771, _1781), 0.0, 1.0);
                        float _1785 = clamp(dot(_488, _1781), 0.0, 1.0);
                        float _1787 = clamp(dot(_488, _1771), 0.0, 1.0);
                        float _1788 = _1768 * _1772;
                        float _1794 = pow(spvNMax(abs(clamp(fma(-_1788, _1788, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1734]._m4);
                        float _1804;
                        if (_10._m0[_1734]._m5 < 0.0)
                        {
                            _1804 = _1794 * fma(4.0, _1772, _1752);
                        }
                        else
                        {
                            _1804 = _1794 * ((1.0 / spvNMax(_1768, 9.9999997473787516355514526367188e-05)) + _1752);
                        }
                        float _1806 = 0.079577468335628509521484375 * (_1787 * _1804);
                        float _1941;
                        bool _1942;
                        float _1943;
                        if ((_10._m0[_1734]._m7 & 1u) != 0u)
                        {
                            uint _1831;
                            do
                            {
                                vec3 _1811 = -_1771;
                                float _1812 = dot(_1811, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _1813 = dot(_1811, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _1814 = dot(_1811, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _1818 = spvNMax(spvNMax(_1812, _1813), spvNMax(_1814, dot(_1811, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_1818 == _1812)
                                {
                                    _1831 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_1818 == _1813)
                                    {
                                        _1831 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_1818 == _1814)
                                        {
                                            _1831 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _1831 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _1833 = uint(int(_10._m0[_1734]._m7 >> 2u)) + _1831;
                            float _1935;
                            bool _1936;
                            float _1937;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_1787 <= 0.0) && true)
                                {
                                    _1935 = _1718;
                                    _1936 = _1721;
                                    _1937 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _1866 = _20._m0[_1833]._m0 * vec4(_511 + (_488 * ((3.5 * float(int(sign(_1787)))) * (_20._m0[_1833]._m4 * sqrt(_1768)))), 1.0);
                                    vec3 _1870 = _1866.xyz / vec3(_1866.w);
                                    vec2 _1873 = (_1870.xy * 0.5) + vec2(0.5);
                                    _1873.y = 1.0 - _1873.y;
                                    float _1882 = (_20._m0[_1833]._m5.y / _20._m0[_1833]._m6) / (_1870.z - _20._m0[_1833]._m5.x);
                                    float _1887 = _1721 ? _1718 : 6.283185482025146484375;
                                    float _1888 = _583 * _1887;
                                    vec2 _1889 = _20._m0[_1833]._m1 + _19._m33;
                                    vec2 _1892 = (_20._m0[_1833]._m1 + vec2(_20._m0[_1833]._m2)) - _19._m33;
                                    float _1894;
                                    _1894 = 0.0;
                                    for (int _1897 = 0; _1897 < 12; )
                                    {
                                        float _1902 = float(uint(_1897));
                                        float _1905 = sqrt(_1902 + 0.5) * 0.288675129413604736328125;
                                        float _1906 = fma(_1902, 2.3999631404876708984375, _1888);
                                        vec2 _1914 = clamp(fma((vec3(cos(_1906), sin(_1906), _1905).xy * _1905) * 2.5, _19._m33, _1873), _1889, _1892);
                                        vec2 _1917 = fract(fma(vec2(1.0) / _19._m33, _1914, vec2(0.5)));
                                        vec4 _1923 = vec4(lessThan(vec4(_1882), textureGather(sampler2D(_21, _12), _1914)));
                                        float _1926 = _1917.x;
                                        _1894 += clamp(mix(mix(_1923.w, _1923.z, _1926), mix(_1923.x, _1923.y, _1926), _1917.y), 0.0, 1.0);
                                        _1897++;
                                        continue;
                                    }
                                    _1935 = _1887;
                                    _1936 = _1721 ? _1721 : true;
                                    _1937 = _1894 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _1941 = _1935;
                            _1942 = _1936;
                            _1943 = _1806 * mix(1.0, _1937, spvNMin(_590, _10._m0[_1734]._m8));
                        }
                        else
                        {
                            _1941 = _1718;
                            _1942 = _1721;
                            _1943 = _1806;
                        }
                        vec3 _2008;
                        vec3 _2009;
                        if (_1787 > 0.0)
                        {
                            vec3 _1949 = _10._m0[_1734]._m1.xyz * (_1943 * ((_10._m0[_1734]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _1956 = vec3(fma((2.0 * _1783) * _1783, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                            float _1977 = (_542 + 1.0) * 0.5;
                            float _1978 = _542 * _542;
                            float _1986 = _1977 * _1977;
                            float _1998 = _1978 * _1978;
                            float _2001 = fma(fma(_1785, _1998, -_1785), _1785, 1.0);
                            _2008 = fma(_1949, (_507 + ((vec3(1.0) - _507) * pow(spvNMax(abs(1.0 - _1783), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1787, sqrt(fma(fma(-_1716, _1986, _1716), _1716, _1986)), _1716 * sqrt(fma(fma(-_1787, _1986, _1787), _1787, _1986)))) * (_1998 * (0.3183098733425140380859375 / (_2001 * _2001)))), _1723);
                            _2009 = fma(_1949, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1956 * pow(spvNMax(abs(1.0 - _1787), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1956 * pow(spvNMax(abs(1.0 - _1716), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _1725);
                        }
                        else
                        {
                            _2008 = _1723;
                            _2009 = _1725;
                        }
                        _2010 = _1941;
                        _2011 = _1942;
                        _2012 = _2008;
                        _2013 = _2009;
                    }
                    else
                    {
                        _2010 = _1718;
                        _2011 = _1721;
                        _2012 = _1723;
                        _2013 = _1725;
                    }
                    _1719 = _2010;
                    _1722 = _2011;
                    _1724 = _2012;
                    _1726 = _2013;
                }
                else
                {
                    _1719 = _1718;
                    _1722 = _1721;
                    _1724 = _1723;
                    _1726 = _1725;
                }
            }
            float _2015;
            bool _2018;
            vec3 _2020;
            vec3 _2022;
            uint _2024;
            _2015 = _1718;
            _2018 = _1721;
            _2020 = _1723;
            _2022 = _1725;
            _2024 = _1727;
            float _2016;
            bool _2019;
            vec3 _2021;
            vec3 _2023;
            for (; _2024 < _1710; _2015 = _2016, _2018 = _2019, _2020 = _2021, _2022 = _2023, _2024++)
            {
                uint _2031 = uint(_9._m0[_2024]);
                float _2044 = abs(_10._m0[_2031]._m5);
                if ((_10._m0[_2031]._m6 & (1u << (_478 & 31u))) != 0u)
                {
                    vec3 _2062 = _10._m0[_2031]._m0.xyz - _511;
                    float _2063 = dot(_2062, _2062);
                    vec3 _2066 = _2062 * inversesqrt(spvNMax(_2063, 1.0000000133514319600180897396058e-10));
                    float _2067 = _10._m0[_2031]._m0.w * _10._m0[_2031]._m0.w;
                    float _2295;
                    bool _2296;
                    vec3 _2297;
                    vec3 _2298;
                    if (_2063 < (1.0 / _2067))
                    {
                        vec3 _2072 = _513 + _2066;
                        vec3 _2076 = _2072 * inversesqrt(spvNMax(dot(_2072, _2072), 1.0000000133514319600180897396058e-10));
                        float _2078 = clamp(dot(_2066, _2076), 0.0, 1.0);
                        float _2080 = clamp(dot(_488, _2076), 0.0, 1.0);
                        float _2082 = clamp(dot(_488, _2066), 0.0, 1.0);
                        float _2085 = dot(-_2066, normalize(_10._m0[_2031]._m2.xyz));
                        float _2114;
                        if (_2085 > _10._m0[_2031]._m1.w)
                        {
                            float _2089 = _2063 * _2067;
                            float _2095 = pow(spvNMax(abs(clamp(fma(-_2089, _2089, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_2031]._m4);
                            float _2105;
                            if (_10._m0[_2031]._m5 < 0.0)
                            {
                                _2105 = _2095 * fma(4.0, _2067, _2044);
                            }
                            else
                            {
                                _2105 = _2095 * ((1.0 / spvNMax(_2063, 9.9999997473787516355514526367188e-05)) + _2044);
                            }
                            float _2110 = clamp((_2085 - _10._m0[_2031]._m1.w) / spvNMax(_10._m0[_2031]._m2.w - _10._m0[_2031]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _2114 = _2082 * (_2105 * (_2110 * _2110));
                        }
                        else
                        {
                            _2114 = 0.0;
                        }
                        float _2115 = 0.3183098733425140380859375 * _2114;
                        float _2226;
                        bool _2227;
                        float _2228;
                        if ((_10._m0[_2031]._m7 & 1u) != 0u)
                        {
                            uint _2118 = uint(int(_10._m0[_2031]._m7 >> 2u));
                            float _2220;
                            bool _2221;
                            float _2222;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2082 <= 0.0) && true)
                                {
                                    _2220 = _2015;
                                    _2221 = _2018;
                                    _2222 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2151 = _20._m0[_2118]._m0 * vec4(_511 + (_488 * ((3.5 * float(int(sign(_2082)))) * (_20._m0[_2118]._m4 * sqrt(_2063)))), 1.0);
                                    vec3 _2155 = _2151.xyz / vec3(_2151.w);
                                    vec2 _2158 = (_2155.xy * 0.5) + vec2(0.5);
                                    _2158.y = 1.0 - _2158.y;
                                    float _2167 = (_20._m0[_2118]._m5.y / _20._m0[_2118]._m6) / (_2155.z - _20._m0[_2118]._m5.x);
                                    float _2172 = _2018 ? _2015 : 6.283185482025146484375;
                                    float _2173 = _583 * _2172;
                                    vec2 _2174 = _20._m0[_2118]._m1 + _19._m33;
                                    vec2 _2177 = (_20._m0[_2118]._m1 + vec2(_20._m0[_2118]._m2)) - _19._m33;
                                    float _2179;
                                    _2179 = 0.0;
                                    for (int _2182 = 0; _2182 < 12; )
                                    {
                                        float _2187 = float(uint(_2182));
                                        float _2190 = sqrt(_2187 + 0.5) * 0.288675129413604736328125;
                                        float _2191 = fma(_2187, 2.3999631404876708984375, _2173);
                                        vec2 _2199 = clamp(fma((vec3(cos(_2191), sin(_2191), _2190).xy * _2190) * 2.5, _19._m33, _2158), _2174, _2177);
                                        vec2 _2202 = fract(fma(vec2(1.0) / _19._m33, _2199, vec2(0.5)));
                                        vec4 _2208 = vec4(lessThan(vec4(_2167), textureGather(sampler2D(_21, _12), _2199)));
                                        float _2211 = _2202.x;
                                        _2179 += clamp(mix(mix(_2208.w, _2208.z, _2211), mix(_2208.x, _2208.y, _2211), _2202.y), 0.0, 1.0);
                                        _2182++;
                                        continue;
                                    }
                                    _2220 = _2172;
                                    _2221 = _2018 ? _2018 : true;
                                    _2222 = _2179 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2226 = _2220;
                            _2227 = _2221;
                            _2228 = _2115 * mix(1.0, _2222, spvNMin(_590, _10._m0[_2031]._m8));
                        }
                        else
                        {
                            _2226 = _2015;
                            _2227 = _2018;
                            _2228 = _2115;
                        }
                        vec3 _2293;
                        vec3 _2294;
                        if (_2082 > 0.0)
                        {
                            vec3 _2234 = _10._m0[_2031]._m1.xyz * (_2228 * ((_10._m0[_2031]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2241 = vec3(fma((2.0 * _2078) * _2078, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                            float _2262 = (_542 + 1.0) * 0.5;
                            float _2263 = _542 * _542;
                            float _2271 = _2262 * _2262;
                            float _2283 = _2263 * _2263;
                            float _2286 = fma(fma(_2080, _2283, -_2080), _2080, 1.0);
                            _2293 = fma(_2234, (_507 + ((vec3(1.0) - _507) * pow(spvNMax(abs(1.0 - _2078), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2082, sqrt(fma(fma(-_1716, _2271, _1716), _1716, _2271)), _1716 * sqrt(fma(fma(-_2082, _2271, _2082), _2082, _2271)))) * (_2283 * (0.3183098733425140380859375 / (_2286 * _2286)))), _2020);
                            _2294 = fma(_2234, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2241 * pow(spvNMax(abs(1.0 - _2082), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2241 * pow(spvNMax(abs(1.0 - _1716), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _2022);
                        }
                        else
                        {
                            _2293 = _2020;
                            _2294 = _2022;
                        }
                        _2295 = _2226;
                        _2296 = _2227;
                        _2297 = _2293;
                        _2298 = _2294;
                    }
                    else
                    {
                        _2295 = _2015;
                        _2296 = _2018;
                        _2297 = _2020;
                        _2298 = _2022;
                    }
                    _2016 = _2295;
                    _2019 = _2296;
                    _2021 = _2297;
                    _2023 = _2298;
                }
                else
                {
                    _2016 = _2015;
                    _2019 = _2018;
                    _2021 = _2020;
                    _2023 = _2022;
                }
            }
            vec3 _2305;
            vec3 _2307;
            _2305 = _2020;
            _2307 = _2022;
            float _2301;
            bool _2304;
            vec3 _2306;
            vec3 _2308;
            float _2300 = _2015;
            bool _2303 = _2018;
            uint _2309 = _2024;
            for (; _2309 < _1714; _2300 = _2301, _2303 = _2304, _2305 = _2306, _2307 = _2308, _2309++)
            {
                uint _2316 = uint(_9._m0[_2309]);
                int _2345 = int(_11._m0[_2316]._m1 >> 1u) - 1;
                if (((_11._m0[_2316]._m4 & 16777215u) & (1u << (_478 & 31u))) != 0u)
                {
                    vec3 _2356 = _11._m0[_2316]._m6 * vec4(_511, 1.0);
                    float _2736;
                    bool _2737;
                    vec3 _2738;
                    vec3 _2739;
                    if (all(lessThan(abs(_2356 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _2363 = _513 + _11._m0[_2316]._m9;
                        vec3 _2367 = _2363 * inversesqrt(spvNMax(dot(_2363, _2363), 1.0000000133514319600180897396058e-10));
                        float _2369 = clamp(dot(_11._m0[_2316]._m9, _2367), 0.0, 1.0);
                        float _2371 = clamp(dot(_488, _2367), 0.0, 1.0);
                        float _2373 = clamp(dot(_488, _11._m0[_2316]._m9), 0.0, 1.0);
                        int _2374 = int(_11._m0[_2316]._m4 >> 24u);
                        float _2375 = _2356.z;
                        vec3 _2414;
                        if (_2375 < _11._m0[_2316]._m2.x)
                        {
                            float _2402 = _2375 * _11._m0[_2316]._m2.z;
                            float _2405 = _2402 * _2402;
                            vec3 _2413;
                            _2413.z = dot(_311[_2374], vec4(_2402, _2405, smoothstep(0.0, 1.0, _2402), (_2405 * _2402) * fma(_2402, fma(_2402, 6.0, -15.0), 10.0)));
                            _2414 = _2413;
                        }
                        else
                        {
                            vec3 _2400;
                            if (_2375 > _11._m0[_2316]._m2.y)
                            {
                                float _2388 = (1.0 - _2375) * _11._m0[_2316]._m2.w;
                                float _2391 = _2388 * _2388;
                                vec3 _2399;
                                _2399.z = dot(_311[_2374], vec4(_2388, _2391, smoothstep(0.0, 1.0, _2388), (_2391 * _2388) * fma(_2388, fma(_2388, 6.0, -15.0), 10.0)));
                                _2400 = _2399;
                            }
                            else
                            {
                                _2400 = vec3(0.0, 0.0, 1.0);
                            }
                            _2414 = _2400;
                        }
                        vec2 _2415 = _2356.xy;
                        vec2 _2419 = (vec2(0.5) - abs(_2415 - vec2(0.5))) * _11._m0[_2316]._m3;
                        float _2420 = _2419.x;
                        vec3 _2437;
                        if (_2420 < 1.0)
                        {
                            float _2428 = _2420 * _2420;
                            vec3 _2436 = _2414;
                            _2436.x = dot(_311[_2374], vec4(_2420, _2428, smoothstep(0.0, 1.0, _2420), (_2428 * _2420) * fma(_2420, fma(_2420, 6.0, -15.0), 10.0)));
                            _2437 = _2436;
                        }
                        else
                        {
                            vec3 _2425 = _2414;
                            _2425.x = 1.0;
                            _2437 = _2425;
                        }
                        float _2438 = _2419.y;
                        vec3 _2455;
                        if (_2438 < 1.0)
                        {
                            float _2446 = _2438 * _2438;
                            vec3 _2454 = _2437;
                            _2454.y = dot(_311[_2374], vec4(_2438, _2446, smoothstep(0.0, 1.0, _2438), (_2446 * _2438) * fma(_2438, fma(_2438, 6.0, -15.0), 10.0)));
                            _2455 = _2454;
                        }
                        else
                        {
                            vec3 _2443 = _2437;
                            _2443.y = 1.0;
                            _2455 = _2443;
                        }
                        float _2461 = _2373 * ((_2455.x * _2455.y) * _2455.z);
                        float _2566;
                        bool _2567;
                        float _2568;
                        if ((_11._m0[_2316]._m8 & 1u) != 0u)
                        {
                            uint _2464 = uint(int(_11._m0[_2316]._m8 >> 2u));
                            float _2560;
                            bool _2561;
                            float _2562;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2373 <= 0.0) && true)
                                {
                                    _2560 = _2300;
                                    _2561 = _2303;
                                    _2562 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2495 = _20._m0[_2464]._m0 * vec4(_511 + (_488 * ((3.5 * float(int(sign(_2373)))) * _20._m0[_2464]._m4)), 1.0);
                                    vec2 _2498 = (_2495.xy * 0.5) + vec2(0.5);
                                    _2498.y = 1.0 - _2498.y;
                                    float _2507 = ((_2495.z - _20._m0[_2464]._m5.y) / _20._m0[_2464]._m5.x) / _20._m0[_2464]._m6;
                                    float _2512 = _2303 ? _2300 : 6.283185482025146484375;
                                    float _2513 = _583 * _2512;
                                    vec2 _2514 = _20._m0[_2464]._m1 + _19._m33;
                                    vec2 _2517 = (_20._m0[_2464]._m1 + vec2(_20._m0[_2464]._m2)) - _19._m33;
                                    float _2519;
                                    _2519 = 0.0;
                                    for (int _2522 = 0; _2522 < 12; )
                                    {
                                        float _2527 = float(uint(_2522));
                                        float _2530 = sqrt(_2527 + 0.5) * 0.288675129413604736328125;
                                        float _2531 = fma(_2527, 2.3999631404876708984375, _2513);
                                        vec2 _2539 = clamp(fma((vec3(cos(_2531), sin(_2531), _2530).xy * _2530) * 2.5, _19._m33, _2498), _2514, _2517);
                                        vec2 _2542 = fract(fma(vec2(1.0) / _19._m33, _2539, vec2(0.5)));
                                        vec4 _2548 = vec4(lessThan(vec4(_2507), textureGather(sampler2D(_21, _12), _2539)));
                                        float _2551 = _2542.x;
                                        _2519 += clamp(mix(mix(_2548.w, _2548.z, _2551), mix(_2548.x, _2548.y, _2551), _2542.y), 0.0, 1.0);
                                        _2522++;
                                        continue;
                                    }
                                    _2560 = _2512;
                                    _2561 = _2303 ? _2303 : true;
                                    _2562 = _2519 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2566 = _2560;
                            _2567 = _2561;
                            _2568 = _2461 * mix(1.0, _2562, spvNMin(_590, _11._m0[_2316]._m5));
                        }
                        else
                        {
                            _2566 = _2300;
                            _2567 = _2303;
                            _2568 = _2461;
                        }
                        vec3 _2601;
                        if (_2345 >= 0)
                        {
                            vec2 _2574 = (subgroupQuadSwapHorizontal(_2415) - _2415) * _520;
                            vec2 _2577 = (subgroupQuadSwapVertical(_2415) - _2415) * _526;
                            vec2 _2581 = mix(_2574, vec2(0.0), bvec2(any(isnan(_2574))));
                            vec2 _2585 = mix(_2577, vec2(0.0), bvec2(any(isnan(_2577))));
                            bvec2 _2594 = bvec2(any(greaterThan(abs(vec4(_2581, _2585)), vec4(0.015625))));
                            int _78 = _2345;
                            _2601 = _11._m0[_2316]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_78], _7)), _2415, mix(_2581, vec2(0.0), _2594), mix(_2585, vec2(0.0), _2594)).xyz;
                        }
                        else
                        {
                            _2601 = _11._m0[_2316]._m0;
                        }
                        vec3 _2734;
                        vec3 _2735;
                        SPIRV_CROSS_BRANCH
                        if ((_11._m0[_2316]._m1 & 1u) != 0u)
                        {
                            vec3 _2732;
                            vec3 _2733;
                            if (_2373 > 0.0)
                            {
                                vec3 _2673 = _2601 * (_2568 * _6._m0[0u]);
                                vec3 _2680 = vec3(fma((2.0 * _2369) * _2369, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                float _2701 = (_542 + 1.0) * 0.5;
                                float _2702 = _542 * _542;
                                float _2710 = _2701 * _2701;
                                float _2722 = _2702 * _2702;
                                float _2725 = fma(fma(_2371, _2722, -_2371), _2371, 1.0);
                                _2732 = fma(_2673, (_507 + ((vec3(1.0) - _507) * pow(spvNMax(abs(1.0 - _2369), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2373, sqrt(fma(fma(-_1716, _2710, _1716), _1716, _2710)), _1716 * sqrt(fma(fma(-_2373, _2710, _2373), _2373, _2710)))) * (_2722 * (0.3183098733425140380859375 / (_2725 * _2725)))), _2305);
                                _2733 = fma(_2673, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2680 * pow(spvNMax(abs(1.0 - _2373), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2680 * pow(spvNMax(abs(1.0 - _1716), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _2307);
                            }
                            else
                            {
                                _2732 = _2305;
                                _2733 = _2307;
                            }
                            _2734 = _2732;
                            _2735 = _2733;
                        }
                        else
                        {
                            vec3 _2667;
                            vec3 _2668;
                            if (_2373 > 0.0)
                            {
                                vec3 _2608 = _2601 * _2568;
                                vec3 _2615 = vec3(fma((2.0 * _2369) * _2369, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                float _2636 = (_542 + 1.0) * 0.5;
                                float _2637 = _542 * _542;
                                float _2645 = _2636 * _2636;
                                float _2657 = _2637 * _2637;
                                float _2660 = fma(fma(_2371, _2657, -_2371), _2371, 1.0);
                                _2667 = fma(_2608, (_507 + ((vec3(1.0) - _507) * pow(spvNMax(abs(1.0 - _2369), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2373, sqrt(fma(fma(-_1716, _2645, _1716), _1716, _2645)), _1716 * sqrt(fma(fma(-_2373, _2645, _2373), _2373, _2645)))) * (_2657 * (0.3183098733425140380859375 / (_2660 * _2660)))), _2305);
                                _2668 = fma(_2608, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2615 * pow(spvNMax(abs(1.0 - _2373), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2615 * pow(spvNMax(abs(1.0 - _1716), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _2307);
                            }
                            else
                            {
                                _2667 = _2305;
                                _2668 = _2307;
                            }
                            _2734 = _2667;
                            _2735 = _2668;
                        }
                        _2736 = _2566;
                        _2737 = _2567;
                        _2738 = _2734;
                        _2739 = _2735;
                    }
                    else
                    {
                        _2736 = _2300;
                        _2737 = _2303;
                        _2738 = _2305;
                        _2739 = _2307;
                    }
                    _2301 = _2736;
                    _2304 = _2737;
                    _2306 = _2738;
                    _2308 = _2739;
                }
                else
                {
                    _2301 = _2300;
                    _2304 = _2303;
                    _2306 = _2305;
                    _2308 = _2307;
                }
            }
            _2740 = _2305;
            _2741 = _2307;
        }
        else
        {
            vec3 _1697;
            vec3 _1698;
            if (_498)
            {
                uvec4 _601 = uvec4(_8._m0[uint(_574)]);
                uint _602 = _601.x;
                uint _603 = _601.y;
                uint _606 = ((_603 >> 0u) & 4095u) + _602;
                uint _609 = ((_603 >> 12u) & 4095u) + _606;
                uint _613 = ((_601.z >> 0u) & 1023u) + _609;
                float _615 = spvNMax(dot(_488, _513), 9.9999997473787516355514526367188e-06);
                vec3 _617;
                vec3 _620;
                float _622;
                bool _624;
                uint _626;
                _617 = vec3(0.0);
                _620 = vec3(0.0);
                _622 = _300;
                _624 = false;
                _626 = _602;
                vec3 _618;
                vec3 _621;
                float _623;
                bool _625;
                for (; _626 < _606; _617 = _618, _620 = _621, _622 = _623, _624 = _625, _626++)
                {
                    uint _633 = uint(_9._m0[_626]);
                    float _651 = abs(_10._m0[_633]._m5);
                    if ((_10._m0[_633]._m6 & (1u << (_478 & 31u))) != 0u)
                    {
                        vec3 _666 = _10._m0[_633]._m0.xyz - _511;
                        float _667 = dot(_666, _666);
                        vec3 _670 = _666 * inversesqrt(spvNMax(_667, 1.0000000133514319600180897396058e-10));
                        float _671 = _10._m0[_633]._m0.w * _10._m0[_633]._m0.w;
                        vec3 _951;
                        vec3 _952;
                        float _953;
                        bool _954;
                        if (_667 < (1.0 / _671))
                        {
                            vec3 _676 = _513 + _670;
                            vec3 _680 = _676 * inversesqrt(spvNMax(dot(_676, _676), 1.0000000133514319600180897396058e-10));
                            float _682 = clamp(dot(_670, _680), 0.0, 1.0);
                            float _684 = clamp(dot(_488, _680), 0.0, 1.0);
                            float _686 = clamp(dot(_488, _670), 0.0, 1.0);
                            float _687 = _667 * _671;
                            float _693 = pow(spvNMax(abs(clamp(fma(-_687, _687, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_633]._m4);
                            float _703;
                            if (_10._m0[_633]._m5 < 0.0)
                            {
                                _703 = _693 * fma(4.0, _671, _651);
                            }
                            else
                            {
                                _703 = _693 * ((1.0 / spvNMax(_667, 9.9999997473787516355514526367188e-05)) + _651);
                            }
                            float _705 = 0.079577468335628509521484375 * (_686 * _703);
                            float _840;
                            bool _841;
                            float _842;
                            if ((_10._m0[_633]._m7 & 1u) != 0u)
                            {
                                uint _730;
                                do
                                {
                                    vec3 _710 = -_670;
                                    float _711 = dot(_710, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                    float _712 = dot(_710, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                    float _713 = dot(_710, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                    float _717 = spvNMax(spvNMax(_711, _712), spvNMax(_713, dot(_710, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                    if (_717 == _711)
                                    {
                                        _730 = 0u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_717 == _712)
                                        {
                                            _730 = 1u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_717 == _713)
                                            {
                                                _730 = 2u;
                                                break;
                                            }
                                            else
                                            {
                                                _730 = 3u;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                uint _732 = uint(int(_10._m0[_633]._m7 >> 2u)) + _730;
                                float _834;
                                bool _835;
                                float _836;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_686 <= 0.0) && true)
                                    {
                                        _834 = _622;
                                        _835 = _624;
                                        _836 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _765 = _20._m0[_732]._m0 * vec4(_511 + (_488 * ((3.5 * float(int(sign(_686)))) * (_20._m0[_732]._m4 * sqrt(_667)))), 1.0);
                                        vec3 _769 = _765.xyz / vec3(_765.w);
                                        vec2 _772 = (_769.xy * 0.5) + vec2(0.5);
                                        _772.y = 1.0 - _772.y;
                                        float _781 = (_20._m0[_732]._m5.y / _20._m0[_732]._m6) / (_769.z - _20._m0[_732]._m5.x);
                                        float _786 = _624 ? _622 : 6.283185482025146484375;
                                        float _787 = _583 * _786;
                                        vec2 _788 = _20._m0[_732]._m1 + _19._m33;
                                        vec2 _791 = (_20._m0[_732]._m1 + vec2(_20._m0[_732]._m2)) - _19._m33;
                                        float _793;
                                        _793 = 0.0;
                                        for (int _796 = 0; _796 < 12; )
                                        {
                                            float _801 = float(uint(_796));
                                            float _804 = sqrt(_801 + 0.5) * 0.288675129413604736328125;
                                            float _805 = fma(_801, 2.3999631404876708984375, _787);
                                            vec2 _813 = clamp(fma((vec3(cos(_805), sin(_805), _804).xy * _804) * 2.5, _19._m33, _772), _788, _791);
                                            vec2 _816 = fract(fma(vec2(1.0) / _19._m33, _813, vec2(0.5)));
                                            vec4 _822 = vec4(lessThan(vec4(_781), textureGather(sampler2D(_21, _12), _813)));
                                            float _825 = _816.x;
                                            _793 += clamp(mix(mix(_822.w, _822.z, _825), mix(_822.x, _822.y, _825), _816.y), 0.0, 1.0);
                                            _796++;
                                            continue;
                                        }
                                        _834 = _786;
                                        _835 = _624 ? _624 : true;
                                        _836 = _793 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _840 = _834;
                                _841 = _835;
                                _842 = _705 * mix(1.0, _836, spvNMin(_590, _10._m0[_633]._m8));
                            }
                            else
                            {
                                _840 = _622;
                                _841 = _624;
                                _842 = _705;
                            }
                            vec3 _949;
                            vec3 _950;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_633]._m3 < 0.0)
                            {
                                vec3 _947;
                                vec3 _948;
                                if (_686 > 0.0)
                                {
                                    vec3 _901 = _10._m0[_633]._m1.xyz * (_842 * _6._m0[0u]);
                                    vec3 _908 = vec3(fma((2.0 * _682) * _682, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                    float _938 = clamp(_615, 0.0, 1.0);
                                    _947 = fma(_901, _508.xyz * ((((2.0 + (1.0 / _542)) * pow(spvNMax(abs(fma(-_684, _684, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _542)) * 0.15915493667125701904296875) * (0.25 / fma(-_686, _938, _686 + _938))), _617);
                                    _948 = fma(_901, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_908 * pow(spvNMax(abs(1.0 - _686), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_908 * pow(spvNMax(abs(1.0 - _615), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _620);
                                }
                                else
                                {
                                    _947 = _617;
                                    _948 = _620;
                                }
                                _949 = _947;
                                _950 = _948;
                            }
                            else
                            {
                                vec3 _895;
                                vec3 _896;
                                if (_686 > 0.0)
                                {
                                    vec3 _849 = _10._m0[_633]._m1.xyz * _842;
                                    vec3 _856 = vec3(fma((2.0 * _682) * _682, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                    float _886 = clamp(_615, 0.0, 1.0);
                                    _895 = fma(_849, _508.xyz * ((((2.0 + (1.0 / _542)) * pow(spvNMax(abs(fma(-_684, _684, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _542)) * 0.15915493667125701904296875) * (0.25 / fma(-_686, _886, _686 + _886))), _617);
                                    _896 = fma(_849, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_856 * pow(spvNMax(abs(1.0 - _686), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_856 * pow(spvNMax(abs(1.0 - _615), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _620);
                                }
                                else
                                {
                                    _895 = _617;
                                    _896 = _620;
                                }
                                _949 = _895;
                                _950 = _896;
                            }
                            _951 = _949;
                            _952 = _950;
                            _953 = _840;
                            _954 = _841;
                        }
                        else
                        {
                            _951 = _617;
                            _952 = _620;
                            _953 = _622;
                            _954 = _624;
                        }
                        _618 = _951;
                        _621 = _952;
                        _623 = _953;
                        _625 = _954;
                    }
                    else
                    {
                        _618 = _617;
                        _621 = _620;
                        _623 = _622;
                        _625 = _624;
                    }
                }
                vec3 _956;
                vec3 _959;
                float _961;
                bool _963;
                uint _965;
                _956 = _617;
                _959 = _620;
                _961 = _622;
                _963 = _624;
                _965 = _626;
                vec3 _957;
                vec3 _960;
                float _962;
                bool _964;
                for (; _965 < _609; _956 = _957, _959 = _960, _961 = _962, _963 = _964, _965++)
                {
                    uint _972 = uint(_9._m0[_965]);
                    float _985 = abs(_10._m0[_972]._m5);
                    if ((_10._m0[_972]._m6 & (1u << (_478 & 31u))) != 0u)
                    {
                        vec3 _1003 = _10._m0[_972]._m0.xyz - _511;
                        float _1004 = dot(_1003, _1003);
                        vec3 _1007 = _1003 * inversesqrt(spvNMax(_1004, 1.0000000133514319600180897396058e-10));
                        float _1008 = _10._m0[_972]._m0.w * _10._m0[_972]._m0.w;
                        vec3 _1278;
                        vec3 _1279;
                        float _1280;
                        bool _1281;
                        if (_1004 < (1.0 / _1008))
                        {
                            vec3 _1013 = _513 + _1007;
                            vec3 _1017 = _1013 * inversesqrt(spvNMax(dot(_1013, _1013), 1.0000000133514319600180897396058e-10));
                            float _1019 = clamp(dot(_1007, _1017), 0.0, 1.0);
                            float _1021 = clamp(dot(_488, _1017), 0.0, 1.0);
                            float _1023 = clamp(dot(_488, _1007), 0.0, 1.0);
                            float _1026 = dot(-_1007, normalize(_10._m0[_972]._m2.xyz));
                            float _1055;
                            if (_1026 > _10._m0[_972]._m1.w)
                            {
                                float _1030 = _1004 * _1008;
                                float _1036 = pow(spvNMax(abs(clamp(fma(-_1030, _1030, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_972]._m4);
                                float _1046;
                                if (_10._m0[_972]._m5 < 0.0)
                                {
                                    _1046 = _1036 * fma(4.0, _1008, _985);
                                }
                                else
                                {
                                    _1046 = _1036 * ((1.0 / spvNMax(_1004, 9.9999997473787516355514526367188e-05)) + _985);
                                }
                                float _1051 = clamp((_1026 - _10._m0[_972]._m1.w) / spvNMax(_10._m0[_972]._m2.w - _10._m0[_972]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _1055 = _1023 * (_1046 * (_1051 * _1051));
                            }
                            else
                            {
                                _1055 = 0.0;
                            }
                            float _1056 = 0.3183098733425140380859375 * _1055;
                            float _1167;
                            bool _1168;
                            float _1169;
                            if ((_10._m0[_972]._m7 & 1u) != 0u)
                            {
                                uint _1059 = uint(int(_10._m0[_972]._m7 >> 2u));
                                float _1161;
                                bool _1162;
                                float _1163;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1023 <= 0.0) && true)
                                    {
                                        _1161 = _961;
                                        _1162 = _963;
                                        _1163 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1092 = _20._m0[_1059]._m0 * vec4(_511 + (_488 * ((3.5 * float(int(sign(_1023)))) * (_20._m0[_1059]._m4 * sqrt(_1004)))), 1.0);
                                        vec3 _1096 = _1092.xyz / vec3(_1092.w);
                                        vec2 _1099 = (_1096.xy * 0.5) + vec2(0.5);
                                        _1099.y = 1.0 - _1099.y;
                                        float _1108 = (_20._m0[_1059]._m5.y / _20._m0[_1059]._m6) / (_1096.z - _20._m0[_1059]._m5.x);
                                        float _1113 = _963 ? _961 : 6.283185482025146484375;
                                        float _1114 = _583 * _1113;
                                        vec2 _1115 = _20._m0[_1059]._m1 + _19._m33;
                                        vec2 _1118 = (_20._m0[_1059]._m1 + vec2(_20._m0[_1059]._m2)) - _19._m33;
                                        float _1120;
                                        _1120 = 0.0;
                                        for (int _1123 = 0; _1123 < 12; )
                                        {
                                            float _1128 = float(uint(_1123));
                                            float _1131 = sqrt(_1128 + 0.5) * 0.288675129413604736328125;
                                            float _1132 = fma(_1128, 2.3999631404876708984375, _1114);
                                            vec2 _1140 = clamp(fma((vec3(cos(_1132), sin(_1132), _1131).xy * _1131) * 2.5, _19._m33, _1099), _1115, _1118);
                                            vec2 _1143 = fract(fma(vec2(1.0) / _19._m33, _1140, vec2(0.5)));
                                            vec4 _1149 = vec4(lessThan(vec4(_1108), textureGather(sampler2D(_21, _12), _1140)));
                                            float _1152 = _1143.x;
                                            _1120 += clamp(mix(mix(_1149.w, _1149.z, _1152), mix(_1149.x, _1149.y, _1152), _1143.y), 0.0, 1.0);
                                            _1123++;
                                            continue;
                                        }
                                        _1161 = _1113;
                                        _1162 = _963 ? _963 : true;
                                        _1163 = _1120 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _1167 = _1161;
                                _1168 = _1162;
                                _1169 = _1056 * mix(1.0, _1163, spvNMin(_590, _10._m0[_972]._m8));
                            }
                            else
                            {
                                _1167 = _961;
                                _1168 = _963;
                                _1169 = _1056;
                            }
                            vec3 _1276;
                            vec3 _1277;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_972]._m3 < 0.0)
                            {
                                vec3 _1274;
                                vec3 _1275;
                                if (_1023 > 0.0)
                                {
                                    vec3 _1228 = _10._m0[_972]._m1.xyz * (_1169 * _6._m0[0u]);
                                    vec3 _1235 = vec3(fma((2.0 * _1019) * _1019, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                    float _1265 = clamp(_615, 0.0, 1.0);
                                    _1274 = fma(_1228, _508.xyz * ((((2.0 + (1.0 / _542)) * pow(spvNMax(abs(fma(-_1021, _1021, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _542)) * 0.15915493667125701904296875) * (0.25 / fma(-_1023, _1265, _1023 + _1265))), _956);
                                    _1275 = fma(_1228, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1235 * pow(spvNMax(abs(1.0 - _1023), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1235 * pow(spvNMax(abs(1.0 - _615), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _959);
                                }
                                else
                                {
                                    _1274 = _956;
                                    _1275 = _959;
                                }
                                _1276 = _1274;
                                _1277 = _1275;
                            }
                            else
                            {
                                vec3 _1222;
                                vec3 _1223;
                                if (_1023 > 0.0)
                                {
                                    vec3 _1176 = _10._m0[_972]._m1.xyz * _1169;
                                    vec3 _1183 = vec3(fma((2.0 * _1019) * _1019, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                    float _1213 = clamp(_615, 0.0, 1.0);
                                    _1222 = fma(_1176, _508.xyz * ((((2.0 + (1.0 / _542)) * pow(spvNMax(abs(fma(-_1021, _1021, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _542)) * 0.15915493667125701904296875) * (0.25 / fma(-_1023, _1213, _1023 + _1213))), _956);
                                    _1223 = fma(_1176, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1183 * pow(spvNMax(abs(1.0 - _1023), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1183 * pow(spvNMax(abs(1.0 - _615), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _959);
                                }
                                else
                                {
                                    _1222 = _956;
                                    _1223 = _959;
                                }
                                _1276 = _1222;
                                _1277 = _1223;
                            }
                            _1278 = _1276;
                            _1279 = _1277;
                            _1280 = _1167;
                            _1281 = _1168;
                        }
                        else
                        {
                            _1278 = _956;
                            _1279 = _959;
                            _1280 = _961;
                            _1281 = _963;
                        }
                        _957 = _1278;
                        _960 = _1279;
                        _962 = _1280;
                        _964 = _1281;
                    }
                    else
                    {
                        _957 = _956;
                        _960 = _959;
                        _962 = _961;
                        _964 = _963;
                    }
                }
                vec3 _1283;
                vec3 _1286;
                _1283 = _956;
                _1286 = _959;
                vec3 _1284;
                vec3 _1287;
                float _1289;
                bool _1291;
                float _1288 = _961;
                bool _1290 = _963;
                uint _1292 = _965;
                for (; _1292 < _613; _1283 = _1284, _1286 = _1287, _1288 = _1289, _1290 = _1291, _1292++)
                {
                    uint _1299 = uint(_9._m0[_1292]);
                    int _1328 = int(_11._m0[_1299]._m1 >> 1u) - 1;
                    if (((_11._m0[_1299]._m4 & 16777215u) & (1u << (_478 & 31u))) != 0u)
                    {
                        vec3 _1339 = _11._m0[_1299]._m6 * vec4(_511, 1.0);
                        vec3 _1693;
                        vec3 _1694;
                        float _1695;
                        bool _1696;
                        if (all(lessThan(abs(_1339 - vec3(0.5)), vec3(0.5))))
                        {
                            vec3 _1346 = _513 + _11._m0[_1299]._m9;
                            vec3 _1350 = _1346 * inversesqrt(spvNMax(dot(_1346, _1346), 1.0000000133514319600180897396058e-10));
                            float _1352 = clamp(dot(_11._m0[_1299]._m9, _1350), 0.0, 1.0);
                            float _1354 = clamp(dot(_488, _1350), 0.0, 1.0);
                            float _1356 = clamp(dot(_488, _11._m0[_1299]._m9), 0.0, 1.0);
                            int _1357 = int(_11._m0[_1299]._m4 >> 24u);
                            float _1358 = _1339.z;
                            vec3 _1397;
                            if (_1358 < _11._m0[_1299]._m2.x)
                            {
                                float _1385 = _1358 * _11._m0[_1299]._m2.z;
                                float _1388 = _1385 * _1385;
                                vec3 _1396;
                                _1396.z = dot(_311[_1357], vec4(_1385, _1388, smoothstep(0.0, 1.0, _1385), (_1388 * _1385) * fma(_1385, fma(_1385, 6.0, -15.0), 10.0)));
                                _1397 = _1396;
                            }
                            else
                            {
                                vec3 _1383;
                                if (_1358 > _11._m0[_1299]._m2.y)
                                {
                                    float _1371 = (1.0 - _1358) * _11._m0[_1299]._m2.w;
                                    float _1374 = _1371 * _1371;
                                    vec3 _1382;
                                    _1382.z = dot(_311[_1357], vec4(_1371, _1374, smoothstep(0.0, 1.0, _1371), (_1374 * _1371) * fma(_1371, fma(_1371, 6.0, -15.0), 10.0)));
                                    _1383 = _1382;
                                }
                                else
                                {
                                    _1383 = vec3(0.0, 0.0, 1.0);
                                }
                                _1397 = _1383;
                            }
                            vec2 _1398 = _1339.xy;
                            vec2 _1402 = (vec2(0.5) - abs(_1398 - vec2(0.5))) * _11._m0[_1299]._m3;
                            float _1403 = _1402.x;
                            vec3 _1420;
                            if (_1403 < 1.0)
                            {
                                float _1411 = _1403 * _1403;
                                vec3 _1419 = _1397;
                                _1419.x = dot(_311[_1357], vec4(_1403, _1411, smoothstep(0.0, 1.0, _1403), (_1411 * _1403) * fma(_1403, fma(_1403, 6.0, -15.0), 10.0)));
                                _1420 = _1419;
                            }
                            else
                            {
                                vec3 _1408 = _1397;
                                _1408.x = 1.0;
                                _1420 = _1408;
                            }
                            float _1421 = _1402.y;
                            vec3 _1438;
                            if (_1421 < 1.0)
                            {
                                float _1429 = _1421 * _1421;
                                vec3 _1437 = _1420;
                                _1437.y = dot(_311[_1357], vec4(_1421, _1429, smoothstep(0.0, 1.0, _1421), (_1429 * _1421) * fma(_1421, fma(_1421, 6.0, -15.0), 10.0)));
                                _1438 = _1437;
                            }
                            else
                            {
                                vec3 _1426 = _1420;
                                _1426.y = 1.0;
                                _1438 = _1426;
                            }
                            float _1444 = _1356 * ((_1438.x * _1438.y) * _1438.z);
                            float _1549;
                            bool _1550;
                            float _1551;
                            if ((_11._m0[_1299]._m8 & 1u) != 0u)
                            {
                                uint _1447 = uint(int(_11._m0[_1299]._m8 >> 2u));
                                float _1543;
                                bool _1544;
                                float _1545;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1356 <= 0.0) && true)
                                    {
                                        _1543 = _1288;
                                        _1544 = _1290;
                                        _1545 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1478 = _20._m0[_1447]._m0 * vec4(_511 + (_488 * ((3.5 * float(int(sign(_1356)))) * _20._m0[_1447]._m4)), 1.0);
                                        vec2 _1481 = (_1478.xy * 0.5) + vec2(0.5);
                                        _1481.y = 1.0 - _1481.y;
                                        float _1490 = ((_1478.z - _20._m0[_1447]._m5.y) / _20._m0[_1447]._m5.x) / _20._m0[_1447]._m6;
                                        float _1495 = _1290 ? _1288 : 6.283185482025146484375;
                                        float _1496 = _583 * _1495;
                                        vec2 _1497 = _20._m0[_1447]._m1 + _19._m33;
                                        vec2 _1500 = (_20._m0[_1447]._m1 + vec2(_20._m0[_1447]._m2)) - _19._m33;
                                        float _1502;
                                        _1502 = 0.0;
                                        for (int _1505 = 0; _1505 < 12; )
                                        {
                                            float _1510 = float(uint(_1505));
                                            float _1513 = sqrt(_1510 + 0.5) * 0.288675129413604736328125;
                                            float _1514 = fma(_1510, 2.3999631404876708984375, _1496);
                                            vec2 _1522 = clamp(fma((vec3(cos(_1514), sin(_1514), _1513).xy * _1513) * 2.5, _19._m33, _1481), _1497, _1500);
                                            vec2 _1525 = fract(fma(vec2(1.0) / _19._m33, _1522, vec2(0.5)));
                                            vec4 _1531 = vec4(lessThan(vec4(_1490), textureGather(sampler2D(_21, _12), _1522)));
                                            float _1534 = _1525.x;
                                            _1502 += clamp(mix(mix(_1531.w, _1531.z, _1534), mix(_1531.x, _1531.y, _1534), _1525.y), 0.0, 1.0);
                                            _1505++;
                                            continue;
                                        }
                                        _1543 = _1495;
                                        _1544 = _1290 ? _1290 : true;
                                        _1545 = _1502 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _1549 = _1543;
                                _1550 = _1544;
                                _1551 = _1444 * mix(1.0, _1545, spvNMin(_590, _11._m0[_1299]._m5));
                            }
                            else
                            {
                                _1549 = _1288;
                                _1550 = _1290;
                                _1551 = _1444;
                            }
                            vec3 _1584;
                            if (_1328 >= 0)
                            {
                                vec2 _1557 = (subgroupQuadSwapHorizontal(_1398) - _1398) * _520;
                                vec2 _1560 = (subgroupQuadSwapVertical(_1398) - _1398) * _526;
                                vec2 _1564 = mix(_1557, vec2(0.0), bvec2(any(isnan(_1557))));
                                vec2 _1568 = mix(_1560, vec2(0.0), bvec2(any(isnan(_1560))));
                                bvec2 _1577 = bvec2(any(greaterThan(abs(vec4(_1564, _1568)), vec4(0.015625))));
                                int _74 = _1328;
                                _1584 = _11._m0[_1299]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_74], _7)), _1398, mix(_1564, vec2(0.0), _1577), mix(_1568, vec2(0.0), _1577)).xyz;
                            }
                            else
                            {
                                _1584 = _11._m0[_1299]._m0;
                            }
                            vec3 _1691;
                            vec3 _1692;
                            SPIRV_CROSS_BRANCH
                            if ((_11._m0[_1299]._m1 & 1u) != 0u)
                            {
                                vec3 _1689;
                                vec3 _1690;
                                if (_1356 > 0.0)
                                {
                                    vec3 _1643 = _1584 * (_1551 * _6._m0[0u]);
                                    vec3 _1650 = vec3(fma((2.0 * _1352) * _1352, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                    float _1680 = clamp(_615, 0.0, 1.0);
                                    _1689 = fma(_1643, _508.xyz * ((((2.0 + (1.0 / _542)) * pow(spvNMax(abs(fma(-_1354, _1354, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _542)) * 0.15915493667125701904296875) * (0.25 / fma(-_1356, _1680, _1356 + _1680))), _1283);
                                    _1690 = fma(_1643, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1650 * pow(spvNMax(abs(1.0 - _1356), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1650 * pow(spvNMax(abs(1.0 - _615), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _1286);
                                }
                                else
                                {
                                    _1689 = _1283;
                                    _1690 = _1286;
                                }
                                _1691 = _1689;
                                _1692 = _1690;
                            }
                            else
                            {
                                vec3 _1637;
                                vec3 _1638;
                                if (_1356 > 0.0)
                                {
                                    vec3 _1591 = _1584 * _1551;
                                    vec3 _1598 = vec3(fma((2.0 * _1352) * _1352, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                                    float _1628 = clamp(_615, 0.0, 1.0);
                                    _1637 = fma(_1591, _508.xyz * ((((2.0 + (1.0 / _542)) * pow(spvNMax(abs(fma(-_1354, _1354, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _542)) * 0.15915493667125701904296875) * (0.25 / fma(-_1356, _1628, _1356 + _1628))), _1283);
                                    _1638 = fma(_1591, _510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1598 * pow(spvNMax(abs(1.0 - _1356), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1598 * pow(spvNMax(abs(1.0 - _615), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))), _1286);
                                }
                                else
                                {
                                    _1637 = _1283;
                                    _1638 = _1286;
                                }
                                _1691 = _1637;
                                _1692 = _1638;
                            }
                            _1693 = _1691;
                            _1694 = _1692;
                            _1695 = _1549;
                            _1696 = _1550;
                        }
                        else
                        {
                            _1693 = _1283;
                            _1694 = _1286;
                            _1695 = _1288;
                            _1696 = _1290;
                        }
                        _1284 = _1693;
                        _1287 = _1694;
                        _1289 = _1695;
                        _1291 = _1696;
                    }
                    else
                    {
                        _1284 = _1283;
                        _1287 = _1286;
                        _1289 = _1288;
                        _1291 = _1290;
                    }
                }
                _1697 = _1283;
                _1698 = _1286;
            }
            else
            {
                _1697 = vec3(0.0);
                _1698 = vec3(0.0);
            }
            _2740 = _1697;
            _2741 = _1698;
        }
        vec3 _2743 = reflect(-_513, _488);
        vec3 _2755 = textureLod(samplerCube(_14, _7), _488, 0.0).xyz * _19._m27;
        vec3 _2762 = textureLod(samplerCube(_15, _7), _2743, fma(_542, 8.0, _19._m30 - 8.0)).xyz * _19._m27;
        vec3 _2787;
        vec3 _2788;
        SPIRV_CROSS_BRANCH
        if (_19._m29 > 0.0)
        {
            vec3 _2777 = vec3(_19._m29);
            _2787 = mix(_2762, textureLod(samplerCube(_17, _7), _2743, fma(_542, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _2777);
            _2788 = mix(_2755, textureLod(samplerCube(_16, _7), _488, 0.0).xyz * _19._m28, _2777);
        }
        else
        {
            _2787 = _2762;
            _2788 = _2755;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_2788, _542);
            _2787 *= rdx_mod;
            _2788 *= rdx_mod;
        }
        float _2789 = spvNMax(dot(_513, _488), 0.001953125);
        vec4 _2794 = textureLod(sampler2D(_18, _12), vec2(_2789, _542), 0.0);
        uvec4 _2807 = uvec4(_8._m0[uint(_574)]);
        uint _2809 = _2807.y;
        uint _2819 = ((_2807.z >> 0u) & 1023u) + (((_2809 >> 12u) & 4095u) + (((_2809 >> 0u) & 4095u) + _2807.x));
        uint _2821 = (_2809 >> 24u) + _2819;
        vec3 _2823;
        vec3 _2826;
        _2823 = _2787 * ((vec3(_507.x, _507.y, _507.z) * _2794.x) + vec3(_2794.y));
        _2826 = _2788 * (_510 * _2794.z);
        vec3 _2824;
        vec3 _2827;
        for (uint _2828 = _2819; _2828 < _2821; _2823 = _2824, _2826 = _2827, _2828++)
        {
            uint _2835 = uint(_9._m0[_2828]);
            int _2854 = int((_13._m0[_2835]._m5 >> 1u) & 3u);
            mat3 _2858 = mat3(_13._m0[_2835]._m1[0], _13._m0[_2835]._m1[1], _13._m0[_2835]._m1[2]);
            int _2864 = (int((_13._m0[_2835]._m5 >> 3u) & 16383u) - 1) * 2;
            int _2869 = (int((_13._m0[_2835]._m5 >> 17u) & 16383u) - 1) * 2;
            int _2874 = (int((_13._m0[_2835]._m6 >> 0u) & 65535u) - 1) * 2;
            int _2879 = (int((_13._m0[_2835]._m6 >> 16u) & 65535u) - 1) * 2;
            float _2882 = (_13._m0[_2835]._m3 < 0.0) ? (-_13._m0[_2835]._m3) : 1.0;
            vec3 _2884 = _2858 * (_511 - _13._m0[_2835]._m1[3]);
            bool _2885 = int(_13._m0[_2835]._m5 & 1u) == 1;
            vec3 _2886 = abs(_2884);
            float _2889 = dot(_2884, _2884);
            if (_2885 ? any(greaterThanEqual(_2886, _13._m0[_2835]._m0.xyz)) : (_2889 >= _13._m0[_2835]._m0.y))
            {
                _2824 = _2823;
                _2827 = _2826;
                continue;
            }
            vec3 _3063;
            SPIRV_CROSS_FLATTEN
            if ((_2854 & 1) != 0)
            {
                vec3 _2899 = _2858 * _488;
                vec2 _2988;
                bool _2989;
                if (_2885)
                {
                    vec2 _2983;
                    bool _2987;
                    do
                    {
                        vec3 _2967 = (_13._m0[_2835]._m0.xyz - _2884) / _2899;
                        vec3 _2970 = ((-_13._m0[_2835]._m0.xyz) - _2884) / _2899;
                        vec3 _2971 = spvNMin(_2967, _2970);
                        vec3 _2972 = spvNMax(_2967, _2970);
                        float _2977 = spvNMax(_2971.x, spvNMax(_2971.y, _2971.z));
                        float _2982 = spvNMin(_2972.x, spvNMin(_2972.y, _2972.z));
                        _2983 = vec2(_2977, _2982);
                        if (_2977 > _2982)
                        {
                            _2987 = false;
                            break;
                        }
                        _2987 = true;
                        break;
                    } while(false);
                    _2988 = _2983;
                    _2989 = _2987;
                }
                else
                {
                    vec2 _2962;
                    bool _2963;
                    do
                    {
                        float _2905 = dot(_2899, _2899);
                        float _2906 = dot(_2899, _2884);
                        float _2907 = 2.0 * _2906;
                        float _2908 = _2889 - _13._m0[_2835]._m0.y;
                        float _2944;
                        float _2945;
                        bool _2946;
                        do
                        {
                            float _2914 = fma(_2907, _2907, -((4.0 * _2905) * _2908));
                            float _2942;
                            float _2943;
                            if (_2914 < 0.0)
                            {
                                _2944 = 0.0;
                                _2945 = 0.0;
                                _2946 = false;
                                break;
                            }
                            else
                            {
                                if (_2914 == 0.0)
                                {
                                    float _2941 = (_2906 * (-1.0)) * (1.0 / _2905);
                                    _2942 = _2941;
                                    _2943 = _2941;
                                }
                                else
                                {
                                    float _2934;
                                    if (_2907 > 0.0)
                                    {
                                        _2934 = (-0.5) * fma(2.0, _2906, sqrt(_2914));
                                    }
                                    else
                                    {
                                        _2934 = (-0.5) * fma(2.0, _2906, -sqrt(_2914));
                                    }
                                    _2942 = _2908 * (1.0 / _2934);
                                    _2943 = _2934 * (1.0 / _2905);
                                }
                            }
                            _2944 = _2942;
                            _2945 = _2943;
                            _2946 = true;
                            break;
                        } while(false);
                        if (!_2946)
                        {
                            _2962 = vec2(0.0);
                            _2963 = false;
                            break;
                        }
                        if ((_2945 < 0.0) && (_2944 < 0.0))
                        {
                            _2962 = vec2(0.0);
                            _2963 = false;
                            break;
                        }
                        vec2 _2961;
                        if (_2945 > _2944)
                        {
                            _2961 = vec2(_2944, _2945);
                        }
                        else
                        {
                            _2961 = vec2(_2945, _2944);
                        }
                        _2962 = _2961;
                        _2963 = true;
                        break;
                    } while(false);
                    _2988 = _2962;
                    _2989 = _2963;
                }
                vec3 _2992 = _2884 + (_2899 * _2988.y);
                float _3013;
                if (_2885)
                {
                    _3013 = 1.0 - clamp(length(spvNMax(_2886 - (_13._m0[_2835]._m0.xyz - vec3(_13._m0[_2835]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_2835]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3013 = clamp((_13._m0[_2835]._m0.x - length(_2884)) * (1.0 / spvNMax(_13._m0[_2835]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3016 = float(_2989) * smoothstep(0.0, 1.0, _3013);
                vec4 _3058;
                SPIRV_CROSS_BRANCH
                if (_3016 > 9.9999997473787516355514526367188e-05)
                {
                    float _3025 = mix(clamp((_2988.y * (1.0 / length(_2992))) * _542, 0.0, _542), _542, _542);
                    vec3 _3027 = mix(_2992, _2899, vec3(_3025));
                    int _82 = _2864;
                    vec4 _3028 = textureLod(nonuniformEXT(samplerCube(_24[_82], _7)), _3027, 0.0);
                    int _86 = _2864 + 1;
                    _3028.w = textureLod(nonuniformEXT(samplerCube(_24[_86], _7)), _3027, 0.0).x;
                    vec4 _3043;
                    SPIRV_CROSS_BRANCH
                    if (_2869 >= 0)
                    {
                        int _90 = _2869;
                        vec4 _3036 = textureLod(nonuniformEXT(samplerCube(_24[_90], _7)), _3027, 0.0);
                        int _94 = _2869 + 1;
                        _3036.w = textureLod(nonuniformEXT(samplerCube(_24[_94], _7)), _3027, 0.0).x;
                        _3043 = mix(_3028, _3036, vec4(_13._m0[_2835]._m3));
                    }
                    else
                    {
                        _3043 = _3028;
                    }
                    vec4 _3044 = _3043 * _2882;
                    vec3 _3053 = (_3044.xyz * _13._m0[_2835]._m4).xyz * (_510 * textureLod(sampler2D(_18, _12), vec2(_2789, _3025), 0.0).z);
                    vec4 _3054 = vec4(_3053.x, _3053.y, _3053.z, _3044.w);
                    _3054.w = _3044.w * _3016;
                    _3058 = _3054;
                }
                else
                {
                    _3058 = vec4(0.0);
                }
                _3063 = mix(_2826, _3058.xyz, vec3(_3058.w));
            }
            else
            {
                _3063 = _2826;
            }
            vec3 _3242;
            SPIRV_CROSS_FLATTEN
            if ((_2854 & 2) != 0)
            {
                vec3 _3068 = _2858 * _2743;
                vec2 _3157;
                bool _3158;
                if (_2885)
                {
                    vec2 _3152;
                    bool _3156;
                    do
                    {
                        vec3 _3136 = (_13._m0[_2835]._m0.xyz - _2884) / _3068;
                        vec3 _3139 = ((-_13._m0[_2835]._m0.xyz) - _2884) / _3068;
                        vec3 _3140 = spvNMin(_3136, _3139);
                        vec3 _3141 = spvNMax(_3136, _3139);
                        float _3146 = spvNMax(_3140.x, spvNMax(_3140.y, _3140.z));
                        float _3151 = spvNMin(_3141.x, spvNMin(_3141.y, _3141.z));
                        _3152 = vec2(_3146, _3151);
                        if (_3146 > _3151)
                        {
                            _3156 = false;
                            break;
                        }
                        _3156 = true;
                        break;
                    } while(false);
                    _3157 = _3152;
                    _3158 = _3156;
                }
                else
                {
                    vec2 _3131;
                    bool _3132;
                    do
                    {
                        float _3074 = dot(_3068, _3068);
                        float _3075 = dot(_3068, _2884);
                        float _3076 = 2.0 * _3075;
                        float _3077 = _2889 - _13._m0[_2835]._m0.y;
                        float _3113;
                        float _3114;
                        bool _3115;
                        do
                        {
                            float _3083 = fma(_3076, _3076, -((4.0 * _3074) * _3077));
                            float _3111;
                            float _3112;
                            if (_3083 < 0.0)
                            {
                                _3113 = 0.0;
                                _3114 = 0.0;
                                _3115 = false;
                                break;
                            }
                            else
                            {
                                if (_3083 == 0.0)
                                {
                                    float _3110 = (_3075 * (-1.0)) * (1.0 / _3074);
                                    _3111 = _3110;
                                    _3112 = _3110;
                                }
                                else
                                {
                                    float _3103;
                                    if (_3076 > 0.0)
                                    {
                                        _3103 = (-0.5) * fma(2.0, _3075, sqrt(_3083));
                                    }
                                    else
                                    {
                                        _3103 = (-0.5) * fma(2.0, _3075, -sqrt(_3083));
                                    }
                                    _3111 = _3077 * (1.0 / _3103);
                                    _3112 = _3103 * (1.0 / _3074);
                                }
                            }
                            _3113 = _3111;
                            _3114 = _3112;
                            _3115 = true;
                            break;
                        } while(false);
                        if (!_3115)
                        {
                            _3131 = vec2(0.0);
                            _3132 = false;
                            break;
                        }
                        if ((_3114 < 0.0) && (_3113 < 0.0))
                        {
                            _3131 = vec2(0.0);
                            _3132 = false;
                            break;
                        }
                        vec2 _3130;
                        if (_3114 > _3113)
                        {
                            _3130 = vec2(_3113, _3114);
                        }
                        else
                        {
                            _3130 = vec2(_3114, _3113);
                        }
                        _3131 = _3130;
                        _3132 = true;
                        break;
                    } while(false);
                    _3157 = _3131;
                    _3158 = _3132;
                }
                vec3 _3161 = _2884 + (_3068 * _3157.y);
                float _3182;
                if (_2885)
                {
                    _3182 = 1.0 - clamp(length(spvNMax(_2886 - (_13._m0[_2835]._m0.xyz - vec3(_13._m0[_2835]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_2835]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3182 = clamp((_13._m0[_2835]._m0.x - length(_2884)) * (1.0 / spvNMax(_13._m0[_2835]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3185 = float(_3158) * smoothstep(0.0, 1.0, _3182);
                vec4 _3237;
                SPIRV_CROSS_BRANCH
                if (_3185 > 9.9999997473787516355514526367188e-05)
                {
                    float _3194 = mix(clamp((_3157.y * (1.0 / length(_3161))) * _542, 0.0, _542), _542, _542);
                    vec3 _3196 = mix(_3161, _3068, vec3(_3194));
                    float _3197 = _3194 * 8.0;
                    int _98 = _2874;
                    int _102 = _2874 + 1;
                    vec4 _3205 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_98], _7)), _3196, _3197).xyz, textureLod(nonuniformEXT(samplerCube(_24[_102], _7)), _3196, _3197).x);
                    vec4 _3219;
                    SPIRV_CROSS_BRANCH
                    if (_2879 >= 0)
                    {
                        int _106 = _2879;
                        int _110 = _2879 + 1;
                        _3219 = mix(_3205, vec4(textureLod(nonuniformEXT(samplerCube(_24[_106], _7)), _3196, _3197).xyz, textureLod(nonuniformEXT(samplerCube(_24[_110], _7)), _3196, _3197).x), vec4(_13._m0[_2835]._m3));
                    }
                    else
                    {
                        _3219 = _3205;
                    }
                    vec4 _3220 = _3219 * _2882;
                    vec4 _3225 = textureLod(sampler2D(_18, _12), vec2(_2789, _3194), 0.0);
                    vec3 _3232 = (_3220.xyz * _13._m0[_2835]._m4).xyz * ((vec3(_507.x, _507.y, _507.z) * _3225.x) + vec3(_3225.y));
                    vec4 _3233 = vec4(_3232.x, _3232.y, _3232.z, _3220.w);
                    _3233.w = _3220.w * _3185;
                    _3237 = _3233;
                }
                else
                {
                    _3237 = vec4(0.0);
                }
                _3242 = mix(_2823, _3237.xyz, vec3(_3237.w));
            }
            else
            {
                _3242 = _2823;
            }
            _2824 = _3242;
            _2827 = _3063;
        }
        float _3243 = _6._m0[0u] * 100.0;
        bool _3248 = _26._m19 > 0.0;
        vec3 _3309;
        SPIRV_CROSS_BRANCH
        if (_3248 && (_26._m35 == 0.0))
        {
            vec3 _3262 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _3263 = length(_3262);
            vec3 _3274;
            float _3275;
            if (_3263 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _3272 = _3262;
                _3272.z = _3262.z + _29._m0;
                _3274 = _3272;
                _3275 = length(_3272);
            }
            else
            {
                _3274 = _3262;
                _3275 = _3263;
            }
            float _3278 = dot(_3274 / vec3(_3275), _26._m36);
            float _3279 = _29._m0 / _3275;
            _3309 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_3278 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_3275 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_3278 < (-sqrt(fma(-_3279, _3279, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _3309 = _26._m2;
        }
        float _3322 = texelFetch(_41, ivec3(int(_577), int(_578), 0).xy, 0).x;
        float _3407;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _3346 = _27._m6 + _511;
            vec3 _3353 = vec3(0.0, _26._m18.z, 0.0) + (_3346 - vec3(0.0, _26._m25, 0.0));
            float _3357 = dot(_3353, _26._m24);
            vec2 _3367 = ((((_3353 + (_26._m24 * (sqrt(fma(_3357, _3357, fma(_26._m18.z, _26._m18.z, -dot(_3353, _3353)))) - _3357))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _3367.x = 1.0 - _3367.x;
            vec3 _3380 = vec3(0.0, _26._m23.z, 0.0) + (_3346 - vec3(0.0, _26._m27, 0.0));
            float _3384 = dot(_3380, _26._m26);
            vec2 _3394 = ((((_3380 + (_26._m26 * (sqrt(fma(_3384, _3384, fma(_26._m23.z, _26._m23.z, -dot(_3380, _3380)))) - _3384))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _3394.x = 1.0 - _3394.x;
            _3407 = _3322 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _3367, 0.0).x, textureLod(sampler2D(_33, _7), _3394, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _3407 = _3322;
        }
        float _3497;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _3435 = _27._m6 + _511;
            vec3 _3443 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _3435) - vec3(0.0, _26._m30, 0.0));
            float _3447 = dot(_3443, _26._m24);
            vec2 _3457 = ((((_3443 + (_26._m24 * (sqrt(fma(_3447, _3447, fma(_26._m28.z, _26._m28.z, -dot(_3443, _3443)))) - _3447))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _3457.x = 1.0 - _3457.x;
            vec3 _3471 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _3435) - vec3(0.0, _26._m33, 0.0));
            float _3475 = dot(_3471, _26._m26);
            vec2 _3485 = ((((_3471 + (_26._m26 * (sqrt(fma(_3475, _3475, fma(_26._m31.z, _26._m31.z, -dot(_3471, _3471)))) - _3475))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _3485.x = 1.0 - _3485.x;
            _3497 = _3407 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _3457, 0.0).x, textureLod(sampler2D(_23, _7), _3485, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _3497 = _3407;
        }
        vec3 _3499 = _3309 * (_3497 * _6._m0[0u]);
        vec3 _3677;
        vec3 _3678;
        SPIRV_CROSS_BRANCH
        if (_591)
        {
            vec3 _3587 = reflect(_513, _488);
            float _3589 = spvNMax(dot(_488, _513), 9.9999997473787516355514526367188e-06);
            float _3593 = clamp(dot(_26._m0, normalize(_513 + _26._m0)), 0.0, 1.0);
            float _3595 = clamp(dot(_488, _26._m0), 0.0, 1.0);
            vec3 _3602 = vec3(fma((2.0 * _3593) * _3593, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
            float _3621 = dot(_26._m0, _3587);
            vec3 _3631 = mix(_3587, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_3587 - (_26._m0 * _3621)) * 0.0045900647528469562530517578125)), bvec3(_3621 < 0.999989449977874755859375));
            vec3 _3633 = normalize(_513 + _3631);
            float _3637 = clamp(dot(_488, _3633), 0.0, 1.0);
            float _3639 = clamp(dot(_488, _3631), 0.0, 1.0);
            float _3641 = (_542 + 1.0) * 0.5;
            float _3642 = _542 * _542;
            float _3650 = _3641 * _3641;
            float _3662 = _3642 * _3642;
            float _3665 = fma(fma(_3637, _3662, -_3637), _3637, 1.0);
            _3677 = _2740 + ((_3499 * ((_507 + ((vec3(1.0) - _507) * pow(spvNMax(abs(1.0 - clamp(dot(_3631, _3633), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3639, sqrt(fma(fma(-_3589, _3650, _3589), _3589, _3650)), _3589 * sqrt(fma(fma(-_3639, _3650, _3639), _3639, _3650)))) * (_3662 * (0.3183098733425140380859375 / (_3665 * _3665)))))) * _3595);
            _3678 = _2741 + ((_3499 * (_510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3602 * pow(spvNMax(abs(1.0 - _3595), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3602 * pow(spvNMax(abs(1.0 - _3589), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))))) * _3595);
        }
        else
        {
            vec3 _3583;
            vec3 _3584;
            if (_498)
            {
                vec3 _3508 = reflect(_513, _488);
                float _3510 = spvNMax(dot(_488, _513), 9.9999997473787516355514526367188e-06);
                float _3514 = clamp(dot(_26._m0, normalize(_513 + _26._m0)), 0.0, 1.0);
                float _3516 = clamp(dot(_488, _26._m0), 0.0, 1.0);
                vec3 _3523 = vec3(fma((2.0 * _3514) * _3514, _542, mix(0.0, 0.5, _542))) - vec3(1.0);
                float _3542 = dot(_26._m0, _3508);
                vec3 _3552 = mix(_3508, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_3508 - (_26._m0 * _3542)) * 0.0045900647528469562530517578125)), bvec3(_3542 < 0.999989449977874755859375));
                float _3556 = clamp(dot(_488, normalize(_513 + _3552)), 0.0, 1.0);
                float _3558 = clamp(dot(_488, _3552), 0.0, 1.0);
                float _3569 = clamp(_3510, 0.0, 1.0);
                _3583 = _2740 + ((_3499 * (_508.xyz * ((((2.0 + (1.0 / _542)) * pow(spvNMax(abs(fma(-_3556, _3556, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _542)) * 0.15915493667125701904296875) * (0.25 / fma(-_3558, _3569, _3558 + _3569))))) * _3558);
                _3584 = _2741 + ((_3499 * (_510 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3523 * pow(spvNMax(abs(1.0 - _3516), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3523 * pow(spvNMax(abs(1.0 - _3510), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _542))))) * _3516);
            }
            else
            {
                _3583 = _2740;
                _3584 = _2741;
            }
            _3677 = _3583;
            _3678 = _3584;
        }
        float _3698;
        float _3699;
        if (_34._m0.x > 0.0)
        {
            vec4 _3686 = textureLod(sampler2D(_40, _12), _407, 0.0);
            float _3687 = _3686.x;
            _3698 = clamp((pow(spvNMax(abs(dot(_488, _513) + _3687), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _542, -1.0))) - 1.0) + _3687, 0.0, 1.0);
            _3699 = _3687;
        }
        else
        {
            _3698 = 1.0;
            _3699 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _3699, 0.7);
            _3677 *= rdx_ao_factor;
            _3678 *= rdx_ao_factor;
        }
        vec3 _3707 = (_3678 * mix(1.0, _3699, _34._m0.y)) + ((_2826 * _3243) * _3699);
        vec3 _3709 = (_3677 * mix(1.0, _3698, _34._m0.y)) + ((_2823 * _3243) * _3698);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _3709 *= rdx_multi_scatter_compensation(_2789, _542, _507);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _3322, 0.5);
            _3707 *= _rdx_csm_shadow;
            _3709 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _39, _7, _407, _rdx_marchDir, _449, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _3707 *= _rdx_micro;
            _3709 *= _rdx_micro;
        }
        vec3 _4214;
        vec3 _4215;
        SPIRV_CROSS_BRANCH
        if (_3248)
        {
            vec3 _3717 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _3718 = vec3(0.0, 636100.0, 0.0) + (_511 + _27._m6);
            float _3719 = length(_3718);
            vec3 _3723 = (_3718 / vec3(_3719)) * spvNMax(_3719, 636100.0);
            vec3 _3724 = _3723 - _3717;
            float _3725 = length(_3724);
            vec3 _3727 = _3724 / vec3(_3725);
            float _3728 = length(_3717);
            vec3 _3742;
            vec3 _3743;
            float _3744;
            if (_3728 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _3737 = _3717;
                _3737.z = _3717.z + _29._m0;
                vec3 _3740 = _3723;
                _3740.z = _3723.z + _29._m0;
                _3742 = _3740;
                _3743 = _3737;
                _3744 = length(_3737);
            }
            else
            {
                _3742 = _3723;
                _3743 = _3717;
                _3744 = _3728;
            }
            float _3745 = dot(_3743, _3727);
            float _3756 = spvNMax((-_3745) - sqrt(fma(_29._m1, _29._m1, fma(_3745, _3745, -(_3744 * _3744)))), 0.0);
            bool _3759 = (_3756 > 0.0) && (_3756 < _3725);
            vec3 _3767;
            float _3768;
            float _3769;
            if (_3759)
            {
                _3767 = _3743 + (_3727 * _3756);
                _3768 = _3725 - _3756;
                _3769 = (_3745 + _3756) / _29._m1;
            }
            else
            {
                _3767 = _3743;
                _3768 = _3725;
                _3769 = _3745 / _3744;
            }
            float _3770 = _3759 ? _29._m1 : _3744;
            vec3 _4207;
            vec3 _4208;
            if (_3770 <= _29._m1)
            {
                float _3775 = dot(_3727, _26._m36);
                float _3777 = dot(_3767, _26._m36) / _3770;
                float _3778 = _29._m0 + 600.0;
                bool _3779 = _3770 < _3778;
                vec3 _3784;
                if (_3779)
                {
                    _3784 = _3742 * (_3778 / _3770);
                }
                else
                {
                    _3784 = _3742;
                }
                float _3785 = _3779 ? _3778 : _3770;
                float _3786 = length(_3784);
                float _3787 = dot(_3784, _3727);
                float _3789 = dot(_3784, _26._m36) / _3786;
                vec2 _3800 = vec2(_3769, _3769 + (_3768 / _3785));
                vec2 _3801 = _3800 * sqrt((0.5 / _29._m4) * _3785);
                vec2 _3804 = vec2(ivec2(sign(_3801)));
                vec2 _3805 = _3801 * _3801;
                float _3819 = -_3768;
                float _3821 = 2.0 * _3785;
                float _3823 = (_3768 / _3821) + _3769;
                float _3831 = _29._m0 - _3785;
                vec2 _3846 = _3800 * sqrt((0.5 / _29._m6) * _3785);
                vec2 _3849 = vec2(ivec2(sign(_3846)));
                vec2 _3850 = _3846 * _3846;
                vec3 _3880 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _3785) * exp(_3831 / _29._m4)) * (((_3804.y > _3804.x) ? exp(_3805.x) : 0.0) + dot((_3804 / ((abs(_3801) * 2.3192999362945556640625) + sqrt((_3805 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3819 / _29._m4) * _3823)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _3785) * exp(_3831 / _29._m6)) * (((_3849.y > _3849.x) ? exp(_3850.x) : 0.0) + dot((_3849 / ((abs(_3846) * 2.3192999362945556640625) + sqrt((_3850 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3819 / _29._m6) * _3823)), vec2(1.0, -1.0))))));
                vec3 _3881 = spvNMin(_3880, vec3(1.0));
                float _3882 = _29._m0 / _3785;
                float _3885 = sqrt(fma(-_3882, _3882, 1.0));
                float _3887 = _3769 - (-_3885);
                vec4 _4170;
                if (abs(_3887) < 0.0040000001899898052215576171875)
                {
                    float _3995 = (-0.0040000001899898052215576171875) - _3885;
                    float _3997 = fma(_3785, _3785, _3768 * _3768);
                    float _3998 = _3821 * _3768;
                    float _4000 = sqrt(fma(_3998, _3995, _3997));
                    float _4001 = fma(_3785, _3995, _3768);
                    float _4004 = -(_29._m0 * _29._m0);
                    float _4006 = sqrt(fma(_29._m1, _29._m1, _4004));
                    float _4008 = sqrt(fma(_3785, _3785, _4004));
                    float _4009 = _3785 * _3995;
                    float _4011 = -(_3785 * _3785);
                    float _4013 = fma(_29._m0, _29._m0, fma(_4009, _4009, _4011));
                    vec4 _4019 = vec4(-1.0, _4006 * _4006, _4006, 0.50390625);
                    vec4 _4020 = mix(_4019, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4009 < 0.0) && (_4013 > 0.0)));
                    float _4022 = fma(_4008 / _4006, 0.96875, 0.015625);
                    float _4032 = fma(fma(_4009, _4020.x, sqrt(_4013 + _4020.y)) / (_4008 + _4020.z), 0.4921875, _4020.w);
                    float _4038 = _3775 + 1.0;
                    float _4040 = floor(_4038 * 3.5);
                    float _4042 = fma(_4038, 3.5, -_4040);
                    float _4043 = _4040 + fma(fma(atan(spvNMax(_3777, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4044 = _4043 * 0.125;
                    float _4048 = 1.0 - _4042;
                    float _4051 = (_4043 + 1.0) * 0.125;
                    float _4058 = sqrt(fma(_4000, _4000, _4004));
                    float _4062 = fma(_29._m0, _29._m0, fma(_4001, _4001, -(_4000 * _4000)));
                    vec4 _4067 = mix(_4019, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4001 < 0.0) && (_4062 > 0.0)));
                    float _4069 = fma(_4058 / _4006, 0.96875, 0.015625);
                    float _4079 = fma(fma(_4001, _4067.x, sqrt(_4062 + _4067.y)) / (_4058 + _4067.z), 0.4921875, _4067.w);
                    float _4085 = _4040 + fma(fma(atan(spvNMax(_3789, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4086 = _4085 * 0.125;
                    float _4092 = (_4085 + 1.0) * 0.125;
                    vec4 _4098 = _3881.xyzx;
                    float _4102 = 0.0040000001899898052215576171875 - _3885;
                    float _4104 = sqrt(fma(_3998, _4102, _3997));
                    float _4105 = fma(_3785, _4102, _3768);
                    float _4106 = _3785 * _4102;
                    float _4108 = fma(_29._m0, _29._m0, fma(_4106, _4106, _4011));
                    vec4 _4113 = mix(_4019, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4106 < 0.0) && (_4108 > 0.0)));
                    float _4123 = fma(fma(_4106, _4113.x, sqrt(_4108 + _4113.y)) / (_4008 + _4113.z), 0.4921875, _4113.w);
                    float _4134 = sqrt(fma(_4104, _4104, _4004));
                    float _4138 = fma(_29._m0, _29._m0, fma(_4105, _4105, -(_4104 * _4104)));
                    vec4 _4143 = mix(_4019, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4105 < 0.0) && (_4138 > 0.0)));
                    float _4145 = fma(_4134 / _4006, 0.96875, 0.015625);
                    float _4155 = fma(fma(_4105, _4143.x, sqrt(_4138 + _4143.y)) / (_4134 + _4143.z), 0.4921875, _4143.w);
                    _4170 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_4086, _4079, _4069), 0.0) * _4048) + (textureLod(sampler3D(_31, _7), vec3(_4092, _4079, _4069), 0.0) * _4042)), _4098, (textureLod(sampler3D(_31, _7), vec3(_4044, _4032, _4022), 0.0) * _4048) + (textureLod(sampler3D(_31, _7), vec3(_4051, _4032, _4022), 0.0) * _4042)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_4086, _4155, _4145), 0.0) * _4048) + (textureLod(sampler3D(_31, _7), vec3(_4092, _4155, _4145), 0.0) * _4042)), _4098, (textureLod(sampler3D(_31, _7), vec3(_4044, _4123, _4022), 0.0) * _4048) + (textureLod(sampler3D(_31, _7), vec3(_4051, _4123, _4022), 0.0) * _4042)), vec4(0.0)), vec4((_3887 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _3895 = -(_29._m0 * _29._m0);
                    float _3897 = sqrt(fma(_29._m1, _29._m1, _3895));
                    float _3899 = sqrt(fma(_3785, _3785, _3895));
                    float _3900 = _3785 * _3769;
                    float _3904 = fma(_29._m0, _29._m0, fma(_3900, _3900, -(_3785 * _3785)));
                    vec4 _3910 = vec4(-1.0, _3897 * _3897, _3897, 0.50390625);
                    vec4 _3911 = mix(_3910, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3900 < 0.0) && (_3904 > 0.0)));
                    float _3913 = fma(_3899 / _3897, 0.96875, 0.015625);
                    float _3923 = fma(fma(_3900, _3911.x, sqrt(_3904 + _3911.y)) / (_3899 + _3911.z), 0.4921875, _3911.w);
                    float _3929 = _3775 + 1.0;
                    float _3931 = floor(_3929 * 3.5);
                    float _3933 = fma(_3929, 3.5, -_3931);
                    float _3934 = _3931 + fma(fma(atan(spvNMax(_3777, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3939 = 1.0 - _3933;
                    float _3949 = sqrt(fma(_3786, _3786, _3895));
                    float _3953 = fma(_29._m0, _29._m0, fma(_3787, _3787, -(_3786 * _3786)));
                    vec4 _3958 = mix(_3910, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3787 < 0.0) && (_3953 > 0.0)));
                    float _3960 = fma(_3949 / _3897, 0.96875, 0.015625);
                    float _3970 = fma(fma(_3787, _3958.x, sqrt(_3953 + _3958.y)) / (_3949 + _3958.z), 0.4921875, _3958.w);
                    float _3976 = _3931 + fma(fma(atan(spvNMax(_3789, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _4170 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_3976 * 0.125, _3970, _3960), 0.0) * _3939) + (textureLod(sampler3D(_31, _7), vec3((_3976 + 1.0) * 0.125, _3970, _3960), 0.0) * _3933)), _3881.xyzx, (textureLod(sampler3D(_31, _7), vec3(_3934 * 0.125, _3923, _3913), 0.0) * _3939) + (textureLod(sampler3D(_31, _7), vec3((_3934 + 1.0) * 0.125, _3923, _3913), 0.0) * _3933)), vec4(0.0));
                }
                float _4185 = fma(_3775, _3775, 1.0);
                _4207 = _3881;
                _4208 = (_4170.xyz * (0.0596831031143665313720703125 * _4185)) + ((((_4170.xyz * (_4170.w * smoothstep(0.0, 0.0199999995529651641845703125, _3777))) / vec3(spvNMax(_4170.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _3775, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _4185) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _4207 = vec3(1.0);
                _4208 = vec3(0.0);
            }
            _4214 = _3709 * _4207;
            _4215 = fma(_3707, _4207, _4208 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _4214 = _3709;
            _4215 = _3707;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_39, _7, _407, _rdx_dir, _449, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _4215 = vec3(_rdx_vis);
            _4214 = vec3(0.0);
        }
        imageStore(_43, ivec2(_390), vec4(_4215, 1.0));
        imageStore(_44, ivec2(_390), vec4(_4214, 1.0));
        break;
    } while(false);
}

