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

struct _54
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

struct _57
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
};

struct _60
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

struct _64
{
    vec4 _m0;
    mat4x3 _m1;
    vec4 _m2[4];
    float _m3;
    float _m4;
    uint _m5;
    uint _m6;
};

struct _69
{
    mat4 _m0;
    vec2 _m1;
    float _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    float _m6;
};

float _313;
const vec4 _324[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _357;
vec3 _362;
vec3 _363;

layout(set = 1, binding = 13, std430) readonly buffer _49_6
{
    float _m0[];
} _6;

layout(set = 1, binding = 23, std430) readonly buffer _51_9
{
    ivec4 _m0[];
} _9;

layout(set = 1, binding = 24, std430) readonly buffer _53_10
{
    int _m0[];
} _10;

layout(set = 1, binding = 25, std430) readonly buffer _56_11
{
    _54 _m0[];
} _11;

layout(set = 1, binding = 28, std430) readonly buffer _59_12
{
    _57 _m0[];
} _12;

layout(set = 1, binding = 29, std430) readonly buffer _62_13
{
    layout(row_major) _60 _m0[];
} _13;

layout(set = 1, binding = 33, std430) readonly buffer _66_15
{
    layout(row_major) _64 _m0[];
} _15;

layout(set = 1, binding = 39, std140) uniform _68_21
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
} _21;

layout(set = 1, binding = 40, scalar) readonly buffer _71_22
{
    layout(row_major) _69 _m0[];
} _22;

layout(set = 0, binding = 0, std140) uniform _72_28
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    float _m5;
    int _m6;
    float _m7;
} _28;

layout(set = 0, binding = 1, std140) uniform _74_29
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
} _29;

layout(set = 0, binding = 2, std140) uniform _75_30
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    vec3 _m6;
    int _m7;
} _30;

layout(set = 0, binding = 4, std140) uniform _76_31
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
} _31;

layout(set = 5, binding = 0, scalar) uniform _78_32
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
} _32;

layout(set = 1, binding = 0, scalar) uniform _79_37
{
    vec4 _m0;
    uvec2 _m1;
    uint _m2;
    uint _m3;
    uint _m4;
    uvec3 _m5;
} _37;

layout(set = 1, binding = 9, std430) readonly buffer _80_45
{
    uint _m0[];
} _45;

layout(set = 1, binding = 16) uniform sampler _7;
layout(set = 1, binding = 21) uniform texture2DArray _8;
layout(set = 1, binding = 32) uniform sampler _14;
layout(set = 1, binding = 34) uniform textureCube _16;
layout(set = 1, binding = 35) uniform textureCube _17;
layout(set = 1, binding = 36) uniform textureCube _18;
layout(set = 1, binding = 37) uniform textureCube _19;
layout(set = 1, binding = 38) uniform texture2D _20;
layout(set = 1, binding = 41) uniform texture2D _23;
layout(set = 1, binding = 42) uniform texture2D _24;
layout(set = 1, binding = 43) uniform texture2D _25;
layout(set = 1, binding = 45) uniform textureCube _26[];
layout(set = 1, binding = 45) uniform texture2D _27[];
layout(set = 5, binding = 1) uniform texture2D _33;
layout(set = 5, binding = 2) uniform texture3D _34;
layout(set = 5, binding = 4) uniform texture2D _35;
layout(set = 5, binding = 5) uniform texture2D _36;
layout(set = 1, binding = 1) uniform texture2D _38;
layout(set = 1, binding = 2) uniform texture2D _39;
layout(set = 1, binding = 3) uniform texture2D _40;
layout(set = 1, binding = 4) uniform texture2D _41;
layout(set = 1, binding = 5) uniform texture2D _42;
layout(set = 1, binding = 6) uniform texture2D _43;
layout(set = 1, binding = 7) uniform texture2D _44;
layout(set = 1, binding = 10, rgba32f) uniform writeonly image2D _46;
layout(set = 1, binding = 11, rgba32f) uniform writeonly image2D _47;

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
        uint _402 = (((_37._m2 & 1u) != 0u) ? ((_37._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_37._m2 / 2u) * _37._m3);
        uint _404 = _45._m0[_402];
        uvec2 _409 = (uvec2(_404 & 65535u, _404 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_409, _31._m3)) || any(greaterThan(_409, _31._m4)))
        {
            break;
        }
        vec2 _421 = vec2(_409);
        vec2 _426 = (_421 + vec2(0.5)) / vec2(_37._m1);
        vec2 _433 = ((_426 - _31._m1) / _31._m0) * 0.5;
        float _437 = _433.x;
        float _439 = _433.y;
        ivec2 _457 = ivec3(int(_409.x), int(_409.y), 0).xy;
        vec4 _463 = texelFetch(_40, _457, 0);
        vec4 _465 = texelFetch(_41, _457, 0);
        vec4 _467 = texelFetch(_42, _457, 0);
        float _468 = _467.x;
        vec3 _486;
        do
        {
            vec3 _474 = fma(vec3(texelFetch(_38, _457, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _475 = dot(_474, _474);
            if (_475 > 54000001024.0)
            {
                _486 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _480 = 2.0 / _475;
                vec2 _482 = _474.xy * _480;
                vec3 _483 = vec3(_482.x, _482.y, _362.z);
                _483.z = 1.0 - _480;
                _486 = _483;
                break;
            }
            break; // unreachable workaround
        } while(false);
        vec3 _487 = texelFetch(_39, _457, 0).xyz;
        float _489 = _463.y;
        float _490 = _463.z;
        uint _496 = (uint(roundEven(_463.w * 255.0)) & 112u) >> 4u;
        vec3 _509 = _486 * mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz);
        vec3 _514 = mix(_487, vec3(1.0), bvec3(true && (_28._m4 != 0.0))) * (1.0 - _490);
        vec3 _519 = mix(vec3(0.1599999964237213134765625 * (_489 * _489)), _487, vec3(_490));
        float _520 = spvNMax(0.0900000035762786865234375, _463.x);
        uint _524 = uint(int(_465.x * 255.0));
        float _535 = spvNMax(clamp(_12._m0[_524]._m3.x * _520, 0.0, 1.0), 0.0900000035762786865234375);
        float _538 = spvNMax(clamp(_12._m0[_524]._m3.y * _520, 0.0, 1.0), 0.0900000035762786865234375);
        float _543 = _465.y;
        float _547 = fma(_12._m0[_524]._m2.y, _465.z, _12._m0[_524]._m2.x);
        bool _549 = _465.w != 0.0;
        bool _551 = _12._m0[_524]._m2.z == 1.0;
        bool _552 = _549 && _551;
        bool _554 = _549 && (!_551);
        vec3 _555 = (((_29._m7[0].xyz * ((1.0 - _437) - _439)) + (_29._m7[1].xyz * _437)) + (_29._m7[2].xyz * _439)) * _468;
        vec3 _557 = normalize(-_555);
        uint _559 = gl_SubgroupInvocationID & 3u;
        float _564 = ((_559 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _565 = (subgroupQuadSwapHorizontal(_486) - _486) * _564;
        float _570 = ((_559 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _571 = (subgroupQuadSwapVertical(_486) - _486) * _570;
        vec3 _575 = mix(_565, vec3(0.0), bvec3(any(isnan(_565))));
        vec3 _579 = mix(_571, vec3(0.0), bvec3(any(isnan(_571))));
        float _586 = sqrt(clamp(fma(_520, _520, spvNMin(dot(_575, _575) + dot(_579, _579), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _595 = ivec2(uvec2(_421) / uvec2(_21._m25));
        float _621 = _421.x;
        float _622 = _421.y;
        float _627 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _621, 0.005837149918079376220703125 * _622)));
        float _634 = clamp(fma(_21._m34.y, length(_555), _21._m34.x), 0.0, 1.0);
        uint _635 = uint(int(fma(fma(float(int(clamp(fma(log2(_468 * _30._m4), _21._m21, _21._m22), 0.0, float(_21._m26)))), _21._m24, float(_595.y)), _21._m23, float(_595.x))));
        uvec4 _638 = uvec4(_9._m0[_635]);
        uint _639 = _638.x;
        uint _640 = _638.y;
        uint _643 = ((_640 >> 0u) & 4095u) + _639;
        uint _646 = ((_640 >> 12u) & 4095u) + _643;
        uint _650 = ((_638.z >> 0u) & 1023u) + _646;
        float _651 = dot(_509, _557);
        float _652 = spvNMax(_651, 9.9999997473787516355514526367188e-06);
        float _654;
        bool _657;
        vec3 _659;
        vec3 _661;
        uint _663;
        _654 = _313;
        _657 = false;
        _659 = vec3(0.0);
        _661 = vec3(0.0);
        _663 = _639;
        float _655;
        bool _658;
        vec3 _660;
        vec3 _662;
        for (; _663 < _643; _654 = _655, _657 = _658, _659 = _660, _661 = _662, _663++)
        {
            uint _670 = uint(_10._m0[_663]);
            float _688 = abs(_11._m0[_670]._m5);
            bool _692 = _11._m0[_670]._m5 < 0.0;
            if ((_11._m0[_670]._m6 & (1u << (_496 & 31u))) != 0u)
            {
                vec3 _703 = _11._m0[_670]._m0.xyz - _555;
                float _704 = dot(_703, _703);
                vec3 _707 = _703 * inversesqrt(spvNMax(_704, 1.0000000133514319600180897396058e-10));
                float _708 = _11._m0[_670]._m0.w * _11._m0[_670]._m0.w;
                float _1130;
                bool _1131;
                vec3 _1132;
                vec3 _1133;
                if (_704 < (1.0 / _708))
                {
                    vec3 _713 = _557 + _707;
                    vec3 _717 = _713 * inversesqrt(spvNMax(dot(_713, _713), 1.0000000133514319600180897396058e-10));
                    float _719 = clamp(dot(_707, _717), 0.0, 1.0);
                    float _721 = clamp(dot(_509, _717), 0.0, 1.0);
                    float _722 = dot(_509, _707);
                    float _723 = clamp(_722, 0.0, 1.0);
                    float _724 = _704 * _708;
                    float _730 = pow(spvNMax(abs(clamp(fma(-_724, _724, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_670]._m4);
                    float _740;
                    if (_692)
                    {
                        _740 = _730 * fma(4.0, _708, _688);
                    }
                    else
                    {
                        _740 = _730 * ((1.0 / spvNMax(_704, 9.9999997473787516355514526367188e-05)) + _688);
                    }
                    float _742 = 0.079577468335628509521484375 * (_723 * _740);
                    float _909;
                    bool _910;
                    float _911;
                    float _912;
                    float _913;
                    if ((_11._m0[_670]._m7 & 1u) != 0u)
                    {
                        uint _767;
                        do
                        {
                            vec3 _747 = -_707;
                            float _748 = dot(_747, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                            float _749 = dot(_747, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                            float _750 = dot(_747, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                            float _754 = spvNMax(spvNMax(_748, _749), spvNMax(_750, dot(_747, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                            if (_754 == _748)
                            {
                                _767 = 0u;
                                break;
                            }
                            else
                            {
                                if (_754 == _749)
                                {
                                    _767 = 1u;
                                    break;
                                }
                                else
                                {
                                    if (_754 == _750)
                                    {
                                        _767 = 2u;
                                        break;
                                    }
                                    else
                                    {
                                        _767 = 3u;
                                        break;
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            }
                            break; // unreachable workaround
                        } while(false);
                        uint _769 = uint(int(_11._m0[_670]._m7 >> 2u)) + _767;
                        float _782 = sqrt(_704);
                        float _872;
                        bool _873;
                        float _874;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_722 <= 0.0) && (!_554))
                            {
                                _872 = _654;
                                _873 = _657;
                                _874 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _803 = _22._m0[_769]._m0 * vec4(_555 + (_509 * ((3.5 * float(int(sign(_722)))) * (_22._m0[_769]._m4 * _782))), 1.0);
                                vec3 _807 = _803.xyz / vec3(_803.w);
                                vec2 _810 = (_807.xy * 0.5) + vec2(0.5);
                                _810.y = 1.0 - _810.y;
                                float _819 = (_22._m0[_769]._m5.y / _22._m0[_769]._m6) / (_807.z - _22._m0[_769]._m5.x);
                                float _824 = _657 ? _654 : 6.283185482025146484375;
                                float _825 = _627 * _824;
                                vec2 _826 = _22._m0[_769]._m1 + _21._m33;
                                vec2 _829 = (_22._m0[_769]._m1 + vec2(_22._m0[_769]._m2)) - _21._m33;
                                float _831;
                                _831 = 0.0;
                                for (int _834 = 0; _834 < 12; )
                                {
                                    float _839 = float(uint(_834));
                                    float _842 = sqrt(_839 + 0.5) * 0.288675129413604736328125;
                                    float _843 = fma(_839, 2.3999631404876708984375, _825);
                                    vec2 _851 = clamp(fma((vec3(cos(_843), sin(_843), _842).xy * _842) * 2.5, _21._m33, _810), _826, _829);
                                    vec2 _854 = fract(fma(vec2(1.0) / _21._m33, _851, vec2(0.5)));
                                    vec4 _860 = vec4(lessThan(vec4(_819), textureGather(sampler2D(_23, _14), _851)));
                                    float _863 = _854.x;
                                    _831 += clamp(mix(mix(_860.w, _860.z, _863), mix(_860.x, _860.y, _863), _854.y), 0.0, 1.0);
                                    _834++;
                                    continue;
                                }
                                _872 = _824;
                                _873 = _657 ? _657 : true;
                                _874 = _831 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        float _876 = mix(1.0, _874, spvNMin(_634, _11._m0[_670]._m8));
                        float _908;
                        SPIRV_CROSS_BRANCH
                        if (_549 && _552)
                        {
                            float _881 = _22._m0[_769]._m4 * _782;
                            vec4 _888 = _22._m0[_769]._m0 * vec4(_555 - (_509 * _881), 1.0);
                            float _889 = _888.w;
                            _908 = fma(_881, clamp(dot(-_509, _707), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_888.xyz / vec3(_889)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_769]._m6, _889))) * 1000.0;
                        }
                        else
                        {
                            _908 = 0.0;
                        }
                        _909 = _872;
                        _910 = _873;
                        _911 = _742 * _876;
                        _912 = _908;
                        _913 = _876;
                    }
                    else
                    {
                        _909 = _654;
                        _910 = _657;
                        _911 = _742;
                        _912 = 0.0;
                        _913 = 1.0;
                    }
                    float _954;
                    vec3 _955;
                    SPIRV_CROSS_BRANCH
                    if (_549)
                    {
                        vec3 _920 = vec3(1.0) / spvNMax((_12._m0[_524]._m0.xyz * vec3(0.09660939872264862060546875)) * (_12._m0[_524]._m0.w * _543), vec3(9.9999997473787516355514526367188e-05));
                        vec3 _938;
                        SPIRV_CROSS_BRANCH
                        if (_552)
                        {
                            vec3 _934 = exp2(_920 * ((-0.4808983504772186279296875) * spvNMax(_547, _912)));
                            _938 = _12._m0[_524]._m1.xyz * (_934 * fma(_934, _934, vec3(3.0)));
                        }
                        else
                        {
                            vec3 _926 = exp2(_920 * ((-0.4808983504772186279296875) * _547));
                            _938 = (_12._m0[_524]._m1.xyz * (_926 * fma(_926, _926, vec3(3.0)))) * _913;
                        }
                        float _951;
                        if (_692)
                        {
                            _951 = _730 * fma(4.0, _708, _688);
                        }
                        else
                        {
                            _951 = _730 * ((1.0 / spvNMax(_704, 9.9999997473787516355514526367188e-05)) + _688);
                        }
                        _954 = 0.079577468335628509521484375 * (clamp((0.2588190734386444091796875 - _722) * 0.631063938140869140625, 0.0, 1.0) * _951);
                        _955 = _938;
                    }
                    else
                    {
                        _954 = 0.0;
                        _955 = vec3(0.0);
                    }
                    vec3 _1128;
                    vec3 _1129;
                    SPIRV_CROSS_BRANCH
                    if (_11._m0[_670]._m3 < 0.0)
                    {
                        vec3 _1117;
                        vec3 _1118;
                        if (_723 > 0.0)
                        {
                            vec3 _1047 = (_11._m0[_670]._m1.xyz * _911) * _6._m0[0u];
                            vec3 _1054 = vec3(fma((2.0 * _719) * _719, _586, mix(0.0, 0.5, _586))) - vec3(1.0);
                            float _1075 = (_586 + 1.0) * 0.5;
                            float _1078 = _586 * _586;
                            float _1079 = mix(_535 * _535, _1078, _490);
                            float _1080 = mix(_538 * _538, _1078, _490);
                            float _1088 = _1075 * _1075;
                            float _1100 = _1079 * _1079;
                            float _1101 = -_721;
                            float _1103 = fma(fma(_721, _1100, _1101), _721, 1.0);
                            float _1107 = _1080 * _1080;
                            float _1109 = fma(fma(_721, _1107, _1101), _721, 1.0);
                            _1117 = fma(_1047, (_519 + ((vec3(1.0) - _519) * pow(spvNMax(abs(1.0 - _719), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_723, sqrt(fma(fma(-_652, _1088, _652), _652, _1088)), _652 * sqrt(fma(fma(-_723, _1088, _723), _723, _1088)))) * mix(_1100 * (0.3183098733425140380859375 / (_1103 * _1103)), _1107 * (0.3183098733425140380859375 / (_1109 * _1109)), _12._m0[_524]._m3.z)), _659);
                            _1118 = fma(_1047, _514 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1054 * pow(spvNMax(abs(1.0 - _723), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1054 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _586))), _661);
                        }
                        else
                        {
                            _1117 = _659;
                            _1118 = _661;
                        }
                        vec3 _1127;
                        SPIRV_CROSS_BRANCH
                        if (_549)
                        {
                            _1127 = _1118 + (((_955 * _11._m0[_670]._m1.xyz) * _514) * ((0.3183098733425140380859375 * _954) * _6._m0[0u]));
                        }
                        else
                        {
                            _1127 = _1118;
                        }
                        _1128 = _1117;
                        _1129 = _1127;
                    }
                    else
                    {
                        vec3 _1033;
                        vec3 _1034;
                        if (_723 > 0.0)
                        {
                            vec3 _963 = (_11._m0[_670]._m1.xyz * _911) * 1.0;
                            vec3 _970 = vec3(fma((2.0 * _719) * _719, _586, mix(0.0, 0.5, _586))) - vec3(1.0);
                            float _991 = (_586 + 1.0) * 0.5;
                            float _994 = _586 * _586;
                            float _995 = mix(_535 * _535, _994, _490);
                            float _996 = mix(_538 * _538, _994, _490);
                            float _1004 = _991 * _991;
                            float _1016 = _995 * _995;
                            float _1017 = -_721;
                            float _1019 = fma(fma(_721, _1016, _1017), _721, 1.0);
                            float _1023 = _996 * _996;
                            float _1025 = fma(fma(_721, _1023, _1017), _721, 1.0);
                            _1033 = fma(_963, (_519 + ((vec3(1.0) - _519) * pow(spvNMax(abs(1.0 - _719), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_723, sqrt(fma(fma(-_652, _1004, _652), _652, _1004)), _652 * sqrt(fma(fma(-_723, _1004, _723), _723, _1004)))) * mix(_1016 * (0.3183098733425140380859375 / (_1019 * _1019)), _1023 * (0.3183098733425140380859375 / (_1025 * _1025)), _12._m0[_524]._m3.z)), _659);
                            _1034 = fma(_963, _514 * (0.3183098733425140380859375 * (((vec3(1.0) + (_970 * pow(spvNMax(abs(1.0 - _723), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_970 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _586))), _661);
                        }
                        else
                        {
                            _1033 = _659;
                            _1034 = _661;
                        }
                        vec3 _1042;
                        SPIRV_CROSS_BRANCH
                        if (_549)
                        {
                            _1042 = _1034 + (((_955 * _11._m0[_670]._m1.xyz) * _514) * (0.3183098733425140380859375 * _954));
                        }
                        else
                        {
                            _1042 = _1034;
                        }
                        _1128 = _1033;
                        _1129 = _1042;
                    }
                    _1130 = _909;
                    _1131 = _910;
                    _1132 = _1128;
                    _1133 = _1129;
                }
                else
                {
                    _1130 = _654;
                    _1131 = _657;
                    _1132 = _659;
                    _1133 = _661;
                }
                _655 = _1130;
                _658 = _1131;
                _660 = _1132;
                _662 = _1133;
            }
            else
            {
                _655 = _654;
                _658 = _657;
                _660 = _659;
                _662 = _661;
            }
        }
        float _1135;
        bool _1138;
        vec3 _1140;
        vec3 _1142;
        uint _1144;
        _1135 = _654;
        _1138 = _657;
        _1140 = _659;
        _1142 = _661;
        _1144 = _663;
        float _1136;
        bool _1139;
        vec3 _1141;
        vec3 _1143;
        for (; _1144 < _646; _1135 = _1136, _1138 = _1139, _1140 = _1141, _1142 = _1143, _1144++)
        {
            uint _1151 = uint(_10._m0[_1144]);
            float _1164 = abs(_11._m0[_1151]._m5);
            bool _1171 = _11._m0[_1151]._m5 < 0.0;
            if ((_11._m0[_1151]._m6 & (1u << (_496 & 31u))) != 0u)
            {
                vec3 _1182 = _11._m0[_1151]._m0.xyz - _555;
                float _1183 = dot(_1182, _1182);
                vec3 _1186 = _1182 * inversesqrt(spvNMax(_1183, 1.0000000133514319600180897396058e-10));
                float _1187 = _11._m0[_1151]._m0.w * _11._m0[_1151]._m0.w;
                float _1618;
                bool _1619;
                vec3 _1620;
                vec3 _1621;
                if (_1183 < (1.0 / _1187))
                {
                    vec3 _1192 = _557 + _1186;
                    vec3 _1196 = _1192 * inversesqrt(spvNMax(dot(_1192, _1192), 1.0000000133514319600180897396058e-10));
                    float _1198 = clamp(dot(_1186, _1196), 0.0, 1.0);
                    float _1200 = clamp(dot(_509, _1196), 0.0, 1.0);
                    float _1201 = dot(_509, _1186);
                    float _1202 = clamp(_1201, 0.0, 1.0);
                    float _1205 = dot(-_1186, normalize(_11._m0[_1151]._m2.xyz));
                    bool _1206 = _1205 > _11._m0[_1151]._m1.w;
                    float _1234;
                    if (_1206)
                    {
                        float _1209 = _1183 * _1187;
                        float _1215 = pow(spvNMax(abs(clamp(fma(-_1209, _1209, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1151]._m4);
                        float _1225;
                        if (_1171)
                        {
                            _1225 = _1215 * fma(4.0, _1187, _1164);
                        }
                        else
                        {
                            _1225 = _1215 * ((1.0 / spvNMax(_1183, 9.9999997473787516355514526367188e-05)) + _1164);
                        }
                        float _1230 = clamp((_1205 - _11._m0[_1151]._m1.w) / spvNMax(_11._m0[_1151]._m2.w - _11._m0[_1151]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1234 = _1202 * (_1225 * (_1230 * _1230));
                    }
                    else
                    {
                        _1234 = 0.0;
                    }
                    float _1235 = 0.3183098733425140380859375 * _1234;
                    float _1378;
                    bool _1379;
                    float _1380;
                    float _1381;
                    float _1382;
                    if ((_11._m0[_1151]._m7 & 1u) != 0u)
                    {
                        uint _1238 = uint(int(_11._m0[_1151]._m7 >> 2u));
                        float _1251 = sqrt(_1183);
                        float _1341;
                        bool _1342;
                        float _1343;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1201 <= 0.0) && (!_554))
                            {
                                _1341 = _1135;
                                _1342 = _1138;
                                _1343 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1272 = _22._m0[_1238]._m0 * vec4(_555 + (_509 * ((3.5 * float(int(sign(_1201)))) * (_22._m0[_1238]._m4 * _1251))), 1.0);
                                vec3 _1276 = _1272.xyz / vec3(_1272.w);
                                vec2 _1279 = (_1276.xy * 0.5) + vec2(0.5);
                                _1279.y = 1.0 - _1279.y;
                                float _1288 = (_22._m0[_1238]._m5.y / _22._m0[_1238]._m6) / (_1276.z - _22._m0[_1238]._m5.x);
                                float _1293 = _1138 ? _1135 : 6.283185482025146484375;
                                float _1294 = _627 * _1293;
                                vec2 _1295 = _22._m0[_1238]._m1 + _21._m33;
                                vec2 _1298 = (_22._m0[_1238]._m1 + vec2(_22._m0[_1238]._m2)) - _21._m33;
                                float _1300;
                                _1300 = 0.0;
                                for (int _1303 = 0; _1303 < 12; )
                                {
                                    float _1308 = float(uint(_1303));
                                    float _1311 = sqrt(_1308 + 0.5) * 0.288675129413604736328125;
                                    float _1312 = fma(_1308, 2.3999631404876708984375, _1294);
                                    vec2 _1320 = clamp(fma((vec3(cos(_1312), sin(_1312), _1311).xy * _1311) * 2.5, _21._m33, _1279), _1295, _1298);
                                    vec2 _1323 = fract(fma(vec2(1.0) / _21._m33, _1320, vec2(0.5)));
                                    vec4 _1329 = vec4(lessThan(vec4(_1288), textureGather(sampler2D(_23, _14), _1320)));
                                    float _1332 = _1323.x;
                                    _1300 += clamp(mix(mix(_1329.w, _1329.z, _1332), mix(_1329.x, _1329.y, _1332), _1323.y), 0.0, 1.0);
                                    _1303++;
                                    continue;
                                }
                                _1341 = _1293;
                                _1342 = _1138 ? _1138 : true;
                                _1343 = _1300 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        float _1345 = mix(1.0, _1343, spvNMin(_634, _11._m0[_1151]._m8));
                        float _1377;
                        SPIRV_CROSS_BRANCH
                        if (_549 && _552)
                        {
                            float _1350 = _22._m0[_1238]._m4 * _1251;
                            vec4 _1357 = _22._m0[_1238]._m0 * vec4(_555 - (_509 * _1350), 1.0);
                            float _1358 = _1357.w;
                            _1377 = fma(_1350, clamp(dot(-_509, _1186), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_1357.xyz / vec3(_1358)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1238]._m6, _1358))) * 1000.0;
                        }
                        else
                        {
                            _1377 = 0.0;
                        }
                        _1378 = _1341;
                        _1379 = _1342;
                        _1380 = _1235 * _1345;
                        _1381 = _1377;
                        _1382 = _1345;
                    }
                    else
                    {
                        _1378 = _1135;
                        _1379 = _1138;
                        _1380 = _1235;
                        _1381 = 0.0;
                        _1382 = 1.0;
                    }
                    float _1442;
                    vec3 _1443;
                    SPIRV_CROSS_BRANCH
                    if (_549)
                    {
                        vec3 _1389 = vec3(1.0) / spvNMax((_12._m0[_524]._m0.xyz * vec3(0.09660939872264862060546875)) * (_12._m0[_524]._m0.w * _543), vec3(9.9999997473787516355514526367188e-05));
                        vec3 _1407;
                        SPIRV_CROSS_BRANCH
                        if (_552)
                        {
                            vec3 _1403 = exp2(_1389 * ((-0.4808983504772186279296875) * spvNMax(_547, _1381)));
                            _1407 = _12._m0[_524]._m1.xyz * (_1403 * fma(_1403, _1403, vec3(3.0)));
                        }
                        else
                        {
                            vec3 _1395 = exp2(_1389 * ((-0.4808983504772186279296875) * _547));
                            _1407 = (_12._m0[_524]._m1.xyz * (_1395 * fma(_1395, _1395, vec3(3.0)))) * _1382;
                        }
                        float _1440;
                        if (_1206)
                        {
                            float _1415 = _1183 * _1187;
                            float _1421 = pow(spvNMax(abs(clamp(fma(-_1415, _1415, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1151]._m4);
                            float _1431;
                            if (_1171)
                            {
                                _1431 = _1421 * fma(4.0, _1187, _1164);
                            }
                            else
                            {
                                _1431 = _1421 * ((1.0 / spvNMax(_1183, 9.9999997473787516355514526367188e-05)) + _1164);
                            }
                            float _1436 = clamp((_1205 - _11._m0[_1151]._m1.w) / spvNMax(_11._m0[_1151]._m2.w - _11._m0[_1151]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _1440 = clamp((dot(-_509, _1186) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * (_1431 * (_1436 * _1436));
                        }
                        else
                        {
                            _1440 = 0.0;
                        }
                        _1442 = 0.3183098733425140380859375 * _1440;
                        _1443 = _1407;
                    }
                    else
                    {
                        _1442 = 0.0;
                        _1443 = vec3(0.0);
                    }
                    vec3 _1616;
                    vec3 _1617;
                    SPIRV_CROSS_BRANCH
                    if (_11._m0[_1151]._m3 < 0.0)
                    {
                        vec3 _1605;
                        vec3 _1606;
                        if (_1202 > 0.0)
                        {
                            vec3 _1535 = (_11._m0[_1151]._m1.xyz * _1380) * _6._m0[0u];
                            vec3 _1542 = vec3(fma((2.0 * _1198) * _1198, _586, mix(0.0, 0.5, _586))) - vec3(1.0);
                            float _1563 = (_586 + 1.0) * 0.5;
                            float _1566 = _586 * _586;
                            float _1567 = mix(_535 * _535, _1566, _490);
                            float _1568 = mix(_538 * _538, _1566, _490);
                            float _1576 = _1563 * _1563;
                            float _1588 = _1567 * _1567;
                            float _1589 = -_1200;
                            float _1591 = fma(fma(_1200, _1588, _1589), _1200, 1.0);
                            float _1595 = _1568 * _1568;
                            float _1597 = fma(fma(_1200, _1595, _1589), _1200, 1.0);
                            _1605 = fma(_1535, (_519 + ((vec3(1.0) - _519) * pow(spvNMax(abs(1.0 - _1198), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1202, sqrt(fma(fma(-_652, _1576, _652), _652, _1576)), _652 * sqrt(fma(fma(-_1202, _1576, _1202), _1202, _1576)))) * mix(_1588 * (0.3183098733425140380859375 / (_1591 * _1591)), _1595 * (0.3183098733425140380859375 / (_1597 * _1597)), _12._m0[_524]._m3.z)), _1140);
                            _1606 = fma(_1535, _514 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1542 * pow(spvNMax(abs(1.0 - _1202), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1542 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _586))), _1142);
                        }
                        else
                        {
                            _1605 = _1140;
                            _1606 = _1142;
                        }
                        vec3 _1615;
                        SPIRV_CROSS_BRANCH
                        if (_549)
                        {
                            _1615 = _1606 + (((_1443 * _11._m0[_1151]._m1.xyz) * _514) * ((0.3183098733425140380859375 * _1442) * _6._m0[0u]));
                        }
                        else
                        {
                            _1615 = _1606;
                        }
                        _1616 = _1605;
                        _1617 = _1615;
                    }
                    else
                    {
                        vec3 _1521;
                        vec3 _1522;
                        if (_1202 > 0.0)
                        {
                            vec3 _1451 = (_11._m0[_1151]._m1.xyz * _1380) * 1.0;
                            vec3 _1458 = vec3(fma((2.0 * _1198) * _1198, _586, mix(0.0, 0.5, _586))) - vec3(1.0);
                            float _1479 = (_586 + 1.0) * 0.5;
                            float _1482 = _586 * _586;
                            float _1483 = mix(_535 * _535, _1482, _490);
                            float _1484 = mix(_538 * _538, _1482, _490);
                            float _1492 = _1479 * _1479;
                            float _1504 = _1483 * _1483;
                            float _1505 = -_1200;
                            float _1507 = fma(fma(_1200, _1504, _1505), _1200, 1.0);
                            float _1511 = _1484 * _1484;
                            float _1513 = fma(fma(_1200, _1511, _1505), _1200, 1.0);
                            _1521 = fma(_1451, (_519 + ((vec3(1.0) - _519) * pow(spvNMax(abs(1.0 - _1198), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1202, sqrt(fma(fma(-_652, _1492, _652), _652, _1492)), _652 * sqrt(fma(fma(-_1202, _1492, _1202), _1202, _1492)))) * mix(_1504 * (0.3183098733425140380859375 / (_1507 * _1507)), _1511 * (0.3183098733425140380859375 / (_1513 * _1513)), _12._m0[_524]._m3.z)), _1140);
                            _1522 = fma(_1451, _514 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1458 * pow(spvNMax(abs(1.0 - _1202), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1458 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _586))), _1142);
                        }
                        else
                        {
                            _1521 = _1140;
                            _1522 = _1142;
                        }
                        vec3 _1530;
                        SPIRV_CROSS_BRANCH
                        if (_549)
                        {
                            _1530 = _1522 + (((_1443 * _11._m0[_1151]._m1.xyz) * _514) * (0.3183098733425140380859375 * _1442));
                        }
                        else
                        {
                            _1530 = _1522;
                        }
                        _1616 = _1521;
                        _1617 = _1530;
                    }
                    _1618 = _1378;
                    _1619 = _1379;
                    _1620 = _1616;
                    _1621 = _1617;
                }
                else
                {
                    _1618 = _1135;
                    _1619 = _1138;
                    _1620 = _1140;
                    _1621 = _1142;
                }
                _1136 = _1618;
                _1139 = _1619;
                _1141 = _1620;
                _1143 = _1621;
            }
            else
            {
                _1136 = _1135;
                _1139 = _1138;
                _1141 = _1140;
                _1143 = _1142;
            }
        }
        vec3 _1628;
        vec3 _1630;
        _1628 = _1140;
        _1630 = _1142;
        float _1624;
        bool _1627;
        vec3 _1629;
        vec3 _1631;
        float _1623 = _1135;
        bool _1626 = _1138;
        uint _1632 = _1144;
        for (; _1632 < _650; _1623 = _1624, _1626 = _1627, _1628 = _1629, _1630 = _1631, _1632++)
        {
            uint _1639 = uint(_10._m0[_1632]);
            int _1668 = int(_13._m0[_1639]._m1 >> 1u) - 1;
            if (((_13._m0[_1639]._m4 & 16777215u) & (1u << (_496 & 31u))) != 0u)
            {
                vec3 _1679 = _13._m0[_1639]._m6 * vec4(_555, 1.0);
                float _2240;
                bool _2241;
                vec3 _2242;
                vec3 _2243;
                if (all(lessThan(abs(_1679 - vec3(0.5)), vec3(0.5))))
                {
                    vec3 _1686 = _557 + _13._m0[_1639]._m9;
                    vec3 _1690 = _1686 * inversesqrt(spvNMax(dot(_1686, _1686), 1.0000000133514319600180897396058e-10));
                    float _1692 = clamp(dot(_13._m0[_1639]._m9, _1690), 0.0, 1.0);
                    float _1694 = clamp(dot(_509, _1690), 0.0, 1.0);
                    float _1695 = dot(_509, _13._m0[_1639]._m9);
                    float _1696 = clamp(_1695, 0.0, 1.0);
                    int _1697 = int(_13._m0[_1639]._m4 >> 24u);
                    float _1698 = _1679.z;
                    bool _1700 = _1698 < _13._m0[_1639]._m2.x;
                    vec3 _1737;
                    if (_1700)
                    {
                        float _1725 = _1698 * _13._m0[_1639]._m2.z;
                        float _1728 = _1725 * _1725;
                        vec3 _1736;
                        _1736.z = dot(_324[_1697], vec4(_1725, _1728, smoothstep(0.0, 1.0, _1725), (_1728 * _1725) * fma(_1725, fma(_1725, 6.0, -15.0), 10.0)));
                        _1737 = _1736;
                    }
                    else
                    {
                        vec3 _1723;
                        if (_1698 > _13._m0[_1639]._m2.y)
                        {
                            float _1711 = (1.0 - _1698) * _13._m0[_1639]._m2.w;
                            float _1714 = _1711 * _1711;
                            vec3 _1722;
                            _1722.z = dot(_324[_1697], vec4(_1711, _1714, smoothstep(0.0, 1.0, _1711), (_1714 * _1711) * fma(_1711, fma(_1711, 6.0, -15.0), 10.0)));
                            _1723 = _1722;
                        }
                        else
                        {
                            _1723 = vec3(0.0, 0.0, 1.0);
                        }
                        _1737 = _1723;
                    }
                    vec2 _1738 = _1679.xy;
                    vec2 _1742 = (vec2(0.5) - abs(_1738 - vec2(0.5))) * _13._m0[_1639]._m3;
                    float _1743 = _1742.x;
                    bool _1744 = _1743 < 1.0;
                    vec3 _1760;
                    if (_1744)
                    {
                        float _1751 = _1743 * _1743;
                        vec3 _1759 = _1737;
                        _1759.x = dot(_324[_1697], vec4(_1743, _1751, smoothstep(0.0, 1.0, _1743), (_1751 * _1743) * fma(_1743, fma(_1743, 6.0, -15.0), 10.0)));
                        _1760 = _1759;
                    }
                    else
                    {
                        vec3 _1748 = _1737;
                        _1748.x = 1.0;
                        _1760 = _1748;
                    }
                    float _1761 = _1742.y;
                    bool _1762 = _1761 < 1.0;
                    vec3 _1778;
                    if (_1762)
                    {
                        float _1769 = _1761 * _1761;
                        vec3 _1777 = _1760;
                        _1777.y = dot(_324[_1697], vec4(_1761, _1769, smoothstep(0.0, 1.0, _1761), (_1769 * _1761) * fma(_1761, fma(_1761, 6.0, -15.0), 10.0)));
                        _1778 = _1777;
                    }
                    else
                    {
                        vec3 _1766 = _1760;
                        _1766.y = 1.0;
                        _1778 = _1766;
                    }
                    float _1784 = _1696 * ((_1778.x * _1778.y) * _1778.z);
                    float _1921;
                    bool _1922;
                    float _1923;
                    float _1924;
                    float _1925;
                    if ((_13._m0[_1639]._m8 & 1u) != 0u)
                    {
                        uint _1787 = uint(int(_13._m0[_1639]._m8 >> 2u));
                        float _1884;
                        bool _1885;
                        float _1886;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1695 <= 0.0) && (!_554))
                            {
                                _1884 = _1623;
                                _1885 = _1626;
                                _1886 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1819 = _22._m0[_1787]._m0 * vec4(_555 + (_509 * ((3.5 * float(int(sign(_1695)))) * _22._m0[_1787]._m4)), 1.0);
                                vec2 _1822 = (_1819.xy * 0.5) + vec2(0.5);
                                _1822.y = 1.0 - _1822.y;
                                float _1831 = ((_1819.z - _22._m0[_1787]._m5.y) / _22._m0[_1787]._m5.x) / _22._m0[_1787]._m6;
                                float _1836 = _1626 ? _1623 : 6.283185482025146484375;
                                float _1837 = _627 * _1836;
                                vec2 _1838 = _22._m0[_1787]._m1 + _21._m33;
                                vec2 _1841 = (_22._m0[_1787]._m1 + vec2(_22._m0[_1787]._m2)) - _21._m33;
                                float _1843;
                                _1843 = 0.0;
                                for (int _1846 = 0; _1846 < 12; )
                                {
                                    float _1851 = float(uint(_1846));
                                    float _1854 = sqrt(_1851 + 0.5) * 0.288675129413604736328125;
                                    float _1855 = fma(_1851, 2.3999631404876708984375, _1837);
                                    vec2 _1863 = clamp(fma((vec3(cos(_1855), sin(_1855), _1854).xy * _1854) * 2.5, _21._m33, _1822), _1838, _1841);
                                    vec2 _1866 = fract(fma(vec2(1.0) / _21._m33, _1863, vec2(0.5)));
                                    vec4 _1872 = vec4(lessThan(vec4(_1831), textureGather(sampler2D(_23, _14), _1863)));
                                    float _1875 = _1866.x;
                                    _1843 += clamp(mix(mix(_1872.w, _1872.z, _1875), mix(_1872.x, _1872.y, _1875), _1866.y), 0.0, 1.0);
                                    _1846++;
                                    continue;
                                }
                                _1884 = _1836;
                                _1885 = _1626 ? _1626 : true;
                                _1886 = _1843 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        float _1888 = mix(1.0, _1886, spvNMin(_634, _13._m0[_1639]._m5));
                        float _1920;
                        SPIRV_CROSS_BRANCH
                        if (_549 && _552)
                        {
                            vec4 _1899 = _22._m0[_1787]._m0 * vec4(_555 - (_509 * _22._m0[_1787]._m4), 1.0);
                            _1920 = fma(_22._m0[_1787]._m4, clamp(dot(-_509, _13._m0[_1639]._m9), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma(_1899.xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1787]._m6, (_1899.z - _22._m0[_1787]._m5.y) / _22._m0[_1787]._m5.x))) * 1000.0;
                        }
                        else
                        {
                            _1920 = 0.0;
                        }
                        _1921 = _1884;
                        _1922 = _1885;
                        _1923 = _1784 * _1888;
                        _1924 = _1920;
                        _1925 = _1888;
                    }
                    else
                    {
                        _1921 = _1623;
                        _1922 = _1626;
                        _1923 = _1784;
                        _1924 = 0.0;
                        _1925 = 1.0;
                    }
                    float _2031;
                    vec3 _2032;
                    SPIRV_CROSS_BRANCH
                    if (_549)
                    {
                        vec3 _1932 = vec3(1.0) / spvNMax((_12._m0[_524]._m0.xyz * vec3(0.09660939872264862060546875)) * (_12._m0[_524]._m0.w * _543), vec3(9.9999997473787516355514526367188e-05));
                        vec3 _1950;
                        SPIRV_CROSS_BRANCH
                        if (_552)
                        {
                            vec3 _1946 = exp2(_1932 * ((-0.4808983504772186279296875) * spvNMax(_547, _1924)));
                            _1950 = _12._m0[_524]._m1.xyz * (_1946 * fma(_1946, _1946, vec3(3.0)));
                        }
                        else
                        {
                            vec3 _1938 = exp2(_1932 * ((-0.4808983504772186279296875) * _547));
                            _1950 = (_12._m0[_524]._m1.xyz * (_1938 * fma(_1938, _1938, vec3(3.0)))) * _1925;
                        }
                        vec3 _1992;
                        if (_1700)
                        {
                            float _1980 = _1698 * _13._m0[_1639]._m2.z;
                            float _1983 = _1980 * _1980;
                            vec3 _1991;
                            _1991.z = dot(_324[_1697], vec4(_1980, _1983, smoothstep(0.0, 1.0, _1980), (_1983 * _1980) * fma(_1980, fma(_1980, 6.0, -15.0), 10.0)));
                            _1992 = _1991;
                        }
                        else
                        {
                            vec3 _1978;
                            if (_1698 > _13._m0[_1639]._m2.y)
                            {
                                float _1966 = (1.0 - _1698) * _13._m0[_1639]._m2.w;
                                float _1969 = _1966 * _1966;
                                vec3 _1977;
                                _1977.z = dot(_324[_1697], vec4(_1966, _1969, smoothstep(0.0, 1.0, _1966), (_1969 * _1966) * fma(_1966, fma(_1966, 6.0, -15.0), 10.0)));
                                _1978 = _1977;
                            }
                            else
                            {
                                _1978 = vec3(0.0, 0.0, 1.0);
                            }
                            _1992 = _1978;
                        }
                        vec3 _2008;
                        if (_1744)
                        {
                            float _1999 = _1743 * _1743;
                            vec3 _2007 = _1992;
                            _2007.x = dot(_324[_1697], vec4(_1743, _1999, smoothstep(0.0, 1.0, _1743), (_1999 * _1743) * fma(_1743, fma(_1743, 6.0, -15.0), 10.0)));
                            _2008 = _2007;
                        }
                        else
                        {
                            vec3 _1996 = _1992;
                            _1996.x = 1.0;
                            _2008 = _1996;
                        }
                        vec3 _2024;
                        if (_1762)
                        {
                            float _2015 = _1761 * _1761;
                            vec3 _2023 = _2008;
                            _2023.y = dot(_324[_1697], vec4(_1761, _2015, smoothstep(0.0, 1.0, _1761), (_2015 * _1761) * fma(_1761, fma(_1761, 6.0, -15.0), 10.0)));
                            _2024 = _2023;
                        }
                        else
                        {
                            vec3 _2012 = _2008;
                            _2012.y = 1.0;
                            _2024 = _2012;
                        }
                        _2031 = clamp((dot(-_509, _13._m0[_1639]._m9) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * ((_2024.x * _2024.y) * _2024.z);
                        _2032 = _1950;
                    }
                    else
                    {
                        _2031 = 0.0;
                        _2032 = vec3(0.0);
                    }
                    vec3 _2065;
                    if (_1668 >= 0)
                    {
                        vec2 _2038 = (subgroupQuadSwapHorizontal(_1738) - _1738) * _564;
                        vec2 _2041 = (subgroupQuadSwapVertical(_1738) - _1738) * _570;
                        vec2 _2045 = mix(_2038, vec2(0.0), bvec2(any(isnan(_2038))));
                        vec2 _2049 = mix(_2041, vec2(0.0), bvec2(any(isnan(_2041))));
                        bvec2 _2058 = bvec2(any(greaterThan(abs(vec4(_2045, _2049)), vec4(0.015625))));
                        int _81 = _1668;
                        _2065 = _13._m0[_1639]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_81], _7)), _1738, mix(_2045, vec2(0.0), _2058), mix(_2049, vec2(0.0), _2058)).xyz;
                    }
                    else
                    {
                        _2065 = _13._m0[_1639]._m0;
                    }
                    vec3 _2238;
                    vec3 _2239;
                    SPIRV_CROSS_BRANCH
                    if ((_13._m0[_1639]._m1 & 1u) != 0u)
                    {
                        vec3 _2227;
                        vec3 _2228;
                        if (_1696 > 0.0)
                        {
                            vec3 _2157 = (_2065 * _1923) * _6._m0[0u];
                            vec3 _2164 = vec3(fma((2.0 * _1692) * _1692, _586, mix(0.0, 0.5, _586))) - vec3(1.0);
                            float _2185 = (_586 + 1.0) * 0.5;
                            float _2188 = _586 * _586;
                            float _2189 = mix(_535 * _535, _2188, _490);
                            float _2190 = mix(_538 * _538, _2188, _490);
                            float _2198 = _2185 * _2185;
                            float _2210 = _2189 * _2189;
                            float _2211 = -_1694;
                            float _2213 = fma(fma(_1694, _2210, _2211), _1694, 1.0);
                            float _2217 = _2190 * _2190;
                            float _2219 = fma(fma(_1694, _2217, _2211), _1694, 1.0);
                            _2227 = fma(_2157, (_519 + ((vec3(1.0) - _519) * pow(spvNMax(abs(1.0 - _1692), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1696, sqrt(fma(fma(-_652, _2198, _652), _652, _2198)), _652 * sqrt(fma(fma(-_1696, _2198, _1696), _1696, _2198)))) * mix(_2210 * (0.3183098733425140380859375 / (_2213 * _2213)), _2217 * (0.3183098733425140380859375 / (_2219 * _2219)), _12._m0[_524]._m3.z)), _1628);
                            _2228 = fma(_2157, _514 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2164 * pow(spvNMax(abs(1.0 - _1696), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2164 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _586))), _1630);
                        }
                        else
                        {
                            _2227 = _1628;
                            _2228 = _1630;
                        }
                        vec3 _2237;
                        SPIRV_CROSS_BRANCH
                        if (_549)
                        {
                            _2237 = _2228 + (((_2032 * _2065) * _514) * ((0.3183098733425140380859375 * _2031) * _6._m0[0u]));
                        }
                        else
                        {
                            _2237 = _2228;
                        }
                        _2238 = _2227;
                        _2239 = _2237;
                    }
                    else
                    {
                        vec3 _2143;
                        vec3 _2144;
                        if (_1696 > 0.0)
                        {
                            vec3 _2073 = (_2065 * _1923) * 1.0;
                            vec3 _2080 = vec3(fma((2.0 * _1692) * _1692, _586, mix(0.0, 0.5, _586))) - vec3(1.0);
                            float _2101 = (_586 + 1.0) * 0.5;
                            float _2104 = _586 * _586;
                            float _2105 = mix(_535 * _535, _2104, _490);
                            float _2106 = mix(_538 * _538, _2104, _490);
                            float _2114 = _2101 * _2101;
                            float _2126 = _2105 * _2105;
                            float _2127 = -_1694;
                            float _2129 = fma(fma(_1694, _2126, _2127), _1694, 1.0);
                            float _2133 = _2106 * _2106;
                            float _2135 = fma(fma(_1694, _2133, _2127), _1694, 1.0);
                            _2143 = fma(_2073, (_519 + ((vec3(1.0) - _519) * pow(spvNMax(abs(1.0 - _1692), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1696, sqrt(fma(fma(-_652, _2114, _652), _652, _2114)), _652 * sqrt(fma(fma(-_1696, _2114, _1696), _1696, _2114)))) * mix(_2126 * (0.3183098733425140380859375 / (_2129 * _2129)), _2133 * (0.3183098733425140380859375 / (_2135 * _2135)), _12._m0[_524]._m3.z)), _1628);
                            _2144 = fma(_2073, _514 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2080 * pow(spvNMax(abs(1.0 - _1696), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2080 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _586))), _1630);
                        }
                        else
                        {
                            _2143 = _1628;
                            _2144 = _1630;
                        }
                        vec3 _2152;
                        SPIRV_CROSS_BRANCH
                        if (_549)
                        {
                            _2152 = _2144 + (((_2032 * _2065) * _514) * (0.3183098733425140380859375 * _2031));
                        }
                        else
                        {
                            _2152 = _2144;
                        }
                        _2238 = _2143;
                        _2239 = _2152;
                    }
                    _2240 = _1921;
                    _2241 = _1922;
                    _2242 = _2238;
                    _2243 = _2239;
                }
                else
                {
                    _2240 = _1623;
                    _2241 = _1626;
                    _2242 = _1628;
                    _2243 = _1630;
                }
                _1624 = _2240;
                _1627 = _2241;
                _1629 = _2242;
                _1631 = _2243;
            }
            else
            {
                _1624 = _1623;
                _1627 = _1626;
                _1629 = _1628;
                _1631 = _1630;
            }
        }
        vec3 _2245 = reflect(-_557, _509);
        vec3 _2247 = vec3(_519.x, _519.y, _519.z);
        vec3 _2257 = textureLod(samplerCube(_16, _7), _509, 0.0).xyz * _21._m27;
        vec3 _2264 = textureLod(samplerCube(_17, _7), _2245, fma(_586, 8.0, _21._m30 - 8.0)).xyz * _21._m27;
        vec3 _2289;
        vec3 _2290;
        SPIRV_CROSS_BRANCH
        if (_21._m29 > 0.0)
        {
            vec3 _2279 = vec3(_21._m29);
            _2289 = mix(_2264, textureLod(samplerCube(_19, _7), _2245, fma(_586, 8.0, _21._m31 - 8.0)).xyz * _21._m28, _2279);
            _2290 = mix(_2257, textureLod(samplerCube(_18, _7), _509, 0.0).xyz * _21._m28, _2279);
        }
        else
        {
            _2289 = _2264;
            _2290 = _2257;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_2290, _586);
            _2289 *= rdx_mod;
            _2290 *= rdx_mod;
        }
        float _2291 = spvNMax(dot(_557, _509), 0.001953125);
        vec4 _2296 = textureLod(sampler2D(_20, _14), vec2(_2291, _586), 0.0);
        uvec4 _2307 = uvec4(_9._m0[_635]);
        uint _2309 = _2307.y;
        uint _2319 = ((_2307.z >> 0u) & 1023u) + (((_2309 >> 12u) & 4095u) + (((_2309 >> 0u) & 4095u) + _2307.x));
        uint _2321 = (_2309 >> 24u) + _2319;
        vec3 _2323;
        vec3 _2326;
        _2323 = _2289 * ((_2247 * _2296.x) + vec3(_2296.y));
        _2326 = _2290 * (_514 * _2296.z);
        vec3 _2324;
        vec3 _2327;
        for (uint _2328 = _2319; _2328 < _2321; _2323 = _2324, _2326 = _2327, _2328++)
        {
            uint _2335 = uint(_10._m0[_2328]);
            int _2354 = int((_15._m0[_2335]._m5 >> 1u) & 3u);
            mat3 _2358 = mat3(_15._m0[_2335]._m1[0], _15._m0[_2335]._m1[1], _15._m0[_2335]._m1[2]);
            int _2364 = (int((_15._m0[_2335]._m5 >> 3u) & 16383u) - 1) * 2;
            int _2369 = (int((_15._m0[_2335]._m5 >> 17u) & 16383u) - 1) * 2;
            int _2374 = (int((_15._m0[_2335]._m6 >> 0u) & 65535u) - 1) * 2;
            int _2379 = (int((_15._m0[_2335]._m6 >> 16u) & 65535u) - 1) * 2;
            float _2382 = (_15._m0[_2335]._m3 < 0.0) ? (-_15._m0[_2335]._m3) : 1.0;
            vec3 _2384 = _2358 * (_555 - _15._m0[_2335]._m1[3]);
            bool _2385 = int(_15._m0[_2335]._m5 & 1u) == 1;
            vec3 _2386 = abs(_2384);
            float _2389 = dot(_2384, _2384);
            if (_2385 ? any(greaterThanEqual(_2386, _15._m0[_2335]._m0.xyz)) : (_2389 >= _15._m0[_2335]._m0.y))
            {
                _2324 = _2323;
                _2327 = _2326;
                continue;
            }
            vec3 _2563;
            SPIRV_CROSS_FLATTEN
            if ((_2354 & 1) != 0)
            {
                vec3 _2399 = _2358 * _509;
                vec2 _2488;
                bool _2489;
                if (_2385)
                {
                    vec2 _2483;
                    bool _2487;
                    do
                    {
                        vec3 _2467 = (_15._m0[_2335]._m0.xyz - _2384) / _2399;
                        vec3 _2470 = ((-_15._m0[_2335]._m0.xyz) - _2384) / _2399;
                        vec3 _2471 = spvNMin(_2467, _2470);
                        vec3 _2472 = spvNMax(_2467, _2470);
                        float _2477 = spvNMax(_2471.x, spvNMax(_2471.y, _2471.z));
                        float _2482 = spvNMin(_2472.x, spvNMin(_2472.y, _2472.z));
                        _2483 = vec2(_2477, _2482);
                        if (_2477 > _2482)
                        {
                            _2487 = false;
                            break;
                        }
                        _2487 = true;
                        break;
                    } while(false);
                    _2488 = _2483;
                    _2489 = _2487;
                }
                else
                {
                    vec2 _2462;
                    bool _2463;
                    do
                    {
                        float _2405 = dot(_2399, _2399);
                        float _2406 = dot(_2399, _2384);
                        float _2407 = 2.0 * _2406;
                        float _2408 = _2389 - _15._m0[_2335]._m0.y;
                        float _2444;
                        float _2445;
                        bool _2446;
                        do
                        {
                            float _2414 = fma(_2407, _2407, -((4.0 * _2405) * _2408));
                            float _2442;
                            float _2443;
                            if (_2414 < 0.0)
                            {
                                _2444 = 0.0;
                                _2445 = 0.0;
                                _2446 = false;
                                break;
                            }
                            else
                            {
                                if (_2414 == 0.0)
                                {
                                    float _2441 = (_2406 * (-1.0)) * (1.0 / _2405);
                                    _2442 = _2441;
                                    _2443 = _2441;
                                }
                                else
                                {
                                    float _2434;
                                    if (_2407 > 0.0)
                                    {
                                        _2434 = (-0.5) * fma(2.0, _2406, sqrt(_2414));
                                    }
                                    else
                                    {
                                        _2434 = (-0.5) * fma(2.0, _2406, -sqrt(_2414));
                                    }
                                    _2442 = _2408 * (1.0 / _2434);
                                    _2443 = _2434 * (1.0 / _2405);
                                }
                            }
                            _2444 = _2442;
                            _2445 = _2443;
                            _2446 = true;
                            break;
                        } while(false);
                        if (!_2446)
                        {
                            _2462 = vec2(0.0);
                            _2463 = false;
                            break;
                        }
                        if ((_2445 < 0.0) && (_2444 < 0.0))
                        {
                            _2462 = vec2(0.0);
                            _2463 = false;
                            break;
                        }
                        vec2 _2461;
                        if (_2445 > _2444)
                        {
                            _2461 = vec2(_2444, _2445);
                        }
                        else
                        {
                            _2461 = vec2(_2445, _2444);
                        }
                        _2462 = _2461;
                        _2463 = true;
                        break;
                    } while(false);
                    _2488 = _2462;
                    _2489 = _2463;
                }
                vec3 _2492 = _2384 + (_2399 * _2488.y);
                float _2513;
                if (_2385)
                {
                    _2513 = 1.0 - clamp(length(spvNMax(_2386 - (_15._m0[_2335]._m0.xyz - vec3(_15._m0[_2335]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_2335]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2513 = clamp((_15._m0[_2335]._m0.x - length(_2384)) * (1.0 / spvNMax(_15._m0[_2335]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2516 = float(_2489) * smoothstep(0.0, 1.0, _2513);
                vec4 _2558;
                SPIRV_CROSS_BRANCH
                if (_2516 > 9.9999997473787516355514526367188e-05)
                {
                    float _2525 = mix(clamp((_2488.y * (1.0 / length(_2492))) * _586, 0.0, _586), _586, _586);
                    vec3 _2527 = mix(_2492, _2399, vec3(_2525));
                    int _85 = _2364;
                    vec4 _2528 = textureLod(nonuniformEXT(samplerCube(_26[_85], _7)), _2527, 0.0);
                    int _89 = _2364 + 1;
                    _2528.w = textureLod(nonuniformEXT(samplerCube(_26[_89], _7)), _2527, 0.0).x;
                    vec4 _2543;
                    SPIRV_CROSS_BRANCH
                    if (_2369 >= 0)
                    {
                        int _93 = _2369;
                        vec4 _2536 = textureLod(nonuniformEXT(samplerCube(_26[_93], _7)), _2527, 0.0);
                        int _97 = _2369 + 1;
                        _2536.w = textureLod(nonuniformEXT(samplerCube(_26[_97], _7)), _2527, 0.0).x;
                        _2543 = mix(_2528, _2536, vec4(_15._m0[_2335]._m3));
                    }
                    else
                    {
                        _2543 = _2528;
                    }
                    vec4 _2544 = _2543 * _2382;
                    vec3 _2553 = (_2544.xyz * _15._m0[_2335]._m4).xyz * (_514 * textureLod(sampler2D(_20, _14), vec2(_2291, _2525), 0.0).z);
                    vec4 _2554 = vec4(_2553.x, _2553.y, _2553.z, _2544.w);
                    _2554.w = _2544.w * _2516;
                    _2558 = _2554;
                }
                else
                {
                    _2558 = vec4(0.0);
                }
                _2563 = mix(_2326, _2558.xyz, vec3(_2558.w));
            }
            else
            {
                _2563 = _2326;
            }
            vec3 _2742;
            SPIRV_CROSS_FLATTEN
            if ((_2354 & 2) != 0)
            {
                vec3 _2568 = _2358 * _2245;
                vec2 _2657;
                bool _2658;
                if (_2385)
                {
                    vec2 _2652;
                    bool _2656;
                    do
                    {
                        vec3 _2636 = (_15._m0[_2335]._m0.xyz - _2384) / _2568;
                        vec3 _2639 = ((-_15._m0[_2335]._m0.xyz) - _2384) / _2568;
                        vec3 _2640 = spvNMin(_2636, _2639);
                        vec3 _2641 = spvNMax(_2636, _2639);
                        float _2646 = spvNMax(_2640.x, spvNMax(_2640.y, _2640.z));
                        float _2651 = spvNMin(_2641.x, spvNMin(_2641.y, _2641.z));
                        _2652 = vec2(_2646, _2651);
                        if (_2646 > _2651)
                        {
                            _2656 = false;
                            break;
                        }
                        _2656 = true;
                        break;
                    } while(false);
                    _2657 = _2652;
                    _2658 = _2656;
                }
                else
                {
                    vec2 _2631;
                    bool _2632;
                    do
                    {
                        float _2574 = dot(_2568, _2568);
                        float _2575 = dot(_2568, _2384);
                        float _2576 = 2.0 * _2575;
                        float _2577 = _2389 - _15._m0[_2335]._m0.y;
                        float _2613;
                        float _2614;
                        bool _2615;
                        do
                        {
                            float _2583 = fma(_2576, _2576, -((4.0 * _2574) * _2577));
                            float _2611;
                            float _2612;
                            if (_2583 < 0.0)
                            {
                                _2613 = 0.0;
                                _2614 = 0.0;
                                _2615 = false;
                                break;
                            }
                            else
                            {
                                if (_2583 == 0.0)
                                {
                                    float _2610 = (_2575 * (-1.0)) * (1.0 / _2574);
                                    _2611 = _2610;
                                    _2612 = _2610;
                                }
                                else
                                {
                                    float _2603;
                                    if (_2576 > 0.0)
                                    {
                                        _2603 = (-0.5) * fma(2.0, _2575, sqrt(_2583));
                                    }
                                    else
                                    {
                                        _2603 = (-0.5) * fma(2.0, _2575, -sqrt(_2583));
                                    }
                                    _2611 = _2577 * (1.0 / _2603);
                                    _2612 = _2603 * (1.0 / _2574);
                                }
                            }
                            _2613 = _2611;
                            _2614 = _2612;
                            _2615 = true;
                            break;
                        } while(false);
                        if (!_2615)
                        {
                            _2631 = vec2(0.0);
                            _2632 = false;
                            break;
                        }
                        if ((_2614 < 0.0) && (_2613 < 0.0))
                        {
                            _2631 = vec2(0.0);
                            _2632 = false;
                            break;
                        }
                        vec2 _2630;
                        if (_2614 > _2613)
                        {
                            _2630 = vec2(_2613, _2614);
                        }
                        else
                        {
                            _2630 = vec2(_2614, _2613);
                        }
                        _2631 = _2630;
                        _2632 = true;
                        break;
                    } while(false);
                    _2657 = _2631;
                    _2658 = _2632;
                }
                vec3 _2661 = _2384 + (_2568 * _2657.y);
                float _2682;
                if (_2385)
                {
                    _2682 = 1.0 - clamp(length(spvNMax(_2386 - (_15._m0[_2335]._m0.xyz - vec3(_15._m0[_2335]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_2335]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2682 = clamp((_15._m0[_2335]._m0.x - length(_2384)) * (1.0 / spvNMax(_15._m0[_2335]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2685 = float(_2658) * smoothstep(0.0, 1.0, _2682);
                vec4 _2737;
                SPIRV_CROSS_BRANCH
                if (_2685 > 9.9999997473787516355514526367188e-05)
                {
                    float _2694 = mix(clamp((_2657.y * (1.0 / length(_2661))) * _586, 0.0, _586), _586, _586);
                    vec3 _2696 = mix(_2661, _2568, vec3(_2694));
                    float _2697 = _2694 * 8.0;
                    int _101 = _2374;
                    int _105 = _2374 + 1;
                    vec4 _2705 = vec4(textureLod(nonuniformEXT(samplerCube(_26[_101], _7)), _2696, _2697).xyz, textureLod(nonuniformEXT(samplerCube(_26[_105], _7)), _2696, _2697).x);
                    vec4 _2719;
                    SPIRV_CROSS_BRANCH
                    if (_2379 >= 0)
                    {
                        int _109 = _2379;
                        int _113 = _2379 + 1;
                        _2719 = mix(_2705, vec4(textureLod(nonuniformEXT(samplerCube(_26[_109], _7)), _2696, _2697).xyz, textureLod(nonuniformEXT(samplerCube(_26[_113], _7)), _2696, _2697).x), vec4(_15._m0[_2335]._m3));
                    }
                    else
                    {
                        _2719 = _2705;
                    }
                    vec4 _2720 = _2719 * _2382;
                    vec4 _2725 = textureLod(sampler2D(_20, _14), vec2(_2291, _2694), 0.0);
                    vec3 _2732 = (_2720.xyz * _15._m0[_2335]._m4).xyz * ((_2247 * _2725.x) + vec3(_2725.y));
                    vec4 _2733 = vec4(_2732.x, _2732.y, _2732.z, _2720.w);
                    _2733.w = _2720.w * _2685;
                    _2737 = _2733;
                }
                else
                {
                    _2737 = vec4(0.0);
                }
                _2742 = mix(_2323, _2737.xyz, vec3(_2737.w));
            }
            else
            {
                _2742 = _2323;
            }
            _2324 = _2742;
            _2327 = _2563;
        }
        float _2743 = _6._m0[0u] * 100.0;
        bool _2748 = _29._m19 > 0.0;
        vec3 _2809;
        SPIRV_CROSS_BRANCH
        if (_2748 && (_29._m35 == 0.0))
        {
            vec3 _2762 = vec3(0.0, 636100.0, 0.0) + _30._m6;
            float _2763 = length(_2762);
            vec3 _2774;
            float _2775;
            if (_2763 < (0.89999997615814208984375 * _32._m0))
            {
                vec3 _2772 = _2762;
                _2772.z = _2762.z + _32._m0;
                _2774 = _2772;
                _2775 = length(_2772);
            }
            else
            {
                _2774 = _2762;
                _2775 = _2763;
            }
            float _2778 = dot(_2774 / vec3(_2775), _29._m36);
            float _2779 = _32._m0 / _2775;
            _2809 = (mix(textureLod(sampler2D(_33, _7), vec2(atan((_2778 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_2775 - _32._m0) / (_32._m1 - _32._m0))), 0.0).xyz, vec3(0.0), bvec3(_2778 < (-sqrt(fma(-_2779, _2779, 1.0))))) * 1.0) * (_29._m34 * _29._m20);
        }
        else
        {
            _2809 = _29._m2;
        }
        float _2822 = texelFetch(_44, ivec3(int(_621), int(_622), 0).xy, 0).x;
        float _2907;
        SPIRV_CROSS_BRANCH
        if (_29._m21 > 0.0)
        {
            vec3 _2846 = _30._m6 + _555;
            vec3 _2853 = vec3(0.0, _29._m18.z, 0.0) + (_2846 - vec3(0.0, _29._m25, 0.0));
            float _2857 = dot(_2853, _29._m24);
            vec2 _2867 = ((((_2853 + (_29._m24 * (sqrt(fma(_2857, _2857, fma(_29._m18.z, _29._m18.z, -dot(_2853, _2853)))) - _2857))).xz * _29._m18.w) * 0.5) + vec2(0.5)) + _29._m18.xy;
            _2867.x = 1.0 - _2867.x;
            vec3 _2880 = vec3(0.0, _29._m23.z, 0.0) + (_2846 - vec3(0.0, _29._m27, 0.0));
            float _2884 = dot(_2880, _29._m26);
            vec2 _2894 = ((((_2880 + (_29._m26 * (sqrt(fma(_2884, _2884, fma(_29._m23.z, _29._m23.z, -dot(_2880, _2880)))) - _2884))).xz * _29._m23.w) * 0.5) + vec2(0.5)) + _29._m23.xy;
            _2894.x = 1.0 - _2894.x;
            _2907 = _2822 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_35, _7), _2867, 0.0).x, textureLod(sampler2D(_36, _7), _2894, 0.0).x, _29._m16)) * _29._m21, 0.0, 1.0));
        }
        else
        {
            _2907 = _2822;
        }
        float _2997;
        SPIRV_CROSS_BRANCH
        if (_29._m17 > 0.0)
        {
            vec3 _2935 = _30._m6 + _555;
            vec3 _2943 = vec3(0.0, _29._m28.z, 0.0) + ((_29._m29 + _2935) - vec3(0.0, _29._m30, 0.0));
            float _2947 = dot(_2943, _29._m24);
            vec2 _2957 = ((((_2943 + (_29._m24 * (sqrt(fma(_2947, _2947, fma(_29._m28.z, _29._m28.z, -dot(_2943, _2943)))) - _2947))).xz * _29._m28.w) * 0.5) + vec2(0.5)) + _29._m28.xy;
            _2957.x = 1.0 - _2957.x;
            vec3 _2971 = vec3(0.0, _29._m31.z, 0.0) + ((_29._m32 + _2935) - vec3(0.0, _29._m33, 0.0));
            float _2975 = dot(_2971, _29._m26);
            vec2 _2985 = ((((_2971 + (_29._m26 * (sqrt(fma(_2975, _2975, fma(_29._m31.z, _29._m31.z, -dot(_2971, _2971)))) - _2975))).xz * _29._m31.w) * 0.5) + vec2(0.5)) + _29._m31.xy;
            _2985.x = 1.0 - _2985.x;
            _2997 = _2907 * (1.0 - clamp(mix(textureLod(sampler2D(_24, _7), _2957, 0.0).x, textureLod(sampler2D(_25, _7), _2985, 0.0).x, _29._m16) * _29._m17, 0.0, 1.0));
        }
        else
        {
            _2997 = _2907;
        }
        float _3069;
        SPIRV_CROSS_BRANCH
        if (_552)
        {
            float _3004 = 1.0 - abs(dot(_509, _29._m0));
            vec4 _3011 = vec4(_555 - (_509 * (0.0199999995529651641845703125 * _3004)), 1.0);
            float _3067;
            int _3013 = 0;
            SPIRV_CROSS_UNROLL
            for (;;)
            {
                if (_3013 < 4)
                {
                    vec4 _3021 = _3011 * _21._m10[_3013];
                    uint _3022 = uint(_3013);
                    vec2 _3037 = clamp((vec2(1.0) - abs((clamp(_3021.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / vec2(_21._m6), vec2(0.0), vec2(1.0));
                    float _3038 = _3021.z;
                    if (((_3037.x * _3037.y) * clamp((clamp(_3038, 0.0, 1.0) * _21._m8[_3022]) / ((_21._m9[_3022] * 0.5) * _21._m6), 0.0, 1.0)) > 0.0)
                    {
                        _3067 = fma(0.0199999995529651641845703125, _3004, abs(fma(1.0 - _3038, _21._m8[_3022], -((1.0 - textureLod(sampler2DArray(_8, _14), vec3(_3021.xy, float(_3013)), 0.0).x) * _21._m8[_3022]))));
                        break;
                    }
                    _3013++;
                    continue;
                }
                else
                {
                    _3067 = 0.0;
                    break;
                }
            }
            _3069 = _3067 * 1000.0;
        }
        else
        {
            _3069 = 0.0;
        }
        vec3 _3071 = _2809 * (_2997 * _6._m0[0u]);
        vec3 _3074 = reflect(_557, _509);
        float _3078 = clamp(dot(_29._m0, normalize(_557 + _29._m0)), 0.0, 1.0);
        float _3079 = dot(_509, _29._m0);
        float _3080 = clamp(_3079, 0.0, 1.0);
        vec3 _3087 = vec3(fma((2.0 * _3078) * _3078, _586, mix(0.0, 0.5, _586))) - vec3(1.0);
        float _3106 = dot(_29._m0, _3074);
        vec3 _3116 = mix(_3074, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_3074 - (_29._m0 * _3106)) * 0.0045900647528469562530517578125)), bvec3(_3106 < 0.999989449977874755859375));
        vec3 _3118 = normalize(_557 + _3116);
        float _3122 = clamp(dot(_509, _3118), 0.0, 1.0);
        float _3124 = clamp(dot(_509, _3116), 0.0, 1.0);
        float _3126 = (_586 + 1.0) * 0.5;
        float _3129 = _586 * _586;
        float _3130 = mix(_535 * _535, _3129, _490);
        float _3131 = mix(_538 * _538, _3129, _490);
        float _3139 = _3126 * _3126;
        float _3151 = _3130 * _3130;
        float _3152 = -_3122;
        float _3154 = fma(fma(_3122, _3151, _3152), _3122, 1.0);
        float _3158 = _3131 * _3131;
        float _3160 = fma(fma(_3122, _3158, _3152), _3122, 1.0);
        vec3 _3169 = _1630 + ((_3071 * (_514 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3087 * pow(spvNMax(abs(1.0 - _3080), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3087 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _586))))) * _3080);
        vec3 _3207;
        SPIRV_CROSS_BRANCH
        if (_549)
        {
            vec3 _3179 = vec3(1.0) / spvNMax((_12._m0[_524]._m0.xyz * vec3(0.09660939872264862060546875)) * (_12._m0[_524]._m0.w * _543), vec3(9.9999997473787516355514526367188e-05));
            vec3 _3197;
            SPIRV_CROSS_BRANCH
            if (_552)
            {
                vec3 _3193 = exp2(_3179 * ((-0.4808983504772186279296875) * spvNMax(_547, _3069)));
                _3197 = _12._m0[_524]._m1.xyz * (_3193 * fma(_3193, _3193, vec3(3.0)));
            }
            else
            {
                vec3 _3185 = exp2(_3179 * ((-0.4808983504772186279296875) * _547));
                _3197 = (_12._m0[_524]._m1.xyz * (_3185 * fma(_3185, _3185, vec3(3.0)))) * _2997;
            }
            _3207 = _3169 + ((_3197 * ((_2809 * clamp((0.2588190734386444091796875 - _3079) * 0.631063938140869140625, 0.0, 1.0)) * (_514 * 0.3183098733425140380859375))) * _6._m0[0u]);
        }
        else
        {
            _3207 = _3169;
        }
        float _3226;
        float _3227;
        if (_37._m0.x > 0.0)
        {
            vec4 _3215 = textureLod(sampler2D(_43, _14), _426, 0.0);
            float _3216 = _3215.x;
            _3226 = clamp((pow(spvNMax(abs(_651 + _3216), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _586, -1.0))) - 1.0) + _3216, 0.0, 1.0);
            _3227 = _3216;
        }
        else
        {
            _3226 = 1.0;
            _3227 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _3227, 0.7);
            _1628 *= rdx_ao_factor;
            _3207 *= rdx_ao_factor;
        }
        vec3 _3235 = (_3207 * mix(1.0, _3227, _37._m0.y)) + ((_2326 * _2743) * _3227);
        vec3 _3237 = ((_1628 + ((_3071 * ((_519 + ((vec3(1.0) - _519) * pow(spvNMax(abs(1.0 - clamp(dot(_3116, _3118), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3124, sqrt(fma(fma(-_652, _3139, _652), _652, _3139)), _652 * sqrt(fma(fma(-_3124, _3139, _3124), _3124, _3139)))) * mix(_3151 * (0.3183098733425140380859375 / (_3154 * _3154)), _3158 * (0.3183098733425140380859375 / (_3160 * _3160)), _12._m0[_524]._m3.z)))) * _3080)) * mix(1.0, _3226, _37._m0.y)) + ((_2323 * _2743) * _3226);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _3237 *= rdx_multi_scatter_compensation(_2291, _586, _519);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _2822, 0.5);
            _3235 *= _rdx_csm_shadow;
            _3237 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz) * _29._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _42, _7, _426, _rdx_marchDir, _468, vec2(_37._m1));
            _rdx_dbg_micro = _rdx_micro;
            _3235 *= _rdx_micro;
            _3237 *= _rdx_micro;
        }
        vec3 _3742;
        vec3 _3743;
        SPIRV_CROSS_BRANCH
        if (_2748)
        {
            vec3 _3245 = vec3(0.0, 636100.0, 0.0) + _30._m6;
            vec3 _3246 = vec3(0.0, 636100.0, 0.0) + (_555 + _30._m6);
            float _3247 = length(_3246);
            vec3 _3251 = (_3246 / vec3(_3247)) * spvNMax(_3247, 636100.0);
            vec3 _3252 = _3251 - _3245;
            float _3253 = length(_3252);
            vec3 _3255 = _3252 / vec3(_3253);
            float _3256 = length(_3245);
            vec3 _3270;
            vec3 _3271;
            float _3272;
            if (_3256 < (0.89999997615814208984375 * _32._m0))
            {
                vec3 _3265 = _3245;
                _3265.z = _3245.z + _32._m0;
                vec3 _3268 = _3251;
                _3268.z = _3251.z + _32._m0;
                _3270 = _3268;
                _3271 = _3265;
                _3272 = length(_3265);
            }
            else
            {
                _3270 = _3251;
                _3271 = _3245;
                _3272 = _3256;
            }
            float _3273 = dot(_3271, _3255);
            float _3284 = spvNMax((-_3273) - sqrt(fma(_32._m1, _32._m1, fma(_3273, _3273, -(_3272 * _3272)))), 0.0);
            bool _3287 = (_3284 > 0.0) && (_3284 < _3253);
            vec3 _3295;
            float _3296;
            float _3297;
            if (_3287)
            {
                _3295 = _3271 + (_3255 * _3284);
                _3296 = _3253 - _3284;
                _3297 = (_3273 + _3284) / _32._m1;
            }
            else
            {
                _3295 = _3271;
                _3296 = _3253;
                _3297 = _3273 / _3272;
            }
            float _3298 = _3287 ? _32._m1 : _3272;
            vec3 _3735;
            vec3 _3736;
            if (_3298 <= _32._m1)
            {
                float _3303 = dot(_3255, _29._m36);
                float _3305 = dot(_3295, _29._m36) / _3298;
                float _3306 = _32._m0 + 600.0;
                bool _3307 = _3298 < _3306;
                vec3 _3312;
                if (_3307)
                {
                    _3312 = _3270 * (_3306 / _3298);
                }
                else
                {
                    _3312 = _3270;
                }
                float _3313 = _3307 ? _3306 : _3298;
                float _3314 = length(_3312);
                float _3315 = dot(_3312, _3255);
                float _3317 = dot(_3312, _29._m36) / _3314;
                vec2 _3328 = vec2(_3297, _3297 + (_3296 / _3313));
                vec2 _3329 = _3328 * sqrt((0.5 / _32._m4) * _3313);
                vec2 _3332 = vec2(ivec2(sign(_3329)));
                vec2 _3333 = _3329 * _3329;
                float _3347 = -_3296;
                float _3349 = 2.0 * _3313;
                float _3351 = (_3296 / _3349) + _3297;
                float _3359 = _32._m0 - _3313;
                vec2 _3374 = _3328 * sqrt((0.5 / _32._m6) * _3313);
                vec2 _3377 = vec2(ivec2(sign(_3374)));
                vec2 _3378 = _3374 * _3374;
                vec3 _3408 = exp(((-_32._m5) * ((sqrt((6.283100128173828125 * _32._m4) * _3313) * exp(_3359 / _32._m4)) * (((_3332.y > _3332.x) ? exp(_3333.x) : 0.0) + dot((_3332 / ((abs(_3329) * 2.3192999362945556640625) + sqrt((_3333 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3347 / _32._m4) * _3351)), vec2(1.0, -1.0))))) - (_32._m8 * ((sqrt((6.283100128173828125 * _32._m6) * _3313) * exp(_3359 / _32._m6)) * (((_3377.y > _3377.x) ? exp(_3378.x) : 0.0) + dot((_3377 / ((abs(_3374) * 2.3192999362945556640625) + sqrt((_3378 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3347 / _32._m6) * _3351)), vec2(1.0, -1.0))))));
                vec3 _3409 = spvNMin(_3408, vec3(1.0));
                float _3410 = _32._m0 / _3313;
                float _3413 = sqrt(fma(-_3410, _3410, 1.0));
                float _3415 = _3297 - (-_3413);
                vec4 _3698;
                if (abs(_3415) < 0.0040000001899898052215576171875)
                {
                    float _3523 = (-0.0040000001899898052215576171875) - _3413;
                    float _3525 = fma(_3313, _3313, _3296 * _3296);
                    float _3526 = _3349 * _3296;
                    float _3528 = sqrt(fma(_3526, _3523, _3525));
                    float _3529 = fma(_3313, _3523, _3296);
                    float _3532 = -(_32._m0 * _32._m0);
                    float _3534 = sqrt(fma(_32._m1, _32._m1, _3532));
                    float _3536 = sqrt(fma(_3313, _3313, _3532));
                    float _3537 = _3313 * _3523;
                    float _3539 = -(_3313 * _3313);
                    float _3541 = fma(_32._m0, _32._m0, fma(_3537, _3537, _3539));
                    vec4 _3547 = vec4(-1.0, _3534 * _3534, _3534, 0.50390625);
                    vec4 _3548 = mix(_3547, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3537 < 0.0) && (_3541 > 0.0)));
                    float _3550 = fma(_3536 / _3534, 0.96875, 0.015625);
                    float _3560 = fma(fma(_3537, _3548.x, sqrt(_3541 + _3548.y)) / (_3536 + _3548.z), 0.4921875, _3548.w);
                    float _3566 = _3303 + 1.0;
                    float _3568 = floor(_3566 * 3.5);
                    float _3570 = fma(_3566, 3.5, -_3568);
                    float _3571 = _3568 + fma(fma(atan(spvNMax(_3305, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3572 = _3571 * 0.125;
                    float _3576 = 1.0 - _3570;
                    float _3579 = (_3571 + 1.0) * 0.125;
                    float _3586 = sqrt(fma(_3528, _3528, _3532));
                    float _3590 = fma(_32._m0, _32._m0, fma(_3529, _3529, -(_3528 * _3528)));
                    vec4 _3595 = mix(_3547, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3529 < 0.0) && (_3590 > 0.0)));
                    float _3597 = fma(_3586 / _3534, 0.96875, 0.015625);
                    float _3607 = fma(fma(_3529, _3595.x, sqrt(_3590 + _3595.y)) / (_3586 + _3595.z), 0.4921875, _3595.w);
                    float _3613 = _3568 + fma(fma(atan(spvNMax(_3317, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3614 = _3613 * 0.125;
                    float _3620 = (_3613 + 1.0) * 0.125;
                    vec4 _3626 = _3409.xyzx;
                    float _3630 = 0.0040000001899898052215576171875 - _3413;
                    float _3632 = sqrt(fma(_3526, _3630, _3525));
                    float _3633 = fma(_3313, _3630, _3296);
                    float _3634 = _3313 * _3630;
                    float _3636 = fma(_32._m0, _32._m0, fma(_3634, _3634, _3539));
                    vec4 _3641 = mix(_3547, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3634 < 0.0) && (_3636 > 0.0)));
                    float _3651 = fma(fma(_3634, _3641.x, sqrt(_3636 + _3641.y)) / (_3536 + _3641.z), 0.4921875, _3641.w);
                    float _3662 = sqrt(fma(_3632, _3632, _3532));
                    float _3666 = fma(_32._m0, _32._m0, fma(_3633, _3633, -(_3632 * _3632)));
                    vec4 _3671 = mix(_3547, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3633 < 0.0) && (_3666 > 0.0)));
                    float _3673 = fma(_3662 / _3534, 0.96875, 0.015625);
                    float _3683 = fma(fma(_3633, _3671.x, sqrt(_3666 + _3671.y)) / (_3662 + _3671.z), 0.4921875, _3671.w);
                    _3698 = mix(spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_3614, _3607, _3597), 0.0) * _3576) + (textureLod(sampler3D(_34, _7), vec3(_3620, _3607, _3597), 0.0) * _3570)), _3626, (textureLod(sampler3D(_34, _7), vec3(_3572, _3560, _3550), 0.0) * _3576) + (textureLod(sampler3D(_34, _7), vec3(_3579, _3560, _3550), 0.0) * _3570)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_3614, _3683, _3673), 0.0) * _3576) + (textureLod(sampler3D(_34, _7), vec3(_3620, _3683, _3673), 0.0) * _3570)), _3626, (textureLod(sampler3D(_34, _7), vec3(_3572, _3651, _3550), 0.0) * _3576) + (textureLod(sampler3D(_34, _7), vec3(_3579, _3651, _3550), 0.0) * _3570)), vec4(0.0)), vec4((_3415 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _3423 = -(_32._m0 * _32._m0);
                    float _3425 = sqrt(fma(_32._m1, _32._m1, _3423));
                    float _3427 = sqrt(fma(_3313, _3313, _3423));
                    float _3428 = _3313 * _3297;
                    float _3432 = fma(_32._m0, _32._m0, fma(_3428, _3428, -(_3313 * _3313)));
                    vec4 _3438 = vec4(-1.0, _3425 * _3425, _3425, 0.50390625);
                    vec4 _3439 = mix(_3438, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3428 < 0.0) && (_3432 > 0.0)));
                    float _3441 = fma(_3427 / _3425, 0.96875, 0.015625);
                    float _3451 = fma(fma(_3428, _3439.x, sqrt(_3432 + _3439.y)) / (_3427 + _3439.z), 0.4921875, _3439.w);
                    float _3457 = _3303 + 1.0;
                    float _3459 = floor(_3457 * 3.5);
                    float _3461 = fma(_3457, 3.5, -_3459);
                    float _3462 = _3459 + fma(fma(atan(spvNMax(_3305, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3467 = 1.0 - _3461;
                    float _3477 = sqrt(fma(_3314, _3314, _3423));
                    float _3481 = fma(_32._m0, _32._m0, fma(_3315, _3315, -(_3314 * _3314)));
                    vec4 _3486 = mix(_3438, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3315 < 0.0) && (_3481 > 0.0)));
                    float _3488 = fma(_3477 / _3425, 0.96875, 0.015625);
                    float _3498 = fma(fma(_3315, _3486.x, sqrt(_3481 + _3486.y)) / (_3477 + _3486.z), 0.4921875, _3486.w);
                    float _3504 = _3459 + fma(fma(atan(spvNMax(_3317, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _3698 = spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_3504 * 0.125, _3498, _3488), 0.0) * _3467) + (textureLod(sampler3D(_34, _7), vec3((_3504 + 1.0) * 0.125, _3498, _3488), 0.0) * _3461)), _3409.xyzx, (textureLod(sampler3D(_34, _7), vec3(_3462 * 0.125, _3451, _3441), 0.0) * _3467) + (textureLod(sampler3D(_34, _7), vec3((_3462 + 1.0) * 0.125, _3451, _3441), 0.0) * _3461)), vec4(0.0));
                }
                float _3713 = fma(_3303, _3303, 1.0);
                _3735 = _3409;
                _3736 = (_3698.xyz * (0.0596831031143665313720703125 * _3713)) + ((((_3698.xyz * (_3698.w * smoothstep(0.0, 0.0199999995529651641845703125, _3305))) / vec3(spvNMax(_3698.x, 9.9999997473787516355514526367188e-05))) * (vec3(_32._m5.x) / _32._m5)) * ((((0.119366206228733062744140625 * fma(-_32._m9, _32._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_32._m9 * (-2.0), _3303, fma(_32._m9, _32._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _3713) / fma(_32._m9, _32._m9, 2.0)));
            }
            else
            {
                _3735 = vec3(1.0);
                _3736 = vec3(0.0);
            }
            _3742 = _3237 * _3735;
            _3743 = fma(_3235, _3735, _3736 * ((_29._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _3742 = _3237;
            _3743 = _3235;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz) * _29._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_42, _7, _426, _rdx_dir, _468, vec2(_37._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _3743 = vec3(_rdx_vis);
            _3742 = vec3(0.0);
        }
        imageStore(_46, ivec2(_409), vec4(_3743, 1.0));
        imageStore(_47, ivec2(_409), vec4(_3742, 1.0));
        break;
    } while(false);
}

