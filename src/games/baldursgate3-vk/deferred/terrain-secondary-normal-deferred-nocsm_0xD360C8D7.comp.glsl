#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
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
#extension GL_KHR_shader_subgroup_basic : require
#extension GL_KHR_shader_subgroup_quad : require
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

float _305;
const vec4 _316[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _344;
vec3 _349;
vec3 _350;

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
        uint _389 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _391 = _42._m0[_389];
        uvec2 _396 = (uvec2(_391 & 65535u, _391 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_396, _28._m3)) || any(greaterThan(_396, _28._m4)))
        {
            break;
        }
        vec2 _408 = vec2(_396);
        vec2 _413 = (_408 + vec2(0.5)) / vec2(_34._m1);
        vec2 _420 = ((_413 - _28._m1) / _28._m0) * 0.5;
        float _424 = _420.x;
        float _426 = _420.y;
        ivec2 _444 = ivec3(int(_396.x), int(_396.y), 0).xy;
        vec4 _448 = texelFetch(_36, _444, 0);
        vec4 _450 = texelFetch(_37, _444, 0);
        vec4 _452 = texelFetch(_38, _444, 0);
        vec4 _454 = texelFetch(_39, _444, 0);
        float _455 = _454.x;
        vec3 _473;
        do
        {
            vec3 _461 = fma(vec3(texelFetch(_35, _444, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _462 = dot(_461, _461);
            if (_462 > 54000001024.0)
            {
                _473 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _467 = 2.0 / _462;
                vec2 _469 = _461.xy * _467;
                vec3 _470 = vec3(_469.x, _469.y, _349.z);
                _470.z = 1.0 - _467;
                _473 = _470;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _476 = _450.y;
        float _477 = _450.z;
        uint _481 = uint(roundEven(_450.w * 255.0));
        uint _482 = _481 & 7u;
        uint _484 = (_481 & 112u) >> 4u;
        mat3 _493 = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        vec3 _494 = _473 * _493;
        vec3 _497 = vec3(_448.x, _448.y, _448.z) * (1.0 - _477);
        vec3 _502 = mix(vec3(0.1599999964237213134765625 * (_476 * _476)), _448.xyz, vec3(_477));
        float _503 = spvNMax(0.0900000035762786865234375, _450.x);
        bool _504 = _482 == 2u;
        float _542;
        vec3 _543;
        SPIRV_CROSS_BRANCH
        if (_504)
        {
            vec3 _509 = _452.xyz * 255.0;
            float _511 = _509.y * 0.0625;
            vec2 _521 = clamp((vec2(fma(_509.x, 16.0, floor(_511)), fma(fract(_511), 4096.0, _509.z)) * 0.000488519784994423389434814453125) - vec2(1.0), vec2(-1.0), vec2(1.0));
            float _527 = (1.0 - abs(_521.x)) - abs(_521.y);
            vec3 _528;
            _528.z = _527;
            vec2 _537 = mix((vec2(1.0) - abs(_521.yx)) * mix(vec2(-1.0), vec2(1.0), greaterThanEqual(_521, vec2(0.0))), _521, bvec2(_527 >= 0.0));
            _542 = _452.w;
            _543 = normalize(vec3(_537.x, _537.y, _528.z)) * _493;
        }
        else
        {
            _542 = 0.0;
            _543 = vec3(1.0, 0.0, 0.0);
        }
        vec3 _544 = (((_26._m7[0].xyz * ((1.0 - _424) - _426)) + (_26._m7[1].xyz * _424)) + (_26._m7[2].xyz * _426)) * _455;
        vec3 _546 = normalize(-_544);
        uint _548 = gl_SubgroupInvocationID & 3u;
        float _553 = ((_548 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _554 = (subgroupQuadSwapHorizontal(_473) - _473) * _553;
        float _559 = ((_548 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _560 = (subgroupQuadSwapVertical(_473) - _473) * _559;
        vec3 _564 = mix(_554, vec3(0.0), bvec3(any(isnan(_554))));
        vec3 _568 = mix(_560, vec3(0.0), bvec3(any(isnan(_560))));
        float _575 = sqrt(clamp(fma(_503, _503, spvNMin(dot(_564, _564) + dot(_568, _568), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _584 = ivec2(uvec2(_408) / uvec2(_19._m25));
        int _607 = int(fma(fma(float(int(clamp(fma(log2(_455 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_584.y)), _19._m23, float(_584.x)));
        float _610 = _408.x;
        float _611 = _408.y;
        float _616 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _610, 0.005837149918079376220703125 * _611)));
        float _623 = clamp(fma(_19._m34.y, length(_544), _19._m34.x), 0.0, 1.0);
        bool _624 = _482 == 0u;
        vec3 _2959;
        vec3 _2960;
        SPIRV_CROSS_BRANCH
        if (_624)
        {
            uvec4 _1921 = uvec4(_8._m0[uint(_607)]);
            uint _1922 = _1921.x;
            uint _1923 = _1921.y;
            uint _1926 = ((_1923 >> 0u) & 4095u) + _1922;
            uint _1929 = ((_1923 >> 12u) & 4095u) + _1926;
            uint _1933 = ((_1921.z >> 0u) & 1023u) + _1929;
            float _1935 = spvNMax(dot(_494, _546), 9.9999997473787516355514526367188e-06);
            float _1937;
            bool _1940;
            vec3 _1942;
            vec3 _1944;
            uint _1946;
            _1937 = _305;
            _1940 = false;
            _1942 = vec3(0.0);
            _1944 = vec3(0.0);
            _1946 = _1922;
            float _1938;
            bool _1941;
            vec3 _1943;
            vec3 _1945;
            for (; _1946 < _1926; _1937 = _1938, _1940 = _1941, _1942 = _1943, _1944 = _1945, _1946++)
            {
                uint _1953 = uint(_9._m0[_1946]);
                float _1971 = abs(_10._m0[_1953]._m5);
                if ((_10._m0[_1953]._m6 & (1u << (_484 & 31u))) != 0u)
                {
                    vec3 _1986 = _10._m0[_1953]._m0.xyz - _544;
                    float _1987 = dot(_1986, _1986);
                    vec3 _1990 = _1986 * inversesqrt(spvNMax(_1987, 1.0000000133514319600180897396058e-10));
                    float _1991 = _10._m0[_1953]._m0.w * _10._m0[_1953]._m0.w;
                    float _2229;
                    bool _2230;
                    vec3 _2231;
                    vec3 _2232;
                    if (_1987 < (1.0 / _1991))
                    {
                        vec3 _1996 = _546 + _1990;
                        vec3 _2000 = _1996 * inversesqrt(spvNMax(dot(_1996, _1996), 1.0000000133514319600180897396058e-10));
                        float _2002 = clamp(dot(_1990, _2000), 0.0, 1.0);
                        float _2004 = clamp(dot(_494, _2000), 0.0, 1.0);
                        float _2006 = clamp(dot(_494, _1990), 0.0, 1.0);
                        float _2007 = _1987 * _1991;
                        float _2013 = pow(spvNMax(abs(clamp(fma(-_2007, _2007, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1953]._m4);
                        float _2023;
                        if (_10._m0[_1953]._m5 < 0.0)
                        {
                            _2023 = _2013 * fma(4.0, _1991, _1971);
                        }
                        else
                        {
                            _2023 = _2013 * ((1.0 / spvNMax(_1987, 9.9999997473787516355514526367188e-05)) + _1971);
                        }
                        float _2025 = 0.079577468335628509521484375 * (_2006 * _2023);
                        float _2160;
                        bool _2161;
                        float _2162;
                        if ((_10._m0[_1953]._m7 & 1u) != 0u)
                        {
                            uint _2050;
                            do
                            {
                                vec3 _2030 = -_1990;
                                float _2031 = dot(_2030, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _2032 = dot(_2030, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _2033 = dot(_2030, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _2037 = spvNMax(spvNMax(_2031, _2032), spvNMax(_2033, dot(_2030, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_2037 == _2031)
                                {
                                    _2050 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_2037 == _2032)
                                    {
                                        _2050 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_2037 == _2033)
                                        {
                                            _2050 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _2050 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _2052 = uint(int(_10._m0[_1953]._m7 >> 2u)) + _2050;
                            float _2154;
                            bool _2155;
                            float _2156;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2006 <= 0.0) && true)
                                {
                                    _2154 = _1937;
                                    _2155 = _1940;
                                    _2156 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2085 = _20._m0[_2052]._m0 * vec4(_544 + (_494 * ((3.5 * float(int(sign(_2006)))) * (_20._m0[_2052]._m4 * sqrt(_1987)))), 1.0);
                                    vec3 _2089 = _2085.xyz / vec3(_2085.w);
                                    vec2 _2092 = (_2089.xy * 0.5) + vec2(0.5);
                                    _2092.y = 1.0 - _2092.y;
                                    float _2101 = (_20._m0[_2052]._m5.y / _20._m0[_2052]._m6) / (_2089.z - _20._m0[_2052]._m5.x);
                                    float _2106 = _1940 ? _1937 : 6.283185482025146484375;
                                    float _2107 = _616 * _2106;
                                    vec2 _2108 = _20._m0[_2052]._m1 + _19._m33;
                                    vec2 _2111 = (_20._m0[_2052]._m1 + vec2(_20._m0[_2052]._m2)) - _19._m33;
                                    float _2113;
                                    _2113 = 0.0;
                                    for (int _2116 = 0; _2116 < 12; )
                                    {
                                        float _2121 = float(uint(_2116));
                                        float _2124 = sqrt(_2121 + 0.5) * 0.288675129413604736328125;
                                        float _2125 = fma(_2121, 2.3999631404876708984375, _2107);
                                        vec2 _2133 = clamp(fma((vec3(cos(_2125), sin(_2125), _2124).xy * _2124) * 2.5, _19._m33, _2092), _2108, _2111);
                                        vec2 _2136 = fract(fma(vec2(1.0) / _19._m33, _2133, vec2(0.5)));
                                        vec4 _2142 = vec4(lessThan(vec4(_2101), textureGather(sampler2D(_21, _12), _2133)));
                                        float _2145 = _2136.x;
                                        _2113 += clamp(mix(mix(_2142.w, _2142.z, _2145), mix(_2142.x, _2142.y, _2145), _2136.y), 0.0, 1.0);
                                        _2116++;
                                        continue;
                                    }
                                    _2154 = _2106;
                                    _2155 = _1940 ? _1940 : true;
                                    _2156 = _2113 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2160 = _2154;
                            _2161 = _2155;
                            _2162 = _2025 * mix(1.0, _2156, spvNMin(_623, _10._m0[_1953]._m8));
                        }
                        else
                        {
                            _2160 = _1937;
                            _2161 = _1940;
                            _2162 = _2025;
                        }
                        vec3 _2227;
                        vec3 _2228;
                        if (_2006 > 0.0)
                        {
                            vec3 _2168 = _10._m0[_1953]._m1.xyz * (_2162 * ((_10._m0[_1953]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2175 = vec3(fma((2.0 * _2002) * _2002, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                            float _2196 = (_575 + 1.0) * 0.5;
                            float _2197 = _575 * _575;
                            float _2205 = _2196 * _2196;
                            float _2217 = _2197 * _2197;
                            float _2220 = fma(fma(_2004, _2217, -_2004), _2004, 1.0);
                            _2227 = fma(_2168, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _2002), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2006, sqrt(fma(fma(-_1935, _2205, _1935), _1935, _2205)), _1935 * sqrt(fma(fma(-_2006, _2205, _2006), _2006, _2205)))) * (_2217 * (0.3183098733425140380859375 / (_2220 * _2220)))), _1942);
                            _2228 = fma(_2168, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2175 * pow(spvNMax(abs(1.0 - _2006), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2175 * pow(spvNMax(abs(1.0 - _1935), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _1944);
                        }
                        else
                        {
                            _2227 = _1942;
                            _2228 = _1944;
                        }
                        _2229 = _2160;
                        _2230 = _2161;
                        _2231 = _2227;
                        _2232 = _2228;
                    }
                    else
                    {
                        _2229 = _1937;
                        _2230 = _1940;
                        _2231 = _1942;
                        _2232 = _1944;
                    }
                    _1938 = _2229;
                    _1941 = _2230;
                    _1943 = _2231;
                    _1945 = _2232;
                }
                else
                {
                    _1938 = _1937;
                    _1941 = _1940;
                    _1943 = _1942;
                    _1945 = _1944;
                }
            }
            float _2234;
            bool _2237;
            vec3 _2239;
            vec3 _2241;
            uint _2243;
            _2234 = _1937;
            _2237 = _1940;
            _2239 = _1942;
            _2241 = _1944;
            _2243 = _1946;
            float _2235;
            bool _2238;
            vec3 _2240;
            vec3 _2242;
            for (; _2243 < _1929; _2234 = _2235, _2237 = _2238, _2239 = _2240, _2241 = _2242, _2243++)
            {
                uint _2250 = uint(_9._m0[_2243]);
                float _2263 = abs(_10._m0[_2250]._m5);
                if ((_10._m0[_2250]._m6 & (1u << (_484 & 31u))) != 0u)
                {
                    vec3 _2281 = _10._m0[_2250]._m0.xyz - _544;
                    float _2282 = dot(_2281, _2281);
                    vec3 _2285 = _2281 * inversesqrt(spvNMax(_2282, 1.0000000133514319600180897396058e-10));
                    float _2286 = _10._m0[_2250]._m0.w * _10._m0[_2250]._m0.w;
                    float _2514;
                    bool _2515;
                    vec3 _2516;
                    vec3 _2517;
                    if (_2282 < (1.0 / _2286))
                    {
                        vec3 _2291 = _546 + _2285;
                        vec3 _2295 = _2291 * inversesqrt(spvNMax(dot(_2291, _2291), 1.0000000133514319600180897396058e-10));
                        float _2297 = clamp(dot(_2285, _2295), 0.0, 1.0);
                        float _2299 = clamp(dot(_494, _2295), 0.0, 1.0);
                        float _2301 = clamp(dot(_494, _2285), 0.0, 1.0);
                        float _2304 = dot(-_2285, normalize(_10._m0[_2250]._m2.xyz));
                        float _2333;
                        if (_2304 > _10._m0[_2250]._m1.w)
                        {
                            float _2308 = _2282 * _2286;
                            float _2314 = pow(spvNMax(abs(clamp(fma(-_2308, _2308, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_2250]._m4);
                            float _2324;
                            if (_10._m0[_2250]._m5 < 0.0)
                            {
                                _2324 = _2314 * fma(4.0, _2286, _2263);
                            }
                            else
                            {
                                _2324 = _2314 * ((1.0 / spvNMax(_2282, 9.9999997473787516355514526367188e-05)) + _2263);
                            }
                            float _2329 = clamp((_2304 - _10._m0[_2250]._m1.w) / spvNMax(_10._m0[_2250]._m2.w - _10._m0[_2250]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _2333 = _2301 * (_2324 * (_2329 * _2329));
                        }
                        else
                        {
                            _2333 = 0.0;
                        }
                        float _2334 = 0.3183098733425140380859375 * _2333;
                        float _2445;
                        bool _2446;
                        float _2447;
                        if ((_10._m0[_2250]._m7 & 1u) != 0u)
                        {
                            uint _2337 = uint(int(_10._m0[_2250]._m7 >> 2u));
                            float _2439;
                            bool _2440;
                            float _2441;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2301 <= 0.0) && true)
                                {
                                    _2439 = _2234;
                                    _2440 = _2237;
                                    _2441 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2370 = _20._m0[_2337]._m0 * vec4(_544 + (_494 * ((3.5 * float(int(sign(_2301)))) * (_20._m0[_2337]._m4 * sqrt(_2282)))), 1.0);
                                    vec3 _2374 = _2370.xyz / vec3(_2370.w);
                                    vec2 _2377 = (_2374.xy * 0.5) + vec2(0.5);
                                    _2377.y = 1.0 - _2377.y;
                                    float _2386 = (_20._m0[_2337]._m5.y / _20._m0[_2337]._m6) / (_2374.z - _20._m0[_2337]._m5.x);
                                    float _2391 = _2237 ? _2234 : 6.283185482025146484375;
                                    float _2392 = _616 * _2391;
                                    vec2 _2393 = _20._m0[_2337]._m1 + _19._m33;
                                    vec2 _2396 = (_20._m0[_2337]._m1 + vec2(_20._m0[_2337]._m2)) - _19._m33;
                                    float _2398;
                                    _2398 = 0.0;
                                    for (int _2401 = 0; _2401 < 12; )
                                    {
                                        float _2406 = float(uint(_2401));
                                        float _2409 = sqrt(_2406 + 0.5) * 0.288675129413604736328125;
                                        float _2410 = fma(_2406, 2.3999631404876708984375, _2392);
                                        vec2 _2418 = clamp(fma((vec3(cos(_2410), sin(_2410), _2409).xy * _2409) * 2.5, _19._m33, _2377), _2393, _2396);
                                        vec2 _2421 = fract(fma(vec2(1.0) / _19._m33, _2418, vec2(0.5)));
                                        vec4 _2427 = vec4(lessThan(vec4(_2386), textureGather(sampler2D(_21, _12), _2418)));
                                        float _2430 = _2421.x;
                                        _2398 += clamp(mix(mix(_2427.w, _2427.z, _2430), mix(_2427.x, _2427.y, _2430), _2421.y), 0.0, 1.0);
                                        _2401++;
                                        continue;
                                    }
                                    _2439 = _2391;
                                    _2440 = _2237 ? _2237 : true;
                                    _2441 = _2398 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2445 = _2439;
                            _2446 = _2440;
                            _2447 = _2334 * mix(1.0, _2441, spvNMin(_623, _10._m0[_2250]._m8));
                        }
                        else
                        {
                            _2445 = _2234;
                            _2446 = _2237;
                            _2447 = _2334;
                        }
                        vec3 _2512;
                        vec3 _2513;
                        if (_2301 > 0.0)
                        {
                            vec3 _2453 = _10._m0[_2250]._m1.xyz * (_2447 * ((_10._m0[_2250]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2460 = vec3(fma((2.0 * _2297) * _2297, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                            float _2481 = (_575 + 1.0) * 0.5;
                            float _2482 = _575 * _575;
                            float _2490 = _2481 * _2481;
                            float _2502 = _2482 * _2482;
                            float _2505 = fma(fma(_2299, _2502, -_2299), _2299, 1.0);
                            _2512 = fma(_2453, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _2297), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2301, sqrt(fma(fma(-_1935, _2490, _1935), _1935, _2490)), _1935 * sqrt(fma(fma(-_2301, _2490, _2301), _2301, _2490)))) * (_2502 * (0.3183098733425140380859375 / (_2505 * _2505)))), _2239);
                            _2513 = fma(_2453, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2460 * pow(spvNMax(abs(1.0 - _2301), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2460 * pow(spvNMax(abs(1.0 - _1935), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _2241);
                        }
                        else
                        {
                            _2512 = _2239;
                            _2513 = _2241;
                        }
                        _2514 = _2445;
                        _2515 = _2446;
                        _2516 = _2512;
                        _2517 = _2513;
                    }
                    else
                    {
                        _2514 = _2234;
                        _2515 = _2237;
                        _2516 = _2239;
                        _2517 = _2241;
                    }
                    _2235 = _2514;
                    _2238 = _2515;
                    _2240 = _2516;
                    _2242 = _2517;
                }
                else
                {
                    _2235 = _2234;
                    _2238 = _2237;
                    _2240 = _2239;
                    _2242 = _2241;
                }
            }
            vec3 _2524;
            vec3 _2526;
            _2524 = _2239;
            _2526 = _2241;
            float _2520;
            bool _2523;
            vec3 _2525;
            vec3 _2527;
            float _2519 = _2234;
            bool _2522 = _2237;
            uint _2528 = _2243;
            for (; _2528 < _1933; _2519 = _2520, _2522 = _2523, _2524 = _2525, _2526 = _2527, _2528++)
            {
                uint _2535 = uint(_9._m0[_2528]);
                int _2564 = int(_11._m0[_2535]._m1 >> 1u) - 1;
                if (((_11._m0[_2535]._m4 & 16777215u) & (1u << (_484 & 31u))) != 0u)
                {
                    vec3 _2575 = _11._m0[_2535]._m6 * vec4(_544, 1.0);
                    float _2955;
                    bool _2956;
                    vec3 _2957;
                    vec3 _2958;
                    if (all(lessThan(abs(_2575 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _2582 = _546 + _11._m0[_2535]._m9;
                        vec3 _2586 = _2582 * inversesqrt(spvNMax(dot(_2582, _2582), 1.0000000133514319600180897396058e-10));
                        float _2588 = clamp(dot(_11._m0[_2535]._m9, _2586), 0.0, 1.0);
                        float _2590 = clamp(dot(_494, _2586), 0.0, 1.0);
                        float _2592 = clamp(dot(_494, _11._m0[_2535]._m9), 0.0, 1.0);
                        int _2593 = int(_11._m0[_2535]._m4 >> 24u);
                        float _2594 = _2575.z;
                        vec3 _2633;
                        if (_2594 < _11._m0[_2535]._m2.x)
                        {
                            float _2621 = _2594 * _11._m0[_2535]._m2.z;
                            float _2624 = _2621 * _2621;
                            vec3 _2632;
                            _2632.z = dot(_316[_2593], vec4(_2621, _2624, smoothstep(0.0, 1.0, _2621), (_2624 * _2621) * fma(_2621, fma(_2621, 6.0, -15.0), 10.0)));
                            _2633 = _2632;
                        }
                        else
                        {
                            vec3 _2619;
                            if (_2594 > _11._m0[_2535]._m2.y)
                            {
                                float _2607 = (1.0 - _2594) * _11._m0[_2535]._m2.w;
                                float _2610 = _2607 * _2607;
                                vec3 _2618;
                                _2618.z = dot(_316[_2593], vec4(_2607, _2610, smoothstep(0.0, 1.0, _2607), (_2610 * _2607) * fma(_2607, fma(_2607, 6.0, -15.0), 10.0)));
                                _2619 = _2618;
                            }
                            else
                            {
                                _2619 = vec3(0.0, 0.0, 1.0);
                            }
                            _2633 = _2619;
                        }
                        vec2 _2634 = _2575.xy;
                        vec2 _2638 = (vec2(0.5) - abs(_2634 - vec2(0.5))) * _11._m0[_2535]._m3;
                        float _2639 = _2638.x;
                        vec3 _2656;
                        if (_2639 < 1.0)
                        {
                            float _2647 = _2639 * _2639;
                            vec3 _2655 = _2633;
                            _2655.x = dot(_316[_2593], vec4(_2639, _2647, smoothstep(0.0, 1.0, _2639), (_2647 * _2639) * fma(_2639, fma(_2639, 6.0, -15.0), 10.0)));
                            _2656 = _2655;
                        }
                        else
                        {
                            vec3 _2644 = _2633;
                            _2644.x = 1.0;
                            _2656 = _2644;
                        }
                        float _2657 = _2638.y;
                        vec3 _2674;
                        if (_2657 < 1.0)
                        {
                            float _2665 = _2657 * _2657;
                            vec3 _2673 = _2656;
                            _2673.y = dot(_316[_2593], vec4(_2657, _2665, smoothstep(0.0, 1.0, _2657), (_2665 * _2657) * fma(_2657, fma(_2657, 6.0, -15.0), 10.0)));
                            _2674 = _2673;
                        }
                        else
                        {
                            vec3 _2662 = _2656;
                            _2662.y = 1.0;
                            _2674 = _2662;
                        }
                        float _2680 = _2592 * ((_2674.x * _2674.y) * _2674.z);
                        float _2785;
                        bool _2786;
                        float _2787;
                        if ((_11._m0[_2535]._m8 & 1u) != 0u)
                        {
                            uint _2683 = uint(int(_11._m0[_2535]._m8 >> 2u));
                            float _2779;
                            bool _2780;
                            float _2781;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2592 <= 0.0) && true)
                                {
                                    _2779 = _2519;
                                    _2780 = _2522;
                                    _2781 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2714 = _20._m0[_2683]._m0 * vec4(_544 + (_494 * ((3.5 * float(int(sign(_2592)))) * _20._m0[_2683]._m4)), 1.0);
                                    vec2 _2717 = (_2714.xy * 0.5) + vec2(0.5);
                                    _2717.y = 1.0 - _2717.y;
                                    float _2726 = ((_2714.z - _20._m0[_2683]._m5.y) / _20._m0[_2683]._m5.x) / _20._m0[_2683]._m6;
                                    float _2731 = _2522 ? _2519 : 6.283185482025146484375;
                                    float _2732 = _616 * _2731;
                                    vec2 _2733 = _20._m0[_2683]._m1 + _19._m33;
                                    vec2 _2736 = (_20._m0[_2683]._m1 + vec2(_20._m0[_2683]._m2)) - _19._m33;
                                    float _2738;
                                    _2738 = 0.0;
                                    for (int _2741 = 0; _2741 < 12; )
                                    {
                                        float _2746 = float(uint(_2741));
                                        float _2749 = sqrt(_2746 + 0.5) * 0.288675129413604736328125;
                                        float _2750 = fma(_2746, 2.3999631404876708984375, _2732);
                                        vec2 _2758 = clamp(fma((vec3(cos(_2750), sin(_2750), _2749).xy * _2749) * 2.5, _19._m33, _2717), _2733, _2736);
                                        vec2 _2761 = fract(fma(vec2(1.0) / _19._m33, _2758, vec2(0.5)));
                                        vec4 _2767 = vec4(lessThan(vec4(_2726), textureGather(sampler2D(_21, _12), _2758)));
                                        float _2770 = _2761.x;
                                        _2738 += clamp(mix(mix(_2767.w, _2767.z, _2770), mix(_2767.x, _2767.y, _2770), _2761.y), 0.0, 1.0);
                                        _2741++;
                                        continue;
                                    }
                                    _2779 = _2731;
                                    _2780 = _2522 ? _2522 : true;
                                    _2781 = _2738 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2785 = _2779;
                            _2786 = _2780;
                            _2787 = _2680 * mix(1.0, _2781, spvNMin(_623, _11._m0[_2535]._m5));
                        }
                        else
                        {
                            _2785 = _2519;
                            _2786 = _2522;
                            _2787 = _2680;
                        }
                        vec3 _2820;
                        if (_2564 >= 0)
                        {
                            vec2 _2793 = (subgroupQuadSwapHorizontal(_2634) - _2634) * _553;
                            vec2 _2796 = (subgroupQuadSwapVertical(_2634) - _2634) * _559;
                            vec2 _2800 = mix(_2793, vec2(0.0), bvec2(any(isnan(_2793))));
                            vec2 _2804 = mix(_2796, vec2(0.0), bvec2(any(isnan(_2796))));
                            bvec2 _2813 = bvec2(any(greaterThan(abs(vec4(_2800, _2804)), vec4(0.015625))));
                            int _78 = _2564;
                            _2820 = _11._m0[_2535]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_78], _7)), _2634, mix(_2800, vec2(0.0), _2813), mix(_2804, vec2(0.0), _2813)).xyz;
                        }
                        else
                        {
                            _2820 = _11._m0[_2535]._m0;
                        }
                        vec3 _2953;
                        vec3 _2954;
                        SPIRV_CROSS_BRANCH
                        if ((_11._m0[_2535]._m1 & 1u) != 0u)
                        {
                            vec3 _2951;
                            vec3 _2952;
                            if (_2592 > 0.0)
                            {
                                vec3 _2892 = _2820 * (_2787 * _6._m0[0u]);
                                vec3 _2899 = vec3(fma((2.0 * _2588) * _2588, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                float _2920 = (_575 + 1.0) * 0.5;
                                float _2921 = _575 * _575;
                                float _2929 = _2920 * _2920;
                                float _2941 = _2921 * _2921;
                                float _2944 = fma(fma(_2590, _2941, -_2590), _2590, 1.0);
                                _2951 = fma(_2892, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _2588), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2592, sqrt(fma(fma(-_1935, _2929, _1935), _1935, _2929)), _1935 * sqrt(fma(fma(-_2592, _2929, _2592), _2592, _2929)))) * (_2941 * (0.3183098733425140380859375 / (_2944 * _2944)))), _2524);
                                _2952 = fma(_2892, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2899 * pow(spvNMax(abs(1.0 - _2592), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2899 * pow(spvNMax(abs(1.0 - _1935), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _2526);
                            }
                            else
                            {
                                _2951 = _2524;
                                _2952 = _2526;
                            }
                            _2953 = _2951;
                            _2954 = _2952;
                        }
                        else
                        {
                            vec3 _2886;
                            vec3 _2887;
                            if (_2592 > 0.0)
                            {
                                vec3 _2827 = _2820 * _2787;
                                vec3 _2834 = vec3(fma((2.0 * _2588) * _2588, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                float _2855 = (_575 + 1.0) * 0.5;
                                float _2856 = _575 * _575;
                                float _2864 = _2855 * _2855;
                                float _2876 = _2856 * _2856;
                                float _2879 = fma(fma(_2590, _2876, -_2590), _2590, 1.0);
                                _2886 = fma(_2827, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _2588), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2592, sqrt(fma(fma(-_1935, _2864, _1935), _1935, _2864)), _1935 * sqrt(fma(fma(-_2592, _2864, _2592), _2592, _2864)))) * (_2876 * (0.3183098733425140380859375 / (_2879 * _2879)))), _2524);
                                _2887 = fma(_2827, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2834 * pow(spvNMax(abs(1.0 - _2592), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2834 * pow(spvNMax(abs(1.0 - _1935), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _2526);
                            }
                            else
                            {
                                _2886 = _2524;
                                _2887 = _2526;
                            }
                            _2953 = _2886;
                            _2954 = _2887;
                        }
                        _2955 = _2785;
                        _2956 = _2786;
                        _2957 = _2953;
                        _2958 = _2954;
                    }
                    else
                    {
                        _2955 = _2519;
                        _2956 = _2522;
                        _2957 = _2524;
                        _2958 = _2526;
                    }
                    _2520 = _2955;
                    _2523 = _2956;
                    _2525 = _2957;
                    _2527 = _2958;
                }
                else
                {
                    _2520 = _2519;
                    _2523 = _2522;
                    _2525 = _2524;
                    _2527 = _2526;
                }
            }
            _2959 = _2524;
            _2960 = _2526;
        }
        else
        {
            vec3 _1916;
            vec3 _1917;
            if (_504)
            {
                uvec4 _634 = uvec4(_8._m0[uint(_607)]);
                uint _635 = _634.x;
                uint _636 = _634.y;
                uint _639 = ((_636 >> 0u) & 4095u) + _635;
                uint _642 = ((_636 >> 12u) & 4095u) + _639;
                uint _646 = ((_634.z >> 0u) & 1023u) + _642;
                float _648 = spvNMax(dot(_494, _546), 9.9999997473787516355514526367188e-06);
                vec3 _650;
                vec3 _653;
                float _655;
                bool _657;
                uint _659;
                _650 = vec3(0.0);
                _653 = vec3(0.0);
                _655 = _305;
                _657 = false;
                _659 = _635;
                vec3 _651;
                vec3 _654;
                float _656;
                bool _658;
                for (; _659 < _639; _650 = _651, _653 = _654, _655 = _656, _657 = _658, _659++)
                {
                    uint _666 = uint(_9._m0[_659]);
                    float _684 = abs(_10._m0[_666]._m5);
                    if ((_10._m0[_666]._m6 & (1u << (_484 & 31u))) != 0u)
                    {
                        vec3 _699 = _10._m0[_666]._m0.xyz - _544;
                        float _700 = dot(_699, _699);
                        vec3 _703 = _699 * inversesqrt(spvNMax(_700, 1.0000000133514319600180897396058e-10));
                        float _704 = _10._m0[_666]._m0.w * _10._m0[_666]._m0.w;
                        vec3 _1046;
                        vec3 _1047;
                        float _1048;
                        bool _1049;
                        if (_700 < (1.0 / _704))
                        {
                            vec3 _709 = _546 + _703;
                            vec3 _713 = _709 * inversesqrt(spvNMax(dot(_709, _709), 1.0000000133514319600180897396058e-10));
                            float _715 = clamp(dot(_703, _713), 0.0, 1.0);
                            float _717 = clamp(dot(_494, _713), 0.0, 1.0);
                            float _719 = clamp(dot(_494, _703), 0.0, 1.0);
                            float _720 = _700 * _704;
                            float _726 = pow(spvNMax(abs(clamp(fma(-_720, _720, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_666]._m4);
                            float _736;
                            if (_10._m0[_666]._m5 < 0.0)
                            {
                                _736 = _726 * fma(4.0, _704, _684);
                            }
                            else
                            {
                                _736 = _726 * ((1.0 / spvNMax(_700, 9.9999997473787516355514526367188e-05)) + _684);
                            }
                            float _738 = 0.079577468335628509521484375 * (_719 * _736);
                            float _873;
                            bool _874;
                            float _875;
                            if ((_10._m0[_666]._m7 & 1u) != 0u)
                            {
                                uint _763;
                                do
                                {
                                    vec3 _743 = -_703;
                                    float _744 = dot(_743, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                    float _745 = dot(_743, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                    float _746 = dot(_743, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                    float _750 = spvNMax(spvNMax(_744, _745), spvNMax(_746, dot(_743, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                    if (_750 == _744)
                                    {
                                        _763 = 0u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_750 == _745)
                                        {
                                            _763 = 1u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_750 == _746)
                                            {
                                                _763 = 2u;
                                                break;
                                            }
                                            else
                                            {
                                                _763 = 3u;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                uint _765 = uint(int(_10._m0[_666]._m7 >> 2u)) + _763;
                                float _867;
                                bool _868;
                                float _869;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_719 <= 0.0) && true)
                                    {
                                        _867 = _655;
                                        _868 = _657;
                                        _869 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _798 = _20._m0[_765]._m0 * vec4(_544 + (_494 * ((3.5 * float(int(sign(_719)))) * (_20._m0[_765]._m4 * sqrt(_700)))), 1.0);
                                        vec3 _802 = _798.xyz / vec3(_798.w);
                                        vec2 _805 = (_802.xy * 0.5) + vec2(0.5);
                                        _805.y = 1.0 - _805.y;
                                        float _814 = (_20._m0[_765]._m5.y / _20._m0[_765]._m6) / (_802.z - _20._m0[_765]._m5.x);
                                        float _819 = _657 ? _655 : 6.283185482025146484375;
                                        float _820 = _616 * _819;
                                        vec2 _821 = _20._m0[_765]._m1 + _19._m33;
                                        vec2 _824 = (_20._m0[_765]._m1 + vec2(_20._m0[_765]._m2)) - _19._m33;
                                        float _826;
                                        _826 = 0.0;
                                        for (int _829 = 0; _829 < 12; )
                                        {
                                            float _834 = float(uint(_829));
                                            float _837 = sqrt(_834 + 0.5) * 0.288675129413604736328125;
                                            float _838 = fma(_834, 2.3999631404876708984375, _820);
                                            vec2 _846 = clamp(fma((vec3(cos(_838), sin(_838), _837).xy * _837) * 2.5, _19._m33, _805), _821, _824);
                                            vec2 _849 = fract(fma(vec2(1.0) / _19._m33, _846, vec2(0.5)));
                                            vec4 _855 = vec4(lessThan(vec4(_814), textureGather(sampler2D(_21, _12), _846)));
                                            float _858 = _849.x;
                                            _826 += clamp(mix(mix(_855.w, _855.z, _858), mix(_855.x, _855.y, _858), _849.y), 0.0, 1.0);
                                            _829++;
                                            continue;
                                        }
                                        _867 = _819;
                                        _868 = _657 ? _657 : true;
                                        _869 = _826 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _873 = _867;
                                _874 = _868;
                                _875 = _738 * mix(1.0, _869, spvNMin(_623, _10._m0[_666]._m8));
                            }
                            else
                            {
                                _873 = _655;
                                _874 = _657;
                                _875 = _738;
                            }
                            vec3 _1044;
                            vec3 _1045;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_666]._m3 < 0.0)
                            {
                                float _961 = dot(_713, _543);
                                vec3 _1042;
                                vec3 _1043;
                                if (_719 > 0.0)
                                {
                                    vec3 _966 = _10._m0[_666]._m1.xyz * (_875 * _6._m0[0u]);
                                    vec3 _973 = vec3(fma((2.0 * _715) * _715, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                    float _994 = (_575 + 1.0) * 0.5;
                                    float _995 = _575 * _575;
                                    float _1003 = _994 * _994;
                                    float _1017 = sqrt(fma(-_542, 0.89999997615814208984375, 1.0));
                                    float _1020 = spvNMax(0.001000000047497451305389404296875, clamp(_995 / _1017, 0.0, 1.0));
                                    float _1022 = spvNMax(0.001000000047497451305389404296875, _995 * _1017);
                                    float _1033 = fma(_717, _717, ((_961 * _961) / (_1020 * _1020)) + (fma(-_717, _717, fma(-_961, _961, 1.0)) / (_1022 * _1022)));
                                    _1042 = fma(_966, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _715), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_719, sqrt(fma(fma(-_648, _1003, _648), _648, _1003)), _648 * sqrt(fma(fma(-_719, _1003, _719), _719, _1003)))) * (1.0 / ((((_1020 * _1022) * 3.1415927410125732421875) * _1033) * _1033))), _650);
                                    _1043 = fma(_966, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_973 * pow(spvNMax(abs(1.0 - _719), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_973 * pow(spvNMax(abs(1.0 - _648), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _653);
                                }
                                else
                                {
                                    _1042 = _650;
                                    _1043 = _653;
                                }
                                _1044 = _1042;
                                _1045 = _1043;
                            }
                            else
                            {
                                float _879 = dot(_713, _543);
                                vec3 _959;
                                vec3 _960;
                                if (_719 > 0.0)
                                {
                                    vec3 _883 = _10._m0[_666]._m1.xyz * _875;
                                    vec3 _890 = vec3(fma((2.0 * _715) * _715, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                    float _911 = (_575 + 1.0) * 0.5;
                                    float _912 = _575 * _575;
                                    float _920 = _911 * _911;
                                    float _934 = sqrt(fma(-_542, 0.89999997615814208984375, 1.0));
                                    float _937 = spvNMax(0.001000000047497451305389404296875, clamp(_912 / _934, 0.0, 1.0));
                                    float _939 = spvNMax(0.001000000047497451305389404296875, _912 * _934);
                                    float _950 = fma(_717, _717, ((_879 * _879) / (_937 * _937)) + (fma(-_717, _717, fma(-_879, _879, 1.0)) / (_939 * _939)));
                                    _959 = fma(_883, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _715), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_719, sqrt(fma(fma(-_648, _920, _648), _648, _920)), _648 * sqrt(fma(fma(-_719, _920, _719), _719, _920)))) * (1.0 / ((((_937 * _939) * 3.1415927410125732421875) * _950) * _950))), _650);
                                    _960 = fma(_883, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_890 * pow(spvNMax(abs(1.0 - _719), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_890 * pow(spvNMax(abs(1.0 - _648), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _653);
                                }
                                else
                                {
                                    _959 = _650;
                                    _960 = _653;
                                }
                                _1044 = _959;
                                _1045 = _960;
                            }
                            _1046 = _1044;
                            _1047 = _1045;
                            _1048 = _873;
                            _1049 = _874;
                        }
                        else
                        {
                            _1046 = _650;
                            _1047 = _653;
                            _1048 = _655;
                            _1049 = _657;
                        }
                        _651 = _1046;
                        _654 = _1047;
                        _656 = _1048;
                        _658 = _1049;
                    }
                    else
                    {
                        _651 = _650;
                        _654 = _653;
                        _656 = _655;
                        _658 = _657;
                    }
                }
                vec3 _1051;
                vec3 _1054;
                float _1056;
                bool _1058;
                uint _1060;
                _1051 = _650;
                _1054 = _653;
                _1056 = _655;
                _1058 = _657;
                _1060 = _659;
                vec3 _1052;
                vec3 _1055;
                float _1057;
                bool _1059;
                for (; _1060 < _642; _1051 = _1052, _1054 = _1055, _1056 = _1057, _1058 = _1059, _1060++)
                {
                    uint _1067 = uint(_9._m0[_1060]);
                    float _1080 = abs(_10._m0[_1067]._m5);
                    if ((_10._m0[_1067]._m6 & (1u << (_484 & 31u))) != 0u)
                    {
                        vec3 _1098 = _10._m0[_1067]._m0.xyz - _544;
                        float _1099 = dot(_1098, _1098);
                        vec3 _1102 = _1098 * inversesqrt(spvNMax(_1099, 1.0000000133514319600180897396058e-10));
                        float _1103 = _10._m0[_1067]._m0.w * _10._m0[_1067]._m0.w;
                        vec3 _1435;
                        vec3 _1436;
                        float _1437;
                        bool _1438;
                        if (_1099 < (1.0 / _1103))
                        {
                            vec3 _1108 = _546 + _1102;
                            vec3 _1112 = _1108 * inversesqrt(spvNMax(dot(_1108, _1108), 1.0000000133514319600180897396058e-10));
                            float _1114 = clamp(dot(_1102, _1112), 0.0, 1.0);
                            float _1116 = clamp(dot(_494, _1112), 0.0, 1.0);
                            float _1118 = clamp(dot(_494, _1102), 0.0, 1.0);
                            float _1121 = dot(-_1102, normalize(_10._m0[_1067]._m2.xyz));
                            float _1150;
                            if (_1121 > _10._m0[_1067]._m1.w)
                            {
                                float _1125 = _1099 * _1103;
                                float _1131 = pow(spvNMax(abs(clamp(fma(-_1125, _1125, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1067]._m4);
                                float _1141;
                                if (_10._m0[_1067]._m5 < 0.0)
                                {
                                    _1141 = _1131 * fma(4.0, _1103, _1080);
                                }
                                else
                                {
                                    _1141 = _1131 * ((1.0 / spvNMax(_1099, 9.9999997473787516355514526367188e-05)) + _1080);
                                }
                                float _1146 = clamp((_1121 - _10._m0[_1067]._m1.w) / spvNMax(_10._m0[_1067]._m2.w - _10._m0[_1067]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _1150 = _1118 * (_1141 * (_1146 * _1146));
                            }
                            else
                            {
                                _1150 = 0.0;
                            }
                            float _1151 = 0.3183098733425140380859375 * _1150;
                            float _1262;
                            bool _1263;
                            float _1264;
                            if ((_10._m0[_1067]._m7 & 1u) != 0u)
                            {
                                uint _1154 = uint(int(_10._m0[_1067]._m7 >> 2u));
                                float _1256;
                                bool _1257;
                                float _1258;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1118 <= 0.0) && true)
                                    {
                                        _1256 = _1056;
                                        _1257 = _1058;
                                        _1258 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1187 = _20._m0[_1154]._m0 * vec4(_544 + (_494 * ((3.5 * float(int(sign(_1118)))) * (_20._m0[_1154]._m4 * sqrt(_1099)))), 1.0);
                                        vec3 _1191 = _1187.xyz / vec3(_1187.w);
                                        vec2 _1194 = (_1191.xy * 0.5) + vec2(0.5);
                                        _1194.y = 1.0 - _1194.y;
                                        float _1203 = (_20._m0[_1154]._m5.y / _20._m0[_1154]._m6) / (_1191.z - _20._m0[_1154]._m5.x);
                                        float _1208 = _1058 ? _1056 : 6.283185482025146484375;
                                        float _1209 = _616 * _1208;
                                        vec2 _1210 = _20._m0[_1154]._m1 + _19._m33;
                                        vec2 _1213 = (_20._m0[_1154]._m1 + vec2(_20._m0[_1154]._m2)) - _19._m33;
                                        float _1215;
                                        _1215 = 0.0;
                                        for (int _1218 = 0; _1218 < 12; )
                                        {
                                            float _1223 = float(uint(_1218));
                                            float _1226 = sqrt(_1223 + 0.5) * 0.288675129413604736328125;
                                            float _1227 = fma(_1223, 2.3999631404876708984375, _1209);
                                            vec2 _1235 = clamp(fma((vec3(cos(_1227), sin(_1227), _1226).xy * _1226) * 2.5, _19._m33, _1194), _1210, _1213);
                                            vec2 _1238 = fract(fma(vec2(1.0) / _19._m33, _1235, vec2(0.5)));
                                            vec4 _1244 = vec4(lessThan(vec4(_1203), textureGather(sampler2D(_21, _12), _1235)));
                                            float _1247 = _1238.x;
                                            _1215 += clamp(mix(mix(_1244.w, _1244.z, _1247), mix(_1244.x, _1244.y, _1247), _1238.y), 0.0, 1.0);
                                            _1218++;
                                            continue;
                                        }
                                        _1256 = _1208;
                                        _1257 = _1058 ? _1058 : true;
                                        _1258 = _1215 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _1262 = _1256;
                                _1263 = _1257;
                                _1264 = _1151 * mix(1.0, _1258, spvNMin(_623, _10._m0[_1067]._m8));
                            }
                            else
                            {
                                _1262 = _1056;
                                _1263 = _1058;
                                _1264 = _1151;
                            }
                            vec3 _1433;
                            vec3 _1434;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_1067]._m3 < 0.0)
                            {
                                float _1350 = dot(_1112, _543);
                                vec3 _1431;
                                vec3 _1432;
                                if (_1118 > 0.0)
                                {
                                    vec3 _1355 = _10._m0[_1067]._m1.xyz * (_1264 * _6._m0[0u]);
                                    vec3 _1362 = vec3(fma((2.0 * _1114) * _1114, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                    float _1383 = (_575 + 1.0) * 0.5;
                                    float _1384 = _575 * _575;
                                    float _1392 = _1383 * _1383;
                                    float _1406 = sqrt(fma(-_542, 0.89999997615814208984375, 1.0));
                                    float _1409 = spvNMax(0.001000000047497451305389404296875, clamp(_1384 / _1406, 0.0, 1.0));
                                    float _1411 = spvNMax(0.001000000047497451305389404296875, _1384 * _1406);
                                    float _1422 = fma(_1116, _1116, ((_1350 * _1350) / (_1409 * _1409)) + (fma(-_1116, _1116, fma(-_1350, _1350, 1.0)) / (_1411 * _1411)));
                                    _1431 = fma(_1355, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _1114), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1118, sqrt(fma(fma(-_648, _1392, _648), _648, _1392)), _648 * sqrt(fma(fma(-_1118, _1392, _1118), _1118, _1392)))) * (1.0 / ((((_1409 * _1411) * 3.1415927410125732421875) * _1422) * _1422))), _1051);
                                    _1432 = fma(_1355, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1362 * pow(spvNMax(abs(1.0 - _1118), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1362 * pow(spvNMax(abs(1.0 - _648), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _1054);
                                }
                                else
                                {
                                    _1431 = _1051;
                                    _1432 = _1054;
                                }
                                _1433 = _1431;
                                _1434 = _1432;
                            }
                            else
                            {
                                float _1268 = dot(_1112, _543);
                                vec3 _1348;
                                vec3 _1349;
                                if (_1118 > 0.0)
                                {
                                    vec3 _1272 = _10._m0[_1067]._m1.xyz * _1264;
                                    vec3 _1279 = vec3(fma((2.0 * _1114) * _1114, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                    float _1300 = (_575 + 1.0) * 0.5;
                                    float _1301 = _575 * _575;
                                    float _1309 = _1300 * _1300;
                                    float _1323 = sqrt(fma(-_542, 0.89999997615814208984375, 1.0));
                                    float _1326 = spvNMax(0.001000000047497451305389404296875, clamp(_1301 / _1323, 0.0, 1.0));
                                    float _1328 = spvNMax(0.001000000047497451305389404296875, _1301 * _1323);
                                    float _1339 = fma(_1116, _1116, ((_1268 * _1268) / (_1326 * _1326)) + (fma(-_1116, _1116, fma(-_1268, _1268, 1.0)) / (_1328 * _1328)));
                                    _1348 = fma(_1272, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _1114), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1118, sqrt(fma(fma(-_648, _1309, _648), _648, _1309)), _648 * sqrt(fma(fma(-_1118, _1309, _1118), _1118, _1309)))) * (1.0 / ((((_1326 * _1328) * 3.1415927410125732421875) * _1339) * _1339))), _1051);
                                    _1349 = fma(_1272, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1279 * pow(spvNMax(abs(1.0 - _1118), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1279 * pow(spvNMax(abs(1.0 - _648), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _1054);
                                }
                                else
                                {
                                    _1348 = _1051;
                                    _1349 = _1054;
                                }
                                _1433 = _1348;
                                _1434 = _1349;
                            }
                            _1435 = _1433;
                            _1436 = _1434;
                            _1437 = _1262;
                            _1438 = _1263;
                        }
                        else
                        {
                            _1435 = _1051;
                            _1436 = _1054;
                            _1437 = _1056;
                            _1438 = _1058;
                        }
                        _1052 = _1435;
                        _1055 = _1436;
                        _1057 = _1437;
                        _1059 = _1438;
                    }
                    else
                    {
                        _1052 = _1051;
                        _1055 = _1054;
                        _1057 = _1056;
                        _1059 = _1058;
                    }
                }
                vec3 _1440;
                vec3 _1443;
                _1440 = _1051;
                _1443 = _1054;
                vec3 _1441;
                vec3 _1444;
                float _1446;
                bool _1448;
                float _1445 = _1056;
                bool _1447 = _1058;
                uint _1449 = _1060;
                for (; _1449 < _646; _1440 = _1441, _1443 = _1444, _1445 = _1446, _1447 = _1448, _1449++)
                {
                    uint _1456 = uint(_9._m0[_1449]);
                    int _1485 = int(_11._m0[_1456]._m1 >> 1u) - 1;
                    if (((_11._m0[_1456]._m4 & 16777215u) & (1u << (_484 & 31u))) != 0u)
                    {
                        vec3 _1496 = _11._m0[_1456]._m6 * vec4(_544, 1.0);
                        vec3 _1912;
                        vec3 _1913;
                        float _1914;
                        bool _1915;
                        if (all(lessThan(abs(_1496 - vec3(0.5)), vec3(0.5))))
                        {
                            vec3 _1503 = _546 + _11._m0[_1456]._m9;
                            vec3 _1507 = _1503 * inversesqrt(spvNMax(dot(_1503, _1503), 1.0000000133514319600180897396058e-10));
                            float _1509 = clamp(dot(_11._m0[_1456]._m9, _1507), 0.0, 1.0);
                            float _1511 = clamp(dot(_494, _1507), 0.0, 1.0);
                            float _1513 = clamp(dot(_494, _11._m0[_1456]._m9), 0.0, 1.0);
                            int _1514 = int(_11._m0[_1456]._m4 >> 24u);
                            float _1515 = _1496.z;
                            vec3 _1554;
                            if (_1515 < _11._m0[_1456]._m2.x)
                            {
                                float _1542 = _1515 * _11._m0[_1456]._m2.z;
                                float _1545 = _1542 * _1542;
                                vec3 _1553;
                                _1553.z = dot(_316[_1514], vec4(_1542, _1545, smoothstep(0.0, 1.0, _1542), (_1545 * _1542) * fma(_1542, fma(_1542, 6.0, -15.0), 10.0)));
                                _1554 = _1553;
                            }
                            else
                            {
                                vec3 _1540;
                                if (_1515 > _11._m0[_1456]._m2.y)
                                {
                                    float _1528 = (1.0 - _1515) * _11._m0[_1456]._m2.w;
                                    float _1531 = _1528 * _1528;
                                    vec3 _1539;
                                    _1539.z = dot(_316[_1514], vec4(_1528, _1531, smoothstep(0.0, 1.0, _1528), (_1531 * _1528) * fma(_1528, fma(_1528, 6.0, -15.0), 10.0)));
                                    _1540 = _1539;
                                }
                                else
                                {
                                    _1540 = vec3(0.0, 0.0, 1.0);
                                }
                                _1554 = _1540;
                            }
                            vec2 _1555 = _1496.xy;
                            vec2 _1559 = (vec2(0.5) - abs(_1555 - vec2(0.5))) * _11._m0[_1456]._m3;
                            float _1560 = _1559.x;
                            vec3 _1577;
                            if (_1560 < 1.0)
                            {
                                float _1568 = _1560 * _1560;
                                vec3 _1576 = _1554;
                                _1576.x = dot(_316[_1514], vec4(_1560, _1568, smoothstep(0.0, 1.0, _1560), (_1568 * _1560) * fma(_1560, fma(_1560, 6.0, -15.0), 10.0)));
                                _1577 = _1576;
                            }
                            else
                            {
                                vec3 _1565 = _1554;
                                _1565.x = 1.0;
                                _1577 = _1565;
                            }
                            float _1578 = _1559.y;
                            vec3 _1595;
                            if (_1578 < 1.0)
                            {
                                float _1586 = _1578 * _1578;
                                vec3 _1594 = _1577;
                                _1594.y = dot(_316[_1514], vec4(_1578, _1586, smoothstep(0.0, 1.0, _1578), (_1586 * _1578) * fma(_1578, fma(_1578, 6.0, -15.0), 10.0)));
                                _1595 = _1594;
                            }
                            else
                            {
                                vec3 _1583 = _1577;
                                _1583.y = 1.0;
                                _1595 = _1583;
                            }
                            float _1601 = _1513 * ((_1595.x * _1595.y) * _1595.z);
                            float _1706;
                            bool _1707;
                            float _1708;
                            if ((_11._m0[_1456]._m8 & 1u) != 0u)
                            {
                                uint _1604 = uint(int(_11._m0[_1456]._m8 >> 2u));
                                float _1700;
                                bool _1701;
                                float _1702;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1513 <= 0.0) && true)
                                    {
                                        _1700 = _1445;
                                        _1701 = _1447;
                                        _1702 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1635 = _20._m0[_1604]._m0 * vec4(_544 + (_494 * ((3.5 * float(int(sign(_1513)))) * _20._m0[_1604]._m4)), 1.0);
                                        vec2 _1638 = (_1635.xy * 0.5) + vec2(0.5);
                                        _1638.y = 1.0 - _1638.y;
                                        float _1647 = ((_1635.z - _20._m0[_1604]._m5.y) / _20._m0[_1604]._m5.x) / _20._m0[_1604]._m6;
                                        float _1652 = _1447 ? _1445 : 6.283185482025146484375;
                                        float _1653 = _616 * _1652;
                                        vec2 _1654 = _20._m0[_1604]._m1 + _19._m33;
                                        vec2 _1657 = (_20._m0[_1604]._m1 + vec2(_20._m0[_1604]._m2)) - _19._m33;
                                        float _1659;
                                        _1659 = 0.0;
                                        for (int _1662 = 0; _1662 < 12; )
                                        {
                                            float _1667 = float(uint(_1662));
                                            float _1670 = sqrt(_1667 + 0.5) * 0.288675129413604736328125;
                                            float _1671 = fma(_1667, 2.3999631404876708984375, _1653);
                                            vec2 _1679 = clamp(fma((vec3(cos(_1671), sin(_1671), _1670).xy * _1670) * 2.5, _19._m33, _1638), _1654, _1657);
                                            vec2 _1682 = fract(fma(vec2(1.0) / _19._m33, _1679, vec2(0.5)));
                                            vec4 _1688 = vec4(lessThan(vec4(_1647), textureGather(sampler2D(_21, _12), _1679)));
                                            float _1691 = _1682.x;
                                            _1659 += clamp(mix(mix(_1688.w, _1688.z, _1691), mix(_1688.x, _1688.y, _1691), _1682.y), 0.0, 1.0);
                                            _1662++;
                                            continue;
                                        }
                                        _1700 = _1652;
                                        _1701 = _1447 ? _1447 : true;
                                        _1702 = _1659 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _1706 = _1700;
                                _1707 = _1701;
                                _1708 = _1601 * mix(1.0, _1702, spvNMin(_623, _11._m0[_1456]._m5));
                            }
                            else
                            {
                                _1706 = _1445;
                                _1707 = _1447;
                                _1708 = _1601;
                            }
                            vec3 _1741;
                            if (_1485 >= 0)
                            {
                                vec2 _1714 = (subgroupQuadSwapHorizontal(_1555) - _1555) * _553;
                                vec2 _1717 = (subgroupQuadSwapVertical(_1555) - _1555) * _559;
                                vec2 _1721 = mix(_1714, vec2(0.0), bvec2(any(isnan(_1714))));
                                vec2 _1725 = mix(_1717, vec2(0.0), bvec2(any(isnan(_1717))));
                                bvec2 _1734 = bvec2(any(greaterThan(abs(vec4(_1721, _1725)), vec4(0.015625))));
                                int _74 = _1485;
                                _1741 = _11._m0[_1456]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_74], _7)), _1555, mix(_1721, vec2(0.0), _1734), mix(_1725, vec2(0.0), _1734)).xyz;
                            }
                            else
                            {
                                _1741 = _11._m0[_1456]._m0;
                            }
                            vec3 _1910;
                            vec3 _1911;
                            SPIRV_CROSS_BRANCH
                            if ((_11._m0[_1456]._m1 & 1u) != 0u)
                            {
                                float _1827 = dot(_1507, _543);
                                vec3 _1908;
                                vec3 _1909;
                                if (_1513 > 0.0)
                                {
                                    vec3 _1832 = _1741 * (_1708 * _6._m0[0u]);
                                    vec3 _1839 = vec3(fma((2.0 * _1509) * _1509, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                    float _1860 = (_575 + 1.0) * 0.5;
                                    float _1861 = _575 * _575;
                                    float _1869 = _1860 * _1860;
                                    float _1883 = sqrt(fma(-_542, 0.89999997615814208984375, 1.0));
                                    float _1886 = spvNMax(0.001000000047497451305389404296875, clamp(_1861 / _1883, 0.0, 1.0));
                                    float _1888 = spvNMax(0.001000000047497451305389404296875, _1861 * _1883);
                                    float _1899 = fma(_1511, _1511, ((_1827 * _1827) / (_1886 * _1886)) + (fma(-_1511, _1511, fma(-_1827, _1827, 1.0)) / (_1888 * _1888)));
                                    _1908 = fma(_1832, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _1509), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1513, sqrt(fma(fma(-_648, _1869, _648), _648, _1869)), _648 * sqrt(fma(fma(-_1513, _1869, _1513), _1513, _1869)))) * (1.0 / ((((_1886 * _1888) * 3.1415927410125732421875) * _1899) * _1899))), _1440);
                                    _1909 = fma(_1832, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1839 * pow(spvNMax(abs(1.0 - _1513), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1839 * pow(spvNMax(abs(1.0 - _648), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _1443);
                                }
                                else
                                {
                                    _1908 = _1440;
                                    _1909 = _1443;
                                }
                                _1910 = _1908;
                                _1911 = _1909;
                            }
                            else
                            {
                                float _1745 = dot(_1507, _543);
                                vec3 _1825;
                                vec3 _1826;
                                if (_1513 > 0.0)
                                {
                                    vec3 _1749 = _1741 * _1708;
                                    vec3 _1756 = vec3(fma((2.0 * _1509) * _1509, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                                    float _1777 = (_575 + 1.0) * 0.5;
                                    float _1778 = _575 * _575;
                                    float _1786 = _1777 * _1777;
                                    float _1800 = sqrt(fma(-_542, 0.89999997615814208984375, 1.0));
                                    float _1803 = spvNMax(0.001000000047497451305389404296875, clamp(_1778 / _1800, 0.0, 1.0));
                                    float _1805 = spvNMax(0.001000000047497451305389404296875, _1778 * _1800);
                                    float _1816 = fma(_1511, _1511, ((_1745 * _1745) / (_1803 * _1803)) + (fma(-_1511, _1511, fma(-_1745, _1745, 1.0)) / (_1805 * _1805)));
                                    _1825 = fma(_1749, (_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - _1509), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1513, sqrt(fma(fma(-_648, _1786, _648), _648, _1786)), _648 * sqrt(fma(fma(-_1513, _1786, _1513), _1513, _1786)))) * (1.0 / ((((_1803 * _1805) * 3.1415927410125732421875) * _1816) * _1816))), _1440);
                                    _1826 = fma(_1749, _497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1756 * pow(spvNMax(abs(1.0 - _1513), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1756 * pow(spvNMax(abs(1.0 - _648), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))), _1443);
                                }
                                else
                                {
                                    _1825 = _1440;
                                    _1826 = _1443;
                                }
                                _1910 = _1825;
                                _1911 = _1826;
                            }
                            _1912 = _1910;
                            _1913 = _1911;
                            _1914 = _1706;
                            _1915 = _1707;
                        }
                        else
                        {
                            _1912 = _1440;
                            _1913 = _1443;
                            _1914 = _1445;
                            _1915 = _1447;
                        }
                        _1441 = _1912;
                        _1444 = _1913;
                        _1446 = _1914;
                        _1448 = _1915;
                    }
                    else
                    {
                        _1441 = _1440;
                        _1444 = _1443;
                        _1446 = _1445;
                        _1448 = _1447;
                    }
                }
                _1916 = _1440;
                _1917 = _1443;
            }
            else
            {
                _1916 = vec3(0.0);
                _1917 = vec3(0.0);
            }
            _2959 = _1916;
            _2960 = _1917;
        }
        vec3 _2962 = reflect(-_546, _494);
        vec3 _2964 = vec3(_502.x, _502.y, _502.z);
        vec3 _2974 = textureLod(samplerCube(_14, _7), _494, 0.0).xyz * _19._m27;
        vec3 _2981 = textureLod(samplerCube(_15, _7), _2962, fma(_575, 8.0, _19._m30 - 8.0)).xyz * _19._m27;
        vec3 _3006;
        vec3 _3007;
        SPIRV_CROSS_BRANCH
        if (_19._m29 > 0.0)
        {
            vec3 _2996 = vec3(_19._m29);
            _3006 = mix(_2981, textureLod(samplerCube(_17, _7), _2962, fma(_575, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _2996);
            _3007 = mix(_2974, textureLod(samplerCube(_16, _7), _494, 0.0).xyz * _19._m28, _2996);
        }
        else
        {
            _3006 = _2981;
            _3007 = _2974;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_3007, _575);
            _3006 *= rdx_mod;
            _3007 *= rdx_mod;
        }
        float _3008 = spvNMax(dot(_546, _494), 0.001953125);
        vec4 _3013 = textureLod(sampler2D(_18, _12), vec2(_3008, _575), 0.0);
        uvec4 _3026 = uvec4(_8._m0[uint(_607)]);
        uint _3028 = _3026.y;
        uint _3038 = ((_3026.z >> 0u) & 1023u) + (((_3028 >> 12u) & 4095u) + (((_3028 >> 0u) & 4095u) + _3026.x));
        uint _3040 = (_3028 >> 24u) + _3038;
        vec3 _3042;
        vec3 _3045;
        _3042 = _3006 * ((_2964 * _3013.x) + vec3(_3013.y));
        _3045 = _3007 * (_497 * _3013.z);
        vec3 _3043;
        vec3 _3046;
        for (uint _3047 = _3038; _3047 < _3040; _3042 = _3043, _3045 = _3046, _3047++)
        {
            uint _3054 = uint(_9._m0[_3047]);
            int _3073 = int((_13._m0[_3054]._m5 >> 1u) & 3u);
            mat3 _3077 = mat3(_13._m0[_3054]._m1[0], _13._m0[_3054]._m1[1], _13._m0[_3054]._m1[2]);
            int _3083 = (int((_13._m0[_3054]._m5 >> 3u) & 16383u) - 1) * 2;
            int _3088 = (int((_13._m0[_3054]._m5 >> 17u) & 16383u) - 1) * 2;
            int _3093 = (int((_13._m0[_3054]._m6 >> 0u) & 65535u) - 1) * 2;
            int _3098 = (int((_13._m0[_3054]._m6 >> 16u) & 65535u) - 1) * 2;
            float _3101 = (_13._m0[_3054]._m3 < 0.0) ? (-_13._m0[_3054]._m3) : 1.0;
            vec3 _3103 = _3077 * (_544 - _13._m0[_3054]._m1[3]);
            bool _3104 = int(_13._m0[_3054]._m5 & 1u) == 1;
            vec3 _3105 = abs(_3103);
            float _3108 = dot(_3103, _3103);
            if (_3104 ? any(greaterThanEqual(_3105, _13._m0[_3054]._m0.xyz)) : (_3108 >= _13._m0[_3054]._m0.y))
            {
                _3043 = _3042;
                _3046 = _3045;
                continue;
            }
            vec3 _3282;
            SPIRV_CROSS_FLATTEN
            if ((_3073 & 1) != 0)
            {
                vec3 _3118 = _3077 * _494;
                vec2 _3207;
                bool _3208;
                if (_3104)
                {
                    vec2 _3202;
                    bool _3206;
                    do
                    {
                        vec3 _3186 = (_13._m0[_3054]._m0.xyz - _3103) / _3118;
                        vec3 _3189 = ((-_13._m0[_3054]._m0.xyz) - _3103) / _3118;
                        vec3 _3190 = spvNMin(_3186, _3189);
                        vec3 _3191 = spvNMax(_3186, _3189);
                        float _3196 = spvNMax(_3190.x, spvNMax(_3190.y, _3190.z));
                        float _3201 = spvNMin(_3191.x, spvNMin(_3191.y, _3191.z));
                        _3202 = vec2(_3196, _3201);
                        if (_3196 > _3201)
                        {
                            _3206 = false;
                            break;
                        }
                        _3206 = true;
                        break;
                    } while(false);
                    _3207 = _3202;
                    _3208 = _3206;
                }
                else
                {
                    vec2 _3181;
                    bool _3182;
                    do
                    {
                        float _3124 = dot(_3118, _3118);
                        float _3125 = dot(_3118, _3103);
                        float _3126 = 2.0 * _3125;
                        float _3127 = _3108 - _13._m0[_3054]._m0.y;
                        float _3163;
                        float _3164;
                        bool _3165;
                        do
                        {
                            float _3133 = fma(_3126, _3126, -((4.0 * _3124) * _3127));
                            float _3161;
                            float _3162;
                            if (_3133 < 0.0)
                            {
                                _3163 = 0.0;
                                _3164 = 0.0;
                                _3165 = false;
                                break;
                            }
                            else
                            {
                                if (_3133 == 0.0)
                                {
                                    float _3160 = (_3125 * (-1.0)) * (1.0 / _3124);
                                    _3161 = _3160;
                                    _3162 = _3160;
                                }
                                else
                                {
                                    float _3153;
                                    if (_3126 > 0.0)
                                    {
                                        _3153 = (-0.5) * fma(2.0, _3125, sqrt(_3133));
                                    }
                                    else
                                    {
                                        _3153 = (-0.5) * fma(2.0, _3125, -sqrt(_3133));
                                    }
                                    _3161 = _3127 * (1.0 / _3153);
                                    _3162 = _3153 * (1.0 / _3124);
                                }
                            }
                            _3163 = _3161;
                            _3164 = _3162;
                            _3165 = true;
                            break;
                        } while(false);
                        if (!_3165)
                        {
                            _3181 = vec2(0.0);
                            _3182 = false;
                            break;
                        }
                        if ((_3164 < 0.0) && (_3163 < 0.0))
                        {
                            _3181 = vec2(0.0);
                            _3182 = false;
                            break;
                        }
                        vec2 _3180;
                        if (_3164 > _3163)
                        {
                            _3180 = vec2(_3163, _3164);
                        }
                        else
                        {
                            _3180 = vec2(_3164, _3163);
                        }
                        _3181 = _3180;
                        _3182 = true;
                        break;
                    } while(false);
                    _3207 = _3181;
                    _3208 = _3182;
                }
                vec3 _3211 = _3103 + (_3118 * _3207.y);
                float _3232;
                if (_3104)
                {
                    _3232 = 1.0 - clamp(length(spvNMax(_3105 - (_13._m0[_3054]._m0.xyz - vec3(_13._m0[_3054]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_3054]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3232 = clamp((_13._m0[_3054]._m0.x - length(_3103)) * (1.0 / spvNMax(_13._m0[_3054]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3235 = float(_3208) * smoothstep(0.0, 1.0, _3232);
                vec4 _3277;
                SPIRV_CROSS_BRANCH
                if (_3235 > 9.9999997473787516355514526367188e-05)
                {
                    float _3244 = mix(clamp((_3207.y * (1.0 / length(_3211))) * _575, 0.0, _575), _575, _575);
                    vec3 _3246 = mix(_3211, _3118, vec3(_3244));
                    int _82 = _3083;
                    vec4 _3247 = textureLod(nonuniformEXT(samplerCube(_24[_82], _7)), _3246, 0.0);
                    int _86 = _3083 + 1;
                    _3247.w = textureLod(nonuniformEXT(samplerCube(_24[_86], _7)), _3246, 0.0).x;
                    vec4 _3262;
                    SPIRV_CROSS_BRANCH
                    if (_3088 >= 0)
                    {
                        int _90 = _3088;
                        vec4 _3255 = textureLod(nonuniformEXT(samplerCube(_24[_90], _7)), _3246, 0.0);
                        int _94 = _3088 + 1;
                        _3255.w = textureLod(nonuniformEXT(samplerCube(_24[_94], _7)), _3246, 0.0).x;
                        _3262 = mix(_3247, _3255, vec4(_13._m0[_3054]._m3));
                    }
                    else
                    {
                        _3262 = _3247;
                    }
                    vec4 _3263 = _3262 * _3101;
                    vec3 _3272 = (_3263.xyz * _13._m0[_3054]._m4).xyz * (_497 * textureLod(sampler2D(_18, _12), vec2(_3008, _3244), 0.0).z);
                    vec4 _3273 = vec4(_3272.x, _3272.y, _3272.z, _3263.w);
                    _3273.w = _3263.w * _3235;
                    _3277 = _3273;
                }
                else
                {
                    _3277 = vec4(0.0);
                }
                _3282 = mix(_3045, _3277.xyz, vec3(_3277.w));
            }
            else
            {
                _3282 = _3045;
            }
            vec3 _3461;
            SPIRV_CROSS_FLATTEN
            if ((_3073 & 2) != 0)
            {
                vec3 _3287 = _3077 * _2962;
                vec2 _3376;
                bool _3377;
                if (_3104)
                {
                    vec2 _3371;
                    bool _3375;
                    do
                    {
                        vec3 _3355 = (_13._m0[_3054]._m0.xyz - _3103) / _3287;
                        vec3 _3358 = ((-_13._m0[_3054]._m0.xyz) - _3103) / _3287;
                        vec3 _3359 = spvNMin(_3355, _3358);
                        vec3 _3360 = spvNMax(_3355, _3358);
                        float _3365 = spvNMax(_3359.x, spvNMax(_3359.y, _3359.z));
                        float _3370 = spvNMin(_3360.x, spvNMin(_3360.y, _3360.z));
                        _3371 = vec2(_3365, _3370);
                        if (_3365 > _3370)
                        {
                            _3375 = false;
                            break;
                        }
                        _3375 = true;
                        break;
                    } while(false);
                    _3376 = _3371;
                    _3377 = _3375;
                }
                else
                {
                    vec2 _3350;
                    bool _3351;
                    do
                    {
                        float _3293 = dot(_3287, _3287);
                        float _3294 = dot(_3287, _3103);
                        float _3295 = 2.0 * _3294;
                        float _3296 = _3108 - _13._m0[_3054]._m0.y;
                        float _3332;
                        float _3333;
                        bool _3334;
                        do
                        {
                            float _3302 = fma(_3295, _3295, -((4.0 * _3293) * _3296));
                            float _3330;
                            float _3331;
                            if (_3302 < 0.0)
                            {
                                _3332 = 0.0;
                                _3333 = 0.0;
                                _3334 = false;
                                break;
                            }
                            else
                            {
                                if (_3302 == 0.0)
                                {
                                    float _3329 = (_3294 * (-1.0)) * (1.0 / _3293);
                                    _3330 = _3329;
                                    _3331 = _3329;
                                }
                                else
                                {
                                    float _3322;
                                    if (_3295 > 0.0)
                                    {
                                        _3322 = (-0.5) * fma(2.0, _3294, sqrt(_3302));
                                    }
                                    else
                                    {
                                        _3322 = (-0.5) * fma(2.0, _3294, -sqrt(_3302));
                                    }
                                    _3330 = _3296 * (1.0 / _3322);
                                    _3331 = _3322 * (1.0 / _3293);
                                }
                            }
                            _3332 = _3330;
                            _3333 = _3331;
                            _3334 = true;
                            break;
                        } while(false);
                        if (!_3334)
                        {
                            _3350 = vec2(0.0);
                            _3351 = false;
                            break;
                        }
                        if ((_3333 < 0.0) && (_3332 < 0.0))
                        {
                            _3350 = vec2(0.0);
                            _3351 = false;
                            break;
                        }
                        vec2 _3349;
                        if (_3333 > _3332)
                        {
                            _3349 = vec2(_3332, _3333);
                        }
                        else
                        {
                            _3349 = vec2(_3333, _3332);
                        }
                        _3350 = _3349;
                        _3351 = true;
                        break;
                    } while(false);
                    _3376 = _3350;
                    _3377 = _3351;
                }
                vec3 _3380 = _3103 + (_3287 * _3376.y);
                float _3401;
                if (_3104)
                {
                    _3401 = 1.0 - clamp(length(spvNMax(_3105 - (_13._m0[_3054]._m0.xyz - vec3(_13._m0[_3054]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_3054]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3401 = clamp((_13._m0[_3054]._m0.x - length(_3103)) * (1.0 / spvNMax(_13._m0[_3054]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3404 = float(_3377) * smoothstep(0.0, 1.0, _3401);
                vec4 _3456;
                SPIRV_CROSS_BRANCH
                if (_3404 > 9.9999997473787516355514526367188e-05)
                {
                    float _3413 = mix(clamp((_3376.y * (1.0 / length(_3380))) * _575, 0.0, _575), _575, _575);
                    vec3 _3415 = mix(_3380, _3287, vec3(_3413));
                    float _3416 = _3413 * 8.0;
                    int _98 = _3093;
                    int _102 = _3093 + 1;
                    vec4 _3424 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_98], _7)), _3415, _3416).xyz, textureLod(nonuniformEXT(samplerCube(_24[_102], _7)), _3415, _3416).x);
                    vec4 _3438;
                    SPIRV_CROSS_BRANCH
                    if (_3098 >= 0)
                    {
                        int _106 = _3098;
                        int _110 = _3098 + 1;
                        _3438 = mix(_3424, vec4(textureLod(nonuniformEXT(samplerCube(_24[_106], _7)), _3415, _3416).xyz, textureLod(nonuniformEXT(samplerCube(_24[_110], _7)), _3415, _3416).x), vec4(_13._m0[_3054]._m3));
                    }
                    else
                    {
                        _3438 = _3424;
                    }
                    vec4 _3439 = _3438 * _3101;
                    vec4 _3444 = textureLod(sampler2D(_18, _12), vec2(_3008, _3413), 0.0);
                    vec3 _3451 = (_3439.xyz * _13._m0[_3054]._m4).xyz * ((_2964 * _3444.x) + vec3(_3444.y));
                    vec4 _3452 = vec4(_3451.x, _3451.y, _3451.z, _3439.w);
                    _3452.w = _3439.w * _3404;
                    _3456 = _3452;
                }
                else
                {
                    _3456 = vec4(0.0);
                }
                _3461 = mix(_3042, _3456.xyz, vec3(_3456.w));
            }
            else
            {
                _3461 = _3042;
            }
            _3043 = _3461;
            _3046 = _3282;
        }
        float _3462 = _6._m0[0u] * 100.0;
        bool _3467 = _26._m19 > 0.0;
        vec3 _3528;
        SPIRV_CROSS_BRANCH
        if (_3467 && (_26._m35 == 0.0))
        {
            vec3 _3481 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _3482 = length(_3481);
            vec3 _3493;
            float _3494;
            if (_3482 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _3491 = _3481;
                _3491.z = _3481.z + _29._m0;
                _3493 = _3491;
                _3494 = length(_3491);
            }
            else
            {
                _3493 = _3481;
                _3494 = _3482;
            }
            float _3497 = dot(_3493 / vec3(_3494), _26._m36);
            float _3498 = _29._m0 / _3494;
            _3528 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_3497 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_3494 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_3497 < (-sqrt(fma(-_3498, _3498, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _3528 = _26._m2;
        }
        float _3541 = texelFetch(_41, ivec3(int(_610), int(_611), 0).xy, 0).x;
        float _3626;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _3565 = _27._m6 + _544;
            vec3 _3572 = vec3(0.0, _26._m18.z, 0.0) + (_3565 - vec3(0.0, _26._m25, 0.0));
            float _3576 = dot(_3572, _26._m24);
            vec2 _3586 = ((((_3572 + (_26._m24 * (sqrt(fma(_3576, _3576, fma(_26._m18.z, _26._m18.z, -dot(_3572, _3572)))) - _3576))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _3586.x = 1.0 - _3586.x;
            vec3 _3599 = vec3(0.0, _26._m23.z, 0.0) + (_3565 - vec3(0.0, _26._m27, 0.0));
            float _3603 = dot(_3599, _26._m26);
            vec2 _3613 = ((((_3599 + (_26._m26 * (sqrt(fma(_3603, _3603, fma(_26._m23.z, _26._m23.z, -dot(_3599, _3599)))) - _3603))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _3613.x = 1.0 - _3613.x;
            _3626 = _3541 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _3586, 0.0).x, textureLod(sampler2D(_33, _7), _3613, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _3626 = _3541;
        }
        float _3716;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _3654 = _27._m6 + _544;
            vec3 _3662 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _3654) - vec3(0.0, _26._m30, 0.0));
            float _3666 = dot(_3662, _26._m24);
            vec2 _3676 = ((((_3662 + (_26._m24 * (sqrt(fma(_3666, _3666, fma(_26._m28.z, _26._m28.z, -dot(_3662, _3662)))) - _3666))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _3676.x = 1.0 - _3676.x;
            vec3 _3690 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _3654) - vec3(0.0, _26._m33, 0.0));
            float _3694 = dot(_3690, _26._m26);
            vec2 _3704 = ((((_3690 + (_26._m26 * (sqrt(fma(_3694, _3694, fma(_26._m31.z, _26._m31.z, -dot(_3690, _3690)))) - _3694))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _3704.x = 1.0 - _3704.x;
            _3716 = _3626 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _3676, 0.0).x, textureLod(sampler2D(_23, _7), _3704, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _3716 = _3626;
        }
        vec3 _3718 = _3528 * (_3716 * _6._m0[0u]);
        vec3 _3929;
        vec3 _3930;
        SPIRV_CROSS_BRANCH
        if (_624)
        {
            vec3 _3839 = reflect(_546, _494);
            float _3841 = spvNMax(dot(_494, _546), 9.9999997473787516355514526367188e-06);
            float _3845 = clamp(dot(_26._m0, normalize(_546 + _26._m0)), 0.0, 1.0);
            float _3847 = clamp(dot(_494, _26._m0), 0.0, 1.0);
            vec3 _3854 = vec3(fma((2.0 * _3845) * _3845, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
            float _3873 = dot(_26._m0, _3839);
            vec3 _3883 = mix(_3839, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_3839 - (_26._m0 * _3873)) * 0.0045900647528469562530517578125)), bvec3(_3873 < 0.999989449977874755859375));
            vec3 _3885 = normalize(_546 + _3883);
            float _3889 = clamp(dot(_494, _3885), 0.0, 1.0);
            float _3891 = clamp(dot(_494, _3883), 0.0, 1.0);
            float _3893 = (_575 + 1.0) * 0.5;
            float _3894 = _575 * _575;
            float _3902 = _3893 * _3893;
            float _3914 = _3894 * _3894;
            float _3917 = fma(fma(_3889, _3914, -_3889), _3889, 1.0);
            _3929 = _2959 + ((_3718 * ((_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - clamp(dot(_3883, _3885), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3891, sqrt(fma(fma(-_3841, _3902, _3841), _3841, _3902)), _3841 * sqrt(fma(fma(-_3891, _3902, _3891), _3891, _3902)))) * (_3914 * (0.3183098733425140380859375 / (_3917 * _3917)))))) * _3847);
            _3930 = _2960 + ((_3718 * (_497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3854 * pow(spvNMax(abs(1.0 - _3847), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3854 * pow(spvNMax(abs(1.0 - _3841), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))))) * _3847);
        }
        else
        {
            vec3 _3835;
            vec3 _3836;
            if (_504)
            {
                vec3 _3727 = reflect(_546, _494);
                float _3729 = spvNMax(dot(_494, _546), 9.9999997473787516355514526367188e-06);
                float _3733 = clamp(dot(_26._m0, normalize(_546 + _26._m0)), 0.0, 1.0);
                float _3735 = clamp(dot(_494, _26._m0), 0.0, 1.0);
                vec3 _3742 = vec3(fma((2.0 * _3733) * _3733, _575, mix(0.0, 0.5, _575))) - vec3(1.0);
                float _3761 = dot(_26._m0, _3727);
                vec3 _3771 = mix(_3727, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_3727 - (_26._m0 * _3761)) * 0.0045900647528469562530517578125)), bvec3(_3761 < 0.999989449977874755859375));
                vec3 _3773 = normalize(_546 + _3771);
                float _3777 = clamp(dot(_494, _3773), 0.0, 1.0);
                float _3779 = clamp(dot(_494, _3771), 0.0, 1.0);
                float _3780 = dot(_3773, _543);
                float _3782 = (_575 + 1.0) * 0.5;
                float _3783 = _575 * _575;
                float _3791 = _3782 * _3782;
                float _3805 = sqrt(fma(-_542, 0.89999997615814208984375, 1.0));
                float _3808 = spvNMax(0.001000000047497451305389404296875, clamp(_3783 / _3805, 0.0, 1.0));
                float _3810 = spvNMax(0.001000000047497451305389404296875, _3783 * _3805);
                float _3821 = fma(_3777, _3777, ((_3780 * _3780) / (_3808 * _3808)) + (fma(-_3777, _3777, fma(-_3780, _3780, 1.0)) / (_3810 * _3810)));
                _3835 = _2959 + ((_3718 * ((_502 + ((vec3(1.0) - _502) * pow(spvNMax(abs(1.0 - clamp(dot(_3771, _3773), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3779, sqrt(fma(fma(-_3729, _3791, _3729), _3729, _3791)), _3729 * sqrt(fma(fma(-_3779, _3791, _3779), _3779, _3791)))) * (1.0 / ((((_3808 * _3810) * 3.1415927410125732421875) * _3821) * _3821))))) * _3735);
                _3836 = _2960 + ((_3718 * (_497 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3742 * pow(spvNMax(abs(1.0 - _3735), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3742 * pow(spvNMax(abs(1.0 - _3729), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _575))))) * _3735);
            }
            else
            {
                _3835 = _2959;
                _3836 = _2960;
            }
            _3929 = _3835;
            _3930 = _3836;
        }
        float _3950;
        float _3951;
        if (_34._m0.x > 0.0)
        {
            vec4 _3938 = textureLod(sampler2D(_40, _12), _413, 0.0);
            float _3939 = _3938.x;
            _3950 = clamp((pow(spvNMax(abs(dot(_494, _546) + _3939), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _575, -1.0))) - 1.0) + _3939, 0.0, 1.0);
            _3951 = _3939;
        }
        else
        {
            _3950 = 1.0;
            _3951 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _3951, 0.7);
            _3929 *= rdx_ao_factor;
            _3930 *= rdx_ao_factor;
        }
        vec3 _3959 = (_3930 * mix(1.0, _3951, _34._m0.y)) + ((_3045 * _3462) * _3951);
        vec3 _3961 = (_3929 * mix(1.0, _3950, _34._m0.y)) + ((_3042 * _3462) * _3950);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _3961 *= rdx_multi_scatter_compensation(_3008, _575, _502);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _3541, 0.5);
            _3959 *= _rdx_csm_shadow;
            _3961 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _39, _7, _413, _rdx_marchDir, _455, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _3959 *= _rdx_micro;
            _3961 *= _rdx_micro;
        }
        vec3 _4466;
        vec3 _4467;
        SPIRV_CROSS_BRANCH
        if (_3467)
        {
            vec3 _3969 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _3970 = vec3(0.0, 636100.0, 0.0) + (_544 + _27._m6);
            float _3971 = length(_3970);
            vec3 _3975 = (_3970 / vec3(_3971)) * spvNMax(_3971, 636100.0);
            vec3 _3976 = _3975 - _3969;
            float _3977 = length(_3976);
            vec3 _3979 = _3976 / vec3(_3977);
            float _3980 = length(_3969);
            vec3 _3994;
            vec3 _3995;
            float _3996;
            if (_3980 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _3989 = _3969;
                _3989.z = _3969.z + _29._m0;
                vec3 _3992 = _3975;
                _3992.z = _3975.z + _29._m0;
                _3994 = _3992;
                _3995 = _3989;
                _3996 = length(_3989);
            }
            else
            {
                _3994 = _3975;
                _3995 = _3969;
                _3996 = _3980;
            }
            float _3997 = dot(_3995, _3979);
            float _4008 = spvNMax((-_3997) - sqrt(fma(_29._m1, _29._m1, fma(_3997, _3997, -(_3996 * _3996)))), 0.0);
            bool _4011 = (_4008 > 0.0) && (_4008 < _3977);
            vec3 _4019;
            float _4020;
            float _4021;
            if (_4011)
            {
                _4019 = _3995 + (_3979 * _4008);
                _4020 = _3977 - _4008;
                _4021 = (_3997 + _4008) / _29._m1;
            }
            else
            {
                _4019 = _3995;
                _4020 = _3977;
                _4021 = _3997 / _3996;
            }
            float _4022 = _4011 ? _29._m1 : _3996;
            vec3 _4459;
            vec3 _4460;
            if (_4022 <= _29._m1)
            {
                float _4027 = dot(_3979, _26._m36);
                float _4029 = dot(_4019, _26._m36) / _4022;
                float _4030 = _29._m0 + 600.0;
                bool _4031 = _4022 < _4030;
                vec3 _4036;
                if (_4031)
                {
                    _4036 = _3994 * (_4030 / _4022);
                }
                else
                {
                    _4036 = _3994;
                }
                float _4037 = _4031 ? _4030 : _4022;
                float _4038 = length(_4036);
                float _4039 = dot(_4036, _3979);
                float _4041 = dot(_4036, _26._m36) / _4038;
                vec2 _4052 = vec2(_4021, _4021 + (_4020 / _4037));
                vec2 _4053 = _4052 * sqrt((0.5 / _29._m4) * _4037);
                vec2 _4056 = vec2(ivec2(sign(_4053)));
                vec2 _4057 = _4053 * _4053;
                float _4071 = -_4020;
                float _4073 = 2.0 * _4037;
                float _4075 = (_4020 / _4073) + _4021;
                float _4083 = _29._m0 - _4037;
                vec2 _4098 = _4052 * sqrt((0.5 / _29._m6) * _4037);
                vec2 _4101 = vec2(ivec2(sign(_4098)));
                vec2 _4102 = _4098 * _4098;
                vec3 _4132 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _4037) * exp(_4083 / _29._m4)) * (((_4056.y > _4056.x) ? exp(_4057.x) : 0.0) + dot((_4056 / ((abs(_4053) * 2.3192999362945556640625) + sqrt((_4057 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4071 / _29._m4) * _4075)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _4037) * exp(_4083 / _29._m6)) * (((_4101.y > _4101.x) ? exp(_4102.x) : 0.0) + dot((_4101 / ((abs(_4098) * 2.3192999362945556640625) + sqrt((_4102 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4071 / _29._m6) * _4075)), vec2(1.0, -1.0))))));
                vec3 _4133 = spvNMin(_4132, vec3(1.0));
                float _4134 = _29._m0 / _4037;
                float _4137 = sqrt(fma(-_4134, _4134, 1.0));
                float _4139 = _4021 - (-_4137);
                vec4 _4422;
                if (abs(_4139) < 0.0040000001899898052215576171875)
                {
                    float _4247 = (-0.0040000001899898052215576171875) - _4137;
                    float _4249 = fma(_4037, _4037, _4020 * _4020);
                    float _4250 = _4073 * _4020;
                    float _4252 = sqrt(fma(_4250, _4247, _4249));
                    float _4253 = fma(_4037, _4247, _4020);
                    float _4256 = -(_29._m0 * _29._m0);
                    float _4258 = sqrt(fma(_29._m1, _29._m1, _4256));
                    float _4260 = sqrt(fma(_4037, _4037, _4256));
                    float _4261 = _4037 * _4247;
                    float _4263 = -(_4037 * _4037);
                    float _4265 = fma(_29._m0, _29._m0, fma(_4261, _4261, _4263));
                    vec4 _4271 = vec4(-1.0, _4258 * _4258, _4258, 0.50390625);
                    vec4 _4272 = mix(_4271, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4261 < 0.0) && (_4265 > 0.0)));
                    float _4274 = fma(_4260 / _4258, 0.96875, 0.015625);
                    float _4284 = fma(fma(_4261, _4272.x, sqrt(_4265 + _4272.y)) / (_4260 + _4272.z), 0.4921875, _4272.w);
                    float _4290 = _4027 + 1.0;
                    float _4292 = floor(_4290 * 3.5);
                    float _4294 = fma(_4290, 3.5, -_4292);
                    float _4295 = _4292 + fma(fma(atan(spvNMax(_4029, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4296 = _4295 * 0.125;
                    float _4300 = 1.0 - _4294;
                    float _4303 = (_4295 + 1.0) * 0.125;
                    float _4310 = sqrt(fma(_4252, _4252, _4256));
                    float _4314 = fma(_29._m0, _29._m0, fma(_4253, _4253, -(_4252 * _4252)));
                    vec4 _4319 = mix(_4271, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4253 < 0.0) && (_4314 > 0.0)));
                    float _4321 = fma(_4310 / _4258, 0.96875, 0.015625);
                    float _4331 = fma(fma(_4253, _4319.x, sqrt(_4314 + _4319.y)) / (_4310 + _4319.z), 0.4921875, _4319.w);
                    float _4337 = _4292 + fma(fma(atan(spvNMax(_4041, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4338 = _4337 * 0.125;
                    float _4344 = (_4337 + 1.0) * 0.125;
                    vec4 _4350 = _4133.xyzx;
                    float _4354 = 0.0040000001899898052215576171875 - _4137;
                    float _4356 = sqrt(fma(_4250, _4354, _4249));
                    float _4357 = fma(_4037, _4354, _4020);
                    float _4358 = _4037 * _4354;
                    float _4360 = fma(_29._m0, _29._m0, fma(_4358, _4358, _4263));
                    vec4 _4365 = mix(_4271, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4358 < 0.0) && (_4360 > 0.0)));
                    float _4375 = fma(fma(_4358, _4365.x, sqrt(_4360 + _4365.y)) / (_4260 + _4365.z), 0.4921875, _4365.w);
                    float _4386 = sqrt(fma(_4356, _4356, _4256));
                    float _4390 = fma(_29._m0, _29._m0, fma(_4357, _4357, -(_4356 * _4356)));
                    vec4 _4395 = mix(_4271, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4357 < 0.0) && (_4390 > 0.0)));
                    float _4397 = fma(_4386 / _4258, 0.96875, 0.015625);
                    float _4407 = fma(fma(_4357, _4395.x, sqrt(_4390 + _4395.y)) / (_4386 + _4395.z), 0.4921875, _4395.w);
                    _4422 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_4338, _4331, _4321), 0.0) * _4300) + (textureLod(sampler3D(_31, _7), vec3(_4344, _4331, _4321), 0.0) * _4294)), _4350, (textureLod(sampler3D(_31, _7), vec3(_4296, _4284, _4274), 0.0) * _4300) + (textureLod(sampler3D(_31, _7), vec3(_4303, _4284, _4274), 0.0) * _4294)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_4338, _4407, _4397), 0.0) * _4300) + (textureLod(sampler3D(_31, _7), vec3(_4344, _4407, _4397), 0.0) * _4294)), _4350, (textureLod(sampler3D(_31, _7), vec3(_4296, _4375, _4274), 0.0) * _4300) + (textureLod(sampler3D(_31, _7), vec3(_4303, _4375, _4274), 0.0) * _4294)), vec4(0.0)), vec4((_4139 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _4147 = -(_29._m0 * _29._m0);
                    float _4149 = sqrt(fma(_29._m1, _29._m1, _4147));
                    float _4151 = sqrt(fma(_4037, _4037, _4147));
                    float _4152 = _4037 * _4021;
                    float _4156 = fma(_29._m0, _29._m0, fma(_4152, _4152, -(_4037 * _4037)));
                    vec4 _4162 = vec4(-1.0, _4149 * _4149, _4149, 0.50390625);
                    vec4 _4163 = mix(_4162, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4152 < 0.0) && (_4156 > 0.0)));
                    float _4165 = fma(_4151 / _4149, 0.96875, 0.015625);
                    float _4175 = fma(fma(_4152, _4163.x, sqrt(_4156 + _4163.y)) / (_4151 + _4163.z), 0.4921875, _4163.w);
                    float _4181 = _4027 + 1.0;
                    float _4183 = floor(_4181 * 3.5);
                    float _4185 = fma(_4181, 3.5, -_4183);
                    float _4186 = _4183 + fma(fma(atan(spvNMax(_4029, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4191 = 1.0 - _4185;
                    float _4201 = sqrt(fma(_4038, _4038, _4147));
                    float _4205 = fma(_29._m0, _29._m0, fma(_4039, _4039, -(_4038 * _4038)));
                    vec4 _4210 = mix(_4162, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4039 < 0.0) && (_4205 > 0.0)));
                    float _4212 = fma(_4201 / _4149, 0.96875, 0.015625);
                    float _4222 = fma(fma(_4039, _4210.x, sqrt(_4205 + _4210.y)) / (_4201 + _4210.z), 0.4921875, _4210.w);
                    float _4228 = _4183 + fma(fma(atan(spvNMax(_4041, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _4422 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_4228 * 0.125, _4222, _4212), 0.0) * _4191) + (textureLod(sampler3D(_31, _7), vec3((_4228 + 1.0) * 0.125, _4222, _4212), 0.0) * _4185)), _4133.xyzx, (textureLod(sampler3D(_31, _7), vec3(_4186 * 0.125, _4175, _4165), 0.0) * _4191) + (textureLod(sampler3D(_31, _7), vec3((_4186 + 1.0) * 0.125, _4175, _4165), 0.0) * _4185)), vec4(0.0));
                }
                float _4437 = fma(_4027, _4027, 1.0);
                _4459 = _4133;
                _4460 = (_4422.xyz * (0.0596831031143665313720703125 * _4437)) + ((((_4422.xyz * (_4422.w * smoothstep(0.0, 0.0199999995529651641845703125, _4029))) / vec3(spvNMax(_4422.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _4027, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _4437) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _4459 = vec3(1.0);
                _4460 = vec3(0.0);
            }
            _4466 = _3961 * _4459;
            _4467 = fma(_3959, _4459, _4460 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _4466 = _3961;
            _4467 = _3959;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_39, _7, _413, _rdx_dir, _455, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _4467 = vec3(_rdx_vis);
            _4466 = vec3(0.0);
        }
        imageStore(_43, ivec2(_396), vec4(_4467, 1.0));
        imageStore(_44, ivec2(_396), vec4(_4466, 1.0));
        break;
    } while(false);
}

