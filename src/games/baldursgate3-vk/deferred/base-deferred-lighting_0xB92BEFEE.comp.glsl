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
        uint _462 = uint(roundEven(_433.w * 255.0));
        uint _463 = _462 & 7u;
        uint _465 = (_462 & 112u) >> 4u;
        if (_463 == 1u)
        {
            break;
        }
        vec3 _478 = _454 * mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        vec3 _481 = vec3(_431.x, _431.y, _431.z) * (1.0 - _458);
        vec3 _486 = mix(vec3(0.1599999964237213134765625 * (_457 * _457)), _431.xyz, vec3(_458));
        float _487 = spvNMax(0.0900000035762786865234375, _433.x);
        vec3 _488 = (((_26._m7[0].xyz * ((1.0 - _407) - _409)) + (_26._m7[1].xyz * _407)) + (_26._m7[2].xyz * _409)) * _436;
        vec3 _490 = normalize(-_488);
        uint _492 = gl_SubgroupInvocationID & 3u;
        float _497 = ((_492 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _498 = (subgroupQuadSwapHorizontal(_454) - _454) * _497;
        float _503 = ((_492 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _504 = (subgroupQuadSwapVertical(_454) - _454) * _503;
        vec3 _508 = mix(_498, vec3(0.0), bvec3(any(isnan(_498))));
        vec3 _512 = mix(_504, vec3(0.0), bvec3(any(isnan(_504))));
        float _519 = sqrt(clamp(fma(_487, _487, spvNMin(dot(_508, _508) + dot(_512, _512), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _528 = ivec2(uvec2(_391) / uvec2(_19._m25));
        int _551 = int(fma(fma(float(int(clamp(fma(log2(_436 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_528.y)), _19._m23, float(_528.x)));
        float _554 = _391.x;
        float _555 = _391.y;
        float _560 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _554, 0.005837149918079376220703125 * _555)));
        float _567 = clamp(fma(_19._m34.y, length(_488), _19._m34.x), 0.0, 1.0);
        bool _568 = _463 == 0u;
        vec3 _1613;
        vec3 _1614;
        SPIRV_CROSS_BRANCH
        if (_568)
        {
            uvec4 _575 = uvec4(_8._m0[uint(_551)]);
            uint _576 = _575.x;
            uint _577 = _575.y;
            uint _580 = ((_577 >> 0u) & 4095u) + _576;
            uint _583 = ((_577 >> 12u) & 4095u) + _580;
            uint _587 = ((_575.z >> 0u) & 1023u) + _583;
            float _589 = spvNMax(dot(_478, _490), 9.9999997473787516355514526367188e-06);
            float _591;
            bool _594;
            vec3 _596;
            vec3 _598;
            uint _600;
            _591 = _292;
            _594 = false;
            _596 = vec3(0.0);
            _598 = vec3(0.0);
            _600 = _576;
            float _592;
            bool _595;
            vec3 _597;
            vec3 _599;
            for (; _600 < _580; _591 = _592, _594 = _595, _596 = _597, _598 = _599, _600++)
            {
                uint _607 = uint(_9._m0[_600]);
                float _625 = abs(_10._m0[_607]._m5);
                if ((_10._m0[_607]._m6 & (1u << (_465 & 31u))) != 0u)
                {
                    vec3 _640 = _10._m0[_607]._m0.xyz - _488;
                    float _641 = dot(_640, _640);
                    vec3 _644 = _640 * inversesqrt(spvNMax(_641, 1.0000000133514319600180897396058e-10));
                    float _645 = _10._m0[_607]._m0.w * _10._m0[_607]._m0.w;
                    float _883;
                    bool _884;
                    vec3 _885;
                    vec3 _886;
                    if (_641 < (1.0 / _645))
                    {
                        vec3 _650 = _490 + _644;
                        vec3 _654 = _650 * inversesqrt(spvNMax(dot(_650, _650), 1.0000000133514319600180897396058e-10));
                        float _656 = clamp(dot(_644, _654), 0.0, 1.0);
                        float _658 = clamp(dot(_478, _654), 0.0, 1.0);
                        float _660 = clamp(dot(_478, _644), 0.0, 1.0);
                        float _661 = _641 * _645;
                        float _667 = pow(spvNMax(abs(clamp(fma(-_661, _661, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_607]._m4);
                        float _677;
                        if (_10._m0[_607]._m5 < 0.0)
                        {
                            _677 = _667 * fma(4.0, _645, _625);
                        }
                        else
                        {
                            _677 = _667 * ((1.0 / spvNMax(_641, 9.9999997473787516355514526367188e-05)) + _625);
                        }
                        float _679 = 0.079577468335628509521484375 * (_660 * _677);
                        float _814;
                        bool _815;
                        float _816;
                        if ((_10._m0[_607]._m7 & 1u) != 0u)
                        {
                            uint _704;
                            do
                            {
                                vec3 _684 = -_644;
                                float _685 = dot(_684, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _686 = dot(_684, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _687 = dot(_684, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _691 = spvNMax(spvNMax(_685, _686), spvNMax(_687, dot(_684, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_691 == _685)
                                {
                                    _704 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_691 == _686)
                                    {
                                        _704 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_691 == _687)
                                        {
                                            _704 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _704 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _706 = uint(int(_10._m0[_607]._m7 >> 2u)) + _704;
                            float _808;
                            bool _809;
                            float _810;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_660 <= 0.0) && true)
                                {
                                    _808 = _591;
                                    _809 = _594;
                                    _810 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _739 = _20._m0[_706]._m0 * vec4(_488 + (_478 * ((3.5 * float(int(sign(_660)))) * (_20._m0[_706]._m4 * sqrt(_641)))), 1.0);
                                    vec3 _743 = _739.xyz / vec3(_739.w);
                                    vec2 _746 = (_743.xy * 0.5) + vec2(0.5);
                                    _746.y = 1.0 - _746.y;
                                    float _755 = (_20._m0[_706]._m5.y / _20._m0[_706]._m6) / (_743.z - _20._m0[_706]._m5.x);
                                    float _760 = _594 ? _591 : 6.283185482025146484375;
                                    float _761 = _560 * _760;
                                    vec2 _762 = _20._m0[_706]._m1 + _19._m33;
                                    vec2 _765 = (_20._m0[_706]._m1 + vec2(_20._m0[_706]._m2)) - _19._m33;
                                    float _767;
                                    _767 = 0.0;
                                    for (int _770 = 0; _770 < 12; )
                                    {
                                        float _775 = float(uint(_770));
                                        float _778 = sqrt(_775 + 0.5) * 0.288675129413604736328125;
                                        float _779 = fma(_775, 2.3999631404876708984375, _761);
                                        vec2 _787 = clamp(fma((vec3(cos(_779), sin(_779), _778).xy * _778) * 2.5, _19._m33, _746), _762, _765);
                                        vec2 _790 = fract(fma(vec2(1.0) / _19._m33, _787, vec2(0.5)));
                                        vec4 _796 = vec4(lessThan(vec4(_755), textureGather(sampler2D(_21, _12), _787)));
                                        float _799 = _790.x;
                                        _767 += clamp(mix(mix(_796.w, _796.z, _799), mix(_796.x, _796.y, _799), _790.y), 0.0, 1.0);
                                        _770++;
                                        continue;
                                    }
                                    _808 = _760;
                                    _809 = _594 ? _594 : true;
                                    _810 = _767 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _814 = _808;
                            _815 = _809;
                            _816 = _679 * mix(1.0, _810, spvNMin(_567, _10._m0[_607]._m8));
                        }
                        else
                        {
                            _814 = _591;
                            _815 = _594;
                            _816 = _679;
                        }
                        vec3 _881;
                        vec3 _882;
                        if (_660 > 0.0)
                        {
                            vec3 _822 = _10._m0[_607]._m1.xyz * (_816 * ((_10._m0[_607]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _829 = vec3(fma((2.0 * _656) * _656, _519, mix(0.0, 0.5, _519))) - vec3(1.0);
                            float _850 = (_519 + 1.0) * 0.5;
                            float _851 = _519 * _519;
                            float _859 = _850 * _850;
                            float _871 = _851 * _851;
                            float _874 = fma(fma(_658, _871, -_658), _658, 1.0);
                            _881 = fma(_822, (_486 + ((vec3(1.0) - _486) * pow(spvNMax(abs(1.0 - _656), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_660, sqrt(fma(fma(-_589, _859, _589), _589, _859)), _589 * sqrt(fma(fma(-_660, _859, _660), _660, _859)))) * (_871 * (0.3183098733425140380859375 / (_874 * _874)))), _596);
                            _882 = fma(_822, _481 * (0.3183098733425140380859375 * (((vec3(1.0) + (_829 * pow(spvNMax(abs(1.0 - _660), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_829 * pow(spvNMax(abs(1.0 - _589), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _519))), _598);
                        }
                        else
                        {
                            _881 = _596;
                            _882 = _598;
                        }
                        _883 = _814;
                        _884 = _815;
                        _885 = _881;
                        _886 = _882;
                    }
                    else
                    {
                        _883 = _591;
                        _884 = _594;
                        _885 = _596;
                        _886 = _598;
                    }
                    _592 = _883;
                    _595 = _884;
                    _597 = _885;
                    _599 = _886;
                }
                else
                {
                    _592 = _591;
                    _595 = _594;
                    _597 = _596;
                    _599 = _598;
                }
            }
            float _888;
            bool _891;
            vec3 _893;
            vec3 _895;
            uint _897;
            _888 = _591;
            _891 = _594;
            _893 = _596;
            _895 = _598;
            _897 = _600;
            float _889;
            bool _892;
            vec3 _894;
            vec3 _896;
            for (; _897 < _583; _888 = _889, _891 = _892, _893 = _894, _895 = _896, _897++)
            {
                uint _904 = uint(_9._m0[_897]);
                float _917 = abs(_10._m0[_904]._m5);
                if ((_10._m0[_904]._m6 & (1u << (_465 & 31u))) != 0u)
                {
                    vec3 _935 = _10._m0[_904]._m0.xyz - _488;
                    float _936 = dot(_935, _935);
                    vec3 _939 = _935 * inversesqrt(spvNMax(_936, 1.0000000133514319600180897396058e-10));
                    float _940 = _10._m0[_904]._m0.w * _10._m0[_904]._m0.w;
                    float _1168;
                    bool _1169;
                    vec3 _1170;
                    vec3 _1171;
                    if (_936 < (1.0 / _940))
                    {
                        vec3 _945 = _490 + _939;
                        vec3 _949 = _945 * inversesqrt(spvNMax(dot(_945, _945), 1.0000000133514319600180897396058e-10));
                        float _951 = clamp(dot(_939, _949), 0.0, 1.0);
                        float _953 = clamp(dot(_478, _949), 0.0, 1.0);
                        float _955 = clamp(dot(_478, _939), 0.0, 1.0);
                        float _958 = dot(-_939, normalize(_10._m0[_904]._m2.xyz));
                        float _987;
                        if (_958 > _10._m0[_904]._m1.w)
                        {
                            float _962 = _936 * _940;
                            float _968 = pow(spvNMax(abs(clamp(fma(-_962, _962, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_904]._m4);
                            float _978;
                            if (_10._m0[_904]._m5 < 0.0)
                            {
                                _978 = _968 * fma(4.0, _940, _917);
                            }
                            else
                            {
                                _978 = _968 * ((1.0 / spvNMax(_936, 9.9999997473787516355514526367188e-05)) + _917);
                            }
                            float _983 = clamp((_958 - _10._m0[_904]._m1.w) / spvNMax(_10._m0[_904]._m2.w - _10._m0[_904]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _987 = _955 * (_978 * (_983 * _983));
                        }
                        else
                        {
                            _987 = 0.0;
                        }
                        float _988 = 0.3183098733425140380859375 * _987;
                        float _1099;
                        bool _1100;
                        float _1101;
                        if ((_10._m0[_904]._m7 & 1u) != 0u)
                        {
                            uint _991 = uint(int(_10._m0[_904]._m7 >> 2u));
                            float _1093;
                            bool _1094;
                            float _1095;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_955 <= 0.0) && true)
                                {
                                    _1093 = _888;
                                    _1094 = _891;
                                    _1095 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _1024 = _20._m0[_991]._m0 * vec4(_488 + (_478 * ((3.5 * float(int(sign(_955)))) * (_20._m0[_991]._m4 * sqrt(_936)))), 1.0);
                                    vec3 _1028 = _1024.xyz / vec3(_1024.w);
                                    vec2 _1031 = (_1028.xy * 0.5) + vec2(0.5);
                                    _1031.y = 1.0 - _1031.y;
                                    float _1040 = (_20._m0[_991]._m5.y / _20._m0[_991]._m6) / (_1028.z - _20._m0[_991]._m5.x);
                                    float _1045 = _891 ? _888 : 6.283185482025146484375;
                                    float _1046 = _560 * _1045;
                                    vec2 _1047 = _20._m0[_991]._m1 + _19._m33;
                                    vec2 _1050 = (_20._m0[_991]._m1 + vec2(_20._m0[_991]._m2)) - _19._m33;
                                    float _1052;
                                    _1052 = 0.0;
                                    for (int _1055 = 0; _1055 < 12; )
                                    {
                                        float _1060 = float(uint(_1055));
                                        float _1063 = sqrt(_1060 + 0.5) * 0.288675129413604736328125;
                                        float _1064 = fma(_1060, 2.3999631404876708984375, _1046);
                                        vec2 _1072 = clamp(fma((vec3(cos(_1064), sin(_1064), _1063).xy * _1063) * 2.5, _19._m33, _1031), _1047, _1050);
                                        vec2 _1075 = fract(fma(vec2(1.0) / _19._m33, _1072, vec2(0.5)));
                                        vec4 _1081 = vec4(lessThan(vec4(_1040), textureGather(sampler2D(_21, _12), _1072)));
                                        float _1084 = _1075.x;
                                        _1052 += clamp(mix(mix(_1081.w, _1081.z, _1084), mix(_1081.x, _1081.y, _1084), _1075.y), 0.0, 1.0);
                                        _1055++;
                                        continue;
                                    }
                                    _1093 = _1045;
                                    _1094 = _891 ? _891 : true;
                                    _1095 = _1052 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _1099 = _1093;
                            _1100 = _1094;
                            _1101 = _988 * mix(1.0, _1095, spvNMin(_567, _10._m0[_904]._m8));
                        }
                        else
                        {
                            _1099 = _888;
                            _1100 = _891;
                            _1101 = _988;
                        }
                        vec3 _1166;
                        vec3 _1167;
                        if (_955 > 0.0)
                        {
                            vec3 _1107 = _10._m0[_904]._m1.xyz * (_1101 * ((_10._m0[_904]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _1114 = vec3(fma((2.0 * _951) * _951, _519, mix(0.0, 0.5, _519))) - vec3(1.0);
                            float _1135 = (_519 + 1.0) * 0.5;
                            float _1136 = _519 * _519;
                            float _1144 = _1135 * _1135;
                            float _1156 = _1136 * _1136;
                            float _1159 = fma(fma(_953, _1156, -_953), _953, 1.0);
                            _1166 = fma(_1107, (_486 + ((vec3(1.0) - _486) * pow(spvNMax(abs(1.0 - _951), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_955, sqrt(fma(fma(-_589, _1144, _589), _589, _1144)), _589 * sqrt(fma(fma(-_955, _1144, _955), _955, _1144)))) * (_1156 * (0.3183098733425140380859375 / (_1159 * _1159)))), _893);
                            _1167 = fma(_1107, _481 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1114 * pow(spvNMax(abs(1.0 - _955), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1114 * pow(spvNMax(abs(1.0 - _589), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _519))), _895);
                        }
                        else
                        {
                            _1166 = _893;
                            _1167 = _895;
                        }
                        _1168 = _1099;
                        _1169 = _1100;
                        _1170 = _1166;
                        _1171 = _1167;
                    }
                    else
                    {
                        _1168 = _888;
                        _1169 = _891;
                        _1170 = _893;
                        _1171 = _895;
                    }
                    _889 = _1168;
                    _892 = _1169;
                    _894 = _1170;
                    _896 = _1171;
                }
                else
                {
                    _889 = _888;
                    _892 = _891;
                    _894 = _893;
                    _896 = _895;
                }
            }
            vec3 _1178;
            vec3 _1180;
            _1178 = _893;
            _1180 = _895;
            float _1174;
            bool _1177;
            vec3 _1179;
            vec3 _1181;
            float _1173 = _888;
            bool _1176 = _891;
            uint _1182 = _897;
            for (; _1182 < _587; _1173 = _1174, _1176 = _1177, _1178 = _1179, _1180 = _1181, _1182++)
            {
                uint _1189 = uint(_9._m0[_1182]);
                int _1218 = int(_11._m0[_1189]._m1 >> 1u) - 1;
                if (((_11._m0[_1189]._m4 & 16777215u) & (1u << (_465 & 31u))) != 0u)
                {
                    vec3 _1229 = _11._m0[_1189]._m6 * vec4(_488, 1.0);
                    float _1609;
                    bool _1610;
                    vec3 _1611;
                    vec3 _1612;
                    if (all(lessThan(abs(_1229 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _1236 = _490 + _11._m0[_1189]._m9;
                        vec3 _1240 = _1236 * inversesqrt(spvNMax(dot(_1236, _1236), 1.0000000133514319600180897396058e-10));
                        float _1242 = clamp(dot(_11._m0[_1189]._m9, _1240), 0.0, 1.0);
                        float _1244 = clamp(dot(_478, _1240), 0.0, 1.0);
                        float _1246 = clamp(dot(_478, _11._m0[_1189]._m9), 0.0, 1.0);
                        int _1247 = int(_11._m0[_1189]._m4 >> 24u);
                        float _1248 = _1229.z;
                        vec3 _1287;
                        if (_1248 < _11._m0[_1189]._m2.x)
                        {
                            float _1275 = _1248 * _11._m0[_1189]._m2.z;
                            float _1278 = _1275 * _1275;
                            vec3 _1286;
                            _1286.z = dot(_304[_1247], vec4(_1275, _1278, smoothstep(0.0, 1.0, _1275), (_1278 * _1275) * fma(_1275, fma(_1275, 6.0, -15.0), 10.0)));
                            _1287 = _1286;
                        }
                        else
                        {
                            vec3 _1273;
                            if (_1248 > _11._m0[_1189]._m2.y)
                            {
                                float _1261 = (1.0 - _1248) * _11._m0[_1189]._m2.w;
                                float _1264 = _1261 * _1261;
                                vec3 _1272;
                                _1272.z = dot(_304[_1247], vec4(_1261, _1264, smoothstep(0.0, 1.0, _1261), (_1264 * _1261) * fma(_1261, fma(_1261, 6.0, -15.0), 10.0)));
                                _1273 = _1272;
                            }
                            else
                            {
                                _1273 = vec3(0.0, 0.0, 1.0);
                            }
                            _1287 = _1273;
                        }
                        vec2 _1288 = _1229.xy;
                        vec2 _1292 = (vec2(0.5) - abs(_1288 - vec2(0.5))) * _11._m0[_1189]._m3;
                        float _1293 = _1292.x;
                        vec3 _1310;
                        if (_1293 < 1.0)
                        {
                            float _1301 = _1293 * _1293;
                            vec3 _1309 = _1287;
                            _1309.x = dot(_304[_1247], vec4(_1293, _1301, smoothstep(0.0, 1.0, _1293), (_1301 * _1293) * fma(_1293, fma(_1293, 6.0, -15.0), 10.0)));
                            _1310 = _1309;
                        }
                        else
                        {
                            vec3 _1298 = _1287;
                            _1298.x = 1.0;
                            _1310 = _1298;
                        }
                        float _1311 = _1292.y;
                        vec3 _1328;
                        if (_1311 < 1.0)
                        {
                            float _1319 = _1311 * _1311;
                            vec3 _1327 = _1310;
                            _1327.y = dot(_304[_1247], vec4(_1311, _1319, smoothstep(0.0, 1.0, _1311), (_1319 * _1311) * fma(_1311, fma(_1311, 6.0, -15.0), 10.0)));
                            _1328 = _1327;
                        }
                        else
                        {
                            vec3 _1316 = _1310;
                            _1316.y = 1.0;
                            _1328 = _1316;
                        }
                        float _1334 = _1246 * ((_1328.x * _1328.y) * _1328.z);
                        float _1439;
                        bool _1440;
                        float _1441;
                        if ((_11._m0[_1189]._m8 & 1u) != 0u)
                        {
                            uint _1337 = uint(int(_11._m0[_1189]._m8 >> 2u));
                            float _1433;
                            bool _1434;
                            float _1435;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_1246 <= 0.0) && true)
                                {
                                    _1433 = _1173;
                                    _1434 = _1176;
                                    _1435 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _1368 = _20._m0[_1337]._m0 * vec4(_488 + (_478 * ((3.5 * float(int(sign(_1246)))) * _20._m0[_1337]._m4)), 1.0);
                                    vec2 _1371 = (_1368.xy * 0.5) + vec2(0.5);
                                    _1371.y = 1.0 - _1371.y;
                                    float _1380 = ((_1368.z - _20._m0[_1337]._m5.y) / _20._m0[_1337]._m5.x) / _20._m0[_1337]._m6;
                                    float _1385 = _1176 ? _1173 : 6.283185482025146484375;
                                    float _1386 = _560 * _1385;
                                    vec2 _1387 = _20._m0[_1337]._m1 + _19._m33;
                                    vec2 _1390 = (_20._m0[_1337]._m1 + vec2(_20._m0[_1337]._m2)) - _19._m33;
                                    float _1392;
                                    _1392 = 0.0;
                                    for (int _1395 = 0; _1395 < 12; )
                                    {
                                        float _1400 = float(uint(_1395));
                                        float _1403 = sqrt(_1400 + 0.5) * 0.288675129413604736328125;
                                        float _1404 = fma(_1400, 2.3999631404876708984375, _1386);
                                        vec2 _1412 = clamp(fma((vec3(cos(_1404), sin(_1404), _1403).xy * _1403) * 2.5, _19._m33, _1371), _1387, _1390);
                                        vec2 _1415 = fract(fma(vec2(1.0) / _19._m33, _1412, vec2(0.5)));
                                        vec4 _1421 = vec4(lessThan(vec4(_1380), textureGather(sampler2D(_21, _12), _1412)));
                                        float _1424 = _1415.x;
                                        _1392 += clamp(mix(mix(_1421.w, _1421.z, _1424), mix(_1421.x, _1421.y, _1424), _1415.y), 0.0, 1.0);
                                        _1395++;
                                        continue;
                                    }
                                    _1433 = _1385;
                                    _1434 = _1176 ? _1176 : true;
                                    _1435 = _1392 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _1439 = _1433;
                            _1440 = _1434;
                            _1441 = _1334 * mix(1.0, _1435, spvNMin(_567, _11._m0[_1189]._m5));
                        }
                        else
                        {
                            _1439 = _1173;
                            _1440 = _1176;
                            _1441 = _1334;
                        }
                        vec3 _1474;
                        if (_1218 >= 0)
                        {
                            vec2 _1447 = (subgroupQuadSwapHorizontal(_1288) - _1288) * _497;
                            vec2 _1450 = (subgroupQuadSwapVertical(_1288) - _1288) * _503;
                            vec2 _1454 = mix(_1447, vec2(0.0), bvec2(any(isnan(_1447))));
                            vec2 _1458 = mix(_1450, vec2(0.0), bvec2(any(isnan(_1450))));
                            bvec2 _1467 = bvec2(any(greaterThan(abs(vec4(_1454, _1458)), vec4(0.015625))));
                            int _73 = _1218;
                            _1474 = _11._m0[_1189]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_73], _7)), _1288, mix(_1454, vec2(0.0), _1467), mix(_1458, vec2(0.0), _1467)).xyz;
                        }
                        else
                        {
                            _1474 = _11._m0[_1189]._m0;
                        }
                        vec3 _1607;
                        vec3 _1608;
                        SPIRV_CROSS_BRANCH
                        if ((_11._m0[_1189]._m1 & 1u) != 0u)
                        {
                            vec3 _1605;
                            vec3 _1606;
                            if (_1246 > 0.0)
                            {
                                vec3 _1546 = _1474 * (_1441 * _6._m0[0u]);
                                vec3 _1553 = vec3(fma((2.0 * _1242) * _1242, _519, mix(0.0, 0.5, _519))) - vec3(1.0);
                                float _1574 = (_519 + 1.0) * 0.5;
                                float _1575 = _519 * _519;
                                float _1583 = _1574 * _1574;
                                float _1595 = _1575 * _1575;
                                float _1598 = fma(fma(_1244, _1595, -_1244), _1244, 1.0);
                                _1605 = fma(_1546, (_486 + ((vec3(1.0) - _486) * pow(spvNMax(abs(1.0 - _1242), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1246, sqrt(fma(fma(-_589, _1583, _589), _589, _1583)), _589 * sqrt(fma(fma(-_1246, _1583, _1246), _1246, _1583)))) * (_1595 * (0.3183098733425140380859375 / (_1598 * _1598)))), _1178);
                                _1606 = fma(_1546, _481 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1553 * pow(spvNMax(abs(1.0 - _1246), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1553 * pow(spvNMax(abs(1.0 - _589), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _519))), _1180);
                            }
                            else
                            {
                                _1605 = _1178;
                                _1606 = _1180;
                            }
                            _1607 = _1605;
                            _1608 = _1606;
                        }
                        else
                        {
                            vec3 _1540;
                            vec3 _1541;
                            if (_1246 > 0.0)
                            {
                                vec3 _1481 = _1474 * _1441;
                                vec3 _1488 = vec3(fma((2.0 * _1242) * _1242, _519, mix(0.0, 0.5, _519))) - vec3(1.0);
                                float _1509 = (_519 + 1.0) * 0.5;
                                float _1510 = _519 * _519;
                                float _1518 = _1509 * _1509;
                                float _1530 = _1510 * _1510;
                                float _1533 = fma(fma(_1244, _1530, -_1244), _1244, 1.0);
                                _1540 = fma(_1481, (_486 + ((vec3(1.0) - _486) * pow(spvNMax(abs(1.0 - _1242), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1246, sqrt(fma(fma(-_589, _1518, _589), _589, _1518)), _589 * sqrt(fma(fma(-_1246, _1518, _1246), _1246, _1518)))) * (_1530 * (0.3183098733425140380859375 / (_1533 * _1533)))), _1178);
                                _1541 = fma(_1481, _481 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1488 * pow(spvNMax(abs(1.0 - _1246), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1488 * pow(spvNMax(abs(1.0 - _589), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _519))), _1180);
                            }
                            else
                            {
                                _1540 = _1178;
                                _1541 = _1180;
                            }
                            _1607 = _1540;
                            _1608 = _1541;
                        }
                        _1609 = _1439;
                        _1610 = _1440;
                        _1611 = _1607;
                        _1612 = _1608;
                    }
                    else
                    {
                        _1609 = _1173;
                        _1610 = _1176;
                        _1611 = _1178;
                        _1612 = _1180;
                    }
                    _1174 = _1609;
                    _1177 = _1610;
                    _1179 = _1611;
                    _1181 = _1612;
                }
                else
                {
                    _1174 = _1173;
                    _1177 = _1176;
                    _1179 = _1178;
                    _1181 = _1180;
                }
            }
            _1613 = _1178;
            _1614 = _1180;
        }
        else
        {
            _1613 = vec3(0.0);
            _1614 = vec3(0.0);
        }
        vec3 _1616 = reflect(-_490, _478);
        vec3 _1618 = vec3(_486.x, _486.y, _486.z);
        vec3 _1628 = textureLod(samplerCube(_14, _7), _478, 0.0).xyz * _19._m27;
        vec3 _1635 = textureLod(samplerCube(_15, _7), _1616, fma(_519, 8.0, _19._m30 - 8.0)).xyz * _19._m27;
        vec3 _1660;
        vec3 _1661;
        SPIRV_CROSS_BRANCH
        if (_19._m29 > 0.0)
        {
            vec3 _1650 = vec3(_19._m29);
            _1660 = mix(_1635, textureLod(samplerCube(_17, _7), _1616, fma(_519, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _1650);
            _1661 = mix(_1628, textureLod(samplerCube(_16, _7), _478, 0.0).xyz * _19._m28, _1650);
        }
        else
        {
            _1660 = _1635;
            _1661 = _1628;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_1661, _519);
            _1660 *= rdx_mod;
            _1661 *= rdx_mod;
        }
        float _1662 = spvNMax(dot(_490, _478), 0.001953125);
        vec4 _1667 = textureLod(sampler2D(_18, _12), vec2(_1662, _519), 0.0);
        uvec4 _1680 = uvec4(_8._m0[uint(_551)]);
        uint _1682 = _1680.y;
        uint _1692 = ((_1680.z >> 0u) & 1023u) + (((_1682 >> 12u) & 4095u) + (((_1682 >> 0u) & 4095u) + _1680.x));
        uint _1694 = (_1682 >> 24u) + _1692;
        vec3 _1696;
        vec3 _1699;
        _1696 = _1660 * ((_1618 * _1667.x) + vec3(_1667.y));
        _1699 = _1661 * (_481 * _1667.z);
        vec3 _1697;
        vec3 _1700;
        for (uint _1701 = _1692; _1701 < _1694; _1696 = _1697, _1699 = _1700, _1701++)
        {
            uint _1708 = uint(_9._m0[_1701]);
            int _1727 = int((_13._m0[_1708]._m5 >> 1u) & 3u);
            mat3 _1731 = mat3(_13._m0[_1708]._m1[0], _13._m0[_1708]._m1[1], _13._m0[_1708]._m1[2]);
            int _1737 = (int((_13._m0[_1708]._m5 >> 3u) & 16383u) - 1) * 2;
            int _1742 = (int((_13._m0[_1708]._m5 >> 17u) & 16383u) - 1) * 2;
            int _1747 = (int((_13._m0[_1708]._m6 >> 0u) & 65535u) - 1) * 2;
            int _1752 = (int((_13._m0[_1708]._m6 >> 16u) & 65535u) - 1) * 2;
            float _1755 = (_13._m0[_1708]._m3 < 0.0) ? (-_13._m0[_1708]._m3) : 1.0;
            vec3 _1757 = _1731 * (_488 - _13._m0[_1708]._m1[3]);
            bool _1758 = int(_13._m0[_1708]._m5 & 1u) == 1;
            vec3 _1759 = abs(_1757);
            float _1762 = dot(_1757, _1757);
            if (_1758 ? any(greaterThanEqual(_1759, _13._m0[_1708]._m0.xyz)) : (_1762 >= _13._m0[_1708]._m0.y))
            {
                _1697 = _1696;
                _1700 = _1699;
                continue;
            }
            vec3 _1936;
            SPIRV_CROSS_FLATTEN
            if ((_1727 & 1) != 0)
            {
                vec3 _1772 = _1731 * _478;
                vec2 _1861;
                bool _1862;
                if (_1758)
                {
                    vec2 _1856;
                    bool _1860;
                    do
                    {
                        vec3 _1840 = (_13._m0[_1708]._m0.xyz - _1757) / _1772;
                        vec3 _1843 = ((-_13._m0[_1708]._m0.xyz) - _1757) / _1772;
                        vec3 _1844 = spvNMin(_1840, _1843);
                        vec3 _1845 = spvNMax(_1840, _1843);
                        float _1850 = spvNMax(_1844.x, spvNMax(_1844.y, _1844.z));
                        float _1855 = spvNMin(_1845.x, spvNMin(_1845.y, _1845.z));
                        _1856 = vec2(_1850, _1855);
                        if (_1850 > _1855)
                        {
                            _1860 = false;
                            break;
                        }
                        _1860 = true;
                        break;
                    } while(false);
                    _1861 = _1856;
                    _1862 = _1860;
                }
                else
                {
                    vec2 _1835;
                    bool _1836;
                    do
                    {
                        float _1778 = dot(_1772, _1772);
                        float _1779 = dot(_1772, _1757);
                        float _1780 = 2.0 * _1779;
                        float _1781 = _1762 - _13._m0[_1708]._m0.y;
                        float _1817;
                        float _1818;
                        bool _1819;
                        do
                        {
                            float _1787 = fma(_1780, _1780, -((4.0 * _1778) * _1781));
                            float _1815;
                            float _1816;
                            if (_1787 < 0.0)
                            {
                                _1817 = 0.0;
                                _1818 = 0.0;
                                _1819 = false;
                                break;
                            }
                            else
                            {
                                if (_1787 == 0.0)
                                {
                                    float _1814 = (_1779 * (-1.0)) * (1.0 / _1778);
                                    _1815 = _1814;
                                    _1816 = _1814;
                                }
                                else
                                {
                                    float _1807;
                                    if (_1780 > 0.0)
                                    {
                                        _1807 = (-0.5) * fma(2.0, _1779, sqrt(_1787));
                                    }
                                    else
                                    {
                                        _1807 = (-0.5) * fma(2.0, _1779, -sqrt(_1787));
                                    }
                                    _1815 = _1781 * (1.0 / _1807);
                                    _1816 = _1807 * (1.0 / _1778);
                                }
                            }
                            _1817 = _1815;
                            _1818 = _1816;
                            _1819 = true;
                            break;
                        } while(false);
                        if (!_1819)
                        {
                            _1835 = vec2(0.0);
                            _1836 = false;
                            break;
                        }
                        if ((_1818 < 0.0) && (_1817 < 0.0))
                        {
                            _1835 = vec2(0.0);
                            _1836 = false;
                            break;
                        }
                        vec2 _1834;
                        if (_1818 > _1817)
                        {
                            _1834 = vec2(_1817, _1818);
                        }
                        else
                        {
                            _1834 = vec2(_1818, _1817);
                        }
                        _1835 = _1834;
                        _1836 = true;
                        break;
                    } while(false);
                    _1861 = _1835;
                    _1862 = _1836;
                }
                vec3 _1865 = _1757 + (_1772 * _1861.y);
                float _1886;
                if (_1758)
                {
                    _1886 = 1.0 - clamp(length(spvNMax(_1759 - (_13._m0[_1708]._m0.xyz - vec3(_13._m0[_1708]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1708]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _1886 = clamp((_13._m0[_1708]._m0.x - length(_1757)) * (1.0 / spvNMax(_13._m0[_1708]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _1889 = float(_1862) * smoothstep(0.0, 1.0, _1886);
                vec4 _1931;
                SPIRV_CROSS_BRANCH
                if (_1889 > 9.9999997473787516355514526367188e-05)
                {
                    float _1898 = mix(clamp((_1861.y * (1.0 / length(_1865))) * _519, 0.0, _519), _519, _519);
                    vec3 _1900 = mix(_1865, _1772, vec3(_1898));
                    int _77 = _1737;
                    vec4 _1901 = textureLod(nonuniformEXT(samplerCube(_24[_77], _7)), _1900, 0.0);
                    int _81 = _1737 + 1;
                    _1901.w = textureLod(nonuniformEXT(samplerCube(_24[_81], _7)), _1900, 0.0).x;
                    vec4 _1916;
                    SPIRV_CROSS_BRANCH
                    if (_1742 >= 0)
                    {
                        int _85 = _1742;
                        vec4 _1909 = textureLod(nonuniformEXT(samplerCube(_24[_85], _7)), _1900, 0.0);
                        int _89 = _1742 + 1;
                        _1909.w = textureLod(nonuniformEXT(samplerCube(_24[_89], _7)), _1900, 0.0).x;
                        _1916 = mix(_1901, _1909, vec4(_13._m0[_1708]._m3));
                    }
                    else
                    {
                        _1916 = _1901;
                    }
                    vec4 _1917 = _1916 * _1755;
                    vec3 _1926 = (_1917.xyz * _13._m0[_1708]._m4).xyz * (_481 * textureLod(sampler2D(_18, _12), vec2(_1662, _1898), 0.0).z);
                    vec4 _1927 = vec4(_1926.x, _1926.y, _1926.z, _1917.w);
                    _1927.w = _1917.w * _1889;
                    _1931 = _1927;
                }
                else
                {
                    _1931 = vec4(0.0);
                }
                _1936 = mix(_1699, _1931.xyz, vec3(_1931.w));
            }
            else
            {
                _1936 = _1699;
            }
            vec3 _2115;
            SPIRV_CROSS_FLATTEN
            if ((_1727 & 2) != 0)
            {
                vec3 _1941 = _1731 * _1616;
                vec2 _2030;
                bool _2031;
                if (_1758)
                {
                    vec2 _2025;
                    bool _2029;
                    do
                    {
                        vec3 _2009 = (_13._m0[_1708]._m0.xyz - _1757) / _1941;
                        vec3 _2012 = ((-_13._m0[_1708]._m0.xyz) - _1757) / _1941;
                        vec3 _2013 = spvNMin(_2009, _2012);
                        vec3 _2014 = spvNMax(_2009, _2012);
                        float _2019 = spvNMax(_2013.x, spvNMax(_2013.y, _2013.z));
                        float _2024 = spvNMin(_2014.x, spvNMin(_2014.y, _2014.z));
                        _2025 = vec2(_2019, _2024);
                        if (_2019 > _2024)
                        {
                            _2029 = false;
                            break;
                        }
                        _2029 = true;
                        break;
                    } while(false);
                    _2030 = _2025;
                    _2031 = _2029;
                }
                else
                {
                    vec2 _2004;
                    bool _2005;
                    do
                    {
                        float _1947 = dot(_1941, _1941);
                        float _1948 = dot(_1941, _1757);
                        float _1949 = 2.0 * _1948;
                        float _1950 = _1762 - _13._m0[_1708]._m0.y;
                        float _1986;
                        float _1987;
                        bool _1988;
                        do
                        {
                            float _1956 = fma(_1949, _1949, -((4.0 * _1947) * _1950));
                            float _1984;
                            float _1985;
                            if (_1956 < 0.0)
                            {
                                _1986 = 0.0;
                                _1987 = 0.0;
                                _1988 = false;
                                break;
                            }
                            else
                            {
                                if (_1956 == 0.0)
                                {
                                    float _1983 = (_1948 * (-1.0)) * (1.0 / _1947);
                                    _1984 = _1983;
                                    _1985 = _1983;
                                }
                                else
                                {
                                    float _1976;
                                    if (_1949 > 0.0)
                                    {
                                        _1976 = (-0.5) * fma(2.0, _1948, sqrt(_1956));
                                    }
                                    else
                                    {
                                        _1976 = (-0.5) * fma(2.0, _1948, -sqrt(_1956));
                                    }
                                    _1984 = _1950 * (1.0 / _1976);
                                    _1985 = _1976 * (1.0 / _1947);
                                }
                            }
                            _1986 = _1984;
                            _1987 = _1985;
                            _1988 = true;
                            break;
                        } while(false);
                        if (!_1988)
                        {
                            _2004 = vec2(0.0);
                            _2005 = false;
                            break;
                        }
                        if ((_1987 < 0.0) && (_1986 < 0.0))
                        {
                            _2004 = vec2(0.0);
                            _2005 = false;
                            break;
                        }
                        vec2 _2003;
                        if (_1987 > _1986)
                        {
                            _2003 = vec2(_1986, _1987);
                        }
                        else
                        {
                            _2003 = vec2(_1987, _1986);
                        }
                        _2004 = _2003;
                        _2005 = true;
                        break;
                    } while(false);
                    _2030 = _2004;
                    _2031 = _2005;
                }
                vec3 _2034 = _1757 + (_1941 * _2030.y);
                float _2055;
                if (_1758)
                {
                    _2055 = 1.0 - clamp(length(spvNMax(_1759 - (_13._m0[_1708]._m0.xyz - vec3(_13._m0[_1708]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1708]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2055 = clamp((_13._m0[_1708]._m0.x - length(_1757)) * (1.0 / spvNMax(_13._m0[_1708]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2058 = float(_2031) * smoothstep(0.0, 1.0, _2055);
                vec4 _2110;
                SPIRV_CROSS_BRANCH
                if (_2058 > 9.9999997473787516355514526367188e-05)
                {
                    float _2067 = mix(clamp((_2030.y * (1.0 / length(_2034))) * _519, 0.0, _519), _519, _519);
                    vec3 _2069 = mix(_2034, _1941, vec3(_2067));
                    float _2070 = _2067 * 8.0;
                    int _93 = _1747;
                    int _97 = _1747 + 1;
                    vec4 _2078 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_93], _7)), _2069, _2070).xyz, textureLod(nonuniformEXT(samplerCube(_24[_97], _7)), _2069, _2070).x);
                    vec4 _2092;
                    SPIRV_CROSS_BRANCH
                    if (_1752 >= 0)
                    {
                        int _101 = _1752;
                        int _105 = _1752 + 1;
                        _2092 = mix(_2078, vec4(textureLod(nonuniformEXT(samplerCube(_24[_101], _7)), _2069, _2070).xyz, textureLod(nonuniformEXT(samplerCube(_24[_105], _7)), _2069, _2070).x), vec4(_13._m0[_1708]._m3));
                    }
                    else
                    {
                        _2092 = _2078;
                    }
                    vec4 _2093 = _2092 * _1755;
                    vec4 _2098 = textureLod(sampler2D(_18, _12), vec2(_1662, _2067), 0.0);
                    vec3 _2105 = (_2093.xyz * _13._m0[_1708]._m4).xyz * ((_1618 * _2098.x) + vec3(_2098.y));
                    vec4 _2106 = vec4(_2105.x, _2105.y, _2105.z, _2093.w);
                    _2106.w = _2093.w * _2058;
                    _2110 = _2106;
                }
                else
                {
                    _2110 = vec4(0.0);
                }
                _2115 = mix(_1696, _2110.xyz, vec3(_2110.w));
            }
            else
            {
                _2115 = _1696;
            }
            _1697 = _2115;
            _1700 = _1936;
        }
        float _2116 = _6._m0[0u] * 100.0;
        bool _2121 = _26._m19 > 0.0;
        vec3 _2182;
        SPIRV_CROSS_BRANCH
        if (_2121 && (_26._m35 == 0.0))
        {
            vec3 _2135 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _2136 = length(_2135);
            vec3 _2147;
            float _2148;
            if (_2136 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2145 = _2135;
                _2145.z = _2135.z + _29._m0;
                _2147 = _2145;
                _2148 = length(_2145);
            }
            else
            {
                _2147 = _2135;
                _2148 = _2136;
            }
            float _2151 = dot(_2147 / vec3(_2148), _26._m36);
            float _2152 = _29._m0 / _2148;
            _2182 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_2151 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_2148 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_2151 < (-sqrt(fma(-_2152, _2152, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _2182 = _26._m2;
        }
        float _2195 = texelFetch(_40, ivec3(int(_554), int(_555), 0).xy, 0).x;
        float _2280;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _2219 = _27._m6 + _488;
            vec3 _2226 = vec3(0.0, _26._m18.z, 0.0) + (_2219 - vec3(0.0, _26._m25, 0.0));
            float _2230 = dot(_2226, _26._m24);
            vec2 _2240 = ((((_2226 + (_26._m24 * (sqrt(fma(_2230, _2230, fma(_26._m18.z, _26._m18.z, -dot(_2226, _2226)))) - _2230))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _2240.x = 1.0 - _2240.x;
            vec3 _2253 = vec3(0.0, _26._m23.z, 0.0) + (_2219 - vec3(0.0, _26._m27, 0.0));
            float _2257 = dot(_2253, _26._m26);
            vec2 _2267 = ((((_2253 + (_26._m26 * (sqrt(fma(_2257, _2257, fma(_26._m23.z, _26._m23.z, -dot(_2253, _2253)))) - _2257))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _2267.x = 1.0 - _2267.x;
            _2280 = _2195 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _2240, 0.0).x, textureLod(sampler2D(_33, _7), _2267, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _2280 = _2195;
        }
        float _2370;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _2308 = _27._m6 + _488;
            vec3 _2316 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _2308) - vec3(0.0, _26._m30, 0.0));
            float _2320 = dot(_2316, _26._m24);
            vec2 _2330 = ((((_2316 + (_26._m24 * (sqrt(fma(_2320, _2320, fma(_26._m28.z, _26._m28.z, -dot(_2316, _2316)))) - _2320))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _2330.x = 1.0 - _2330.x;
            vec3 _2344 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _2308) - vec3(0.0, _26._m33, 0.0));
            float _2348 = dot(_2344, _26._m26);
            vec2 _2358 = ((((_2344 + (_26._m26 * (sqrt(fma(_2348, _2348, fma(_26._m31.z, _26._m31.z, -dot(_2344, _2344)))) - _2348))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _2358.x = 1.0 - _2358.x;
            _2370 = _2280 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _2330, 0.0).x, textureLod(sampler2D(_23, _7), _2358, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _2370 = _2280;
        }
        vec3 _2372 = _2182 * (_2370 * _6._m0[0u]);
        vec3 _2468;
        vec3 _2469;
        SPIRV_CROSS_BRANCH
        if (_568)
        {
            vec3 _2378 = reflect(_490, _478);
            float _2380 = spvNMax(dot(_478, _490), 9.9999997473787516355514526367188e-06);
            float _2384 = clamp(dot(_26._m0, normalize(_490 + _26._m0)), 0.0, 1.0);
            float _2386 = clamp(dot(_478, _26._m0), 0.0, 1.0);
            vec3 _2393 = vec3(fma((2.0 * _2384) * _2384, _519, mix(0.0, 0.5, _519))) - vec3(1.0);
            float _2412 = dot(_26._m0, _2378);
            vec3 _2422 = mix(_2378, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_2378 - (_26._m0 * _2412)) * 0.0045900647528469562530517578125)), bvec3(_2412 < 0.999989449977874755859375));
            vec3 _2424 = normalize(_490 + _2422);
            float _2428 = clamp(dot(_478, _2424), 0.0, 1.0);
            float _2430 = clamp(dot(_478, _2422), 0.0, 1.0);
            float _2432 = (_519 + 1.0) * 0.5;
            float _2433 = _519 * _519;
            float _2441 = _2432 * _2432;
            float _2453 = _2433 * _2433;
            float _2456 = fma(fma(_2428, _2453, -_2428), _2428, 1.0);
            _2468 = _1613 + ((_2372 * ((_486 + ((vec3(1.0) - _486) * pow(spvNMax(abs(1.0 - clamp(dot(_2422, _2424), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2430, sqrt(fma(fma(-_2380, _2441, _2380), _2380, _2441)), _2380 * sqrt(fma(fma(-_2430, _2441, _2430), _2430, _2441)))) * (_2453 * (0.3183098733425140380859375 / (_2456 * _2456)))))) * _2386);
            _2469 = _1614 + ((_2372 * (_481 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2393 * pow(spvNMax(abs(1.0 - _2386), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2393 * pow(spvNMax(abs(1.0 - _2380), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _519))))) * _2386);
        }
        else
        {
            _2468 = _1613;
            _2469 = _1614;
        }
        float _2489;
        float _2490;
        if (_34._m0.x > 0.0)
        {
            vec4 _2477 = textureLod(sampler2D(_39, _12), _396, 0.0);
            float _2478 = _2477.x;
            _2489 = clamp((pow(spvNMax(abs(dot(_478, _490) + _2478), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _519, -1.0))) - 1.0) + _2478, 0.0, 1.0);
            _2490 = _2478;
        }
        else
        {
            _2489 = 1.0;
            _2490 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _2490, 0.7);
            _2468 *= rdx_ao_factor;
            _2469 *= rdx_ao_factor;
        }
        vec3 _2498 = (_2469 * mix(1.0, _2490, _34._m0.y)) + ((_1699 * _2116) * _2490);
        vec3 _2500 = (_2468 * mix(1.0, _2489, _34._m0.y)) + ((_1696 * _2116) * _2489);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _2500 *= rdx_multi_scatter_compensation(_1662, _519, _486);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _2195, 0.5);
            _2498 *= _rdx_csm_shadow;
            _2500 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _38, _7, _396, _rdx_marchDir, _436, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _2498 *= _rdx_micro;
            _2500 *= _rdx_micro;
        }
        vec3 _3005;
        vec3 _3006;
        SPIRV_CROSS_BRANCH
        if (_2121)
        {
            vec3 _2508 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _2509 = vec3(0.0, 636100.0, 0.0) + (_488 + _27._m6);
            float _2510 = length(_2509);
            vec3 _2514 = (_2509 / vec3(_2510)) * spvNMax(_2510, 636100.0);
            vec3 _2515 = _2514 - _2508;
            float _2516 = length(_2515);
            vec3 _2518 = _2515 / vec3(_2516);
            float _2519 = length(_2508);
            vec3 _2533;
            vec3 _2534;
            float _2535;
            if (_2519 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2528 = _2508;
                _2528.z = _2508.z + _29._m0;
                vec3 _2531 = _2514;
                _2531.z = _2514.z + _29._m0;
                _2533 = _2531;
                _2534 = _2528;
                _2535 = length(_2528);
            }
            else
            {
                _2533 = _2514;
                _2534 = _2508;
                _2535 = _2519;
            }
            float _2536 = dot(_2534, _2518);
            float _2547 = spvNMax((-_2536) - sqrt(fma(_29._m1, _29._m1, fma(_2536, _2536, -(_2535 * _2535)))), 0.0);
            bool _2550 = (_2547 > 0.0) && (_2547 < _2516);
            vec3 _2558;
            float _2559;
            float _2560;
            if (_2550)
            {
                _2558 = _2534 + (_2518 * _2547);
                _2559 = _2516 - _2547;
                _2560 = (_2536 + _2547) / _29._m1;
            }
            else
            {
                _2558 = _2534;
                _2559 = _2516;
                _2560 = _2536 / _2535;
            }
            float _2561 = _2550 ? _29._m1 : _2535;
            vec3 _2998;
            vec3 _2999;
            if (_2561 <= _29._m1)
            {
                float _2566 = dot(_2518, _26._m36);
                float _2568 = dot(_2558, _26._m36) / _2561;
                float _2569 = _29._m0 + 600.0;
                bool _2570 = _2561 < _2569;
                vec3 _2575;
                if (_2570)
                {
                    _2575 = _2533 * (_2569 / _2561);
                }
                else
                {
                    _2575 = _2533;
                }
                float _2576 = _2570 ? _2569 : _2561;
                float _2577 = length(_2575);
                float _2578 = dot(_2575, _2518);
                float _2580 = dot(_2575, _26._m36) / _2577;
                vec2 _2591 = vec2(_2560, _2560 + (_2559 / _2576));
                vec2 _2592 = _2591 * sqrt((0.5 / _29._m4) * _2576);
                vec2 _2595 = vec2(ivec2(sign(_2592)));
                vec2 _2596 = _2592 * _2592;
                float _2610 = -_2559;
                float _2612 = 2.0 * _2576;
                float _2614 = (_2559 / _2612) + _2560;
                float _2622 = _29._m0 - _2576;
                vec2 _2637 = _2591 * sqrt((0.5 / _29._m6) * _2576);
                vec2 _2640 = vec2(ivec2(sign(_2637)));
                vec2 _2641 = _2637 * _2637;
                vec3 _2671 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _2576) * exp(_2622 / _29._m4)) * (((_2595.y > _2595.x) ? exp(_2596.x) : 0.0) + dot((_2595 / ((abs(_2592) * 2.3192999362945556640625) + sqrt((_2596 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2610 / _29._m4) * _2614)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _2576) * exp(_2622 / _29._m6)) * (((_2640.y > _2640.x) ? exp(_2641.x) : 0.0) + dot((_2640 / ((abs(_2637) * 2.3192999362945556640625) + sqrt((_2641 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2610 / _29._m6) * _2614)), vec2(1.0, -1.0))))));
                vec3 _2672 = spvNMin(_2671, vec3(1.0));
                float _2673 = _29._m0 / _2576;
                float _2676 = sqrt(fma(-_2673, _2673, 1.0));
                float _2678 = _2560 - (-_2676);
                vec4 _2961;
                if (abs(_2678) < 0.0040000001899898052215576171875)
                {
                    float _2786 = (-0.0040000001899898052215576171875) - _2676;
                    float _2788 = fma(_2576, _2576, _2559 * _2559);
                    float _2789 = _2612 * _2559;
                    float _2791 = sqrt(fma(_2789, _2786, _2788));
                    float _2792 = fma(_2576, _2786, _2559);
                    float _2795 = -(_29._m0 * _29._m0);
                    float _2797 = sqrt(fma(_29._m1, _29._m1, _2795));
                    float _2799 = sqrt(fma(_2576, _2576, _2795));
                    float _2800 = _2576 * _2786;
                    float _2802 = -(_2576 * _2576);
                    float _2804 = fma(_29._m0, _29._m0, fma(_2800, _2800, _2802));
                    vec4 _2810 = vec4(-1.0, _2797 * _2797, _2797, 0.50390625);
                    vec4 _2811 = mix(_2810, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2800 < 0.0) && (_2804 > 0.0)));
                    float _2813 = fma(_2799 / _2797, 0.96875, 0.015625);
                    float _2823 = fma(fma(_2800, _2811.x, sqrt(_2804 + _2811.y)) / (_2799 + _2811.z), 0.4921875, _2811.w);
                    float _2829 = _2566 + 1.0;
                    float _2831 = floor(_2829 * 3.5);
                    float _2833 = fma(_2829, 3.5, -_2831);
                    float _2834 = _2831 + fma(fma(atan(spvNMax(_2568, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2835 = _2834 * 0.125;
                    float _2839 = 1.0 - _2833;
                    float _2842 = (_2834 + 1.0) * 0.125;
                    float _2849 = sqrt(fma(_2791, _2791, _2795));
                    float _2853 = fma(_29._m0, _29._m0, fma(_2792, _2792, -(_2791 * _2791)));
                    vec4 _2858 = mix(_2810, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2792 < 0.0) && (_2853 > 0.0)));
                    float _2860 = fma(_2849 / _2797, 0.96875, 0.015625);
                    float _2870 = fma(fma(_2792, _2858.x, sqrt(_2853 + _2858.y)) / (_2849 + _2858.z), 0.4921875, _2858.w);
                    float _2876 = _2831 + fma(fma(atan(spvNMax(_2580, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2877 = _2876 * 0.125;
                    float _2883 = (_2876 + 1.0) * 0.125;
                    vec4 _2889 = _2672.xyzx;
                    float _2893 = 0.0040000001899898052215576171875 - _2676;
                    float _2895 = sqrt(fma(_2789, _2893, _2788));
                    float _2896 = fma(_2576, _2893, _2559);
                    float _2897 = _2576 * _2893;
                    float _2899 = fma(_29._m0, _29._m0, fma(_2897, _2897, _2802));
                    vec4 _2904 = mix(_2810, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2897 < 0.0) && (_2899 > 0.0)));
                    float _2914 = fma(fma(_2897, _2904.x, sqrt(_2899 + _2904.y)) / (_2799 + _2904.z), 0.4921875, _2904.w);
                    float _2925 = sqrt(fma(_2895, _2895, _2795));
                    float _2929 = fma(_29._m0, _29._m0, fma(_2896, _2896, -(_2895 * _2895)));
                    vec4 _2934 = mix(_2810, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2896 < 0.0) && (_2929 > 0.0)));
                    float _2936 = fma(_2925 / _2797, 0.96875, 0.015625);
                    float _2946 = fma(fma(_2896, _2934.x, sqrt(_2929 + _2934.y)) / (_2925 + _2934.z), 0.4921875, _2934.w);
                    _2961 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2877, _2870, _2860), 0.0) * _2839) + (textureLod(sampler3D(_31, _7), vec3(_2883, _2870, _2860), 0.0) * _2833)), _2889, (textureLod(sampler3D(_31, _7), vec3(_2835, _2823, _2813), 0.0) * _2839) + (textureLod(sampler3D(_31, _7), vec3(_2842, _2823, _2813), 0.0) * _2833)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2877, _2946, _2936), 0.0) * _2839) + (textureLod(sampler3D(_31, _7), vec3(_2883, _2946, _2936), 0.0) * _2833)), _2889, (textureLod(sampler3D(_31, _7), vec3(_2835, _2914, _2813), 0.0) * _2839) + (textureLod(sampler3D(_31, _7), vec3(_2842, _2914, _2813), 0.0) * _2833)), vec4(0.0)), vec4((_2678 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _2686 = -(_29._m0 * _29._m0);
                    float _2688 = sqrt(fma(_29._m1, _29._m1, _2686));
                    float _2690 = sqrt(fma(_2576, _2576, _2686));
                    float _2691 = _2576 * _2560;
                    float _2695 = fma(_29._m0, _29._m0, fma(_2691, _2691, -(_2576 * _2576)));
                    vec4 _2701 = vec4(-1.0, _2688 * _2688, _2688, 0.50390625);
                    vec4 _2702 = mix(_2701, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2691 < 0.0) && (_2695 > 0.0)));
                    float _2704 = fma(_2690 / _2688, 0.96875, 0.015625);
                    float _2714 = fma(fma(_2691, _2702.x, sqrt(_2695 + _2702.y)) / (_2690 + _2702.z), 0.4921875, _2702.w);
                    float _2720 = _2566 + 1.0;
                    float _2722 = floor(_2720 * 3.5);
                    float _2724 = fma(_2720, 3.5, -_2722);
                    float _2725 = _2722 + fma(fma(atan(spvNMax(_2568, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2730 = 1.0 - _2724;
                    float _2740 = sqrt(fma(_2577, _2577, _2686));
                    float _2744 = fma(_29._m0, _29._m0, fma(_2578, _2578, -(_2577 * _2577)));
                    vec4 _2749 = mix(_2701, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2578 < 0.0) && (_2744 > 0.0)));
                    float _2751 = fma(_2740 / _2688, 0.96875, 0.015625);
                    float _2761 = fma(fma(_2578, _2749.x, sqrt(_2744 + _2749.y)) / (_2740 + _2749.z), 0.4921875, _2749.w);
                    float _2767 = _2722 + fma(fma(atan(spvNMax(_2580, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _2961 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2767 * 0.125, _2761, _2751), 0.0) * _2730) + (textureLod(sampler3D(_31, _7), vec3((_2767 + 1.0) * 0.125, _2761, _2751), 0.0) * _2724)), _2672.xyzx, (textureLod(sampler3D(_31, _7), vec3(_2725 * 0.125, _2714, _2704), 0.0) * _2730) + (textureLod(sampler3D(_31, _7), vec3((_2725 + 1.0) * 0.125, _2714, _2704), 0.0) * _2724)), vec4(0.0));
                }
                float _2976 = fma(_2566, _2566, 1.0);
                _2998 = _2672;
                _2999 = (_2961.xyz * (0.0596831031143665313720703125 * _2976)) + ((((_2961.xyz * (_2961.w * smoothstep(0.0, 0.0199999995529651641845703125, _2568))) / vec3(spvNMax(_2961.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _2566, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _2976) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _2998 = vec3(1.0);
                _2999 = vec3(0.0);
            }
            _3005 = _2500 * _2998;
            _3006 = fma(_2498, _2998, _2999 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _3005 = _2500;
            _3006 = _2498;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_38, _7, _396, _rdx_dir, _436, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _3006 = vec3(_rdx_vis);
            _3005 = vec3(0.0);
        }
        imageStore(_42, ivec2(_379), vec4(_3006, 1.0));
        imageStore(_43, ivec2(_379), vec4(_3005, 1.0));
        break;
    } while(false);
}

