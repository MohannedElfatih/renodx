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

float _294;
const vec4 _306[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _333;
vec3 _338;
vec3 _339;

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
        uint _374 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _376 = _42._m0[_374];
        uvec2 _381 = (uvec2(_376 & 65535u, _376 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_381, _28._m3)) || any(greaterThan(_381, _28._m4)))
        {
            break;
        }
        vec2 _393 = vec2(_381);
        vec2 _398 = (_393 + vec2(0.5)) / vec2(_34._m1);
        vec2 _405 = ((_398 - _28._m1) / _28._m0) * 0.5;
        float _409 = _405.x;
        float _411 = _405.y;
        ivec2 _429 = ivec3(int(_381.x), int(_381.y), 0).xy;
        vec4 _435 = texelFetch(_37, _429, 0);
        vec4 _437 = texelFetch(_38, _429, 0);
        vec4 _439 = texelFetch(_39, _429, 0);
        float _440 = _439.x;
        vec3 _458;
        do
        {
            vec3 _446 = fma(vec3(texelFetch(_35, _429, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _447 = dot(_446, _446);
            if (_447 > 54000001024.0)
            {
                _458 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _452 = 2.0 / _447;
                vec2 _454 = _446.xy * _452;
                vec3 _455 = vec3(_454.x, _454.y, _338.z);
                _455.z = 1.0 - _452;
                _458 = _455;
                break;
            }
            break; // unreachable workaround
        } while(false);
        vec3 _459 = texelFetch(_36, _429, 0).xyz;
        uint _466 = (uint(roundEven(_435.w * 255.0)) & 112u) >> 4u;
        vec3 _476 = _458 * mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        float _477 = spvNMax(0.0900000035762786865234375, _435.x);
        vec4 _481 = vec4(_437.xyz, 0.0);
        vec3 _482 = (((_26._m7[0].xyz * ((1.0 - _409) - _411)) + (_26._m7[1].xyz * _409)) + (_26._m7[2].xyz * _411)) * _440;
        vec3 _484 = normalize(-_482);
        uint _486 = gl_SubgroupInvocationID & 3u;
        float _491 = ((_486 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _492 = (subgroupQuadSwapHorizontal(_458) - _458) * _491;
        float _497 = ((_486 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _498 = (subgroupQuadSwapVertical(_458) - _458) * _497;
        vec3 _502 = mix(_492, vec3(0.0), bvec3(any(isnan(_492))));
        vec3 _506 = mix(_498, vec3(0.0), bvec3(any(isnan(_498))));
        float _513 = sqrt(clamp(fma(_477, _477, spvNMin(dot(_502, _502) + dot(_506, _506), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _522 = ivec2(uvec2(_393) / uvec2(_19._m25));
        float _548 = _393.x;
        float _549 = _393.y;
        float _554 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _548, 0.005837149918079376220703125 * _549)));
        float _561 = clamp(fma(_19._m34.y, length(_482), _19._m34.x), 0.0, 1.0);
        uint _562 = uint(int(fma(fma(float(int(clamp(fma(log2(_440 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_522.y)), _19._m23, float(_522.x))));
        uvec4 _565 = uvec4(_8._m0[_562]);
        uint _566 = _565.x;
        uint _567 = _565.y;
        uint _570 = ((_567 >> 0u) & 4095u) + _566;
        uint _573 = ((_567 >> 12u) & 4095u) + _570;
        uint _577 = ((_565.z >> 0u) & 1023u) + _573;
        float _578 = dot(_476, _484);
        float _579 = spvNMax(_578, 9.9999997473787516355514526367188e-06);
        float _581;
        bool _584;
        vec3 _586;
        vec3 _588;
        uint _590;
        _581 = _294;
        _584 = false;
        _586 = vec3(0.0);
        _588 = vec3(0.0);
        _590 = _566;
        float _582;
        bool _585;
        vec3 _587;
        vec3 _589;
        for (; _590 < _570; _581 = _582, _584 = _585, _586 = _587, _588 = _589, _590++)
        {
            uint _597 = uint(_9._m0[_590]);
            float _615 = abs(_10._m0[_597]._m5);
            if ((_10._m0[_597]._m6 & (1u << (_466 & 31u))) != 0u)
            {
                vec3 _630 = _10._m0[_597]._m0.xyz - _482;
                float _631 = dot(_630, _630);
                vec3 _634 = _630 * inversesqrt(spvNMax(_631, 1.0000000133514319600180897396058e-10));
                float _635 = _10._m0[_597]._m0.w * _10._m0[_597]._m0.w;
                float _915;
                bool _916;
                vec3 _917;
                vec3 _918;
                if (_631 < (1.0 / _635))
                {
                    vec3 _640 = _484 + _634;
                    vec3 _644 = _640 * inversesqrt(spvNMax(dot(_640, _640), 1.0000000133514319600180897396058e-10));
                    float _646 = clamp(dot(_634, _644), 0.0, 1.0);
                    float _648 = clamp(dot(_476, _644), 0.0, 1.0);
                    float _650 = clamp(dot(_476, _634), 0.0, 1.0);
                    float _651 = _631 * _635;
                    float _657 = pow(spvNMax(abs(clamp(fma(-_651, _651, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_597]._m4);
                    float _667;
                    if (_10._m0[_597]._m5 < 0.0)
                    {
                        _667 = _657 * fma(4.0, _635, _615);
                    }
                    else
                    {
                        _667 = _657 * ((1.0 / spvNMax(_631, 9.9999997473787516355514526367188e-05)) + _615);
                    }
                    float _669 = 0.079577468335628509521484375 * (_650 * _667);
                    float _804;
                    bool _805;
                    float _806;
                    if ((_10._m0[_597]._m7 & 1u) != 0u)
                    {
                        uint _694;
                        do
                        {
                            vec3 _674 = -_634;
                            float _675 = dot(_674, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                            float _676 = dot(_674, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                            float _677 = dot(_674, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                            float _681 = spvNMax(spvNMax(_675, _676), spvNMax(_677, dot(_674, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                            if (_681 == _675)
                            {
                                _694 = 0u;
                                break;
                            }
                            else
                            {
                                if (_681 == _676)
                                {
                                    _694 = 1u;
                                    break;
                                }
                                else
                                {
                                    if (_681 == _677)
                                    {
                                        _694 = 2u;
                                        break;
                                    }
                                    else
                                    {
                                        _694 = 3u;
                                        break;
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            }
                            break; // unreachable workaround
                        } while(false);
                        uint _696 = uint(int(_10._m0[_597]._m7 >> 2u)) + _694;
                        float _798;
                        bool _799;
                        float _800;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_650 <= 0.0) && true)
                            {
                                _798 = _581;
                                _799 = _584;
                                _800 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _729 = _20._m0[_696]._m0 * vec4(_482 + (_476 * ((3.5 * float(int(sign(_650)))) * (_20._m0[_696]._m4 * sqrt(_631)))), 1.0);
                                vec3 _733 = _729.xyz / vec3(_729.w);
                                vec2 _736 = (_733.xy * 0.5) + vec2(0.5);
                                _736.y = 1.0 - _736.y;
                                float _745 = (_20._m0[_696]._m5.y / _20._m0[_696]._m6) / (_733.z - _20._m0[_696]._m5.x);
                                float _750 = _584 ? _581 : 6.283185482025146484375;
                                float _751 = _554 * _750;
                                vec2 _752 = _20._m0[_696]._m1 + _19._m33;
                                vec2 _755 = (_20._m0[_696]._m1 + vec2(_20._m0[_696]._m2)) - _19._m33;
                                float _757;
                                _757 = 0.0;
                                for (int _760 = 0; _760 < 12; )
                                {
                                    float _765 = float(uint(_760));
                                    float _768 = sqrt(_765 + 0.5) * 0.288675129413604736328125;
                                    float _769 = fma(_765, 2.3999631404876708984375, _751);
                                    vec2 _777 = clamp(fma((vec3(cos(_769), sin(_769), _768).xy * _768) * 2.5, _19._m33, _736), _752, _755);
                                    vec2 _780 = fract(fma(vec2(1.0) / _19._m33, _777, vec2(0.5)));
                                    vec4 _786 = vec4(lessThan(vec4(_745), textureGather(sampler2D(_21, _12), _777)));
                                    float _789 = _780.x;
                                    _757 += clamp(mix(mix(_786.w, _786.z, _789), mix(_786.x, _786.y, _789), _780.y), 0.0, 1.0);
                                    _760++;
                                    continue;
                                }
                                _798 = _750;
                                _799 = _584 ? _584 : true;
                                _800 = _757 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _804 = _798;
                        _805 = _799;
                        _806 = _669 * mix(1.0, _800, spvNMin(_561, _10._m0[_597]._m8));
                    }
                    else
                    {
                        _804 = _581;
                        _805 = _584;
                        _806 = _669;
                    }
                    vec3 _913;
                    vec3 _914;
                    SPIRV_CROSS_BRANCH
                    if (_10._m0[_597]._m3 < 0.0)
                    {
                        vec3 _911;
                        vec3 _912;
                        if (_650 > 0.0)
                        {
                            vec3 _865 = _10._m0[_597]._m1.xyz * (_806 * _6._m0[0u]);
                            vec3 _872 = vec3(fma((2.0 * _646) * _646, _513, mix(0.0, 0.5, _513))) - vec3(1.0);
                            float _902 = clamp(_579, 0.0, 1.0);
                            _911 = fma(_865, _481.xyz * ((((2.0 + (1.0 / _513)) * pow(spvNMax(abs(fma(-_648, _648, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _513)) * 0.15915493667125701904296875) * (0.25 / fma(-_650, _902, _650 + _902))), _586);
                            _912 = fma(_865, _459 * (0.3183098733425140380859375 * (((vec3(1.0) + (_872 * pow(spvNMax(abs(1.0 - _650), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_872 * pow(spvNMax(abs(1.0 - _579), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _513))), _588);
                        }
                        else
                        {
                            _911 = _586;
                            _912 = _588;
                        }
                        _913 = _911;
                        _914 = _912;
                    }
                    else
                    {
                        vec3 _859;
                        vec3 _860;
                        if (_650 > 0.0)
                        {
                            vec3 _813 = _10._m0[_597]._m1.xyz * _806;
                            vec3 _820 = vec3(fma((2.0 * _646) * _646, _513, mix(0.0, 0.5, _513))) - vec3(1.0);
                            float _850 = clamp(_579, 0.0, 1.0);
                            _859 = fma(_813, _481.xyz * ((((2.0 + (1.0 / _513)) * pow(spvNMax(abs(fma(-_648, _648, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _513)) * 0.15915493667125701904296875) * (0.25 / fma(-_650, _850, _650 + _850))), _586);
                            _860 = fma(_813, _459 * (0.3183098733425140380859375 * (((vec3(1.0) + (_820 * pow(spvNMax(abs(1.0 - _650), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_820 * pow(spvNMax(abs(1.0 - _579), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _513))), _588);
                        }
                        else
                        {
                            _859 = _586;
                            _860 = _588;
                        }
                        _913 = _859;
                        _914 = _860;
                    }
                    _915 = _804;
                    _916 = _805;
                    _917 = _913;
                    _918 = _914;
                }
                else
                {
                    _915 = _581;
                    _916 = _584;
                    _917 = _586;
                    _918 = _588;
                }
                _582 = _915;
                _585 = _916;
                _587 = _917;
                _589 = _918;
            }
            else
            {
                _582 = _581;
                _585 = _584;
                _587 = _586;
                _589 = _588;
            }
        }
        float _920;
        bool _923;
        vec3 _925;
        vec3 _927;
        uint _929;
        _920 = _581;
        _923 = _584;
        _925 = _586;
        _927 = _588;
        _929 = _590;
        float _921;
        bool _924;
        vec3 _926;
        vec3 _928;
        for (; _929 < _573; _920 = _921, _923 = _924, _925 = _926, _927 = _928, _929++)
        {
            uint _936 = uint(_9._m0[_929]);
            float _949 = abs(_10._m0[_936]._m5);
            if ((_10._m0[_936]._m6 & (1u << (_466 & 31u))) != 0u)
            {
                vec3 _967 = _10._m0[_936]._m0.xyz - _482;
                float _968 = dot(_967, _967);
                vec3 _971 = _967 * inversesqrt(spvNMax(_968, 1.0000000133514319600180897396058e-10));
                float _972 = _10._m0[_936]._m0.w * _10._m0[_936]._m0.w;
                float _1242;
                bool _1243;
                vec3 _1244;
                vec3 _1245;
                if (_968 < (1.0 / _972))
                {
                    vec3 _977 = _484 + _971;
                    vec3 _981 = _977 * inversesqrt(spvNMax(dot(_977, _977), 1.0000000133514319600180897396058e-10));
                    float _983 = clamp(dot(_971, _981), 0.0, 1.0);
                    float _985 = clamp(dot(_476, _981), 0.0, 1.0);
                    float _987 = clamp(dot(_476, _971), 0.0, 1.0);
                    float _990 = dot(-_971, normalize(_10._m0[_936]._m2.xyz));
                    float _1019;
                    if (_990 > _10._m0[_936]._m1.w)
                    {
                        float _994 = _968 * _972;
                        float _1000 = pow(spvNMax(abs(clamp(fma(-_994, _994, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_936]._m4);
                        float _1010;
                        if (_10._m0[_936]._m5 < 0.0)
                        {
                            _1010 = _1000 * fma(4.0, _972, _949);
                        }
                        else
                        {
                            _1010 = _1000 * ((1.0 / spvNMax(_968, 9.9999997473787516355514526367188e-05)) + _949);
                        }
                        float _1015 = clamp((_990 - _10._m0[_936]._m1.w) / spvNMax(_10._m0[_936]._m2.w - _10._m0[_936]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1019 = _987 * (_1010 * (_1015 * _1015));
                    }
                    else
                    {
                        _1019 = 0.0;
                    }
                    float _1020 = 0.3183098733425140380859375 * _1019;
                    float _1131;
                    bool _1132;
                    float _1133;
                    if ((_10._m0[_936]._m7 & 1u) != 0u)
                    {
                        uint _1023 = uint(int(_10._m0[_936]._m7 >> 2u));
                        float _1125;
                        bool _1126;
                        float _1127;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_987 <= 0.0) && true)
                            {
                                _1125 = _920;
                                _1126 = _923;
                                _1127 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1056 = _20._m0[_1023]._m0 * vec4(_482 + (_476 * ((3.5 * float(int(sign(_987)))) * (_20._m0[_1023]._m4 * sqrt(_968)))), 1.0);
                                vec3 _1060 = _1056.xyz / vec3(_1056.w);
                                vec2 _1063 = (_1060.xy * 0.5) + vec2(0.5);
                                _1063.y = 1.0 - _1063.y;
                                float _1072 = (_20._m0[_1023]._m5.y / _20._m0[_1023]._m6) / (_1060.z - _20._m0[_1023]._m5.x);
                                float _1077 = _923 ? _920 : 6.283185482025146484375;
                                float _1078 = _554 * _1077;
                                vec2 _1079 = _20._m0[_1023]._m1 + _19._m33;
                                vec2 _1082 = (_20._m0[_1023]._m1 + vec2(_20._m0[_1023]._m2)) - _19._m33;
                                float _1084;
                                _1084 = 0.0;
                                for (int _1087 = 0; _1087 < 12; )
                                {
                                    float _1092 = float(uint(_1087));
                                    float _1095 = sqrt(_1092 + 0.5) * 0.288675129413604736328125;
                                    float _1096 = fma(_1092, 2.3999631404876708984375, _1078);
                                    vec2 _1104 = clamp(fma((vec3(cos(_1096), sin(_1096), _1095).xy * _1095) * 2.5, _19._m33, _1063), _1079, _1082);
                                    vec2 _1107 = fract(fma(vec2(1.0) / _19._m33, _1104, vec2(0.5)));
                                    vec4 _1113 = vec4(lessThan(vec4(_1072), textureGather(sampler2D(_21, _12), _1104)));
                                    float _1116 = _1107.x;
                                    _1084 += clamp(mix(mix(_1113.w, _1113.z, _1116), mix(_1113.x, _1113.y, _1116), _1107.y), 0.0, 1.0);
                                    _1087++;
                                    continue;
                                }
                                _1125 = _1077;
                                _1126 = _923 ? _923 : true;
                                _1127 = _1084 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _1131 = _1125;
                        _1132 = _1126;
                        _1133 = _1020 * mix(1.0, _1127, spvNMin(_561, _10._m0[_936]._m8));
                    }
                    else
                    {
                        _1131 = _920;
                        _1132 = _923;
                        _1133 = _1020;
                    }
                    vec3 _1240;
                    vec3 _1241;
                    SPIRV_CROSS_BRANCH
                    if (_10._m0[_936]._m3 < 0.0)
                    {
                        vec3 _1238;
                        vec3 _1239;
                        if (_987 > 0.0)
                        {
                            vec3 _1192 = _10._m0[_936]._m1.xyz * (_1133 * _6._m0[0u]);
                            vec3 _1199 = vec3(fma((2.0 * _983) * _983, _513, mix(0.0, 0.5, _513))) - vec3(1.0);
                            float _1229 = clamp(_579, 0.0, 1.0);
                            _1238 = fma(_1192, _481.xyz * ((((2.0 + (1.0 / _513)) * pow(spvNMax(abs(fma(-_985, _985, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _513)) * 0.15915493667125701904296875) * (0.25 / fma(-_987, _1229, _987 + _1229))), _925);
                            _1239 = fma(_1192, _459 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1199 * pow(spvNMax(abs(1.0 - _987), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1199 * pow(spvNMax(abs(1.0 - _579), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _513))), _927);
                        }
                        else
                        {
                            _1238 = _925;
                            _1239 = _927;
                        }
                        _1240 = _1238;
                        _1241 = _1239;
                    }
                    else
                    {
                        vec3 _1186;
                        vec3 _1187;
                        if (_987 > 0.0)
                        {
                            vec3 _1140 = _10._m0[_936]._m1.xyz * _1133;
                            vec3 _1147 = vec3(fma((2.0 * _983) * _983, _513, mix(0.0, 0.5, _513))) - vec3(1.0);
                            float _1177 = clamp(_579, 0.0, 1.0);
                            _1186 = fma(_1140, _481.xyz * ((((2.0 + (1.0 / _513)) * pow(spvNMax(abs(fma(-_985, _985, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _513)) * 0.15915493667125701904296875) * (0.25 / fma(-_987, _1177, _987 + _1177))), _925);
                            _1187 = fma(_1140, _459 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1147 * pow(spvNMax(abs(1.0 - _987), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1147 * pow(spvNMax(abs(1.0 - _579), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _513))), _927);
                        }
                        else
                        {
                            _1186 = _925;
                            _1187 = _927;
                        }
                        _1240 = _1186;
                        _1241 = _1187;
                    }
                    _1242 = _1131;
                    _1243 = _1132;
                    _1244 = _1240;
                    _1245 = _1241;
                }
                else
                {
                    _1242 = _920;
                    _1243 = _923;
                    _1244 = _925;
                    _1245 = _927;
                }
                _921 = _1242;
                _924 = _1243;
                _926 = _1244;
                _928 = _1245;
            }
            else
            {
                _921 = _920;
                _924 = _923;
                _926 = _925;
                _928 = _927;
            }
        }
        vec3 _1252;
        vec3 _1254;
        _1252 = _925;
        _1254 = _927;
        float _1248;
        bool _1251;
        vec3 _1253;
        vec3 _1255;
        float _1247 = _920;
        bool _1250 = _923;
        uint _1256 = _929;
        for (; _1256 < _577; _1247 = _1248, _1250 = _1251, _1252 = _1253, _1254 = _1255, _1256++)
        {
            uint _1263 = uint(_9._m0[_1256]);
            int _1292 = int(_11._m0[_1263]._m1 >> 1u) - 1;
            if (((_11._m0[_1263]._m4 & 16777215u) & (1u << (_466 & 31u))) != 0u)
            {
                vec3 _1303 = _11._m0[_1263]._m6 * vec4(_482, 1.0);
                float _1657;
                bool _1658;
                vec3 _1659;
                vec3 _1660;
                if (all(lessThan(abs(_1303 - vec3(0.5)), vec3(0.5))))
                {
                    vec3 _1310 = _484 + _11._m0[_1263]._m9;
                    vec3 _1314 = _1310 * inversesqrt(spvNMax(dot(_1310, _1310), 1.0000000133514319600180897396058e-10));
                    float _1316 = clamp(dot(_11._m0[_1263]._m9, _1314), 0.0, 1.0);
                    float _1318 = clamp(dot(_476, _1314), 0.0, 1.0);
                    float _1320 = clamp(dot(_476, _11._m0[_1263]._m9), 0.0, 1.0);
                    int _1321 = int(_11._m0[_1263]._m4 >> 24u);
                    float _1322 = _1303.z;
                    vec3 _1361;
                    if (_1322 < _11._m0[_1263]._m2.x)
                    {
                        float _1349 = _1322 * _11._m0[_1263]._m2.z;
                        float _1352 = _1349 * _1349;
                        vec3 _1360;
                        _1360.z = dot(_306[_1321], vec4(_1349, _1352, smoothstep(0.0, 1.0, _1349), (_1352 * _1349) * fma(_1349, fma(_1349, 6.0, -15.0), 10.0)));
                        _1361 = _1360;
                    }
                    else
                    {
                        vec3 _1347;
                        if (_1322 > _11._m0[_1263]._m2.y)
                        {
                            float _1335 = (1.0 - _1322) * _11._m0[_1263]._m2.w;
                            float _1338 = _1335 * _1335;
                            vec3 _1346;
                            _1346.z = dot(_306[_1321], vec4(_1335, _1338, smoothstep(0.0, 1.0, _1335), (_1338 * _1335) * fma(_1335, fma(_1335, 6.0, -15.0), 10.0)));
                            _1347 = _1346;
                        }
                        else
                        {
                            _1347 = vec3(0.0, 0.0, 1.0);
                        }
                        _1361 = _1347;
                    }
                    vec2 _1362 = _1303.xy;
                    vec2 _1366 = (vec2(0.5) - abs(_1362 - vec2(0.5))) * _11._m0[_1263]._m3;
                    float _1367 = _1366.x;
                    vec3 _1384;
                    if (_1367 < 1.0)
                    {
                        float _1375 = _1367 * _1367;
                        vec3 _1383 = _1361;
                        _1383.x = dot(_306[_1321], vec4(_1367, _1375, smoothstep(0.0, 1.0, _1367), (_1375 * _1367) * fma(_1367, fma(_1367, 6.0, -15.0), 10.0)));
                        _1384 = _1383;
                    }
                    else
                    {
                        vec3 _1372 = _1361;
                        _1372.x = 1.0;
                        _1384 = _1372;
                    }
                    float _1385 = _1366.y;
                    vec3 _1402;
                    if (_1385 < 1.0)
                    {
                        float _1393 = _1385 * _1385;
                        vec3 _1401 = _1384;
                        _1401.y = dot(_306[_1321], vec4(_1385, _1393, smoothstep(0.0, 1.0, _1385), (_1393 * _1385) * fma(_1385, fma(_1385, 6.0, -15.0), 10.0)));
                        _1402 = _1401;
                    }
                    else
                    {
                        vec3 _1390 = _1384;
                        _1390.y = 1.0;
                        _1402 = _1390;
                    }
                    float _1408 = _1320 * ((_1402.x * _1402.y) * _1402.z);
                    float _1513;
                    bool _1514;
                    float _1515;
                    if ((_11._m0[_1263]._m8 & 1u) != 0u)
                    {
                        uint _1411 = uint(int(_11._m0[_1263]._m8 >> 2u));
                        float _1507;
                        bool _1508;
                        float _1509;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1320 <= 0.0) && true)
                            {
                                _1507 = _1247;
                                _1508 = _1250;
                                _1509 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1442 = _20._m0[_1411]._m0 * vec4(_482 + (_476 * ((3.5 * float(int(sign(_1320)))) * _20._m0[_1411]._m4)), 1.0);
                                vec2 _1445 = (_1442.xy * 0.5) + vec2(0.5);
                                _1445.y = 1.0 - _1445.y;
                                float _1454 = ((_1442.z - _20._m0[_1411]._m5.y) / _20._m0[_1411]._m5.x) / _20._m0[_1411]._m6;
                                float _1459 = _1250 ? _1247 : 6.283185482025146484375;
                                float _1460 = _554 * _1459;
                                vec2 _1461 = _20._m0[_1411]._m1 + _19._m33;
                                vec2 _1464 = (_20._m0[_1411]._m1 + vec2(_20._m0[_1411]._m2)) - _19._m33;
                                float _1466;
                                _1466 = 0.0;
                                for (int _1469 = 0; _1469 < 12; )
                                {
                                    float _1474 = float(uint(_1469));
                                    float _1477 = sqrt(_1474 + 0.5) * 0.288675129413604736328125;
                                    float _1478 = fma(_1474, 2.3999631404876708984375, _1460);
                                    vec2 _1486 = clamp(fma((vec3(cos(_1478), sin(_1478), _1477).xy * _1477) * 2.5, _19._m33, _1445), _1461, _1464);
                                    vec2 _1489 = fract(fma(vec2(1.0) / _19._m33, _1486, vec2(0.5)));
                                    vec4 _1495 = vec4(lessThan(vec4(_1454), textureGather(sampler2D(_21, _12), _1486)));
                                    float _1498 = _1489.x;
                                    _1466 += clamp(mix(mix(_1495.w, _1495.z, _1498), mix(_1495.x, _1495.y, _1498), _1489.y), 0.0, 1.0);
                                    _1469++;
                                    continue;
                                }
                                _1507 = _1459;
                                _1508 = _1250 ? _1250 : true;
                                _1509 = _1466 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _1513 = _1507;
                        _1514 = _1508;
                        _1515 = _1408 * mix(1.0, _1509, spvNMin(_561, _11._m0[_1263]._m5));
                    }
                    else
                    {
                        _1513 = _1247;
                        _1514 = _1250;
                        _1515 = _1408;
                    }
                    vec3 _1548;
                    if (_1292 >= 0)
                    {
                        vec2 _1521 = (subgroupQuadSwapHorizontal(_1362) - _1362) * _491;
                        vec2 _1524 = (subgroupQuadSwapVertical(_1362) - _1362) * _497;
                        vec2 _1528 = mix(_1521, vec2(0.0), bvec2(any(isnan(_1521))));
                        vec2 _1532 = mix(_1524, vec2(0.0), bvec2(any(isnan(_1524))));
                        bvec2 _1541 = bvec2(any(greaterThan(abs(vec4(_1528, _1532)), vec4(0.015625))));
                        int _74 = _1292;
                        _1548 = _11._m0[_1263]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_74], _7)), _1362, mix(_1528, vec2(0.0), _1541), mix(_1532, vec2(0.0), _1541)).xyz;
                    }
                    else
                    {
                        _1548 = _11._m0[_1263]._m0;
                    }
                    vec3 _1655;
                    vec3 _1656;
                    SPIRV_CROSS_BRANCH
                    if ((_11._m0[_1263]._m1 & 1u) != 0u)
                    {
                        vec3 _1653;
                        vec3 _1654;
                        if (_1320 > 0.0)
                        {
                            vec3 _1607 = _1548 * (_1515 * _6._m0[0u]);
                            vec3 _1614 = vec3(fma((2.0 * _1316) * _1316, _513, mix(0.0, 0.5, _513))) - vec3(1.0);
                            float _1644 = clamp(_579, 0.0, 1.0);
                            _1653 = fma(_1607, _481.xyz * ((((2.0 + (1.0 / _513)) * pow(spvNMax(abs(fma(-_1318, _1318, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _513)) * 0.15915493667125701904296875) * (0.25 / fma(-_1320, _1644, _1320 + _1644))), _1252);
                            _1654 = fma(_1607, _459 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1614 * pow(spvNMax(abs(1.0 - _1320), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1614 * pow(spvNMax(abs(1.0 - _579), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _513))), _1254);
                        }
                        else
                        {
                            _1653 = _1252;
                            _1654 = _1254;
                        }
                        _1655 = _1653;
                        _1656 = _1654;
                    }
                    else
                    {
                        vec3 _1601;
                        vec3 _1602;
                        if (_1320 > 0.0)
                        {
                            vec3 _1555 = _1548 * _1515;
                            vec3 _1562 = vec3(fma((2.0 * _1316) * _1316, _513, mix(0.0, 0.5, _513))) - vec3(1.0);
                            float _1592 = clamp(_579, 0.0, 1.0);
                            _1601 = fma(_1555, _481.xyz * ((((2.0 + (1.0 / _513)) * pow(spvNMax(abs(fma(-_1318, _1318, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _513)) * 0.15915493667125701904296875) * (0.25 / fma(-_1320, _1592, _1320 + _1592))), _1252);
                            _1602 = fma(_1555, _459 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1562 * pow(spvNMax(abs(1.0 - _1320), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1562 * pow(spvNMax(abs(1.0 - _579), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _513))), _1254);
                        }
                        else
                        {
                            _1601 = _1252;
                            _1602 = _1254;
                        }
                        _1655 = _1601;
                        _1656 = _1602;
                    }
                    _1657 = _1513;
                    _1658 = _1514;
                    _1659 = _1655;
                    _1660 = _1656;
                }
                else
                {
                    _1657 = _1247;
                    _1658 = _1250;
                    _1659 = _1252;
                    _1660 = _1254;
                }
                _1248 = _1657;
                _1251 = _1658;
                _1253 = _1659;
                _1255 = _1660;
            }
            else
            {
                _1248 = _1247;
                _1251 = _1250;
                _1253 = _1252;
                _1255 = _1254;
            }
        }
        vec3 _1662 = reflect(-_484, _476);
        vec3 _1664 = vec3(_437.x, _437.y, _437.z);
        vec3 _1674 = textureLod(samplerCube(_14, _7), _476, 0.0).xyz * _19._m27;
        vec3 _1681 = textureLod(samplerCube(_15, _7), _1662, fma(_513, 8.0, _19._m30 - 8.0)).xyz * _19._m27;
        vec3 _1706;
        vec3 _1707;
        SPIRV_CROSS_BRANCH
        if (_19._m29 > 0.0)
        {
            vec3 _1696 = vec3(_19._m29);
            _1706 = mix(_1681, textureLod(samplerCube(_17, _7), _1662, fma(_513, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _1696);
            _1707 = mix(_1674, textureLod(samplerCube(_16, _7), _476, 0.0).xyz * _19._m28, _1696);
        }
        else
        {
            _1706 = _1681;
            _1707 = _1674;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.5) {
            float _rdx_cubeMod = rdx_cubemap_modulation(_1707, _513);
            _1706 *= _rdx_cubeMod;
            _1707 *= _rdx_cubeMod;
        }
        float _1708 = spvNMax(dot(_484, _476), 0.001953125);
        vec4 _1713 = textureLod(sampler2D(_18, _12), vec2(_1708, _513), 0.0);
        uvec4 _1724 = uvec4(_8._m0[_562]);
        uint _1726 = _1724.y;
        uint _1736 = ((_1724.z >> 0u) & 1023u) + (((_1726 >> 12u) & 4095u) + (((_1726 >> 0u) & 4095u) + _1724.x));
        uint _1738 = (_1726 >> 24u) + _1736;
        vec3 _1740;
        vec3 _1743;
        _1740 = _1706 * ((_1664 * _1713.x) + vec3(_1713.y));
        _1743 = _1707 * (_459 * _1713.z);
        vec3 _1741;
        vec3 _1744;
        for (uint _1745 = _1736; _1745 < _1738; _1740 = _1741, _1743 = _1744, _1745++)
        {
            uint _1752 = uint(_9._m0[_1745]);
            int _1771 = int((_13._m0[_1752]._m5 >> 1u) & 3u);
            mat3 _1775 = mat3(_13._m0[_1752]._m1[0], _13._m0[_1752]._m1[1], _13._m0[_1752]._m1[2]);
            int _1781 = (int((_13._m0[_1752]._m5 >> 3u) & 16383u) - 1) * 2;
            int _1786 = (int((_13._m0[_1752]._m5 >> 17u) & 16383u) - 1) * 2;
            int _1791 = (int((_13._m0[_1752]._m6 >> 0u) & 65535u) - 1) * 2;
            int _1796 = (int((_13._m0[_1752]._m6 >> 16u) & 65535u) - 1) * 2;
            float _1799 = (_13._m0[_1752]._m3 < 0.0) ? (-_13._m0[_1752]._m3) : 1.0;
            vec3 _1801 = _1775 * (_482 - _13._m0[_1752]._m1[3]);
            bool _1802 = int(_13._m0[_1752]._m5 & 1u) == 1;
            vec3 _1803 = abs(_1801);
            float _1806 = dot(_1801, _1801);
            if (_1802 ? any(greaterThanEqual(_1803, _13._m0[_1752]._m0.xyz)) : (_1806 >= _13._m0[_1752]._m0.y))
            {
                _1741 = _1740;
                _1744 = _1743;
                continue;
            }
            vec3 _1980;
            SPIRV_CROSS_FLATTEN
            if ((_1771 & 1) != 0)
            {
                vec3 _1816 = _1775 * _476;
                vec2 _1905;
                bool _1906;
                if (_1802)
                {
                    vec2 _1900;
                    bool _1904;
                    do
                    {
                        vec3 _1884 = (_13._m0[_1752]._m0.xyz - _1801) / _1816;
                        vec3 _1887 = ((-_13._m0[_1752]._m0.xyz) - _1801) / _1816;
                        vec3 _1888 = spvNMin(_1884, _1887);
                        vec3 _1889 = spvNMax(_1884, _1887);
                        float _1894 = spvNMax(_1888.x, spvNMax(_1888.y, _1888.z));
                        float _1899 = spvNMin(_1889.x, spvNMin(_1889.y, _1889.z));
                        _1900 = vec2(_1894, _1899);
                        if (_1894 > _1899)
                        {
                            _1904 = false;
                            break;
                        }
                        _1904 = true;
                        break;
                    } while(false);
                    _1905 = _1900;
                    _1906 = _1904;
                }
                else
                {
                    vec2 _1879;
                    bool _1880;
                    do
                    {
                        float _1822 = dot(_1816, _1816);
                        float _1823 = dot(_1816, _1801);
                        float _1824 = 2.0 * _1823;
                        float _1825 = _1806 - _13._m0[_1752]._m0.y;
                        float _1861;
                        float _1862;
                        bool _1863;
                        do
                        {
                            float _1831 = fma(_1824, _1824, -((4.0 * _1822) * _1825));
                            float _1859;
                            float _1860;
                            if (_1831 < 0.0)
                            {
                                _1861 = 0.0;
                                _1862 = 0.0;
                                _1863 = false;
                                break;
                            }
                            else
                            {
                                if (_1831 == 0.0)
                                {
                                    float _1858 = (_1823 * (-1.0)) * (1.0 / _1822);
                                    _1859 = _1858;
                                    _1860 = _1858;
                                }
                                else
                                {
                                    float _1851;
                                    if (_1824 > 0.0)
                                    {
                                        _1851 = (-0.5) * fma(2.0, _1823, sqrt(_1831));
                                    }
                                    else
                                    {
                                        _1851 = (-0.5) * fma(2.0, _1823, -sqrt(_1831));
                                    }
                                    _1859 = _1825 * (1.0 / _1851);
                                    _1860 = _1851 * (1.0 / _1822);
                                }
                            }
                            _1861 = _1859;
                            _1862 = _1860;
                            _1863 = true;
                            break;
                        } while(false);
                        if (!_1863)
                        {
                            _1879 = vec2(0.0);
                            _1880 = false;
                            break;
                        }
                        if ((_1862 < 0.0) && (_1861 < 0.0))
                        {
                            _1879 = vec2(0.0);
                            _1880 = false;
                            break;
                        }
                        vec2 _1878;
                        if (_1862 > _1861)
                        {
                            _1878 = vec2(_1861, _1862);
                        }
                        else
                        {
                            _1878 = vec2(_1862, _1861);
                        }
                        _1879 = _1878;
                        _1880 = true;
                        break;
                    } while(false);
                    _1905 = _1879;
                    _1906 = _1880;
                }
                vec3 _1909 = _1801 + (_1816 * _1905.y);
                float _1930;
                if (_1802)
                {
                    _1930 = 1.0 - clamp(length(spvNMax(_1803 - (_13._m0[_1752]._m0.xyz - vec3(_13._m0[_1752]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1752]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _1930 = clamp((_13._m0[_1752]._m0.x - length(_1801)) * (1.0 / spvNMax(_13._m0[_1752]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _1933 = float(_1906) * smoothstep(0.0, 1.0, _1930);
                vec4 _1975;
                SPIRV_CROSS_BRANCH
                if (_1933 > 9.9999997473787516355514526367188e-05)
                {
                    float _1942 = mix(clamp((_1905.y * (1.0 / length(_1909))) * _513, 0.0, _513), _513, _513);
                    vec3 _1944 = mix(_1909, _1816, vec3(_1942));
                    int _78 = _1781;
                    vec4 _1945 = textureLod(nonuniformEXT(samplerCube(_24[_78], _7)), _1944, 0.0);
                    int _82 = _1781 + 1;
                    _1945.w = textureLod(nonuniformEXT(samplerCube(_24[_82], _7)), _1944, 0.0).x;
                    vec4 _1960;
                    SPIRV_CROSS_BRANCH
                    if (_1786 >= 0)
                    {
                        int _86 = _1786;
                        vec4 _1953 = textureLod(nonuniformEXT(samplerCube(_24[_86], _7)), _1944, 0.0);
                        int _90 = _1786 + 1;
                        _1953.w = textureLod(nonuniformEXT(samplerCube(_24[_90], _7)), _1944, 0.0).x;
                        _1960 = mix(_1945, _1953, vec4(_13._m0[_1752]._m3));
                    }
                    else
                    {
                        _1960 = _1945;
                    }
                    vec4 _1961 = _1960 * _1799;
                    vec3 _1970 = (_1961.xyz * _13._m0[_1752]._m4).xyz * (_459 * textureLod(sampler2D(_18, _12), vec2(_1708, _1942), 0.0).z);
                    vec4 _1971 = vec4(_1970.x, _1970.y, _1970.z, _1961.w);
                    _1971.w = _1961.w * _1933;
                    _1975 = _1971;
                }
                else
                {
                    _1975 = vec4(0.0);
                }
                _1980 = mix(_1743, _1975.xyz, vec3(_1975.w));
            }
            else
            {
                _1980 = _1743;
            }
            vec3 _2159;
            SPIRV_CROSS_FLATTEN
            if ((_1771 & 2) != 0)
            {
                vec3 _1985 = _1775 * _1662;
                vec2 _2074;
                bool _2075;
                if (_1802)
                {
                    vec2 _2069;
                    bool _2073;
                    do
                    {
                        vec3 _2053 = (_13._m0[_1752]._m0.xyz - _1801) / _1985;
                        vec3 _2056 = ((-_13._m0[_1752]._m0.xyz) - _1801) / _1985;
                        vec3 _2057 = spvNMin(_2053, _2056);
                        vec3 _2058 = spvNMax(_2053, _2056);
                        float _2063 = spvNMax(_2057.x, spvNMax(_2057.y, _2057.z));
                        float _2068 = spvNMin(_2058.x, spvNMin(_2058.y, _2058.z));
                        _2069 = vec2(_2063, _2068);
                        if (_2063 > _2068)
                        {
                            _2073 = false;
                            break;
                        }
                        _2073 = true;
                        break;
                    } while(false);
                    _2074 = _2069;
                    _2075 = _2073;
                }
                else
                {
                    vec2 _2048;
                    bool _2049;
                    do
                    {
                        float _1991 = dot(_1985, _1985);
                        float _1992 = dot(_1985, _1801);
                        float _1993 = 2.0 * _1992;
                        float _1994 = _1806 - _13._m0[_1752]._m0.y;
                        float _2030;
                        float _2031;
                        bool _2032;
                        do
                        {
                            float _2000 = fma(_1993, _1993, -((4.0 * _1991) * _1994));
                            float _2028;
                            float _2029;
                            if (_2000 < 0.0)
                            {
                                _2030 = 0.0;
                                _2031 = 0.0;
                                _2032 = false;
                                break;
                            }
                            else
                            {
                                if (_2000 == 0.0)
                                {
                                    float _2027 = (_1992 * (-1.0)) * (1.0 / _1991);
                                    _2028 = _2027;
                                    _2029 = _2027;
                                }
                                else
                                {
                                    float _2020;
                                    if (_1993 > 0.0)
                                    {
                                        _2020 = (-0.5) * fma(2.0, _1992, sqrt(_2000));
                                    }
                                    else
                                    {
                                        _2020 = (-0.5) * fma(2.0, _1992, -sqrt(_2000));
                                    }
                                    _2028 = _1994 * (1.0 / _2020);
                                    _2029 = _2020 * (1.0 / _1991);
                                }
                            }
                            _2030 = _2028;
                            _2031 = _2029;
                            _2032 = true;
                            break;
                        } while(false);
                        if (!_2032)
                        {
                            _2048 = vec2(0.0);
                            _2049 = false;
                            break;
                        }
                        if ((_2031 < 0.0) && (_2030 < 0.0))
                        {
                            _2048 = vec2(0.0);
                            _2049 = false;
                            break;
                        }
                        vec2 _2047;
                        if (_2031 > _2030)
                        {
                            _2047 = vec2(_2030, _2031);
                        }
                        else
                        {
                            _2047 = vec2(_2031, _2030);
                        }
                        _2048 = _2047;
                        _2049 = true;
                        break;
                    } while(false);
                    _2074 = _2048;
                    _2075 = _2049;
                }
                vec3 _2078 = _1801 + (_1985 * _2074.y);
                float _2099;
                if (_1802)
                {
                    _2099 = 1.0 - clamp(length(spvNMax(_1803 - (_13._m0[_1752]._m0.xyz - vec3(_13._m0[_1752]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1752]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2099 = clamp((_13._m0[_1752]._m0.x - length(_1801)) * (1.0 / spvNMax(_13._m0[_1752]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2102 = float(_2075) * smoothstep(0.0, 1.0, _2099);
                vec4 _2154;
                SPIRV_CROSS_BRANCH
                if (_2102 > 9.9999997473787516355514526367188e-05)
                {
                    float _2111 = mix(clamp((_2074.y * (1.0 / length(_2078))) * _513, 0.0, _513), _513, _513);
                    vec3 _2113 = mix(_2078, _1985, vec3(_2111));
                    float _2114 = _2111 * 8.0;
                    int _94 = _1791;
                    int _98 = _1791 + 1;
                    vec4 _2122 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_94], _7)), _2113, _2114).xyz, textureLod(nonuniformEXT(samplerCube(_24[_98], _7)), _2113, _2114).x);
                    vec4 _2136;
                    SPIRV_CROSS_BRANCH
                    if (_1796 >= 0)
                    {
                        int _102 = _1796;
                        int _106 = _1796 + 1;
                        _2136 = mix(_2122, vec4(textureLod(nonuniformEXT(samplerCube(_24[_102], _7)), _2113, _2114).xyz, textureLod(nonuniformEXT(samplerCube(_24[_106], _7)), _2113, _2114).x), vec4(_13._m0[_1752]._m3));
                    }
                    else
                    {
                        _2136 = _2122;
                    }
                    vec4 _2137 = _2136 * _1799;
                    vec4 _2142 = textureLod(sampler2D(_18, _12), vec2(_1708, _2111), 0.0);
                    vec3 _2149 = (_2137.xyz * _13._m0[_1752]._m4).xyz * ((_1664 * _2142.x) + vec3(_2142.y));
                    vec4 _2150 = vec4(_2149.x, _2149.y, _2149.z, _2137.w);
                    _2150.w = _2137.w * _2102;
                    _2154 = _2150;
                }
                else
                {
                    _2154 = vec4(0.0);
                }
                _2159 = mix(_1740, _2154.xyz, vec3(_2154.w));
            }
            else
            {
                _2159 = _1740;
            }
            _1741 = _2159;
            _1744 = _1980;
        }
        float _2160 = _6._m0[0u] * 100.0;
        bool _2165 = _26._m19 > 0.0;
        vec3 _2226;
        SPIRV_CROSS_BRANCH
        if (_2165 && (_26._m35 == 0.0))
        {
            vec3 _2179 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _2180 = length(_2179);
            vec3 _2191;
            float _2192;
            if (_2180 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2189 = _2179;
                _2189.z = _2179.z + _29._m0;
                _2191 = _2189;
                _2192 = length(_2189);
            }
            else
            {
                _2191 = _2179;
                _2192 = _2180;
            }
            float _2195 = dot(_2191 / vec3(_2192), _26._m36);
            float _2196 = _29._m0 / _2192;
            _2226 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_2195 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_2192 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_2195 < (-sqrt(fma(-_2196, _2196, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _2226 = _26._m2;
        }
        float _2239 = texelFetch(_41, ivec3(int(_548), int(_549), 0).xy, 0).x;
        float _2324;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _2263 = _27._m6 + _482;
            vec3 _2270 = vec3(0.0, _26._m18.z, 0.0) + (_2263 - vec3(0.0, _26._m25, 0.0));
            float _2274 = dot(_2270, _26._m24);
            vec2 _2284 = ((((_2270 + (_26._m24 * (sqrt(fma(_2274, _2274, fma(_26._m18.z, _26._m18.z, -dot(_2270, _2270)))) - _2274))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _2284.x = 1.0 - _2284.x;
            vec3 _2297 = vec3(0.0, _26._m23.z, 0.0) + (_2263 - vec3(0.0, _26._m27, 0.0));
            float _2301 = dot(_2297, _26._m26);
            vec2 _2311 = ((((_2297 + (_26._m26 * (sqrt(fma(_2301, _2301, fma(_26._m23.z, _26._m23.z, -dot(_2297, _2297)))) - _2301))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _2311.x = 1.0 - _2311.x;
            _2324 = _2239 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _2284, 0.0).x, textureLod(sampler2D(_33, _7), _2311, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _2324 = _2239;
        }
        float _2414;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _2352 = _27._m6 + _482;
            vec3 _2360 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _2352) - vec3(0.0, _26._m30, 0.0));
            float _2364 = dot(_2360, _26._m24);
            vec2 _2374 = ((((_2360 + (_26._m24 * (sqrt(fma(_2364, _2364, fma(_26._m28.z, _26._m28.z, -dot(_2360, _2360)))) - _2364))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _2374.x = 1.0 - _2374.x;
            vec3 _2388 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _2352) - vec3(0.0, _26._m33, 0.0));
            float _2392 = dot(_2388, _26._m26);
            vec2 _2402 = ((((_2388 + (_26._m26 * (sqrt(fma(_2392, _2392, fma(_26._m31.z, _26._m31.z, -dot(_2388, _2388)))) - _2392))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _2402.x = 1.0 - _2402.x;
            _2414 = _2324 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _2374, 0.0).x, textureLod(sampler2D(_23, _7), _2402, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _2414 = _2324;
        }
        vec3 _2416 = _2226 * (_2414 * _6._m0[0u]);
        vec3 _2419 = reflect(_484, _476);
        float _2423 = clamp(dot(_26._m0, normalize(_484 + _26._m0)), 0.0, 1.0);
        float _2425 = clamp(dot(_476, _26._m0), 0.0, 1.0);
        vec3 _2432 = vec3(fma((2.0 * _2423) * _2423, _513, mix(0.0, 0.5, _513))) - vec3(1.0);
        float _2451 = dot(_26._m0, _2419);
        vec3 _2461 = mix(_2419, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_2419 - (_26._m0 * _2451)) * 0.0045900647528469562530517578125)), bvec3(_2451 < 0.999989449977874755859375));
        float _2465 = clamp(dot(_476, normalize(_484 + _2461)), 0.0, 1.0);
        float _2467 = clamp(dot(_476, _2461), 0.0, 1.0);
        float _2478 = clamp(_579, 0.0, 1.0);
        float _2510;
        float _2511;
        if (_34._m0.x > 0.0)
        {
            vec4 _2499 = textureLod(sampler2D(_40, _12), _398, 0.0);
            float _2500 = _2499.x;
            _2510 = clamp((pow(spvNMax(abs(_578 + _2500), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _513, -1.0))) - 1.0) + _2500, 0.0, 1.0);
            _2511 = _2500;
        }
        else
        {
            _2510 = 1.0;
            _2511 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.5) {
            float _rdx_aoExtra = mix(1.0, _2511, 0.7);
            _1252 *= _rdx_aoExtra;
            _1254 *= _rdx_aoExtra;
        }
        vec3 _2519 = ((_1254 + ((_2416 * (_459 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2432 * pow(spvNMax(abs(1.0 - _2425), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2432 * pow(spvNMax(abs(1.0 - _579), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _513))))) * _2425)) * mix(1.0, _2511, _34._m0.y)) + ((_1743 * _2160) * _2511);
        vec3 _2521 = ((_1252 + ((_2416 * (_481.xyz * ((((2.0 + (1.0 / _513)) * pow(spvNMax(abs(fma(-_2465, _2465, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _513)) * 0.15915493667125701904296875) * (0.25 / fma(-_2467, _2478, _2467 + _2478))))) * _2467)) * mix(1.0, _2510, _34._m0.y)) + ((_1740 * _2160) * _2510);
        // --- RenoDX: Multi-Scatter GGX Energy Compensation ---
        if (pc.rendering_multi_scatter > 0.5) {
            vec3 _rdx_ms = rdx_multi_scatter_compensation(_579, _513, _437.xyz);
            _2521 *= _rdx_ms;
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _2239, 0.5);
            _2519 *= _rdx_csm_shadow;
            _2521 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _39, _7, _398, _rdx_marchDir, _440, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _2519 *= _rdx_micro;
            _2521 *= _rdx_micro;
        }
        vec3 _3026;
        vec3 _3027;
        SPIRV_CROSS_BRANCH
        if (_2165)
        {
            vec3 _2529 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _2530 = vec3(0.0, 636100.0, 0.0) + (_482 + _27._m6);
            float _2531 = length(_2530);
            vec3 _2535 = (_2530 / vec3(_2531)) * spvNMax(_2531, 636100.0);
            vec3 _2536 = _2535 - _2529;
            float _2537 = length(_2536);
            vec3 _2539 = _2536 / vec3(_2537);
            float _2540 = length(_2529);
            vec3 _2554;
            vec3 _2555;
            float _2556;
            if (_2540 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2549 = _2529;
                _2549.z = _2529.z + _29._m0;
                vec3 _2552 = _2535;
                _2552.z = _2535.z + _29._m0;
                _2554 = _2552;
                _2555 = _2549;
                _2556 = length(_2549);
            }
            else
            {
                _2554 = _2535;
                _2555 = _2529;
                _2556 = _2540;
            }
            float _2557 = dot(_2555, _2539);
            float _2568 = spvNMax((-_2557) - sqrt(fma(_29._m1, _29._m1, fma(_2557, _2557, -(_2556 * _2556)))), 0.0);
            bool _2571 = (_2568 > 0.0) && (_2568 < _2537);
            vec3 _2579;
            float _2580;
            float _2581;
            if (_2571)
            {
                _2579 = _2555 + (_2539 * _2568);
                _2580 = _2537 - _2568;
                _2581 = (_2557 + _2568) / _29._m1;
            }
            else
            {
                _2579 = _2555;
                _2580 = _2537;
                _2581 = _2557 / _2556;
            }
            float _2582 = _2571 ? _29._m1 : _2556;
            vec3 _3019;
            vec3 _3020;
            if (_2582 <= _29._m1)
            {
                float _2587 = dot(_2539, _26._m36);
                float _2589 = dot(_2579, _26._m36) / _2582;
                float _2590 = _29._m0 + 600.0;
                bool _2591 = _2582 < _2590;
                vec3 _2596;
                if (_2591)
                {
                    _2596 = _2554 * (_2590 / _2582);
                }
                else
                {
                    _2596 = _2554;
                }
                float _2597 = _2591 ? _2590 : _2582;
                float _2598 = length(_2596);
                float _2599 = dot(_2596, _2539);
                float _2601 = dot(_2596, _26._m36) / _2598;
                vec2 _2612 = vec2(_2581, _2581 + (_2580 / _2597));
                vec2 _2613 = _2612 * sqrt((0.5 / _29._m4) * _2597);
                vec2 _2616 = vec2(ivec2(sign(_2613)));
                vec2 _2617 = _2613 * _2613;
                float _2631 = -_2580;
                float _2633 = 2.0 * _2597;
                float _2635 = (_2580 / _2633) + _2581;
                float _2643 = _29._m0 - _2597;
                vec2 _2658 = _2612 * sqrt((0.5 / _29._m6) * _2597);
                vec2 _2661 = vec2(ivec2(sign(_2658)));
                vec2 _2662 = _2658 * _2658;
                vec3 _2692 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _2597) * exp(_2643 / _29._m4)) * (((_2616.y > _2616.x) ? exp(_2617.x) : 0.0) + dot((_2616 / ((abs(_2613) * 2.3192999362945556640625) + sqrt((_2617 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2631 / _29._m4) * _2635)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _2597) * exp(_2643 / _29._m6)) * (((_2661.y > _2661.x) ? exp(_2662.x) : 0.0) + dot((_2661 / ((abs(_2658) * 2.3192999362945556640625) + sqrt((_2662 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2631 / _29._m6) * _2635)), vec2(1.0, -1.0))))));
                vec3 _2693 = spvNMin(_2692, vec3(1.0));
                float _2694 = _29._m0 / _2597;
                float _2697 = sqrt(fma(-_2694, _2694, 1.0));
                float _2699 = _2581 - (-_2697);
                vec4 _2982;
                if (abs(_2699) < 0.0040000001899898052215576171875)
                {
                    float _2807 = (-0.0040000001899898052215576171875) - _2697;
                    float _2809 = fma(_2597, _2597, _2580 * _2580);
                    float _2810 = _2633 * _2580;
                    float _2812 = sqrt(fma(_2810, _2807, _2809));
                    float _2813 = fma(_2597, _2807, _2580);
                    float _2816 = -(_29._m0 * _29._m0);
                    float _2818 = sqrt(fma(_29._m1, _29._m1, _2816));
                    float _2820 = sqrt(fma(_2597, _2597, _2816));
                    float _2821 = _2597 * _2807;
                    float _2823 = -(_2597 * _2597);
                    float _2825 = fma(_29._m0, _29._m0, fma(_2821, _2821, _2823));
                    vec4 _2831 = vec4(-1.0, _2818 * _2818, _2818, 0.50390625);
                    vec4 _2832 = mix(_2831, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2821 < 0.0) && (_2825 > 0.0)));
                    float _2834 = fma(_2820 / _2818, 0.96875, 0.015625);
                    float _2844 = fma(fma(_2821, _2832.x, sqrt(_2825 + _2832.y)) / (_2820 + _2832.z), 0.4921875, _2832.w);
                    float _2850 = _2587 + 1.0;
                    float _2852 = floor(_2850 * 3.5);
                    float _2854 = fma(_2850, 3.5, -_2852);
                    float _2855 = _2852 + fma(fma(atan(spvNMax(_2589, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2856 = _2855 * 0.125;
                    float _2860 = 1.0 - _2854;
                    float _2863 = (_2855 + 1.0) * 0.125;
                    float _2870 = sqrt(fma(_2812, _2812, _2816));
                    float _2874 = fma(_29._m0, _29._m0, fma(_2813, _2813, -(_2812 * _2812)));
                    vec4 _2879 = mix(_2831, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2813 < 0.0) && (_2874 > 0.0)));
                    float _2881 = fma(_2870 / _2818, 0.96875, 0.015625);
                    float _2891 = fma(fma(_2813, _2879.x, sqrt(_2874 + _2879.y)) / (_2870 + _2879.z), 0.4921875, _2879.w);
                    float _2897 = _2852 + fma(fma(atan(spvNMax(_2601, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2898 = _2897 * 0.125;
                    float _2904 = (_2897 + 1.0) * 0.125;
                    vec4 _2910 = _2693.xyzx;
                    float _2914 = 0.0040000001899898052215576171875 - _2697;
                    float _2916 = sqrt(fma(_2810, _2914, _2809));
                    float _2917 = fma(_2597, _2914, _2580);
                    float _2918 = _2597 * _2914;
                    float _2920 = fma(_29._m0, _29._m0, fma(_2918, _2918, _2823));
                    vec4 _2925 = mix(_2831, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2918 < 0.0) && (_2920 > 0.0)));
                    float _2935 = fma(fma(_2918, _2925.x, sqrt(_2920 + _2925.y)) / (_2820 + _2925.z), 0.4921875, _2925.w);
                    float _2946 = sqrt(fma(_2916, _2916, _2816));
                    float _2950 = fma(_29._m0, _29._m0, fma(_2917, _2917, -(_2916 * _2916)));
                    vec4 _2955 = mix(_2831, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2917 < 0.0) && (_2950 > 0.0)));
                    float _2957 = fma(_2946 / _2818, 0.96875, 0.015625);
                    float _2967 = fma(fma(_2917, _2955.x, sqrt(_2950 + _2955.y)) / (_2946 + _2955.z), 0.4921875, _2955.w);
                    _2982 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2898, _2891, _2881), 0.0) * _2860) + (textureLod(sampler3D(_31, _7), vec3(_2904, _2891, _2881), 0.0) * _2854)), _2910, (textureLod(sampler3D(_31, _7), vec3(_2856, _2844, _2834), 0.0) * _2860) + (textureLod(sampler3D(_31, _7), vec3(_2863, _2844, _2834), 0.0) * _2854)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2898, _2967, _2957), 0.0) * _2860) + (textureLod(sampler3D(_31, _7), vec3(_2904, _2967, _2957), 0.0) * _2854)), _2910, (textureLod(sampler3D(_31, _7), vec3(_2856, _2935, _2834), 0.0) * _2860) + (textureLod(sampler3D(_31, _7), vec3(_2863, _2935, _2834), 0.0) * _2854)), vec4(0.0)), vec4((_2699 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _2707 = -(_29._m0 * _29._m0);
                    float _2709 = sqrt(fma(_29._m1, _29._m1, _2707));
                    float _2711 = sqrt(fma(_2597, _2597, _2707));
                    float _2712 = _2597 * _2581;
                    float _2716 = fma(_29._m0, _29._m0, fma(_2712, _2712, -(_2597 * _2597)));
                    vec4 _2722 = vec4(-1.0, _2709 * _2709, _2709, 0.50390625);
                    vec4 _2723 = mix(_2722, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2712 < 0.0) && (_2716 > 0.0)));
                    float _2725 = fma(_2711 / _2709, 0.96875, 0.015625);
                    float _2735 = fma(fma(_2712, _2723.x, sqrt(_2716 + _2723.y)) / (_2711 + _2723.z), 0.4921875, _2723.w);
                    float _2741 = _2587 + 1.0;
                    float _2743 = floor(_2741 * 3.5);
                    float _2745 = fma(_2741, 3.5, -_2743);
                    float _2746 = _2743 + fma(fma(atan(spvNMax(_2589, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _2751 = 1.0 - _2745;
                    float _2761 = sqrt(fma(_2598, _2598, _2707));
                    float _2765 = fma(_29._m0, _29._m0, fma(_2599, _2599, -(_2598 * _2598)));
                    vec4 _2770 = mix(_2722, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2599 < 0.0) && (_2765 > 0.0)));
                    float _2772 = fma(_2761 / _2709, 0.96875, 0.015625);
                    float _2782 = fma(fma(_2599, _2770.x, sqrt(_2765 + _2770.y)) / (_2761 + _2770.z), 0.4921875, _2770.w);
                    float _2788 = _2743 + fma(fma(atan(spvNMax(_2601, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _2982 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_2788 * 0.125, _2782, _2772), 0.0) * _2751) + (textureLod(sampler3D(_31, _7), vec3((_2788 + 1.0) * 0.125, _2782, _2772), 0.0) * _2745)), _2693.xyzx, (textureLod(sampler3D(_31, _7), vec3(_2746 * 0.125, _2735, _2725), 0.0) * _2751) + (textureLod(sampler3D(_31, _7), vec3((_2746 + 1.0) * 0.125, _2735, _2725), 0.0) * _2745)), vec4(0.0));
                }
                float _2997 = fma(_2587, _2587, 1.0);
                _3019 = _2693;
                _3020 = (_2982.xyz * (0.0596831031143665313720703125 * _2997)) + ((((_2982.xyz * (_2982.w * smoothstep(0.0, 0.0199999995529651641845703125, _2589))) / vec3(spvNMax(_2982.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _2587, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _2997) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _3019 = vec3(1.0);
                _3020 = vec3(0.0);
            }
            _3026 = _2521 * _3019;
            _3027 = fma(_2519, _3019, _3020 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _3026 = _2521;
            _3027 = _2519;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_39, _7, _398, _rdx_dir, _440, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _3027 = vec3(_rdx_vis);
            _3026 = vec3(0.0);
        }
        imageStore(_43, ivec2(_381), vec4(_3027, 1.0));
        imageStore(_44, ivec2(_381), vec4(_3026, 1.0));
        break;
    } while(false);
}

