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

struct _53
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

struct _56
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
};

struct _59
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

struct _63
{
    vec4 _m0;
    mat4x3 _m1;
    vec4 _m2[4];
    float _m3;
    float _m4;
    uint _m5;
    uint _m6;
};

struct _68
{
    mat4 _m0;
    vec2 _m1;
    float _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    float _m6;
};

float _308;
const vec4 _320[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _354;
vec3 _359;
vec3 _360;

layout(set = 1, binding = 13, std430) readonly buffer _48_6
{
    float _m0[];
} _6;

layout(set = 1, binding = 23, std430) readonly buffer _50_9
{
    ivec4 _m0[];
} _9;

layout(set = 1, binding = 24, std430) readonly buffer _52_10
{
    int _m0[];
} _10;

layout(set = 1, binding = 25, std430) readonly buffer _55_11
{
    _53 _m0[];
} _11;

layout(set = 1, binding = 28, std430) readonly buffer _58_12
{
    _56 _m0[];
} _12;

layout(set = 1, binding = 29, std430) readonly buffer _61_13
{
    layout(row_major) _59 _m0[];
} _13;

layout(set = 1, binding = 33, std430) readonly buffer _65_15
{
    layout(row_major) _63 _m0[];
} _15;

layout(set = 1, binding = 39, std140) uniform _67_21
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

layout(set = 1, binding = 40, scalar) readonly buffer _70_22
{
    layout(row_major) _68 _m0[];
} _22;

layout(set = 0, binding = 1, std140) uniform _72_28
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
} _28;

layout(set = 0, binding = 2, std140) uniform _73_29
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    vec3 _m6;
    int _m7;
} _29;

layout(set = 0, binding = 4, std140) uniform _74_30
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
} _30;

layout(set = 5, binding = 0, scalar) uniform _76_31
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
} _31;

layout(set = 1, binding = 0, scalar) uniform _77_36
{
    vec4 _m0;
    uvec2 _m1;
    uint _m2;
    uint _m3;
    uint _m4;
    uvec3 _m5;
} _36;

layout(set = 1, binding = 9, std430) readonly buffer _78_44
{
    uint _m0[];
} _44;

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
layout(set = 5, binding = 1) uniform texture2D _32;
layout(set = 5, binding = 2) uniform texture3D _33;
layout(set = 5, binding = 4) uniform texture2D _34;
layout(set = 5, binding = 5) uniform texture2D _35;
layout(set = 1, binding = 1) uniform texture2D _37;
layout(set = 1, binding = 2) uniform texture2D _38;
layout(set = 1, binding = 3) uniform texture2D _39;
layout(set = 1, binding = 4) uniform texture2D _40;
layout(set = 1, binding = 5) uniform texture2D _41;
layout(set = 1, binding = 6) uniform texture2D _42;
layout(set = 1, binding = 7) uniform texture2D _43;
layout(set = 1, binding = 10, rgba32f) uniform writeonly image2D _45;
layout(set = 1, binding = 11, rgba32f) uniform writeonly image2D _46;

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
        uint _399 = (((_36._m2 & 1u) != 0u) ? ((_36._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_36._m2 / 2u) * _36._m3);
        uint _401 = _44._m0[_399];
        uvec2 _406 = (uvec2(_401 & 65535u, _401 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_406, _30._m3)) || any(greaterThan(_406, _30._m4)))
        {
            break;
        }
        vec2 _418 = vec2(_406);
        vec2 _423 = (_418 + vec2(0.5)) / vec2(_36._m1);
        vec2 _430 = ((_423 - _30._m1) / _30._m0) * 0.5;
        float _434 = _430.x;
        float _436 = _430.y;
        ivec2 _454 = ivec3(int(_406.x), int(_406.y), 0).xy;
        vec4 _458 = texelFetch(_38, _454, 0);
        vec4 _460 = texelFetch(_39, _454, 0);
        vec4 _462 = texelFetch(_40, _454, 0);
        vec4 _464 = texelFetch(_41, _454, 0);
        float _465 = _464.x;
        vec3 _483;
        do
        {
            vec3 _471 = fma(vec3(texelFetch(_37, _454, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _472 = dot(_471, _471);
            if (_472 > 54000001024.0)
            {
                _483 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _477 = 2.0 / _472;
                vec2 _479 = _471.xy * _477;
                vec3 _480 = vec3(_479.x, _479.y, _359.z);
                _480.z = 1.0 - _477;
                _483 = _480;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _486 = _460.y;
        float _487 = _460.z;
        uint _493 = (uint(roundEven(_460.w * 255.0)) & 112u) >> 4u;
        vec3 _503 = _483 * mat3(_28._m6[0].xyz, _28._m6[1].xyz, _28._m6[2].xyz);
        vec3 _506 = vec3(_458.x, _458.y, _458.z) * (1.0 - _487);
        vec3 _511 = mix(vec3(0.1599999964237213134765625 * (_486 * _486)), _458.xyz, vec3(_487));
        float _512 = spvNMax(0.0900000035762786865234375, _460.x);
        uint _516 = uint(int(_462.x * 255.0));
        float _529 = fma(_12._m0[_516]._m2.y, _462.z, _12._m0[_516]._m2.x);
        bool _531 = _12._m0[_516]._m2.z == 1.0;
        bool _532 = !_531;
        vec3 _533 = (((_28._m7[0].xyz * ((1.0 - _434) - _436)) + (_28._m7[1].xyz * _434)) + (_28._m7[2].xyz * _436)) * _465;
        vec3 _535 = normalize(-_533);
        uint _537 = gl_SubgroupInvocationID & 3u;
        float _542 = ((_537 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _543 = (subgroupQuadSwapHorizontal(_483) - _483) * _542;
        float _548 = ((_537 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _549 = (subgroupQuadSwapVertical(_483) - _483) * _548;
        vec3 _553 = mix(_543, vec3(0.0), bvec3(any(isnan(_543))));
        vec3 _557 = mix(_549, vec3(0.0), bvec3(any(isnan(_549))));
        float _564 = sqrt(clamp(fma(_512, _512, spvNMin(dot(_553, _553) + dot(_557, _557), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _573 = ivec2(uvec2(_418) / uvec2(_21._m25));
        float _599 = _418.x;
        float _600 = _418.y;
        float _605 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _599, 0.005837149918079376220703125 * _600)));
        float _612 = clamp(fma(_21._m34.y, length(_533), _21._m34.x), 0.0, 1.0);
        uint _613 = uint(int(fma(fma(float(int(clamp(fma(log2(_465 * _29._m4), _21._m21, _21._m22), 0.0, float(_21._m26)))), _21._m24, float(_573.y)), _21._m23, float(_573.x))));
        uvec4 _616 = uvec4(_9._m0[_613]);
        uint _617 = _616.x;
        uint _618 = _616.y;
        uint _621 = ((_618 >> 0u) & 4095u) + _617;
        uint _624 = ((_618 >> 12u) & 4095u) + _621;
        uint _628 = ((_616.z >> 0u) & 1023u) + _624;
        float _629 = dot(_503, _535);
        float _630 = spvNMax(_629, 9.9999997473787516355514526367188e-06);
        float _632;
        bool _635;
        vec3 _637;
        vec3 _639;
        uint _641;
        _632 = _308;
        _635 = false;
        _637 = vec3(0.0);
        _639 = vec3(0.0);
        _641 = _617;
        float _633;
        bool _636;
        vec3 _638;
        vec3 _640;
        for (; _641 < _621; _632 = _633, _635 = _636, _637 = _638, _639 = _640, _641++)
        {
            uint _648 = uint(_10._m0[_641]);
            float _666 = abs(_11._m0[_648]._m5);
            bool _670 = _11._m0[_648]._m5 < 0.0;
            if ((_11._m0[_648]._m6 & (1u << (_493 & 31u))) != 0u)
            {
                vec3 _681 = _11._m0[_648]._m0.xyz - _533;
                float _682 = dot(_681, _681);
                vec3 _685 = _681 * inversesqrt(spvNMax(_682, 1.0000000133514319600180897396058e-10));
                float _686 = _11._m0[_648]._m0.w * _11._m0[_648]._m0.w;
                float _1073;
                bool _1074;
                vec3 _1075;
                vec3 _1076;
                if (_682 < (1.0 / _686))
                {
                    vec3 _691 = _535 + _685;
                    vec3 _695 = _691 * inversesqrt(spvNMax(dot(_691, _691), 1.0000000133514319600180897396058e-10));
                    float _697 = clamp(dot(_685, _695), 0.0, 1.0);
                    float _699 = clamp(dot(_503, _695), 0.0, 1.0);
                    float _700 = dot(_503, _685);
                    float _701 = clamp(_700, 0.0, 1.0);
                    float _702 = _682 * _686;
                    float _708 = pow(spvNMax(abs(clamp(fma(-_702, _702, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_648]._m4);
                    float _718;
                    if (_670)
                    {
                        _718 = _708 * fma(4.0, _686, _666);
                    }
                    else
                    {
                        _718 = _708 * ((1.0 / spvNMax(_682, 9.9999997473787516355514526367188e-05)) + _666);
                    }
                    float _720 = 0.079577468335628509521484375 * (_701 * _718);
                    float _886;
                    bool _887;
                    float _888;
                    float _889;
                    float _890;
                    if ((_11._m0[_648]._m7 & 1u) != 0u)
                    {
                        uint _745;
                        do
                        {
                            vec3 _725 = -_685;
                            float _726 = dot(_725, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                            float _727 = dot(_725, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                            float _728 = dot(_725, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                            float _732 = spvNMax(spvNMax(_726, _727), spvNMax(_728, dot(_725, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                            if (_732 == _726)
                            {
                                _745 = 0u;
                                break;
                            }
                            else
                            {
                                if (_732 == _727)
                                {
                                    _745 = 1u;
                                    break;
                                }
                                else
                                {
                                    if (_732 == _728)
                                    {
                                        _745 = 2u;
                                        break;
                                    }
                                    else
                                    {
                                        _745 = 3u;
                                        break;
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            }
                            break; // unreachable workaround
                        } while(false);
                        uint _747 = uint(int(_11._m0[_648]._m7 >> 2u)) + _745;
                        float _760 = sqrt(_682);
                        float _850;
                        bool _851;
                        float _852;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_700 <= 0.0) && (!_532))
                            {
                                _850 = _632;
                                _851 = _635;
                                _852 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _781 = _22._m0[_747]._m0 * vec4(_533 + (_503 * ((3.5 * float(int(sign(_700)))) * (_22._m0[_747]._m4 * _760))), 1.0);
                                vec3 _785 = _781.xyz / vec3(_781.w);
                                vec2 _788 = (_785.xy * 0.5) + vec2(0.5);
                                _788.y = 1.0 - _788.y;
                                float _797 = (_22._m0[_747]._m5.y / _22._m0[_747]._m6) / (_785.z - _22._m0[_747]._m5.x);
                                float _802 = _635 ? _632 : 6.283185482025146484375;
                                float _803 = _605 * _802;
                                vec2 _804 = _22._m0[_747]._m1 + _21._m33;
                                vec2 _807 = (_22._m0[_747]._m1 + vec2(_22._m0[_747]._m2)) - _21._m33;
                                float _809;
                                _809 = 0.0;
                                for (int _812 = 0; _812 < 12; )
                                {
                                    float _817 = float(uint(_812));
                                    float _820 = sqrt(_817 + 0.5) * 0.288675129413604736328125;
                                    float _821 = fma(_817, 2.3999631404876708984375, _803);
                                    vec2 _829 = clamp(fma((vec3(cos(_821), sin(_821), _820).xy * _820) * 2.5, _21._m33, _788), _804, _807);
                                    vec2 _832 = fract(fma(vec2(1.0) / _21._m33, _829, vec2(0.5)));
                                    vec4 _838 = vec4(lessThan(vec4(_797), textureGather(sampler2D(_23, _14), _829)));
                                    float _841 = _832.x;
                                    _809 += clamp(mix(mix(_838.w, _838.z, _841), mix(_838.x, _838.y, _841), _832.y), 0.0, 1.0);
                                    _812++;
                                    continue;
                                }
                                _850 = _802;
                                _851 = _635 ? _635 : true;
                                _852 = _809 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        float _854 = mix(1.0, _852, spvNMin(_612, _11._m0[_648]._m8));
                        float _885;
                        SPIRV_CROSS_BRANCH
                        if (_531)
                        {
                            float _858 = _22._m0[_747]._m4 * _760;
                            vec4 _865 = _22._m0[_747]._m0 * vec4(_533 - (_503 * _858), 1.0);
                            float _866 = _865.w;
                            _885 = fma(_858, clamp(dot(-_503, _685), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_865.xyz / vec3(_866)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_747]._m6, _866))) * 1000.0;
                        }
                        else
                        {
                            _885 = 0.0;
                        }
                        _886 = _850;
                        _887 = _851;
                        _888 = _720 * _854;
                        _889 = _885;
                        _890 = _854;
                    }
                    else
                    {
                        _886 = _632;
                        _887 = _635;
                        _888 = _720;
                        _889 = 0.0;
                        _890 = 1.0;
                    }
                    vec3 _894 = vec3(1.0) / spvNMax((_12._m0[_516]._m0.xyz * vec3(0.09660939872264862060546875)) * _12._m0[_516]._m0.w, vec3(9.9999997473787516355514526367188e-05));
                    vec3 _912;
                    SPIRV_CROSS_BRANCH
                    if (_531)
                    {
                        vec3 _908 = exp2(_894 * ((-0.4808983504772186279296875) * spvNMax(_529, _889)));
                        _912 = _12._m0[_516]._m1.xyz * (_908 * fma(_908, _908, vec3(3.0)));
                    }
                    else
                    {
                        vec3 _900 = exp2(_894 * ((-0.4808983504772186279296875) * _529));
                        _912 = (_12._m0[_516]._m1.xyz * (_900 * fma(_900, _900, vec3(3.0)))) * _890;
                    }
                    float _925;
                    if (_670)
                    {
                        _925 = _708 * fma(4.0, _686, _666);
                    }
                    else
                    {
                        _925 = _708 * ((1.0 / spvNMax(_682, 9.9999997473787516355514526367188e-05)) + _666);
                    }
                    float _926 = clamp((0.2588190734386444091796875 - _700) * 0.631063938140869140625, 0.0, 1.0) * _925;
                    vec3 _1071;
                    vec3 _1072;
                    SPIRV_CROSS_BRANCH
                    if (_11._m0[_648]._m3 < 0.0)
                    {
                        vec3 _1063;
                        vec3 _1064;
                        if (_701 > 0.0)
                        {
                            vec3 _1004 = (_11._m0[_648]._m1.xyz * _888) * _6._m0[0u];
                            vec3 _1011 = vec3(fma((2.0 * _697) * _697, _564, mix(0.0, 0.5, _564))) - vec3(1.0);
                            float _1032 = (_564 + 1.0) * 0.5;
                            float _1033 = _564 * _564;
                            float _1041 = _1032 * _1032;
                            float _1053 = _1033 * _1033;
                            float _1056 = fma(fma(_699, _1053, -_699), _699, 1.0);
                            _1063 = fma(_1004, (_511 + ((vec3(1.0) - _511) * pow(spvNMax(abs(1.0 - _697), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_701, sqrt(fma(fma(-_630, _1041, _630), _630, _1041)), _630 * sqrt(fma(fma(-_701, _1041, _701), _701, _1041)))) * (_1053 * (0.3183098733425140380859375 / (_1056 * _1056)))), _637);
                            _1064 = fma(_1004, _506 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1011 * pow(spvNMax(abs(1.0 - _701), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1011 * pow(spvNMax(abs(1.0 - _630), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _564))), _639);
                        }
                        else
                        {
                            _1063 = _637;
                            _1064 = _639;
                        }
                        _1071 = _1063;
                        _1072 = _1064 + (((_912 * _11._m0[_648]._m1.xyz) * _506) * ((_926 * 0.0253302939236164093017578125) * _6._m0[0u]));
                    }
                    else
                    {
                        vec3 _993;
                        vec3 _994;
                        if (_701 > 0.0)
                        {
                            vec3 _934 = (_11._m0[_648]._m1.xyz * _888) * 1.0;
                            vec3 _941 = vec3(fma((2.0 * _697) * _697, _564, mix(0.0, 0.5, _564))) - vec3(1.0);
                            float _962 = (_564 + 1.0) * 0.5;
                            float _963 = _564 * _564;
                            float _971 = _962 * _962;
                            float _983 = _963 * _963;
                            float _986 = fma(fma(_699, _983, -_699), _699, 1.0);
                            _993 = fma(_934, (_511 + ((vec3(1.0) - _511) * pow(spvNMax(abs(1.0 - _697), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_701, sqrt(fma(fma(-_630, _971, _630), _630, _971)), _630 * sqrt(fma(fma(-_701, _971, _701), _701, _971)))) * (_983 * (0.3183098733425140380859375 / (_986 * _986)))), _637);
                            _994 = fma(_934, _506 * (0.3183098733425140380859375 * (((vec3(1.0) + (_941 * pow(spvNMax(abs(1.0 - _701), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_941 * pow(spvNMax(abs(1.0 - _630), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _564))), _639);
                        }
                        else
                        {
                            _993 = _637;
                            _994 = _639;
                        }
                        _1071 = _993;
                        _1072 = _994 + (((_912 * _11._m0[_648]._m1.xyz) * _506) * (_926 * 0.0253302939236164093017578125));
                    }
                    _1073 = _886;
                    _1074 = _887;
                    _1075 = _1071;
                    _1076 = _1072;
                }
                else
                {
                    _1073 = _632;
                    _1074 = _635;
                    _1075 = _637;
                    _1076 = _639;
                }
                _633 = _1073;
                _636 = _1074;
                _638 = _1075;
                _640 = _1076;
            }
            else
            {
                _633 = _632;
                _636 = _635;
                _638 = _637;
                _640 = _639;
            }
        }
        float _1078;
        bool _1081;
        vec3 _1083;
        vec3 _1085;
        uint _1087;
        _1078 = _632;
        _1081 = _635;
        _1083 = _637;
        _1085 = _639;
        _1087 = _641;
        float _1079;
        bool _1082;
        vec3 _1084;
        vec3 _1086;
        for (; _1087 < _624; _1078 = _1079, _1081 = _1082, _1083 = _1084, _1085 = _1086, _1087++)
        {
            uint _1094 = uint(_10._m0[_1087]);
            float _1107 = abs(_11._m0[_1094]._m5);
            bool _1114 = _11._m0[_1094]._m5 < 0.0;
            if ((_11._m0[_1094]._m6 & (1u << (_493 & 31u))) != 0u)
            {
                vec3 _1125 = _11._m0[_1094]._m0.xyz - _533;
                float _1126 = dot(_1125, _1125);
                vec3 _1129 = _1125 * inversesqrt(spvNMax(_1126, 1.0000000133514319600180897396058e-10));
                float _1130 = _11._m0[_1094]._m0.w * _11._m0[_1094]._m0.w;
                float _1526;
                bool _1527;
                vec3 _1528;
                vec3 _1529;
                if (_1126 < (1.0 / _1130))
                {
                    vec3 _1135 = _535 + _1129;
                    vec3 _1139 = _1135 * inversesqrt(spvNMax(dot(_1135, _1135), 1.0000000133514319600180897396058e-10));
                    float _1141 = clamp(dot(_1129, _1139), 0.0, 1.0);
                    float _1143 = clamp(dot(_503, _1139), 0.0, 1.0);
                    float _1144 = dot(_503, _1129);
                    float _1145 = clamp(_1144, 0.0, 1.0);
                    float _1148 = dot(-_1129, normalize(_11._m0[_1094]._m2.xyz));
                    bool _1149 = _1148 > _11._m0[_1094]._m1.w;
                    float _1177;
                    if (_1149)
                    {
                        float _1152 = _1126 * _1130;
                        float _1158 = pow(spvNMax(abs(clamp(fma(-_1152, _1152, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1094]._m4);
                        float _1168;
                        if (_1114)
                        {
                            _1168 = _1158 * fma(4.0, _1130, _1107);
                        }
                        else
                        {
                            _1168 = _1158 * ((1.0 / spvNMax(_1126, 9.9999997473787516355514526367188e-05)) + _1107);
                        }
                        float _1173 = clamp((_1148 - _11._m0[_1094]._m1.w) / spvNMax(_11._m0[_1094]._m2.w - _11._m0[_1094]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1177 = _1145 * (_1168 * (_1173 * _1173));
                    }
                    else
                    {
                        _1177 = 0.0;
                    }
                    float _1178 = 0.3183098733425140380859375 * _1177;
                    float _1320;
                    bool _1321;
                    float _1322;
                    float _1323;
                    float _1324;
                    if ((_11._m0[_1094]._m7 & 1u) != 0u)
                    {
                        uint _1181 = uint(int(_11._m0[_1094]._m7 >> 2u));
                        float _1194 = sqrt(_1126);
                        float _1284;
                        bool _1285;
                        float _1286;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1144 <= 0.0) && (!_532))
                            {
                                _1284 = _1078;
                                _1285 = _1081;
                                _1286 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1215 = _22._m0[_1181]._m0 * vec4(_533 + (_503 * ((3.5 * float(int(sign(_1144)))) * (_22._m0[_1181]._m4 * _1194))), 1.0);
                                vec3 _1219 = _1215.xyz / vec3(_1215.w);
                                vec2 _1222 = (_1219.xy * 0.5) + vec2(0.5);
                                _1222.y = 1.0 - _1222.y;
                                float _1231 = (_22._m0[_1181]._m5.y / _22._m0[_1181]._m6) / (_1219.z - _22._m0[_1181]._m5.x);
                                float _1236 = _1081 ? _1078 : 6.283185482025146484375;
                                float _1237 = _605 * _1236;
                                vec2 _1238 = _22._m0[_1181]._m1 + _21._m33;
                                vec2 _1241 = (_22._m0[_1181]._m1 + vec2(_22._m0[_1181]._m2)) - _21._m33;
                                float _1243;
                                _1243 = 0.0;
                                for (int _1246 = 0; _1246 < 12; )
                                {
                                    float _1251 = float(uint(_1246));
                                    float _1254 = sqrt(_1251 + 0.5) * 0.288675129413604736328125;
                                    float _1255 = fma(_1251, 2.3999631404876708984375, _1237);
                                    vec2 _1263 = clamp(fma((vec3(cos(_1255), sin(_1255), _1254).xy * _1254) * 2.5, _21._m33, _1222), _1238, _1241);
                                    vec2 _1266 = fract(fma(vec2(1.0) / _21._m33, _1263, vec2(0.5)));
                                    vec4 _1272 = vec4(lessThan(vec4(_1231), textureGather(sampler2D(_23, _14), _1263)));
                                    float _1275 = _1266.x;
                                    _1243 += clamp(mix(mix(_1272.w, _1272.z, _1275), mix(_1272.x, _1272.y, _1275), _1266.y), 0.0, 1.0);
                                    _1246++;
                                    continue;
                                }
                                _1284 = _1236;
                                _1285 = _1081 ? _1081 : true;
                                _1286 = _1243 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        float _1288 = mix(1.0, _1286, spvNMin(_612, _11._m0[_1094]._m8));
                        float _1319;
                        SPIRV_CROSS_BRANCH
                        if (_531)
                        {
                            float _1292 = _22._m0[_1181]._m4 * _1194;
                            vec4 _1299 = _22._m0[_1181]._m0 * vec4(_533 - (_503 * _1292), 1.0);
                            float _1300 = _1299.w;
                            _1319 = fma(_1292, clamp(dot(-_503, _1129), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_1299.xyz / vec3(_1300)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1181]._m6, _1300))) * 1000.0;
                        }
                        else
                        {
                            _1319 = 0.0;
                        }
                        _1320 = _1284;
                        _1321 = _1285;
                        _1322 = _1178 * _1288;
                        _1323 = _1319;
                        _1324 = _1288;
                    }
                    else
                    {
                        _1320 = _1078;
                        _1321 = _1081;
                        _1322 = _1178;
                        _1323 = 0.0;
                        _1324 = 1.0;
                    }
                    vec3 _1328 = vec3(1.0) / spvNMax((_12._m0[_516]._m0.xyz * vec3(0.09660939872264862060546875)) * _12._m0[_516]._m0.w, vec3(9.9999997473787516355514526367188e-05));
                    vec3 _1346;
                    SPIRV_CROSS_BRANCH
                    if (_531)
                    {
                        vec3 _1342 = exp2(_1328 * ((-0.4808983504772186279296875) * spvNMax(_529, _1323)));
                        _1346 = _12._m0[_516]._m1.xyz * (_1342 * fma(_1342, _1342, vec3(3.0)));
                    }
                    else
                    {
                        vec3 _1334 = exp2(_1328 * ((-0.4808983504772186279296875) * _529));
                        _1346 = (_12._m0[_516]._m1.xyz * (_1334 * fma(_1334, _1334, vec3(3.0)))) * _1324;
                    }
                    float _1379;
                    if (_1149)
                    {
                        float _1354 = _1126 * _1130;
                        float _1360 = pow(spvNMax(abs(clamp(fma(-_1354, _1354, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1094]._m4);
                        float _1370;
                        if (_1114)
                        {
                            _1370 = _1360 * fma(4.0, _1130, _1107);
                        }
                        else
                        {
                            _1370 = _1360 * ((1.0 / spvNMax(_1126, 9.9999997473787516355514526367188e-05)) + _1107);
                        }
                        float _1375 = clamp((_1148 - _11._m0[_1094]._m1.w) / spvNMax(_11._m0[_1094]._m2.w - _11._m0[_1094]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1379 = clamp((dot(-_503, _1129) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * (_1370 * (_1375 * _1375));
                    }
                    else
                    {
                        _1379 = 0.0;
                    }
                    vec3 _1524;
                    vec3 _1525;
                    SPIRV_CROSS_BRANCH
                    if (_11._m0[_1094]._m3 < 0.0)
                    {
                        vec3 _1516;
                        vec3 _1517;
                        if (_1145 > 0.0)
                        {
                            vec3 _1457 = (_11._m0[_1094]._m1.xyz * _1322) * _6._m0[0u];
                            vec3 _1464 = vec3(fma((2.0 * _1141) * _1141, _564, mix(0.0, 0.5, _564))) - vec3(1.0);
                            float _1485 = (_564 + 1.0) * 0.5;
                            float _1486 = _564 * _564;
                            float _1494 = _1485 * _1485;
                            float _1506 = _1486 * _1486;
                            float _1509 = fma(fma(_1143, _1506, -_1143), _1143, 1.0);
                            _1516 = fma(_1457, (_511 + ((vec3(1.0) - _511) * pow(spvNMax(abs(1.0 - _1141), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1145, sqrt(fma(fma(-_630, _1494, _630), _630, _1494)), _630 * sqrt(fma(fma(-_1145, _1494, _1145), _1145, _1494)))) * (_1506 * (0.3183098733425140380859375 / (_1509 * _1509)))), _1083);
                            _1517 = fma(_1457, _506 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1464 * pow(spvNMax(abs(1.0 - _1145), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1464 * pow(spvNMax(abs(1.0 - _630), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _564))), _1085);
                        }
                        else
                        {
                            _1516 = _1083;
                            _1517 = _1085;
                        }
                        _1524 = _1516;
                        _1525 = _1517 + (((_1346 * _11._m0[_1094]._m1.xyz) * _506) * ((_1379 * 0.10132117569446563720703125) * _6._m0[0u]));
                    }
                    else
                    {
                        vec3 _1446;
                        vec3 _1447;
                        if (_1145 > 0.0)
                        {
                            vec3 _1387 = (_11._m0[_1094]._m1.xyz * _1322) * 1.0;
                            vec3 _1394 = vec3(fma((2.0 * _1141) * _1141, _564, mix(0.0, 0.5, _564))) - vec3(1.0);
                            float _1415 = (_564 + 1.0) * 0.5;
                            float _1416 = _564 * _564;
                            float _1424 = _1415 * _1415;
                            float _1436 = _1416 * _1416;
                            float _1439 = fma(fma(_1143, _1436, -_1143), _1143, 1.0);
                            _1446 = fma(_1387, (_511 + ((vec3(1.0) - _511) * pow(spvNMax(abs(1.0 - _1141), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1145, sqrt(fma(fma(-_630, _1424, _630), _630, _1424)), _630 * sqrt(fma(fma(-_1145, _1424, _1145), _1145, _1424)))) * (_1436 * (0.3183098733425140380859375 / (_1439 * _1439)))), _1083);
                            _1447 = fma(_1387, _506 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1394 * pow(spvNMax(abs(1.0 - _1145), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1394 * pow(spvNMax(abs(1.0 - _630), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _564))), _1085);
                        }
                        else
                        {
                            _1446 = _1083;
                            _1447 = _1085;
                        }
                        _1524 = _1446;
                        _1525 = _1447 + (((_1346 * _11._m0[_1094]._m1.xyz) * _506) * (_1379 * 0.10132117569446563720703125));
                    }
                    _1526 = _1320;
                    _1527 = _1321;
                    _1528 = _1524;
                    _1529 = _1525;
                }
                else
                {
                    _1526 = _1078;
                    _1527 = _1081;
                    _1528 = _1083;
                    _1529 = _1085;
                }
                _1079 = _1526;
                _1082 = _1527;
                _1084 = _1528;
                _1086 = _1529;
            }
            else
            {
                _1079 = _1078;
                _1082 = _1081;
                _1084 = _1083;
                _1086 = _1085;
            }
        }
        vec3 _1536;
        vec3 _1538;
        _1536 = _1083;
        _1538 = _1085;
        float _1532;
        bool _1535;
        vec3 _1537;
        vec3 _1539;
        float _1531 = _1078;
        bool _1534 = _1081;
        uint _1540 = _1087;
        for (; _1540 < _628; _1531 = _1532, _1534 = _1535, _1536 = _1537, _1538 = _1539, _1540++)
        {
            uint _1547 = uint(_10._m0[_1540]);
            int _1576 = int(_13._m0[_1547]._m1 >> 1u) - 1;
            if (((_13._m0[_1547]._m4 & 16777215u) & (1u << (_493 & 31u))) != 0u)
            {
                vec3 _1587 = _13._m0[_1547]._m6 * vec4(_533, 1.0);
                float _2103;
                bool _2104;
                vec3 _2105;
                vec3 _2106;
                if (all(lessThan(abs(_1587 - vec3(0.5)), vec3(0.5))))
                {
                    vec3 _1594 = _535 + _13._m0[_1547]._m9;
                    vec3 _1598 = _1594 * inversesqrt(spvNMax(dot(_1594, _1594), 1.0000000133514319600180897396058e-10));
                    float _1600 = clamp(dot(_13._m0[_1547]._m9, _1598), 0.0, 1.0);
                    float _1602 = clamp(dot(_503, _1598), 0.0, 1.0);
                    float _1603 = dot(_503, _13._m0[_1547]._m9);
                    float _1604 = clamp(_1603, 0.0, 1.0);
                    int _1605 = int(_13._m0[_1547]._m4 >> 24u);
                    float _1606 = _1587.z;
                    bool _1608 = _1606 < _13._m0[_1547]._m2.x;
                    vec3 _1645;
                    if (_1608)
                    {
                        float _1633 = _1606 * _13._m0[_1547]._m2.z;
                        float _1636 = _1633 * _1633;
                        vec3 _1644;
                        _1644.z = dot(_320[_1605], vec4(_1633, _1636, smoothstep(0.0, 1.0, _1633), (_1636 * _1633) * fma(_1633, fma(_1633, 6.0, -15.0), 10.0)));
                        _1645 = _1644;
                    }
                    else
                    {
                        vec3 _1631;
                        if (_1606 > _13._m0[_1547]._m2.y)
                        {
                            float _1619 = (1.0 - _1606) * _13._m0[_1547]._m2.w;
                            float _1622 = _1619 * _1619;
                            vec3 _1630;
                            _1630.z = dot(_320[_1605], vec4(_1619, _1622, smoothstep(0.0, 1.0, _1619), (_1622 * _1619) * fma(_1619, fma(_1619, 6.0, -15.0), 10.0)));
                            _1631 = _1630;
                        }
                        else
                        {
                            _1631 = vec3(0.0, 0.0, 1.0);
                        }
                        _1645 = _1631;
                    }
                    vec2 _1646 = _1587.xy;
                    vec2 _1650 = (vec2(0.5) - abs(_1646 - vec2(0.5))) * _13._m0[_1547]._m3;
                    float _1651 = _1650.x;
                    bool _1652 = _1651 < 1.0;
                    vec3 _1668;
                    if (_1652)
                    {
                        float _1659 = _1651 * _1651;
                        vec3 _1667 = _1645;
                        _1667.x = dot(_320[_1605], vec4(_1651, _1659, smoothstep(0.0, 1.0, _1651), (_1659 * _1651) * fma(_1651, fma(_1651, 6.0, -15.0), 10.0)));
                        _1668 = _1667;
                    }
                    else
                    {
                        vec3 _1656 = _1645;
                        _1656.x = 1.0;
                        _1668 = _1656;
                    }
                    float _1669 = _1650.y;
                    bool _1670 = _1669 < 1.0;
                    vec3 _1686;
                    if (_1670)
                    {
                        float _1677 = _1669 * _1669;
                        vec3 _1685 = _1668;
                        _1685.y = dot(_320[_1605], vec4(_1669, _1677, smoothstep(0.0, 1.0, _1669), (_1677 * _1669) * fma(_1669, fma(_1669, 6.0, -15.0), 10.0)));
                        _1686 = _1685;
                    }
                    else
                    {
                        vec3 _1674 = _1668;
                        _1674.y = 1.0;
                        _1686 = _1674;
                    }
                    float _1692 = _1604 * ((_1686.x * _1686.y) * _1686.z);
                    float _1828;
                    bool _1829;
                    float _1830;
                    float _1831;
                    float _1832;
                    if ((_13._m0[_1547]._m8 & 1u) != 0u)
                    {
                        uint _1695 = uint(int(_13._m0[_1547]._m8 >> 2u));
                        float _1792;
                        bool _1793;
                        float _1794;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1603 <= 0.0) && (!_532))
                            {
                                _1792 = _1531;
                                _1793 = _1534;
                                _1794 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1727 = _22._m0[_1695]._m0 * vec4(_533 + (_503 * ((3.5 * float(int(sign(_1603)))) * _22._m0[_1695]._m4)), 1.0);
                                vec2 _1730 = (_1727.xy * 0.5) + vec2(0.5);
                                _1730.y = 1.0 - _1730.y;
                                float _1739 = ((_1727.z - _22._m0[_1695]._m5.y) / _22._m0[_1695]._m5.x) / _22._m0[_1695]._m6;
                                float _1744 = _1534 ? _1531 : 6.283185482025146484375;
                                float _1745 = _605 * _1744;
                                vec2 _1746 = _22._m0[_1695]._m1 + _21._m33;
                                vec2 _1749 = (_22._m0[_1695]._m1 + vec2(_22._m0[_1695]._m2)) - _21._m33;
                                float _1751;
                                _1751 = 0.0;
                                for (int _1754 = 0; _1754 < 12; )
                                {
                                    float _1759 = float(uint(_1754));
                                    float _1762 = sqrt(_1759 + 0.5) * 0.288675129413604736328125;
                                    float _1763 = fma(_1759, 2.3999631404876708984375, _1745);
                                    vec2 _1771 = clamp(fma((vec3(cos(_1763), sin(_1763), _1762).xy * _1762) * 2.5, _21._m33, _1730), _1746, _1749);
                                    vec2 _1774 = fract(fma(vec2(1.0) / _21._m33, _1771, vec2(0.5)));
                                    vec4 _1780 = vec4(lessThan(vec4(_1739), textureGather(sampler2D(_23, _14), _1771)));
                                    float _1783 = _1774.x;
                                    _1751 += clamp(mix(mix(_1780.w, _1780.z, _1783), mix(_1780.x, _1780.y, _1783), _1774.y), 0.0, 1.0);
                                    _1754++;
                                    continue;
                                }
                                _1792 = _1744;
                                _1793 = _1534 ? _1534 : true;
                                _1794 = _1751 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        float _1796 = mix(1.0, _1794, spvNMin(_612, _13._m0[_1547]._m5));
                        float _1827;
                        SPIRV_CROSS_BRANCH
                        if (_531)
                        {
                            vec4 _1806 = _22._m0[_1695]._m0 * vec4(_533 - (_503 * _22._m0[_1695]._m4), 1.0);
                            _1827 = fma(_22._m0[_1695]._m4, clamp(dot(-_503, _13._m0[_1547]._m9), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma(_1806.xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1695]._m6, (_1806.z - _22._m0[_1695]._m5.y) / _22._m0[_1695]._m5.x))) * 1000.0;
                        }
                        else
                        {
                            _1827 = 0.0;
                        }
                        _1828 = _1792;
                        _1829 = _1793;
                        _1830 = _1692 * _1796;
                        _1831 = _1827;
                        _1832 = _1796;
                    }
                    else
                    {
                        _1828 = _1531;
                        _1829 = _1534;
                        _1830 = _1692;
                        _1831 = 0.0;
                        _1832 = 1.0;
                    }
                    vec3 _1836 = vec3(1.0) / spvNMax((_12._m0[_516]._m0.xyz * vec3(0.09660939872264862060546875)) * _12._m0[_516]._m0.w, vec3(9.9999997473787516355514526367188e-05));
                    vec3 _1854;
                    SPIRV_CROSS_BRANCH
                    if (_531)
                    {
                        vec3 _1850 = exp2(_1836 * ((-0.4808983504772186279296875) * spvNMax(_529, _1831)));
                        _1854 = _12._m0[_516]._m1.xyz * (_1850 * fma(_1850, _1850, vec3(3.0)));
                    }
                    else
                    {
                        vec3 _1842 = exp2(_1836 * ((-0.4808983504772186279296875) * _529));
                        _1854 = (_12._m0[_516]._m1.xyz * (_1842 * fma(_1842, _1842, vec3(3.0)))) * _1832;
                    }
                    vec3 _1896;
                    if (_1608)
                    {
                        float _1884 = _1606 * _13._m0[_1547]._m2.z;
                        float _1887 = _1884 * _1884;
                        vec3 _1895;
                        _1895.z = dot(_320[_1605], vec4(_1884, _1887, smoothstep(0.0, 1.0, _1884), (_1887 * _1884) * fma(_1884, fma(_1884, 6.0, -15.0), 10.0)));
                        _1896 = _1895;
                    }
                    else
                    {
                        vec3 _1882;
                        if (_1606 > _13._m0[_1547]._m2.y)
                        {
                            float _1870 = (1.0 - _1606) * _13._m0[_1547]._m2.w;
                            float _1873 = _1870 * _1870;
                            vec3 _1881;
                            _1881.z = dot(_320[_1605], vec4(_1870, _1873, smoothstep(0.0, 1.0, _1870), (_1873 * _1870) * fma(_1870, fma(_1870, 6.0, -15.0), 10.0)));
                            _1882 = _1881;
                        }
                        else
                        {
                            _1882 = vec3(0.0, 0.0, 1.0);
                        }
                        _1896 = _1882;
                    }
                    vec3 _1912;
                    if (_1652)
                    {
                        float _1903 = _1651 * _1651;
                        vec3 _1911 = _1896;
                        _1911.x = dot(_320[_1605], vec4(_1651, _1903, smoothstep(0.0, 1.0, _1651), (_1903 * _1651) * fma(_1651, fma(_1651, 6.0, -15.0), 10.0)));
                        _1912 = _1911;
                    }
                    else
                    {
                        vec3 _1900 = _1896;
                        _1900.x = 1.0;
                        _1912 = _1900;
                    }
                    vec3 _1928;
                    if (_1670)
                    {
                        float _1919 = _1669 * _1669;
                        vec3 _1927 = _1912;
                        _1927.y = dot(_320[_1605], vec4(_1669, _1919, smoothstep(0.0, 1.0, _1669), (_1919 * _1669) * fma(_1669, fma(_1669, 6.0, -15.0), 10.0)));
                        _1928 = _1927;
                    }
                    else
                    {
                        vec3 _1916 = _1912;
                        _1916.y = 1.0;
                        _1928 = _1916;
                    }
                    float _1934 = clamp((dot(-_503, _13._m0[_1547]._m9) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * ((_1928.x * _1928.y) * _1928.z);
                    vec3 _1956;
                    if (_1576 >= 0)
                    {
                        vec2 _1940 = (subgroupQuadSwapHorizontal(_1646) - _1646) * _542;
                        vec2 _1943 = (subgroupQuadSwapVertical(_1646) - _1646) * _548;
                        int _79 = _1576;
                        _1956 = _13._m0[_1547]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_79], _7)), _1646, mix(_1940, vec2(0.0), bvec2(any(isnan(_1940)))), mix(_1943, vec2(0.0), bvec2(any(isnan(_1943))))).xyz;
                    }
                    else
                    {
                        _1956 = _13._m0[_1547]._m0;
                    }
                    vec3 _2101;
                    vec3 _2102;
                    SPIRV_CROSS_BRANCH
                    if ((_13._m0[_1547]._m1 & 1u) != 0u)
                    {
                        vec3 _2093;
                        vec3 _2094;
                        if (_1604 > 0.0)
                        {
                            vec3 _2034 = (_1956 * _1830) * _6._m0[0u];
                            vec3 _2041 = vec3(fma((2.0 * _1600) * _1600, _564, mix(0.0, 0.5, _564))) - vec3(1.0);
                            float _2062 = (_564 + 1.0) * 0.5;
                            float _2063 = _564 * _564;
                            float _2071 = _2062 * _2062;
                            float _2083 = _2063 * _2063;
                            float _2086 = fma(fma(_1602, _2083, -_1602), _1602, 1.0);
                            _2093 = fma(_2034, (_511 + ((vec3(1.0) - _511) * pow(spvNMax(abs(1.0 - _1600), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1604, sqrt(fma(fma(-_630, _2071, _630), _630, _2071)), _630 * sqrt(fma(fma(-_1604, _2071, _1604), _1604, _2071)))) * (_2083 * (0.3183098733425140380859375 / (_2086 * _2086)))), _1536);
                            _2094 = fma(_2034, _506 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2041 * pow(spvNMax(abs(1.0 - _1604), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2041 * pow(spvNMax(abs(1.0 - _630), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _564))), _1538);
                        }
                        else
                        {
                            _2093 = _1536;
                            _2094 = _1538;
                        }
                        _2101 = _2093;
                        _2102 = _2094 + (((_1854 * _1956) * _506) * ((0.3183098733425140380859375 * _1934) * _6._m0[0u]));
                    }
                    else
                    {
                        vec3 _2023;
                        vec3 _2024;
                        if (_1604 > 0.0)
                        {
                            vec3 _1964 = (_1956 * _1830) * 1.0;
                            vec3 _1971 = vec3(fma((2.0 * _1600) * _1600, _564, mix(0.0, 0.5, _564))) - vec3(1.0);
                            float _1992 = (_564 + 1.0) * 0.5;
                            float _1993 = _564 * _564;
                            float _2001 = _1992 * _1992;
                            float _2013 = _1993 * _1993;
                            float _2016 = fma(fma(_1602, _2013, -_1602), _1602, 1.0);
                            _2023 = fma(_1964, (_511 + ((vec3(1.0) - _511) * pow(spvNMax(abs(1.0 - _1600), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1604, sqrt(fma(fma(-_630, _2001, _630), _630, _2001)), _630 * sqrt(fma(fma(-_1604, _2001, _1604), _1604, _2001)))) * (_2013 * (0.3183098733425140380859375 / (_2016 * _2016)))), _1536);
                            _2024 = fma(_1964, _506 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1971 * pow(spvNMax(abs(1.0 - _1604), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1971 * pow(spvNMax(abs(1.0 - _630), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _564))), _1538);
                        }
                        else
                        {
                            _2023 = _1536;
                            _2024 = _1538;
                        }
                        _2101 = _2023;
                        _2102 = _2024 + (((_1854 * _1956) * _506) * (0.3183098733425140380859375 * _1934));
                    }
                    _2103 = _1828;
                    _2104 = _1829;
                    _2105 = _2101;
                    _2106 = _2102;
                }
                else
                {
                    _2103 = _1531;
                    _2104 = _1534;
                    _2105 = _1536;
                    _2106 = _1538;
                }
                _1532 = _2103;
                _1535 = _2104;
                _1537 = _2105;
                _1539 = _2106;
            }
            else
            {
                _1532 = _1531;
                _1535 = _1534;
                _1537 = _1536;
                _1539 = _1538;
            }
        }
        vec3 _2108 = reflect(-_535, _503);
        vec3 _2110 = vec3(_511.x, _511.y, _511.z);
        vec3 _2120 = textureLod(samplerCube(_16, _7), _503, 0.0).xyz * _21._m27;
        vec3 _2127 = textureLod(samplerCube(_17, _7), _2108, fma(_564, 8.0, _21._m30 - 8.0)).xyz * _21._m27;
        vec3 _2152;
        vec3 _2153;
        SPIRV_CROSS_BRANCH
        if (_21._m29 > 0.0)
        {
            vec3 _2142 = vec3(_21._m29);
            _2152 = mix(_2127, textureLod(samplerCube(_19, _7), _2108, fma(_564, 8.0, _21._m31 - 8.0)).xyz * _21._m28, _2142);
            _2153 = mix(_2120, textureLod(samplerCube(_18, _7), _503, 0.0).xyz * _21._m28, _2142);
        }
        else
        {
            _2152 = _2127;
            _2153 = _2120;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.5) {
            float _rdx_cubeMod = rdx_cubemap_modulation(_2153, _564);
            _2152 *= _rdx_cubeMod;
            _2153 *= _rdx_cubeMod;
        }
        float _2154 = spvNMax(dot(_535, _503), 0.001953125);
        vec4 _2159 = textureLod(sampler2D(_20, _14), vec2(_2154, _564), 0.0);
        uvec4 _2170 = uvec4(_9._m0[_613]);
        uint _2172 = _2170.y;
        uint _2182 = ((_2170.z >> 0u) & 1023u) + (((_2172 >> 12u) & 4095u) + (((_2172 >> 0u) & 4095u) + _2170.x));
        uint _2184 = (_2172 >> 24u) + _2182;
        vec3 _2186;
        vec3 _2189;
        _2186 = _2152 * ((_2110 * _2159.x) + vec3(_2159.y));
        _2189 = _2153 * (_506 * _2159.z);
        vec3 _2187;
        vec3 _2190;
        for (uint _2191 = _2182; _2191 < _2184; _2186 = _2187, _2189 = _2190, _2191++)
        {
            uint _2198 = uint(_10._m0[_2191]);
            int _2217 = int((_15._m0[_2198]._m5 >> 1u) & 3u);
            mat3 _2221 = mat3(_15._m0[_2198]._m1[0], _15._m0[_2198]._m1[1], _15._m0[_2198]._m1[2]);
            int _2227 = (int((_15._m0[_2198]._m5 >> 3u) & 16383u) - 1) * 2;
            int _2232 = (int((_15._m0[_2198]._m5 >> 17u) & 16383u) - 1) * 2;
            int _2237 = (int((_15._m0[_2198]._m6 >> 0u) & 65535u) - 1) * 2;
            int _2242 = (int((_15._m0[_2198]._m6 >> 16u) & 65535u) - 1) * 2;
            float _2245 = (_15._m0[_2198]._m3 < 0.0) ? (-_15._m0[_2198]._m3) : 1.0;
            vec3 _2247 = _2221 * (_533 - _15._m0[_2198]._m1[3]);
            bool _2248 = int(_15._m0[_2198]._m5 & 1u) == 1;
            vec3 _2249 = abs(_2247);
            float _2252 = dot(_2247, _2247);
            if (_2248 ? any(greaterThanEqual(_2249, _15._m0[_2198]._m0.xyz)) : (_2252 >= _15._m0[_2198]._m0.y))
            {
                _2187 = _2186;
                _2190 = _2189;
                continue;
            }
            vec3 _2426;
            SPIRV_CROSS_FLATTEN
            if ((_2217 & 1) != 0)
            {
                vec3 _2262 = _2221 * _503;
                vec2 _2351;
                bool _2352;
                if (_2248)
                {
                    vec2 _2346;
                    bool _2350;
                    do
                    {
                        vec3 _2330 = (_15._m0[_2198]._m0.xyz - _2247) / _2262;
                        vec3 _2333 = ((-_15._m0[_2198]._m0.xyz) - _2247) / _2262;
                        vec3 _2334 = spvNMin(_2330, _2333);
                        vec3 _2335 = spvNMax(_2330, _2333);
                        float _2340 = spvNMax(_2334.x, spvNMax(_2334.y, _2334.z));
                        float _2345 = spvNMin(_2335.x, spvNMin(_2335.y, _2335.z));
                        _2346 = vec2(_2340, _2345);
                        if (_2340 > _2345)
                        {
                            _2350 = false;
                            break;
                        }
                        _2350 = true;
                        break;
                    } while(false);
                    _2351 = _2346;
                    _2352 = _2350;
                }
                else
                {
                    vec2 _2325;
                    bool _2326;
                    do
                    {
                        float _2268 = dot(_2262, _2262);
                        float _2269 = dot(_2262, _2247);
                        float _2270 = 2.0 * _2269;
                        float _2271 = _2252 - _15._m0[_2198]._m0.y;
                        float _2307;
                        float _2308;
                        bool _2309;
                        do
                        {
                            float _2277 = fma(_2270, _2270, -((4.0 * _2268) * _2271));
                            float _2305;
                            float _2306;
                            if (_2277 < 0.0)
                            {
                                _2307 = 0.0;
                                _2308 = 0.0;
                                _2309 = false;
                                break;
                            }
                            else
                            {
                                if (_2277 == 0.0)
                                {
                                    float _2304 = (_2269 * (-1.0)) * (1.0 / _2268);
                                    _2305 = _2304;
                                    _2306 = _2304;
                                }
                                else
                                {
                                    float _2297;
                                    if (_2270 > 0.0)
                                    {
                                        _2297 = (-0.5) * fma(2.0, _2269, sqrt(_2277));
                                    }
                                    else
                                    {
                                        _2297 = (-0.5) * fma(2.0, _2269, -sqrt(_2277));
                                    }
                                    _2305 = _2271 * (1.0 / _2297);
                                    _2306 = _2297 * (1.0 / _2268);
                                }
                            }
                            _2307 = _2305;
                            _2308 = _2306;
                            _2309 = true;
                            break;
                        } while(false);
                        if (!_2309)
                        {
                            _2325 = vec2(0.0);
                            _2326 = false;
                            break;
                        }
                        if ((_2308 < 0.0) && (_2307 < 0.0))
                        {
                            _2325 = vec2(0.0);
                            _2326 = false;
                            break;
                        }
                        vec2 _2324;
                        if (_2308 > _2307)
                        {
                            _2324 = vec2(_2307, _2308);
                        }
                        else
                        {
                            _2324 = vec2(_2308, _2307);
                        }
                        _2325 = _2324;
                        _2326 = true;
                        break;
                    } while(false);
                    _2351 = _2325;
                    _2352 = _2326;
                }
                vec3 _2355 = _2247 + (_2262 * _2351.y);
                float _2376;
                if (_2248)
                {
                    _2376 = 1.0 - clamp(length(spvNMax(_2249 - (_15._m0[_2198]._m0.xyz - vec3(_15._m0[_2198]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_2198]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2376 = clamp((_15._m0[_2198]._m0.x - length(_2247)) * (1.0 / spvNMax(_15._m0[_2198]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2379 = float(_2352) * smoothstep(0.0, 1.0, _2376);
                vec4 _2421;
                SPIRV_CROSS_BRANCH
                if (_2379 > 9.9999997473787516355514526367188e-05)
                {
                    float _2388 = mix(clamp((_2351.y * (1.0 / length(_2355))) * _564, 0.0, _564), _564, _564);
                    vec3 _2390 = mix(_2355, _2262, vec3(_2388));
                    int _83 = _2227;
                    vec4 _2391 = textureLod(nonuniformEXT(samplerCube(_26[_83], _7)), _2390, 0.0);
                    int _87 = _2227 + 1;
                    _2391.w = textureLod(nonuniformEXT(samplerCube(_26[_87], _7)), _2390, 0.0).x;
                    vec4 _2406;
                    SPIRV_CROSS_BRANCH
                    if (_2232 >= 0)
                    {
                        int _91 = _2232;
                        vec4 _2399 = textureLod(nonuniformEXT(samplerCube(_26[_91], _7)), _2390, 0.0);
                        int _95 = _2232 + 1;
                        _2399.w = textureLod(nonuniformEXT(samplerCube(_26[_95], _7)), _2390, 0.0).x;
                        _2406 = mix(_2391, _2399, vec4(_15._m0[_2198]._m3));
                    }
                    else
                    {
                        _2406 = _2391;
                    }
                    vec4 _2407 = _2406 * _2245;
                    vec3 _2416 = (_2407.xyz * _15._m0[_2198]._m4).xyz * (_506 * textureLod(sampler2D(_20, _14), vec2(_2154, _2388), 0.0).z);
                    vec4 _2417 = vec4(_2416.x, _2416.y, _2416.z, _2407.w);
                    _2417.w = _2407.w * _2379;
                    _2421 = _2417;
                }
                else
                {
                    _2421 = vec4(0.0);
                }
                _2426 = mix(_2189, _2421.xyz, vec3(_2421.w));
            }
            else
            {
                _2426 = _2189;
            }
            vec3 _2605;
            SPIRV_CROSS_FLATTEN
            if ((_2217 & 2) != 0)
            {
                vec3 _2431 = _2221 * _2108;
                vec2 _2520;
                bool _2521;
                if (_2248)
                {
                    vec2 _2515;
                    bool _2519;
                    do
                    {
                        vec3 _2499 = (_15._m0[_2198]._m0.xyz - _2247) / _2431;
                        vec3 _2502 = ((-_15._m0[_2198]._m0.xyz) - _2247) / _2431;
                        vec3 _2503 = spvNMin(_2499, _2502);
                        vec3 _2504 = spvNMax(_2499, _2502);
                        float _2509 = spvNMax(_2503.x, spvNMax(_2503.y, _2503.z));
                        float _2514 = spvNMin(_2504.x, spvNMin(_2504.y, _2504.z));
                        _2515 = vec2(_2509, _2514);
                        if (_2509 > _2514)
                        {
                            _2519 = false;
                            break;
                        }
                        _2519 = true;
                        break;
                    } while(false);
                    _2520 = _2515;
                    _2521 = _2519;
                }
                else
                {
                    vec2 _2494;
                    bool _2495;
                    do
                    {
                        float _2437 = dot(_2431, _2431);
                        float _2438 = dot(_2431, _2247);
                        float _2439 = 2.0 * _2438;
                        float _2440 = _2252 - _15._m0[_2198]._m0.y;
                        float _2476;
                        float _2477;
                        bool _2478;
                        do
                        {
                            float _2446 = fma(_2439, _2439, -((4.0 * _2437) * _2440));
                            float _2474;
                            float _2475;
                            if (_2446 < 0.0)
                            {
                                _2476 = 0.0;
                                _2477 = 0.0;
                                _2478 = false;
                                break;
                            }
                            else
                            {
                                if (_2446 == 0.0)
                                {
                                    float _2473 = (_2438 * (-1.0)) * (1.0 / _2437);
                                    _2474 = _2473;
                                    _2475 = _2473;
                                }
                                else
                                {
                                    float _2466;
                                    if (_2439 > 0.0)
                                    {
                                        _2466 = (-0.5) * fma(2.0, _2438, sqrt(_2446));
                                    }
                                    else
                                    {
                                        _2466 = (-0.5) * fma(2.0, _2438, -sqrt(_2446));
                                    }
                                    _2474 = _2440 * (1.0 / _2466);
                                    _2475 = _2466 * (1.0 / _2437);
                                }
                            }
                            _2476 = _2474;
                            _2477 = _2475;
                            _2478 = true;
                            break;
                        } while(false);
                        if (!_2478)
                        {
                            _2494 = vec2(0.0);
                            _2495 = false;
                            break;
                        }
                        if ((_2477 < 0.0) && (_2476 < 0.0))
                        {
                            _2494 = vec2(0.0);
                            _2495 = false;
                            break;
                        }
                        vec2 _2493;
                        if (_2477 > _2476)
                        {
                            _2493 = vec2(_2476, _2477);
                        }
                        else
                        {
                            _2493 = vec2(_2477, _2476);
                        }
                        _2494 = _2493;
                        _2495 = true;
                        break;
                    } while(false);
                    _2520 = _2494;
                    _2521 = _2495;
                }
                vec3 _2524 = _2247 + (_2431 * _2520.y);
                float _2545;
                if (_2248)
                {
                    _2545 = 1.0 - clamp(length(spvNMax(_2249 - (_15._m0[_2198]._m0.xyz - vec3(_15._m0[_2198]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_2198]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2545 = clamp((_15._m0[_2198]._m0.x - length(_2247)) * (1.0 / spvNMax(_15._m0[_2198]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2548 = float(_2521) * smoothstep(0.0, 1.0, _2545);
                vec4 _2600;
                SPIRV_CROSS_BRANCH
                if (_2548 > 9.9999997473787516355514526367188e-05)
                {
                    float _2557 = mix(clamp((_2520.y * (1.0 / length(_2524))) * _564, 0.0, _564), _564, _564);
                    vec3 _2559 = mix(_2524, _2431, vec3(_2557));
                    float _2560 = _2557 * 8.0;
                    int _99 = _2237;
                    int _103 = _2237 + 1;
                    vec4 _2568 = vec4(textureLod(nonuniformEXT(samplerCube(_26[_99], _7)), _2559, _2560).xyz, textureLod(nonuniformEXT(samplerCube(_26[_103], _7)), _2559, _2560).x);
                    vec4 _2582;
                    SPIRV_CROSS_BRANCH
                    if (_2242 >= 0)
                    {
                        int _107 = _2242;
                        int _111 = _2242 + 1;
                        _2582 = mix(_2568, vec4(textureLod(nonuniformEXT(samplerCube(_26[_107], _7)), _2559, _2560).xyz, textureLod(nonuniformEXT(samplerCube(_26[_111], _7)), _2559, _2560).x), vec4(_15._m0[_2198]._m3));
                    }
                    else
                    {
                        _2582 = _2568;
                    }
                    vec4 _2583 = _2582 * _2245;
                    vec4 _2588 = textureLod(sampler2D(_20, _14), vec2(_2154, _2557), 0.0);
                    vec3 _2595 = (_2583.xyz * _15._m0[_2198]._m4).xyz * ((_2110 * _2588.x) + vec3(_2588.y));
                    vec4 _2596 = vec4(_2595.x, _2595.y, _2595.z, _2583.w);
                    _2596.w = _2583.w * _2548;
                    _2600 = _2596;
                }
                else
                {
                    _2600 = vec4(0.0);
                }
                _2605 = mix(_2186, _2600.xyz, vec3(_2600.w));
            }
            else
            {
                _2605 = _2186;
            }
            _2187 = _2605;
            _2190 = _2426;
        }
        float _2606 = _6._m0[0u] * 100.0;
        bool _2611 = _28._m19 > 0.0;
        vec3 _2672;
        SPIRV_CROSS_BRANCH
        if (_2611 && (_28._m35 == 0.0))
        {
            vec3 _2625 = vec3(0.0, 636100.0, 0.0) + _29._m6;
            float _2626 = length(_2625);
            vec3 _2637;
            float _2638;
            if (_2626 < (0.89999997615814208984375 * _31._m0))
            {
                vec3 _2635 = _2625;
                _2635.z = _2625.z + _31._m0;
                _2637 = _2635;
                _2638 = length(_2635);
            }
            else
            {
                _2637 = _2625;
                _2638 = _2626;
            }
            float _2641 = dot(_2637 / vec3(_2638), _28._m36);
            float _2642 = _31._m0 / _2638;
            _2672 = (mix(textureLod(sampler2D(_32, _7), vec2(atan((_2641 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_2638 - _31._m0) / (_31._m1 - _31._m0))), 0.0).xyz, vec3(0.0), bvec3(_2641 < (-sqrt(fma(-_2642, _2642, 1.0))))) * 1.0) * (_28._m34 * _28._m20);
        }
        else
        {
            _2672 = _28._m2;
        }
        float _2685 = texelFetch(_43, ivec3(int(_599), int(_600), 0).xy, 0).x;
        float _2770;
        SPIRV_CROSS_BRANCH
        if (_28._m21 > 0.0)
        {
            vec3 _2709 = _29._m6 + _533;
            vec3 _2716 = vec3(0.0, _28._m18.z, 0.0) + (_2709 - vec3(0.0, _28._m25, 0.0));
            float _2720 = dot(_2716, _28._m24);
            vec2 _2730 = ((((_2716 + (_28._m24 * (sqrt(fma(_2720, _2720, fma(_28._m18.z, _28._m18.z, -dot(_2716, _2716)))) - _2720))).xz * _28._m18.w) * 0.5) + vec2(0.5)) + _28._m18.xy;
            _2730.x = 1.0 - _2730.x;
            vec3 _2743 = vec3(0.0, _28._m23.z, 0.0) + (_2709 - vec3(0.0, _28._m27, 0.0));
            float _2747 = dot(_2743, _28._m26);
            vec2 _2757 = ((((_2743 + (_28._m26 * (sqrt(fma(_2747, _2747, fma(_28._m23.z, _28._m23.z, -dot(_2743, _2743)))) - _2747))).xz * _28._m23.w) * 0.5) + vec2(0.5)) + _28._m23.xy;
            _2757.x = 1.0 - _2757.x;
            _2770 = _2685 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_34, _7), _2730, 0.0).x, textureLod(sampler2D(_35, _7), _2757, 0.0).x, _28._m16)) * _28._m21, 0.0, 1.0));
        }
        else
        {
            _2770 = _2685;
        }
        float _2860;
        SPIRV_CROSS_BRANCH
        if (_28._m17 > 0.0)
        {
            vec3 _2798 = _29._m6 + _533;
            vec3 _2806 = vec3(0.0, _28._m28.z, 0.0) + ((_28._m29 + _2798) - vec3(0.0, _28._m30, 0.0));
            float _2810 = dot(_2806, _28._m24);
            vec2 _2820 = ((((_2806 + (_28._m24 * (sqrt(fma(_2810, _2810, fma(_28._m28.z, _28._m28.z, -dot(_2806, _2806)))) - _2810))).xz * _28._m28.w) * 0.5) + vec2(0.5)) + _28._m28.xy;
            _2820.x = 1.0 - _2820.x;
            vec3 _2834 = vec3(0.0, _28._m31.z, 0.0) + ((_28._m32 + _2798) - vec3(0.0, _28._m33, 0.0));
            float _2838 = dot(_2834, _28._m26);
            vec2 _2848 = ((((_2834 + (_28._m26 * (sqrt(fma(_2838, _2838, fma(_28._m31.z, _28._m31.z, -dot(_2834, _2834)))) - _2838))).xz * _28._m31.w) * 0.5) + vec2(0.5)) + _28._m31.xy;
            _2848.x = 1.0 - _2848.x;
            _2860 = _2770 * (1.0 - clamp(mix(textureLod(sampler2D(_24, _7), _2820, 0.0).x, textureLod(sampler2D(_25, _7), _2848, 0.0).x, _28._m16) * _28._m17, 0.0, 1.0));
        }
        else
        {
            _2860 = _2770;
        }
        float _2932;
        SPIRV_CROSS_BRANCH
        if (_531)
        {
            float _2867 = 1.0 - abs(dot(_503, _28._m0));
            vec4 _2874 = vec4(_533 - (_503 * (0.0199999995529651641845703125 * _2867)), 1.0);
            float _2930;
            int _2876 = 0;
            SPIRV_CROSS_UNROLL
            for (;;)
            {
                if (_2876 < 4)
                {
                    vec4 _2884 = _2874 * _21._m10[_2876];
                    uint _2885 = uint(_2876);
                    vec2 _2900 = clamp((vec2(1.0) - abs((clamp(_2884.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / vec2(_21._m6), vec2(0.0), vec2(1.0));
                    float _2901 = _2884.z;
                    if (((_2900.x * _2900.y) * clamp((clamp(_2901, 0.0, 1.0) * _21._m8[_2885]) / ((_21._m9[_2885] * 0.5) * _21._m6), 0.0, 1.0)) > 0.0)
                    {
                        _2930 = fma(0.0199999995529651641845703125, _2867, abs(fma(1.0 - _2901, _21._m8[_2885], -((1.0 - textureLod(sampler2DArray(_8, _14), vec3(_2884.xy, float(_2876)), 0.0).x) * _21._m8[_2885]))));
                        break;
                    }
                    _2876++;
                    continue;
                }
                else
                {
                    _2930 = 0.0;
                    break;
                }
            }
            _2932 = _2930 * 1000.0;
        }
        else
        {
            _2932 = 0.0;
        }
        vec3 _2934 = _2672 * (_2860 * _6._m0[0u]);
        vec3 _2937 = reflect(_535, _503);
        float _2941 = clamp(dot(_28._m0, normalize(_535 + _28._m0)), 0.0, 1.0);
        float _2942 = dot(_503, _28._m0);
        float _2943 = clamp(_2942, 0.0, 1.0);
        vec3 _2950 = vec3(fma((2.0 * _2941) * _2941, _564, mix(0.0, 0.5, _564))) - vec3(1.0);
        float _2969 = dot(_28._m0, _2937);
        vec3 _2979 = mix(_2937, normalize((_28._m0 * 0.999989449977874755859375) + (normalize(_2937 - (_28._m0 * _2969)) * 0.0045900647528469562530517578125)), bvec3(_2969 < 0.999989449977874755859375));
        vec3 _2981 = normalize(_535 + _2979);
        float _2985 = clamp(dot(_503, _2981), 0.0, 1.0);
        float _2987 = clamp(dot(_503, _2979), 0.0, 1.0);
        float _2989 = (_564 + 1.0) * 0.5;
        float _2990 = _564 * _564;
        float _2998 = _2989 * _2989;
        float _3010 = _2990 * _2990;
        float _3013 = fma(fma(_2985, _3010, -_2985), _2985, 1.0);
        vec3 _3028 = vec3(1.0) / spvNMax((_12._m0[_516]._m0.xyz * vec3(0.09660939872264862060546875)) * _12._m0[_516]._m0.w, vec3(9.9999997473787516355514526367188e-05));
        vec3 _3046;
        SPIRV_CROSS_BRANCH
        if (_531)
        {
            vec3 _3042 = exp2(_3028 * ((-0.4808983504772186279296875) * spvNMax(_529, _2932)));
            _3046 = _12._m0[_516]._m1.xyz * (_3042 * fma(_3042, _3042, vec3(3.0)));
        }
        else
        {
            vec3 _3034 = exp2(_3028 * ((-0.4808983504772186279296875) * _529));
            _3046 = (_12._m0[_516]._m1.xyz * (_3034 * fma(_3034, _3034, vec3(3.0)))) * _2860;
        }
        float _3074;
        float _3075;
        if (_36._m0.x > 0.0)
        {
            vec4 _3063 = textureLod(sampler2D(_42, _14), _423, 0.0);
            float _3064 = _3063.x;
            _3074 = clamp((pow(spvNMax(abs(_629 + _3064), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _564, -1.0))) - 1.0) + _3064, 0.0, 1.0);
            _3075 = _3064;
        }
        else
        {
            _3074 = 1.0;
            _3075 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.5) {
            float _rdx_aoExtra = mix(1.0, _3075, 0.7);
            _1536 *= _rdx_aoExtra;
            _1538 *= _rdx_aoExtra;
        }
        vec3 _3083 = (((_1538 + ((_2934 * (_506 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2950 * pow(spvNMax(abs(1.0 - _2943), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2950 * pow(spvNMax(abs(1.0 - _630), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _564))))) * _2943)) + ((_3046 * ((_2672 * clamp((0.2588190734386444091796875 - _2942) * 0.631063938140869140625, 0.0, 1.0)) * (_506 * 0.3183098733425140380859375))) * _6._m0[0u])) * mix(1.0, _3075, _36._m0.y)) + ((_2189 * _2606) * _3075);
        vec3 _3085 = ((_1536 + ((_2934 * ((_511 + ((vec3(1.0) - _511) * pow(spvNMax(abs(1.0 - clamp(dot(_2979, _2981), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2987, sqrt(fma(fma(-_630, _2998, _630), _630, _2998)), _630 * sqrt(fma(fma(-_2987, _2998, _2987), _2987, _2998)))) * (_3010 * (0.3183098733425140380859375 / (_3013 * _3013)))))) * _2943)) * mix(1.0, _3074, _36._m0.y)) + ((_2186 * _2606) * _3074);
        // --- RenoDX: Multi-Scatter GGX Energy Compensation ---
        if (pc.rendering_multi_scatter > 0.5) {
            vec3 _rdx_ms = rdx_multi_scatter_compensation(_630, _564, _511);
            _3085 *= _rdx_ms;
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _2685, 0.5);
            _3083 *= _rdx_csm_shadow;
            _3085 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_28._m6[0].xyz, _28._m6[1].xyz, _28._m6[2].xyz) * _28._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _41, _7, _423, _rdx_marchDir, _465, vec2(_36._m1));
            _rdx_dbg_micro = _rdx_micro;
            _3083 *= _rdx_micro;
            _3085 *= _rdx_micro;
        }
        vec3 _3590;
        vec3 _3591;
        SPIRV_CROSS_BRANCH
        if (_2611)
        {
            vec3 _3093 = vec3(0.0, 636100.0, 0.0) + _29._m6;
            vec3 _3094 = vec3(0.0, 636100.0, 0.0) + (_533 + _29._m6);
            float _3095 = length(_3094);
            vec3 _3099 = (_3094 / vec3(_3095)) * spvNMax(_3095, 636100.0);
            vec3 _3100 = _3099 - _3093;
            float _3101 = length(_3100);
            vec3 _3103 = _3100 / vec3(_3101);
            float _3104 = length(_3093);
            vec3 _3118;
            vec3 _3119;
            float _3120;
            if (_3104 < (0.89999997615814208984375 * _31._m0))
            {
                vec3 _3113 = _3093;
                _3113.z = _3093.z + _31._m0;
                vec3 _3116 = _3099;
                _3116.z = _3099.z + _31._m0;
                _3118 = _3116;
                _3119 = _3113;
                _3120 = length(_3113);
            }
            else
            {
                _3118 = _3099;
                _3119 = _3093;
                _3120 = _3104;
            }
            float _3121 = dot(_3119, _3103);
            float _3132 = spvNMax((-_3121) - sqrt(fma(_31._m1, _31._m1, fma(_3121, _3121, -(_3120 * _3120)))), 0.0);
            bool _3135 = (_3132 > 0.0) && (_3132 < _3101);
            vec3 _3143;
            float _3144;
            float _3145;
            if (_3135)
            {
                _3143 = _3119 + (_3103 * _3132);
                _3144 = _3101 - _3132;
                _3145 = (_3121 + _3132) / _31._m1;
            }
            else
            {
                _3143 = _3119;
                _3144 = _3101;
                _3145 = _3121 / _3120;
            }
            float _3146 = _3135 ? _31._m1 : _3120;
            vec3 _3583;
            vec3 _3584;
            if (_3146 <= _31._m1)
            {
                float _3151 = dot(_3103, _28._m36);
                float _3153 = dot(_3143, _28._m36) / _3146;
                float _3154 = _31._m0 + 600.0;
                bool _3155 = _3146 < _3154;
                vec3 _3160;
                if (_3155)
                {
                    _3160 = _3118 * (_3154 / _3146);
                }
                else
                {
                    _3160 = _3118;
                }
                float _3161 = _3155 ? _3154 : _3146;
                float _3162 = length(_3160);
                float _3163 = dot(_3160, _3103);
                float _3165 = dot(_3160, _28._m36) / _3162;
                vec2 _3176 = vec2(_3145, _3145 + (_3144 / _3161));
                vec2 _3177 = _3176 * sqrt((0.5 / _31._m4) * _3161);
                vec2 _3180 = vec2(ivec2(sign(_3177)));
                vec2 _3181 = _3177 * _3177;
                float _3195 = -_3144;
                float _3197 = 2.0 * _3161;
                float _3199 = (_3144 / _3197) + _3145;
                float _3207 = _31._m0 - _3161;
                vec2 _3222 = _3176 * sqrt((0.5 / _31._m6) * _3161);
                vec2 _3225 = vec2(ivec2(sign(_3222)));
                vec2 _3226 = _3222 * _3222;
                vec3 _3256 = exp(((-_31._m5) * ((sqrt((6.283100128173828125 * _31._m4) * _3161) * exp(_3207 / _31._m4)) * (((_3180.y > _3180.x) ? exp(_3181.x) : 0.0) + dot((_3180 / ((abs(_3177) * 2.3192999362945556640625) + sqrt((_3181 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3195 / _31._m4) * _3199)), vec2(1.0, -1.0))))) - (_31._m8 * ((sqrt((6.283100128173828125 * _31._m6) * _3161) * exp(_3207 / _31._m6)) * (((_3225.y > _3225.x) ? exp(_3226.x) : 0.0) + dot((_3225 / ((abs(_3222) * 2.3192999362945556640625) + sqrt((_3226 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3195 / _31._m6) * _3199)), vec2(1.0, -1.0))))));
                vec3 _3257 = spvNMin(_3256, vec3(1.0));
                float _3258 = _31._m0 / _3161;
                float _3261 = sqrt(fma(-_3258, _3258, 1.0));
                float _3263 = _3145 - (-_3261);
                vec4 _3546;
                if (abs(_3263) < 0.0040000001899898052215576171875)
                {
                    float _3371 = (-0.0040000001899898052215576171875) - _3261;
                    float _3373 = fma(_3161, _3161, _3144 * _3144);
                    float _3374 = _3197 * _3144;
                    float _3376 = sqrt(fma(_3374, _3371, _3373));
                    float _3377 = fma(_3161, _3371, _3144);
                    float _3380 = -(_31._m0 * _31._m0);
                    float _3382 = sqrt(fma(_31._m1, _31._m1, _3380));
                    float _3384 = sqrt(fma(_3161, _3161, _3380));
                    float _3385 = _3161 * _3371;
                    float _3387 = -(_3161 * _3161);
                    float _3389 = fma(_31._m0, _31._m0, fma(_3385, _3385, _3387));
                    vec4 _3395 = vec4(-1.0, _3382 * _3382, _3382, 0.50390625);
                    vec4 _3396 = mix(_3395, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3385 < 0.0) && (_3389 > 0.0)));
                    float _3398 = fma(_3384 / _3382, 0.96875, 0.015625);
                    float _3408 = fma(fma(_3385, _3396.x, sqrt(_3389 + _3396.y)) / (_3384 + _3396.z), 0.4921875, _3396.w);
                    float _3414 = _3151 + 1.0;
                    float _3416 = floor(_3414 * 3.5);
                    float _3418 = fma(_3414, 3.5, -_3416);
                    float _3419 = _3416 + fma(fma(atan(spvNMax(_3153, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3420 = _3419 * 0.125;
                    float _3424 = 1.0 - _3418;
                    float _3427 = (_3419 + 1.0) * 0.125;
                    float _3434 = sqrt(fma(_3376, _3376, _3380));
                    float _3438 = fma(_31._m0, _31._m0, fma(_3377, _3377, -(_3376 * _3376)));
                    vec4 _3443 = mix(_3395, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3377 < 0.0) && (_3438 > 0.0)));
                    float _3445 = fma(_3434 / _3382, 0.96875, 0.015625);
                    float _3455 = fma(fma(_3377, _3443.x, sqrt(_3438 + _3443.y)) / (_3434 + _3443.z), 0.4921875, _3443.w);
                    float _3461 = _3416 + fma(fma(atan(spvNMax(_3165, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3462 = _3461 * 0.125;
                    float _3468 = (_3461 + 1.0) * 0.125;
                    vec4 _3474 = _3257.xyzx;
                    float _3478 = 0.0040000001899898052215576171875 - _3261;
                    float _3480 = sqrt(fma(_3374, _3478, _3373));
                    float _3481 = fma(_3161, _3478, _3144);
                    float _3482 = _3161 * _3478;
                    float _3484 = fma(_31._m0, _31._m0, fma(_3482, _3482, _3387));
                    vec4 _3489 = mix(_3395, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3482 < 0.0) && (_3484 > 0.0)));
                    float _3499 = fma(fma(_3482, _3489.x, sqrt(_3484 + _3489.y)) / (_3384 + _3489.z), 0.4921875, _3489.w);
                    float _3510 = sqrt(fma(_3480, _3480, _3380));
                    float _3514 = fma(_31._m0, _31._m0, fma(_3481, _3481, -(_3480 * _3480)));
                    vec4 _3519 = mix(_3395, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3481 < 0.0) && (_3514 > 0.0)));
                    float _3521 = fma(_3510 / _3382, 0.96875, 0.015625);
                    float _3531 = fma(fma(_3481, _3519.x, sqrt(_3514 + _3519.y)) / (_3510 + _3519.z), 0.4921875, _3519.w);
                    _3546 = mix(spvNMax(fma(-((textureLod(sampler3D(_33, _7), vec3(_3462, _3455, _3445), 0.0) * _3424) + (textureLod(sampler3D(_33, _7), vec3(_3468, _3455, _3445), 0.0) * _3418)), _3474, (textureLod(sampler3D(_33, _7), vec3(_3420, _3408, _3398), 0.0) * _3424) + (textureLod(sampler3D(_33, _7), vec3(_3427, _3408, _3398), 0.0) * _3418)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_33, _7), vec3(_3462, _3531, _3521), 0.0) * _3424) + (textureLod(sampler3D(_33, _7), vec3(_3468, _3531, _3521), 0.0) * _3418)), _3474, (textureLod(sampler3D(_33, _7), vec3(_3420, _3499, _3398), 0.0) * _3424) + (textureLod(sampler3D(_33, _7), vec3(_3427, _3499, _3398), 0.0) * _3418)), vec4(0.0)), vec4((_3263 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _3271 = -(_31._m0 * _31._m0);
                    float _3273 = sqrt(fma(_31._m1, _31._m1, _3271));
                    float _3275 = sqrt(fma(_3161, _3161, _3271));
                    float _3276 = _3161 * _3145;
                    float _3280 = fma(_31._m0, _31._m0, fma(_3276, _3276, -(_3161 * _3161)));
                    vec4 _3286 = vec4(-1.0, _3273 * _3273, _3273, 0.50390625);
                    vec4 _3287 = mix(_3286, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3276 < 0.0) && (_3280 > 0.0)));
                    float _3289 = fma(_3275 / _3273, 0.96875, 0.015625);
                    float _3299 = fma(fma(_3276, _3287.x, sqrt(_3280 + _3287.y)) / (_3275 + _3287.z), 0.4921875, _3287.w);
                    float _3305 = _3151 + 1.0;
                    float _3307 = floor(_3305 * 3.5);
                    float _3309 = fma(_3305, 3.5, -_3307);
                    float _3310 = _3307 + fma(fma(atan(spvNMax(_3153, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3315 = 1.0 - _3309;
                    float _3325 = sqrt(fma(_3162, _3162, _3271));
                    float _3329 = fma(_31._m0, _31._m0, fma(_3163, _3163, -(_3162 * _3162)));
                    vec4 _3334 = mix(_3286, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3163 < 0.0) && (_3329 > 0.0)));
                    float _3336 = fma(_3325 / _3273, 0.96875, 0.015625);
                    float _3346 = fma(fma(_3163, _3334.x, sqrt(_3329 + _3334.y)) / (_3325 + _3334.z), 0.4921875, _3334.w);
                    float _3352 = _3307 + fma(fma(atan(spvNMax(_3165, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _3546 = spvNMax(fma(-((textureLod(sampler3D(_33, _7), vec3(_3352 * 0.125, _3346, _3336), 0.0) * _3315) + (textureLod(sampler3D(_33, _7), vec3((_3352 + 1.0) * 0.125, _3346, _3336), 0.0) * _3309)), _3257.xyzx, (textureLod(sampler3D(_33, _7), vec3(_3310 * 0.125, _3299, _3289), 0.0) * _3315) + (textureLod(sampler3D(_33, _7), vec3((_3310 + 1.0) * 0.125, _3299, _3289), 0.0) * _3309)), vec4(0.0));
                }
                float _3561 = fma(_3151, _3151, 1.0);
                _3583 = _3257;
                _3584 = (_3546.xyz * (0.0596831031143665313720703125 * _3561)) + ((((_3546.xyz * (_3546.w * smoothstep(0.0, 0.0199999995529651641845703125, _3153))) / vec3(spvNMax(_3546.x, 9.9999997473787516355514526367188e-05))) * (vec3(_31._m5.x) / _31._m5)) * ((((0.119366206228733062744140625 * fma(-_31._m9, _31._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_31._m9 * (-2.0), _3151, fma(_31._m9, _31._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _3561) / fma(_31._m9, _31._m9, 2.0)));
            }
            else
            {
                _3583 = vec3(1.0);
                _3584 = vec3(0.0);
            }
            _3590 = _3085 * _3583;
            _3591 = fma(_3083, _3583, _3584 * ((_28._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _3590 = _3085;
            _3591 = _3083;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_28._m6[0].xyz, _28._m6[1].xyz, _28._m6[2].xyz) * _28._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_41, _7, _423, _rdx_dir, _465, vec2(_36._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _3591 = vec3(_rdx_vis);
            _3590 = vec3(0.0);
        }
        imageStore(_45, ivec2(_406), vec4(_3591, 1.0));
        imageStore(_46, ivec2(_406), vec4(_3590, 1.0));
        break;
    } while(false);
}

