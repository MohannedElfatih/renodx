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

struct _50
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

struct _53
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

struct _57
{
    vec4 _m0;
    mat4x3 _m1;
    vec4 _m2[4];
    float _m3;
    float _m4;
    uint _m5;
    uint _m6;
};

struct _62
{
    mat4 _m0;
    vec2 _m1;
    float _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    float _m6;
};

float _292;
const vec4 _304[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _331;
vec3 _336;
vec3 _337;

layout(set = 1, binding = 13, std430) readonly buffer _45_6
{
    float _m0[];
} _6;

layout(set = 1, binding = 23, std430) readonly buffer _47_8
{
    ivec4 _m0[];
} _8;

layout(set = 1, binding = 24, std430) readonly buffer _49_9
{
    int _m0[];
} _9;

layout(set = 1, binding = 25, std430) readonly buffer _52_10
{
    _50 _m0[];
} _10;

layout(set = 1, binding = 29, std430) readonly buffer _55_11
{
    layout(row_major) _53 _m0[];
} _11;

layout(set = 1, binding = 33, std430) readonly buffer _59_13
{
    layout(row_major) _57 _m0[];
} _13;

layout(set = 1, binding = 39, std140) uniform _61_19
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

layout(set = 1, binding = 40, scalar) readonly buffer _64_20
{
    layout(row_major) _62 _m0[];
} _20;

layout(set = 0, binding = 1, std140) uniform _66_26
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

layout(set = 0, binding = 2, std140) uniform _67_27
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

layout(set = 0, binding = 4, std140) uniform _68_28
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

layout(set = 5, binding = 0, scalar) uniform _70_29
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

layout(set = 1, binding = 0, scalar) uniform _71_34
{
    vec4 _m0;
    uvec2 _m1;
    uint _m2;
    uint _m3;
    uint _m4;
    uvec3 _m5;
} _34;

layout(set = 1, binding = 9, std430) readonly buffer _72_41
{
    uint _m0[];
} _41;

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
layout(set = 1, binding = 5) uniform texture2D _38;
layout(set = 1, binding = 6) uniform texture2D _39;
layout(set = 1, binding = 7) uniform texture2D _40;
layout(set = 1, binding = 10, rgba32f) uniform writeonly image2D _42;
layout(set = 1, binding = 11, rgba32f) uniform writeonly image2D _43;

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
// Screen-space ray march with thickness-windowed depth comparison.
// Captures micro-detail shadowing from subtle depth buffer variations
// that CSM resolution misses (brick grooves, armor edges, terrain bumps).
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
        uint _372 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _374 = _41._m0[_372];
        uvec2 _379 = (uvec2(_374 & 65535u, _374 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_379, _28._m3)) || any(greaterThan(_379, _28._m4)))
        {
            break;
        }
        vec2 _391 = vec2(_379);
        vec2 _396 = (_391 + vec2(0.5)) / vec2(_34._m1);
        vec2 _403 = ((_396 - _28._m1) / _28._m0) * 0.5;
        float _407 = _403.x;
        float _409 = _403.y;
        ivec2 _427 = ivec3(int(_379.x), int(_379.y), 0).xy;
        vec4 _431 = texelFetch(_36, _427, 0);
        vec4 _433 = texelFetch(_37, _427, 0);
        vec4 _435 = texelFetch(_38, _427, 0);
        float _436 = _435.x;
        vec3 _454;
        do
        {
            vec3 _442 = fma(vec3(texelFetch(_35, _427, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _443 = dot(_442, _442);
            if (_443 > 54000001024.0)
            {
                _454 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _448 = 2.0 / _443;
                vec2 _450 = _442.xy * _448;
                vec3 _451 = vec3(_450.x, _450.y, _336.z);
                _451.z = 1.0 - _448;
                _454 = _451;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _457 = _433.y;
        float _458 = _433.z;
        uint _464 = (uint(roundEven(_433.w * 255.0)) & 112u) >> 4u;
        vec3 _474 = _454 * mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        vec3 _477 = vec3(_431.x, _431.y, _431.z) * (1.0 - _458);
        vec3 _482 = mix(vec3(0.1599999964237213134765625 * (_457 * _457)), _431.xyz, vec3(_458));
        float _483 = spvNMax(0.0900000035762786865234375, _433.x);
        vec3 _484 = (((_26._m7[0].xyz * ((1.0 - _407) - _409)) + (_26._m7[1].xyz * _407)) + (_26._m7[2].xyz * _409)) * _436;
        vec3 _486 = normalize(-_484);
        uint _488 = gl_SubgroupInvocationID & 3u;
        float _493 = ((_488 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _494 = (subgroupQuadSwapHorizontal(_454) - _454) * _493;
        float _499 = ((_488 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _500 = (subgroupQuadSwapVertical(_454) - _454) * _499;
        vec3 _504 = mix(_494, vec3(0.0), bvec3(any(isnan(_494))));
        vec3 _508 = mix(_500, vec3(0.0), bvec3(any(isnan(_500))));
        float _515 = sqrt(clamp(fma(_483, _483, spvNMin(dot(_504, _504) + dot(_508, _508), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _524 = ivec2(uvec2(_391) / uvec2(_19._m25));
        float _550 = _391.x;
        float _551 = _391.y;
        float _556 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _550, 0.005837149918079376220703125 * _551)));
        float _563 = clamp(fma(_19._m34.y, length(_484), _19._m34.x), 0.0, 1.0);
        uint _564 = uint(int(fma(fma(float(int(clamp(fma(log2(_436 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_524.y)), _19._m23, float(_524.x))));
        uvec4 _567 = uvec4(_8._m0[_564]);
        uint _568 = _567.x;
        uint _569 = _567.y;
        uint _572 = ((_569 >> 0u) & 4095u) + _568;
        uint _575 = ((_569 >> 12u) & 4095u) + _572;
        uint _579 = ((_567.z >> 0u) & 1023u) + _575;
        float _580 = dot(_474, _486);
        float _581 = spvNMax(_580, 9.9999997473787516355514526367188e-06);
        float _583;
        bool _586;
        vec3 _588;
        vec3 _590;
        uint _592;
        _583 = _292;
        _586 = false;
        _588 = vec3(0.0);
        _590 = vec3(0.0);
        _592 = _568;
        float _584;
        bool _587;
        vec3 _589;
        vec3 _591;
        for (; _592 < _572; _583 = _584, _586 = _587, _588 = _589, _590 = _591, _592++)
        {
            uint _599 = uint(_9._m0[_592]);
            float _617 = abs(_10._m0[_599]._m5);
            if ((_10._m0[_599]._m6 & (1u << (_464 & 31u))) != 0u)
            {
                vec3 _632 = _10._m0[_599]._m0.xyz - _484;
                float _633 = dot(_632, _632);
                vec3 _636 = _632 * inversesqrt(spvNMax(_633, 1.0000000133514319600180897396058e-10));
                float _637 = _10._m0[_599]._m0.w * _10._m0[_599]._m0.w;
                float _875;
                bool _876;
                vec3 _877;
                vec3 _878;
                if (_633 < (1.0 / _637))
                {
                    vec3 _642 = _486 + _636;
                    vec3 _646 = _642 * inversesqrt(spvNMax(dot(_642, _642), 1.0000000133514319600180897396058e-10));
                    float _648 = clamp(dot(_636, _646), 0.0, 1.0);
                    float _650 = clamp(dot(_474, _646), 0.0, 1.0);
                    float _652 = clamp(dot(_474, _636), 0.0, 1.0);
                    float _653 = _633 * _637;
                    float _659 = pow(spvNMax(abs(clamp(fma(-_653, _653, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_599]._m4);
                    float _669;
                    if (_10._m0[_599]._m5 < 0.0)
                    {
                        _669 = _659 * fma(4.0, _637, _617);
                    }
                    else
                    {
                        _669 = _659 * ((1.0 / spvNMax(_633, 9.9999997473787516355514526367188e-05)) + _617);
                    }
                    float _671 = 0.079577468335628509521484375 * (_652 * _669);
                    float _806;
                    bool _807;
                    float _808;
                    if ((_10._m0[_599]._m7 & 1u) != 0u)
                    {
                        uint _696;
                        do
                        {
                            vec3 _676 = -_636;
                            float _677 = dot(_676, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                            float _678 = dot(_676, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                            float _679 = dot(_676, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                            float _683 = spvNMax(spvNMax(_677, _678), spvNMax(_679, dot(_676, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                            if (_683 == _677)
                            {
                                _696 = 0u;
                                break;
                            }
                            else
                            {
                                if (_683 == _678)
                                {
                                    _696 = 1u;
                                    break;
                                }
                                else
                                {
                                    if (_683 == _679)
                                    {
                                        _696 = 2u;
                                        break;
                                    }
                                    else
                                    {
                                        _696 = 3u;
                                        break;
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            }
                            break; // unreachable workaround
                        } while(false);
                        uint _698 = uint(int(_10._m0[_599]._m7 >> 2u)) + _696;
                        float _800;
                        bool _801;
                        float _802;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_652 <= 0.0) && true)
                            {
                                _800 = _583;
                                _801 = _586;
                                _802 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _731 = _20._m0[_698]._m0 * vec4(_484 + (_474 * ((3.5 * float(int(sign(_652)))) * (_20._m0[_698]._m4 * sqrt(_633)))), 1.0);
                                vec3 _735 = _731.xyz / vec3(_731.w);
                                vec2 _738 = (_735.xy * 0.5) + vec2(0.5);
                                _738.y = 1.0 - _738.y;
                                float _747 = (_20._m0[_698]._m5.y / _20._m0[_698]._m6) / (_735.z - _20._m0[_698]._m5.x);
                                float _752 = _586 ? _583 : 6.283185482025146484375;
                                float _753 = _556 * _752;
                                vec2 _754 = _20._m0[_698]._m1 + _19._m33;
                                vec2 _757 = (_20._m0[_698]._m1 + vec2(_20._m0[_698]._m2)) - _19._m33;
                                float _759;
                                _759 = 0.0;
                                for (int _762 = 0; _762 < 12; )
                                {
                                    float _767 = float(uint(_762));
                                    float _770 = sqrt(_767 + 0.5) * 0.288675129413604736328125;
                                    float _771 = fma(_767, 2.3999631404876708984375, _753);
                                    vec2 _779 = clamp(fma((vec3(cos(_771), sin(_771), _770).xy * _770) * 2.5, _19._m33, _738), _754, _757);
                                    vec2 _782 = fract(fma(vec2(1.0) / _19._m33, _779, vec2(0.5)));
                                    vec4 _788 = vec4(lessThan(vec4(_747), textureGather(sampler2D(_21, _12), _779)));
                                    float _791 = _782.x;
                                    _759 += clamp(mix(mix(_788.w, _788.z, _791), mix(_788.x, _788.y, _791), _782.y), 0.0, 1.0);
                                    _762++;
                                    continue;
                                }
                                _800 = _752;
                                _801 = _586 ? _586 : true;
                                _802 = _759 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _806 = _800;
                        _807 = _801;
                        _808 = _671 * mix(1.0, _802, spvNMin(_563, _10._m0[_599]._m8));
                    }
                    else
                    {
                        _806 = _583;
                        _807 = _586;
                        _808 = _671;
                    }
                    vec3 _873;
                    vec3 _874;
                    if (_652 > 0.0)
                    {
                        vec3 _814 = _10._m0[_599]._m1.xyz * (_808 * ((_10._m0[_599]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                        vec3 _821 = vec3(fma((2.0 * _648) * _648, _515, mix(0.0, 0.5, _515))) - vec3(1.0);
                        float _842 = (_515 + 1.0) * 0.5;
                        float _843 = _515 * _515;
                        float _851 = _842 * _842;
                        float _863 = _843 * _843;
                        float _866 = fma(fma(_650, _863, -_650), _650, 1.0);
                        _873 = fma(_814, (_482 + ((vec3(1.0) - _482) * pow(spvNMax(abs(1.0 - _648), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_652, sqrt(fma(fma(-_581, _851, _581), _581, _851)), _581 * sqrt(fma(fma(-_652, _851, _652), _652, _851)))) * (_863 * (0.3183098733425140380859375 / (_866 * _866)))), _588);
                        _874 = fma(_814, _477 * (0.3183098733425140380859375 * (((vec3(1.0) + (_821 * pow(spvNMax(abs(1.0 - _652), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_821 * pow(spvNMax(abs(1.0 - _581), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _515))), _590);
                    }
                    else
                    {
                        _873 = _588;
                        _874 = _590;
                    }
                    _875 = _806;
                    _876 = _807;
                    _877 = _873;
                    _878 = _874;
                }
                else
                {
                    _875 = _583;
                    _876 = _586;
                    _877 = _588;
                    _878 = _590;
                }
                _584 = _875;
                _587 = _876;
                _589 = _877;
                _591 = _878;
            }
            else
            {
                _584 = _583;
                _587 = _586;
                _589 = _588;
                _591 = _590;
            }
        }
        float _880;
        bool _883;
        vec3 _885;
        vec3 _887;
        uint _889;
        _880 = _583;
        _883 = _586;
        _885 = _588;
        _887 = _590;
        _889 = _592;
        float _881;
        bool _884;
        vec3 _886;
        vec3 _888;
        for (; _889 < _575; _880 = _881, _883 = _884, _885 = _886, _887 = _888, _889++)
        {
            uint _896 = uint(_9._m0[_889]);
            float _909 = abs(_10._m0[_896]._m5);
            if ((_10._m0[_896]._m6 & (1u << (_464 & 31u))) != 0u)
            {
                vec3 _927 = _10._m0[_896]._m0.xyz - _484;
                float _928 = dot(_927, _927);
                vec3 _931 = _927 * inversesqrt(spvNMax(_928, 1.0000000133514319600180897396058e-10));
                float _932 = _10._m0[_896]._m0.w * _10._m0[_896]._m0.w;
                float _1160;
                bool _1161;
                vec3 _1162;
                vec3 _1163;
                if (_928 < (1.0 / _932))
                {
                    vec3 _937 = _486 + _931;
                    vec3 _941 = _937 * inversesqrt(spvNMax(dot(_937, _937), 1.0000000133514319600180897396058e-10));
                    float _943 = clamp(dot(_931, _941), 0.0, 1.0);
                    float _945 = clamp(dot(_474, _941), 0.0, 1.0);
                    float _947 = clamp(dot(_474, _931), 0.0, 1.0);
                    float _950 = dot(-_931, normalize(_10._m0[_896]._m2.xyz));
                    float _979;
                    if (_950 > _10._m0[_896]._m1.w)
                    {
                        float _954 = _928 * _932;
                        float _960 = pow(spvNMax(abs(clamp(fma(-_954, _954, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_896]._m4);
                        float _970;
                        if (_10._m0[_896]._m5 < 0.0)
                        {
                            _970 = _960 * fma(4.0, _932, _909);
                        }
                        else
                        {
                            _970 = _960 * ((1.0 / spvNMax(_928, 9.9999997473787516355514526367188e-05)) + _909);
                        }
                        float _975 = clamp((_950 - _10._m0[_896]._m1.w) / spvNMax(_10._m0[_896]._m2.w - _10._m0[_896]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _979 = _947 * (_970 * (_975 * _975));
                    }
                    else
                    {
                        _979 = 0.0;
                    }
                    float _980 = 0.3183098733425140380859375 * _979;
                    float _1091;
                    bool _1092;
                    float _1093;
                    if ((_10._m0[_896]._m7 & 1u) != 0u)
                    {
                        uint _983 = uint(int(_10._m0[_896]._m7 >> 2u));
                        float _1085;
                        bool _1086;
                        float _1087;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_947 <= 0.0) && true)
                            {
                                _1085 = _880;
                                _1086 = _883;
                                _1087 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1016 = _20._m0[_983]._m0 * vec4(_484 + (_474 * ((3.5 * float(int(sign(_947)))) * (_20._m0[_983]._m4 * sqrt(_928)))), 1.0);
                                vec3 _1020 = _1016.xyz / vec3(_1016.w);
                                vec2 _1023 = (_1020.xy * 0.5) + vec2(0.5);
                                _1023.y = 1.0 - _1023.y;
                                float _1032 = (_20._m0[_983]._m5.y / _20._m0[_983]._m6) / (_1020.z - _20._m0[_983]._m5.x);
                                float _1037 = _883 ? _880 : 6.283185482025146484375;
                                float _1038 = _556 * _1037;
                                vec2 _1039 = _20._m0[_983]._m1 + _19._m33;
                                vec2 _1042 = (_20._m0[_983]._m1 + vec2(_20._m0[_983]._m2)) - _19._m33;
                                float _1044;
                                _1044 = 0.0;
                                for (int _1047 = 0; _1047 < 12; )
                                {
                                    float _1052 = float(uint(_1047));
                                    float _1055 = sqrt(_1052 + 0.5) * 0.288675129413604736328125;
                                    float _1056 = fma(_1052, 2.3999631404876708984375, _1038);
                                    vec2 _1064 = clamp(fma((vec3(cos(_1056), sin(_1056), _1055).xy * _1055) * 2.5, _19._m33, _1023), _1039, _1042);
                                    vec2 _1067 = fract(fma(vec2(1.0) / _19._m33, _1064, vec2(0.5)));
                                    vec4 _1073 = vec4(lessThan(vec4(_1032), textureGather(sampler2D(_21, _12), _1064)));
                                    float _1076 = _1067.x;
                                    _1044 += clamp(mix(mix(_1073.w, _1073.z, _1076), mix(_1073.x, _1073.y, _1076), _1067.y), 0.0, 1.0);
                                    _1047++;
                                    continue;
                                }
                                _1085 = _1037;
                                _1086 = _883 ? _883 : true;
                                _1087 = _1044 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _1091 = _1085;
                        _1092 = _1086;
                        _1093 = _980 * mix(1.0, _1087, spvNMin(_563, _10._m0[_896]._m8));
                    }
                    else
                    {
                        _1091 = _880;
                        _1092 = _883;
                        _1093 = _980;
                    }
                    // --- RenoDX: Per-Light Micro Shadow (point/spot) ---
                    if (pc.rendering_micro_shadows > 0.5 && _1093 > 0.0) {
                        vec3 _rdx_pl_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * normalize(_927);
                        vec2 _rdx_pl_md = normalize(vec2(_rdx_pl_lv.x, -_rdx_pl_lv.y));
                        float _rdx_pl_ms = rdx_micro_shadow_march(
                            _38, _7, _396, _rdx_pl_md, _436, vec2(_34._m1));
                        _1093 *= _rdx_pl_ms;
                    }
                    vec3 _1158;
                    vec3 _1159;
                    if (_947 > 0.0)
                    {
                        vec3 _1099 = _10._m0[_896]._m1.xyz * (_1093 * ((_10._m0[_896]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                        vec3 _1106 = vec3(fma((2.0 * _943) * _943, _515, mix(0.0, 0.5, _515))) - vec3(1.0);
                        float _1127 = (_515 + 1.0) * 0.5;
                        float _1128 = _515 * _515;
                        float _1136 = _1127 * _1127;
                        float _1148 = _1128 * _1128;
                        float _1151 = fma(fma(_945, _1148, -_945), _945, 1.0);
                        _1158 = fma(_1099, (_482 + ((vec3(1.0) - _482) * pow(spvNMax(abs(1.0 - _943), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_947, sqrt(fma(fma(-_581, _1136, _581), _581, _1136)), _581 * sqrt(fma(fma(-_947, _1136, _947), _947, _1136)))) * (_1148 * (0.3183098733425140380859375 / (_1151 * _1151)))), _885);
                        _1159 = fma(_1099, _477 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1106 * pow(spvNMax(abs(1.0 - _947), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1106 * pow(spvNMax(abs(1.0 - _581), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _515))), _887);
                    }
                    else
                    {
                        _1158 = _885;
                        _1159 = _887;
                    }
                    _1160 = _1091;
                    _1161 = _1092;
                    _1162 = _1158;
                    _1163 = _1159;
                }
                else
                {
                    _1160 = _880;
                    _1161 = _883;
                    _1162 = _885;
                    _1163 = _887;
                }
                _881 = _1160;
                _884 = _1161;
                _886 = _1162;
                _888 = _1163;
            }
            else
            {
                _881 = _880;
                _884 = _883;
                _886 = _885;
                _888 = _887;
            }
        }
        vec3 _1170;
        vec3 _1172;
        _1170 = _885;
        _1172 = _887;
        float _1166;
        bool _1169;
        vec3 _1171;
        vec3 _1173;
        float _1165 = _880;
        bool _1168 = _883;
        uint _1174 = _889;
        for (; _1174 < _579; _1165 = _1166, _1168 = _1169, _1170 = _1171, _1172 = _1173, _1174++)
        {
            uint _1181 = uint(_9._m0[_1174]);
            int _1210 = int(_11._m0[_1181]._m1 >> 1u) - 1;
            if (((_11._m0[_1181]._m4 & 16777215u) & (1u << (_464 & 31u))) != 0u)
            {
                vec3 _1221 = _11._m0[_1181]._m6 * vec4(_484, 1.0);
                float _1601;
                bool _1602;
                vec3 _1603;
                vec3 _1604;
                if (all(lessThan(abs(_1221 - vec3(0.5)), vec3(0.5))))
                {
                    vec3 _1228 = _486 + _11._m0[_1181]._m9;
                    vec3 _1232 = _1228 * inversesqrt(spvNMax(dot(_1228, _1228), 1.0000000133514319600180897396058e-10));
                    float _1234 = clamp(dot(_11._m0[_1181]._m9, _1232), 0.0, 1.0);
                    float _1236 = clamp(dot(_474, _1232), 0.0, 1.0);
                    float _1238 = clamp(dot(_474, _11._m0[_1181]._m9), 0.0, 1.0);
                    int _1239 = int(_11._m0[_1181]._m4 >> 24u);
                    float _1240 = _1221.z;
                    vec3 _1279;
                    if (_1240 < _11._m0[_1181]._m2.x)
                    {
                        float _1267 = _1240 * _11._m0[_1181]._m2.z;
                        float _1270 = _1267 * _1267;
                        vec3 _1278;
                        _1278.z = dot(_304[_1239], vec4(_1267, _1270, smoothstep(0.0, 1.0, _1267), (_1270 * _1267) * fma(_1267, fma(_1267, 6.0, -15.0), 10.0)));
                        _1279 = _1278;
                    }
                    else
                    {
                        vec3 _1265;
                        if (_1240 > _11._m0[_1181]._m2.y)
                        {
                            float _1253 = (1.0 - _1240) * _11._m0[_1181]._m2.w;
                            float _1256 = _1253 * _1253;
                            vec3 _1264;
                            _1264.z = dot(_304[_1239], vec4(_1253, _1256, smoothstep(0.0, 1.0, _1253), (_1256 * _1253) * fma(_1253, fma(_1253, 6.0, -15.0), 10.0)));
                            _1265 = _1264;
                        }
                        else
                        {
                            _1265 = vec3(0.0, 0.0, 1.0);
                        }
                        _1279 = _1265;
                    }
                    vec2 _1280 = _1221.xy;
                    vec2 _1284 = (vec2(0.5) - abs(_1280 - vec2(0.5))) * _11._m0[_1181]._m3;
                    float _1285 = _1284.x;
                    vec3 _1302;
                    if (_1285 < 1.0)
                    {
                        float _1293 = _1285 * _1285;
                        vec3 _1301 = _1279;
                        _1301.x = dot(_304[_1239], vec4(_1285, _1293, smoothstep(0.0, 1.0, _1285), (_1293 * _1285) * fma(_1285, fma(_1285, 6.0, -15.0), 10.0)));
                        _1302 = _1301;
                    }
                    else
                    {
                        vec3 _1290 = _1279;
                        _1290.x = 1.0;
                        _1302 = _1290;
                    }
                    float _1303 = _1284.y;
                    vec3 _1320;
                    if (_1303 < 1.0)
                    {
                        float _1311 = _1303 * _1303;
                        vec3 _1319 = _1302;
                        _1319.y = dot(_304[_1239], vec4(_1303, _1311, smoothstep(0.0, 1.0, _1303), (_1311 * _1303) * fma(_1303, fma(_1303, 6.0, -15.0), 10.0)));
                        _1320 = _1319;
                    }
                    else
                    {
                        vec3 _1308 = _1302;
                        _1308.y = 1.0;
                        _1320 = _1308;
                    }
                    float _1326 = _1238 * ((_1320.x * _1320.y) * _1320.z);
                    float _1431;
                    bool _1432;
                    float _1433;
                    if ((_11._m0[_1181]._m8 & 1u) != 0u)
                    {
                        uint _1329 = uint(int(_11._m0[_1181]._m8 >> 2u));
                        float _1425;
                        bool _1426;
                        float _1427;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1238 <= 0.0) && true)
                            {
                                _1425 = _1165;
                                _1426 = _1168;
                                _1427 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1360 = _20._m0[_1329]._m0 * vec4(_484 + (_474 * ((3.5 * float(int(sign(_1238)))) * _20._m0[_1329]._m4)), 1.0);
                                vec2 _1363 = (_1360.xy * 0.5) + vec2(0.5);
                                _1363.y = 1.0 - _1363.y;
                                float _1372 = ((_1360.z - _20._m0[_1329]._m5.y) / _20._m0[_1329]._m5.x) / _20._m0[_1329]._m6;
                                float _1377 = _1168 ? _1165 : 6.283185482025146484375;
                                float _1378 = _556 * _1377;
                                vec2 _1379 = _20._m0[_1329]._m1 + _19._m33;
                                vec2 _1382 = (_20._m0[_1329]._m1 + vec2(_20._m0[_1329]._m2)) - _19._m33;
                                float _1384;
                                _1384 = 0.0;
                                for (int _1387 = 0; _1387 < 12; )
                                {
                                    float _1392 = float(uint(_1387));
                                    float _1395 = sqrt(_1392 + 0.5) * 0.288675129413604736328125;
                                    float _1396 = fma(_1392, 2.3999631404876708984375, _1378);
                                    vec2 _1404 = clamp(fma((vec3(cos(_1396), sin(_1396), _1395).xy * _1395) * 2.5, _19._m33, _1363), _1379, _1382);
                                    vec2 _1407 = fract(fma(vec2(1.0) / _19._m33, _1404, vec2(0.5)));
                                    vec4 _1413 = vec4(lessThan(vec4(_1372), textureGather(sampler2D(_21, _12), _1404)));
                                    float _1416 = _1407.x;
                                    _1384 += clamp(mix(mix(_1413.w, _1413.z, _1416), mix(_1413.x, _1413.y, _1416), _1407.y), 0.0, 1.0);
                                    _1387++;
                                    continue;
                                }
                                _1425 = _1377;
                                _1426 = _1168 ? _1168 : true;
                                _1427 = _1384 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _1431 = _1425;
                        _1432 = _1426;
                        _1433 = _1326 * mix(1.0, _1427, spvNMin(_563, _11._m0[_1181]._m5));
                    }
                    else
                    {
                        _1431 = _1165;
                        _1432 = _1168;
                        _1433 = _1326;
                    }
                    // --- RenoDX: Per-Light Micro Shadow (area/probe) ---
                    if (pc.rendering_micro_shadows > 0.5 && _1433 > 0.0) {
                        vec3 _rdx_pl_lv2 = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _11._m0[_1181]._m9;
                        vec2 _rdx_pl_md2 = normalize(vec2(_rdx_pl_lv2.x, -_rdx_pl_lv2.y));
                        float _rdx_pl_ms2 = rdx_micro_shadow_march(
                            _38, _7, _396, _rdx_pl_md2, _436, vec2(_34._m1));
                        _1433 *= _rdx_pl_ms2;
                    }
                    vec3 _1466;
                    if (_1210 >= 0)
                    {
                        vec2 _1439 = (subgroupQuadSwapHorizontal(_1280) - _1280) * _493;
                        vec2 _1442 = (subgroupQuadSwapVertical(_1280) - _1280) * _499;
                        vec2 _1446 = mix(_1439, vec2(0.0), bvec2(any(isnan(_1439))));
                        vec2 _1450 = mix(_1442, vec2(0.0), bvec2(any(isnan(_1442))));
                        bvec2 _1459 = bvec2(any(greaterThan(abs(vec4(_1446, _1450)), vec4(0.015625))));
                        int _73 = _1210;
                        _1466 = _11._m0[_1181]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_73], _7)), _1280, mix(_1446, vec2(0.0), _1459), mix(_1450, vec2(0.0), _1459)).xyz;
                    }
                    else
                    {
                        _1466 = _11._m0[_1181]._m0;
                    }
                    vec3 _1599;
                    vec3 _1600;
                    SPIRV_CROSS_BRANCH
                    if ((_11._m0[_1181]._m1 & 1u) != 0u)
                    {
                        vec3 _1597;
                        vec3 _1598;
                        if (_1238 > 0.0)
                        {
                            vec3 _1538 = _1466 * (_1433 * _6._m0[0u]);
                            vec3 _1545 = vec3(fma((2.0 * _1234) * _1234, _515, mix(0.0, 0.5, _515))) - vec3(1.0);
                            float _1566 = (_515 + 1.0) * 0.5;
                            float _1567 = _515 * _515;
                            float _1575 = _1566 * _1566;
                            float _1587 = _1567 * _1567;
                            float _1590 = fma(fma(_1236, _1587, -_1236), _1236, 1.0);
                            _1597 = fma(_1538, (_482 + ((vec3(1.0) - _482) * pow(spvNMax(abs(1.0 - _1234), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1238, sqrt(fma(fma(-_581, _1575, _581), _581, _1575)), _581 * sqrt(fma(fma(-_1238, _1575, _1238), _1238, _1575)))) * (_1587 * (0.3183098733425140380859375 / (_1590 * _1590)))), _1170);
                            _1598 = fma(_1538, _477 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1545 * pow(spvNMax(abs(1.0 - _1238), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1545 * pow(spvNMax(abs(1.0 - _581), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _515))), _1172);
                        }
                        else
                        {
                            _1597 = _1170;
                            _1598 = _1172;
                        }
                        _1599 = _1597;
                        _1600 = _1598;
                    }
                    else
                    {
                        vec3 _1532;
                        vec3 _1533;
                        if (_1238 > 0.0)
                        {
                            vec3 _1473 = _1466 * _1433;
                            vec3 _1480 = vec3(fma((2.0 * _1234) * _1234, _515, mix(0.0, 0.5, _515))) - vec3(1.0);
                            float _1501 = (_515 + 1.0) * 0.5;
                            float _1502 = _515 * _515;
                            float _1510 = _1501 * _1501;
                            float _1522 = _1502 * _1502;
                            float _1525 = fma(fma(_1236, _1522, -_1236), _1236, 1.0);
                            _1532 = fma(_1473, (_482 + ((vec3(1.0) - _482) * pow(spvNMax(abs(1.0 - _1234), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1238, sqrt(fma(fma(-_581, _1510, _581), _581, _1510)), _581 * sqrt(fma(fma(-_1238, _1510, _1238), _1238, _1510)))) * (_1522 * (0.3183098733425140380859375 / (_1525 * _1525)))), _1170);
                            _1533 = fma(_1473, _477 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1480 * pow(spvNMax(abs(1.0 - _1238), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1480 * pow(spvNMax(abs(1.0 - _581), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _515))), _1172);
                        }
                        else
                        {
                            _1532 = _1170;
                            _1533 = _1172;
                        }
                        _1599 = _1532;
                        _1600 = _1533;
                    }
                    _1601 = _1431;
                    _1602 = _1432;
                    _1603 = _1599;
                    _1604 = _1600;
                }
                else
                {
                    _1601 = _1165;
                    _1602 = _1168;
                    _1603 = _1170;
                    _1604 = _1172;
                }
                _1166 = _1601;
                _1169 = _1602;
                _1171 = _1603;
                _1173 = _1604;
            }
            else
            {
                _1166 = _1165;
                _1169 = _1168;
                _1171 = _1170;
                _1173 = _1172;
            }
        }
        vec3 _1606 = reflect(-_486, _474);
        vec3 _1608 = vec3(_482.x, _482.y, _482.z);
        vec3 _1618 = textureLod(samplerCube(_14, _7), _474, 0.0).xyz * _19._m27;
        vec3 _1625 = textureLod(samplerCube(_15, _7), _1606, fma(_515, 8.0, _19._m30 - 8.0)).xyz * _19._m27;
        vec3 _1650;
        vec3 _1651;
        SPIRV_CROSS_BRANCH
        if (_19._m29 > 0.0)
        {
            vec3 _1640 = vec3(_19._m29);
            _1650 = mix(_1625, textureLod(samplerCube(_17, _7), _1606, fma(_515, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _1640);
            _1651 = mix(_1618, textureLod(samplerCube(_16, _7), _474, 0.0).xyz * _19._m28, _1640);
        }
        else
        {
            _1650 = _1625;
            _1651 = _1618;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.5) {
            float _rdx_cubeMod = rdx_cubemap_modulation(_1651, _515);
            _1650 *= _rdx_cubeMod;
            _1651 *= _rdx_cubeMod;
        }
        float _1652 = spvNMax(dot(_486, _474), 0.001953125);
        vec4 _1657 = textureLod(sampler2D(_18, _12), vec2(_1652, _515), 0.0);
        uvec4 _1668 = uvec4(_8._m0[_564]);
        uint _1670 = _1668.y;
        uint _1680 = ((_1668.z >> 0u) & 1023u) + (((_1670 >> 12u) & 4095u) + (((_1670 >> 0u) & 4095u) + _1668.x));
        uint _1682 = (_1670 >> 24u) + _1680;
        vec3 _1684;
        vec3 _1687;
        _1684 = _1650 * ((_1608 * _1657.x) + vec3(_1657.y));
        _1687 = _1651 * (_477 * _1657.z);
        vec3 _1685;
        vec3 _1688;
        for (uint _1689 = _1680; _1689 < _1682; _1684 = _1685, _1687 = _1688, _1689++)
        {
            uint _1696 = uint(_9._m0[_1689]);
            int _1715 = int((_13._m0[_1696]._m5 >> 1u) & 3u);
            mat3 _1719 = mat3(_13._m0[_1696]._m1[0], _13._m0[_1696]._m1[1], _13._m0[_1696]._m1[2]);
            int _1725 = (int((_13._m0[_1696]._m5 >> 3u) & 16383u) - 1) * 2;
            int _1730 = (int((_13._m0[_1696]._m5 >> 17u) & 16383u) - 1) * 2;
            int _1735 = (int((_13._m0[_1696]._m6 >> 0u) & 65535u) - 1) * 2;
            int _1740 = (int((_13._m0[_1696]._m6 >> 16u) & 65535u) - 1) * 2;
            float _1743 = (_13._m0[_1696]._m3 < 0.0) ? (-_13._m0[_1696]._m3) : 1.0;
            vec3 _1745 = _1719 * (_484 - _13._m0[_1696]._m1[3]);
            bool _1746 = int(_13._m0[_1696]._m5 & 1u) == 1;
            vec3 _1747 = abs(_1745);
            float _1750 = dot(_1745, _1745);
            if (_1746 ? any(greaterThanEqual(_1747, _13._m0[_1696]._m0.xyz)) : (_1750 >= _13._m0[_1696]._m0.y))
            {
                _1685 = _1684;
                _1688 = _1687;
                continue;
            }
            vec3 _1924;
            SPIRV_CROSS_FLATTEN
            if ((_1715 & 1) != 0)
            {
                vec3 _1760 = _1719 * _474;
                vec2 _1849;
                bool _1850;
                if (_1746)
                {
                    vec2 _1844;
                    bool _1848;
                    do
                    {
                        vec3 _1828 = (_13._m0[_1696]._m0.xyz - _1745) / _1760;
                        vec3 _1831 = ((-_13._m0[_1696]._m0.xyz) - _1745) / _1760;
                        vec3 _1832 = spvNMin(_1828, _1831);
                        vec3 _1833 = spvNMax(_1828, _1831);
                        float _1838 = spvNMax(_1832.x, spvNMax(_1832.y, _1832.z));
                        float _1843 = spvNMin(_1833.x, spvNMin(_1833.y, _1833.z));
                        _1844 = vec2(_1838, _1843);
                        if (_1838 > _1843)
                        {
                            _1848 = false;
                            break;
                        }
                        _1848 = true;
                        break;
                    } while(false);
                    _1849 = _1844;
                    _1850 = _1848;
                }
                else
                {
                    vec2 _1823;
                    bool _1824;
                    do
                    {
                        float _1766 = dot(_1760, _1760);
                        float _1767 = dot(_1760, _1745);
                        float _1768 = 2.0 * _1767;
                        float _1769 = _1750 - _13._m0[_1696]._m0.y;
                        float _1805;
                        float _1806;
                        bool _1807;
                        do
                        {
                            float _1775 = fma(_1768, _1768, -((4.0 * _1766) * _1769));
                            float _1803;
                            float _1804;
                            if (_1775 < 0.0)
                            {
                                _1805 = 0.0;
                                _1806 = 0.0;
                                _1807 = false;
                                break;
                            }
                            else
                            {
                                if (_1775 == 0.0)
                                {
                                    float _1802 = (_1767 * (-1.0)) * (1.0 / _1766);
                                    _1803 = _1802;
                                    _1804 = _1802;
                                }
                                else
                                {
                                    float _1795;
                                    if (_1768 > 0.0)
                                    {
                                        _1795 = (-0.5) * fma(2.0, _1767, sqrt(_1775));
                                    }
                                    else
                                    {
                                        _1795 = (-0.5) * fma(2.0, _1767, -sqrt(_1775));
                                    }
                                    _1803 = _1769 * (1.0 / _1795);
                                    _1804 = _1795 * (1.0 / _1766);
                                }
                            }
                            _1805 = _1803;
                            _1806 = _1804;
                            _1807 = true;
                            break;
                        } while(false);
                        if (!_1807)
                        {
                            _1823 = vec2(0.0);
                            _1824 = false;
                            break;
                        }
                        if ((_1806 < 0.0) && (_1805 < 0.0))
                        {
                            _1823 = vec2(0.0);
                            _1824 = false;
                            break;
                        }
                        vec2 _1822;
                        if (_1806 > _1805)
                        {
                            _1822 = vec2(_1805, _1806);
                        }
                        else
                        {
                            _1822 = vec2(_1806, _1805);
                        }
                        _1823 = _1822;
                        _1824 = true;
                        break;
                    } while(false);
                    _1849 = _1823;
                    _1850 = _1824;
                }
                vec3 _1853 = _1745 + (_1760 * _1849.y);
                float _1874;
                if (_1746)
                {
                    _1874 = 1.0 - clamp(length(spvNMax(_1747 - (_13._m0[_1696]._m0.xyz - vec3(_13._m0[_1696]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1696]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _1874 = clamp((_13._m0[_1696]._m0.x - length(_1745)) * (1.0 / spvNMax(_13._m0[_1696]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _1877 = float(_1850) * smoothstep(0.0, 1.0, _1874);
                vec4 _1919;
                SPIRV_CROSS_BRANCH
                if (_1877 > 9.9999997473787516355514526367188e-05)
                {
                    float _1886 = mix(clamp((_1849.y * (1.0 / length(_1853))) * _515, 0.0, _515), _515, _515);
                    vec3 _1888 = mix(_1853, _1760, vec3(_1886));
                    int _77 = _1725;
                    vec4 _1889 = textureLod(nonuniformEXT(samplerCube(_24[_77], _7)), _1888, 0.0);
                    int _81 = _1725 + 1;
                    _1889.w = textureLod(nonuniformEXT(samplerCube(_24[_81], _7)), _1888, 0.0).x;
                    vec4 _1904;
                    SPIRV_CROSS_BRANCH
                    if (_1730 >= 0)
                    {
                        int _85 = _1730;
                        vec4 _1897 = textureLod(nonuniformEXT(samplerCube(_24[_85], _7)), _1888, 0.0);
                        int _89 = _1730 + 1;
                        _1897.w = textureLod(nonuniformEXT(samplerCube(_24[_89], _7)), _1888, 0.0).x;
                        _1904 = mix(_1889, _1897, vec4(_13._m0[_1696]._m3));
                    }
                    else
                    {
                        _1904 = _1889;
                    }
                    vec4 _1905 = _1904 * _1743;
                    vec3 _1914 = (_1905.xyz * _13._m0[_1696]._m4).xyz * (_477 * textureLod(sampler2D(_18, _12), vec2(_1652, _1886), 0.0).z);
                    vec4 _1915 = vec4(_1914.x, _1914.y, _1914.z, _1905.w);
                    _1915.w = _1905.w * _1877;
                    _1919 = _1915;
                }
                else
                {
                    _1919 = vec4(0.0);
                }
                _1924 = mix(_1687, _1919.xyz, vec3(_1919.w));
            }
            else
            {
                _1924 = _1687;
            }
            vec3 _2103;
            SPIRV_CROSS_FLATTEN
            if ((_1715 & 2) != 0)
            {
                vec3 _1929 = _1719 * _1606;
                vec2 _2018;
                bool _2019;
                if (_1746)
                {
                    vec2 _2013;
                    bool _2017;
                    do
                    {
                        vec3 _1997 = (_13._m0[_1696]._m0.xyz - _1745) / _1929;
                        vec3 _2000 = ((-_13._m0[_1696]._m0.xyz) - _1745) / _1929;
                        vec3 _2001 = spvNMin(_1997, _2000);
                        vec3 _2002 = spvNMax(_1997, _2000);
                        float _2007 = spvNMax(_2001.x, spvNMax(_2001.y, _2001.z));
                        float _2012 = spvNMin(_2002.x, spvNMin(_2002.y, _2002.z));
                        _2013 = vec2(_2007, _2012);
                        if (_2007 > _2012)
                        {
                            _2017 = false;
                            break;
                        }
                        _2017 = true;
                        break;
                    } while(false);
                    _2018 = _2013;
                    _2019 = _2017;
                }
                else
                {
                    vec2 _1992;
                    bool _1993;
                    do
                    {
                        float _1935 = dot(_1929, _1929);
                        float _1936 = dot(_1929, _1745);
                        float _1937 = 2.0 * _1936;
                        float _1938 = _1750 - _13._m0[_1696]._m0.y;
                        float _1974;
                        float _1975;
                        bool _1976;
                        do
                        {
                            float _1944 = fma(_1937, _1937, -((4.0 * _1935) * _1938));
                            float _1972;
                            float _1973;
                            if (_1944 < 0.0)
                            {
                                _1974 = 0.0;
                                _1975 = 0.0;
                                _1976 = false;
                                break;
                            }
                            else
                            {
                                if (_1944 == 0.0)
                                {
                                    float _1971 = (_1936 * (-1.0)) * (1.0 / _1935);
                                    _1972 = _1971;
                                    _1973 = _1971;
                                }
                                else
                                {
                                    float _1964;
                                    if (_1937 > 0.0)
                                    {
                                        _1964 = (-0.5) * fma(2.0, _1936, sqrt(_1944));
                                    }
                                    else
                                    {
                                        _1964 = (-0.5) * fma(2.0, _1936, -sqrt(_1944));
                                    }
                                    _1972 = _1938 * (1.0 / _1964);
                                    _1973 = _1964 * (1.0 / _1935);
                                }
                            }
                            _1974 = _1972;
                            _1975 = _1973;
                            _1976 = true;
                            break;
                        } while(false);
                        if (!_1976)
                        {
                            _1992 = vec2(0.0);
                            _1993 = false;
                            break;
                        }
                        if ((_1975 < 0.0) && (_1974 < 0.0))
                        {
                            _1992 = vec2(0.0);
                            _1993 = false;
                            break;
                        }
                        vec2 _1991;
                        if (_1975 > _1974)
                        {
                            _1991 = vec2(_1974, _1975);
                        }
                        else
                        {
                            _1991 = vec2(_1975, _1974);
                        }
                        _1992 = _1991;
                        _1993 = true;
                        break;
                    } while(false);
                    _2018 = _1992;
                    _2019 = _1993;
                }
                vec3 _2022 = _1745 + (_1929 * _2018.y);
                float _2043;
                if (_1746)
                {
                    _2043 = 1.0 - clamp(length(spvNMax(_1747 - (_13._m0[_1696]._m0.xyz - vec3(_13._m0[_1696]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1696]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2043 = clamp((_13._m0[_1696]._m0.x - length(_1745)) * (1.0 / spvNMax(_13._m0[_1696]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2046 = float(_2019) * smoothstep(0.0, 1.0, _2043);
                vec4 _2098;
                SPIRV_CROSS_BRANCH
                if (_2046 > 9.9999997473787516355514526367188e-05)
                {
                    float _2055 = mix(clamp((_2018.y * (1.0 / length(_2022))) * _515, 0.0, _515), _515, _515);
                    vec3 _2057 = mix(_2022, _1929, vec3(_2055));
                    float _2058 = _2055 * 8.0;
                    int _93 = _1735;
                    int _97 = _1735 + 1;
                    vec4 _2066 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_93], _7)), _2057, _2058).xyz, textureLod(nonuniformEXT(samplerCube(_24[_97], _7)), _2057, _2058).x);
                    vec4 _2080;
                    SPIRV_CROSS_BRANCH
                    if (_1740 >= 0)
                    {
                        int _101 = _1740;
                        int _105 = _1740 + 1;
                        _2080 = mix(_2066, vec4(textureLod(nonuniformEXT(samplerCube(_24[_101], _7)), _2057, _2058).xyz, textureLod(nonuniformEXT(samplerCube(_24[_105], _7)), _2057, _2058).x), vec4(_13._m0[_1696]._m3));
                    }
                    else
                    {
                        _2080 = _2066;
                    }
                    vec4 _2081 = _2080 * _1743;
                    vec4 _2086 = textureLod(sampler2D(_18, _12), vec2(_1652, _2055), 0.0);
                    vec3 _2093 = (_2081.xyz * _13._m0[_1696]._m4).xyz * ((_1608 * _2086.x) + vec3(_2086.y));
                    vec4 _2094 = vec4(_2093.x, _2093.y, _2093.z, _2081.w);
                    _2094.w = _2081.w * _2046;
                    _2098 = _2094;
                }
                else
                {
                    _2098 = vec4(0.0);
                }
                _2103 = mix(_1684, _2098.xyz, vec3(_2098.w));
            }
            else
            {
                _2103 = _1684;
            }
            _1685 = _2103;
            _1688 = _1924;
        }
        float _2104 = _6._m0[0u] * 100.0;
        bool _2109 = _26._m19 > 0.0;
        vec3 _2170;
        SPIRV_CROSS_BRANCH
        if (_2109 && (_26._m35 == 0.0))
        {
            vec3 _2123 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _2124 = length(_2123);
            vec3 _2135;
            float _2136;
            if (_2124 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2133 = _2123;
                _2133.z = _2123.z + _29._m0;
                _2135 = _2133;
                _2136 = length(_2133);
            }
            else
            {
                _2135 = _2123;
                _2136 = _2124;
            }
            float _2139 = dot(_2135 / vec3(_2136), _26._m36);
            float _2140 = _29._m0 / _2136;
            _2170 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_2139 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_2136 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_2139 < (-sqrt(fma(-_2140, _2140, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _2170 = _26._m2;
        }
        float _2183 = texelFetch(_40, ivec3(int(_550), int(_551), 0).xy, 0).x;
        float _2268;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _2207 = _27._m6 + _484;
            vec3 _2214 = vec3(0.0, _26._m18.z, 0.0) + (_2207 - vec3(0.0, _26._m25, 0.0));
            float _2218 = dot(_2214, _26._m24);
            vec2 _2228 = ((((_2214 + (_26._m24 * (sqrt(fma(_2218, _2218, fma(_26._m18.z, _26._m18.z, -dot(_2214, _2214)))) - _2218))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _2228.x = 1.0 - _2228.x;
            vec3 _2241 = vec3(0.0, _26._m23.z, 0.0) + (_2207 - vec3(0.0, _26._m27, 0.0));
            float _2245 = dot(_2241, _26._m26);
            vec2 _2255 = ((((_2241 + (_26._m26 * (sqrt(fma(_2245, _2245, fma(_26._m23.z, _26._m23.z, -dot(_2241, _2241)))) - _2245))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _2255.x = 1.0 - _2255.x;
            _2268 = _2183 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _2228, 0.0).x, textureLod(sampler2D(_33, _7), _2255, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _2268 = _2183;
        }
        float _2358;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _2296 = _27._m6 + _484;
            vec3 _2304 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _2296) - vec3(0.0, _26._m30, 0.0));
            float _2308 = dot(_2304, _26._m24);
            vec2 _2318 = ((((_2304 + (_26._m24 * (sqrt(fma(_2308, _2308, fma(_26._m28.z, _26._m28.z, -dot(_2304, _2304)))) - _2308))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _2318.x = 1.0 - _2318.x;
            vec3 _2332 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _2296) - vec3(0.0, _26._m33, 0.0));
            float _2336 = dot(_2332, _26._m26);
            vec2 _2346 = ((((_2332 + (_26._m26 * (sqrt(fma(_2336, _2336, fma(_26._m31.z, _26._m31.z, -dot(_2332, _2332)))) - _2336))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _2346.x = 1.0 - _2346.x;
            _2358 = _2268 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _2318, 0.0).x, textureLod(sampler2D(_23, _7), _2346, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _2358 = _2268;
        }
        vec3 _2360 = _2170 * (_2358 * _6._m0[0u]);
        vec3 _2363 = reflect(_486, _474);
        float _2367 = clamp(dot(_26._m0, normalize(_486 + _26._m0)), 0.0, 1.0);
        float _2369 = clamp(dot(_474, _26._m0), 0.0, 1.0);
        vec3 _2376 = vec3(fma((2.0 * _2367) * _2367, _515, mix(0.0, 0.5, _515))) - vec3(1.0);
        float _2395 = dot(_26._m0, _2363);
        vec3 _2405 = mix(_2363, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_2363 - (_26._m0 * _2395)) * 0.0045900647528469562530517578125)), bvec3(_2395 < 0.999989449977874755859375));
        vec3 _2407 = normalize(_486 + _2405);
        float _2411 = clamp(dot(_474, _2407), 0.0, 1.0);
        float _2413 = clamp(dot(_474, _2405), 0.0, 1.0);
        float _2415 = (_515 + 1.0) * 0.5;
        float _2416 = _515 * _515;
        float _2424 = _2415 * _2415;
        float _2436 = _2416 * _2416;
        float _2439 = fma(fma(_2411, _2436, -_2411), _2411, 1.0);
        float _2469;
        float _2470;
        if (_34._m0.x > 0.0)
        {
            vec4 _2458 = textureLod(sampler2D(_39, _12), _396, 0.0);
            float _2459 = _2458.x;
            _2469 = clamp((pow(spvNMax(abs(_580 + _2459), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _515, -1.0))) - 1.0) + _2459, 0.0, 1.0);
            _2470 = _2459;
        }
        else
        {
            _2469 = 1.0;
            _2470 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.5) {
            float _rdx_aoExtra = mix(1.0, _2470, 0.7);
            _1170 *= _rdx_aoExtra;
            _1172 *= _rdx_aoExtra;
        }
        vec3 _2478 = ((_1172 + ((_2360 * (_477 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2376 * pow(spvNMax(abs(1.0 - _2369), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2376 * pow(spvNMax(abs(1.0 - _581), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _515))))) * _2369)) * mix(1.0, _2470, _34._m0.y)) + ((_1687 * _2104) * _2470);
        vec3 _2480 = ((_1170 + ((_2360 * ((_482 + ((vec3(1.0) - _482) * pow(spvNMax(abs(1.0 - clamp(dot(_2405, _2407), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2413, sqrt(fma(fma(-_581, _2424, _581), _581, _2424)), _581 * sqrt(fma(fma(-_2413, _2424, _2413), _2413, _2424)))) * (_2436 * (0.3183098733425140380859375 / (_2439 * _2439)))))) * _2369)) * mix(1.0, _2469, _34._m0.y)) + ((_1684 * _2104) * _2469);
        // --- RenoDX: Multi-Scatter GGX Energy Compensation ---
        if (pc.rendering_multi_scatter > 0.5) {
            vec3 _rdx_ms = rdx_multi_scatter_compensation(_581, _515, _482);
            _2480 *= _rdx_ms;
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _2183, 0.5);
            _2478 *= _rdx_csm_shadow;
            _2480 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _38, _7, _396, _rdx_marchDir, _436, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _2478 *= _rdx_micro;
            _2480 *= _rdx_micro;
        }
        vec3 _2985;
        vec3 _2986;
        SPIRV_CROSS_BRANCH
        if (_2109)
        {
            vec3 _2488 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _2489 = vec3(0.0, 636100.0, 0.0) + (_484 + _27._m6);
            float _2490 = length(_2489);
            vec3 _2494 = (_2489 / vec3(_2490)) * spvNMax(_2490, 636100.0);
            vec3 _2495 = _2494 - _2488;
            float _2496 = length(_2495);
            vec3 _2498 = _2495 / vec3(_2496);
            float _2499 = length(_2488);
            vec3 _2513;
            vec3 _2514;
            float _2515;
            if (_2499 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2508 = _2488;
                _2508.z = _2488.z + _29._m0;
                vec3 _2511 = _2494;
                _2511.z = _2494.z + _29._m0;
                _2513 = _2511;
                _2514 = _2508;
                _2515 = length(_2508);
            }
            else
            {
                _2513 = _2494;
                _2514 = _2488;
                _2515 = _2499;
            }
            float _2516 = dot(_2514, _2498);
            float _2527 = spvNMax((-_2516) - sqrt(fma(_29._m1, _29._m1, fma(_2516, _2516, -(_2515 * _2515)))), 0.0);
            bool _2530 = (_2527 > 0.0) && (_2527 < _2496);
            vec3 _2538;
            float _2539;
            float _2540;
            if (_2530)
            {
                _2538 = _2514 + (_2498 * _2527);
                _2539 = _2496 - _2527;
                _2540 = (_2516 + _2527) / _29._m1;
            }
            else
            {
                _2538 = _2514;
                _2539 = _2496;
                _2540 = _2516 / _2515;
            }
            float _2541 = _2530 ? _29._m1 : _2515;
            vec3 _2978;
            vec3 _2979;
            if (_2541 <= _29._m1)
            {
                float _2546 = dot(_2498, _26._m36);
                float _2548 = dot(_2538, _26._m36) / _2541;
                float _2549 = _29._m0 + 600.0;
                bool _2550 = _2541 < _2549;
                vec3 _2555;
                if (_2550)
                {
                    _2555 = _2513 * (_2549 / _2541);
                }
                else
                {
                    _2555 = _2513;
                }
                float _2556 = _2550 ? _2549 : _2541;
                float _2557 = length(_2555);
                float _2558 = dot(_2555, _2498);
                float _2560 = dot(_2555, _26._m36) / _2557;
                vec2 _2571 = vec2(_2540, _2540 + (_2539 / _2556));
                vec2 _2572 = _2571 * sqrt((0.5 / _29._m4) * _2556);
                vec2 _2575 = vec2(ivec2(sign(_2572)));
                vec2 _2576 = _2572 * _2572;
                float _2590 = -_2539;
                float _2592 = 2.0 * _2556;
                float _2594 = (_2539 / _2592) + _2540;
                float _2602 = _29._m0 - _2556;
                vec2 _2617 = _2571 * sqrt((0.5 / _29._m6) * _2556);
                vec2 _2620 = vec2(ivec2(sign(_2617)));
                vec2 _2621 = _2617 * _2617;
                vec3 _2651 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _2556) * exp(_2602 / _29._m4)) * (((_2575.y > _2575.x) ? exp(_2576.x) : 0.0) + dot((_2575 / ((abs(_2572) * 2.3192999362945556640625) + sqrt((_2576 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2590 / _29._m4) * _2594)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _2556) * exp(_2602 / _29._m6)) * (((_2620.y > _2620.x) ? exp(_2621.x) : 0.0) + dot((_2620 / ((abs(_2617) * 2.3192999362945556640625) + sqrt((_2621 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2590 / _29._m6) * _2594)), vec2(1.0, -1.0))))));
                vec3 _2652 = spvNMin(_2651, vec3(1.0));
                float _2653 = _29._m0 / _2556;
                float _2656 = sqrt(fma(-_2653, _2653, 1.0));
                float _2658 = _2540 - (-_2656);
                vec4 _2941;
                if (abs(_2658) < 0.0040000001899898052215576171875)
                {
                    float _2766 = (-0.0040000001899898052215576171875) - _2656;
                    float _2768 = fma(_2556, _2556, _2539 * _2539);
                    float _2769 = _2592 * _2539;
                    float _2771 = sqrt(fma(_2769, _2766, _2768));
                    float _2772 = fma(_2556, _2766, _2539);
                    float _2775 = -(_29._m0 * _29._m0);
                    float _2777 = sqrt(fma(_29._m1, _29._m1, _2775));
                    float _2779 = sqrt(fma(_2556, _2556, _2775));
                    float _2780 = _2556 * _2766;
                    float _2782 = -(_2556 * _2556);
                    float _2784 = fma(_29._m0, _29._m0, fma(_2780, _2780, _2782));
                    vec4 _2790 = vec4(-1.0, _2777 * _2777, _2777, 0.50390625);
                    vec4 _2791 = mix(_2790, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2780 < 0.0) && (_2784 > 0.0)));
                    float _2793 = fma(_2779 / _2777, 0.96875, 0.015625);
                    float _2803 = fma(fma(_2780, _2791.x, sqrt(_2784 + _2791.y)) / (_2779 + _2791.z), 0.4921875, _2791.w);
                    float _2809 = _2546 + 1.0;
                    float _2811 = floor(_2809 * 3.5);
                    float _2813 = fma(_2809, 3.5, -_2811);
                    float _2814 = _2811 + fma(fma(atan(spvNMax(_2548, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2815 = _2814 * 0.125;
                    float _2819 = 1.0 - _2813;
                    float _2822 = (_2814 + 1.0) * 0.125;
                    float _2829 = sqrt(fma(_2771, _2771, _2775));
                    float _2833 = fma(_29._m0, _29._m0, fma(_2772, _2772, -(_2771 * _2771)));
                    vec4 _2838 = mix(_2790, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2772 < 0.0) && (_2833 > 0.0)));
                    float _2840 = fma(_2829 / _2777, 0.96875, 0.015625);
                    float _2850 = fma(fma(_2772, _2838.x, sqrt(_2833 + _2838.y)) / (_2829 + _2838.z), 0.4921875, _2838.w);
                    float _2856 = _2811 + fma(fma(atan(spvNMax(_2560, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2857 = _2856 * 0.125;
                    float _2863 = (_2856 + 1.0) * 0.125;
                    vec4 _2869 = _2652.xyzx;
                    float _2873 = 0.0040000001899898052215576171875 - _2656;
                    float _2875 = sqrt(fma(_2769, _2873, _2768));
                    float _2876 = fma(_2556, _2873, _2539);
                    float _2877 = _2556 * _2873;
                    float _2879 = fma(_29._m0, _29._m0, fma(_2877, _2877, _2782));
                    vec4 _2884 = mix(_2790, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2877 < 0.0) && (_2879 > 0.0)));
                    float _2894 = fma(fma(_2877, _2884.x, sqrt(_2879 + _2884.y)) / (_2779 + _2884.z), 0.4921875, _2884.w);
                    float _2905 = sqrt(fma(_2875, _2875, _2775));
                    float _2909 = fma(_29._m0, _29._m0, fma(_2876, _2876, -(_2875 * _2875)));
                    vec4 _2914 = mix(_2790, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2876 < 0.0) && (_2909 > 0.0)));
                    float _2916 = fma(_2905 / _2777, 0.96875, 0.015625);
                    float _2926 = fma(fma(_2876, _2914.x, sqrt(_2909 + _2914.y)) / (_2905 + _2914.z), 0.4921875, _2914.w);
                    _2941 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2857, _2850, _2840), 0.0) * _2819) + (textureLod(sampler3D(_31, _7), vec3(_2863, _2850, _2840), 0.0) * _2813)), _2869, (textureLod(sampler3D(_31, _7), vec3(_2815, _2803, _2793), 0.0) * _2819) + (textureLod(sampler3D(_31, _7), vec3(_2822, _2803, _2793), 0.0) * _2813)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2857, _2926, _2916), 0.0) * _2819) + (textureLod(sampler3D(_31, _7), vec3(_2863, _2926, _2916), 0.0) * _2813)), _2869, (textureLod(sampler3D(_31, _7), vec3(_2815, _2894, _2793), 0.0) * _2819) + (textureLod(sampler3D(_31, _7), vec3(_2822, _2894, _2793), 0.0) * _2813)), vec4(0.0)), vec4((_2658 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _2666 = -(_29._m0 * _29._m0);
                    float _2668 = sqrt(fma(_29._m1, _29._m1, _2666));
                    float _2670 = sqrt(fma(_2556, _2556, _2666));
                    float _2671 = _2556 * _2540;
                    float _2675 = fma(_29._m0, _29._m0, fma(_2671, _2671, -(_2556 * _2556)));
                    vec4 _2681 = vec4(-1.0, _2668 * _2668, _2668, 0.50390625);
                    vec4 _2682 = mix(_2681, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2671 < 0.0) && (_2675 > 0.0)));
                    float _2684 = fma(_2670 / _2668, 0.96875, 0.015625);
                    float _2694 = fma(fma(_2671, _2682.x, sqrt(_2675 + _2682.y)) / (_2670 + _2682.z), 0.4921875, _2682.w);
                    float _2700 = _2546 + 1.0;
                    float _2702 = floor(_2700 * 3.5);
                    float _2704 = fma(_2700, 3.5, -_2702);
                    float _2705 = _2702 + fma(fma(atan(spvNMax(_2548, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2710 = 1.0 - _2704;
                    float _2720 = sqrt(fma(_2557, _2557, _2666));
                    float _2724 = fma(_29._m0, _29._m0, fma(_2558, _2558, -(_2557 * _2557)));
                    vec4 _2729 = mix(_2681, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2558 < 0.0) && (_2724 > 0.0)));
                    float _2731 = fma(_2720 / _2668, 0.96875, 0.015625);
                    float _2741 = fma(fma(_2558, _2729.x, sqrt(_2724 + _2729.y)) / (_2720 + _2729.z), 0.4921875, _2729.w);
                    float _2747 = _2702 + fma(fma(atan(spvNMax(_2560, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _2941 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2747 * 0.125, _2741, _2731), 0.0) * _2710) + (textureLod(sampler3D(_31, _7), vec3((_2747 + 1.0) * 0.125, _2741, _2731), 0.0) * _2704)), _2652.xyzx, (textureLod(sampler3D(_31, _7), vec3(_2705 * 0.125, _2694, _2684), 0.0) * _2710) + (textureLod(sampler3D(_31, _7), vec3((_2705 + 1.0) * 0.125, _2694, _2684), 0.0) * _2704)), vec4(0.0));
                }
                float _2956 = fma(_2546, _2546, 1.0);
                _2978 = _2652;
                _2979 = (_2941.xyz * (0.0596831031143665313720703125 * _2956)) + ((((_2941.xyz * (_2941.w * smoothstep(0.0, 0.0199999995529651641845703125, _2548))) / vec3(spvNMax(_2941.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _2546, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _2956) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _2978 = vec3(1.0);
                _2979 = vec3(0.0);
            }
            _2985 = _2480 * _2978;
            _2986 = fma(_2478, _2978, _2979 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _2985 = _2480;
            _2986 = _2478;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_38, _7, _396, _rdx_dir, _436, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _2986 = vec3(_rdx_vis);
            _2985 = vec3(0.0);
        }
        imageStore(_42, ivec2(_379), vec4(_2986, 1.0));
        imageStore(_43, ivec2(_379), vec4(_2985, 1.0));
        break;
    } while(false);
}

