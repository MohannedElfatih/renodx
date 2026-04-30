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

float _304;
const vec4 _315[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _346;
vec3 _347;

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
        uint _390 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _392 = _42._m0[_390];
        uvec2 _397 = (uvec2(_392 & 65535u, _392 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_397, _28._m3)) || any(greaterThan(_397, _28._m4)))
        {
            break;
        }
        vec2 _409 = vec2(_397);
        vec2 _414 = (_409 + vec2(0.5)) / vec2(_34._m1);
        vec2 _421 = ((_414 - _28._m1) / _28._m0) * 0.5;
        float _425 = _421.x;
        float _427 = _421.y;
        ivec2 _445 = ivec3(int(_397.x), int(_397.y), 0).xy;
        vec4 _449 = texelFetch(_36, _445, 0);
        vec4 _451 = texelFetch(_37, _445, 0);
        vec4 _453 = texelFetch(_38, _445, 0);
        vec4 _455 = texelFetch(_39, _445, 0);
        float _456 = _455.x;
        vec3 _474;
        do
        {
            vec3 _462 = fma(vec3(texelFetch(_35, _445, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _463 = dot(_462, _462);
            if (_463 > 54000001024.0)
            {
                _474 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _468 = 2.0 / _463;
                vec2 _470 = _462.xy * _468;
                vec3 _471 = vec3(_470.x, _470.y, _346.z);
                _471.z = 1.0 - _468;
                _474 = _471;
                break;
            }
            break; // unreachable workaround
        } while(false);
        vec3 _475 = _449.xyz;
        float _477 = _451.y;
        float _478 = _451.z;
        uint _482 = uint(roundEven(_451.w * 255.0));
        uint _483 = _482 & 7u;
        uint _485 = (_482 & 112u) >> 4u;
        vec3 _495 = _474 * mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        float _504 = spvNMax(0.0900000035762786865234375, _451.x);
        bool _505 = _483 == 6u;
        vec3 _517;
        vec4 _518;
        if (_505)
        {
            _517 = _453.xyz;
            _518 = vec4(_453.xyz, 0.0);
        }
        else
        {
            _517 = mix(vec3(0.1599999964237213134765625 * (_477 * _477)), _475, vec3(_478));
            _518 = mix(vec4(0.0), _453, bvec4(_483 == 7u));
        }
        vec3 _520 = mix(vec3(_449.x, _449.y, _449.z) * (1.0 - _478), _475, bvec3(_505));
        vec3 _521 = (((_26._m7[0].xyz * ((1.0 - _425) - _427)) + (_26._m7[1].xyz * _425)) + (_26._m7[2].xyz * _427)) * _456;
        vec3 _523 = normalize(-_521);
        uint _525 = gl_SubgroupInvocationID & 3u;
        float _530 = ((_525 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _531 = (subgroupQuadSwapHorizontal(_474) - _474) * _530;
        float _536 = ((_525 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _537 = (subgroupQuadSwapVertical(_474) - _474) * _536;
        vec3 _541 = mix(_531, vec3(0.0), bvec3(any(isnan(_531))));
        vec3 _545 = mix(_537, vec3(0.0), bvec3(any(isnan(_537))));
        float _552 = sqrt(clamp(fma(_504, _504, spvNMin(dot(_541, _541) + dot(_545, _545), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _561 = ivec2(uvec2(_409) / uvec2(_19._m25));
        int _584 = int(fma(fma(float(int(clamp(fma(log2(_456 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_561.y)), _19._m23, float(_561.x)));
        float _587 = _409.x;
        float _588 = _409.y;
        float _593 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _587, 0.005837149918079376220703125 * _588)));
        float _600 = clamp(fma(_19._m34.y, length(_521), _19._m34.x), 0.0, 1.0);
        bool _601 = _483 == 0u;
        vec3 _4058;
        vec3 _4059;
        SPIRV_CROSS_BRANCH
        if (_601)
        {
            uvec4 _3020 = uvec4(_8._m0[uint(_584)]);
            uint _3021 = _3020.x;
            uint _3022 = _3020.y;
            uint _3025 = ((_3022 >> 0u) & 4095u) + _3021;
            uint _3028 = ((_3022 >> 12u) & 4095u) + _3025;
            uint _3032 = ((_3020.z >> 0u) & 1023u) + _3028;
            float _3034 = spvNMax(dot(_495, _523), 9.9999997473787516355514526367188e-06);
            float _3036;
            bool _3039;
            vec3 _3041;
            vec3 _3043;
            uint _3045;
            _3036 = _304;
            _3039 = false;
            _3041 = vec3(0.0);
            _3043 = vec3(0.0);
            _3045 = _3021;
            float _3037;
            bool _3040;
            vec3 _3042;
            vec3 _3044;
            for (; _3045 < _3025; _3036 = _3037, _3039 = _3040, _3041 = _3042, _3043 = _3044, _3045++)
            {
                uint _3052 = uint(_9._m0[_3045]);
                float _3070 = abs(_10._m0[_3052]._m5);
                if ((_10._m0[_3052]._m6 & (1u << (_485 & 31u))) != 0u)
                {
                    vec3 _3085 = _10._m0[_3052]._m0.xyz - _521;
                    float _3086 = dot(_3085, _3085);
                    vec3 _3089 = _3085 * inversesqrt(spvNMax(_3086, 1.0000000133514319600180897396058e-10));
                    float _3090 = _10._m0[_3052]._m0.w * _10._m0[_3052]._m0.w;
                    float _3328;
                    bool _3329;
                    vec3 _3330;
                    vec3 _3331;
                    if (_3086 < (1.0 / _3090))
                    {
                        vec3 _3095 = _523 + _3089;
                        vec3 _3099 = _3095 * inversesqrt(spvNMax(dot(_3095, _3095), 1.0000000133514319600180897396058e-10));
                        float _3101 = clamp(dot(_3089, _3099), 0.0, 1.0);
                        float _3103 = clamp(dot(_495, _3099), 0.0, 1.0);
                        float _3105 = clamp(dot(_495, _3089), 0.0, 1.0);
                        float _3106 = _3086 * _3090;
                        float _3112 = pow(spvNMax(abs(clamp(fma(-_3106, _3106, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_3052]._m4);
                        float _3122;
                        if (_10._m0[_3052]._m5 < 0.0)
                        {
                            _3122 = _3112 * fma(4.0, _3090, _3070);
                        }
                        else
                        {
                            _3122 = _3112 * ((1.0 / spvNMax(_3086, 9.9999997473787516355514526367188e-05)) + _3070);
                        }
                        float _3124 = 0.079577468335628509521484375 * (_3105 * _3122);
                        float _3259;
                        bool _3260;
                        float _3261;
                        if ((_10._m0[_3052]._m7 & 1u) != 0u)
                        {
                            uint _3149;
                            do
                            {
                                vec3 _3129 = -_3089;
                                float _3130 = dot(_3129, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _3131 = dot(_3129, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _3132 = dot(_3129, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _3136 = spvNMax(spvNMax(_3130, _3131), spvNMax(_3132, dot(_3129, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_3136 == _3130)
                                {
                                    _3149 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_3136 == _3131)
                                    {
                                        _3149 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_3136 == _3132)
                                        {
                                            _3149 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _3149 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _3151 = uint(int(_10._m0[_3052]._m7 >> 2u)) + _3149;
                            float _3253;
                            bool _3254;
                            float _3255;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_3105 <= 0.0) && true)
                                {
                                    _3253 = _3036;
                                    _3254 = _3039;
                                    _3255 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _3184 = _20._m0[_3151]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_3105)))) * (_20._m0[_3151]._m4 * sqrt(_3086)))), 1.0);
                                    vec3 _3188 = _3184.xyz / vec3(_3184.w);
                                    vec2 _3191 = (_3188.xy * 0.5) + vec2(0.5);
                                    _3191.y = 1.0 - _3191.y;
                                    float _3200 = (_20._m0[_3151]._m5.y / _20._m0[_3151]._m6) / (_3188.z - _20._m0[_3151]._m5.x);
                                    float _3205 = _3039 ? _3036 : 6.283185482025146484375;
                                    float _3206 = _593 * _3205;
                                    vec2 _3207 = _20._m0[_3151]._m1 + _19._m33;
                                    vec2 _3210 = (_20._m0[_3151]._m1 + vec2(_20._m0[_3151]._m2)) - _19._m33;
                                    float _3212;
                                    _3212 = 0.0;
                                    for (int _3215 = 0; _3215 < 12; )
                                    {
                                        float _3220 = float(uint(_3215));
                                        float _3223 = sqrt(_3220 + 0.5) * 0.288675129413604736328125;
                                        float _3224 = fma(_3220, 2.3999631404876708984375, _3206);
                                        vec2 _3232 = clamp(fma((vec3(cos(_3224), sin(_3224), _3223).xy * _3223) * 2.5, _19._m33, _3191), _3207, _3210);
                                        vec2 _3235 = fract(fma(vec2(1.0) / _19._m33, _3232, vec2(0.5)));
                                        vec4 _3241 = vec4(lessThan(vec4(_3200), textureGather(sampler2D(_21, _12), _3232)));
                                        float _3244 = _3235.x;
                                        _3212 += clamp(mix(mix(_3241.w, _3241.z, _3244), mix(_3241.x, _3241.y, _3244), _3235.y), 0.0, 1.0);
                                        _3215++;
                                        continue;
                                    }
                                    _3253 = _3205;
                                    _3254 = _3039 ? _3039 : true;
                                    _3255 = _3212 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _3259 = _3253;
                            _3260 = _3254;
                            _3261 = _3124 * mix(1.0, _3255, spvNMin(_600, _10._m0[_3052]._m8));
                        }
                        else
                        {
                            _3259 = _3036;
                            _3260 = _3039;
                            _3261 = _3124;
                        }
                        vec3 _3326;
                        vec3 _3327;
                        if (_3105 > 0.0)
                        {
                            vec3 _3267 = _10._m0[_3052]._m1.xyz * (_3261 * ((_10._m0[_3052]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _3274 = vec3(fma((2.0 * _3101) * _3101, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                            float _3295 = (_552 + 1.0) * 0.5;
                            float _3296 = _552 * _552;
                            float _3304 = _3295 * _3295;
                            float _3316 = _3296 * _3296;
                            float _3319 = fma(fma(_3103, _3316, -_3103), _3103, 1.0);
                            _3326 = fma(_3267, (_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _3101), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3105, sqrt(fma(fma(-_3034, _3304, _3034), _3034, _3304)), _3034 * sqrt(fma(fma(-_3105, _3304, _3105), _3105, _3304)))) * (_3316 * (0.3183098733425140380859375 / (_3319 * _3319)))), _3041);
                            _3327 = fma(_3267, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3274 * pow(spvNMax(abs(1.0 - _3105), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3274 * pow(spvNMax(abs(1.0 - _3034), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _3043);
                        }
                        else
                        {
                            _3326 = _3041;
                            _3327 = _3043;
                        }
                        _3328 = _3259;
                        _3329 = _3260;
                        _3330 = _3326;
                        _3331 = _3327;
                    }
                    else
                    {
                        _3328 = _3036;
                        _3329 = _3039;
                        _3330 = _3041;
                        _3331 = _3043;
                    }
                    _3037 = _3328;
                    _3040 = _3329;
                    _3042 = _3330;
                    _3044 = _3331;
                }
                else
                {
                    _3037 = _3036;
                    _3040 = _3039;
                    _3042 = _3041;
                    _3044 = _3043;
                }
            }
            float _3333;
            bool _3336;
            vec3 _3338;
            vec3 _3340;
            uint _3342;
            _3333 = _3036;
            _3336 = _3039;
            _3338 = _3041;
            _3340 = _3043;
            _3342 = _3045;
            float _3334;
            bool _3337;
            vec3 _3339;
            vec3 _3341;
            for (; _3342 < _3028; _3333 = _3334, _3336 = _3337, _3338 = _3339, _3340 = _3341, _3342++)
            {
                uint _3349 = uint(_9._m0[_3342]);
                float _3362 = abs(_10._m0[_3349]._m5);
                if ((_10._m0[_3349]._m6 & (1u << (_485 & 31u))) != 0u)
                {
                    vec3 _3380 = _10._m0[_3349]._m0.xyz - _521;
                    float _3381 = dot(_3380, _3380);
                    vec3 _3384 = _3380 * inversesqrt(spvNMax(_3381, 1.0000000133514319600180897396058e-10));
                    float _3385 = _10._m0[_3349]._m0.w * _10._m0[_3349]._m0.w;
                    float _3613;
                    bool _3614;
                    vec3 _3615;
                    vec3 _3616;
                    if (_3381 < (1.0 / _3385))
                    {
                        vec3 _3390 = _523 + _3384;
                        vec3 _3394 = _3390 * inversesqrt(spvNMax(dot(_3390, _3390), 1.0000000133514319600180897396058e-10));
                        float _3396 = clamp(dot(_3384, _3394), 0.0, 1.0);
                        float _3398 = clamp(dot(_495, _3394), 0.0, 1.0);
                        float _3400 = clamp(dot(_495, _3384), 0.0, 1.0);
                        float _3403 = dot(-_3384, normalize(_10._m0[_3349]._m2.xyz));
                        float _3432;
                        if (_3403 > _10._m0[_3349]._m1.w)
                        {
                            float _3407 = _3381 * _3385;
                            float _3413 = pow(spvNMax(abs(clamp(fma(-_3407, _3407, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_3349]._m4);
                            float _3423;
                            if (_10._m0[_3349]._m5 < 0.0)
                            {
                                _3423 = _3413 * fma(4.0, _3385, _3362);
                            }
                            else
                            {
                                _3423 = _3413 * ((1.0 / spvNMax(_3381, 9.9999997473787516355514526367188e-05)) + _3362);
                            }
                            float _3428 = clamp((_3403 - _10._m0[_3349]._m1.w) / spvNMax(_10._m0[_3349]._m2.w - _10._m0[_3349]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _3432 = _3400 * (_3423 * (_3428 * _3428));
                        }
                        else
                        {
                            _3432 = 0.0;
                        }
                        float _3433 = 0.3183098733425140380859375 * _3432;
                        float _3544;
                        bool _3545;
                        float _3546;
                        if ((_10._m0[_3349]._m7 & 1u) != 0u)
                        {
                            uint _3436 = uint(int(_10._m0[_3349]._m7 >> 2u));
                            float _3538;
                            bool _3539;
                            float _3540;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_3400 <= 0.0) && true)
                                {
                                    _3538 = _3333;
                                    _3539 = _3336;
                                    _3540 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _3469 = _20._m0[_3436]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_3400)))) * (_20._m0[_3436]._m4 * sqrt(_3381)))), 1.0);
                                    vec3 _3473 = _3469.xyz / vec3(_3469.w);
                                    vec2 _3476 = (_3473.xy * 0.5) + vec2(0.5);
                                    _3476.y = 1.0 - _3476.y;
                                    float _3485 = (_20._m0[_3436]._m5.y / _20._m0[_3436]._m6) / (_3473.z - _20._m0[_3436]._m5.x);
                                    float _3490 = _3336 ? _3333 : 6.283185482025146484375;
                                    float _3491 = _593 * _3490;
                                    vec2 _3492 = _20._m0[_3436]._m1 + _19._m33;
                                    vec2 _3495 = (_20._m0[_3436]._m1 + vec2(_20._m0[_3436]._m2)) - _19._m33;
                                    float _3497;
                                    _3497 = 0.0;
                                    for (int _3500 = 0; _3500 < 12; )
                                    {
                                        float _3505 = float(uint(_3500));
                                        float _3508 = sqrt(_3505 + 0.5) * 0.288675129413604736328125;
                                        float _3509 = fma(_3505, 2.3999631404876708984375, _3491);
                                        vec2 _3517 = clamp(fma((vec3(cos(_3509), sin(_3509), _3508).xy * _3508) * 2.5, _19._m33, _3476), _3492, _3495);
                                        vec2 _3520 = fract(fma(vec2(1.0) / _19._m33, _3517, vec2(0.5)));
                                        vec4 _3526 = vec4(lessThan(vec4(_3485), textureGather(sampler2D(_21, _12), _3517)));
                                        float _3529 = _3520.x;
                                        _3497 += clamp(mix(mix(_3526.w, _3526.z, _3529), mix(_3526.x, _3526.y, _3529), _3520.y), 0.0, 1.0);
                                        _3500++;
                                        continue;
                                    }
                                    _3538 = _3490;
                                    _3539 = _3336 ? _3336 : true;
                                    _3540 = _3497 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _3544 = _3538;
                            _3545 = _3539;
                            _3546 = _3433 * mix(1.0, _3540, spvNMin(_600, _10._m0[_3349]._m8));
                        }
                        else
                        {
                            _3544 = _3333;
                            _3545 = _3336;
                            _3546 = _3433;
                        }
                        vec3 _3611;
                        vec3 _3612;
                        if (_3400 > 0.0)
                        {
                            vec3 _3552 = _10._m0[_3349]._m1.xyz * (_3546 * ((_10._m0[_3349]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _3559 = vec3(fma((2.0 * _3396) * _3396, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                            float _3580 = (_552 + 1.0) * 0.5;
                            float _3581 = _552 * _552;
                            float _3589 = _3580 * _3580;
                            float _3601 = _3581 * _3581;
                            float _3604 = fma(fma(_3398, _3601, -_3398), _3398, 1.0);
                            _3611 = fma(_3552, (_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _3396), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3400, sqrt(fma(fma(-_3034, _3589, _3034), _3034, _3589)), _3034 * sqrt(fma(fma(-_3400, _3589, _3400), _3400, _3589)))) * (_3601 * (0.3183098733425140380859375 / (_3604 * _3604)))), _3338);
                            _3612 = fma(_3552, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3559 * pow(spvNMax(abs(1.0 - _3400), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3559 * pow(spvNMax(abs(1.0 - _3034), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _3340);
                        }
                        else
                        {
                            _3611 = _3338;
                            _3612 = _3340;
                        }
                        _3613 = _3544;
                        _3614 = _3545;
                        _3615 = _3611;
                        _3616 = _3612;
                    }
                    else
                    {
                        _3613 = _3333;
                        _3614 = _3336;
                        _3615 = _3338;
                        _3616 = _3340;
                    }
                    _3334 = _3613;
                    _3337 = _3614;
                    _3339 = _3615;
                    _3341 = _3616;
                }
                else
                {
                    _3334 = _3333;
                    _3337 = _3336;
                    _3339 = _3338;
                    _3341 = _3340;
                }
            }
            vec3 _3623;
            vec3 _3625;
            _3623 = _3338;
            _3625 = _3340;
            float _3619;
            bool _3622;
            vec3 _3624;
            vec3 _3626;
            float _3618 = _3333;
            bool _3621 = _3336;
            uint _3627 = _3342;
            for (; _3627 < _3032; _3618 = _3619, _3621 = _3622, _3623 = _3624, _3625 = _3626, _3627++)
            {
                uint _3634 = uint(_9._m0[_3627]);
                int _3663 = int(_11._m0[_3634]._m1 >> 1u) - 1;
                if (((_11._m0[_3634]._m4 & 16777215u) & (1u << (_485 & 31u))) != 0u)
                {
                    vec3 _3674 = _11._m0[_3634]._m6 * vec4(_521, 1.0);
                    float _4054;
                    bool _4055;
                    vec3 _4056;
                    vec3 _4057;
                    if (all(lessThan(abs(_3674 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _3681 = _523 + _11._m0[_3634]._m9;
                        vec3 _3685 = _3681 * inversesqrt(spvNMax(dot(_3681, _3681), 1.0000000133514319600180897396058e-10));
                        float _3687 = clamp(dot(_11._m0[_3634]._m9, _3685), 0.0, 1.0);
                        float _3689 = clamp(dot(_495, _3685), 0.0, 1.0);
                        float _3691 = clamp(dot(_495, _11._m0[_3634]._m9), 0.0, 1.0);
                        int _3692 = int(_11._m0[_3634]._m4 >> 24u);
                        float _3693 = _3674.z;
                        vec3 _3732;
                        if (_3693 < _11._m0[_3634]._m2.x)
                        {
                            float _3720 = _3693 * _11._m0[_3634]._m2.z;
                            float _3723 = _3720 * _3720;
                            vec3 _3731;
                            _3731.z = dot(_315[_3692], vec4(_3720, _3723, smoothstep(0.0, 1.0, _3720), (_3723 * _3720) * fma(_3720, fma(_3720, 6.0, -15.0), 10.0)));
                            _3732 = _3731;
                        }
                        else
                        {
                            vec3 _3718;
                            if (_3693 > _11._m0[_3634]._m2.y)
                            {
                                float _3706 = (1.0 - _3693) * _11._m0[_3634]._m2.w;
                                float _3709 = _3706 * _3706;
                                vec3 _3717;
                                _3717.z = dot(_315[_3692], vec4(_3706, _3709, smoothstep(0.0, 1.0, _3706), (_3709 * _3706) * fma(_3706, fma(_3706, 6.0, -15.0), 10.0)));
                                _3718 = _3717;
                            }
                            else
                            {
                                _3718 = vec3(0.0, 0.0, 1.0);
                            }
                            _3732 = _3718;
                        }
                        vec2 _3733 = _3674.xy;
                        vec2 _3737 = (vec2(0.5) - abs(_3733 - vec2(0.5))) * _11._m0[_3634]._m3;
                        float _3738 = _3737.x;
                        vec3 _3755;
                        if (_3738 < 1.0)
                        {
                            float _3746 = _3738 * _3738;
                            vec3 _3754 = _3732;
                            _3754.x = dot(_315[_3692], vec4(_3738, _3746, smoothstep(0.0, 1.0, _3738), (_3746 * _3738) * fma(_3738, fma(_3738, 6.0, -15.0), 10.0)));
                            _3755 = _3754;
                        }
                        else
                        {
                            vec3 _3743 = _3732;
                            _3743.x = 1.0;
                            _3755 = _3743;
                        }
                        float _3756 = _3737.y;
                        vec3 _3773;
                        if (_3756 < 1.0)
                        {
                            float _3764 = _3756 * _3756;
                            vec3 _3772 = _3755;
                            _3772.y = dot(_315[_3692], vec4(_3756, _3764, smoothstep(0.0, 1.0, _3756), (_3764 * _3756) * fma(_3756, fma(_3756, 6.0, -15.0), 10.0)));
                            _3773 = _3772;
                        }
                        else
                        {
                            vec3 _3761 = _3755;
                            _3761.y = 1.0;
                            _3773 = _3761;
                        }
                        float _3779 = _3691 * ((_3773.x * _3773.y) * _3773.z);
                        float _3884;
                        bool _3885;
                        float _3886;
                        if ((_11._m0[_3634]._m8 & 1u) != 0u)
                        {
                            uint _3782 = uint(int(_11._m0[_3634]._m8 >> 2u));
                            float _3878;
                            bool _3879;
                            float _3880;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_3691 <= 0.0) && true)
                                {
                                    _3878 = _3618;
                                    _3879 = _3621;
                                    _3880 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _3813 = _20._m0[_3782]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_3691)))) * _20._m0[_3782]._m4)), 1.0);
                                    vec2 _3816 = (_3813.xy * 0.5) + vec2(0.5);
                                    _3816.y = 1.0 - _3816.y;
                                    float _3825 = ((_3813.z - _20._m0[_3782]._m5.y) / _20._m0[_3782]._m5.x) / _20._m0[_3782]._m6;
                                    float _3830 = _3621 ? _3618 : 6.283185482025146484375;
                                    float _3831 = _593 * _3830;
                                    vec2 _3832 = _20._m0[_3782]._m1 + _19._m33;
                                    vec2 _3835 = (_20._m0[_3782]._m1 + vec2(_20._m0[_3782]._m2)) - _19._m33;
                                    float _3837;
                                    _3837 = 0.0;
                                    for (int _3840 = 0; _3840 < 12; )
                                    {
                                        float _3845 = float(uint(_3840));
                                        float _3848 = sqrt(_3845 + 0.5) * 0.288675129413604736328125;
                                        float _3849 = fma(_3845, 2.3999631404876708984375, _3831);
                                        vec2 _3857 = clamp(fma((vec3(cos(_3849), sin(_3849), _3848).xy * _3848) * 2.5, _19._m33, _3816), _3832, _3835);
                                        vec2 _3860 = fract(fma(vec2(1.0) / _19._m33, _3857, vec2(0.5)));
                                        vec4 _3866 = vec4(lessThan(vec4(_3825), textureGather(sampler2D(_21, _12), _3857)));
                                        float _3869 = _3860.x;
                                        _3837 += clamp(mix(mix(_3866.w, _3866.z, _3869), mix(_3866.x, _3866.y, _3869), _3860.y), 0.0, 1.0);
                                        _3840++;
                                        continue;
                                    }
                                    _3878 = _3830;
                                    _3879 = _3621 ? _3621 : true;
                                    _3880 = _3837 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _3884 = _3878;
                            _3885 = _3879;
                            _3886 = _3779 * mix(1.0, _3880, spvNMin(_600, _11._m0[_3634]._m5));
                        }
                        else
                        {
                            _3884 = _3618;
                            _3885 = _3621;
                            _3886 = _3779;
                        }
                        vec3 _3919;
                        if (_3663 >= 0)
                        {
                            vec2 _3892 = (subgroupQuadSwapHorizontal(_3733) - _3733) * _530;
                            vec2 _3895 = (subgroupQuadSwapVertical(_3733) - _3733) * _536;
                            vec2 _3899 = mix(_3892, vec2(0.0), bvec2(any(isnan(_3892))));
                            vec2 _3903 = mix(_3895, vec2(0.0), bvec2(any(isnan(_3895))));
                            bvec2 _3912 = bvec2(any(greaterThan(abs(vec4(_3899, _3903)), vec4(0.015625))));
                            int _82 = _3663;
                            _3919 = _11._m0[_3634]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_82], _7)), _3733, mix(_3899, vec2(0.0), _3912), mix(_3903, vec2(0.0), _3912)).xyz;
                        }
                        else
                        {
                            _3919 = _11._m0[_3634]._m0;
                        }
                        vec3 _4052;
                        vec3 _4053;
                        SPIRV_CROSS_BRANCH
                        if ((_11._m0[_3634]._m1 & 1u) != 0u)
                        {
                            vec3 _4050;
                            vec3 _4051;
                            if (_3691 > 0.0)
                            {
                                vec3 _3991 = _3919 * (_3886 * _6._m0[0u]);
                                vec3 _3998 = vec3(fma((2.0 * _3687) * _3687, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                float _4019 = (_552 + 1.0) * 0.5;
                                float _4020 = _552 * _552;
                                float _4028 = _4019 * _4019;
                                float _4040 = _4020 * _4020;
                                float _4043 = fma(fma(_3689, _4040, -_3689), _3689, 1.0);
                                _4050 = fma(_3991, (_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _3687), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3691, sqrt(fma(fma(-_3034, _4028, _3034), _3034, _4028)), _3034 * sqrt(fma(fma(-_3691, _4028, _3691), _3691, _4028)))) * (_4040 * (0.3183098733425140380859375 / (_4043 * _4043)))), _3623);
                                _4051 = fma(_3991, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3998 * pow(spvNMax(abs(1.0 - _3691), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3998 * pow(spvNMax(abs(1.0 - _3034), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _3625);
                            }
                            else
                            {
                                _4050 = _3623;
                                _4051 = _3625;
                            }
                            _4052 = _4050;
                            _4053 = _4051;
                        }
                        else
                        {
                            vec3 _3985;
                            vec3 _3986;
                            if (_3691 > 0.0)
                            {
                                vec3 _3926 = _3919 * _3886;
                                vec3 _3933 = vec3(fma((2.0 * _3687) * _3687, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                float _3954 = (_552 + 1.0) * 0.5;
                                float _3955 = _552 * _552;
                                float _3963 = _3954 * _3954;
                                float _3975 = _3955 * _3955;
                                float _3978 = fma(fma(_3689, _3975, -_3689), _3689, 1.0);
                                _3985 = fma(_3926, (_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _3687), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_3691, sqrt(fma(fma(-_3034, _3963, _3034), _3034, _3963)), _3034 * sqrt(fma(fma(-_3691, _3963, _3691), _3691, _3963)))) * (_3975 * (0.3183098733425140380859375 / (_3978 * _3978)))), _3623);
                                _3986 = fma(_3926, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3933 * pow(spvNMax(abs(1.0 - _3691), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3933 * pow(spvNMax(abs(1.0 - _3034), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _3625);
                            }
                            else
                            {
                                _3985 = _3623;
                                _3986 = _3625;
                            }
                            _4052 = _3985;
                            _4053 = _3986;
                        }
                        _4054 = _3884;
                        _4055 = _3885;
                        _4056 = _4052;
                        _4057 = _4053;
                    }
                    else
                    {
                        _4054 = _3618;
                        _4055 = _3621;
                        _4056 = _3623;
                        _4057 = _3625;
                    }
                    _3619 = _4054;
                    _3622 = _4055;
                    _3624 = _4056;
                    _3626 = _4057;
                }
                else
                {
                    _3619 = _3618;
                    _3622 = _3621;
                    _3624 = _3623;
                    _3626 = _3625;
                }
            }
            _4058 = _3623;
            _4059 = _3625;
        }
        else
        {
            vec3 _3015;
            vec3 _3016;
            if (_505)
            {
                uvec4 _1919 = uvec4(_8._m0[uint(_584)]);
                uint _1920 = _1919.x;
                uint _1921 = _1919.y;
                uint _1924 = ((_1921 >> 0u) & 4095u) + _1920;
                uint _1927 = ((_1921 >> 12u) & 4095u) + _1924;
                uint _1931 = ((_1919.z >> 0u) & 1023u) + _1927;
                float _1933 = spvNMax(dot(_495, _523), 9.9999997473787516355514526367188e-06);
                vec3 _1935;
                vec3 _1938;
                float _1940;
                bool _1942;
                uint _1944;
                _1935 = vec3(0.0);
                _1938 = vec3(0.0);
                _1940 = _304;
                _1942 = false;
                _1944 = _1920;
                vec3 _1936;
                vec3 _1939;
                float _1941;
                bool _1943;
                for (; _1944 < _1924; _1935 = _1936, _1938 = _1939, _1940 = _1941, _1942 = _1943, _1944++)
                {
                    uint _1951 = uint(_9._m0[_1944]);
                    float _1969 = abs(_10._m0[_1951]._m5);
                    if ((_10._m0[_1951]._m6 & (1u << (_485 & 31u))) != 0u)
                    {
                        vec3 _1984 = _10._m0[_1951]._m0.xyz - _521;
                        float _1985 = dot(_1984, _1984);
                        vec3 _1988 = _1984 * inversesqrt(spvNMax(_1985, 1.0000000133514319600180897396058e-10));
                        float _1989 = _10._m0[_1951]._m0.w * _10._m0[_1951]._m0.w;
                        vec3 _2269;
                        vec3 _2270;
                        float _2271;
                        bool _2272;
                        if (_1985 < (1.0 / _1989))
                        {
                            vec3 _1994 = _523 + _1988;
                            vec3 _1998 = _1994 * inversesqrt(spvNMax(dot(_1994, _1994), 1.0000000133514319600180897396058e-10));
                            float _2000 = clamp(dot(_1988, _1998), 0.0, 1.0);
                            float _2002 = clamp(dot(_495, _1998), 0.0, 1.0);
                            float _2004 = clamp(dot(_495, _1988), 0.0, 1.0);
                            float _2005 = _1985 * _1989;
                            float _2011 = pow(spvNMax(abs(clamp(fma(-_2005, _2005, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1951]._m4);
                            float _2021;
                            if (_10._m0[_1951]._m5 < 0.0)
                            {
                                _2021 = _2011 * fma(4.0, _1989, _1969);
                            }
                            else
                            {
                                _2021 = _2011 * ((1.0 / spvNMax(_1985, 9.9999997473787516355514526367188e-05)) + _1969);
                            }
                            float _2023 = 0.079577468335628509521484375 * (_2004 * _2021);
                            float _2158;
                            bool _2159;
                            float _2160;
                            if ((_10._m0[_1951]._m7 & 1u) != 0u)
                            {
                                uint _2048;
                                do
                                {
                                    vec3 _2028 = -_1988;
                                    float _2029 = dot(_2028, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                    float _2030 = dot(_2028, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                    float _2031 = dot(_2028, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                    float _2035 = spvNMax(spvNMax(_2029, _2030), spvNMax(_2031, dot(_2028, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                    if (_2035 == _2029)
                                    {
                                        _2048 = 0u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_2035 == _2030)
                                        {
                                            _2048 = 1u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_2035 == _2031)
                                            {
                                                _2048 = 2u;
                                                break;
                                            }
                                            else
                                            {
                                                _2048 = 3u;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                uint _2050 = uint(int(_10._m0[_1951]._m7 >> 2u)) + _2048;
                                float _2152;
                                bool _2153;
                                float _2154;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_2004 <= 0.0) && true)
                                    {
                                        _2152 = _1940;
                                        _2153 = _1942;
                                        _2154 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _2083 = _20._m0[_2050]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_2004)))) * (_20._m0[_2050]._m4 * sqrt(_1985)))), 1.0);
                                        vec3 _2087 = _2083.xyz / vec3(_2083.w);
                                        vec2 _2090 = (_2087.xy * 0.5) + vec2(0.5);
                                        _2090.y = 1.0 - _2090.y;
                                        float _2099 = (_20._m0[_2050]._m5.y / _20._m0[_2050]._m6) / (_2087.z - _20._m0[_2050]._m5.x);
                                        float _2104 = _1942 ? _1940 : 6.283185482025146484375;
                                        float _2105 = _593 * _2104;
                                        vec2 _2106 = _20._m0[_2050]._m1 + _19._m33;
                                        vec2 _2109 = (_20._m0[_2050]._m1 + vec2(_20._m0[_2050]._m2)) - _19._m33;
                                        float _2111;
                                        _2111 = 0.0;
                                        for (int _2114 = 0; _2114 < 12; )
                                        {
                                            float _2119 = float(uint(_2114));
                                            float _2122 = sqrt(_2119 + 0.5) * 0.288675129413604736328125;
                                            float _2123 = fma(_2119, 2.3999631404876708984375, _2105);
                                            vec2 _2131 = clamp(fma((vec3(cos(_2123), sin(_2123), _2122).xy * _2122) * 2.5, _19._m33, _2090), _2106, _2109);
                                            vec2 _2134 = fract(fma(vec2(1.0) / _19._m33, _2131, vec2(0.5)));
                                            vec4 _2140 = vec4(lessThan(vec4(_2099), textureGather(sampler2D(_21, _12), _2131)));
                                            float _2143 = _2134.x;
                                            _2111 += clamp(mix(mix(_2140.w, _2140.z, _2143), mix(_2140.x, _2140.y, _2143), _2134.y), 0.0, 1.0);
                                            _2114++;
                                            continue;
                                        }
                                        _2152 = _2104;
                                        _2153 = _1942 ? _1942 : true;
                                        _2154 = _2111 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _2158 = _2152;
                                _2159 = _2153;
                                _2160 = _2023 * mix(1.0, _2154, spvNMin(_600, _10._m0[_1951]._m8));
                            }
                            else
                            {
                                _2158 = _1940;
                                _2159 = _1942;
                                _2160 = _2023;
                            }
                            vec3 _2267;
                            vec3 _2268;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_1951]._m3 < 0.0)
                            {
                                vec3 _2265;
                                vec3 _2266;
                                if (_2004 > 0.0)
                                {
                                    vec3 _2219 = _10._m0[_1951]._m1.xyz * (_2160 * _6._m0[0u]);
                                    vec3 _2226 = vec3(fma((2.0 * _2000) * _2000, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                    float _2256 = clamp(_1933, 0.0, 1.0);
                                    _2265 = fma(_2219, _518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(-_2002, _2002, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(-_2004, _2256, _2004 + _2256))), _1935);
                                    _2266 = fma(_2219, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2226 * pow(spvNMax(abs(1.0 - _2004), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2226 * pow(spvNMax(abs(1.0 - _1933), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _1938);
                                }
                                else
                                {
                                    _2265 = _1935;
                                    _2266 = _1938;
                                }
                                _2267 = _2265;
                                _2268 = _2266;
                            }
                            else
                            {
                                vec3 _2213;
                                vec3 _2214;
                                if (_2004 > 0.0)
                                {
                                    vec3 _2167 = _10._m0[_1951]._m1.xyz * _2160;
                                    vec3 _2174 = vec3(fma((2.0 * _2000) * _2000, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                    float _2204 = clamp(_1933, 0.0, 1.0);
                                    _2213 = fma(_2167, _518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(-_2002, _2002, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(-_2004, _2204, _2004 + _2204))), _1935);
                                    _2214 = fma(_2167, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2174 * pow(spvNMax(abs(1.0 - _2004), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2174 * pow(spvNMax(abs(1.0 - _1933), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _1938);
                                }
                                else
                                {
                                    _2213 = _1935;
                                    _2214 = _1938;
                                }
                                _2267 = _2213;
                                _2268 = _2214;
                            }
                            _2269 = _2267;
                            _2270 = _2268;
                            _2271 = _2158;
                            _2272 = _2159;
                        }
                        else
                        {
                            _2269 = _1935;
                            _2270 = _1938;
                            _2271 = _1940;
                            _2272 = _1942;
                        }
                        _1936 = _2269;
                        _1939 = _2270;
                        _1941 = _2271;
                        _1943 = _2272;
                    }
                    else
                    {
                        _1936 = _1935;
                        _1939 = _1938;
                        _1941 = _1940;
                        _1943 = _1942;
                    }
                }
                vec3 _2274;
                vec3 _2277;
                float _2279;
                bool _2281;
                uint _2283;
                _2274 = _1935;
                _2277 = _1938;
                _2279 = _1940;
                _2281 = _1942;
                _2283 = _1944;
                vec3 _2275;
                vec3 _2278;
                float _2280;
                bool _2282;
                for (; _2283 < _1927; _2274 = _2275, _2277 = _2278, _2279 = _2280, _2281 = _2282, _2283++)
                {
                    uint _2290 = uint(_9._m0[_2283]);
                    float _2303 = abs(_10._m0[_2290]._m5);
                    if ((_10._m0[_2290]._m6 & (1u << (_485 & 31u))) != 0u)
                    {
                        vec3 _2321 = _10._m0[_2290]._m0.xyz - _521;
                        float _2322 = dot(_2321, _2321);
                        vec3 _2325 = _2321 * inversesqrt(spvNMax(_2322, 1.0000000133514319600180897396058e-10));
                        float _2326 = _10._m0[_2290]._m0.w * _10._m0[_2290]._m0.w;
                        vec3 _2596;
                        vec3 _2597;
                        float _2598;
                        bool _2599;
                        if (_2322 < (1.0 / _2326))
                        {
                            vec3 _2331 = _523 + _2325;
                            vec3 _2335 = _2331 * inversesqrt(spvNMax(dot(_2331, _2331), 1.0000000133514319600180897396058e-10));
                            float _2337 = clamp(dot(_2325, _2335), 0.0, 1.0);
                            float _2339 = clamp(dot(_495, _2335), 0.0, 1.0);
                            float _2341 = clamp(dot(_495, _2325), 0.0, 1.0);
                            float _2344 = dot(-_2325, normalize(_10._m0[_2290]._m2.xyz));
                            float _2373;
                            if (_2344 > _10._m0[_2290]._m1.w)
                            {
                                float _2348 = _2322 * _2326;
                                float _2354 = pow(spvNMax(abs(clamp(fma(-_2348, _2348, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_2290]._m4);
                                float _2364;
                                if (_10._m0[_2290]._m5 < 0.0)
                                {
                                    _2364 = _2354 * fma(4.0, _2326, _2303);
                                }
                                else
                                {
                                    _2364 = _2354 * ((1.0 / spvNMax(_2322, 9.9999997473787516355514526367188e-05)) + _2303);
                                }
                                float _2369 = clamp((_2344 - _10._m0[_2290]._m1.w) / spvNMax(_10._m0[_2290]._m2.w - _10._m0[_2290]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _2373 = _2341 * (_2364 * (_2369 * _2369));
                            }
                            else
                            {
                                _2373 = 0.0;
                            }
                            float _2374 = 0.3183098733425140380859375 * _2373;
                            float _2485;
                            bool _2486;
                            float _2487;
                            if ((_10._m0[_2290]._m7 & 1u) != 0u)
                            {
                                uint _2377 = uint(int(_10._m0[_2290]._m7 >> 2u));
                                float _2479;
                                bool _2480;
                                float _2481;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_2341 <= 0.0) && true)
                                    {
                                        _2479 = _2279;
                                        _2480 = _2281;
                                        _2481 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _2410 = _20._m0[_2377]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_2341)))) * (_20._m0[_2377]._m4 * sqrt(_2322)))), 1.0);
                                        vec3 _2414 = _2410.xyz / vec3(_2410.w);
                                        vec2 _2417 = (_2414.xy * 0.5) + vec2(0.5);
                                        _2417.y = 1.0 - _2417.y;
                                        float _2426 = (_20._m0[_2377]._m5.y / _20._m0[_2377]._m6) / (_2414.z - _20._m0[_2377]._m5.x);
                                        float _2431 = _2281 ? _2279 : 6.283185482025146484375;
                                        float _2432 = _593 * _2431;
                                        vec2 _2433 = _20._m0[_2377]._m1 + _19._m33;
                                        vec2 _2436 = (_20._m0[_2377]._m1 + vec2(_20._m0[_2377]._m2)) - _19._m33;
                                        float _2438;
                                        _2438 = 0.0;
                                        for (int _2441 = 0; _2441 < 12; )
                                        {
                                            float _2446 = float(uint(_2441));
                                            float _2449 = sqrt(_2446 + 0.5) * 0.288675129413604736328125;
                                            float _2450 = fma(_2446, 2.3999631404876708984375, _2432);
                                            vec2 _2458 = clamp(fma((vec3(cos(_2450), sin(_2450), _2449).xy * _2449) * 2.5, _19._m33, _2417), _2433, _2436);
                                            vec2 _2461 = fract(fma(vec2(1.0) / _19._m33, _2458, vec2(0.5)));
                                            vec4 _2467 = vec4(lessThan(vec4(_2426), textureGather(sampler2D(_21, _12), _2458)));
                                            float _2470 = _2461.x;
                                            _2438 += clamp(mix(mix(_2467.w, _2467.z, _2470), mix(_2467.x, _2467.y, _2470), _2461.y), 0.0, 1.0);
                                            _2441++;
                                            continue;
                                        }
                                        _2479 = _2431;
                                        _2480 = _2281 ? _2281 : true;
                                        _2481 = _2438 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _2485 = _2479;
                                _2486 = _2480;
                                _2487 = _2374 * mix(1.0, _2481, spvNMin(_600, _10._m0[_2290]._m8));
                            }
                            else
                            {
                                _2485 = _2279;
                                _2486 = _2281;
                                _2487 = _2374;
                            }
                            vec3 _2594;
                            vec3 _2595;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_2290]._m3 < 0.0)
                            {
                                vec3 _2592;
                                vec3 _2593;
                                if (_2341 > 0.0)
                                {
                                    vec3 _2546 = _10._m0[_2290]._m1.xyz * (_2487 * _6._m0[0u]);
                                    vec3 _2553 = vec3(fma((2.0 * _2337) * _2337, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                    float _2583 = clamp(_1933, 0.0, 1.0);
                                    _2592 = fma(_2546, _518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(-_2339, _2339, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(-_2341, _2583, _2341 + _2583))), _2274);
                                    _2593 = fma(_2546, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2553 * pow(spvNMax(abs(1.0 - _2341), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2553 * pow(spvNMax(abs(1.0 - _1933), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _2277);
                                }
                                else
                                {
                                    _2592 = _2274;
                                    _2593 = _2277;
                                }
                                _2594 = _2592;
                                _2595 = _2593;
                            }
                            else
                            {
                                vec3 _2540;
                                vec3 _2541;
                                if (_2341 > 0.0)
                                {
                                    vec3 _2494 = _10._m0[_2290]._m1.xyz * _2487;
                                    vec3 _2501 = vec3(fma((2.0 * _2337) * _2337, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                    float _2531 = clamp(_1933, 0.0, 1.0);
                                    _2540 = fma(_2494, _518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(-_2339, _2339, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(-_2341, _2531, _2341 + _2531))), _2274);
                                    _2541 = fma(_2494, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2501 * pow(spvNMax(abs(1.0 - _2341), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2501 * pow(spvNMax(abs(1.0 - _1933), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _2277);
                                }
                                else
                                {
                                    _2540 = _2274;
                                    _2541 = _2277;
                                }
                                _2594 = _2540;
                                _2595 = _2541;
                            }
                            _2596 = _2594;
                            _2597 = _2595;
                            _2598 = _2485;
                            _2599 = _2486;
                        }
                        else
                        {
                            _2596 = _2274;
                            _2597 = _2277;
                            _2598 = _2279;
                            _2599 = _2281;
                        }
                        _2275 = _2596;
                        _2278 = _2597;
                        _2280 = _2598;
                        _2282 = _2599;
                    }
                    else
                    {
                        _2275 = _2274;
                        _2278 = _2277;
                        _2280 = _2279;
                        _2282 = _2281;
                    }
                }
                vec3 _2601;
                vec3 _2604;
                _2601 = _2274;
                _2604 = _2277;
                vec3 _2602;
                vec3 _2605;
                float _2607;
                bool _2609;
                float _2606 = _2279;
                bool _2608 = _2281;
                uint _2610 = _2283;
                for (; _2610 < _1931; _2601 = _2602, _2604 = _2605, _2606 = _2607, _2608 = _2609, _2610++)
                {
                    uint _2617 = uint(_9._m0[_2610]);
                    int _2646 = int(_11._m0[_2617]._m1 >> 1u) - 1;
                    if (((_11._m0[_2617]._m4 & 16777215u) & (1u << (_485 & 31u))) != 0u)
                    {
                        vec3 _2657 = _11._m0[_2617]._m6 * vec4(_521, 1.0);
                        vec3 _3011;
                        vec3 _3012;
                        float _3013;
                        bool _3014;
                        if (all(lessThan(abs(_2657 - vec3(0.5)), vec3(0.5))))
                        {
                            vec3 _2664 = _523 + _11._m0[_2617]._m9;
                            vec3 _2668 = _2664 * inversesqrt(spvNMax(dot(_2664, _2664), 1.0000000133514319600180897396058e-10));
                            float _2670 = clamp(dot(_11._m0[_2617]._m9, _2668), 0.0, 1.0);
                            float _2672 = clamp(dot(_495, _2668), 0.0, 1.0);
                            float _2674 = clamp(dot(_495, _11._m0[_2617]._m9), 0.0, 1.0);
                            int _2675 = int(_11._m0[_2617]._m4 >> 24u);
                            float _2676 = _2657.z;
                            vec3 _2715;
                            if (_2676 < _11._m0[_2617]._m2.x)
                            {
                                float _2703 = _2676 * _11._m0[_2617]._m2.z;
                                float _2706 = _2703 * _2703;
                                vec3 _2714;
                                _2714.z = dot(_315[_2675], vec4(_2703, _2706, smoothstep(0.0, 1.0, _2703), (_2706 * _2703) * fma(_2703, fma(_2703, 6.0, -15.0), 10.0)));
                                _2715 = _2714;
                            }
                            else
                            {
                                vec3 _2701;
                                if (_2676 > _11._m0[_2617]._m2.y)
                                {
                                    float _2689 = (1.0 - _2676) * _11._m0[_2617]._m2.w;
                                    float _2692 = _2689 * _2689;
                                    vec3 _2700;
                                    _2700.z = dot(_315[_2675], vec4(_2689, _2692, smoothstep(0.0, 1.0, _2689), (_2692 * _2689) * fma(_2689, fma(_2689, 6.0, -15.0), 10.0)));
                                    _2701 = _2700;
                                }
                                else
                                {
                                    _2701 = vec3(0.0, 0.0, 1.0);
                                }
                                _2715 = _2701;
                            }
                            vec2 _2716 = _2657.xy;
                            vec2 _2720 = (vec2(0.5) - abs(_2716 - vec2(0.5))) * _11._m0[_2617]._m3;
                            float _2721 = _2720.x;
                            vec3 _2738;
                            if (_2721 < 1.0)
                            {
                                float _2729 = _2721 * _2721;
                                vec3 _2737 = _2715;
                                _2737.x = dot(_315[_2675], vec4(_2721, _2729, smoothstep(0.0, 1.0, _2721), (_2729 * _2721) * fma(_2721, fma(_2721, 6.0, -15.0), 10.0)));
                                _2738 = _2737;
                            }
                            else
                            {
                                vec3 _2726 = _2715;
                                _2726.x = 1.0;
                                _2738 = _2726;
                            }
                            float _2739 = _2720.y;
                            vec3 _2756;
                            if (_2739 < 1.0)
                            {
                                float _2747 = _2739 * _2739;
                                vec3 _2755 = _2738;
                                _2755.y = dot(_315[_2675], vec4(_2739, _2747, smoothstep(0.0, 1.0, _2739), (_2747 * _2739) * fma(_2739, fma(_2739, 6.0, -15.0), 10.0)));
                                _2756 = _2755;
                            }
                            else
                            {
                                vec3 _2744 = _2738;
                                _2744.y = 1.0;
                                _2756 = _2744;
                            }
                            float _2762 = _2674 * ((_2756.x * _2756.y) * _2756.z);
                            float _2867;
                            bool _2868;
                            float _2869;
                            if ((_11._m0[_2617]._m8 & 1u) != 0u)
                            {
                                uint _2765 = uint(int(_11._m0[_2617]._m8 >> 2u));
                                float _2861;
                                bool _2862;
                                float _2863;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_2674 <= 0.0) && true)
                                    {
                                        _2861 = _2606;
                                        _2862 = _2608;
                                        _2863 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _2796 = _20._m0[_2765]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_2674)))) * _20._m0[_2765]._m4)), 1.0);
                                        vec2 _2799 = (_2796.xy * 0.5) + vec2(0.5);
                                        _2799.y = 1.0 - _2799.y;
                                        float _2808 = ((_2796.z - _20._m0[_2765]._m5.y) / _20._m0[_2765]._m5.x) / _20._m0[_2765]._m6;
                                        float _2813 = _2608 ? _2606 : 6.283185482025146484375;
                                        float _2814 = _593 * _2813;
                                        vec2 _2815 = _20._m0[_2765]._m1 + _19._m33;
                                        vec2 _2818 = (_20._m0[_2765]._m1 + vec2(_20._m0[_2765]._m2)) - _19._m33;
                                        float _2820;
                                        _2820 = 0.0;
                                        for (int _2823 = 0; _2823 < 12; )
                                        {
                                            float _2828 = float(uint(_2823));
                                            float _2831 = sqrt(_2828 + 0.5) * 0.288675129413604736328125;
                                            float _2832 = fma(_2828, 2.3999631404876708984375, _2814);
                                            vec2 _2840 = clamp(fma((vec3(cos(_2832), sin(_2832), _2831).xy * _2831) * 2.5, _19._m33, _2799), _2815, _2818);
                                            vec2 _2843 = fract(fma(vec2(1.0) / _19._m33, _2840, vec2(0.5)));
                                            vec4 _2849 = vec4(lessThan(vec4(_2808), textureGather(sampler2D(_21, _12), _2840)));
                                            float _2852 = _2843.x;
                                            _2820 += clamp(mix(mix(_2849.w, _2849.z, _2852), mix(_2849.x, _2849.y, _2852), _2843.y), 0.0, 1.0);
                                            _2823++;
                                            continue;
                                        }
                                        _2861 = _2813;
                                        _2862 = _2608 ? _2608 : true;
                                        _2863 = _2820 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _2867 = _2861;
                                _2868 = _2862;
                                _2869 = _2762 * mix(1.0, _2863, spvNMin(_600, _11._m0[_2617]._m5));
                            }
                            else
                            {
                                _2867 = _2606;
                                _2868 = _2608;
                                _2869 = _2762;
                            }
                            vec3 _2902;
                            if (_2646 >= 0)
                            {
                                vec2 _2875 = (subgroupQuadSwapHorizontal(_2716) - _2716) * _530;
                                vec2 _2878 = (subgroupQuadSwapVertical(_2716) - _2716) * _536;
                                vec2 _2882 = mix(_2875, vec2(0.0), bvec2(any(isnan(_2875))));
                                vec2 _2886 = mix(_2878, vec2(0.0), bvec2(any(isnan(_2878))));
                                bvec2 _2895 = bvec2(any(greaterThan(abs(vec4(_2882, _2886)), vec4(0.015625))));
                                int _78 = _2646;
                                _2902 = _11._m0[_2617]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_78], _7)), _2716, mix(_2882, vec2(0.0), _2895), mix(_2886, vec2(0.0), _2895)).xyz;
                            }
                            else
                            {
                                _2902 = _11._m0[_2617]._m0;
                            }
                            vec3 _3009;
                            vec3 _3010;
                            SPIRV_CROSS_BRANCH
                            if ((_11._m0[_2617]._m1 & 1u) != 0u)
                            {
                                vec3 _3007;
                                vec3 _3008;
                                if (_2674 > 0.0)
                                {
                                    vec3 _2961 = _2902 * (_2869 * _6._m0[0u]);
                                    vec3 _2968 = vec3(fma((2.0 * _2670) * _2670, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                    float _2998 = clamp(_1933, 0.0, 1.0);
                                    _3007 = fma(_2961, _518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(-_2672, _2672, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(-_2674, _2998, _2674 + _2998))), _2601);
                                    _3008 = fma(_2961, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2968 * pow(spvNMax(abs(1.0 - _2674), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2968 * pow(spvNMax(abs(1.0 - _1933), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _2604);
                                }
                                else
                                {
                                    _3007 = _2601;
                                    _3008 = _2604;
                                }
                                _3009 = _3007;
                                _3010 = _3008;
                            }
                            else
                            {
                                vec3 _2955;
                                vec3 _2956;
                                if (_2674 > 0.0)
                                {
                                    vec3 _2909 = _2902 * _2869;
                                    vec3 _2916 = vec3(fma((2.0 * _2670) * _2670, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                    float _2946 = clamp(_1933, 0.0, 1.0);
                                    _2955 = fma(_2909, _518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(-_2672, _2672, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(-_2674, _2946, _2674 + _2946))), _2601);
                                    _2956 = fma(_2909, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2916 * pow(spvNMax(abs(1.0 - _2674), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2916 * pow(spvNMax(abs(1.0 - _1933), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _2604);
                                }
                                else
                                {
                                    _2955 = _2601;
                                    _2956 = _2604;
                                }
                                _3009 = _2955;
                                _3010 = _2956;
                            }
                            _3011 = _3009;
                            _3012 = _3010;
                            _3013 = _2867;
                            _3014 = _2868;
                        }
                        else
                        {
                            _3011 = _2601;
                            _3012 = _2604;
                            _3013 = _2606;
                            _3014 = _2608;
                        }
                        _2602 = _3011;
                        _2605 = _3012;
                        _2607 = _3013;
                        _2609 = _3014;
                    }
                    else
                    {
                        _2602 = _2601;
                        _2605 = _2604;
                        _2607 = _2606;
                        _2609 = _2608;
                    }
                }
                _3015 = _2601;
                _3016 = _2604;
            }
            else
            {
                vec3 _1914;
                vec3 _1915;
                if (_483 == 7u)
                {
                    uvec4 _614 = uvec4(_8._m0[uint(_584)]);
                    uint _615 = _614.x;
                    uint _616 = _614.y;
                    uint _619 = ((_616 >> 0u) & 4095u) + _615;
                    uint _622 = ((_616 >> 12u) & 4095u) + _619;
                    uint _626 = ((_614.z >> 0u) & 1023u) + _622;
                    float _628 = spvNMax(dot(_495, _523), 9.9999997473787516355514526367188e-06);
                    vec3 _630;
                    vec3 _633;
                    float _635;
                    bool _637;
                    uint _639;
                    _630 = vec3(0.0);
                    _633 = vec3(0.0);
                    _635 = _304;
                    _637 = false;
                    _639 = _615;
                    vec3 _631;
                    vec3 _634;
                    float _636;
                    bool _638;
                    for (; _639 < _619; _630 = _631, _633 = _634, _635 = _636, _637 = _638, _639++)
                    {
                        uint _646 = uint(_9._m0[_639]);
                        float _664 = abs(_10._m0[_646]._m5);
                        if ((_10._m0[_646]._m6 & (1u << (_485 & 31u))) != 0u)
                        {
                            vec3 _679 = _10._m0[_646]._m0.xyz - _521;
                            float _680 = dot(_679, _679);
                            vec3 _683 = _679 * inversesqrt(spvNMax(_680, 1.0000000133514319600180897396058e-10));
                            float _684 = _10._m0[_646]._m0.w * _10._m0[_646]._m0.w;
                            vec3 _1032;
                            vec3 _1033;
                            float _1034;
                            bool _1035;
                            if (_680 < (1.0 / _684))
                            {
                                vec3 _689 = _523 + _683;
                                vec3 _693 = _689 * inversesqrt(spvNMax(dot(_689, _689), 1.0000000133514319600180897396058e-10));
                                float _695 = clamp(dot(_683, _693), 0.0, 1.0);
                                float _697 = clamp(dot(_495, _693), 0.0, 1.0);
                                float _699 = clamp(dot(_495, _683), 0.0, 1.0);
                                float _700 = _680 * _684;
                                float _706 = pow(spvNMax(abs(clamp(fma(-_700, _700, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_646]._m4);
                                float _716;
                                if (_10._m0[_646]._m5 < 0.0)
                                {
                                    _716 = _706 * fma(4.0, _684, _664);
                                }
                                else
                                {
                                    _716 = _706 * ((1.0 / spvNMax(_680, 9.9999997473787516355514526367188e-05)) + _664);
                                }
                                float _718 = 0.079577468335628509521484375 * (_699 * _716);
                                float _853;
                                bool _854;
                                float _855;
                                if ((_10._m0[_646]._m7 & 1u) != 0u)
                                {
                                    uint _743;
                                    do
                                    {
                                        vec3 _723 = -_683;
                                        float _724 = dot(_723, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                        float _725 = dot(_723, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                        float _726 = dot(_723, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                        float _730 = spvNMax(spvNMax(_724, _725), spvNMax(_726, dot(_723, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                        if (_730 == _724)
                                        {
                                            _743 = 0u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_730 == _725)
                                            {
                                                _743 = 1u;
                                                break;
                                            }
                                            else
                                            {
                                                if (_730 == _726)
                                                {
                                                    _743 = 2u;
                                                    break;
                                                }
                                                else
                                                {
                                                    _743 = 3u;
                                                    break;
                                                }
                                                break; // unreachable workaround
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    uint _745 = uint(int(_10._m0[_646]._m7 >> 2u)) + _743;
                                    float _847;
                                    bool _848;
                                    float _849;
                                    do
                                    {
                                        SPIRV_CROSS_BRANCH
                                        if ((_699 <= 0.0) && true)
                                        {
                                            _847 = _635;
                                            _848 = _637;
                                            _849 = 0.0;
                                            break;
                                        }
                                        else
                                        {
                                            vec4 _778 = _20._m0[_745]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_699)))) * (_20._m0[_745]._m4 * sqrt(_680)))), 1.0);
                                            vec3 _782 = _778.xyz / vec3(_778.w);
                                            vec2 _785 = (_782.xy * 0.5) + vec2(0.5);
                                            _785.y = 1.0 - _785.y;
                                            float _794 = (_20._m0[_745]._m5.y / _20._m0[_745]._m6) / (_782.z - _20._m0[_745]._m5.x);
                                            float _799 = _637 ? _635 : 6.283185482025146484375;
                                            float _800 = _593 * _799;
                                            vec2 _801 = _20._m0[_745]._m1 + _19._m33;
                                            vec2 _804 = (_20._m0[_745]._m1 + vec2(_20._m0[_745]._m2)) - _19._m33;
                                            float _806;
                                            _806 = 0.0;
                                            for (int _809 = 0; _809 < 12; )
                                            {
                                                float _814 = float(uint(_809));
                                                float _817 = sqrt(_814 + 0.5) * 0.288675129413604736328125;
                                                float _818 = fma(_814, 2.3999631404876708984375, _800);
                                                vec2 _826 = clamp(fma((vec3(cos(_818), sin(_818), _817).xy * _817) * 2.5, _19._m33, _785), _801, _804);
                                                vec2 _829 = fract(fma(vec2(1.0) / _19._m33, _826, vec2(0.5)));
                                                vec4 _835 = vec4(lessThan(vec4(_794), textureGather(sampler2D(_21, _12), _826)));
                                                float _838 = _829.x;
                                                _806 += clamp(mix(mix(_835.w, _835.z, _838), mix(_835.x, _835.y, _838), _829.y), 0.0, 1.0);
                                                _809++;
                                                continue;
                                            }
                                            _847 = _799;
                                            _848 = _637 ? _637 : true;
                                            _849 = _806 * 0.083333335816860198974609375;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    _853 = _847;
                                    _854 = _848;
                                    _855 = _718 * mix(1.0, _849, spvNMin(_600, _10._m0[_646]._m8));
                                }
                                else
                                {
                                    _853 = _635;
                                    _854 = _637;
                                    _855 = _718;
                                }
                                vec3 _1030;
                                vec3 _1031;
                                SPIRV_CROSS_BRANCH
                                if (_10._m0[_646]._m3 < 0.0)
                                {
                                    vec3 _1028;
                                    vec3 _1029;
                                    if (_699 > 0.0)
                                    {
                                        vec3 _948 = _10._m0[_646]._m1.xyz * (_855 * _6._m0[0u]);
                                        vec3 _955 = vec3(fma((2.0 * _695) * _695, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                        float _976 = (_552 + 1.0) * 0.5;
                                        float _977 = _552 * _552;
                                        float _985 = _976 * _976;
                                        float _990 = -_699;
                                        float _997 = _977 * _977;
                                        float _998 = -_697;
                                        float _1000 = fma(fma(_697, _997, _998), _697, 1.0);
                                        float _1017 = clamp(_628, 0.0, 1.0);
                                        _1028 = fma(_948, (((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _695), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_699, sqrt(fma(fma(-_628, _985, _628), _628, _985)), _628 * sqrt(fma(fma(_990, _985, _699), _699, _985)))) * (_997 * (0.3183098733425140380859375 / (_1000 * _1000))))) * _518.w) + ((_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(_998, _697, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(_990, _1017, _699 + _1017)))) * (1.0 - _518.w)), _630);
                                        _1029 = fma(_948, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_955 * pow(spvNMax(abs(1.0 - _699), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_955 * pow(spvNMax(abs(1.0 - _628), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _633);
                                    }
                                    else
                                    {
                                        _1028 = _630;
                                        _1029 = _633;
                                    }
                                    _1030 = _1028;
                                    _1031 = _1029;
                                }
                                else
                                {
                                    vec3 _942;
                                    vec3 _943;
                                    if (_699 > 0.0)
                                    {
                                        vec3 _862 = _10._m0[_646]._m1.xyz * _855;
                                        vec3 _869 = vec3(fma((2.0 * _695) * _695, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                        float _890 = (_552 + 1.0) * 0.5;
                                        float _891 = _552 * _552;
                                        float _899 = _890 * _890;
                                        float _904 = -_699;
                                        float _911 = _891 * _891;
                                        float _912 = -_697;
                                        float _914 = fma(fma(_697, _911, _912), _697, 1.0);
                                        float _931 = clamp(_628, 0.0, 1.0);
                                        _942 = fma(_862, (((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _695), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_699, sqrt(fma(fma(-_628, _899, _628), _628, _899)), _628 * sqrt(fma(fma(_904, _899, _699), _699, _899)))) * (_911 * (0.3183098733425140380859375 / (_914 * _914))))) * _518.w) + ((_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(_912, _697, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(_904, _931, _699 + _931)))) * (1.0 - _518.w)), _630);
                                        _943 = fma(_862, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_869 * pow(spvNMax(abs(1.0 - _699), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_869 * pow(spvNMax(abs(1.0 - _628), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _633);
                                    }
                                    else
                                    {
                                        _942 = _630;
                                        _943 = _633;
                                    }
                                    _1030 = _942;
                                    _1031 = _943;
                                }
                                _1032 = _1030;
                                _1033 = _1031;
                                _1034 = _853;
                                _1035 = _854;
                            }
                            else
                            {
                                _1032 = _630;
                                _1033 = _633;
                                _1034 = _635;
                                _1035 = _637;
                            }
                            _631 = _1032;
                            _634 = _1033;
                            _636 = _1034;
                            _638 = _1035;
                        }
                        else
                        {
                            _631 = _630;
                            _634 = _633;
                            _636 = _635;
                            _638 = _637;
                        }
                    }
                    vec3 _1037;
                    vec3 _1040;
                    float _1042;
                    bool _1044;
                    uint _1046;
                    _1037 = _630;
                    _1040 = _633;
                    _1042 = _635;
                    _1044 = _637;
                    _1046 = _639;
                    vec3 _1038;
                    vec3 _1041;
                    float _1043;
                    bool _1045;
                    for (; _1046 < _622; _1037 = _1038, _1040 = _1041, _1042 = _1043, _1044 = _1045, _1046++)
                    {
                        uint _1053 = uint(_9._m0[_1046]);
                        float _1066 = abs(_10._m0[_1053]._m5);
                        if ((_10._m0[_1053]._m6 & (1u << (_485 & 31u))) != 0u)
                        {
                            vec3 _1084 = _10._m0[_1053]._m0.xyz - _521;
                            float _1085 = dot(_1084, _1084);
                            vec3 _1088 = _1084 * inversesqrt(spvNMax(_1085, 1.0000000133514319600180897396058e-10));
                            float _1089 = _10._m0[_1053]._m0.w * _10._m0[_1053]._m0.w;
                            vec3 _1427;
                            vec3 _1428;
                            float _1429;
                            bool _1430;
                            if (_1085 < (1.0 / _1089))
                            {
                                vec3 _1094 = _523 + _1088;
                                vec3 _1098 = _1094 * inversesqrt(spvNMax(dot(_1094, _1094), 1.0000000133514319600180897396058e-10));
                                float _1100 = clamp(dot(_1088, _1098), 0.0, 1.0);
                                float _1102 = clamp(dot(_495, _1098), 0.0, 1.0);
                                float _1104 = clamp(dot(_495, _1088), 0.0, 1.0);
                                float _1107 = dot(-_1088, normalize(_10._m0[_1053]._m2.xyz));
                                float _1136;
                                if (_1107 > _10._m0[_1053]._m1.w)
                                {
                                    float _1111 = _1085 * _1089;
                                    float _1117 = pow(spvNMax(abs(clamp(fma(-_1111, _1111, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1053]._m4);
                                    float _1127;
                                    if (_10._m0[_1053]._m5 < 0.0)
                                    {
                                        _1127 = _1117 * fma(4.0, _1089, _1066);
                                    }
                                    else
                                    {
                                        _1127 = _1117 * ((1.0 / spvNMax(_1085, 9.9999997473787516355514526367188e-05)) + _1066);
                                    }
                                    float _1132 = clamp((_1107 - _10._m0[_1053]._m1.w) / spvNMax(_10._m0[_1053]._m2.w - _10._m0[_1053]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                    _1136 = _1104 * (_1127 * (_1132 * _1132));
                                }
                                else
                                {
                                    _1136 = 0.0;
                                }
                                float _1137 = 0.3183098733425140380859375 * _1136;
                                float _1248;
                                bool _1249;
                                float _1250;
                                if ((_10._m0[_1053]._m7 & 1u) != 0u)
                                {
                                    uint _1140 = uint(int(_10._m0[_1053]._m7 >> 2u));
                                    float _1242;
                                    bool _1243;
                                    float _1244;
                                    do
                                    {
                                        SPIRV_CROSS_BRANCH
                                        if ((_1104 <= 0.0) && true)
                                        {
                                            _1242 = _1042;
                                            _1243 = _1044;
                                            _1244 = 0.0;
                                            break;
                                        }
                                        else
                                        {
                                            vec4 _1173 = _20._m0[_1140]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_1104)))) * (_20._m0[_1140]._m4 * sqrt(_1085)))), 1.0);
                                            vec3 _1177 = _1173.xyz / vec3(_1173.w);
                                            vec2 _1180 = (_1177.xy * 0.5) + vec2(0.5);
                                            _1180.y = 1.0 - _1180.y;
                                            float _1189 = (_20._m0[_1140]._m5.y / _20._m0[_1140]._m6) / (_1177.z - _20._m0[_1140]._m5.x);
                                            float _1194 = _1044 ? _1042 : 6.283185482025146484375;
                                            float _1195 = _593 * _1194;
                                            vec2 _1196 = _20._m0[_1140]._m1 + _19._m33;
                                            vec2 _1199 = (_20._m0[_1140]._m1 + vec2(_20._m0[_1140]._m2)) - _19._m33;
                                            float _1201;
                                            _1201 = 0.0;
                                            for (int _1204 = 0; _1204 < 12; )
                                            {
                                                float _1209 = float(uint(_1204));
                                                float _1212 = sqrt(_1209 + 0.5) * 0.288675129413604736328125;
                                                float _1213 = fma(_1209, 2.3999631404876708984375, _1195);
                                                vec2 _1221 = clamp(fma((vec3(cos(_1213), sin(_1213), _1212).xy * _1212) * 2.5, _19._m33, _1180), _1196, _1199);
                                                vec2 _1224 = fract(fma(vec2(1.0) / _19._m33, _1221, vec2(0.5)));
                                                vec4 _1230 = vec4(lessThan(vec4(_1189), textureGather(sampler2D(_21, _12), _1221)));
                                                float _1233 = _1224.x;
                                                _1201 += clamp(mix(mix(_1230.w, _1230.z, _1233), mix(_1230.x, _1230.y, _1233), _1224.y), 0.0, 1.0);
                                                _1204++;
                                                continue;
                                            }
                                            _1242 = _1194;
                                            _1243 = _1044 ? _1044 : true;
                                            _1244 = _1201 * 0.083333335816860198974609375;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    _1248 = _1242;
                                    _1249 = _1243;
                                    _1250 = _1137 * mix(1.0, _1244, spvNMin(_600, _10._m0[_1053]._m8));
                                }
                                else
                                {
                                    _1248 = _1042;
                                    _1249 = _1044;
                                    _1250 = _1137;
                                }
                                vec3 _1425;
                                vec3 _1426;
                                SPIRV_CROSS_BRANCH
                                if (_10._m0[_1053]._m3 < 0.0)
                                {
                                    vec3 _1423;
                                    vec3 _1424;
                                    if (_1104 > 0.0)
                                    {
                                        vec3 _1343 = _10._m0[_1053]._m1.xyz * (_1250 * _6._m0[0u]);
                                        vec3 _1350 = vec3(fma((2.0 * _1100) * _1100, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                        float _1371 = (_552 + 1.0) * 0.5;
                                        float _1372 = _552 * _552;
                                        float _1380 = _1371 * _1371;
                                        float _1385 = -_1104;
                                        float _1392 = _1372 * _1372;
                                        float _1393 = -_1102;
                                        float _1395 = fma(fma(_1102, _1392, _1393), _1102, 1.0);
                                        float _1412 = clamp(_628, 0.0, 1.0);
                                        _1423 = fma(_1343, (((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _1100), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1104, sqrt(fma(fma(-_628, _1380, _628), _628, _1380)), _628 * sqrt(fma(fma(_1385, _1380, _1104), _1104, _1380)))) * (_1392 * (0.3183098733425140380859375 / (_1395 * _1395))))) * _518.w) + ((_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(_1393, _1102, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(_1385, _1412, _1104 + _1412)))) * (1.0 - _518.w)), _1037);
                                        _1424 = fma(_1343, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1350 * pow(spvNMax(abs(1.0 - _1104), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1350 * pow(spvNMax(abs(1.0 - _628), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _1040);
                                    }
                                    else
                                    {
                                        _1423 = _1037;
                                        _1424 = _1040;
                                    }
                                    _1425 = _1423;
                                    _1426 = _1424;
                                }
                                else
                                {
                                    vec3 _1337;
                                    vec3 _1338;
                                    if (_1104 > 0.0)
                                    {
                                        vec3 _1257 = _10._m0[_1053]._m1.xyz * _1250;
                                        vec3 _1264 = vec3(fma((2.0 * _1100) * _1100, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                        float _1285 = (_552 + 1.0) * 0.5;
                                        float _1286 = _552 * _552;
                                        float _1294 = _1285 * _1285;
                                        float _1299 = -_1104;
                                        float _1306 = _1286 * _1286;
                                        float _1307 = -_1102;
                                        float _1309 = fma(fma(_1102, _1306, _1307), _1102, 1.0);
                                        float _1326 = clamp(_628, 0.0, 1.0);
                                        _1337 = fma(_1257, (((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _1100), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1104, sqrt(fma(fma(-_628, _1294, _628), _628, _1294)), _628 * sqrt(fma(fma(_1299, _1294, _1104), _1104, _1294)))) * (_1306 * (0.3183098733425140380859375 / (_1309 * _1309))))) * _518.w) + ((_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(_1307, _1102, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(_1299, _1326, _1104 + _1326)))) * (1.0 - _518.w)), _1037);
                                        _1338 = fma(_1257, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1264 * pow(spvNMax(abs(1.0 - _1104), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1264 * pow(spvNMax(abs(1.0 - _628), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _1040);
                                    }
                                    else
                                    {
                                        _1337 = _1037;
                                        _1338 = _1040;
                                    }
                                    _1425 = _1337;
                                    _1426 = _1338;
                                }
                                _1427 = _1425;
                                _1428 = _1426;
                                _1429 = _1248;
                                _1430 = _1249;
                            }
                            else
                            {
                                _1427 = _1037;
                                _1428 = _1040;
                                _1429 = _1042;
                                _1430 = _1044;
                            }
                            _1038 = _1427;
                            _1041 = _1428;
                            _1043 = _1429;
                            _1045 = _1430;
                        }
                        else
                        {
                            _1038 = _1037;
                            _1041 = _1040;
                            _1043 = _1042;
                            _1045 = _1044;
                        }
                    }
                    vec3 _1432;
                    vec3 _1435;
                    _1432 = _1037;
                    _1435 = _1040;
                    vec3 _1433;
                    vec3 _1436;
                    float _1438;
                    bool _1440;
                    float _1437 = _1042;
                    bool _1439 = _1044;
                    uint _1441 = _1046;
                    for (; _1441 < _626; _1432 = _1433, _1435 = _1436, _1437 = _1438, _1439 = _1440, _1441++)
                    {
                        uint _1448 = uint(_9._m0[_1441]);
                        int _1477 = int(_11._m0[_1448]._m1 >> 1u) - 1;
                        if (((_11._m0[_1448]._m4 & 16777215u) & (1u << (_485 & 31u))) != 0u)
                        {
                            vec3 _1488 = _11._m0[_1448]._m6 * vec4(_521, 1.0);
                            vec3 _1910;
                            vec3 _1911;
                            float _1912;
                            bool _1913;
                            if (all(lessThan(abs(_1488 - vec3(0.5)), vec3(0.5))))
                            {
                                vec3 _1495 = _523 + _11._m0[_1448]._m9;
                                vec3 _1499 = _1495 * inversesqrt(spvNMax(dot(_1495, _1495), 1.0000000133514319600180897396058e-10));
                                float _1501 = clamp(dot(_11._m0[_1448]._m9, _1499), 0.0, 1.0);
                                float _1503 = clamp(dot(_495, _1499), 0.0, 1.0);
                                float _1505 = clamp(dot(_495, _11._m0[_1448]._m9), 0.0, 1.0);
                                int _1506 = int(_11._m0[_1448]._m4 >> 24u);
                                float _1507 = _1488.z;
                                vec3 _1546;
                                if (_1507 < _11._m0[_1448]._m2.x)
                                {
                                    float _1534 = _1507 * _11._m0[_1448]._m2.z;
                                    float _1537 = _1534 * _1534;
                                    vec3 _1545;
                                    _1545.z = dot(_315[_1506], vec4(_1534, _1537, smoothstep(0.0, 1.0, _1534), (_1537 * _1534) * fma(_1534, fma(_1534, 6.0, -15.0), 10.0)));
                                    _1546 = _1545;
                                }
                                else
                                {
                                    vec3 _1532;
                                    if (_1507 > _11._m0[_1448]._m2.y)
                                    {
                                        float _1520 = (1.0 - _1507) * _11._m0[_1448]._m2.w;
                                        float _1523 = _1520 * _1520;
                                        vec3 _1531;
                                        _1531.z = dot(_315[_1506], vec4(_1520, _1523, smoothstep(0.0, 1.0, _1520), (_1523 * _1520) * fma(_1520, fma(_1520, 6.0, -15.0), 10.0)));
                                        _1532 = _1531;
                                    }
                                    else
                                    {
                                        _1532 = vec3(0.0, 0.0, 1.0);
                                    }
                                    _1546 = _1532;
                                }
                                vec2 _1547 = _1488.xy;
                                vec2 _1551 = (vec2(0.5) - abs(_1547 - vec2(0.5))) * _11._m0[_1448]._m3;
                                float _1552 = _1551.x;
                                vec3 _1569;
                                if (_1552 < 1.0)
                                {
                                    float _1560 = _1552 * _1552;
                                    vec3 _1568 = _1546;
                                    _1568.x = dot(_315[_1506], vec4(_1552, _1560, smoothstep(0.0, 1.0, _1552), (_1560 * _1552) * fma(_1552, fma(_1552, 6.0, -15.0), 10.0)));
                                    _1569 = _1568;
                                }
                                else
                                {
                                    vec3 _1557 = _1546;
                                    _1557.x = 1.0;
                                    _1569 = _1557;
                                }
                                float _1570 = _1551.y;
                                vec3 _1587;
                                if (_1570 < 1.0)
                                {
                                    float _1578 = _1570 * _1570;
                                    vec3 _1586 = _1569;
                                    _1586.y = dot(_315[_1506], vec4(_1570, _1578, smoothstep(0.0, 1.0, _1570), (_1578 * _1570) * fma(_1570, fma(_1570, 6.0, -15.0), 10.0)));
                                    _1587 = _1586;
                                }
                                else
                                {
                                    vec3 _1575 = _1569;
                                    _1575.y = 1.0;
                                    _1587 = _1575;
                                }
                                float _1593 = _1505 * ((_1587.x * _1587.y) * _1587.z);
                                float _1698;
                                bool _1699;
                                float _1700;
                                if ((_11._m0[_1448]._m8 & 1u) != 0u)
                                {
                                    uint _1596 = uint(int(_11._m0[_1448]._m8 >> 2u));
                                    float _1692;
                                    bool _1693;
                                    float _1694;
                                    do
                                    {
                                        SPIRV_CROSS_BRANCH
                                        if ((_1505 <= 0.0) && true)
                                        {
                                            _1692 = _1437;
                                            _1693 = _1439;
                                            _1694 = 0.0;
                                            break;
                                        }
                                        else
                                        {
                                            vec4 _1627 = _20._m0[_1596]._m0 * vec4(_521 + (_495 * ((3.5 * float(int(sign(_1505)))) * _20._m0[_1596]._m4)), 1.0);
                                            vec2 _1630 = (_1627.xy * 0.5) + vec2(0.5);
                                            _1630.y = 1.0 - _1630.y;
                                            float _1639 = ((_1627.z - _20._m0[_1596]._m5.y) / _20._m0[_1596]._m5.x) / _20._m0[_1596]._m6;
                                            float _1644 = _1439 ? _1437 : 6.283185482025146484375;
                                            float _1645 = _593 * _1644;
                                            vec2 _1646 = _20._m0[_1596]._m1 + _19._m33;
                                            vec2 _1649 = (_20._m0[_1596]._m1 + vec2(_20._m0[_1596]._m2)) - _19._m33;
                                            float _1651;
                                            _1651 = 0.0;
                                            for (int _1654 = 0; _1654 < 12; )
                                            {
                                                float _1659 = float(uint(_1654));
                                                float _1662 = sqrt(_1659 + 0.5) * 0.288675129413604736328125;
                                                float _1663 = fma(_1659, 2.3999631404876708984375, _1645);
                                                vec2 _1671 = clamp(fma((vec3(cos(_1663), sin(_1663), _1662).xy * _1662) * 2.5, _19._m33, _1630), _1646, _1649);
                                                vec2 _1674 = fract(fma(vec2(1.0) / _19._m33, _1671, vec2(0.5)));
                                                vec4 _1680 = vec4(lessThan(vec4(_1639), textureGather(sampler2D(_21, _12), _1671)));
                                                float _1683 = _1674.x;
                                                _1651 += clamp(mix(mix(_1680.w, _1680.z, _1683), mix(_1680.x, _1680.y, _1683), _1674.y), 0.0, 1.0);
                                                _1654++;
                                                continue;
                                            }
                                            _1692 = _1644;
                                            _1693 = _1439 ? _1439 : true;
                                            _1694 = _1651 * 0.083333335816860198974609375;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    _1698 = _1692;
                                    _1699 = _1693;
                                    _1700 = _1593 * mix(1.0, _1694, spvNMin(_600, _11._m0[_1448]._m5));
                                }
                                else
                                {
                                    _1698 = _1437;
                                    _1699 = _1439;
                                    _1700 = _1593;
                                }
                                vec3 _1733;
                                if (_1477 >= 0)
                                {
                                    vec2 _1706 = (subgroupQuadSwapHorizontal(_1547) - _1547) * _530;
                                    vec2 _1709 = (subgroupQuadSwapVertical(_1547) - _1547) * _536;
                                    vec2 _1713 = mix(_1706, vec2(0.0), bvec2(any(isnan(_1706))));
                                    vec2 _1717 = mix(_1709, vec2(0.0), bvec2(any(isnan(_1709))));
                                    bvec2 _1726 = bvec2(any(greaterThan(abs(vec4(_1713, _1717)), vec4(0.015625))));
                                    int _74 = _1477;
                                    _1733 = _11._m0[_1448]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_74], _7)), _1547, mix(_1713, vec2(0.0), _1726), mix(_1717, vec2(0.0), _1726)).xyz;
                                }
                                else
                                {
                                    _1733 = _11._m0[_1448]._m0;
                                }
                                vec3 _1908;
                                vec3 _1909;
                                SPIRV_CROSS_BRANCH
                                if ((_11._m0[_1448]._m1 & 1u) != 0u)
                                {
                                    vec3 _1906;
                                    vec3 _1907;
                                    if (_1505 > 0.0)
                                    {
                                        vec3 _1826 = _1733 * (_1700 * _6._m0[0u]);
                                        vec3 _1833 = vec3(fma((2.0 * _1501) * _1501, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                        float _1854 = (_552 + 1.0) * 0.5;
                                        float _1855 = _552 * _552;
                                        float _1863 = _1854 * _1854;
                                        float _1868 = -_1505;
                                        float _1875 = _1855 * _1855;
                                        float _1876 = -_1503;
                                        float _1878 = fma(fma(_1503, _1875, _1876), _1503, 1.0);
                                        float _1895 = clamp(_628, 0.0, 1.0);
                                        _1906 = fma(_1826, (((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _1501), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1505, sqrt(fma(fma(-_628, _1863, _628), _628, _1863)), _628 * sqrt(fma(fma(_1868, _1863, _1505), _1505, _1863)))) * (_1875 * (0.3183098733425140380859375 / (_1878 * _1878))))) * _518.w) + ((_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(_1876, _1503, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(_1868, _1895, _1505 + _1895)))) * (1.0 - _518.w)), _1432);
                                        _1907 = fma(_1826, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1833 * pow(spvNMax(abs(1.0 - _1505), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1833 * pow(spvNMax(abs(1.0 - _628), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _1435);
                                    }
                                    else
                                    {
                                        _1906 = _1432;
                                        _1907 = _1435;
                                    }
                                    _1908 = _1906;
                                    _1909 = _1907;
                                }
                                else
                                {
                                    vec3 _1820;
                                    vec3 _1821;
                                    if (_1505 > 0.0)
                                    {
                                        vec3 _1740 = _1733 * _1700;
                                        vec3 _1747 = vec3(fma((2.0 * _1501) * _1501, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                                        float _1768 = (_552 + 1.0) * 0.5;
                                        float _1769 = _552 * _552;
                                        float _1777 = _1768 * _1768;
                                        float _1782 = -_1505;
                                        float _1789 = _1769 * _1769;
                                        float _1790 = -_1503;
                                        float _1792 = fma(fma(_1503, _1789, _1790), _1503, 1.0);
                                        float _1809 = clamp(_628, 0.0, 1.0);
                                        _1820 = fma(_1740, (((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - _1501), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1505, sqrt(fma(fma(-_628, _1777, _628), _628, _1777)), _628 * sqrt(fma(fma(_1782, _1777, _1505), _1505, _1777)))) * (_1789 * (0.3183098733425140380859375 / (_1792 * _1792))))) * _518.w) + ((_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(_1790, _1503, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(_1782, _1809, _1505 + _1809)))) * (1.0 - _518.w)), _1432);
                                        _1821 = fma(_1740, _520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1747 * pow(spvNMax(abs(1.0 - _1505), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1747 * pow(spvNMax(abs(1.0 - _628), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))), _1435);
                                    }
                                    else
                                    {
                                        _1820 = _1432;
                                        _1821 = _1435;
                                    }
                                    _1908 = _1820;
                                    _1909 = _1821;
                                }
                                _1910 = _1908;
                                _1911 = _1909;
                                _1912 = _1698;
                                _1913 = _1699;
                            }
                            else
                            {
                                _1910 = _1432;
                                _1911 = _1435;
                                _1912 = _1437;
                                _1913 = _1439;
                            }
                            _1433 = _1910;
                            _1436 = _1911;
                            _1438 = _1912;
                            _1440 = _1913;
                        }
                        else
                        {
                            _1433 = _1432;
                            _1436 = _1435;
                            _1438 = _1437;
                            _1440 = _1439;
                        }
                    }
                    _1914 = _1432;
                    _1915 = _1435;
                }
                else
                {
                    _1914 = vec3(0.0);
                    _1915 = vec3(0.0);
                }
                _3015 = _1914;
                _3016 = _1915;
            }
            _4058 = _3015;
            _4059 = _3016;
        }
        vec3 _4061 = reflect(-_523, _495);
        bool _4063 = _483 == 7u;
        vec3 _4069 = mix(_517, mix(_518.xyz, _517, vec3(_518.w)), bvec3(_4063));
        vec3 _4079 = textureLod(samplerCube(_14, _7), _495, 0.0).xyz * _19._m27;
        vec3 _4086 = textureLod(samplerCube(_15, _7), _4061, fma(_552, 8.0, _19._m30 - 8.0)).xyz * _19._m27;
        vec3 _4111;
        vec3 _4112;
        SPIRV_CROSS_BRANCH
        if (_19._m29 > 0.0)
        {
            vec3 _4101 = vec3(_19._m29);
            _4111 = mix(_4086, textureLod(samplerCube(_17, _7), _4061, fma(_552, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _4101);
            _4112 = mix(_4079, textureLod(samplerCube(_16, _7), _495, 0.0).xyz * _19._m28, _4101);
        }
        else
        {
            _4111 = _4086;
            _4112 = _4079;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_4112, _552);
            _4111 *= rdx_mod;
            _4112 *= rdx_mod;
        }
        float _4113 = spvNMax(dot(_523, _495), 0.001953125);
        vec4 _4118 = textureLod(sampler2D(_18, _12), vec2(_4113, _552), 0.0);
        uvec4 _4131 = uvec4(_8._m0[uint(_584)]);
        uint _4133 = _4131.y;
        uint _4143 = ((_4131.z >> 0u) & 1023u) + (((_4133 >> 12u) & 4095u) + (((_4133 >> 0u) & 4095u) + _4131.x));
        uint _4145 = (_4133 >> 24u) + _4143;
        vec3 _4147;
        vec3 _4150;
        _4147 = _4111 * ((_4069 * _4118.x) + vec3(_4118.y));
        _4150 = _4112 * (_520 * _4118.z);
        vec3 _4148;
        vec3 _4151;
        for (uint _4152 = _4143; _4152 < _4145; _4147 = _4148, _4150 = _4151, _4152++)
        {
            uint _4159 = uint(_9._m0[_4152]);
            int _4178 = int((_13._m0[_4159]._m5 >> 1u) & 3u);
            mat3 _4182 = mat3(_13._m0[_4159]._m1[0], _13._m0[_4159]._m1[1], _13._m0[_4159]._m1[2]);
            int _4188 = (int((_13._m0[_4159]._m5 >> 3u) & 16383u) - 1) * 2;
            int _4193 = (int((_13._m0[_4159]._m5 >> 17u) & 16383u) - 1) * 2;
            int _4198 = (int((_13._m0[_4159]._m6 >> 0u) & 65535u) - 1) * 2;
            int _4203 = (int((_13._m0[_4159]._m6 >> 16u) & 65535u) - 1) * 2;
            float _4206 = (_13._m0[_4159]._m3 < 0.0) ? (-_13._m0[_4159]._m3) : 1.0;
            vec3 _4208 = _4182 * (_521 - _13._m0[_4159]._m1[3]);
            bool _4209 = int(_13._m0[_4159]._m5 & 1u) == 1;
            vec3 _4210 = abs(_4208);
            float _4213 = dot(_4208, _4208);
            if (_4209 ? any(greaterThanEqual(_4210, _13._m0[_4159]._m0.xyz)) : (_4213 >= _13._m0[_4159]._m0.y))
            {
                _4148 = _4147;
                _4151 = _4150;
                continue;
            }
            vec3 _4387;
            SPIRV_CROSS_FLATTEN
            if ((_4178 & 1) != 0)
            {
                vec3 _4223 = _4182 * _495;
                vec2 _4312;
                bool _4313;
                if (_4209)
                {
                    vec2 _4307;
                    bool _4311;
                    do
                    {
                        vec3 _4291 = (_13._m0[_4159]._m0.xyz - _4208) / _4223;
                        vec3 _4294 = ((-_13._m0[_4159]._m0.xyz) - _4208) / _4223;
                        vec3 _4295 = spvNMin(_4291, _4294);
                        vec3 _4296 = spvNMax(_4291, _4294);
                        float _4301 = spvNMax(_4295.x, spvNMax(_4295.y, _4295.z));
                        float _4306 = spvNMin(_4296.x, spvNMin(_4296.y, _4296.z));
                        _4307 = vec2(_4301, _4306);
                        if (_4301 > _4306)
                        {
                            _4311 = false;
                            break;
                        }
                        _4311 = true;
                        break;
                    } while(false);
                    _4312 = _4307;
                    _4313 = _4311;
                }
                else
                {
                    vec2 _4286;
                    bool _4287;
                    do
                    {
                        float _4229 = dot(_4223, _4223);
                        float _4230 = dot(_4223, _4208);
                        float _4231 = 2.0 * _4230;
                        float _4232 = _4213 - _13._m0[_4159]._m0.y;
                        float _4268;
                        float _4269;
                        bool _4270;
                        do
                        {
                            float _4238 = fma(_4231, _4231, -((4.0 * _4229) * _4232));
                            float _4266;
                            float _4267;
                            if (_4238 < 0.0)
                            {
                                _4268 = 0.0;
                                _4269 = 0.0;
                                _4270 = false;
                                break;
                            }
                            else
                            {
                                if (_4238 == 0.0)
                                {
                                    float _4265 = (_4230 * (-1.0)) * (1.0 / _4229);
                                    _4266 = _4265;
                                    _4267 = _4265;
                                }
                                else
                                {
                                    float _4258;
                                    if (_4231 > 0.0)
                                    {
                                        _4258 = (-0.5) * fma(2.0, _4230, sqrt(_4238));
                                    }
                                    else
                                    {
                                        _4258 = (-0.5) * fma(2.0, _4230, -sqrt(_4238));
                                    }
                                    _4266 = _4232 * (1.0 / _4258);
                                    _4267 = _4258 * (1.0 / _4229);
                                }
                            }
                            _4268 = _4266;
                            _4269 = _4267;
                            _4270 = true;
                            break;
                        } while(false);
                        if (!_4270)
                        {
                            _4286 = vec2(0.0);
                            _4287 = false;
                            break;
                        }
                        if ((_4269 < 0.0) && (_4268 < 0.0))
                        {
                            _4286 = vec2(0.0);
                            _4287 = false;
                            break;
                        }
                        vec2 _4285;
                        if (_4269 > _4268)
                        {
                            _4285 = vec2(_4268, _4269);
                        }
                        else
                        {
                            _4285 = vec2(_4269, _4268);
                        }
                        _4286 = _4285;
                        _4287 = true;
                        break;
                    } while(false);
                    _4312 = _4286;
                    _4313 = _4287;
                }
                vec3 _4316 = _4208 + (_4223 * _4312.y);
                float _4337;
                if (_4209)
                {
                    _4337 = 1.0 - clamp(length(spvNMax(_4210 - (_13._m0[_4159]._m0.xyz - vec3(_13._m0[_4159]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_4159]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _4337 = clamp((_13._m0[_4159]._m0.x - length(_4208)) * (1.0 / spvNMax(_13._m0[_4159]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _4340 = float(_4313) * smoothstep(0.0, 1.0, _4337);
                vec4 _4382;
                SPIRV_CROSS_BRANCH
                if (_4340 > 9.9999997473787516355514526367188e-05)
                {
                    float _4349 = mix(clamp((_4312.y * (1.0 / length(_4316))) * _552, 0.0, _552), _552, _552);
                    vec3 _4351 = mix(_4316, _4223, vec3(_4349));
                    int _86 = _4188;
                    vec4 _4352 = textureLod(nonuniformEXT(samplerCube(_24[_86], _7)), _4351, 0.0);
                    int _90 = _4188 + 1;
                    _4352.w = textureLod(nonuniformEXT(samplerCube(_24[_90], _7)), _4351, 0.0).x;
                    vec4 _4367;
                    SPIRV_CROSS_BRANCH
                    if (_4193 >= 0)
                    {
                        int _94 = _4193;
                        vec4 _4360 = textureLod(nonuniformEXT(samplerCube(_24[_94], _7)), _4351, 0.0);
                        int _98 = _4193 + 1;
                        _4360.w = textureLod(nonuniformEXT(samplerCube(_24[_98], _7)), _4351, 0.0).x;
                        _4367 = mix(_4352, _4360, vec4(_13._m0[_4159]._m3));
                    }
                    else
                    {
                        _4367 = _4352;
                    }
                    vec4 _4368 = _4367 * _4206;
                    vec3 _4377 = (_4368.xyz * _13._m0[_4159]._m4).xyz * (_520 * textureLod(sampler2D(_18, _12), vec2(_4113, _4349), 0.0).z);
                    vec4 _4378 = vec4(_4377.x, _4377.y, _4377.z, _4368.w);
                    _4378.w = _4368.w * _4340;
                    _4382 = _4378;
                }
                else
                {
                    _4382 = vec4(0.0);
                }
                _4387 = mix(_4150, _4382.xyz, vec3(_4382.w));
            }
            else
            {
                _4387 = _4150;
            }
            vec3 _4566;
            SPIRV_CROSS_FLATTEN
            if ((_4178 & 2) != 0)
            {
                vec3 _4392 = _4182 * _4061;
                vec2 _4481;
                bool _4482;
                if (_4209)
                {
                    vec2 _4476;
                    bool _4480;
                    do
                    {
                        vec3 _4460 = (_13._m0[_4159]._m0.xyz - _4208) / _4392;
                        vec3 _4463 = ((-_13._m0[_4159]._m0.xyz) - _4208) / _4392;
                        vec3 _4464 = spvNMin(_4460, _4463);
                        vec3 _4465 = spvNMax(_4460, _4463);
                        float _4470 = spvNMax(_4464.x, spvNMax(_4464.y, _4464.z));
                        float _4475 = spvNMin(_4465.x, spvNMin(_4465.y, _4465.z));
                        _4476 = vec2(_4470, _4475);
                        if (_4470 > _4475)
                        {
                            _4480 = false;
                            break;
                        }
                        _4480 = true;
                        break;
                    } while(false);
                    _4481 = _4476;
                    _4482 = _4480;
                }
                else
                {
                    vec2 _4455;
                    bool _4456;
                    do
                    {
                        float _4398 = dot(_4392, _4392);
                        float _4399 = dot(_4392, _4208);
                        float _4400 = 2.0 * _4399;
                        float _4401 = _4213 - _13._m0[_4159]._m0.y;
                        float _4437;
                        float _4438;
                        bool _4439;
                        do
                        {
                            float _4407 = fma(_4400, _4400, -((4.0 * _4398) * _4401));
                            float _4435;
                            float _4436;
                            if (_4407 < 0.0)
                            {
                                _4437 = 0.0;
                                _4438 = 0.0;
                                _4439 = false;
                                break;
                            }
                            else
                            {
                                if (_4407 == 0.0)
                                {
                                    float _4434 = (_4399 * (-1.0)) * (1.0 / _4398);
                                    _4435 = _4434;
                                    _4436 = _4434;
                                }
                                else
                                {
                                    float _4427;
                                    if (_4400 > 0.0)
                                    {
                                        _4427 = (-0.5) * fma(2.0, _4399, sqrt(_4407));
                                    }
                                    else
                                    {
                                        _4427 = (-0.5) * fma(2.0, _4399, -sqrt(_4407));
                                    }
                                    _4435 = _4401 * (1.0 / _4427);
                                    _4436 = _4427 * (1.0 / _4398);
                                }
                            }
                            _4437 = _4435;
                            _4438 = _4436;
                            _4439 = true;
                            break;
                        } while(false);
                        if (!_4439)
                        {
                            _4455 = vec2(0.0);
                            _4456 = false;
                            break;
                        }
                        if ((_4438 < 0.0) && (_4437 < 0.0))
                        {
                            _4455 = vec2(0.0);
                            _4456 = false;
                            break;
                        }
                        vec2 _4454;
                        if (_4438 > _4437)
                        {
                            _4454 = vec2(_4437, _4438);
                        }
                        else
                        {
                            _4454 = vec2(_4438, _4437);
                        }
                        _4455 = _4454;
                        _4456 = true;
                        break;
                    } while(false);
                    _4481 = _4455;
                    _4482 = _4456;
                }
                vec3 _4485 = _4208 + (_4392 * _4481.y);
                float _4506;
                if (_4209)
                {
                    _4506 = 1.0 - clamp(length(spvNMax(_4210 - (_13._m0[_4159]._m0.xyz - vec3(_13._m0[_4159]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_4159]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _4506 = clamp((_13._m0[_4159]._m0.x - length(_4208)) * (1.0 / spvNMax(_13._m0[_4159]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _4509 = float(_4482) * smoothstep(0.0, 1.0, _4506);
                vec4 _4561;
                SPIRV_CROSS_BRANCH
                if (_4509 > 9.9999997473787516355514526367188e-05)
                {
                    float _4518 = mix(clamp((_4481.y * (1.0 / length(_4485))) * _552, 0.0, _552), _552, _552);
                    vec3 _4520 = mix(_4485, _4392, vec3(_4518));
                    float _4521 = _4518 * 8.0;
                    int _102 = _4198;
                    int _106 = _4198 + 1;
                    vec4 _4529 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_102], _7)), _4520, _4521).xyz, textureLod(nonuniformEXT(samplerCube(_24[_106], _7)), _4520, _4521).x);
                    vec4 _4543;
                    SPIRV_CROSS_BRANCH
                    if (_4203 >= 0)
                    {
                        int _110 = _4203;
                        int _114 = _4203 + 1;
                        _4543 = mix(_4529, vec4(textureLod(nonuniformEXT(samplerCube(_24[_110], _7)), _4520, _4521).xyz, textureLod(nonuniformEXT(samplerCube(_24[_114], _7)), _4520, _4521).x), vec4(_13._m0[_4159]._m3));
                    }
                    else
                    {
                        _4543 = _4529;
                    }
                    vec4 _4544 = _4543 * _4206;
                    vec4 _4549 = textureLod(sampler2D(_18, _12), vec2(_4113, _4518), 0.0);
                    vec3 _4556 = (_4544.xyz * _13._m0[_4159]._m4).xyz * ((_4069 * _4549.x) + vec3(_4549.y));
                    vec4 _4557 = vec4(_4556.x, _4556.y, _4556.z, _4544.w);
                    _4557.w = _4544.w * _4509;
                    _4561 = _4557;
                }
                else
                {
                    _4561 = vec4(0.0);
                }
                _4566 = mix(_4147, _4561.xyz, vec3(_4561.w));
            }
            else
            {
                _4566 = _4147;
            }
            _4148 = _4566;
            _4151 = _4387;
        }
        float _4567 = _6._m0[0u] * 100.0;
        bool _4572 = _26._m19 > 0.0;
        vec3 _4633;
        SPIRV_CROSS_BRANCH
        if (_4572 && (_26._m35 == 0.0))
        {
            vec3 _4586 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _4587 = length(_4586);
            vec3 _4598;
            float _4599;
            if (_4587 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _4596 = _4586;
                _4596.z = _4586.z + _29._m0;
                _4598 = _4596;
                _4599 = length(_4596);
            }
            else
            {
                _4598 = _4586;
                _4599 = _4587;
            }
            float _4602 = dot(_4598 / vec3(_4599), _26._m36);
            float _4603 = _29._m0 / _4599;
            _4633 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_4602 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_4599 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_4602 < (-sqrt(fma(-_4603, _4603, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _4633 = _26._m2;
        }
        float _4646 = texelFetch(_41, ivec3(int(_587), int(_588), 0).xy, 0).x;
        float _4731;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _4670 = _27._m6 + _521;
            vec3 _4677 = vec3(0.0, _26._m18.z, 0.0) + (_4670 - vec3(0.0, _26._m25, 0.0));
            float _4681 = dot(_4677, _26._m24);
            vec2 _4691 = ((((_4677 + (_26._m24 * (sqrt(fma(_4681, _4681, fma(_26._m18.z, _26._m18.z, -dot(_4677, _4677)))) - _4681))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _4691.x = 1.0 - _4691.x;
            vec3 _4704 = vec3(0.0, _26._m23.z, 0.0) + (_4670 - vec3(0.0, _26._m27, 0.0));
            float _4708 = dot(_4704, _26._m26);
            vec2 _4718 = ((((_4704 + (_26._m26 * (sqrt(fma(_4708, _4708, fma(_26._m23.z, _26._m23.z, -dot(_4704, _4704)))) - _4708))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _4718.x = 1.0 - _4718.x;
            _4731 = _4646 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _4691, 0.0).x, textureLod(sampler2D(_33, _7), _4718, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _4731 = _4646;
        }
        float _4821;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _4759 = _27._m6 + _521;
            vec3 _4767 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _4759) - vec3(0.0, _26._m30, 0.0));
            float _4771 = dot(_4767, _26._m24);
            vec2 _4781 = ((((_4767 + (_26._m24 * (sqrt(fma(_4771, _4771, fma(_26._m28.z, _26._m28.z, -dot(_4767, _4767)))) - _4771))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _4781.x = 1.0 - _4781.x;
            vec3 _4795 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _4759) - vec3(0.0, _26._m33, 0.0));
            float _4799 = dot(_4795, _26._m26);
            vec2 _4809 = ((((_4795 + (_26._m26 * (sqrt(fma(_4799, _4799, fma(_26._m31.z, _26._m31.z, -dot(_4795, _4795)))) - _4799))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _4809.x = 1.0 - _4809.x;
            _4821 = _4731 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _4781, 0.0).x, textureLod(sampler2D(_23, _7), _4809, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _4821 = _4731;
        }
        vec3 _4823 = _4633 * (_4821 * _6._m0[0u]);
        vec3 _5115;
        vec3 _5116;
        SPIRV_CROSS_BRANCH
        if (_601)
        {
            vec3 _5025 = reflect(_523, _495);
            float _5027 = spvNMax(dot(_495, _523), 9.9999997473787516355514526367188e-06);
            float _5031 = clamp(dot(_26._m0, normalize(_523 + _26._m0)), 0.0, 1.0);
            float _5033 = clamp(dot(_495, _26._m0), 0.0, 1.0);
            vec3 _5040 = vec3(fma((2.0 * _5031) * _5031, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
            float _5059 = dot(_26._m0, _5025);
            vec3 _5069 = mix(_5025, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_5025 - (_26._m0 * _5059)) * 0.0045900647528469562530517578125)), bvec3(_5059 < 0.999989449977874755859375));
            vec3 _5071 = normalize(_523 + _5069);
            float _5075 = clamp(dot(_495, _5071), 0.0, 1.0);
            float _5077 = clamp(dot(_495, _5069), 0.0, 1.0);
            float _5079 = (_552 + 1.0) * 0.5;
            float _5080 = _552 * _552;
            float _5088 = _5079 * _5079;
            float _5100 = _5080 * _5080;
            float _5103 = fma(fma(_5075, _5100, -_5075), _5075, 1.0);
            _5115 = _4058 + ((_4823 * ((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - clamp(dot(_5069, _5071), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_5077, sqrt(fma(fma(-_5027, _5088, _5027), _5027, _5088)), _5027 * sqrt(fma(fma(-_5077, _5088, _5077), _5077, _5088)))) * (_5100 * (0.3183098733425140380859375 / (_5103 * _5103)))))) * _5033);
            _5116 = _4059 + ((_4823 * (_520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_5040 * pow(spvNMax(abs(1.0 - _5033), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_5040 * pow(spvNMax(abs(1.0 - _5027), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))))) * _5033);
        }
        else
        {
            vec3 _5021;
            vec3 _5022;
            if (_505)
            {
                vec3 _4947 = reflect(_523, _495);
                float _4949 = spvNMax(dot(_495, _523), 9.9999997473787516355514526367188e-06);
                float _4953 = clamp(dot(_26._m0, normalize(_523 + _26._m0)), 0.0, 1.0);
                float _4955 = clamp(dot(_495, _26._m0), 0.0, 1.0);
                vec3 _4962 = vec3(fma((2.0 * _4953) * _4953, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                float _4981 = dot(_26._m0, _4947);
                vec3 _4991 = mix(_4947, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_4947 - (_26._m0 * _4981)) * 0.0045900647528469562530517578125)), bvec3(_4981 < 0.999989449977874755859375));
                float _4995 = clamp(dot(_495, normalize(_523 + _4991)), 0.0, 1.0);
                float _4997 = clamp(dot(_495, _4991), 0.0, 1.0);
                float _5008 = clamp(_4949, 0.0, 1.0);
                _5021 = _4058 + ((_4823 * (_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(-_4995, _4995, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(-_4997, _5008, _4997 + _5008))))) * _4997);
                _5022 = _4059 + ((_4823 * (_520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_4962 * pow(spvNMax(abs(1.0 - _4955), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_4962 * pow(spvNMax(abs(1.0 - _4949), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))))) * _4955);
            }
            else
            {
                vec3 _4943;
                vec3 _4944;
                if (_4063)
                {
                    vec3 _4834 = reflect(_523, _495);
                    float _4836 = spvNMax(dot(_495, _523), 9.9999997473787516355514526367188e-06);
                    float _4840 = clamp(dot(_26._m0, normalize(_523 + _26._m0)), 0.0, 1.0);
                    float _4842 = clamp(dot(_495, _26._m0), 0.0, 1.0);
                    vec3 _4849 = vec3(fma((2.0 * _4840) * _4840, _552, mix(0.0, 0.5, _552))) - vec3(1.0);
                    float _4868 = dot(_26._m0, _4834);
                    vec3 _4878 = mix(_4834, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_4834 - (_26._m0 * _4868)) * 0.0045900647528469562530517578125)), bvec3(_4868 < 0.999989449977874755859375));
                    vec3 _4880 = normalize(_523 + _4878);
                    float _4884 = clamp(dot(_495, _4880), 0.0, 1.0);
                    float _4886 = clamp(dot(_495, _4878), 0.0, 1.0);
                    float _4888 = (_552 + 1.0) * 0.5;
                    float _4889 = _552 * _552;
                    float _4897 = _4888 * _4888;
                    float _4902 = -_4886;
                    float _4909 = _4889 * _4889;
                    float _4910 = -_4884;
                    float _4912 = fma(fma(_4884, _4909, _4910), _4884, 1.0);
                    float _4928 = clamp(_4836, 0.0, 1.0);
                    _4943 = _4058 + ((_4823 * ((((_517 + ((vec3(1.0) - _517) * pow(spvNMax(abs(1.0 - clamp(dot(_4878, _4880), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_4886, sqrt(fma(fma(-_4836, _4897, _4836), _4836, _4897)), _4836 * sqrt(fma(fma(_4902, _4897, _4886), _4886, _4897)))) * (_4909 * (0.3183098733425140380859375 / (_4912 * _4912))))) * _518.w) + ((_518.xyz * ((((2.0 + (1.0 / _552)) * pow(spvNMax(abs(fma(_4910, _4884, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _552)) * 0.15915493667125701904296875) * (0.25 / fma(_4902, _4928, _4886 + _4928)))) * (1.0 - _518.w)))) * _4886);
                    _4944 = _4059 + ((_4823 * (_520 * (0.3183098733425140380859375 * (((vec3(1.0) + (_4849 * pow(spvNMax(abs(1.0 - _4842), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_4849 * pow(spvNMax(abs(1.0 - _4836), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _552))))) * _4842);
                }
                else
                {
                    _4943 = _4058;
                    _4944 = _4059;
                }
                _5021 = _4943;
                _5022 = _4944;
            }
            _5115 = _5021;
            _5116 = _5022;
        }
        float _5136;
        float _5137;
        if (_34._m0.x > 0.0)
        {
            vec4 _5124 = textureLod(sampler2D(_40, _12), _414, 0.0);
            float _5125 = _5124.x;
            _5136 = clamp((pow(spvNMax(abs(dot(_495, _523) + _5125), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _552, -1.0))) - 1.0) + _5125, 0.0, 1.0);
            _5137 = _5125;
        }
        else
        {
            _5136 = 1.0;
            _5137 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _5137, 0.7);
            _5115 *= rdx_ao_factor;
            _5116 *= rdx_ao_factor;
        }
        vec3 _5145 = (_5116 * mix(1.0, _5137, _34._m0.y)) + ((_4150 * _4567) * _5137);
        vec3 _5147 = (_5115 * mix(1.0, _5136, _34._m0.y)) + ((_4147 * _4567) * _5136);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _5147 *= rdx_multi_scatter_compensation(_4113, _552, _517);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _4646, 0.5);
            _5145 *= _rdx_csm_shadow;
            _5147 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _39, _7, _414, _rdx_marchDir, _456, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _5145 *= _rdx_micro;
            _5147 *= _rdx_micro;
        }
        vec3 _5652;
        vec3 _5653;
        SPIRV_CROSS_BRANCH
        if (_4572)
        {
            vec3 _5155 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _5156 = vec3(0.0, 636100.0, 0.0) + (_521 + _27._m6);
            float _5157 = length(_5156);
            vec3 _5161 = (_5156 / vec3(_5157)) * spvNMax(_5157, 636100.0);
            vec3 _5162 = _5161 - _5155;
            float _5163 = length(_5162);
            vec3 _5165 = _5162 / vec3(_5163);
            float _5166 = length(_5155);
            vec3 _5180;
            vec3 _5181;
            float _5182;
            if (_5166 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _5175 = _5155;
                _5175.z = _5155.z + _29._m0;
                vec3 _5178 = _5161;
                _5178.z = _5161.z + _29._m0;
                _5180 = _5178;
                _5181 = _5175;
                _5182 = length(_5175);
            }
            else
            {
                _5180 = _5161;
                _5181 = _5155;
                _5182 = _5166;
            }
            float _5183 = dot(_5181, _5165);
            float _5194 = spvNMax((-_5183) - sqrt(fma(_29._m1, _29._m1, fma(_5183, _5183, -(_5182 * _5182)))), 0.0);
            bool _5197 = (_5194 > 0.0) && (_5194 < _5163);
            vec3 _5205;
            float _5206;
            float _5207;
            if (_5197)
            {
                _5205 = _5181 + (_5165 * _5194);
                _5206 = _5163 - _5194;
                _5207 = (_5183 + _5194) / _29._m1;
            }
            else
            {
                _5205 = _5181;
                _5206 = _5163;
                _5207 = _5183 / _5182;
            }
            float _5208 = _5197 ? _29._m1 : _5182;
            vec3 _5645;
            vec3 _5646;
            if (_5208 <= _29._m1)
            {
                float _5213 = dot(_5165, _26._m36);
                float _5215 = dot(_5205, _26._m36) / _5208;
                float _5216 = _29._m0 + 600.0;
                bool _5217 = _5208 < _5216;
                vec3 _5222;
                if (_5217)
                {
                    _5222 = _5180 * (_5216 / _5208);
                }
                else
                {
                    _5222 = _5180;
                }
                float _5223 = _5217 ? _5216 : _5208;
                float _5224 = length(_5222);
                float _5225 = dot(_5222, _5165);
                float _5227 = dot(_5222, _26._m36) / _5224;
                vec2 _5238 = vec2(_5207, _5207 + (_5206 / _5223));
                vec2 _5239 = _5238 * sqrt((0.5 / _29._m4) * _5223);
                vec2 _5242 = vec2(ivec2(sign(_5239)));
                vec2 _5243 = _5239 * _5239;
                float _5257 = -_5206;
                float _5259 = 2.0 * _5223;
                float _5261 = (_5206 / _5259) + _5207;
                float _5269 = _29._m0 - _5223;
                vec2 _5284 = _5238 * sqrt((0.5 / _29._m6) * _5223);
                vec2 _5287 = vec2(ivec2(sign(_5284)));
                vec2 _5288 = _5284 * _5284;
                vec3 _5318 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _5223) * exp(_5269 / _29._m4)) * (((_5242.y > _5242.x) ? exp(_5243.x) : 0.0) + dot((_5242 / ((abs(_5239) * 2.3192999362945556640625) + sqrt((_5243 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_5257 / _29._m4) * _5261)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _5223) * exp(_5269 / _29._m6)) * (((_5287.y > _5287.x) ? exp(_5288.x) : 0.0) + dot((_5287 / ((abs(_5284) * 2.3192999362945556640625) + sqrt((_5288 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_5257 / _29._m6) * _5261)), vec2(1.0, -1.0))))));
                vec3 _5319 = spvNMin(_5318, vec3(1.0));
                float _5320 = _29._m0 / _5223;
                float _5323 = sqrt(fma(-_5320, _5320, 1.0));
                float _5325 = _5207 - (-_5323);
                vec4 _5608;
                if (abs(_5325) < 0.0040000001899898052215576171875)
                {
                    float _5433 = (-0.0040000001899898052215576171875) - _5323;
                    float _5435 = fma(_5223, _5223, _5206 * _5206);
                    float _5436 = _5259 * _5206;
                    float _5438 = sqrt(fma(_5436, _5433, _5435));
                    float _5439 = fma(_5223, _5433, _5206);
                    float _5442 = -(_29._m0 * _29._m0);
                    float _5444 = sqrt(fma(_29._m1, _29._m1, _5442));
                    float _5446 = sqrt(fma(_5223, _5223, _5442));
                    float _5447 = _5223 * _5433;
                    float _5449 = -(_5223 * _5223);
                    float _5451 = fma(_29._m0, _29._m0, fma(_5447, _5447, _5449));
                    vec4 _5457 = vec4(-1.0, _5444 * _5444, _5444, 0.50390625);
                    vec4 _5458 = mix(_5457, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5447 < 0.0) && (_5451 > 0.0)));
                    float _5460 = fma(_5446 / _5444, 0.96875, 0.015625);
                    float _5470 = fma(fma(_5447, _5458.x, sqrt(_5451 + _5458.y)) / (_5446 + _5458.z), 0.4921875, _5458.w);
                    float _5476 = _5213 + 1.0;
                    float _5478 = floor(_5476 * 3.5);
                    float _5480 = fma(_5476, 3.5, -_5478);
                    float _5481 = _5478 + fma(fma(atan(spvNMax(_5215, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _5482 = _5481 * 0.125;
                    float _5486 = 1.0 - _5480;
                    float _5489 = (_5481 + 1.0) * 0.125;
                    float _5496 = sqrt(fma(_5438, _5438, _5442));
                    float _5500 = fma(_29._m0, _29._m0, fma(_5439, _5439, -(_5438 * _5438)));
                    vec4 _5505 = mix(_5457, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5439 < 0.0) && (_5500 > 0.0)));
                    float _5507 = fma(_5496 / _5444, 0.96875, 0.015625);
                    float _5517 = fma(fma(_5439, _5505.x, sqrt(_5500 + _5505.y)) / (_5496 + _5505.z), 0.4921875, _5505.w);
                    float _5523 = _5478 + fma(fma(atan(spvNMax(_5227, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _5524 = _5523 * 0.125;
                    float _5530 = (_5523 + 1.0) * 0.125;
                    vec4 _5536 = _5319.xyzx;
                    float _5540 = 0.0040000001899898052215576171875 - _5323;
                    float _5542 = sqrt(fma(_5436, _5540, _5435));
                    float _5543 = fma(_5223, _5540, _5206);
                    float _5544 = _5223 * _5540;
                    float _5546 = fma(_29._m0, _29._m0, fma(_5544, _5544, _5449));
                    vec4 _5551 = mix(_5457, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5544 < 0.0) && (_5546 > 0.0)));
                    float _5561 = fma(fma(_5544, _5551.x, sqrt(_5546 + _5551.y)) / (_5446 + _5551.z), 0.4921875, _5551.w);
                    float _5572 = sqrt(fma(_5542, _5542, _5442));
                    float _5576 = fma(_29._m0, _29._m0, fma(_5543, _5543, -(_5542 * _5542)));
                    vec4 _5581 = mix(_5457, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5543 < 0.0) && (_5576 > 0.0)));
                    float _5583 = fma(_5572 / _5444, 0.96875, 0.015625);
                    float _5593 = fma(fma(_5543, _5581.x, sqrt(_5576 + _5581.y)) / (_5572 + _5581.z), 0.4921875, _5581.w);
                    _5608 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_5524, _5517, _5507), 0.0) * _5486) + (textureLod(sampler3D(_31, _7), vec3(_5530, _5517, _5507), 0.0) * _5480)), _5536, (textureLod(sampler3D(_31, _7), vec3(_5482, _5470, _5460), 0.0) * _5486) + (textureLod(sampler3D(_31, _7), vec3(_5489, _5470, _5460), 0.0) * _5480)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_5524, _5593, _5583), 0.0) * _5486) + (textureLod(sampler3D(_31, _7), vec3(_5530, _5593, _5583), 0.0) * _5480)), _5536, (textureLod(sampler3D(_31, _7), vec3(_5482, _5561, _5460), 0.0) * _5486) + (textureLod(sampler3D(_31, _7), vec3(_5489, _5561, _5460), 0.0) * _5480)), vec4(0.0)), vec4((_5325 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _5333 = -(_29._m0 * _29._m0);
                    float _5335 = sqrt(fma(_29._m1, _29._m1, _5333));
                    float _5337 = sqrt(fma(_5223, _5223, _5333));
                    float _5338 = _5223 * _5207;
                    float _5342 = fma(_29._m0, _29._m0, fma(_5338, _5338, -(_5223 * _5223)));
                    vec4 _5348 = vec4(-1.0, _5335 * _5335, _5335, 0.50390625);
                    vec4 _5349 = mix(_5348, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5338 < 0.0) && (_5342 > 0.0)));
                    float _5351 = fma(_5337 / _5335, 0.96875, 0.015625);
                    float _5361 = fma(fma(_5338, _5349.x, sqrt(_5342 + _5349.y)) / (_5337 + _5349.z), 0.4921875, _5349.w);
                    float _5367 = _5213 + 1.0;
                    float _5369 = floor(_5367 * 3.5);
                    float _5371 = fma(_5367, 3.5, -_5369);
                    float _5372 = _5369 + fma(fma(atan(spvNMax(_5215, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _5377 = 1.0 - _5371;
                    float _5387 = sqrt(fma(_5224, _5224, _5333));
                    float _5391 = fma(_29._m0, _29._m0, fma(_5225, _5225, -(_5224 * _5224)));
                    vec4 _5396 = mix(_5348, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5225 < 0.0) && (_5391 > 0.0)));
                    float _5398 = fma(_5387 / _5335, 0.96875, 0.015625);
                    float _5408 = fma(fma(_5225, _5396.x, sqrt(_5391 + _5396.y)) / (_5387 + _5396.z), 0.4921875, _5396.w);
                    float _5414 = _5369 + fma(fma(atan(spvNMax(_5227, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _5608 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_5414 * 0.125, _5408, _5398), 0.0) * _5377) + (textureLod(sampler3D(_31, _7), vec3((_5414 + 1.0) * 0.125, _5408, _5398), 0.0) * _5371)), _5319.xyzx, (textureLod(sampler3D(_31, _7), vec3(_5372 * 0.125, _5361, _5351), 0.0) * _5377) + (textureLod(sampler3D(_31, _7), vec3((_5372 + 1.0) * 0.125, _5361, _5351), 0.0) * _5371)), vec4(0.0));
                }
                float _5623 = fma(_5213, _5213, 1.0);
                _5645 = _5319;
                _5646 = (_5608.xyz * (0.0596831031143665313720703125 * _5623)) + ((((_5608.xyz * (_5608.w * smoothstep(0.0, 0.0199999995529651641845703125, _5215))) / vec3(spvNMax(_5608.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _5213, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _5623) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _5645 = vec3(1.0);
                _5646 = vec3(0.0);
            }
            _5652 = _5147 * _5645;
            _5653 = fma(_5145, _5645, _5646 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _5652 = _5147;
            _5653 = _5145;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_39, _7, _414, _rdx_dir, _456, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _5653 = vec3(_rdx_vis);
            _5652 = vec3(0.0);
        }
        imageStore(_43, ivec2(_397), vec4(_5653, 1.0));
        imageStore(_44, ivec2(_397), vec4(_5652, 1.0));
        break;
    } while(false);
}

