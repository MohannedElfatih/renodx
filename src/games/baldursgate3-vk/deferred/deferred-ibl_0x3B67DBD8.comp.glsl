#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_samplerless_texture_functions : require
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
#extension GL_EXT_spirv_intrinsics : require
#extension GL_KHR_shader_subgroup_basic : require
#extension GL_KHR_shader_subgroup_quad : require
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

float _398;
const vec4 _408[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _454;
vec3 _455;

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
        uint _522 = (((_37._m2 & 1u) != 0u) ? ((_37._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_37._m2 / 2u) * _37._m3);
        uint _524 = _45._m0[_522];
        uvec2 _529 = (uvec2(_524 & 65535u, _524 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_529, _31._m3)) || any(greaterThan(_529, _31._m4)))
        {
            break;
        }
        vec2 _541 = vec2(_529);
        vec2 _546 = (_541 + vec2(0.5)) / vec2(_37._m1);
        vec2 _553 = ((_546 - _31._m1) / _31._m0) * 0.5;
        float _557 = _553.x;
        float _559 = _553.y;
        ivec2 _577 = ivec3(int(_529.x), int(_529.y), 0).xy;
        vec4 _583 = texelFetch(_40, _577, 0);
        vec4 _585 = texelFetch(_41, _577, 0);
        vec4 _587 = texelFetch(_42, _577, 0);
        float _588 = _587.x;
        vec3 _606;
        do
        {
            vec3 _594 = fma(vec3(texelFetch(_38, _577, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _595 = dot(_594, _594);
            if (_595 > 54000001024.0)
            {
                _606 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _600 = 2.0 / _595;
                vec2 _602 = _594.xy * _600;
                vec3 _603 = vec3(_602.x, _602.y, _454.z);
                _603.z = 1.0 - _600;
                _606 = _603;
                break;
            }
            break; // unreachable workaround
        } while(false);
        vec3 _607 = texelFetch(_39, _577, 0).xyz;
        float _609 = _583.y;
        float _610 = _583.z;
        uint _614 = uint(roundEven(_583.w * 255.0));
        uint _615 = _614 & 7u;
        uint _617 = (_614 & 112u) >> 4u;
        if (_615 == 1u)
        {
            break;
        }
        mat3 _629 = mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz);
        bool _633 = _615 == 5u;
        float _669;
        vec3 _670;
        float _671;
        float _672;
        SPIRV_CROSS_BRANCH
        if (_633)
        {
            vec3 _637 = _585.xyz * 255.0;
            float _639 = _637.y * 0.0625;
            vec2 _649 = clamp((vec2(fma(_637.x, 16.0, floor(_639)), fma(fract(_639), 4096.0, _637.z)) * 0.000488519784994423389434814453125) - vec2(1.0), vec2(-1.0), vec2(1.0));
            float _655 = (1.0 - abs(_649.x)) - abs(_649.y);
            vec3 _656;
            _656.z = _655;
            vec2 _665 = mix((vec2(1.0) - abs(_649.yx)) * mix(vec2(-1.0), vec2(1.0), greaterThanEqual(_649, vec2(0.0))), _649, bvec2(_655 >= 0.0));
            _669 = _585.w;
            _670 = normalize(vec3(_665.x, _665.y, _656.z));
            _671 = _610;
            _672 = 0.0;
        }
        else
        {
            _669 = 0.0;
            _670 = vec3(0.0, 0.0, 1.0);
            _671 = 0.0;
            _672 = _610;
        }
        vec3 _673 = _606 * _629;
        bool _674 = _615 == 3u;
        vec3 _679 = mix(_607, vec3(1.0), bvec3(_674 && (_28._m4 != 0.0))) * (1.0 - _672);
        vec3 _684 = mix(vec3(0.1599999964237213134765625 * (_609 * _609)), _607, vec3(_672));
        float _685 = spvNMax(0.0900000035762786865234375, _583.x);
        bool _686 = _615 == 2u;
        vec3 _843;
        vec3 _844;
        float _845;
        vec3 _846;
        vec3 _847;
        float _848;
        vec3 _849;
        float _850;
        float _851;
        float _852;
        float _853;
        float _854;
        bool _855;
        bool _856;
        bool _857;
        vec4 _858;
        SPIRV_CROSS_BRANCH
        if (_686)
        {
            vec3 _810 = _585.xyz * 255.0;
            float _812 = _810.y * 0.0625;
            vec2 _822 = clamp((vec2(fma(_810.x, 16.0, floor(_812)), fma(fract(_812), 4096.0, _810.z)) * 0.000488519784994423389434814453125) - vec2(1.0), vec2(-1.0), vec2(1.0));
            float _828 = (1.0 - abs(_822.x)) - abs(_822.y);
            vec3 _829;
            _829.z = _828;
            vec2 _838 = mix((vec2(1.0) - abs(_822.yx)) * mix(vec2(-1.0), vec2(1.0), greaterThanEqual(_822, vec2(0.0))), _822, bvec2(_828 >= 0.0));
            _843 = _679;
            _844 = _684;
            _845 = _585.w;
            _846 = normalize(vec3(_838.x, _838.y, _829.z)) * _629;
            _847 = vec3(1.0);
            _848 = 0.0;
            _849 = vec3(1.0);
            _850 = 0.5;
            _851 = 0.5;
            _852 = 0.5;
            _853 = 1.0;
            _854 = 0.0;
            _855 = false;
            _856 = false;
            _857 = false;
            _858 = vec4(0.0);
        }
        else
        {
            bool _690 = _615 == 6u;
            vec3 _794;
            vec3 _795;
            float _796;
            vec3 _797;
            float _798;
            float _799;
            float _800;
            float _801;
            float _802;
            bool _803;
            bool _804;
            bool _805;
            vec4 _806;
            if (_690)
            {
                _794 = _585.xyz;
                _795 = vec3(1.0);
                _796 = 0.0;
                _797 = vec3(1.0);
                _798 = 0.5;
                _799 = 0.5;
                _800 = 0.5;
                _801 = 1.0;
                _802 = 0.0;
                _803 = false;
                _804 = false;
                _805 = false;
                _806 = vec4(_585.xyz, 0.0);
            }
            else
            {
                bool _694 = _615 == 7u;
                vec3 _776;
                float _777;
                vec3 _778;
                float _779;
                float _780;
                float _781;
                float _782;
                float _783;
                bool _784;
                bool _785;
                bool _786;
                if (_694)
                {
                    _776 = vec3(1.0);
                    _777 = 0.0;
                    _778 = vec3(1.0);
                    _779 = 0.5;
                    _780 = 0.5;
                    _781 = 0.5;
                    _782 = 1.0;
                    _783 = 0.0;
                    _784 = false;
                    _785 = false;
                    _786 = false;
                }
                else
                {
                    vec3 _765;
                    float _766;
                    vec3 _767;
                    float _768;
                    float _769;
                    float _770;
                    float _771;
                    float _772;
                    bool _773;
                    bool _774;
                    bool _775;
                    if (_674)
                    {
                        uint _734 = uint(int(_585.x * 255.0));
                        bool _759 = _585.w != 0.0;
                        bool _761 = _12._m0[_734]._m2.z == 1.0;
                        _765 = _12._m0[_734]._m0.xyz;
                        _766 = _12._m0[_734]._m0.w;
                        _767 = _12._m0[_734]._m1.xyz;
                        _768 = spvNMax(clamp(_12._m0[_734]._m3.x * _685, 0.0, 1.0), 0.0900000035762786865234375);
                        _769 = spvNMax(clamp(_12._m0[_734]._m3.y * _685, 0.0, 1.0), 0.0900000035762786865234375);
                        _770 = _12._m0[_734]._m3.z;
                        _771 = _585.y;
                        _772 = fma(_12._m0[_734]._m2.y, _585.z, _12._m0[_734]._m2.x);
                        _773 = _759;
                        _774 = _759 && _761;
                        _775 = _759 && (!_761);
                    }
                    else
                    {
                        bool _701 = _615 == 4u;
                        vec3 _724;
                        float _725;
                        vec3 _726;
                        float _727;
                        bool _728;
                        bool _729;
                        if (_701)
                        {
                            uint _707 = uint(int(_585.x * 255.0));
                            bool _722 = _12._m0[_707]._m2.z == 1.0;
                            _724 = _12._m0[_707]._m0.xyz;
                            _725 = _12._m0[_707]._m0.w;
                            _726 = _12._m0[_707]._m1.xyz;
                            _727 = fma(_12._m0[_707]._m2.y, _585.z, _12._m0[_707]._m2.x);
                            _728 = _722;
                            _729 = !_722;
                        }
                        else
                        {
                            _724 = vec3(1.0);
                            _725 = 0.0;
                            _726 = vec3(1.0);
                            _727 = 0.0;
                            _728 = false;
                            _729 = false;
                        }
                        _765 = _724;
                        _766 = _725;
                        _767 = _726;
                        _768 = 0.5;
                        _769 = 0.5;
                        _770 = 0.5;
                        _771 = 1.0;
                        _772 = _727;
                        _773 = _701 ? true : false;
                        _774 = _728;
                        _775 = _729;
                    }
                    _776 = _765;
                    _777 = _766;
                    _778 = _767;
                    _779 = _768;
                    _780 = _769;
                    _781 = _770;
                    _782 = _771;
                    _783 = _772;
                    _784 = _773;
                    _785 = _774;
                    _786 = _775;
                }
                _794 = _684;
                _795 = _776;
                _796 = _777;
                _797 = _778;
                _798 = _779;
                _799 = _780;
                _800 = _781;
                _801 = _782;
                _802 = _783;
                _803 = _784;
                _804 = _785;
                _805 = _786;
                _806 = mix(vec4(0.0), _585, bvec4(_694));
            }
            _843 = mix(_679, _607, bvec3(_690));
            _844 = _794;
            _845 = 0.0;
            _846 = vec3(1.0, 0.0, 0.0);
            _847 = _795;
            _848 = _796;
            _849 = _797;
            _850 = _798;
            _851 = _799;
            _852 = _800;
            _853 = _801;
            _854 = _802;
            _855 = _803;
            _856 = _804;
            _857 = _805;
            _858 = _806;
        }
        vec3 _859 = (((_29._m7[0].xyz * ((1.0 - _557) - _559)) + (_29._m7[1].xyz * _557)) + (_29._m7[2].xyz * _559)) * _588;
        vec3 _861 = normalize(-_859);
        float _894;
        if (!_633)
        {
            uint _866 = gl_SubgroupInvocationID & 3u;
            vec3 _872 = (subgroupQuadSwapHorizontal(_606) - _606) * (((_866 & 1u) != 0u) ? (-1.0) : 1.0);
            vec3 _878 = (subgroupQuadSwapVertical(_606) - _606) * (((_866 & 2u) != 0u) ? (-1.0) : 1.0);
            vec3 _882 = mix(_872, vec3(0.0), bvec3(any(isnan(_872))));
            vec3 _886 = mix(_878, vec3(0.0), bvec3(any(isnan(_878))));
            _894 = sqrt(clamp(fma(_685, _685, spvNMin(dot(_882, _882) + dot(_886, _886), 0.180000007152557373046875)), 0.0, 1.0));
        }
        else
        {
            _894 = _685;
        }
        ivec2 _903 = ivec2(uvec2(_541) / uvec2(_21._m25));
        int _926 = int(fma(fma(float(int(clamp(fma(log2(_588 * _30._m4), _21._m21, _21._m22), 0.0, float(_21._m26)))), _21._m24, float(_903.y)), _21._m23, float(_903.x)));
        float _929 = _541.x;
        float _930 = _541.y;
        float _935 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _929, 0.005837149918079376220703125 * _930)));
        float _942 = clamp(fma(_21._m34.y, length(_859), _21._m34.x), 0.0, 1.0);
        bool _943 = _615 == 0u;
        vec3 _10497;
        vec3 _10498;
        SPIRV_CROSS_BRANCH
        if (_943)
        {
            uvec4 _9448 = uvec4(_9._m0[uint(_926)]);
            uint _9449 = _9448.x;
            uint _9450 = _9448.y;
            uint _9453 = ((_9450 >> 0u) & 4095u) + _9449;
            uint _9456 = ((_9450 >> 12u) & 4095u) + _9453;
            uint _9460 = ((_9448.z >> 0u) & 1023u) + _9456;
            float _9462 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
            float _9464;
            bool _9467;
            vec3 _9469;
            vec3 _9471;
            uint _9473;
            _9464 = _398;
            _9467 = false;
            _9469 = vec3(0.0);
            _9471 = vec3(0.0);
            _9473 = _9449;
            float _9465;
            bool _9468;
            vec3 _9470;
            vec3 _9472;
            for (; _9473 < _9453; _9464 = _9465, _9467 = _9468, _9469 = _9470, _9471 = _9472, _9473++)
            {
                uint _9480 = uint(_10._m0[_9473]);
                float _9498 = abs(_11._m0[_9480]._m5);
                if ((_11._m0[_9480]._m6 & (1u << (_617 & 31u))) != 0u)
                {
                    vec3 _9513 = _11._m0[_9480]._m0.xyz - _859;
                    float _9514 = dot(_9513, _9513);
                    vec3 _9517 = _9513 * inversesqrt(spvNMax(_9514, 1.0000000133514319600180897396058e-10));
                    float _9518 = _11._m0[_9480]._m0.w * _11._m0[_9480]._m0.w;
                    float _9757;
                    bool _9758;
                    vec3 _9759;
                    vec3 _9760;
                    if (_9514 < (1.0 / _9518))
                    {
                        vec3 _9523 = _861 + _9517;
                        vec3 _9527 = _9523 * inversesqrt(spvNMax(dot(_9523, _9523), 1.0000000133514319600180897396058e-10));
                        float _9529 = clamp(dot(_9517, _9527), 0.0, 1.0);
                        float _9531 = clamp(dot(_673, _9527), 0.0, 1.0);
                        float _9533 = clamp(dot(_673, _9517), 0.0, 1.0);
                        float _9534 = _9514 * _9518;
                        float _9540 = pow(spvNMax(abs(clamp(fma(-_9534, _9534, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_9480]._m4);
                        float _9550;
                        if (_11._m0[_9480]._m5 < 0.0)
                        {
                            _9550 = _9540 * fma(4.0, _9518, _9498);
                        }
                        else
                        {
                            _9550 = _9540 * ((1.0 / spvNMax(_9514, 9.9999997473787516355514526367188e-05)) + _9498);
                        }
                        float _9552 = 0.079577468335628509521484375 * (_9533 * _9550);
                        float _9688;
                        bool _9689;
                        float _9690;
                        if ((_11._m0[_9480]._m7 & 1u) != 0u)
                        {
                            uint _9577;
                            do
                            {
                                vec3 _9557 = -_9517;
                                float _9558 = dot(_9557, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _9559 = dot(_9557, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _9560 = dot(_9557, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _9564 = spvNMax(spvNMax(_9558, _9559), spvNMax(_9560, dot(_9557, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_9564 == _9558)
                                {
                                    _9577 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_9564 == _9559)
                                    {
                                        _9577 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_9564 == _9560)
                                        {
                                            _9577 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _9577 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _9579 = uint(int(_11._m0[_9480]._m7 >> 2u)) + _9577;
                            float _9682;
                            bool _9683;
                            float _9684;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_9533 <= 0.0) && (!_857))
                                {
                                    _9682 = _9464;
                                    _9683 = _9467;
                                    _9684 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _9613 = _22._m0[_9579]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_9533)))) * (_22._m0[_9579]._m4 * sqrt(_9514)))), 1.0);
                                    vec3 _9617 = _9613.xyz / vec3(_9613.w);
                                    vec2 _9620 = (_9617.xy * 0.5) + vec2(0.5);
                                    _9620.y = 1.0 - _9620.y;
                                    float _9629 = (_22._m0[_9579]._m5.y / _22._m0[_9579]._m6) / (_9617.z - _22._m0[_9579]._m5.x);
                                    float _9634 = _9467 ? _9464 : 6.283185482025146484375;
                                    float _9635 = _935 * _9634;
                                    vec2 _9636 = _22._m0[_9579]._m1 + _21._m33;
                                    vec2 _9639 = (_22._m0[_9579]._m1 + vec2(_22._m0[_9579]._m2)) - _21._m33;
                                    float _9641;
                                    _9641 = 0.0;
                                    for (int _9644 = 0; _9644 < 12; )
                                    {
                                        float _9649 = float(uint(_9644));
                                        float _9652 = sqrt(_9649 + 0.5) * 0.288675129413604736328125;
                                        float _9653 = fma(_9649, 2.3999631404876708984375, _9635);
                                        vec2 _9661 = clamp(fma((vec3(cos(_9653), sin(_9653), _9652).xy * _9652) * 2.5, _21._m33, _9620), _9636, _9639);
                                        vec2 _9664 = fract(fma(vec2(1.0) / _21._m33, _9661, vec2(0.5)));
                                        vec4 _9670 = vec4(lessThan(vec4(_9629), textureGather(sampler2D(_23, _14), _9661)));
                                        float _9673 = _9664.x;
                                        _9641 += clamp(mix(mix(_9670.w, _9670.z, _9673), mix(_9670.x, _9670.y, _9673), _9664.y), 0.0, 1.0);
                                        _9644++;
                                        continue;
                                    }
                                    _9682 = _9634;
                                    _9683 = _9467 ? _9467 : true;
                                    _9684 = _9641 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _9688 = _9682;
                            _9689 = _9683;
                            _9690 = _9552 * mix(1.0, _9684, spvNMin(_942, _11._m0[_9480]._m8));
                        }
                        else
                        {
                            _9688 = _9464;
                            _9689 = _9467;
                            _9690 = _9552;
                        }
                        vec3 _9755;
                        vec3 _9756;
                        if (_9533 > 0.0)
                        {
                            vec3 _9696 = _11._m0[_9480]._m1.xyz * (_9690 * ((_11._m0[_9480]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _9703 = vec3(fma((2.0 * _9529) * _9529, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                            float _9724 = (_894 + 1.0) * 0.5;
                            float _9725 = _894 * _894;
                            float _9733 = _9724 * _9724;
                            float _9745 = _9725 * _9725;
                            float _9748 = fma(fma(_9531, _9745, -_9531), _9531, 1.0);
                            _9755 = fma(_9696, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _9529), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_9533, sqrt(fma(fma(-_9462, _9733, _9462), _9462, _9733)), _9462 * sqrt(fma(fma(-_9533, _9733, _9533), _9533, _9733)))) * (_9745 * (0.3183098733425140380859375 / (_9748 * _9748)))), _9469);
                            _9756 = fma(_9696, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_9703 * pow(spvNMax(abs(1.0 - _9533), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_9703 * pow(spvNMax(abs(1.0 - _9462), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _9471);
                        }
                        else
                        {
                            _9755 = _9469;
                            _9756 = _9471;
                        }
                        _9757 = _9688;
                        _9758 = _9689;
                        _9759 = _9755;
                        _9760 = _9756;
                    }
                    else
                    {
                        _9757 = _9464;
                        _9758 = _9467;
                        _9759 = _9469;
                        _9760 = _9471;
                    }
                    _9465 = _9757;
                    _9468 = _9758;
                    _9470 = _9759;
                    _9472 = _9760;
                }
                else
                {
                    _9465 = _9464;
                    _9468 = _9467;
                    _9470 = _9469;
                    _9472 = _9471;
                }
            }
            float _9762;
            bool _9765;
            vec3 _9767;
            vec3 _9769;
            uint _9771;
            _9762 = _9464;
            _9765 = _9467;
            _9767 = _9469;
            _9769 = _9471;
            _9771 = _9473;
            float _9763;
            bool _9766;
            vec3 _9768;
            vec3 _9770;
            for (; _9771 < _9456; _9762 = _9763, _9765 = _9766, _9767 = _9768, _9769 = _9770, _9771++)
            {
                uint _9778 = uint(_10._m0[_9771]);
                float _9791 = abs(_11._m0[_9778]._m5);
                if ((_11._m0[_9778]._m6 & (1u << (_617 & 31u))) != 0u)
                {
                    vec3 _9809 = _11._m0[_9778]._m0.xyz - _859;
                    float _9810 = dot(_9809, _9809);
                    vec3 _9813 = _9809 * inversesqrt(spvNMax(_9810, 1.0000000133514319600180897396058e-10));
                    float _9814 = _11._m0[_9778]._m0.w * _11._m0[_9778]._m0.w;
                    float _10043;
                    bool _10044;
                    vec3 _10045;
                    vec3 _10046;
                    if (_9810 < (1.0 / _9814))
                    {
                        vec3 _9819 = _861 + _9813;
                        vec3 _9823 = _9819 * inversesqrt(spvNMax(dot(_9819, _9819), 1.0000000133514319600180897396058e-10));
                        float _9825 = clamp(dot(_9813, _9823), 0.0, 1.0);
                        float _9827 = clamp(dot(_673, _9823), 0.0, 1.0);
                        float _9829 = clamp(dot(_673, _9813), 0.0, 1.0);
                        float _9832 = dot(-_9813, normalize(_11._m0[_9778]._m2.xyz));
                        float _9861;
                        if (_9832 > _11._m0[_9778]._m1.w)
                        {
                            float _9836 = _9810 * _9814;
                            float _9842 = pow(spvNMax(abs(clamp(fma(-_9836, _9836, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_9778]._m4);
                            float _9852;
                            if (_11._m0[_9778]._m5 < 0.0)
                            {
                                _9852 = _9842 * fma(4.0, _9814, _9791);
                            }
                            else
                            {
                                _9852 = _9842 * ((1.0 / spvNMax(_9810, 9.9999997473787516355514526367188e-05)) + _9791);
                            }
                            float _9857 = clamp((_9832 - _11._m0[_9778]._m1.w) / spvNMax(_11._m0[_9778]._m2.w - _11._m0[_9778]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _9861 = _9829 * (_9852 * (_9857 * _9857));
                        }
                        else
                        {
                            _9861 = 0.0;
                        }
                        float _9862 = 0.3183098733425140380859375 * _9861;
                        float _9974;
                        bool _9975;
                        float _9976;
                        if ((_11._m0[_9778]._m7 & 1u) != 0u)
                        {
                            uint _9865 = uint(int(_11._m0[_9778]._m7 >> 2u));
                            float _9968;
                            bool _9969;
                            float _9970;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_9829 <= 0.0) && (!_857))
                                {
                                    _9968 = _9762;
                                    _9969 = _9765;
                                    _9970 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _9899 = _22._m0[_9865]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_9829)))) * (_22._m0[_9865]._m4 * sqrt(_9810)))), 1.0);
                                    vec3 _9903 = _9899.xyz / vec3(_9899.w);
                                    vec2 _9906 = (_9903.xy * 0.5) + vec2(0.5);
                                    _9906.y = 1.0 - _9906.y;
                                    float _9915 = (_22._m0[_9865]._m5.y / _22._m0[_9865]._m6) / (_9903.z - _22._m0[_9865]._m5.x);
                                    float _9920 = _9765 ? _9762 : 6.283185482025146484375;
                                    float _9921 = _935 * _9920;
                                    vec2 _9922 = _22._m0[_9865]._m1 + _21._m33;
                                    vec2 _9925 = (_22._m0[_9865]._m1 + vec2(_22._m0[_9865]._m2)) - _21._m33;
                                    float _9927;
                                    _9927 = 0.0;
                                    for (int _9930 = 0; _9930 < 12; )
                                    {
                                        float _9935 = float(uint(_9930));
                                        float _9938 = sqrt(_9935 + 0.5) * 0.288675129413604736328125;
                                        float _9939 = fma(_9935, 2.3999631404876708984375, _9921);
                                        vec2 _9947 = clamp(fma((vec3(cos(_9939), sin(_9939), _9938).xy * _9938) * 2.5, _21._m33, _9906), _9922, _9925);
                                        vec2 _9950 = fract(fma(vec2(1.0) / _21._m33, _9947, vec2(0.5)));
                                        vec4 _9956 = vec4(lessThan(vec4(_9915), textureGather(sampler2D(_23, _14), _9947)));
                                        float _9959 = _9950.x;
                                        _9927 += clamp(mix(mix(_9956.w, _9956.z, _9959), mix(_9956.x, _9956.y, _9959), _9950.y), 0.0, 1.0);
                                        _9930++;
                                        continue;
                                    }
                                    _9968 = _9920;
                                    _9969 = _9765 ? _9765 : true;
                                    _9970 = _9927 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _9974 = _9968;
                            _9975 = _9969;
                            _9976 = _9862 * mix(1.0, _9970, spvNMin(_942, _11._m0[_9778]._m8));
                        }
                        else
                        {
                            _9974 = _9762;
                            _9975 = _9765;
                            _9976 = _9862;
                        }
                        vec3 _10041;
                        vec3 _10042;
                        if (_9829 > 0.0)
                        {
                            vec3 _9982 = _11._m0[_9778]._m1.xyz * (_9976 * ((_11._m0[_9778]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _9989 = vec3(fma((2.0 * _9825) * _9825, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                            float _10010 = (_894 + 1.0) * 0.5;
                            float _10011 = _894 * _894;
                            float _10019 = _10010 * _10010;
                            float _10031 = _10011 * _10011;
                            float _10034 = fma(fma(_9827, _10031, -_9827), _9827, 1.0);
                            _10041 = fma(_9982, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _9825), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_9829, sqrt(fma(fma(-_9462, _10019, _9462), _9462, _10019)), _9462 * sqrt(fma(fma(-_9829, _10019, _9829), _9829, _10019)))) * (_10031 * (0.3183098733425140380859375 / (_10034 * _10034)))), _9767);
                            _10042 = fma(_9982, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_9989 * pow(spvNMax(abs(1.0 - _9829), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_9989 * pow(spvNMax(abs(1.0 - _9462), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _9769);
                        }
                        else
                        {
                            _10041 = _9767;
                            _10042 = _9769;
                        }
                        _10043 = _9974;
                        _10044 = _9975;
                        _10045 = _10041;
                        _10046 = _10042;
                    }
                    else
                    {
                        _10043 = _9762;
                        _10044 = _9765;
                        _10045 = _9767;
                        _10046 = _9769;
                    }
                    _9763 = _10043;
                    _9766 = _10044;
                    _9768 = _10045;
                    _9770 = _10046;
                }
                else
                {
                    _9763 = _9762;
                    _9766 = _9765;
                    _9768 = _9767;
                    _9770 = _9769;
                }
            }
            vec3 _10053;
            vec3 _10055;
            _10053 = _9767;
            _10055 = _9769;
            float _10049;
            bool _10052;
            vec3 _10054;
            vec3 _10056;
            float _10048 = _9762;
            bool _10051 = _9765;
            uint _10057 = _9771;
            for (; _10057 < _9460; _10048 = _10049, _10051 = _10052, _10053 = _10054, _10055 = _10056, _10057++)
            {
                uint _10064 = uint(_10._m0[_10057]);
                int _10093 = int(_13._m0[_10064]._m1 >> 1u) - 1;
                if (((_13._m0[_10064]._m4 & 16777215u) & (1u << (_617 & 31u))) != 0u)
                {
                    vec3 _10104 = _13._m0[_10064]._m6 * vec4(_859, 1.0);
                    float _10493;
                    bool _10494;
                    vec3 _10495;
                    vec3 _10496;
                    if (all(lessThan(abs(_10104 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _10111 = _861 + _13._m0[_10064]._m9;
                        vec3 _10115 = _10111 * inversesqrt(spvNMax(dot(_10111, _10111), 1.0000000133514319600180897396058e-10));
                        float _10117 = clamp(dot(_13._m0[_10064]._m9, _10115), 0.0, 1.0);
                        float _10119 = clamp(dot(_673, _10115), 0.0, 1.0);
                        float _10121 = clamp(dot(_673, _13._m0[_10064]._m9), 0.0, 1.0);
                        int _10122 = int(_13._m0[_10064]._m4 >> 24u);
                        float _10123 = _10104.z;
                        vec3 _10162;
                        if (_10123 < _13._m0[_10064]._m2.x)
                        {
                            float _10150 = _10123 * _13._m0[_10064]._m2.z;
                            float _10153 = _10150 * _10150;
                            vec3 _10161;
                            _10161.z = dot(_408[_10122], vec4(_10150, _10153, smoothstep(0.0, 1.0, _10150), (_10153 * _10150) * fma(_10150, fma(_10150, 6.0, -15.0), 10.0)));
                            _10162 = _10161;
                        }
                        else
                        {
                            vec3 _10148;
                            if (_10123 > _13._m0[_10064]._m2.y)
                            {
                                float _10136 = (1.0 - _10123) * _13._m0[_10064]._m2.w;
                                float _10139 = _10136 * _10136;
                                vec3 _10147;
                                _10147.z = dot(_408[_10122], vec4(_10136, _10139, smoothstep(0.0, 1.0, _10136), (_10139 * _10136) * fma(_10136, fma(_10136, 6.0, -15.0), 10.0)));
                                _10148 = _10147;
                            }
                            else
                            {
                                _10148 = vec3(0.0, 0.0, 1.0);
                            }
                            _10162 = _10148;
                        }
                        vec2 _10163 = _10104.xy;
                        vec2 _10167 = (vec2(0.5) - abs(_10163 - vec2(0.5))) * _13._m0[_10064]._m3;
                        float _10168 = _10167.x;
                        vec3 _10185;
                        if (_10168 < 1.0)
                        {
                            float _10176 = _10168 * _10168;
                            vec3 _10184 = _10162;
                            _10184.x = dot(_408[_10122], vec4(_10168, _10176, smoothstep(0.0, 1.0, _10168), (_10176 * _10168) * fma(_10168, fma(_10168, 6.0, -15.0), 10.0)));
                            _10185 = _10184;
                        }
                        else
                        {
                            vec3 _10173 = _10162;
                            _10173.x = 1.0;
                            _10185 = _10173;
                        }
                        float _10186 = _10167.y;
                        vec3 _10203;
                        if (_10186 < 1.0)
                        {
                            float _10194 = _10186 * _10186;
                            vec3 _10202 = _10185;
                            _10202.y = dot(_408[_10122], vec4(_10186, _10194, smoothstep(0.0, 1.0, _10186), (_10194 * _10186) * fma(_10186, fma(_10186, 6.0, -15.0), 10.0)));
                            _10203 = _10202;
                        }
                        else
                        {
                            vec3 _10191 = _10185;
                            _10191.y = 1.0;
                            _10203 = _10191;
                        }
                        float _10209 = _10121 * ((_10203.x * _10203.y) * _10203.z);
                        float _10315;
                        bool _10316;
                        float _10317;
                        if ((_13._m0[_10064]._m8 & 1u) != 0u)
                        {
                            uint _10212 = uint(int(_13._m0[_10064]._m8 >> 2u));
                            float _10309;
                            bool _10310;
                            float _10311;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_10121 <= 0.0) && (!_857))
                                {
                                    _10309 = _10048;
                                    _10310 = _10051;
                                    _10311 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _10244 = _22._m0[_10212]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_10121)))) * _22._m0[_10212]._m4)), 1.0);
                                    vec2 _10247 = (_10244.xy * 0.5) + vec2(0.5);
                                    _10247.y = 1.0 - _10247.y;
                                    float _10256 = ((_10244.z - _22._m0[_10212]._m5.y) / _22._m0[_10212]._m5.x) / _22._m0[_10212]._m6;
                                    float _10261 = _10051 ? _10048 : 6.283185482025146484375;
                                    float _10262 = _935 * _10261;
                                    vec2 _10263 = _22._m0[_10212]._m1 + _21._m33;
                                    vec2 _10266 = (_22._m0[_10212]._m1 + vec2(_22._m0[_10212]._m2)) - _21._m33;
                                    float _10268;
                                    _10268 = 0.0;
                                    for (int _10271 = 0; _10271 < 12; )
                                    {
                                        float _10276 = float(uint(_10271));
                                        float _10279 = sqrt(_10276 + 0.5) * 0.288675129413604736328125;
                                        float _10280 = fma(_10276, 2.3999631404876708984375, _10262);
                                        vec2 _10288 = clamp(fma((vec3(cos(_10280), sin(_10280), _10279).xy * _10279) * 2.5, _21._m33, _10247), _10263, _10266);
                                        vec2 _10291 = fract(fma(vec2(1.0) / _21._m33, _10288, vec2(0.5)));
                                        vec4 _10297 = vec4(lessThan(vec4(_10256), textureGather(sampler2D(_23, _14), _10288)));
                                        float _10300 = _10291.x;
                                        _10268 += clamp(mix(mix(_10297.w, _10297.z, _10300), mix(_10297.x, _10297.y, _10300), _10291.y), 0.0, 1.0);
                                        _10271++;
                                        continue;
                                    }
                                    _10309 = _10261;
                                    _10310 = _10051 ? _10051 : true;
                                    _10311 = _10268 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _10315 = _10309;
                            _10316 = _10310;
                            _10317 = _10209 * mix(1.0, _10311, spvNMin(_942, _13._m0[_10064]._m5));
                        }
                        else
                        {
                            _10315 = _10048;
                            _10316 = _10051;
                            _10317 = _10209;
                        }
                        vec3 _10358;
                        if (_10093 >= 0)
                        {
                            uint _10322 = gl_SubgroupInvocationID & 3u;
                            vec2 _10328 = (subgroupQuadSwapHorizontal(_10163) - _10163) * (((_10322 & 1u) != 0u) ? (-1.0) : 1.0);
                            vec2 _10334 = (subgroupQuadSwapVertical(_10163) - _10163) * (((_10322 & 2u) != 0u) ? (-1.0) : 1.0);
                            vec2 _10338 = mix(_10328, vec2(0.0), bvec2(any(isnan(_10328))));
                            vec2 _10342 = mix(_10334, vec2(0.0), bvec2(any(isnan(_10334))));
                            bvec2 _10351 = bvec2(any(greaterThan(abs(vec4(_10338, _10342)), vec4(0.015625))));
                            int _105 = _10093;
                            _10358 = _13._m0[_10064]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_105], _7)), _10163, mix(_10338, vec2(0.0), _10351), mix(_10342, vec2(0.0), _10351)).xyz;
                        }
                        else
                        {
                            _10358 = _13._m0[_10064]._m0;
                        }
                        vec3 _10491;
                        vec3 _10492;
                        SPIRV_CROSS_BRANCH
                        if ((_13._m0[_10064]._m1 & 1u) != 0u)
                        {
                            vec3 _10489;
                            vec3 _10490;
                            if (_10121 > 0.0)
                            {
                                vec3 _10430 = _10358 * (_10317 * _6._m0[0u]);
                                vec3 _10437 = vec3(fma((2.0 * _10117) * _10117, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                float _10458 = (_894 + 1.0) * 0.5;
                                float _10459 = _894 * _894;
                                float _10467 = _10458 * _10458;
                                float _10479 = _10459 * _10459;
                                float _10482 = fma(fma(_10119, _10479, -_10119), _10119, 1.0);
                                _10489 = fma(_10430, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _10117), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_10121, sqrt(fma(fma(-_9462, _10467, _9462), _9462, _10467)), _9462 * sqrt(fma(fma(-_10121, _10467, _10121), _10121, _10467)))) * (_10479 * (0.3183098733425140380859375 / (_10482 * _10482)))), _10053);
                                _10490 = fma(_10430, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_10437 * pow(spvNMax(abs(1.0 - _10121), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_10437 * pow(spvNMax(abs(1.0 - _9462), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _10055);
                            }
                            else
                            {
                                _10489 = _10053;
                                _10490 = _10055;
                            }
                            _10491 = _10489;
                            _10492 = _10490;
                        }
                        else
                        {
                            vec3 _10424;
                            vec3 _10425;
                            if (_10121 > 0.0)
                            {
                                vec3 _10365 = _10358 * _10317;
                                vec3 _10372 = vec3(fma((2.0 * _10117) * _10117, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                float _10393 = (_894 + 1.0) * 0.5;
                                float _10394 = _894 * _894;
                                float _10402 = _10393 * _10393;
                                float _10414 = _10394 * _10394;
                                float _10417 = fma(fma(_10119, _10414, -_10119), _10119, 1.0);
                                _10424 = fma(_10365, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _10117), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_10121, sqrt(fma(fma(-_9462, _10402, _9462), _9462, _10402)), _9462 * sqrt(fma(fma(-_10121, _10402, _10121), _10121, _10402)))) * (_10414 * (0.3183098733425140380859375 / (_10417 * _10417)))), _10053);
                                _10425 = fma(_10365, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_10372 * pow(spvNMax(abs(1.0 - _10121), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_10372 * pow(spvNMax(abs(1.0 - _9462), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _10055);
                            }
                            else
                            {
                                _10424 = _10053;
                                _10425 = _10055;
                            }
                            _10491 = _10424;
                            _10492 = _10425;
                        }
                        _10493 = _10315;
                        _10494 = _10316;
                        _10495 = _10491;
                        _10496 = _10492;
                    }
                    else
                    {
                        _10493 = _10048;
                        _10494 = _10051;
                        _10495 = _10053;
                        _10496 = _10055;
                    }
                    _10049 = _10493;
                    _10052 = _10494;
                    _10054 = _10495;
                    _10056 = _10496;
                }
                else
                {
                    _10049 = _10048;
                    _10052 = _10051;
                    _10054 = _10053;
                    _10056 = _10055;
                }
            }
            _10497 = _10053;
            _10498 = _10055;
        }
        else
        {
            vec3 _9443;
            vec3 _9444;
            if (_686)
            {
                uvec4 _8150 = uvec4(_9._m0[uint(_926)]);
                uint _8151 = _8150.x;
                uint _8152 = _8150.y;
                uint _8155 = ((_8152 >> 0u) & 4095u) + _8151;
                uint _8158 = ((_8152 >> 12u) & 4095u) + _8155;
                uint _8162 = ((_8150.z >> 0u) & 1023u) + _8158;
                float _8164 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                vec3 _8166;
                vec3 _8169;
                float _8171;
                bool _8173;
                uint _8175;
                _8166 = vec3(0.0);
                _8169 = vec3(0.0);
                _8171 = _398;
                _8173 = false;
                _8175 = _8151;
                vec3 _8167;
                vec3 _8170;
                float _8172;
                bool _8174;
                for (; _8175 < _8155; _8166 = _8167, _8169 = _8170, _8171 = _8172, _8173 = _8174, _8175++)
                {
                    uint _8182 = uint(_10._m0[_8175]);
                    float _8200 = abs(_11._m0[_8182]._m5);
                    if ((_11._m0[_8182]._m6 & (1u << (_617 & 31u))) != 0u)
                    {
                        vec3 _8215 = _11._m0[_8182]._m0.xyz - _859;
                        float _8216 = dot(_8215, _8215);
                        vec3 _8219 = _8215 * inversesqrt(spvNMax(_8216, 1.0000000133514319600180897396058e-10));
                        float _8220 = _11._m0[_8182]._m0.w * _11._m0[_8182]._m0.w;
                        vec3 _8563;
                        vec3 _8564;
                        float _8565;
                        bool _8566;
                        if (_8216 < (1.0 / _8220))
                        {
                            vec3 _8225 = _861 + _8219;
                            vec3 _8229 = _8225 * inversesqrt(spvNMax(dot(_8225, _8225), 1.0000000133514319600180897396058e-10));
                            float _8231 = clamp(dot(_8219, _8229), 0.0, 1.0);
                            float _8233 = clamp(dot(_673, _8229), 0.0, 1.0);
                            float _8235 = clamp(dot(_673, _8219), 0.0, 1.0);
                            float _8236 = _8216 * _8220;
                            float _8242 = pow(spvNMax(abs(clamp(fma(-_8236, _8236, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_8182]._m4);
                            float _8252;
                            if (_11._m0[_8182]._m5 < 0.0)
                            {
                                _8252 = _8242 * fma(4.0, _8220, _8200);
                            }
                            else
                            {
                                _8252 = _8242 * ((1.0 / spvNMax(_8216, 9.9999997473787516355514526367188e-05)) + _8200);
                            }
                            float _8254 = 0.079577468335628509521484375 * (_8235 * _8252);
                            float _8390;
                            bool _8391;
                            float _8392;
                            if ((_11._m0[_8182]._m7 & 1u) != 0u)
                            {
                                uint _8279;
                                do
                                {
                                    vec3 _8259 = -_8219;
                                    float _8260 = dot(_8259, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                    float _8261 = dot(_8259, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                    float _8262 = dot(_8259, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                    float _8266 = spvNMax(spvNMax(_8260, _8261), spvNMax(_8262, dot(_8259, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                    if (_8266 == _8260)
                                    {
                                        _8279 = 0u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_8266 == _8261)
                                        {
                                            _8279 = 1u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_8266 == _8262)
                                            {
                                                _8279 = 2u;
                                                break;
                                            }
                                            else
                                            {
                                                _8279 = 3u;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                uint _8281 = uint(int(_11._m0[_8182]._m7 >> 2u)) + _8279;
                                float _8384;
                                bool _8385;
                                float _8386;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_8235 <= 0.0) && (!_857))
                                    {
                                        _8384 = _8171;
                                        _8385 = _8173;
                                        _8386 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _8315 = _22._m0[_8281]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_8235)))) * (_22._m0[_8281]._m4 * sqrt(_8216)))), 1.0);
                                        vec3 _8319 = _8315.xyz / vec3(_8315.w);
                                        vec2 _8322 = (_8319.xy * 0.5) + vec2(0.5);
                                        _8322.y = 1.0 - _8322.y;
                                        float _8331 = (_22._m0[_8281]._m5.y / _22._m0[_8281]._m6) / (_8319.z - _22._m0[_8281]._m5.x);
                                        float _8336 = _8173 ? _8171 : 6.283185482025146484375;
                                        float _8337 = _935 * _8336;
                                        vec2 _8338 = _22._m0[_8281]._m1 + _21._m33;
                                        vec2 _8341 = (_22._m0[_8281]._m1 + vec2(_22._m0[_8281]._m2)) - _21._m33;
                                        float _8343;
                                        _8343 = 0.0;
                                        for (int _8346 = 0; _8346 < 12; )
                                        {
                                            float _8351 = float(uint(_8346));
                                            float _8354 = sqrt(_8351 + 0.5) * 0.288675129413604736328125;
                                            float _8355 = fma(_8351, 2.3999631404876708984375, _8337);
                                            vec2 _8363 = clamp(fma((vec3(cos(_8355), sin(_8355), _8354).xy * _8354) * 2.5, _21._m33, _8322), _8338, _8341);
                                            vec2 _8366 = fract(fma(vec2(1.0) / _21._m33, _8363, vec2(0.5)));
                                            vec4 _8372 = vec4(lessThan(vec4(_8331), textureGather(sampler2D(_23, _14), _8363)));
                                            float _8375 = _8366.x;
                                            _8343 += clamp(mix(mix(_8372.w, _8372.z, _8375), mix(_8372.x, _8372.y, _8375), _8366.y), 0.0, 1.0);
                                            _8346++;
                                            continue;
                                        }
                                        _8384 = _8336;
                                        _8385 = _8173 ? _8173 : true;
                                        _8386 = _8343 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _8390 = _8384;
                                _8391 = _8385;
                                _8392 = _8254 * mix(1.0, _8386, spvNMin(_942, _11._m0[_8182]._m8));
                            }
                            else
                            {
                                _8390 = _8171;
                                _8391 = _8173;
                                _8392 = _8254;
                            }
                            vec3 _8561;
                            vec3 _8562;
                            SPIRV_CROSS_BRANCH
                            if (_11._m0[_8182]._m3 < 0.0)
                            {
                                float _8478 = dot(_8229, _846);
                                vec3 _8559;
                                vec3 _8560;
                                if (_8235 > 0.0)
                                {
                                    vec3 _8483 = _11._m0[_8182]._m1.xyz * (_8392 * _6._m0[0u]);
                                    vec3 _8490 = vec3(fma((2.0 * _8231) * _8231, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                    float _8511 = (_894 + 1.0) * 0.5;
                                    float _8512 = _894 * _894;
                                    float _8520 = _8511 * _8511;
                                    float _8534 = sqrt(fma(-_845, 0.89999997615814208984375, 1.0));
                                    float _8537 = spvNMax(0.001000000047497451305389404296875, clamp(_8512 / _8534, 0.0, 1.0));
                                    float _8539 = spvNMax(0.001000000047497451305389404296875, _8512 * _8534);
                                    float _8550 = fma(_8233, _8233, ((_8478 * _8478) / (_8537 * _8537)) + (fma(-_8233, _8233, fma(-_8478, _8478, 1.0)) / (_8539 * _8539)));
                                    _8559 = fma(_8483, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _8231), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_8235, sqrt(fma(fma(-_8164, _8520, _8164), _8164, _8520)), _8164 * sqrt(fma(fma(-_8235, _8520, _8235), _8235, _8520)))) * (1.0 / ((((_8537 * _8539) * 3.1415927410125732421875) * _8550) * _8550))), _8166);
                                    _8560 = fma(_8483, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_8490 * pow(spvNMax(abs(1.0 - _8235), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_8490 * pow(spvNMax(abs(1.0 - _8164), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _8169);
                                }
                                else
                                {
                                    _8559 = _8166;
                                    _8560 = _8169;
                                }
                                _8561 = _8559;
                                _8562 = _8560;
                            }
                            else
                            {
                                float _8396 = dot(_8229, _846);
                                vec3 _8476;
                                vec3 _8477;
                                if (_8235 > 0.0)
                                {
                                    vec3 _8400 = _11._m0[_8182]._m1.xyz * _8392;
                                    vec3 _8407 = vec3(fma((2.0 * _8231) * _8231, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                    float _8428 = (_894 + 1.0) * 0.5;
                                    float _8429 = _894 * _894;
                                    float _8437 = _8428 * _8428;
                                    float _8451 = sqrt(fma(-_845, 0.89999997615814208984375, 1.0));
                                    float _8454 = spvNMax(0.001000000047497451305389404296875, clamp(_8429 / _8451, 0.0, 1.0));
                                    float _8456 = spvNMax(0.001000000047497451305389404296875, _8429 * _8451);
                                    float _8467 = fma(_8233, _8233, ((_8396 * _8396) / (_8454 * _8454)) + (fma(-_8233, _8233, fma(-_8396, _8396, 1.0)) / (_8456 * _8456)));
                                    _8476 = fma(_8400, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _8231), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_8235, sqrt(fma(fma(-_8164, _8437, _8164), _8164, _8437)), _8164 * sqrt(fma(fma(-_8235, _8437, _8235), _8235, _8437)))) * (1.0 / ((((_8454 * _8456) * 3.1415927410125732421875) * _8467) * _8467))), _8166);
                                    _8477 = fma(_8400, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_8407 * pow(spvNMax(abs(1.0 - _8235), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_8407 * pow(spvNMax(abs(1.0 - _8164), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _8169);
                                }
                                else
                                {
                                    _8476 = _8166;
                                    _8477 = _8169;
                                }
                                _8561 = _8476;
                                _8562 = _8477;
                            }
                            _8563 = _8561;
                            _8564 = _8562;
                            _8565 = _8390;
                            _8566 = _8391;
                        }
                        else
                        {
                            _8563 = _8166;
                            _8564 = _8169;
                            _8565 = _8171;
                            _8566 = _8173;
                        }
                        _8167 = _8563;
                        _8170 = _8564;
                        _8172 = _8565;
                        _8174 = _8566;
                    }
                    else
                    {
                        _8167 = _8166;
                        _8170 = _8169;
                        _8172 = _8171;
                        _8174 = _8173;
                    }
                }
                vec3 _8568;
                vec3 _8571;
                float _8573;
                bool _8575;
                uint _8577;
                _8568 = _8166;
                _8571 = _8169;
                _8573 = _8171;
                _8575 = _8173;
                _8577 = _8175;
                vec3 _8569;
                vec3 _8572;
                float _8574;
                bool _8576;
                for (; _8577 < _8158; _8568 = _8569, _8571 = _8572, _8573 = _8574, _8575 = _8576, _8577++)
                {
                    uint _8584 = uint(_10._m0[_8577]);
                    float _8597 = abs(_11._m0[_8584]._m5);
                    if ((_11._m0[_8584]._m6 & (1u << (_617 & 31u))) != 0u)
                    {
                        vec3 _8615 = _11._m0[_8584]._m0.xyz - _859;
                        float _8616 = dot(_8615, _8615);
                        vec3 _8619 = _8615 * inversesqrt(spvNMax(_8616, 1.0000000133514319600180897396058e-10));
                        float _8620 = _11._m0[_8584]._m0.w * _11._m0[_8584]._m0.w;
                        vec3 _8953;
                        vec3 _8954;
                        float _8955;
                        bool _8956;
                        if (_8616 < (1.0 / _8620))
                        {
                            vec3 _8625 = _861 + _8619;
                            vec3 _8629 = _8625 * inversesqrt(spvNMax(dot(_8625, _8625), 1.0000000133514319600180897396058e-10));
                            float _8631 = clamp(dot(_8619, _8629), 0.0, 1.0);
                            float _8633 = clamp(dot(_673, _8629), 0.0, 1.0);
                            float _8635 = clamp(dot(_673, _8619), 0.0, 1.0);
                            float _8638 = dot(-_8619, normalize(_11._m0[_8584]._m2.xyz));
                            float _8667;
                            if (_8638 > _11._m0[_8584]._m1.w)
                            {
                                float _8642 = _8616 * _8620;
                                float _8648 = pow(spvNMax(abs(clamp(fma(-_8642, _8642, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_8584]._m4);
                                float _8658;
                                if (_11._m0[_8584]._m5 < 0.0)
                                {
                                    _8658 = _8648 * fma(4.0, _8620, _8597);
                                }
                                else
                                {
                                    _8658 = _8648 * ((1.0 / spvNMax(_8616, 9.9999997473787516355514526367188e-05)) + _8597);
                                }
                                float _8663 = clamp((_8638 - _11._m0[_8584]._m1.w) / spvNMax(_11._m0[_8584]._m2.w - _11._m0[_8584]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _8667 = _8635 * (_8658 * (_8663 * _8663));
                            }
                            else
                            {
                                _8667 = 0.0;
                            }
                            float _8668 = 0.3183098733425140380859375 * _8667;
                            float _8780;
                            bool _8781;
                            float _8782;
                            if ((_11._m0[_8584]._m7 & 1u) != 0u)
                            {
                                uint _8671 = uint(int(_11._m0[_8584]._m7 >> 2u));
                                float _8774;
                                bool _8775;
                                float _8776;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_8635 <= 0.0) && (!_857))
                                    {
                                        _8774 = _8573;
                                        _8775 = _8575;
                                        _8776 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _8705 = _22._m0[_8671]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_8635)))) * (_22._m0[_8671]._m4 * sqrt(_8616)))), 1.0);
                                        vec3 _8709 = _8705.xyz / vec3(_8705.w);
                                        vec2 _8712 = (_8709.xy * 0.5) + vec2(0.5);
                                        _8712.y = 1.0 - _8712.y;
                                        float _8721 = (_22._m0[_8671]._m5.y / _22._m0[_8671]._m6) / (_8709.z - _22._m0[_8671]._m5.x);
                                        float _8726 = _8575 ? _8573 : 6.283185482025146484375;
                                        float _8727 = _935 * _8726;
                                        vec2 _8728 = _22._m0[_8671]._m1 + _21._m33;
                                        vec2 _8731 = (_22._m0[_8671]._m1 + vec2(_22._m0[_8671]._m2)) - _21._m33;
                                        float _8733;
                                        _8733 = 0.0;
                                        for (int _8736 = 0; _8736 < 12; )
                                        {
                                            float _8741 = float(uint(_8736));
                                            float _8744 = sqrt(_8741 + 0.5) * 0.288675129413604736328125;
                                            float _8745 = fma(_8741, 2.3999631404876708984375, _8727);
                                            vec2 _8753 = clamp(fma((vec3(cos(_8745), sin(_8745), _8744).xy * _8744) * 2.5, _21._m33, _8712), _8728, _8731);
                                            vec2 _8756 = fract(fma(vec2(1.0) / _21._m33, _8753, vec2(0.5)));
                                            vec4 _8762 = vec4(lessThan(vec4(_8721), textureGather(sampler2D(_23, _14), _8753)));
                                            float _8765 = _8756.x;
                                            _8733 += clamp(mix(mix(_8762.w, _8762.z, _8765), mix(_8762.x, _8762.y, _8765), _8756.y), 0.0, 1.0);
                                            _8736++;
                                            continue;
                                        }
                                        _8774 = _8726;
                                        _8775 = _8575 ? _8575 : true;
                                        _8776 = _8733 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _8780 = _8774;
                                _8781 = _8775;
                                _8782 = _8668 * mix(1.0, _8776, spvNMin(_942, _11._m0[_8584]._m8));
                            }
                            else
                            {
                                _8780 = _8573;
                                _8781 = _8575;
                                _8782 = _8668;
                            }
                            vec3 _8951;
                            vec3 _8952;
                            SPIRV_CROSS_BRANCH
                            if (_11._m0[_8584]._m3 < 0.0)
                            {
                                float _8868 = dot(_8629, _846);
                                vec3 _8949;
                                vec3 _8950;
                                if (_8635 > 0.0)
                                {
                                    vec3 _8873 = _11._m0[_8584]._m1.xyz * (_8782 * _6._m0[0u]);
                                    vec3 _8880 = vec3(fma((2.0 * _8631) * _8631, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                    float _8901 = (_894 + 1.0) * 0.5;
                                    float _8902 = _894 * _894;
                                    float _8910 = _8901 * _8901;
                                    float _8924 = sqrt(fma(-_845, 0.89999997615814208984375, 1.0));
                                    float _8927 = spvNMax(0.001000000047497451305389404296875, clamp(_8902 / _8924, 0.0, 1.0));
                                    float _8929 = spvNMax(0.001000000047497451305389404296875, _8902 * _8924);
                                    float _8940 = fma(_8633, _8633, ((_8868 * _8868) / (_8927 * _8927)) + (fma(-_8633, _8633, fma(-_8868, _8868, 1.0)) / (_8929 * _8929)));
                                    _8949 = fma(_8873, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _8631), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_8635, sqrt(fma(fma(-_8164, _8910, _8164), _8164, _8910)), _8164 * sqrt(fma(fma(-_8635, _8910, _8635), _8635, _8910)))) * (1.0 / ((((_8927 * _8929) * 3.1415927410125732421875) * _8940) * _8940))), _8568);
                                    _8950 = fma(_8873, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_8880 * pow(spvNMax(abs(1.0 - _8635), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_8880 * pow(spvNMax(abs(1.0 - _8164), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _8571);
                                }
                                else
                                {
                                    _8949 = _8568;
                                    _8950 = _8571;
                                }
                                _8951 = _8949;
                                _8952 = _8950;
                            }
                            else
                            {
                                float _8786 = dot(_8629, _846);
                                vec3 _8866;
                                vec3 _8867;
                                if (_8635 > 0.0)
                                {
                                    vec3 _8790 = _11._m0[_8584]._m1.xyz * _8782;
                                    vec3 _8797 = vec3(fma((2.0 * _8631) * _8631, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                    float _8818 = (_894 + 1.0) * 0.5;
                                    float _8819 = _894 * _894;
                                    float _8827 = _8818 * _8818;
                                    float _8841 = sqrt(fma(-_845, 0.89999997615814208984375, 1.0));
                                    float _8844 = spvNMax(0.001000000047497451305389404296875, clamp(_8819 / _8841, 0.0, 1.0));
                                    float _8846 = spvNMax(0.001000000047497451305389404296875, _8819 * _8841);
                                    float _8857 = fma(_8633, _8633, ((_8786 * _8786) / (_8844 * _8844)) + (fma(-_8633, _8633, fma(-_8786, _8786, 1.0)) / (_8846 * _8846)));
                                    _8866 = fma(_8790, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _8631), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_8635, sqrt(fma(fma(-_8164, _8827, _8164), _8164, _8827)), _8164 * sqrt(fma(fma(-_8635, _8827, _8635), _8635, _8827)))) * (1.0 / ((((_8844 * _8846) * 3.1415927410125732421875) * _8857) * _8857))), _8568);
                                    _8867 = fma(_8790, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_8797 * pow(spvNMax(abs(1.0 - _8635), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_8797 * pow(spvNMax(abs(1.0 - _8164), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _8571);
                                }
                                else
                                {
                                    _8866 = _8568;
                                    _8867 = _8571;
                                }
                                _8951 = _8866;
                                _8952 = _8867;
                            }
                            _8953 = _8951;
                            _8954 = _8952;
                            _8955 = _8780;
                            _8956 = _8781;
                        }
                        else
                        {
                            _8953 = _8568;
                            _8954 = _8571;
                            _8955 = _8573;
                            _8956 = _8575;
                        }
                        _8569 = _8953;
                        _8572 = _8954;
                        _8574 = _8955;
                        _8576 = _8956;
                    }
                    else
                    {
                        _8569 = _8568;
                        _8572 = _8571;
                        _8574 = _8573;
                        _8576 = _8575;
                    }
                }
                vec3 _8958;
                vec3 _8961;
                _8958 = _8568;
                _8961 = _8571;
                vec3 _8959;
                vec3 _8962;
                float _8964;
                bool _8966;
                float _8963 = _8573;
                bool _8965 = _8575;
                uint _8967 = _8577;
                for (; _8967 < _8162; _8958 = _8959, _8961 = _8962, _8963 = _8964, _8965 = _8966, _8967++)
                {
                    uint _8974 = uint(_10._m0[_8967]);
                    int _9003 = int(_13._m0[_8974]._m1 >> 1u) - 1;
                    if (((_13._m0[_8974]._m4 & 16777215u) & (1u << (_617 & 31u))) != 0u)
                    {
                        vec3 _9014 = _13._m0[_8974]._m6 * vec4(_859, 1.0);
                        vec3 _9439;
                        vec3 _9440;
                        float _9441;
                        bool _9442;
                        if (all(lessThan(abs(_9014 - vec3(0.5)), vec3(0.5))))
                        {
                            vec3 _9021 = _861 + _13._m0[_8974]._m9;
                            vec3 _9025 = _9021 * inversesqrt(spvNMax(dot(_9021, _9021), 1.0000000133514319600180897396058e-10));
                            float _9027 = clamp(dot(_13._m0[_8974]._m9, _9025), 0.0, 1.0);
                            float _9029 = clamp(dot(_673, _9025), 0.0, 1.0);
                            float _9031 = clamp(dot(_673, _13._m0[_8974]._m9), 0.0, 1.0);
                            int _9032 = int(_13._m0[_8974]._m4 >> 24u);
                            float _9033 = _9014.z;
                            vec3 _9072;
                            if (_9033 < _13._m0[_8974]._m2.x)
                            {
                                float _9060 = _9033 * _13._m0[_8974]._m2.z;
                                float _9063 = _9060 * _9060;
                                vec3 _9071;
                                _9071.z = dot(_408[_9032], vec4(_9060, _9063, smoothstep(0.0, 1.0, _9060), (_9063 * _9060) * fma(_9060, fma(_9060, 6.0, -15.0), 10.0)));
                                _9072 = _9071;
                            }
                            else
                            {
                                vec3 _9058;
                                if (_9033 > _13._m0[_8974]._m2.y)
                                {
                                    float _9046 = (1.0 - _9033) * _13._m0[_8974]._m2.w;
                                    float _9049 = _9046 * _9046;
                                    vec3 _9057;
                                    _9057.z = dot(_408[_9032], vec4(_9046, _9049, smoothstep(0.0, 1.0, _9046), (_9049 * _9046) * fma(_9046, fma(_9046, 6.0, -15.0), 10.0)));
                                    _9058 = _9057;
                                }
                                else
                                {
                                    _9058 = vec3(0.0, 0.0, 1.0);
                                }
                                _9072 = _9058;
                            }
                            vec2 _9073 = _9014.xy;
                            vec2 _9077 = (vec2(0.5) - abs(_9073 - vec2(0.5))) * _13._m0[_8974]._m3;
                            float _9078 = _9077.x;
                            vec3 _9095;
                            if (_9078 < 1.0)
                            {
                                float _9086 = _9078 * _9078;
                                vec3 _9094 = _9072;
                                _9094.x = dot(_408[_9032], vec4(_9078, _9086, smoothstep(0.0, 1.0, _9078), (_9086 * _9078) * fma(_9078, fma(_9078, 6.0, -15.0), 10.0)));
                                _9095 = _9094;
                            }
                            else
                            {
                                vec3 _9083 = _9072;
                                _9083.x = 1.0;
                                _9095 = _9083;
                            }
                            float _9096 = _9077.y;
                            vec3 _9113;
                            if (_9096 < 1.0)
                            {
                                float _9104 = _9096 * _9096;
                                vec3 _9112 = _9095;
                                _9112.y = dot(_408[_9032], vec4(_9096, _9104, smoothstep(0.0, 1.0, _9096), (_9104 * _9096) * fma(_9096, fma(_9096, 6.0, -15.0), 10.0)));
                                _9113 = _9112;
                            }
                            else
                            {
                                vec3 _9101 = _9095;
                                _9101.y = 1.0;
                                _9113 = _9101;
                            }
                            float _9119 = _9031 * ((_9113.x * _9113.y) * _9113.z);
                            float _9225;
                            bool _9226;
                            float _9227;
                            if ((_13._m0[_8974]._m8 & 1u) != 0u)
                            {
                                uint _9122 = uint(int(_13._m0[_8974]._m8 >> 2u));
                                float _9219;
                                bool _9220;
                                float _9221;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_9031 <= 0.0) && (!_857))
                                    {
                                        _9219 = _8963;
                                        _9220 = _8965;
                                        _9221 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _9154 = _22._m0[_9122]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_9031)))) * _22._m0[_9122]._m4)), 1.0);
                                        vec2 _9157 = (_9154.xy * 0.5) + vec2(0.5);
                                        _9157.y = 1.0 - _9157.y;
                                        float _9166 = ((_9154.z - _22._m0[_9122]._m5.y) / _22._m0[_9122]._m5.x) / _22._m0[_9122]._m6;
                                        float _9171 = _8965 ? _8963 : 6.283185482025146484375;
                                        float _9172 = _935 * _9171;
                                        vec2 _9173 = _22._m0[_9122]._m1 + _21._m33;
                                        vec2 _9176 = (_22._m0[_9122]._m1 + vec2(_22._m0[_9122]._m2)) - _21._m33;
                                        float _9178;
                                        _9178 = 0.0;
                                        for (int _9181 = 0; _9181 < 12; )
                                        {
                                            float _9186 = float(uint(_9181));
                                            float _9189 = sqrt(_9186 + 0.5) * 0.288675129413604736328125;
                                            float _9190 = fma(_9186, 2.3999631404876708984375, _9172);
                                            vec2 _9198 = clamp(fma((vec3(cos(_9190), sin(_9190), _9189).xy * _9189) * 2.5, _21._m33, _9157), _9173, _9176);
                                            vec2 _9201 = fract(fma(vec2(1.0) / _21._m33, _9198, vec2(0.5)));
                                            vec4 _9207 = vec4(lessThan(vec4(_9166), textureGather(sampler2D(_23, _14), _9198)));
                                            float _9210 = _9201.x;
                                            _9178 += clamp(mix(mix(_9207.w, _9207.z, _9210), mix(_9207.x, _9207.y, _9210), _9201.y), 0.0, 1.0);
                                            _9181++;
                                            continue;
                                        }
                                        _9219 = _9171;
                                        _9220 = _8965 ? _8965 : true;
                                        _9221 = _9178 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                _9225 = _9219;
                                _9226 = _9220;
                                _9227 = _9119 * mix(1.0, _9221, spvNMin(_942, _13._m0[_8974]._m5));
                            }
                            else
                            {
                                _9225 = _8963;
                                _9226 = _8965;
                                _9227 = _9119;
                            }
                            vec3 _9268;
                            if (_9003 >= 0)
                            {
                                uint _9232 = gl_SubgroupInvocationID & 3u;
                                vec2 _9238 = (subgroupQuadSwapHorizontal(_9073) - _9073) * (((_9232 & 1u) != 0u) ? (-1.0) : 1.0);
                                vec2 _9244 = (subgroupQuadSwapVertical(_9073) - _9073) * (((_9232 & 2u) != 0u) ? (-1.0) : 1.0);
                                vec2 _9248 = mix(_9238, vec2(0.0), bvec2(any(isnan(_9238))));
                                vec2 _9252 = mix(_9244, vec2(0.0), bvec2(any(isnan(_9244))));
                                bvec2 _9261 = bvec2(any(greaterThan(abs(vec4(_9248, _9252)), vec4(0.015625))));
                                int _101 = _9003;
                                _9268 = _13._m0[_8974]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_101], _7)), _9073, mix(_9248, vec2(0.0), _9261), mix(_9252, vec2(0.0), _9261)).xyz;
                            }
                            else
                            {
                                _9268 = _13._m0[_8974]._m0;
                            }
                            vec3 _9437;
                            vec3 _9438;
                            SPIRV_CROSS_BRANCH
                            if ((_13._m0[_8974]._m1 & 1u) != 0u)
                            {
                                float _9354 = dot(_9025, _846);
                                vec3 _9435;
                                vec3 _9436;
                                if (_9031 > 0.0)
                                {
                                    vec3 _9359 = _9268 * (_9227 * _6._m0[0u]);
                                    vec3 _9366 = vec3(fma((2.0 * _9027) * _9027, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                    float _9387 = (_894 + 1.0) * 0.5;
                                    float _9388 = _894 * _894;
                                    float _9396 = _9387 * _9387;
                                    float _9410 = sqrt(fma(-_845, 0.89999997615814208984375, 1.0));
                                    float _9413 = spvNMax(0.001000000047497451305389404296875, clamp(_9388 / _9410, 0.0, 1.0));
                                    float _9415 = spvNMax(0.001000000047497451305389404296875, _9388 * _9410);
                                    float _9426 = fma(_9029, _9029, ((_9354 * _9354) / (_9413 * _9413)) + (fma(-_9029, _9029, fma(-_9354, _9354, 1.0)) / (_9415 * _9415)));
                                    _9435 = fma(_9359, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _9027), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_9031, sqrt(fma(fma(-_8164, _9396, _8164), _8164, _9396)), _8164 * sqrt(fma(fma(-_9031, _9396, _9031), _9031, _9396)))) * (1.0 / ((((_9413 * _9415) * 3.1415927410125732421875) * _9426) * _9426))), _8958);
                                    _9436 = fma(_9359, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_9366 * pow(spvNMax(abs(1.0 - _9031), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_9366 * pow(spvNMax(abs(1.0 - _8164), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _8961);
                                }
                                else
                                {
                                    _9435 = _8958;
                                    _9436 = _8961;
                                }
                                _9437 = _9435;
                                _9438 = _9436;
                            }
                            else
                            {
                                float _9272 = dot(_9025, _846);
                                vec3 _9352;
                                vec3 _9353;
                                if (_9031 > 0.0)
                                {
                                    vec3 _9276 = _9268 * _9227;
                                    vec3 _9283 = vec3(fma((2.0 * _9027) * _9027, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                    float _9304 = (_894 + 1.0) * 0.5;
                                    float _9305 = _894 * _894;
                                    float _9313 = _9304 * _9304;
                                    float _9327 = sqrt(fma(-_845, 0.89999997615814208984375, 1.0));
                                    float _9330 = spvNMax(0.001000000047497451305389404296875, clamp(_9305 / _9327, 0.0, 1.0));
                                    float _9332 = spvNMax(0.001000000047497451305389404296875, _9305 * _9327);
                                    float _9343 = fma(_9029, _9029, ((_9272 * _9272) / (_9330 * _9330)) + (fma(-_9029, _9029, fma(-_9272, _9272, 1.0)) / (_9332 * _9332)));
                                    _9352 = fma(_9276, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _9027), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_9031, sqrt(fma(fma(-_8164, _9313, _8164), _8164, _9313)), _8164 * sqrt(fma(fma(-_9031, _9313, _9031), _9031, _9313)))) * (1.0 / ((((_9330 * _9332) * 3.1415927410125732421875) * _9343) * _9343))), _8958);
                                    _9353 = fma(_9276, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_9283 * pow(spvNMax(abs(1.0 - _9031), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_9283 * pow(spvNMax(abs(1.0 - _8164), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _8961);
                                }
                                else
                                {
                                    _9352 = _8958;
                                    _9353 = _8961;
                                }
                                _9437 = _9352;
                                _9438 = _9353;
                            }
                            _9439 = _9437;
                            _9440 = _9438;
                            _9441 = _9225;
                            _9442 = _9226;
                        }
                        else
                        {
                            _9439 = _8958;
                            _9440 = _8961;
                            _9441 = _8963;
                            _9442 = _8965;
                        }
                        _8959 = _9439;
                        _8962 = _9440;
                        _8964 = _9441;
                        _8966 = _9442;
                    }
                    else
                    {
                        _8959 = _8958;
                        _8962 = _8961;
                        _8964 = _8963;
                        _8966 = _8965;
                    }
                }
                _9443 = _8958;
                _9444 = _8961;
            }
            else
            {
                vec3 _8145;
                vec3 _8146;
                if (_674)
                {
                    uvec4 _6531 = uvec4(_9._m0[uint(_926)]);
                    uint _6532 = _6531.x;
                    uint _6533 = _6531.y;
                    uint _6536 = ((_6533 >> 0u) & 4095u) + _6532;
                    uint _6539 = ((_6533 >> 12u) & 4095u) + _6536;
                    uint _6543 = ((_6531.z >> 0u) & 1023u) + _6539;
                    float _6545 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                    vec3 _6547;
                    vec3 _6550;
                    float _6552;
                    bool _6554;
                    uint _6556;
                    _6547 = vec3(0.0);
                    _6550 = vec3(0.0);
                    _6552 = _398;
                    _6554 = false;
                    _6556 = _6532;
                    vec3 _6548;
                    vec3 _6551;
                    float _6553;
                    bool _6555;
                    for (; _6556 < _6536; _6547 = _6548, _6550 = _6551, _6552 = _6553, _6554 = _6555, _6556++)
                    {
                        uint _6563 = uint(_10._m0[_6556]);
                        float _6581 = abs(_11._m0[_6563]._m5);
                        bool _6585 = _11._m0[_6563]._m5 < 0.0;
                        if ((_11._m0[_6563]._m6 & (1u << (_617 & 31u))) != 0u)
                        {
                            vec3 _6596 = _11._m0[_6563]._m0.xyz - _859;
                            float _6597 = dot(_6596, _6596);
                            vec3 _6600 = _6596 * inversesqrt(spvNMax(_6597, 1.0000000133514319600180897396058e-10));
                            float _6601 = _11._m0[_6563]._m0.w * _11._m0[_6563]._m0.w;
                            vec3 _7023;
                            vec3 _7024;
                            float _7025;
                            bool _7026;
                            if (_6597 < (1.0 / _6601))
                            {
                                vec3 _6606 = _861 + _6600;
                                vec3 _6610 = _6606 * inversesqrt(spvNMax(dot(_6606, _6606), 1.0000000133514319600180897396058e-10));
                                float _6612 = clamp(dot(_6600, _6610), 0.0, 1.0);
                                float _6614 = clamp(dot(_673, _6610), 0.0, 1.0);
                                float _6615 = dot(_673, _6600);
                                float _6616 = clamp(_6615, 0.0, 1.0);
                                float _6617 = _6597 * _6601;
                                float _6623 = pow(spvNMax(abs(clamp(fma(-_6617, _6617, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_6563]._m4);
                                float _6633;
                                if (_6585)
                                {
                                    _6633 = _6623 * fma(4.0, _6601, _6581);
                                }
                                else
                                {
                                    _6633 = _6623 * ((1.0 / spvNMax(_6597, 9.9999997473787516355514526367188e-05)) + _6581);
                                }
                                float _6635 = 0.079577468335628509521484375 * (_6616 * _6633);
                                float _6802;
                                bool _6803;
                                float _6804;
                                float _6805;
                                float _6806;
                                if ((_11._m0[_6563]._m7 & 1u) != 0u)
                                {
                                    uint _6660;
                                    do
                                    {
                                        vec3 _6640 = -_6600;
                                        float _6641 = dot(_6640, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                        float _6642 = dot(_6640, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                        float _6643 = dot(_6640, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                        float _6647 = spvNMax(spvNMax(_6641, _6642), spvNMax(_6643, dot(_6640, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                        if (_6647 == _6641)
                                        {
                                            _6660 = 0u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_6647 == _6642)
                                            {
                                                _6660 = 1u;
                                                break;
                                            }
                                            else
                                            {
                                                if (_6647 == _6643)
                                                {
                                                    _6660 = 2u;
                                                    break;
                                                }
                                                else
                                                {
                                                    _6660 = 3u;
                                                    break;
                                                }
                                                break; // unreachable workaround
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    uint _6662 = uint(int(_11._m0[_6563]._m7 >> 2u)) + _6660;
                                    float _6675 = sqrt(_6597);
                                    float _6765;
                                    bool _6766;
                                    float _6767;
                                    do
                                    {
                                        SPIRV_CROSS_BRANCH
                                        if ((_6615 <= 0.0) && (!_857))
                                        {
                                            _6765 = _6552;
                                            _6766 = _6554;
                                            _6767 = 0.0;
                                            break;
                                        }
                                        else
                                        {
                                            vec4 _6696 = _22._m0[_6662]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_6615)))) * (_22._m0[_6662]._m4 * _6675))), 1.0);
                                            vec3 _6700 = _6696.xyz / vec3(_6696.w);
                                            vec2 _6703 = (_6700.xy * 0.5) + vec2(0.5);
                                            _6703.y = 1.0 - _6703.y;
                                            float _6712 = (_22._m0[_6662]._m5.y / _22._m0[_6662]._m6) / (_6700.z - _22._m0[_6662]._m5.x);
                                            float _6717 = _6554 ? _6552 : 6.283185482025146484375;
                                            float _6718 = _935 * _6717;
                                            vec2 _6719 = _22._m0[_6662]._m1 + _21._m33;
                                            vec2 _6722 = (_22._m0[_6662]._m1 + vec2(_22._m0[_6662]._m2)) - _21._m33;
                                            float _6724;
                                            _6724 = 0.0;
                                            for (int _6727 = 0; _6727 < 12; )
                                            {
                                                float _6732 = float(uint(_6727));
                                                float _6735 = sqrt(_6732 + 0.5) * 0.288675129413604736328125;
                                                float _6736 = fma(_6732, 2.3999631404876708984375, _6718);
                                                vec2 _6744 = clamp(fma((vec3(cos(_6736), sin(_6736), _6735).xy * _6735) * 2.5, _21._m33, _6703), _6719, _6722);
                                                vec2 _6747 = fract(fma(vec2(1.0) / _21._m33, _6744, vec2(0.5)));
                                                vec4 _6753 = vec4(lessThan(vec4(_6712), textureGather(sampler2D(_23, _14), _6744)));
                                                float _6756 = _6747.x;
                                                _6724 += clamp(mix(mix(_6753.w, _6753.z, _6756), mix(_6753.x, _6753.y, _6756), _6747.y), 0.0, 1.0);
                                                _6727++;
                                                continue;
                                            }
                                            _6765 = _6717;
                                            _6766 = _6554 ? _6554 : true;
                                            _6767 = _6724 * 0.083333335816860198974609375;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    float _6769 = mix(1.0, _6767, spvNMin(_942, _11._m0[_6563]._m8));
                                    float _6801;
                                    SPIRV_CROSS_BRANCH
                                    if (_855 && _856)
                                    {
                                        float _6774 = _22._m0[_6662]._m4 * _6675;
                                        vec4 _6781 = _22._m0[_6662]._m0 * vec4(_859 - (_673 * _6774), 1.0);
                                        float _6782 = _6781.w;
                                        _6801 = fma(_6774, clamp(dot(-_673, _6600), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_6781.xyz / vec3(_6782)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_6662]._m6, _6782))) * 1000.0;
                                    }
                                    else
                                    {
                                        _6801 = 0.0;
                                    }
                                    _6802 = _6765;
                                    _6803 = _6766;
                                    _6804 = _6635 * _6769;
                                    _6805 = _6801;
                                    _6806 = _6769;
                                }
                                else
                                {
                                    _6802 = _6552;
                                    _6803 = _6554;
                                    _6804 = _6635;
                                    _6805 = 0.0;
                                    _6806 = 1.0;
                                }
                                float _6847;
                                vec3 _6848;
                                SPIRV_CROSS_BRANCH
                                if (_855)
                                {
                                    vec3 _6813 = vec3(1.0) / spvNMax((_847 * vec3(0.09660939872264862060546875)) * (_848 * _853), vec3(9.9999997473787516355514526367188e-05));
                                    vec3 _6831;
                                    SPIRV_CROSS_BRANCH
                                    if (_856)
                                    {
                                        vec3 _6827 = exp2(_6813 * ((-0.4808983504772186279296875) * spvNMax(_854, _6805)));
                                        _6831 = _849 * (_6827 * fma(_6827, _6827, vec3(3.0)));
                                    }
                                    else
                                    {
                                        vec3 _6819 = exp2(_6813 * ((-0.4808983504772186279296875) * _854));
                                        _6831 = (_849 * (_6819 * fma(_6819, _6819, vec3(3.0)))) * _6806;
                                    }
                                    float _6844;
                                    if (_6585)
                                    {
                                        _6844 = _6623 * fma(4.0, _6601, _6581);
                                    }
                                    else
                                    {
                                        _6844 = _6623 * ((1.0 / spvNMax(_6597, 9.9999997473787516355514526367188e-05)) + _6581);
                                    }
                                    _6847 = 0.079577468335628509521484375 * (clamp((0.2588190734386444091796875 - _6615) * 0.631063938140869140625, 0.0, 1.0) * _6844);
                                    _6848 = _6831;
                                }
                                else
                                {
                                    _6847 = 0.0;
                                    _6848 = vec3(0.0);
                                }
                                vec3 _7021;
                                vec3 _7022;
                                SPIRV_CROSS_BRANCH
                                if (_11._m0[_6563]._m3 < 0.0)
                                {
                                    vec3 _7010;
                                    vec3 _7011;
                                    if (_6616 > 0.0)
                                    {
                                        vec3 _6940 = (_11._m0[_6563]._m1.xyz * _6804) * _6._m0[0u];
                                        vec3 _6947 = vec3(fma((2.0 * _6612) * _6612, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                        float _6968 = (_894 + 1.0) * 0.5;
                                        float _6971 = _894 * _894;
                                        float _6972 = mix(_850 * _850, _6971, _672);
                                        float _6973 = mix(_851 * _851, _6971, _672);
                                        float _6981 = _6968 * _6968;
                                        float _6993 = _6972 * _6972;
                                        float _6994 = -_6614;
                                        float _6996 = fma(fma(_6614, _6993, _6994), _6614, 1.0);
                                        float _7000 = _6973 * _6973;
                                        float _7002 = fma(fma(_6614, _7000, _6994), _6614, 1.0);
                                        _7010 = fma(_6940, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _6612), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_6616, sqrt(fma(fma(-_6545, _6981, _6545), _6545, _6981)), _6545 * sqrt(fma(fma(-_6616, _6981, _6616), _6616, _6981)))) * mix(_6993 * (0.3183098733425140380859375 / (_6996 * _6996)), _7000 * (0.3183098733425140380859375 / (_7002 * _7002)), _852)), _6547);
                                        _7011 = fma(_6940, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_6947 * pow(spvNMax(abs(1.0 - _6616), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_6947 * pow(spvNMax(abs(1.0 - _6545), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _6550);
                                    }
                                    else
                                    {
                                        _7010 = _6547;
                                        _7011 = _6550;
                                    }
                                    vec3 _7020;
                                    SPIRV_CROSS_BRANCH
                                    if (_855)
                                    {
                                        _7020 = _7011 + (((_6848 * _11._m0[_6563]._m1.xyz) * _843) * ((0.3183098733425140380859375 * _6847) * _6._m0[0u]));
                                    }
                                    else
                                    {
                                        _7020 = _7011;
                                    }
                                    _7021 = _7010;
                                    _7022 = _7020;
                                }
                                else
                                {
                                    vec3 _6926;
                                    vec3 _6927;
                                    if (_6616 > 0.0)
                                    {
                                        vec3 _6856 = (_11._m0[_6563]._m1.xyz * _6804) * 1.0;
                                        vec3 _6863 = vec3(fma((2.0 * _6612) * _6612, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                        float _6884 = (_894 + 1.0) * 0.5;
                                        float _6887 = _894 * _894;
                                        float _6888 = mix(_850 * _850, _6887, _672);
                                        float _6889 = mix(_851 * _851, _6887, _672);
                                        float _6897 = _6884 * _6884;
                                        float _6909 = _6888 * _6888;
                                        float _6910 = -_6614;
                                        float _6912 = fma(fma(_6614, _6909, _6910), _6614, 1.0);
                                        float _6916 = _6889 * _6889;
                                        float _6918 = fma(fma(_6614, _6916, _6910), _6614, 1.0);
                                        _6926 = fma(_6856, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _6612), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_6616, sqrt(fma(fma(-_6545, _6897, _6545), _6545, _6897)), _6545 * sqrt(fma(fma(-_6616, _6897, _6616), _6616, _6897)))) * mix(_6909 * (0.3183098733425140380859375 / (_6912 * _6912)), _6916 * (0.3183098733425140380859375 / (_6918 * _6918)), _852)), _6547);
                                        _6927 = fma(_6856, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_6863 * pow(spvNMax(abs(1.0 - _6616), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_6863 * pow(spvNMax(abs(1.0 - _6545), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _6550);
                                    }
                                    else
                                    {
                                        _6926 = _6547;
                                        _6927 = _6550;
                                    }
                                    vec3 _6935;
                                    SPIRV_CROSS_BRANCH
                                    if (_855)
                                    {
                                        _6935 = _6927 + (((_6848 * _11._m0[_6563]._m1.xyz) * _843) * (0.3183098733425140380859375 * _6847));
                                    }
                                    else
                                    {
                                        _6935 = _6927;
                                    }
                                    _7021 = _6926;
                                    _7022 = _6935;
                                }
                                _7023 = _7021;
                                _7024 = _7022;
                                _7025 = _6802;
                                _7026 = _6803;
                            }
                            else
                            {
                                _7023 = _6547;
                                _7024 = _6550;
                                _7025 = _6552;
                                _7026 = _6554;
                            }
                            _6548 = _7023;
                            _6551 = _7024;
                            _6553 = _7025;
                            _6555 = _7026;
                        }
                        else
                        {
                            _6548 = _6547;
                            _6551 = _6550;
                            _6553 = _6552;
                            _6555 = _6554;
                        }
                    }
                    vec3 _7028;
                    vec3 _7031;
                    float _7033;
                    bool _7035;
                    uint _7037;
                    _7028 = _6547;
                    _7031 = _6550;
                    _7033 = _6552;
                    _7035 = _6554;
                    _7037 = _6556;
                    vec3 _7029;
                    vec3 _7032;
                    float _7034;
                    bool _7036;
                    for (; _7037 < _6539; _7028 = _7029, _7031 = _7032, _7033 = _7034, _7035 = _7036, _7037++)
                    {
                        uint _7044 = uint(_10._m0[_7037]);
                        float _7057 = abs(_11._m0[_7044]._m5);
                        bool _7064 = _11._m0[_7044]._m5 < 0.0;
                        if ((_11._m0[_7044]._m6 & (1u << (_617 & 31u))) != 0u)
                        {
                            vec3 _7075 = _11._m0[_7044]._m0.xyz - _859;
                            float _7076 = dot(_7075, _7075);
                            vec3 _7079 = _7075 * inversesqrt(spvNMax(_7076, 1.0000000133514319600180897396058e-10));
                            float _7080 = _11._m0[_7044]._m0.w * _11._m0[_7044]._m0.w;
                            vec3 _7511;
                            vec3 _7512;
                            float _7513;
                            bool _7514;
                            if (_7076 < (1.0 / _7080))
                            {
                                vec3 _7085 = _861 + _7079;
                                vec3 _7089 = _7085 * inversesqrt(spvNMax(dot(_7085, _7085), 1.0000000133514319600180897396058e-10));
                                float _7091 = clamp(dot(_7079, _7089), 0.0, 1.0);
                                float _7093 = clamp(dot(_673, _7089), 0.0, 1.0);
                                float _7094 = dot(_673, _7079);
                                float _7095 = clamp(_7094, 0.0, 1.0);
                                float _7098 = dot(-_7079, normalize(_11._m0[_7044]._m2.xyz));
                                bool _7099 = _7098 > _11._m0[_7044]._m1.w;
                                float _7127;
                                if (_7099)
                                {
                                    float _7102 = _7076 * _7080;
                                    float _7108 = pow(spvNMax(abs(clamp(fma(-_7102, _7102, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_7044]._m4);
                                    float _7118;
                                    if (_7064)
                                    {
                                        _7118 = _7108 * fma(4.0, _7080, _7057);
                                    }
                                    else
                                    {
                                        _7118 = _7108 * ((1.0 / spvNMax(_7076, 9.9999997473787516355514526367188e-05)) + _7057);
                                    }
                                    float _7123 = clamp((_7098 - _11._m0[_7044]._m1.w) / spvNMax(_11._m0[_7044]._m2.w - _11._m0[_7044]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                    _7127 = _7095 * (_7118 * (_7123 * _7123));
                                }
                                else
                                {
                                    _7127 = 0.0;
                                }
                                float _7128 = 0.3183098733425140380859375 * _7127;
                                float _7271;
                                bool _7272;
                                float _7273;
                                float _7274;
                                float _7275;
                                if ((_11._m0[_7044]._m7 & 1u) != 0u)
                                {
                                    uint _7131 = uint(int(_11._m0[_7044]._m7 >> 2u));
                                    float _7144 = sqrt(_7076);
                                    float _7234;
                                    bool _7235;
                                    float _7236;
                                    do
                                    {
                                        SPIRV_CROSS_BRANCH
                                        if ((_7094 <= 0.0) && (!_857))
                                        {
                                            _7234 = _7033;
                                            _7235 = _7035;
                                            _7236 = 0.0;
                                            break;
                                        }
                                        else
                                        {
                                            vec4 _7165 = _22._m0[_7131]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_7094)))) * (_22._m0[_7131]._m4 * _7144))), 1.0);
                                            vec3 _7169 = _7165.xyz / vec3(_7165.w);
                                            vec2 _7172 = (_7169.xy * 0.5) + vec2(0.5);
                                            _7172.y = 1.0 - _7172.y;
                                            float _7181 = (_22._m0[_7131]._m5.y / _22._m0[_7131]._m6) / (_7169.z - _22._m0[_7131]._m5.x);
                                            float _7186 = _7035 ? _7033 : 6.283185482025146484375;
                                            float _7187 = _935 * _7186;
                                            vec2 _7188 = _22._m0[_7131]._m1 + _21._m33;
                                            vec2 _7191 = (_22._m0[_7131]._m1 + vec2(_22._m0[_7131]._m2)) - _21._m33;
                                            float _7193;
                                            _7193 = 0.0;
                                            for (int _7196 = 0; _7196 < 12; )
                                            {
                                                float _7201 = float(uint(_7196));
                                                float _7204 = sqrt(_7201 + 0.5) * 0.288675129413604736328125;
                                                float _7205 = fma(_7201, 2.3999631404876708984375, _7187);
                                                vec2 _7213 = clamp(fma((vec3(cos(_7205), sin(_7205), _7204).xy * _7204) * 2.5, _21._m33, _7172), _7188, _7191);
                                                vec2 _7216 = fract(fma(vec2(1.0) / _21._m33, _7213, vec2(0.5)));
                                                vec4 _7222 = vec4(lessThan(vec4(_7181), textureGather(sampler2D(_23, _14), _7213)));
                                                float _7225 = _7216.x;
                                                _7193 += clamp(mix(mix(_7222.w, _7222.z, _7225), mix(_7222.x, _7222.y, _7225), _7216.y), 0.0, 1.0);
                                                _7196++;
                                                continue;
                                            }
                                            _7234 = _7186;
                                            _7235 = _7035 ? _7035 : true;
                                            _7236 = _7193 * 0.083333335816860198974609375;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    float _7238 = mix(1.0, _7236, spvNMin(_942, _11._m0[_7044]._m8));
                                    float _7270;
                                    SPIRV_CROSS_BRANCH
                                    if (_855 && _856)
                                    {
                                        float _7243 = _22._m0[_7131]._m4 * _7144;
                                        vec4 _7250 = _22._m0[_7131]._m0 * vec4(_859 - (_673 * _7243), 1.0);
                                        float _7251 = _7250.w;
                                        _7270 = fma(_7243, clamp(dot(-_673, _7079), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_7250.xyz / vec3(_7251)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_7131]._m6, _7251))) * 1000.0;
                                    }
                                    else
                                    {
                                        _7270 = 0.0;
                                    }
                                    _7271 = _7234;
                                    _7272 = _7235;
                                    _7273 = _7128 * _7238;
                                    _7274 = _7270;
                                    _7275 = _7238;
                                }
                                else
                                {
                                    _7271 = _7033;
                                    _7272 = _7035;
                                    _7273 = _7128;
                                    _7274 = 0.0;
                                    _7275 = 1.0;
                                }
                                float _7335;
                                vec3 _7336;
                                SPIRV_CROSS_BRANCH
                                if (_855)
                                {
                                    vec3 _7282 = vec3(1.0) / spvNMax((_847 * vec3(0.09660939872264862060546875)) * (_848 * _853), vec3(9.9999997473787516355514526367188e-05));
                                    vec3 _7300;
                                    SPIRV_CROSS_BRANCH
                                    if (_856)
                                    {
                                        vec3 _7296 = exp2(_7282 * ((-0.4808983504772186279296875) * spvNMax(_854, _7274)));
                                        _7300 = _849 * (_7296 * fma(_7296, _7296, vec3(3.0)));
                                    }
                                    else
                                    {
                                        vec3 _7288 = exp2(_7282 * ((-0.4808983504772186279296875) * _854));
                                        _7300 = (_849 * (_7288 * fma(_7288, _7288, vec3(3.0)))) * _7275;
                                    }
                                    float _7333;
                                    if (_7099)
                                    {
                                        float _7308 = _7076 * _7080;
                                        float _7314 = pow(spvNMax(abs(clamp(fma(-_7308, _7308, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_7044]._m4);
                                        float _7324;
                                        if (_7064)
                                        {
                                            _7324 = _7314 * fma(4.0, _7080, _7057);
                                        }
                                        else
                                        {
                                            _7324 = _7314 * ((1.0 / spvNMax(_7076, 9.9999997473787516355514526367188e-05)) + _7057);
                                        }
                                        float _7329 = clamp((_7098 - _11._m0[_7044]._m1.w) / spvNMax(_11._m0[_7044]._m2.w - _11._m0[_7044]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                        _7333 = clamp((dot(-_673, _7079) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * (_7324 * (_7329 * _7329));
                                    }
                                    else
                                    {
                                        _7333 = 0.0;
                                    }
                                    _7335 = 0.3183098733425140380859375 * _7333;
                                    _7336 = _7300;
                                }
                                else
                                {
                                    _7335 = 0.0;
                                    _7336 = vec3(0.0);
                                }
                                vec3 _7509;
                                vec3 _7510;
                                SPIRV_CROSS_BRANCH
                                if (_11._m0[_7044]._m3 < 0.0)
                                {
                                    vec3 _7498;
                                    vec3 _7499;
                                    if (_7095 > 0.0)
                                    {
                                        vec3 _7428 = (_11._m0[_7044]._m1.xyz * _7273) * _6._m0[0u];
                                        vec3 _7435 = vec3(fma((2.0 * _7091) * _7091, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                        float _7456 = (_894 + 1.0) * 0.5;
                                        float _7459 = _894 * _894;
                                        float _7460 = mix(_850 * _850, _7459, _672);
                                        float _7461 = mix(_851 * _851, _7459, _672);
                                        float _7469 = _7456 * _7456;
                                        float _7481 = _7460 * _7460;
                                        float _7482 = -_7093;
                                        float _7484 = fma(fma(_7093, _7481, _7482), _7093, 1.0);
                                        float _7488 = _7461 * _7461;
                                        float _7490 = fma(fma(_7093, _7488, _7482), _7093, 1.0);
                                        _7498 = fma(_7428, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _7091), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_7095, sqrt(fma(fma(-_6545, _7469, _6545), _6545, _7469)), _6545 * sqrt(fma(fma(-_7095, _7469, _7095), _7095, _7469)))) * mix(_7481 * (0.3183098733425140380859375 / (_7484 * _7484)), _7488 * (0.3183098733425140380859375 / (_7490 * _7490)), _852)), _7028);
                                        _7499 = fma(_7428, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_7435 * pow(spvNMax(abs(1.0 - _7095), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_7435 * pow(spvNMax(abs(1.0 - _6545), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _7031);
                                    }
                                    else
                                    {
                                        _7498 = _7028;
                                        _7499 = _7031;
                                    }
                                    vec3 _7508;
                                    SPIRV_CROSS_BRANCH
                                    if (_855)
                                    {
                                        _7508 = _7499 + (((_7336 * _11._m0[_7044]._m1.xyz) * _843) * ((0.3183098733425140380859375 * _7335) * _6._m0[0u]));
                                    }
                                    else
                                    {
                                        _7508 = _7499;
                                    }
                                    _7509 = _7498;
                                    _7510 = _7508;
                                }
                                else
                                {
                                    vec3 _7414;
                                    vec3 _7415;
                                    if (_7095 > 0.0)
                                    {
                                        vec3 _7344 = (_11._m0[_7044]._m1.xyz * _7273) * 1.0;
                                        vec3 _7351 = vec3(fma((2.0 * _7091) * _7091, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                        float _7372 = (_894 + 1.0) * 0.5;
                                        float _7375 = _894 * _894;
                                        float _7376 = mix(_850 * _850, _7375, _672);
                                        float _7377 = mix(_851 * _851, _7375, _672);
                                        float _7385 = _7372 * _7372;
                                        float _7397 = _7376 * _7376;
                                        float _7398 = -_7093;
                                        float _7400 = fma(fma(_7093, _7397, _7398), _7093, 1.0);
                                        float _7404 = _7377 * _7377;
                                        float _7406 = fma(fma(_7093, _7404, _7398), _7093, 1.0);
                                        _7414 = fma(_7344, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _7091), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_7095, sqrt(fma(fma(-_6545, _7385, _6545), _6545, _7385)), _6545 * sqrt(fma(fma(-_7095, _7385, _7095), _7095, _7385)))) * mix(_7397 * (0.3183098733425140380859375 / (_7400 * _7400)), _7404 * (0.3183098733425140380859375 / (_7406 * _7406)), _852)), _7028);
                                        _7415 = fma(_7344, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_7351 * pow(spvNMax(abs(1.0 - _7095), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_7351 * pow(spvNMax(abs(1.0 - _6545), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _7031);
                                    }
                                    else
                                    {
                                        _7414 = _7028;
                                        _7415 = _7031;
                                    }
                                    vec3 _7423;
                                    SPIRV_CROSS_BRANCH
                                    if (_855)
                                    {
                                        _7423 = _7415 + (((_7336 * _11._m0[_7044]._m1.xyz) * _843) * (0.3183098733425140380859375 * _7335));
                                    }
                                    else
                                    {
                                        _7423 = _7415;
                                    }
                                    _7509 = _7414;
                                    _7510 = _7423;
                                }
                                _7511 = _7509;
                                _7512 = _7510;
                                _7513 = _7271;
                                _7514 = _7272;
                            }
                            else
                            {
                                _7511 = _7028;
                                _7512 = _7031;
                                _7513 = _7033;
                                _7514 = _7035;
                            }
                            _7029 = _7511;
                            _7032 = _7512;
                            _7034 = _7513;
                            _7036 = _7514;
                        }
                        else
                        {
                            _7029 = _7028;
                            _7032 = _7031;
                            _7034 = _7033;
                            _7036 = _7035;
                        }
                    }
                    vec3 _7516;
                    vec3 _7519;
                    _7516 = _7028;
                    _7519 = _7031;
                    vec3 _7517;
                    vec3 _7520;
                    float _7522;
                    bool _7524;
                    float _7521 = _7033;
                    bool _7523 = _7035;
                    uint _7525 = _7037;
                    for (; _7525 < _6543; _7516 = _7517, _7519 = _7520, _7521 = _7522, _7523 = _7524, _7525++)
                    {
                        uint _7532 = uint(_10._m0[_7525]);
                        int _7561 = int(_13._m0[_7532]._m1 >> 1u) - 1;
                        if (((_13._m0[_7532]._m4 & 16777215u) & (1u << (_617 & 31u))) != 0u)
                        {
                            vec3 _7572 = _13._m0[_7532]._m6 * vec4(_859, 1.0);
                            vec3 _8141;
                            vec3 _8142;
                            float _8143;
                            bool _8144;
                            if (all(lessThan(abs(_7572 - vec3(0.5)), vec3(0.5))))
                            {
                                vec3 _7579 = _861 + _13._m0[_7532]._m9;
                                vec3 _7583 = _7579 * inversesqrt(spvNMax(dot(_7579, _7579), 1.0000000133514319600180897396058e-10));
                                float _7585 = clamp(dot(_13._m0[_7532]._m9, _7583), 0.0, 1.0);
                                float _7587 = clamp(dot(_673, _7583), 0.0, 1.0);
                                float _7588 = dot(_673, _13._m0[_7532]._m9);
                                float _7589 = clamp(_7588, 0.0, 1.0);
                                int _7590 = int(_13._m0[_7532]._m4 >> 24u);
                                float _7591 = _7572.z;
                                bool _7593 = _7591 < _13._m0[_7532]._m2.x;
                                vec3 _7630;
                                if (_7593)
                                {
                                    float _7618 = _7591 * _13._m0[_7532]._m2.z;
                                    float _7621 = _7618 * _7618;
                                    vec3 _7629;
                                    _7629.z = dot(_408[_7590], vec4(_7618, _7621, smoothstep(0.0, 1.0, _7618), (_7621 * _7618) * fma(_7618, fma(_7618, 6.0, -15.0), 10.0)));
                                    _7630 = _7629;
                                }
                                else
                                {
                                    vec3 _7616;
                                    if (_7591 > _13._m0[_7532]._m2.y)
                                    {
                                        float _7604 = (1.0 - _7591) * _13._m0[_7532]._m2.w;
                                        float _7607 = _7604 * _7604;
                                        vec3 _7615;
                                        _7615.z = dot(_408[_7590], vec4(_7604, _7607, smoothstep(0.0, 1.0, _7604), (_7607 * _7604) * fma(_7604, fma(_7604, 6.0, -15.0), 10.0)));
                                        _7616 = _7615;
                                    }
                                    else
                                    {
                                        _7616 = vec3(0.0, 0.0, 1.0);
                                    }
                                    _7630 = _7616;
                                }
                                vec2 _7631 = _7572.xy;
                                vec2 _7635 = (vec2(0.5) - abs(_7631 - vec2(0.5))) * _13._m0[_7532]._m3;
                                float _7636 = _7635.x;
                                bool _7637 = _7636 < 1.0;
                                vec3 _7653;
                                if (_7637)
                                {
                                    float _7644 = _7636 * _7636;
                                    vec3 _7652 = _7630;
                                    _7652.x = dot(_408[_7590], vec4(_7636, _7644, smoothstep(0.0, 1.0, _7636), (_7644 * _7636) * fma(_7636, fma(_7636, 6.0, -15.0), 10.0)));
                                    _7653 = _7652;
                                }
                                else
                                {
                                    vec3 _7641 = _7630;
                                    _7641.x = 1.0;
                                    _7653 = _7641;
                                }
                                float _7654 = _7635.y;
                                bool _7655 = _7654 < 1.0;
                                vec3 _7671;
                                if (_7655)
                                {
                                    float _7662 = _7654 * _7654;
                                    vec3 _7670 = _7653;
                                    _7670.y = dot(_408[_7590], vec4(_7654, _7662, smoothstep(0.0, 1.0, _7654), (_7662 * _7654) * fma(_7654, fma(_7654, 6.0, -15.0), 10.0)));
                                    _7671 = _7670;
                                }
                                else
                                {
                                    vec3 _7659 = _7653;
                                    _7659.y = 1.0;
                                    _7671 = _7659;
                                }
                                float _7677 = _7589 * ((_7671.x * _7671.y) * _7671.z);
                                float _7814;
                                bool _7815;
                                float _7816;
                                float _7817;
                                float _7818;
                                if ((_13._m0[_7532]._m8 & 1u) != 0u)
                                {
                                    uint _7680 = uint(int(_13._m0[_7532]._m8 >> 2u));
                                    float _7777;
                                    bool _7778;
                                    float _7779;
                                    do
                                    {
                                        SPIRV_CROSS_BRANCH
                                        if ((_7588 <= 0.0) && (!_857))
                                        {
                                            _7777 = _7521;
                                            _7778 = _7523;
                                            _7779 = 0.0;
                                            break;
                                        }
                                        else
                                        {
                                            vec4 _7712 = _22._m0[_7680]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_7588)))) * _22._m0[_7680]._m4)), 1.0);
                                            vec2 _7715 = (_7712.xy * 0.5) + vec2(0.5);
                                            _7715.y = 1.0 - _7715.y;
                                            float _7724 = ((_7712.z - _22._m0[_7680]._m5.y) / _22._m0[_7680]._m5.x) / _22._m0[_7680]._m6;
                                            float _7729 = _7523 ? _7521 : 6.283185482025146484375;
                                            float _7730 = _935 * _7729;
                                            vec2 _7731 = _22._m0[_7680]._m1 + _21._m33;
                                            vec2 _7734 = (_22._m0[_7680]._m1 + vec2(_22._m0[_7680]._m2)) - _21._m33;
                                            float _7736;
                                            _7736 = 0.0;
                                            for (int _7739 = 0; _7739 < 12; )
                                            {
                                                float _7744 = float(uint(_7739));
                                                float _7747 = sqrt(_7744 + 0.5) * 0.288675129413604736328125;
                                                float _7748 = fma(_7744, 2.3999631404876708984375, _7730);
                                                vec2 _7756 = clamp(fma((vec3(cos(_7748), sin(_7748), _7747).xy * _7747) * 2.5, _21._m33, _7715), _7731, _7734);
                                                vec2 _7759 = fract(fma(vec2(1.0) / _21._m33, _7756, vec2(0.5)));
                                                vec4 _7765 = vec4(lessThan(vec4(_7724), textureGather(sampler2D(_23, _14), _7756)));
                                                float _7768 = _7759.x;
                                                _7736 += clamp(mix(mix(_7765.w, _7765.z, _7768), mix(_7765.x, _7765.y, _7768), _7759.y), 0.0, 1.0);
                                                _7739++;
                                                continue;
                                            }
                                            _7777 = _7729;
                                            _7778 = _7523 ? _7523 : true;
                                            _7779 = _7736 * 0.083333335816860198974609375;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    } while(false);
                                    float _7781 = mix(1.0, _7779, spvNMin(_942, _13._m0[_7532]._m5));
                                    float _7813;
                                    SPIRV_CROSS_BRANCH
                                    if (_855 && _856)
                                    {
                                        vec4 _7792 = _22._m0[_7680]._m0 * vec4(_859 - (_673 * _22._m0[_7680]._m4), 1.0);
                                        _7813 = fma(_22._m0[_7680]._m4, clamp(dot(-_673, _13._m0[_7532]._m9), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma(_7792.xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_7680]._m6, (_7792.z - _22._m0[_7680]._m5.y) / _22._m0[_7680]._m5.x))) * 1000.0;
                                    }
                                    else
                                    {
                                        _7813 = 0.0;
                                    }
                                    _7814 = _7777;
                                    _7815 = _7778;
                                    _7816 = _7677 * _7781;
                                    _7817 = _7813;
                                    _7818 = _7781;
                                }
                                else
                                {
                                    _7814 = _7521;
                                    _7815 = _7523;
                                    _7816 = _7677;
                                    _7817 = 0.0;
                                    _7818 = 1.0;
                                }
                                float _7924;
                                vec3 _7925;
                                SPIRV_CROSS_BRANCH
                                if (_855)
                                {
                                    vec3 _7825 = vec3(1.0) / spvNMax((_847 * vec3(0.09660939872264862060546875)) * (_848 * _853), vec3(9.9999997473787516355514526367188e-05));
                                    vec3 _7843;
                                    SPIRV_CROSS_BRANCH
                                    if (_856)
                                    {
                                        vec3 _7839 = exp2(_7825 * ((-0.4808983504772186279296875) * spvNMax(_854, _7817)));
                                        _7843 = _849 * (_7839 * fma(_7839, _7839, vec3(3.0)));
                                    }
                                    else
                                    {
                                        vec3 _7831 = exp2(_7825 * ((-0.4808983504772186279296875) * _854));
                                        _7843 = (_849 * (_7831 * fma(_7831, _7831, vec3(3.0)))) * _7818;
                                    }
                                    vec3 _7885;
                                    if (_7593)
                                    {
                                        float _7873 = _7591 * _13._m0[_7532]._m2.z;
                                        float _7876 = _7873 * _7873;
                                        vec3 _7884;
                                        _7884.z = dot(_408[_7590], vec4(_7873, _7876, smoothstep(0.0, 1.0, _7873), (_7876 * _7873) * fma(_7873, fma(_7873, 6.0, -15.0), 10.0)));
                                        _7885 = _7884;
                                    }
                                    else
                                    {
                                        vec3 _7871;
                                        if (_7591 > _13._m0[_7532]._m2.y)
                                        {
                                            float _7859 = (1.0 - _7591) * _13._m0[_7532]._m2.w;
                                            float _7862 = _7859 * _7859;
                                            vec3 _7870;
                                            _7870.z = dot(_408[_7590], vec4(_7859, _7862, smoothstep(0.0, 1.0, _7859), (_7862 * _7859) * fma(_7859, fma(_7859, 6.0, -15.0), 10.0)));
                                            _7871 = _7870;
                                        }
                                        else
                                        {
                                            _7871 = vec3(0.0, 0.0, 1.0);
                                        }
                                        _7885 = _7871;
                                    }
                                    vec3 _7901;
                                    if (_7637)
                                    {
                                        float _7892 = _7636 * _7636;
                                        vec3 _7900 = _7885;
                                        _7900.x = dot(_408[_7590], vec4(_7636, _7892, smoothstep(0.0, 1.0, _7636), (_7892 * _7636) * fma(_7636, fma(_7636, 6.0, -15.0), 10.0)));
                                        _7901 = _7900;
                                    }
                                    else
                                    {
                                        vec3 _7889 = _7885;
                                        _7889.x = 1.0;
                                        _7901 = _7889;
                                    }
                                    vec3 _7917;
                                    if (_7655)
                                    {
                                        float _7908 = _7654 * _7654;
                                        vec3 _7916 = _7901;
                                        _7916.y = dot(_408[_7590], vec4(_7654, _7908, smoothstep(0.0, 1.0, _7654), (_7908 * _7654) * fma(_7654, fma(_7654, 6.0, -15.0), 10.0)));
                                        _7917 = _7916;
                                    }
                                    else
                                    {
                                        vec3 _7905 = _7901;
                                        _7905.y = 1.0;
                                        _7917 = _7905;
                                    }
                                    _7924 = clamp((dot(-_673, _13._m0[_7532]._m9) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * ((_7917.x * _7917.y) * _7917.z);
                                    _7925 = _7843;
                                }
                                else
                                {
                                    _7924 = 0.0;
                                    _7925 = vec3(0.0);
                                }
                                vec3 _7966;
                                if (_7561 >= 0)
                                {
                                    uint _7930 = gl_SubgroupInvocationID & 3u;
                                    vec2 _7936 = (subgroupQuadSwapHorizontal(_7631) - _7631) * (((_7930 & 1u) != 0u) ? (-1.0) : 1.0);
                                    vec2 _7942 = (subgroupQuadSwapVertical(_7631) - _7631) * (((_7930 & 2u) != 0u) ? (-1.0) : 1.0);
                                    vec2 _7946 = mix(_7936, vec2(0.0), bvec2(any(isnan(_7936))));
                                    vec2 _7950 = mix(_7942, vec2(0.0), bvec2(any(isnan(_7942))));
                                    bvec2 _7959 = bvec2(any(greaterThan(abs(vec4(_7946, _7950)), vec4(0.015625))));
                                    int _97 = _7561;
                                    _7966 = _13._m0[_7532]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_97], _7)), _7631, mix(_7946, vec2(0.0), _7959), mix(_7950, vec2(0.0), _7959)).xyz;
                                }
                                else
                                {
                                    _7966 = _13._m0[_7532]._m0;
                                }
                                vec3 _8139;
                                vec3 _8140;
                                SPIRV_CROSS_BRANCH
                                if ((_13._m0[_7532]._m1 & 1u) != 0u)
                                {
                                    vec3 _8128;
                                    vec3 _8129;
                                    if (_7589 > 0.0)
                                    {
                                        vec3 _8058 = (_7966 * _7816) * _6._m0[0u];
                                        vec3 _8065 = vec3(fma((2.0 * _7585) * _7585, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                        float _8086 = (_894 + 1.0) * 0.5;
                                        float _8089 = _894 * _894;
                                        float _8090 = mix(_850 * _850, _8089, _672);
                                        float _8091 = mix(_851 * _851, _8089, _672);
                                        float _8099 = _8086 * _8086;
                                        float _8111 = _8090 * _8090;
                                        float _8112 = -_7587;
                                        float _8114 = fma(fma(_7587, _8111, _8112), _7587, 1.0);
                                        float _8118 = _8091 * _8091;
                                        float _8120 = fma(fma(_7587, _8118, _8112), _7587, 1.0);
                                        _8128 = fma(_8058, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _7585), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_7589, sqrt(fma(fma(-_6545, _8099, _6545), _6545, _8099)), _6545 * sqrt(fma(fma(-_7589, _8099, _7589), _7589, _8099)))) * mix(_8111 * (0.3183098733425140380859375 / (_8114 * _8114)), _8118 * (0.3183098733425140380859375 / (_8120 * _8120)), _852)), _7516);
                                        _8129 = fma(_8058, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_8065 * pow(spvNMax(abs(1.0 - _7589), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_8065 * pow(spvNMax(abs(1.0 - _6545), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _7519);
                                    }
                                    else
                                    {
                                        _8128 = _7516;
                                        _8129 = _7519;
                                    }
                                    vec3 _8138;
                                    SPIRV_CROSS_BRANCH
                                    if (_855)
                                    {
                                        _8138 = _8129 + (((_7925 * _7966) * _843) * ((0.3183098733425140380859375 * _7924) * _6._m0[0u]));
                                    }
                                    else
                                    {
                                        _8138 = _8129;
                                    }
                                    _8139 = _8128;
                                    _8140 = _8138;
                                }
                                else
                                {
                                    vec3 _8044;
                                    vec3 _8045;
                                    if (_7589 > 0.0)
                                    {
                                        vec3 _7974 = (_7966 * _7816) * 1.0;
                                        vec3 _7981 = vec3(fma((2.0 * _7585) * _7585, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                        float _8002 = (_894 + 1.0) * 0.5;
                                        float _8005 = _894 * _894;
                                        float _8006 = mix(_850 * _850, _8005, _672);
                                        float _8007 = mix(_851 * _851, _8005, _672);
                                        float _8015 = _8002 * _8002;
                                        float _8027 = _8006 * _8006;
                                        float _8028 = -_7587;
                                        float _8030 = fma(fma(_7587, _8027, _8028), _7587, 1.0);
                                        float _8034 = _8007 * _8007;
                                        float _8036 = fma(fma(_7587, _8034, _8028), _7587, 1.0);
                                        _8044 = fma(_7974, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _7585), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_7589, sqrt(fma(fma(-_6545, _8015, _6545), _6545, _8015)), _6545 * sqrt(fma(fma(-_7589, _8015, _7589), _7589, _8015)))) * mix(_8027 * (0.3183098733425140380859375 / (_8030 * _8030)), _8034 * (0.3183098733425140380859375 / (_8036 * _8036)), _852)), _7516);
                                        _8045 = fma(_7974, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_7981 * pow(spvNMax(abs(1.0 - _7589), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_7981 * pow(spvNMax(abs(1.0 - _6545), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _7519);
                                    }
                                    else
                                    {
                                        _8044 = _7516;
                                        _8045 = _7519;
                                    }
                                    vec3 _8053;
                                    SPIRV_CROSS_BRANCH
                                    if (_855)
                                    {
                                        _8053 = _8045 + (((_7925 * _7966) * _843) * (0.3183098733425140380859375 * _7924));
                                    }
                                    else
                                    {
                                        _8053 = _8045;
                                    }
                                    _8139 = _8044;
                                    _8140 = _8053;
                                }
                                _8141 = _8139;
                                _8142 = _8140;
                                _8143 = _7814;
                                _8144 = _7815;
                            }
                            else
                            {
                                _8141 = _7516;
                                _8142 = _7519;
                                _8143 = _7521;
                                _8144 = _7523;
                            }
                            _7517 = _8141;
                            _7520 = _8142;
                            _7522 = _8143;
                            _7524 = _8144;
                        }
                        else
                        {
                            _7517 = _7516;
                            _7520 = _7519;
                            _7522 = _7521;
                            _7524 = _7523;
                        }
                    }
                    _8145 = _7516;
                    _8146 = _7519;
                }
                else
                {
                    vec3 _6526;
                    vec3 _6527;
                    if (_615 == 4u)
                    {
                        uvec4 _5024 = uvec4(_9._m0[uint(_926)]);
                        uint _5025 = _5024.x;
                        uint _5026 = _5024.y;
                        uint _5029 = ((_5026 >> 0u) & 4095u) + _5025;
                        uint _5032 = ((_5026 >> 12u) & 4095u) + _5029;
                        uint _5036 = ((_5024.z >> 0u) & 1023u) + _5032;
                        float _5038 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                        vec3 _5040;
                        vec3 _5043;
                        float _5045;
                        bool _5047;
                        uint _5049;
                        _5040 = vec3(0.0);
                        _5043 = vec3(0.0);
                        _5045 = _398;
                        _5047 = false;
                        _5049 = _5025;
                        vec3 _5041;
                        vec3 _5044;
                        float _5046;
                        bool _5048;
                        for (; _5049 < _5029; _5040 = _5041, _5043 = _5044, _5045 = _5046, _5047 = _5048, _5049++)
                        {
                            uint _5056 = uint(_10._m0[_5049]);
                            float _5074 = abs(_11._m0[_5056]._m5);
                            bool _5078 = _11._m0[_5056]._m5 < 0.0;
                            if ((_11._m0[_5056]._m6 & (1u << (_617 & 31u))) != 0u)
                            {
                                vec3 _5089 = _11._m0[_5056]._m0.xyz - _859;
                                float _5090 = dot(_5089, _5089);
                                vec3 _5093 = _5089 * inversesqrt(spvNMax(_5090, 1.0000000133514319600180897396058e-10));
                                float _5094 = _11._m0[_5056]._m0.w * _11._m0[_5056]._m0.w;
                                vec3 _5482;
                                vec3 _5483;
                                float _5484;
                                bool _5485;
                                if (_5090 < (1.0 / _5094))
                                {
                                    vec3 _5099 = _861 + _5093;
                                    vec3 _5103 = _5099 * inversesqrt(spvNMax(dot(_5099, _5099), 1.0000000133514319600180897396058e-10));
                                    float _5105 = clamp(dot(_5093, _5103), 0.0, 1.0);
                                    float _5107 = clamp(dot(_673, _5103), 0.0, 1.0);
                                    float _5108 = dot(_673, _5093);
                                    float _5109 = clamp(_5108, 0.0, 1.0);
                                    float _5110 = _5090 * _5094;
                                    float _5116 = pow(spvNMax(abs(clamp(fma(-_5110, _5110, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_5056]._m4);
                                    float _5126;
                                    if (_5078)
                                    {
                                        _5126 = _5116 * fma(4.0, _5094, _5074);
                                    }
                                    else
                                    {
                                        _5126 = _5116 * ((1.0 / spvNMax(_5090, 9.9999997473787516355514526367188e-05)) + _5074);
                                    }
                                    float _5128 = 0.079577468335628509521484375 * (_5109 * _5126);
                                    float _5294;
                                    bool _5295;
                                    float _5296;
                                    float _5297;
                                    float _5298;
                                    if ((_11._m0[_5056]._m7 & 1u) != 0u)
                                    {
                                        uint _5153;
                                        do
                                        {
                                            vec3 _5133 = -_5093;
                                            float _5134 = dot(_5133, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                            float _5135 = dot(_5133, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                            float _5136 = dot(_5133, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                            float _5140 = spvNMax(spvNMax(_5134, _5135), spvNMax(_5136, dot(_5133, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                            if (_5140 == _5134)
                                            {
                                                _5153 = 0u;
                                                break;
                                            }
                                            else
                                            {
                                                if (_5140 == _5135)
                                                {
                                                    _5153 = 1u;
                                                    break;
                                                }
                                                else
                                                {
                                                    if (_5140 == _5136)
                                                    {
                                                        _5153 = 2u;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        _5153 = 3u;
                                                        break;
                                                    }
                                                    break; // unreachable workaround
                                                }
                                                break; // unreachable workaround
                                            }
                                            break; // unreachable workaround
                                        } while(false);
                                        uint _5155 = uint(int(_11._m0[_5056]._m7 >> 2u)) + _5153;
                                        float _5168 = sqrt(_5090);
                                        float _5258;
                                        bool _5259;
                                        float _5260;
                                        do
                                        {
                                            SPIRV_CROSS_BRANCH
                                            if ((_5108 <= 0.0) && (!_857))
                                            {
                                                _5258 = _5045;
                                                _5259 = _5047;
                                                _5260 = 0.0;
                                                break;
                                            }
                                            else
                                            {
                                                vec4 _5189 = _22._m0[_5155]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_5108)))) * (_22._m0[_5155]._m4 * _5168))), 1.0);
                                                vec3 _5193 = _5189.xyz / vec3(_5189.w);
                                                vec2 _5196 = (_5193.xy * 0.5) + vec2(0.5);
                                                _5196.y = 1.0 - _5196.y;
                                                float _5205 = (_22._m0[_5155]._m5.y / _22._m0[_5155]._m6) / (_5193.z - _22._m0[_5155]._m5.x);
                                                float _5210 = _5047 ? _5045 : 6.283185482025146484375;
                                                float _5211 = _935 * _5210;
                                                vec2 _5212 = _22._m0[_5155]._m1 + _21._m33;
                                                vec2 _5215 = (_22._m0[_5155]._m1 + vec2(_22._m0[_5155]._m2)) - _21._m33;
                                                float _5217;
                                                _5217 = 0.0;
                                                for (int _5220 = 0; _5220 < 12; )
                                                {
                                                    float _5225 = float(uint(_5220));
                                                    float _5228 = sqrt(_5225 + 0.5) * 0.288675129413604736328125;
                                                    float _5229 = fma(_5225, 2.3999631404876708984375, _5211);
                                                    vec2 _5237 = clamp(fma((vec3(cos(_5229), sin(_5229), _5228).xy * _5228) * 2.5, _21._m33, _5196), _5212, _5215);
                                                    vec2 _5240 = fract(fma(vec2(1.0) / _21._m33, _5237, vec2(0.5)));
                                                    vec4 _5246 = vec4(lessThan(vec4(_5205), textureGather(sampler2D(_23, _14), _5237)));
                                                    float _5249 = _5240.x;
                                                    _5217 += clamp(mix(mix(_5246.w, _5246.z, _5249), mix(_5246.x, _5246.y, _5249), _5240.y), 0.0, 1.0);
                                                    _5220++;
                                                    continue;
                                                }
                                                _5258 = _5210;
                                                _5259 = _5047 ? _5047 : true;
                                                _5260 = _5217 * 0.083333335816860198974609375;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        } while(false);
                                        float _5262 = mix(1.0, _5260, spvNMin(_942, _11._m0[_5056]._m8));
                                        float _5293;
                                        SPIRV_CROSS_BRANCH
                                        if (_856)
                                        {
                                            float _5266 = _22._m0[_5155]._m4 * _5168;
                                            vec4 _5273 = _22._m0[_5155]._m0 * vec4(_859 - (_673 * _5266), 1.0);
                                            float _5274 = _5273.w;
                                            _5293 = fma(_5266, clamp(dot(-_673, _5093), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_5273.xyz / vec3(_5274)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_5155]._m6, _5274))) * 1000.0;
                                        }
                                        else
                                        {
                                            _5293 = 0.0;
                                        }
                                        _5294 = _5258;
                                        _5295 = _5259;
                                        _5296 = _5128 * _5262;
                                        _5297 = _5293;
                                        _5298 = _5262;
                                    }
                                    else
                                    {
                                        _5294 = _5045;
                                        _5295 = _5047;
                                        _5296 = _5128;
                                        _5297 = 0.0;
                                        _5298 = 1.0;
                                    }
                                    vec3 _5303 = vec3(1.0) / spvNMax((_847 * vec3(0.09660939872264862060546875)) * (_848 * _853), vec3(9.9999997473787516355514526367188e-05));
                                    vec3 _5321;
                                    SPIRV_CROSS_BRANCH
                                    if (_856)
                                    {
                                        vec3 _5317 = exp2(_5303 * ((-0.4808983504772186279296875) * spvNMax(_854, _5297)));
                                        _5321 = _849 * (_5317 * fma(_5317, _5317, vec3(3.0)));
                                    }
                                    else
                                    {
                                        vec3 _5309 = exp2(_5303 * ((-0.4808983504772186279296875) * _854));
                                        _5321 = (_849 * (_5309 * fma(_5309, _5309, vec3(3.0)))) * _5298;
                                    }
                                    float _5334;
                                    if (_5078)
                                    {
                                        _5334 = _5116 * fma(4.0, _5094, _5074);
                                    }
                                    else
                                    {
                                        _5334 = _5116 * ((1.0 / spvNMax(_5090, 9.9999997473787516355514526367188e-05)) + _5074);
                                    }
                                    float _5335 = clamp((0.2588190734386444091796875 - _5108) * 0.631063938140869140625, 0.0, 1.0) * _5334;
                                    vec3 _5480;
                                    vec3 _5481;
                                    SPIRV_CROSS_BRANCH
                                    if (_11._m0[_5056]._m3 < 0.0)
                                    {
                                        vec3 _5472;
                                        vec3 _5473;
                                        if (_5109 > 0.0)
                                        {
                                            vec3 _5413 = (_11._m0[_5056]._m1.xyz * _5296) * _6._m0[0u];
                                            vec3 _5420 = vec3(fma((2.0 * _5105) * _5105, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                            float _5441 = (_894 + 1.0) * 0.5;
                                            float _5442 = _894 * _894;
                                            float _5450 = _5441 * _5441;
                                            float _5462 = _5442 * _5442;
                                            float _5465 = fma(fma(_5107, _5462, -_5107), _5107, 1.0);
                                            _5472 = fma(_5413, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _5105), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_5109, sqrt(fma(fma(-_5038, _5450, _5038), _5038, _5450)), _5038 * sqrt(fma(fma(-_5109, _5450, _5109), _5109, _5450)))) * (_5462 * (0.3183098733425140380859375 / (_5465 * _5465)))), _5040);
                                            _5473 = fma(_5413, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_5420 * pow(spvNMax(abs(1.0 - _5109), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_5420 * pow(spvNMax(abs(1.0 - _5038), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _5043);
                                        }
                                        else
                                        {
                                            _5472 = _5040;
                                            _5473 = _5043;
                                        }
                                        _5480 = _5472;
                                        _5481 = _5473 + (((_5321 * _11._m0[_5056]._m1.xyz) * _843) * ((_5335 * 0.0253302939236164093017578125) * _6._m0[0u]));
                                    }
                                    else
                                    {
                                        vec3 _5402;
                                        vec3 _5403;
                                        if (_5109 > 0.0)
                                        {
                                            vec3 _5343 = (_11._m0[_5056]._m1.xyz * _5296) * 1.0;
                                            vec3 _5350 = vec3(fma((2.0 * _5105) * _5105, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                            float _5371 = (_894 + 1.0) * 0.5;
                                            float _5372 = _894 * _894;
                                            float _5380 = _5371 * _5371;
                                            float _5392 = _5372 * _5372;
                                            float _5395 = fma(fma(_5107, _5392, -_5107), _5107, 1.0);
                                            _5402 = fma(_5343, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _5105), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_5109, sqrt(fma(fma(-_5038, _5380, _5038), _5038, _5380)), _5038 * sqrt(fma(fma(-_5109, _5380, _5109), _5109, _5380)))) * (_5392 * (0.3183098733425140380859375 / (_5395 * _5395)))), _5040);
                                            _5403 = fma(_5343, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_5350 * pow(spvNMax(abs(1.0 - _5109), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_5350 * pow(spvNMax(abs(1.0 - _5038), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _5043);
                                        }
                                        else
                                        {
                                            _5402 = _5040;
                                            _5403 = _5043;
                                        }
                                        _5480 = _5402;
                                        _5481 = _5403 + (((_5321 * _11._m0[_5056]._m1.xyz) * _843) * (_5335 * 0.0253302939236164093017578125));
                                    }
                                    _5482 = _5480;
                                    _5483 = _5481;
                                    _5484 = _5294;
                                    _5485 = _5295;
                                }
                                else
                                {
                                    _5482 = _5040;
                                    _5483 = _5043;
                                    _5484 = _5045;
                                    _5485 = _5047;
                                }
                                _5041 = _5482;
                                _5044 = _5483;
                                _5046 = _5484;
                                _5048 = _5485;
                            }
                            else
                            {
                                _5041 = _5040;
                                _5044 = _5043;
                                _5046 = _5045;
                                _5048 = _5047;
                            }
                        }
                        vec3 _5487;
                        vec3 _5490;
                        float _5492;
                        bool _5494;
                        uint _5496;
                        _5487 = _5040;
                        _5490 = _5043;
                        _5492 = _5045;
                        _5494 = _5047;
                        _5496 = _5049;
                        vec3 _5488;
                        vec3 _5491;
                        float _5493;
                        bool _5495;
                        for (; _5496 < _5032; _5487 = _5488, _5490 = _5491, _5492 = _5493, _5494 = _5495, _5496++)
                        {
                            uint _5503 = uint(_10._m0[_5496]);
                            float _5516 = abs(_11._m0[_5503]._m5);
                            bool _5523 = _11._m0[_5503]._m5 < 0.0;
                            if ((_11._m0[_5503]._m6 & (1u << (_617 & 31u))) != 0u)
                            {
                                vec3 _5534 = _11._m0[_5503]._m0.xyz - _859;
                                float _5535 = dot(_5534, _5534);
                                vec3 _5538 = _5534 * inversesqrt(spvNMax(_5535, 1.0000000133514319600180897396058e-10));
                                float _5539 = _11._m0[_5503]._m0.w * _11._m0[_5503]._m0.w;
                                vec3 _5936;
                                vec3 _5937;
                                float _5938;
                                bool _5939;
                                if (_5535 < (1.0 / _5539))
                                {
                                    vec3 _5544 = _861 + _5538;
                                    vec3 _5548 = _5544 * inversesqrt(spvNMax(dot(_5544, _5544), 1.0000000133514319600180897396058e-10));
                                    float _5550 = clamp(dot(_5538, _5548), 0.0, 1.0);
                                    float _5552 = clamp(dot(_673, _5548), 0.0, 1.0);
                                    float _5553 = dot(_673, _5538);
                                    float _5554 = clamp(_5553, 0.0, 1.0);
                                    float _5557 = dot(-_5538, normalize(_11._m0[_5503]._m2.xyz));
                                    bool _5558 = _5557 > _11._m0[_5503]._m1.w;
                                    float _5586;
                                    if (_5558)
                                    {
                                        float _5561 = _5535 * _5539;
                                        float _5567 = pow(spvNMax(abs(clamp(fma(-_5561, _5561, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_5503]._m4);
                                        float _5577;
                                        if (_5523)
                                        {
                                            _5577 = _5567 * fma(4.0, _5539, _5516);
                                        }
                                        else
                                        {
                                            _5577 = _5567 * ((1.0 / spvNMax(_5535, 9.9999997473787516355514526367188e-05)) + _5516);
                                        }
                                        float _5582 = clamp((_5557 - _11._m0[_5503]._m1.w) / spvNMax(_11._m0[_5503]._m2.w - _11._m0[_5503]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                        _5586 = _5554 * (_5577 * (_5582 * _5582));
                                    }
                                    else
                                    {
                                        _5586 = 0.0;
                                    }
                                    float _5587 = 0.3183098733425140380859375 * _5586;
                                    float _5729;
                                    bool _5730;
                                    float _5731;
                                    float _5732;
                                    float _5733;
                                    if ((_11._m0[_5503]._m7 & 1u) != 0u)
                                    {
                                        uint _5590 = uint(int(_11._m0[_5503]._m7 >> 2u));
                                        float _5603 = sqrt(_5535);
                                        float _5693;
                                        bool _5694;
                                        float _5695;
                                        do
                                        {
                                            SPIRV_CROSS_BRANCH
                                            if ((_5553 <= 0.0) && (!_857))
                                            {
                                                _5693 = _5492;
                                                _5694 = _5494;
                                                _5695 = 0.0;
                                                break;
                                            }
                                            else
                                            {
                                                vec4 _5624 = _22._m0[_5590]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_5553)))) * (_22._m0[_5590]._m4 * _5603))), 1.0);
                                                vec3 _5628 = _5624.xyz / vec3(_5624.w);
                                                vec2 _5631 = (_5628.xy * 0.5) + vec2(0.5);
                                                _5631.y = 1.0 - _5631.y;
                                                float _5640 = (_22._m0[_5590]._m5.y / _22._m0[_5590]._m6) / (_5628.z - _22._m0[_5590]._m5.x);
                                                float _5645 = _5494 ? _5492 : 6.283185482025146484375;
                                                float _5646 = _935 * _5645;
                                                vec2 _5647 = _22._m0[_5590]._m1 + _21._m33;
                                                vec2 _5650 = (_22._m0[_5590]._m1 + vec2(_22._m0[_5590]._m2)) - _21._m33;
                                                float _5652;
                                                _5652 = 0.0;
                                                for (int _5655 = 0; _5655 < 12; )
                                                {
                                                    float _5660 = float(uint(_5655));
                                                    float _5663 = sqrt(_5660 + 0.5) * 0.288675129413604736328125;
                                                    float _5664 = fma(_5660, 2.3999631404876708984375, _5646);
                                                    vec2 _5672 = clamp(fma((vec3(cos(_5664), sin(_5664), _5663).xy * _5663) * 2.5, _21._m33, _5631), _5647, _5650);
                                                    vec2 _5675 = fract(fma(vec2(1.0) / _21._m33, _5672, vec2(0.5)));
                                                    vec4 _5681 = vec4(lessThan(vec4(_5640), textureGather(sampler2D(_23, _14), _5672)));
                                                    float _5684 = _5675.x;
                                                    _5652 += clamp(mix(mix(_5681.w, _5681.z, _5684), mix(_5681.x, _5681.y, _5684), _5675.y), 0.0, 1.0);
                                                    _5655++;
                                                    continue;
                                                }
                                                _5693 = _5645;
                                                _5694 = _5494 ? _5494 : true;
                                                _5695 = _5652 * 0.083333335816860198974609375;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        } while(false);
                                        float _5697 = mix(1.0, _5695, spvNMin(_942, _11._m0[_5503]._m8));
                                        float _5728;
                                        SPIRV_CROSS_BRANCH
                                        if (_856)
                                        {
                                            float _5701 = _22._m0[_5590]._m4 * _5603;
                                            vec4 _5708 = _22._m0[_5590]._m0 * vec4(_859 - (_673 * _5701), 1.0);
                                            float _5709 = _5708.w;
                                            _5728 = fma(_5701, clamp(dot(-_673, _5538), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_5708.xyz / vec3(_5709)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_5590]._m6, _5709))) * 1000.0;
                                        }
                                        else
                                        {
                                            _5728 = 0.0;
                                        }
                                        _5729 = _5693;
                                        _5730 = _5694;
                                        _5731 = _5587 * _5697;
                                        _5732 = _5728;
                                        _5733 = _5697;
                                    }
                                    else
                                    {
                                        _5729 = _5492;
                                        _5730 = _5494;
                                        _5731 = _5587;
                                        _5732 = 0.0;
                                        _5733 = 1.0;
                                    }
                                    vec3 _5738 = vec3(1.0) / spvNMax((_847 * vec3(0.09660939872264862060546875)) * (_848 * _853), vec3(9.9999997473787516355514526367188e-05));
                                    vec3 _5756;
                                    SPIRV_CROSS_BRANCH
                                    if (_856)
                                    {
                                        vec3 _5752 = exp2(_5738 * ((-0.4808983504772186279296875) * spvNMax(_854, _5732)));
                                        _5756 = _849 * (_5752 * fma(_5752, _5752, vec3(3.0)));
                                    }
                                    else
                                    {
                                        vec3 _5744 = exp2(_5738 * ((-0.4808983504772186279296875) * _854));
                                        _5756 = (_849 * (_5744 * fma(_5744, _5744, vec3(3.0)))) * _5733;
                                    }
                                    float _5789;
                                    if (_5558)
                                    {
                                        float _5764 = _5535 * _5539;
                                        float _5770 = pow(spvNMax(abs(clamp(fma(-_5764, _5764, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_5503]._m4);
                                        float _5780;
                                        if (_5523)
                                        {
                                            _5780 = _5770 * fma(4.0, _5539, _5516);
                                        }
                                        else
                                        {
                                            _5780 = _5770 * ((1.0 / spvNMax(_5535, 9.9999997473787516355514526367188e-05)) + _5516);
                                        }
                                        float _5785 = clamp((_5557 - _11._m0[_5503]._m1.w) / spvNMax(_11._m0[_5503]._m2.w - _11._m0[_5503]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                        _5789 = clamp((dot(-_673, _5538) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * (_5780 * (_5785 * _5785));
                                    }
                                    else
                                    {
                                        _5789 = 0.0;
                                    }
                                    vec3 _5934;
                                    vec3 _5935;
                                    SPIRV_CROSS_BRANCH
                                    if (_11._m0[_5503]._m3 < 0.0)
                                    {
                                        vec3 _5926;
                                        vec3 _5927;
                                        if (_5554 > 0.0)
                                        {
                                            vec3 _5867 = (_11._m0[_5503]._m1.xyz * _5731) * _6._m0[0u];
                                            vec3 _5874 = vec3(fma((2.0 * _5550) * _5550, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                            float _5895 = (_894 + 1.0) * 0.5;
                                            float _5896 = _894 * _894;
                                            float _5904 = _5895 * _5895;
                                            float _5916 = _5896 * _5896;
                                            float _5919 = fma(fma(_5552, _5916, -_5552), _5552, 1.0);
                                            _5926 = fma(_5867, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _5550), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_5554, sqrt(fma(fma(-_5038, _5904, _5038), _5038, _5904)), _5038 * sqrt(fma(fma(-_5554, _5904, _5554), _5554, _5904)))) * (_5916 * (0.3183098733425140380859375 / (_5919 * _5919)))), _5487);
                                            _5927 = fma(_5867, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_5874 * pow(spvNMax(abs(1.0 - _5554), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_5874 * pow(spvNMax(abs(1.0 - _5038), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _5490);
                                        }
                                        else
                                        {
                                            _5926 = _5487;
                                            _5927 = _5490;
                                        }
                                        _5934 = _5926;
                                        _5935 = _5927 + (((_5756 * _11._m0[_5503]._m1.xyz) * _843) * ((_5789 * 0.10132117569446563720703125) * _6._m0[0u]));
                                    }
                                    else
                                    {
                                        vec3 _5856;
                                        vec3 _5857;
                                        if (_5554 > 0.0)
                                        {
                                            vec3 _5797 = (_11._m0[_5503]._m1.xyz * _5731) * 1.0;
                                            vec3 _5804 = vec3(fma((2.0 * _5550) * _5550, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                            float _5825 = (_894 + 1.0) * 0.5;
                                            float _5826 = _894 * _894;
                                            float _5834 = _5825 * _5825;
                                            float _5846 = _5826 * _5826;
                                            float _5849 = fma(fma(_5552, _5846, -_5552), _5552, 1.0);
                                            _5856 = fma(_5797, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _5550), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_5554, sqrt(fma(fma(-_5038, _5834, _5038), _5038, _5834)), _5038 * sqrt(fma(fma(-_5554, _5834, _5554), _5554, _5834)))) * (_5846 * (0.3183098733425140380859375 / (_5849 * _5849)))), _5487);
                                            _5857 = fma(_5797, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_5804 * pow(spvNMax(abs(1.0 - _5554), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_5804 * pow(spvNMax(abs(1.0 - _5038), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _5490);
                                        }
                                        else
                                        {
                                            _5856 = _5487;
                                            _5857 = _5490;
                                        }
                                        _5934 = _5856;
                                        _5935 = _5857 + (((_5756 * _11._m0[_5503]._m1.xyz) * _843) * (_5789 * 0.10132117569446563720703125));
                                    }
                                    _5936 = _5934;
                                    _5937 = _5935;
                                    _5938 = _5729;
                                    _5939 = _5730;
                                }
                                else
                                {
                                    _5936 = _5487;
                                    _5937 = _5490;
                                    _5938 = _5492;
                                    _5939 = _5494;
                                }
                                _5488 = _5936;
                                _5491 = _5937;
                                _5493 = _5938;
                                _5495 = _5939;
                            }
                            else
                            {
                                _5488 = _5487;
                                _5491 = _5490;
                                _5493 = _5492;
                                _5495 = _5494;
                            }
                        }
                        vec3 _5941;
                        vec3 _5944;
                        _5941 = _5487;
                        _5944 = _5490;
                        vec3 _5942;
                        vec3 _5945;
                        float _5947;
                        bool _5949;
                        float _5946 = _5492;
                        bool _5948 = _5494;
                        uint _5950 = _5496;
                        for (; _5950 < _5036; _5941 = _5942, _5944 = _5945, _5946 = _5947, _5948 = _5949, _5950++)
                        {
                            uint _5957 = uint(_10._m0[_5950]);
                            int _5986 = int(_13._m0[_5957]._m1 >> 1u) - 1;
                            if (((_13._m0[_5957]._m4 & 16777215u) & (1u << (_617 & 31u))) != 0u)
                            {
                                vec3 _5997 = _13._m0[_5957]._m6 * vec4(_859, 1.0);
                                vec3 _6522;
                                vec3 _6523;
                                float _6524;
                                bool _6525;
                                if (all(lessThan(abs(_5997 - vec3(0.5)), vec3(0.5))))
                                {
                                    vec3 _6004 = _861 + _13._m0[_5957]._m9;
                                    vec3 _6008 = _6004 * inversesqrt(spvNMax(dot(_6004, _6004), 1.0000000133514319600180897396058e-10));
                                    float _6010 = clamp(dot(_13._m0[_5957]._m9, _6008), 0.0, 1.0);
                                    float _6012 = clamp(dot(_673, _6008), 0.0, 1.0);
                                    float _6013 = dot(_673, _13._m0[_5957]._m9);
                                    float _6014 = clamp(_6013, 0.0, 1.0);
                                    int _6015 = int(_13._m0[_5957]._m4 >> 24u);
                                    float _6016 = _5997.z;
                                    bool _6018 = _6016 < _13._m0[_5957]._m2.x;
                                    vec3 _6055;
                                    if (_6018)
                                    {
                                        float _6043 = _6016 * _13._m0[_5957]._m2.z;
                                        float _6046 = _6043 * _6043;
                                        vec3 _6054;
                                        _6054.z = dot(_408[_6015], vec4(_6043, _6046, smoothstep(0.0, 1.0, _6043), (_6046 * _6043) * fma(_6043, fma(_6043, 6.0, -15.0), 10.0)));
                                        _6055 = _6054;
                                    }
                                    else
                                    {
                                        vec3 _6041;
                                        if (_6016 > _13._m0[_5957]._m2.y)
                                        {
                                            float _6029 = (1.0 - _6016) * _13._m0[_5957]._m2.w;
                                            float _6032 = _6029 * _6029;
                                            vec3 _6040;
                                            _6040.z = dot(_408[_6015], vec4(_6029, _6032, smoothstep(0.0, 1.0, _6029), (_6032 * _6029) * fma(_6029, fma(_6029, 6.0, -15.0), 10.0)));
                                            _6041 = _6040;
                                        }
                                        else
                                        {
                                            _6041 = vec3(0.0, 0.0, 1.0);
                                        }
                                        _6055 = _6041;
                                    }
                                    vec2 _6056 = _5997.xy;
                                    vec2 _6060 = (vec2(0.5) - abs(_6056 - vec2(0.5))) * _13._m0[_5957]._m3;
                                    float _6061 = _6060.x;
                                    bool _6062 = _6061 < 1.0;
                                    vec3 _6078;
                                    if (_6062)
                                    {
                                        float _6069 = _6061 * _6061;
                                        vec3 _6077 = _6055;
                                        _6077.x = dot(_408[_6015], vec4(_6061, _6069, smoothstep(0.0, 1.0, _6061), (_6069 * _6061) * fma(_6061, fma(_6061, 6.0, -15.0), 10.0)));
                                        _6078 = _6077;
                                    }
                                    else
                                    {
                                        vec3 _6066 = _6055;
                                        _6066.x = 1.0;
                                        _6078 = _6066;
                                    }
                                    float _6079 = _6060.y;
                                    bool _6080 = _6079 < 1.0;
                                    vec3 _6096;
                                    if (_6080)
                                    {
                                        float _6087 = _6079 * _6079;
                                        vec3 _6095 = _6078;
                                        _6095.y = dot(_408[_6015], vec4(_6079, _6087, smoothstep(0.0, 1.0, _6079), (_6087 * _6079) * fma(_6079, fma(_6079, 6.0, -15.0), 10.0)));
                                        _6096 = _6095;
                                    }
                                    else
                                    {
                                        vec3 _6084 = _6078;
                                        _6084.y = 1.0;
                                        _6096 = _6084;
                                    }
                                    float _6102 = _6014 * ((_6096.x * _6096.y) * _6096.z);
                                    float _6238;
                                    bool _6239;
                                    float _6240;
                                    float _6241;
                                    float _6242;
                                    if ((_13._m0[_5957]._m8 & 1u) != 0u)
                                    {
                                        uint _6105 = uint(int(_13._m0[_5957]._m8 >> 2u));
                                        float _6202;
                                        bool _6203;
                                        float _6204;
                                        do
                                        {
                                            SPIRV_CROSS_BRANCH
                                            if ((_6013 <= 0.0) && (!_857))
                                            {
                                                _6202 = _5946;
                                                _6203 = _5948;
                                                _6204 = 0.0;
                                                break;
                                            }
                                            else
                                            {
                                                vec4 _6137 = _22._m0[_6105]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_6013)))) * _22._m0[_6105]._m4)), 1.0);
                                                vec2 _6140 = (_6137.xy * 0.5) + vec2(0.5);
                                                _6140.y = 1.0 - _6140.y;
                                                float _6149 = ((_6137.z - _22._m0[_6105]._m5.y) / _22._m0[_6105]._m5.x) / _22._m0[_6105]._m6;
                                                float _6154 = _5948 ? _5946 : 6.283185482025146484375;
                                                float _6155 = _935 * _6154;
                                                vec2 _6156 = _22._m0[_6105]._m1 + _21._m33;
                                                vec2 _6159 = (_22._m0[_6105]._m1 + vec2(_22._m0[_6105]._m2)) - _21._m33;
                                                float _6161;
                                                _6161 = 0.0;
                                                for (int _6164 = 0; _6164 < 12; )
                                                {
                                                    float _6169 = float(uint(_6164));
                                                    float _6172 = sqrt(_6169 + 0.5) * 0.288675129413604736328125;
                                                    float _6173 = fma(_6169, 2.3999631404876708984375, _6155);
                                                    vec2 _6181 = clamp(fma((vec3(cos(_6173), sin(_6173), _6172).xy * _6172) * 2.5, _21._m33, _6140), _6156, _6159);
                                                    vec2 _6184 = fract(fma(vec2(1.0) / _21._m33, _6181, vec2(0.5)));
                                                    vec4 _6190 = vec4(lessThan(vec4(_6149), textureGather(sampler2D(_23, _14), _6181)));
                                                    float _6193 = _6184.x;
                                                    _6161 += clamp(mix(mix(_6190.w, _6190.z, _6193), mix(_6190.x, _6190.y, _6193), _6184.y), 0.0, 1.0);
                                                    _6164++;
                                                    continue;
                                                }
                                                _6202 = _6154;
                                                _6203 = _5948 ? _5948 : true;
                                                _6204 = _6161 * 0.083333335816860198974609375;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        } while(false);
                                        float _6206 = mix(1.0, _6204, spvNMin(_942, _13._m0[_5957]._m5));
                                        float _6237;
                                        SPIRV_CROSS_BRANCH
                                        if (_856)
                                        {
                                            vec4 _6216 = _22._m0[_6105]._m0 * vec4(_859 - (_673 * _22._m0[_6105]._m4), 1.0);
                                            _6237 = fma(_22._m0[_6105]._m4, clamp(dot(-_673, _13._m0[_5957]._m9), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma(_6216.xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_6105]._m6, (_6216.z - _22._m0[_6105]._m5.y) / _22._m0[_6105]._m5.x))) * 1000.0;
                                        }
                                        else
                                        {
                                            _6237 = 0.0;
                                        }
                                        _6238 = _6202;
                                        _6239 = _6203;
                                        _6240 = _6102 * _6206;
                                        _6241 = _6237;
                                        _6242 = _6206;
                                    }
                                    else
                                    {
                                        _6238 = _5946;
                                        _6239 = _5948;
                                        _6240 = _6102;
                                        _6241 = 0.0;
                                        _6242 = 1.0;
                                    }
                                    vec3 _6247 = vec3(1.0) / spvNMax((_847 * vec3(0.09660939872264862060546875)) * (_848 * _853), vec3(9.9999997473787516355514526367188e-05));
                                    vec3 _6265;
                                    SPIRV_CROSS_BRANCH
                                    if (_856)
                                    {
                                        vec3 _6261 = exp2(_6247 * ((-0.4808983504772186279296875) * spvNMax(_854, _6241)));
                                        _6265 = _849 * (_6261 * fma(_6261, _6261, vec3(3.0)));
                                    }
                                    else
                                    {
                                        vec3 _6253 = exp2(_6247 * ((-0.4808983504772186279296875) * _854));
                                        _6265 = (_849 * (_6253 * fma(_6253, _6253, vec3(3.0)))) * _6242;
                                    }
                                    vec3 _6307;
                                    if (_6018)
                                    {
                                        float _6295 = _6016 * _13._m0[_5957]._m2.z;
                                        float _6298 = _6295 * _6295;
                                        vec3 _6306;
                                        _6306.z = dot(_408[_6015], vec4(_6295, _6298, smoothstep(0.0, 1.0, _6295), (_6298 * _6295) * fma(_6295, fma(_6295, 6.0, -15.0), 10.0)));
                                        _6307 = _6306;
                                    }
                                    else
                                    {
                                        vec3 _6293;
                                        if (_6016 > _13._m0[_5957]._m2.y)
                                        {
                                            float _6281 = (1.0 - _6016) * _13._m0[_5957]._m2.w;
                                            float _6284 = _6281 * _6281;
                                            vec3 _6292;
                                            _6292.z = dot(_408[_6015], vec4(_6281, _6284, smoothstep(0.0, 1.0, _6281), (_6284 * _6281) * fma(_6281, fma(_6281, 6.0, -15.0), 10.0)));
                                            _6293 = _6292;
                                        }
                                        else
                                        {
                                            _6293 = vec3(0.0, 0.0, 1.0);
                                        }
                                        _6307 = _6293;
                                    }
                                    vec3 _6323;
                                    if (_6062)
                                    {
                                        float _6314 = _6061 * _6061;
                                        vec3 _6322 = _6307;
                                        _6322.x = dot(_408[_6015], vec4(_6061, _6314, smoothstep(0.0, 1.0, _6061), (_6314 * _6061) * fma(_6061, fma(_6061, 6.0, -15.0), 10.0)));
                                        _6323 = _6322;
                                    }
                                    else
                                    {
                                        vec3 _6311 = _6307;
                                        _6311.x = 1.0;
                                        _6323 = _6311;
                                    }
                                    vec3 _6339;
                                    if (_6080)
                                    {
                                        float _6330 = _6079 * _6079;
                                        vec3 _6338 = _6323;
                                        _6338.y = dot(_408[_6015], vec4(_6079, _6330, smoothstep(0.0, 1.0, _6079), (_6330 * _6079) * fma(_6079, fma(_6079, 6.0, -15.0), 10.0)));
                                        _6339 = _6338;
                                    }
                                    else
                                    {
                                        vec3 _6327 = _6323;
                                        _6327.y = 1.0;
                                        _6339 = _6327;
                                    }
                                    float _6345 = clamp((dot(-_673, _13._m0[_5957]._m9) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * ((_6339.x * _6339.y) * _6339.z);
                                    vec3 _6375;
                                    if (_5986 >= 0)
                                    {
                                        uint _6350 = gl_SubgroupInvocationID & 3u;
                                        vec2 _6356 = (subgroupQuadSwapHorizontal(_6056) - _6056) * (((_6350 & 1u) != 0u) ? (-1.0) : 1.0);
                                        vec2 _6362 = (subgroupQuadSwapVertical(_6056) - _6056) * (((_6350 & 2u) != 0u) ? (-1.0) : 1.0);
                                        int _93 = _5986;
                                        _6375 = _13._m0[_5957]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_93], _7)), _6056, mix(_6356, vec2(0.0), bvec2(any(isnan(_6356)))), mix(_6362, vec2(0.0), bvec2(any(isnan(_6362))))).xyz;
                                    }
                                    else
                                    {
                                        _6375 = _13._m0[_5957]._m0;
                                    }
                                    vec3 _6520;
                                    vec3 _6521;
                                    SPIRV_CROSS_BRANCH
                                    if ((_13._m0[_5957]._m1 & 1u) != 0u)
                                    {
                                        vec3 _6512;
                                        vec3 _6513;
                                        if (_6014 > 0.0)
                                        {
                                            vec3 _6453 = (_6375 * _6240) * _6._m0[0u];
                                            vec3 _6460 = vec3(fma((2.0 * _6010) * _6010, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                            float _6481 = (_894 + 1.0) * 0.5;
                                            float _6482 = _894 * _894;
                                            float _6490 = _6481 * _6481;
                                            float _6502 = _6482 * _6482;
                                            float _6505 = fma(fma(_6012, _6502, -_6012), _6012, 1.0);
                                            _6512 = fma(_6453, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _6010), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_6014, sqrt(fma(fma(-_5038, _6490, _5038), _5038, _6490)), _5038 * sqrt(fma(fma(-_6014, _6490, _6014), _6014, _6490)))) * (_6502 * (0.3183098733425140380859375 / (_6505 * _6505)))), _5941);
                                            _6513 = fma(_6453, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_6460 * pow(spvNMax(abs(1.0 - _6014), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_6460 * pow(spvNMax(abs(1.0 - _5038), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _5944);
                                        }
                                        else
                                        {
                                            _6512 = _5941;
                                            _6513 = _5944;
                                        }
                                        _6520 = _6512;
                                        _6521 = _6513 + (((_6265 * _6375) * _843) * ((0.3183098733425140380859375 * _6345) * _6._m0[0u]));
                                    }
                                    else
                                    {
                                        vec3 _6442;
                                        vec3 _6443;
                                        if (_6014 > 0.0)
                                        {
                                            vec3 _6383 = (_6375 * _6240) * 1.0;
                                            vec3 _6390 = vec3(fma((2.0 * _6010) * _6010, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                            float _6411 = (_894 + 1.0) * 0.5;
                                            float _6412 = _894 * _894;
                                            float _6420 = _6411 * _6411;
                                            float _6432 = _6412 * _6412;
                                            float _6435 = fma(fma(_6012, _6432, -_6012), _6012, 1.0);
                                            _6442 = fma(_6383, (_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _6010), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_6014, sqrt(fma(fma(-_5038, _6420, _5038), _5038, _6420)), _5038 * sqrt(fma(fma(-_6014, _6420, _6014), _6014, _6420)))) * (_6432 * (0.3183098733425140380859375 / (_6435 * _6435)))), _5941);
                                            _6443 = fma(_6383, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_6390 * pow(spvNMax(abs(1.0 - _6014), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_6390 * pow(spvNMax(abs(1.0 - _5038), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _5944);
                                        }
                                        else
                                        {
                                            _6442 = _5941;
                                            _6443 = _5944;
                                        }
                                        _6520 = _6442;
                                        _6521 = _6443 + (((_6265 * _6375) * _843) * (0.3183098733425140380859375 * _6345));
                                    }
                                    _6522 = _6520;
                                    _6523 = _6521;
                                    _6524 = _6238;
                                    _6525 = _6239;
                                }
                                else
                                {
                                    _6522 = _5941;
                                    _6523 = _5944;
                                    _6524 = _5946;
                                    _6525 = _5948;
                                }
                                _5942 = _6522;
                                _5945 = _6523;
                                _5947 = _6524;
                                _5949 = _6525;
                            }
                            else
                            {
                                _5942 = _5941;
                                _5945 = _5944;
                                _5947 = _5946;
                                _5949 = _5948;
                            }
                        }
                        _6526 = _5941;
                        _6527 = _5944;
                    }
                    else
                    {
                        vec3 _5019;
                        vec3 _5020;
                        if (_633)
                        {
                            uvec4 _3398 = uvec4(_9._m0[uint(_926)]);
                            uint _3399 = _3398.x;
                            uint _3400 = _3398.y;
                            uint _3403 = ((_3400 >> 0u) & 4095u) + _3399;
                            uint _3406 = ((_3400 >> 12u) & 4095u) + _3403;
                            uint _3410 = ((_3398.z >> 0u) & 1023u) + _3406;
                            vec3 _3412;
                            vec3 _3415;
                            float _3417;
                            bool _3419;
                            uint _3421;
                            _3412 = vec3(0.0);
                            _3415 = vec3(0.0);
                            _3417 = _398;
                            _3419 = false;
                            _3421 = _3399;
                            vec3 _3413;
                            vec3 _3416;
                            float _3418;
                            bool _3420;
                            for (; _3421 < _3403; _3412 = _3413, _3415 = _3416, _3417 = _3418, _3419 = _3420, _3421++)
                            {
                                uint _3428 = uint(_10._m0[_3421]);
                                float _3446 = abs(_11._m0[_3428]._m5);
                                if ((_11._m0[_3428]._m6 & (1u << (_617 & 31u))) != 0u)
                                {
                                    vec3 _3461 = _11._m0[_3428]._m0.xyz - _859;
                                    float _3462 = dot(_3461, _3461);
                                    vec3 _3465 = _3461 * inversesqrt(spvNMax(_3462, 1.0000000133514319600180897396058e-10));
                                    float _3466 = _11._m0[_3428]._m0.w * _11._m0[_3428]._m0.w;
                                    vec3 _3919;
                                    vec3 _3920;
                                    float _3921;
                                    bool _3922;
                                    if (_3462 < (1.0 / _3466))
                                    {
                                        float _3471 = _3462 * _3466;
                                        float _3477 = pow(spvNMax(abs(clamp(fma(-_3471, _3471, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_3428]._m4);
                                        float _3487;
                                        if (_11._m0[_3428]._m5 < 0.0)
                                        {
                                            _3487 = _3477 * fma(4.0, _3466, _3446);
                                        }
                                        else
                                        {
                                            _3487 = _3477 * ((1.0 / spvNMax(_3462, 9.9999997473787516355514526367188e-05)) + _3446);
                                        }
                                        float _3489 = dot(_673, _3465);
                                        float _3611;
                                        bool _3612;
                                        float _3613;
                                        if ((_11._m0[_3428]._m7 & 1u) != 0u)
                                        {
                                            uint _3516;
                                            do
                                            {
                                                vec3 _3496 = -_3465;
                                                float _3497 = dot(_3496, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                                float _3498 = dot(_3496, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                                float _3499 = dot(_3496, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                                float _3503 = spvNMax(spvNMax(_3497, _3498), spvNMax(_3499, dot(_3496, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                                if (_3503 == _3497)
                                                {
                                                    _3516 = 0u;
                                                    break;
                                                }
                                                else
                                                {
                                                    if (_3503 == _3498)
                                                    {
                                                        _3516 = 1u;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        if (_3503 == _3499)
                                                        {
                                                            _3516 = 2u;
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            _3516 = 3u;
                                                            break;
                                                        }
                                                        break; // unreachable workaround
                                                    }
                                                    break; // unreachable workaround
                                                }
                                                break; // unreachable workaround
                                            } while(false);
                                            uint _3518 = uint(int(_11._m0[_3428]._m7 >> 2u)) + _3516;
                                            vec4 _3540 = _22._m0[_3518]._m0 * vec4(_859 + (_3465 * (3.5 * (_22._m0[_3518]._m4 * sqrt(_3462)))), 1.0);
                                            vec3 _3544 = _3540.xyz / vec3(_3540.w);
                                            vec2 _3547 = (_3544.xy * 0.5) + vec2(0.5);
                                            _3547.y = 1.0 - _3547.y;
                                            float _3556 = (_22._m0[_3518]._m5.y / _22._m0[_3518]._m6) / (_3544.z - _22._m0[_3518]._m5.x);
                                            float _3561 = _3419 ? _3417 : 6.283185482025146484375;
                                            float _3562 = _935 * _3561;
                                            vec2 _3563 = _22._m0[_3518]._m1 + _21._m33;
                                            vec2 _3566 = (_22._m0[_3518]._m1 + vec2(_22._m0[_3518]._m2)) - _21._m33;
                                            float _3568;
                                            _3568 = 0.0;
                                            for (int _3571 = 0; _3571 < 12; )
                                            {
                                                float _3576 = float(uint(_3571));
                                                float _3579 = sqrt(_3576 + 0.5) * 0.288675129413604736328125;
                                                float _3580 = fma(_3576, 2.3999631404876708984375, _3562);
                                                vec2 _3588 = clamp(fma((vec3(cos(_3580), sin(_3580), _3579).xy * _3579) * 2.5, _21._m33, _3547), _3563, _3566);
                                                vec2 _3591 = fract(fma(vec2(1.0) / _21._m33, _3588, vec2(0.5)));
                                                vec4 _3597 = vec4(lessThan(vec4(_3556), textureGather(sampler2D(_23, _14), _3588)));
                                                float _3600 = _3591.x;
                                                _3568 += clamp(mix(mix(_3597.w, _3597.z, _3600), mix(_3597.x, _3597.y, _3600), _3591.y), 0.0, 1.0);
                                                _3571++;
                                                continue;
                                            }
                                            _3611 = _3561;
                                            _3612 = _3419 ? _3419 : true;
                                            _3613 = mix(1.0, _3568 * 0.083333335816860198974609375, spvNMin(_942, _11._m0[_3428]._m8));
                                        }
                                        else
                                        {
                                            _3611 = _3417;
                                            _3612 = _3419;
                                            _3613 = clamp(fma(2.0, _3489, 0.5), 0.0, 1.0);
                                        }
                                        float _3614 = (0.079577468335628509521484375 * _3487) * _3613;
                                        vec3 _3917;
                                        vec3 _3918;
                                        SPIRV_CROSS_BRANCH
                                        if (_11._m0[_3428]._m3 < 0.0)
                                        {
                                            vec3 _3768 = _11._m0[_3428]._m1.xyz * (_3614 * _6._m0[0u]);
                                            float _3769 = dot(_670, _3465);
                                            float _3770 = clamp(_3769, -1.0, 1.0);
                                            float _3772 = clamp(dot(_670, _861), -1.0, 1.0);
                                            float _3778 = cos(0.5 * abs(asin(_3772) - asin(_3770)));
                                            vec3 _3780 = _3465 - (_670 * _3770);
                                            vec3 _3782 = _861 - (_670 * _3772);
                                            float _3788 = dot(_3780, _3782) * inversesqrt(fma(dot(_3780, _3780), dot(_3782, _3782), 9.9999997473787516355514526367188e-05));
                                            float _3791 = sqrt(clamp(fma(0.5, _3788, 0.5), 0.0, 1.0));
                                            float _3820 = _894 * _894;
                                            vec3 _3825 = vec3(_3820 * (1.41421353816986083984375 * _3791), _3820 * 0.5, _3820 * 2.0);
                                            vec3 _3837 = exp((pow(spvNMax(abs(vec3(_3770 + _3772) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _3791, sqrt(fma(-_3772, _3772, 1.0)), (-0.06994284689426422119140625) * _3772), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_3825 * _3825)) / (_3825 * 2.5066282749176025390625);
                                            float _3838 = dot(_861, _3465);
                                            float _3858 = 1.0 / fma(0.36000001430511474609375, _3778, 1.190000057220458984375 / _3778);
                                            float _3861 = _3791 * fma(_3858, fma(-0.800000011920928955078125, _3788, 0.60000002384185791015625), 1.0);
                                            float _3866 = -_3778;
                                            vec3 _3882 = spvNMax(abs(_843), vec3(9.9999997473787516355514526367188e-05));
                                            float _3900 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_3866, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                            vec3 _3916 = fma(_3768, ((((vec3(0.25 * _3791) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _3838, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _671, clamp(-_3838, 0.0, 1.0))) * _3837.x) + (((pow(_3882, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_3861 * _3858), 9.9999997473787516355514526367188e-05), 2.0))) / _3778)) * (exp(fma(-3.650000095367431640625, _3788, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_3866, sqrt(clamp(fma(-_3861, _3861, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _671) * _3837.y)) + ((pow(_3882, vec3(0.800000011920928955078125 / _3778)) * (exp(fma(17.0, _3788, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _3900), 9.9999997473787516355514526367188e-05), 2.0) * _3900))) * _3837.z), _3412);
                                            _3917 = _3916;
                                            _3918 = fma(_3768, (sqrt(_843) * ((0.3183098733425140380859375 * mix(clamp((_3489 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_3769), 0.3300000131130218505859375)) * _669)) * pow(spvNMax(abs(_843 / vec3(dot(_843, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _3613)), _3415);
                                        }
                                        else
                                        {
                                            vec3 _3618 = _11._m0[_3428]._m1.xyz * _3614;
                                            float _3619 = dot(_670, _3465);
                                            float _3620 = clamp(_3619, -1.0, 1.0);
                                            float _3622 = clamp(dot(_670, _861), -1.0, 1.0);
                                            float _3628 = cos(0.5 * abs(asin(_3622) - asin(_3620)));
                                            vec3 _3630 = _3465 - (_670 * _3620);
                                            vec3 _3632 = _861 - (_670 * _3622);
                                            float _3638 = dot(_3630, _3632) * inversesqrt(fma(dot(_3630, _3630), dot(_3632, _3632), 9.9999997473787516355514526367188e-05));
                                            float _3641 = sqrt(clamp(fma(0.5, _3638, 0.5), 0.0, 1.0));
                                            float _3670 = _894 * _894;
                                            vec3 _3675 = vec3(_3670 * (1.41421353816986083984375 * _3641), _3670 * 0.5, _3670 * 2.0);
                                            vec3 _3687 = exp((pow(spvNMax(abs(vec3(_3620 + _3622) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _3641, sqrt(fma(-_3622, _3622, 1.0)), (-0.06994284689426422119140625) * _3622), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_3675 * _3675)) / (_3675 * 2.5066282749176025390625);
                                            float _3688 = dot(_861, _3465);
                                            float _3708 = 1.0 / fma(0.36000001430511474609375, _3628, 1.190000057220458984375 / _3628);
                                            float _3711 = _3641 * fma(_3708, fma(-0.800000011920928955078125, _3638, 0.60000002384185791015625), 1.0);
                                            float _3716 = -_3628;
                                            vec3 _3732 = spvNMax(abs(_843), vec3(9.9999997473787516355514526367188e-05));
                                            float _3750 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_3716, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                            vec3 _3766 = fma(_3618, ((((vec3(0.25 * _3641) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _3688, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _671, clamp(-_3688, 0.0, 1.0))) * _3687.x) + (((pow(_3732, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_3711 * _3708), 9.9999997473787516355514526367188e-05), 2.0))) / _3628)) * (exp(fma(-3.650000095367431640625, _3638, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_3716, sqrt(clamp(fma(-_3711, _3711, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _671) * _3687.y)) + ((pow(_3732, vec3(0.800000011920928955078125 / _3628)) * (exp(fma(17.0, _3638, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _3750), 9.9999997473787516355514526367188e-05), 2.0) * _3750))) * _3687.z), _3412);
                                            _3917 = _3766;
                                            _3918 = fma(_3618, (sqrt(_843) * ((0.3183098733425140380859375 * mix(clamp((_3489 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_3619), 0.3300000131130218505859375)) * _669)) * pow(spvNMax(abs(_843 / vec3(dot(_843, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _3613)), _3415);
                                        }
                                        _3919 = _3917;
                                        _3920 = _3918;
                                        _3921 = _3611;
                                        _3922 = _3612;
                                    }
                                    else
                                    {
                                        _3919 = _3412;
                                        _3920 = _3415;
                                        _3921 = _3417;
                                        _3922 = _3419;
                                    }
                                    _3413 = _3919;
                                    _3416 = _3920;
                                    _3418 = _3921;
                                    _3420 = _3922;
                                }
                                else
                                {
                                    _3413 = _3412;
                                    _3416 = _3415;
                                    _3418 = _3417;
                                    _3420 = _3419;
                                }
                            }
                            vec3 _3924;
                            vec3 _3927;
                            float _3929;
                            bool _3931;
                            uint _3933;
                            _3924 = _3412;
                            _3927 = _3415;
                            _3929 = _3417;
                            _3931 = _3419;
                            _3933 = _3421;
                            vec3 _3925;
                            vec3 _3928;
                            float _3930;
                            bool _3932;
                            for (; _3933 < _3406; _3924 = _3925, _3927 = _3928, _3929 = _3930, _3931 = _3932, _3933++)
                            {
                                uint _3940 = uint(_10._m0[_3933]);
                                float _3953 = abs(_11._m0[_3940]._m5);
                                if ((_11._m0[_3940]._m6 & (1u << (_617 & 31u))) != 0u)
                                {
                                    vec3 _3971 = _11._m0[_3940]._m0.xyz - _859;
                                    float _3972 = dot(_3971, _3971);
                                    vec3 _3975 = _3971 * inversesqrt(spvNMax(_3972, 1.0000000133514319600180897396058e-10));
                                    float _3976 = _11._m0[_3940]._m0.w * _11._m0[_3940]._m0.w;
                                    vec3 _4419;
                                    vec3 _4420;
                                    float _4421;
                                    bool _4422;
                                    if (_3972 < (1.0 / _3976))
                                    {
                                        float _3983 = dot(-_3975, normalize(_11._m0[_3940]._m2.xyz));
                                        float _4011;
                                        if (_3983 > _11._m0[_3940]._m1.w)
                                        {
                                            float _3987 = _3972 * _3976;
                                            float _3993 = pow(spvNMax(abs(clamp(fma(-_3987, _3987, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_3940]._m4);
                                            float _4003;
                                            if (_11._m0[_3940]._m5 < 0.0)
                                            {
                                                _4003 = _3993 * fma(4.0, _3976, _3953);
                                            }
                                            else
                                            {
                                                _4003 = _3993 * ((1.0 / spvNMax(_3972, 9.9999997473787516355514526367188e-05)) + _3953);
                                            }
                                            float _4008 = clamp((_3983 - _11._m0[_3940]._m1.w) / spvNMax(_11._m0[_3940]._m2.w - _11._m0[_3940]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                            _4011 = _4003 * (_4008 * _4008);
                                        }
                                        else
                                        {
                                            _4011 = 0.0;
                                        }
                                        float _4013 = dot(_673, _3975);
                                        float _4111;
                                        bool _4112;
                                        float _4113;
                                        if ((_11._m0[_3940]._m7 & 1u) != 0u)
                                        {
                                            uint _4018 = uint(int(_11._m0[_3940]._m7 >> 2u));
                                            vec4 _4040 = _22._m0[_4018]._m0 * vec4(_859 + (_3975 * (3.5 * (_22._m0[_4018]._m4 * sqrt(_3972)))), 1.0);
                                            vec3 _4044 = _4040.xyz / vec3(_4040.w);
                                            vec2 _4047 = (_4044.xy * 0.5) + vec2(0.5);
                                            _4047.y = 1.0 - _4047.y;
                                            float _4056 = (_22._m0[_4018]._m5.y / _22._m0[_4018]._m6) / (_4044.z - _22._m0[_4018]._m5.x);
                                            float _4061 = _3931 ? _3929 : 6.283185482025146484375;
                                            float _4062 = _935 * _4061;
                                            vec2 _4063 = _22._m0[_4018]._m1 + _21._m33;
                                            vec2 _4066 = (_22._m0[_4018]._m1 + vec2(_22._m0[_4018]._m2)) - _21._m33;
                                            float _4068;
                                            _4068 = 0.0;
                                            for (int _4071 = 0; _4071 < 12; )
                                            {
                                                float _4076 = float(uint(_4071));
                                                float _4079 = sqrt(_4076 + 0.5) * 0.288675129413604736328125;
                                                float _4080 = fma(_4076, 2.3999631404876708984375, _4062);
                                                vec2 _4088 = clamp(fma((vec3(cos(_4080), sin(_4080), _4079).xy * _4079) * 2.5, _21._m33, _4047), _4063, _4066);
                                                vec2 _4091 = fract(fma(vec2(1.0) / _21._m33, _4088, vec2(0.5)));
                                                vec4 _4097 = vec4(lessThan(vec4(_4056), textureGather(sampler2D(_23, _14), _4088)));
                                                float _4100 = _4091.x;
                                                _4068 += clamp(mix(mix(_4097.w, _4097.z, _4100), mix(_4097.x, _4097.y, _4100), _4091.y), 0.0, 1.0);
                                                _4071++;
                                                continue;
                                            }
                                            _4111 = _4061;
                                            _4112 = _3931 ? _3931 : true;
                                            _4113 = mix(1.0, _4068 * 0.083333335816860198974609375, spvNMin(_942, _11._m0[_3940]._m8));
                                        }
                                        else
                                        {
                                            _4111 = _3929;
                                            _4112 = _3931;
                                            _4113 = clamp(fma(2.0, _4013, 0.5), 0.0, 1.0);
                                        }
                                        float _4114 = (0.3183098733425140380859375 * _4011) * _4113;
                                        vec3 _4417;
                                        vec3 _4418;
                                        SPIRV_CROSS_BRANCH
                                        if (_11._m0[_3940]._m3 < 0.0)
                                        {
                                            vec3 _4268 = _11._m0[_3940]._m1.xyz * (_4114 * _6._m0[0u]);
                                            float _4269 = dot(_670, _3975);
                                            float _4270 = clamp(_4269, -1.0, 1.0);
                                            float _4272 = clamp(dot(_670, _861), -1.0, 1.0);
                                            float _4278 = cos(0.5 * abs(asin(_4272) - asin(_4270)));
                                            vec3 _4280 = _3975 - (_670 * _4270);
                                            vec3 _4282 = _861 - (_670 * _4272);
                                            float _4288 = dot(_4280, _4282) * inversesqrt(fma(dot(_4280, _4280), dot(_4282, _4282), 9.9999997473787516355514526367188e-05));
                                            float _4291 = sqrt(clamp(fma(0.5, _4288, 0.5), 0.0, 1.0));
                                            float _4320 = _894 * _894;
                                            vec3 _4325 = vec3(_4320 * (1.41421353816986083984375 * _4291), _4320 * 0.5, _4320 * 2.0);
                                            vec3 _4337 = exp((pow(spvNMax(abs(vec3(_4270 + _4272) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _4291, sqrt(fma(-_4272, _4272, 1.0)), (-0.06994284689426422119140625) * _4272), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_4325 * _4325)) / (_4325 * 2.5066282749176025390625);
                                            float _4338 = dot(_861, _3975);
                                            float _4358 = 1.0 / fma(0.36000001430511474609375, _4278, 1.190000057220458984375 / _4278);
                                            float _4361 = _4291 * fma(_4358, fma(-0.800000011920928955078125, _4288, 0.60000002384185791015625), 1.0);
                                            float _4366 = -_4278;
                                            vec3 _4382 = spvNMax(abs(_843), vec3(9.9999997473787516355514526367188e-05));
                                            float _4400 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4366, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                            vec3 _4416 = fma(_4268, ((((vec3(0.25 * _4291) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _4338, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _671, clamp(-_4338, 0.0, 1.0))) * _4337.x) + (((pow(_4382, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_4361 * _4358), 9.9999997473787516355514526367188e-05), 2.0))) / _4278)) * (exp(fma(-3.650000095367431640625, _4288, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4366, sqrt(clamp(fma(-_4361, _4361, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _671) * _4337.y)) + ((pow(_4382, vec3(0.800000011920928955078125 / _4278)) * (exp(fma(17.0, _4288, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _4400), 9.9999997473787516355514526367188e-05), 2.0) * _4400))) * _4337.z), _3924);
                                            _4417 = _4416;
                                            _4418 = fma(_4268, (sqrt(_843) * ((0.3183098733425140380859375 * mix(clamp((_4013 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_4269), 0.3300000131130218505859375)) * _669)) * pow(spvNMax(abs(_843 / vec3(dot(_843, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _4113)), _3927);
                                        }
                                        else
                                        {
                                            vec3 _4118 = _11._m0[_3940]._m1.xyz * _4114;
                                            float _4119 = dot(_670, _3975);
                                            float _4120 = clamp(_4119, -1.0, 1.0);
                                            float _4122 = clamp(dot(_670, _861), -1.0, 1.0);
                                            float _4128 = cos(0.5 * abs(asin(_4122) - asin(_4120)));
                                            vec3 _4130 = _3975 - (_670 * _4120);
                                            vec3 _4132 = _861 - (_670 * _4122);
                                            float _4138 = dot(_4130, _4132) * inversesqrt(fma(dot(_4130, _4130), dot(_4132, _4132), 9.9999997473787516355514526367188e-05));
                                            float _4141 = sqrt(clamp(fma(0.5, _4138, 0.5), 0.0, 1.0));
                                            float _4170 = _894 * _894;
                                            vec3 _4175 = vec3(_4170 * (1.41421353816986083984375 * _4141), _4170 * 0.5, _4170 * 2.0);
                                            vec3 _4187 = exp((pow(spvNMax(abs(vec3(_4120 + _4122) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _4141, sqrt(fma(-_4122, _4122, 1.0)), (-0.06994284689426422119140625) * _4122), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_4175 * _4175)) / (_4175 * 2.5066282749176025390625);
                                            float _4188 = dot(_861, _3975);
                                            float _4208 = 1.0 / fma(0.36000001430511474609375, _4128, 1.190000057220458984375 / _4128);
                                            float _4211 = _4141 * fma(_4208, fma(-0.800000011920928955078125, _4138, 0.60000002384185791015625), 1.0);
                                            float _4216 = -_4128;
                                            vec3 _4232 = spvNMax(abs(_843), vec3(9.9999997473787516355514526367188e-05));
                                            float _4250 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4216, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                            vec3 _4266 = fma(_4118, ((((vec3(0.25 * _4141) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _4188, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _671, clamp(-_4188, 0.0, 1.0))) * _4187.x) + (((pow(_4232, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_4211 * _4208), 9.9999997473787516355514526367188e-05), 2.0))) / _4128)) * (exp(fma(-3.650000095367431640625, _4138, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4216, sqrt(clamp(fma(-_4211, _4211, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _671) * _4187.y)) + ((pow(_4232, vec3(0.800000011920928955078125 / _4128)) * (exp(fma(17.0, _4138, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _4250), 9.9999997473787516355514526367188e-05), 2.0) * _4250))) * _4187.z), _3924);
                                            _4417 = _4266;
                                            _4418 = fma(_4118, (sqrt(_843) * ((0.3183098733425140380859375 * mix(clamp((_4013 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_4119), 0.3300000131130218505859375)) * _669)) * pow(spvNMax(abs(_843 / vec3(dot(_843, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _4113)), _3927);
                                        }
                                        _4419 = _4417;
                                        _4420 = _4418;
                                        _4421 = _4111;
                                        _4422 = _4112;
                                    }
                                    else
                                    {
                                        _4419 = _3924;
                                        _4420 = _3927;
                                        _4421 = _3929;
                                        _4422 = _3931;
                                    }
                                    _3925 = _4419;
                                    _3928 = _4420;
                                    _3930 = _4421;
                                    _3932 = _4422;
                                }
                                else
                                {
                                    _3925 = _3924;
                                    _3928 = _3927;
                                    _3930 = _3929;
                                    _3932 = _3931;
                                }
                            }
                            vec3 _4424;
                            vec3 _4427;
                            _4424 = _3924;
                            _4427 = _3927;
                            vec3 _4425;
                            vec3 _4428;
                            float _4430;
                            bool _4432;
                            float _4429 = _3929;
                            bool _4431 = _3931;
                            uint _4433 = _3933;
                            for (; _4433 < _3410; _4424 = _4425, _4427 = _4428, _4429 = _4430, _4431 = _4432, _4433++)
                            {
                                uint _4440 = uint(_10._m0[_4433]);
                                int _4469 = int(_13._m0[_4440]._m1 >> 1u) - 1;
                                if (((_13._m0[_4440]._m4 & 16777215u) & (1u << (_617 & 31u))) != 0u)
                                {
                                    vec3 _4480 = _13._m0[_4440]._m6 * vec4(_859, 1.0);
                                    vec3 _5015;
                                    vec3 _5016;
                                    float _5017;
                                    bool _5018;
                                    if (all(lessThan(abs(_4480 - vec3(0.5)), vec3(0.5))))
                                    {
                                        int _4487 = int(_13._m0[_4440]._m4 >> 24u);
                                        float _4488 = _4480.z;
                                        vec3 _4527;
                                        if (_4488 < _13._m0[_4440]._m2.x)
                                        {
                                            float _4515 = _4488 * _13._m0[_4440]._m2.z;
                                            float _4518 = _4515 * _4515;
                                            vec3 _4526;
                                            _4526.z = dot(_408[_4487], vec4(_4515, _4518, smoothstep(0.0, 1.0, _4515), (_4518 * _4515) * fma(_4515, fma(_4515, 6.0, -15.0), 10.0)));
                                            _4527 = _4526;
                                        }
                                        else
                                        {
                                            vec3 _4513;
                                            if (_4488 > _13._m0[_4440]._m2.y)
                                            {
                                                float _4501 = (1.0 - _4488) * _13._m0[_4440]._m2.w;
                                                float _4504 = _4501 * _4501;
                                                vec3 _4512;
                                                _4512.z = dot(_408[_4487], vec4(_4501, _4504, smoothstep(0.0, 1.0, _4501), (_4504 * _4501) * fma(_4501, fma(_4501, 6.0, -15.0), 10.0)));
                                                _4513 = _4512;
                                            }
                                            else
                                            {
                                                _4513 = vec3(0.0, 0.0, 1.0);
                                            }
                                            _4527 = _4513;
                                        }
                                        vec2 _4528 = _4480.xy;
                                        vec2 _4532 = (vec2(0.5) - abs(_4528 - vec2(0.5))) * _13._m0[_4440]._m3;
                                        float _4533 = _4532.x;
                                        vec3 _4550;
                                        if (_4533 < 1.0)
                                        {
                                            float _4541 = _4533 * _4533;
                                            vec3 _4549 = _4527;
                                            _4549.x = dot(_408[_4487], vec4(_4533, _4541, smoothstep(0.0, 1.0, _4533), (_4541 * _4533) * fma(_4533, fma(_4533, 6.0, -15.0), 10.0)));
                                            _4550 = _4549;
                                        }
                                        else
                                        {
                                            vec3 _4538 = _4527;
                                            _4538.x = 1.0;
                                            _4550 = _4538;
                                        }
                                        float _4551 = _4532.y;
                                        vec3 _4568;
                                        if (_4551 < 1.0)
                                        {
                                            float _4559 = _4551 * _4551;
                                            vec3 _4567 = _4550;
                                            _4567.y = dot(_408[_4487], vec4(_4551, _4559, smoothstep(0.0, 1.0, _4551), (_4559 * _4551) * fma(_4551, fma(_4551, 6.0, -15.0), 10.0)));
                                            _4568 = _4567;
                                        }
                                        else
                                        {
                                            vec3 _4556 = _4550;
                                            _4556.y = 1.0;
                                            _4568 = _4556;
                                        }
                                        float _4574 = dot(_673, _13._m0[_4440]._m9);
                                        float _4666;
                                        bool _4667;
                                        float _4668;
                                        if ((_13._m0[_4440]._m8 & 1u) != 0u)
                                        {
                                            uint _4579 = uint(int(_13._m0[_4440]._m8 >> 2u));
                                            vec4 _4599 = _22._m0[_4579]._m0 * vec4(_859 + (_13._m0[_4440]._m9 * (3.5 * _22._m0[_4579]._m4)), 1.0);
                                            vec2 _4602 = (_4599.xy * 0.5) + vec2(0.5);
                                            _4602.y = 1.0 - _4602.y;
                                            float _4611 = ((_4599.z - _22._m0[_4579]._m5.y) / _22._m0[_4579]._m5.x) / _22._m0[_4579]._m6;
                                            float _4616 = _4431 ? _4429 : 6.283185482025146484375;
                                            float _4617 = _935 * _4616;
                                            vec2 _4618 = _22._m0[_4579]._m1 + _21._m33;
                                            vec2 _4621 = (_22._m0[_4579]._m1 + vec2(_22._m0[_4579]._m2)) - _21._m33;
                                            float _4623;
                                            _4623 = 0.0;
                                            for (int _4626 = 0; _4626 < 12; )
                                            {
                                                float _4631 = float(uint(_4626));
                                                float _4634 = sqrt(_4631 + 0.5) * 0.288675129413604736328125;
                                                float _4635 = fma(_4631, 2.3999631404876708984375, _4617);
                                                vec2 _4643 = clamp(fma((vec3(cos(_4635), sin(_4635), _4634).xy * _4634) * 2.5, _21._m33, _4602), _4618, _4621);
                                                vec2 _4646 = fract(fma(vec2(1.0) / _21._m33, _4643, vec2(0.5)));
                                                vec4 _4652 = vec4(lessThan(vec4(_4611), textureGather(sampler2D(_23, _14), _4643)));
                                                float _4655 = _4646.x;
                                                _4623 += clamp(mix(mix(_4652.w, _4652.z, _4655), mix(_4652.x, _4652.y, _4655), _4646.y), 0.0, 1.0);
                                                _4626++;
                                                continue;
                                            }
                                            _4666 = _4616;
                                            _4667 = _4431 ? _4431 : true;
                                            _4668 = mix(1.0, _4623 * 0.083333335816860198974609375, spvNMin(_942, _13._m0[_4440]._m5));
                                        }
                                        else
                                        {
                                            _4666 = _4429;
                                            _4667 = _4431;
                                            _4668 = clamp(fma(2.0, _4574, 0.5), 0.0, 1.0);
                                        }
                                        float _4669 = ((_4568.x * _4568.y) * _4568.z) * _4668;
                                        vec3 _4710;
                                        if (_4469 >= 0)
                                        {
                                            uint _4674 = gl_SubgroupInvocationID & 3u;
                                            vec2 _4680 = (subgroupQuadSwapHorizontal(_4528) - _4528) * (((_4674 & 1u) != 0u) ? (-1.0) : 1.0);
                                            vec2 _4686 = (subgroupQuadSwapVertical(_4528) - _4528) * (((_4674 & 2u) != 0u) ? (-1.0) : 1.0);
                                            vec2 _4690 = mix(_4680, vec2(0.0), bvec2(any(isnan(_4680))));
                                            vec2 _4694 = mix(_4686, vec2(0.0), bvec2(any(isnan(_4686))));
                                            bvec2 _4703 = bvec2(any(greaterThan(abs(vec4(_4690, _4694)), vec4(0.015625))));
                                            int _89 = _4469;
                                            _4710 = _13._m0[_4440]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_89], _7)), _4528, mix(_4690, vec2(0.0), _4703), mix(_4694, vec2(0.0), _4703)).xyz;
                                        }
                                        else
                                        {
                                            _4710 = _13._m0[_4440]._m0;
                                        }
                                        vec3 _5013;
                                        vec3 _5014;
                                        SPIRV_CROSS_BRANCH
                                        if ((_13._m0[_4440]._m1 & 1u) != 0u)
                                        {
                                            vec3 _4864 = _4710 * (_4669 * _6._m0[0u]);
                                            float _4865 = dot(_670, _13._m0[_4440]._m9);
                                            float _4866 = clamp(_4865, -1.0, 1.0);
                                            float _4868 = clamp(dot(_670, _861), -1.0, 1.0);
                                            float _4874 = cos(0.5 * abs(asin(_4868) - asin(_4866)));
                                            vec3 _4876 = _13._m0[_4440]._m9 - (_670 * _4866);
                                            vec3 _4878 = _861 - (_670 * _4868);
                                            float _4884 = dot(_4876, _4878) * inversesqrt(fma(dot(_4876, _4876), dot(_4878, _4878), 9.9999997473787516355514526367188e-05));
                                            float _4887 = sqrt(clamp(fma(0.5, _4884, 0.5), 0.0, 1.0));
                                            float _4916 = _894 * _894;
                                            vec3 _4921 = vec3(_4916 * (1.41421353816986083984375 * _4887), _4916 * 0.5, _4916 * 2.0);
                                            vec3 _4933 = exp((pow(spvNMax(abs(vec3(_4866 + _4868) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _4887, sqrt(fma(-_4868, _4868, 1.0)), (-0.06994284689426422119140625) * _4868), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_4921 * _4921)) / (_4921 * 2.5066282749176025390625);
                                            float _4934 = dot(_861, _13._m0[_4440]._m9);
                                            float _4954 = 1.0 / fma(0.36000001430511474609375, _4874, 1.190000057220458984375 / _4874);
                                            float _4957 = _4887 * fma(_4954, fma(-0.800000011920928955078125, _4884, 0.60000002384185791015625), 1.0);
                                            float _4962 = -_4874;
                                            vec3 _4978 = spvNMax(abs(_843), vec3(9.9999997473787516355514526367188e-05));
                                            float _4996 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4962, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                            vec3 _5012 = fma(_4864, ((((vec3(0.25 * _4887) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _4934, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _671, clamp(-_4934, 0.0, 1.0))) * _4933.x) + (((pow(_4978, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_4957 * _4954), 9.9999997473787516355514526367188e-05), 2.0))) / _4874)) * (exp(fma(-3.650000095367431640625, _4884, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4962, sqrt(clamp(fma(-_4957, _4957, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _671) * _4933.y)) + ((pow(_4978, vec3(0.800000011920928955078125 / _4874)) * (exp(fma(17.0, _4884, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _4996), 9.9999997473787516355514526367188e-05), 2.0) * _4996))) * _4933.z), _4424);
                                            _5013 = _5012;
                                            _5014 = fma(_4864, (sqrt(_843) * ((0.3183098733425140380859375 * mix(clamp((_4574 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_4865), 0.3300000131130218505859375)) * _669)) * pow(spvNMax(abs(_843 / vec3(dot(_843, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _4668)), _4427);
                                        }
                                        else
                                        {
                                            vec3 _4714 = _4710 * _4669;
                                            float _4715 = dot(_670, _13._m0[_4440]._m9);
                                            float _4716 = clamp(_4715, -1.0, 1.0);
                                            float _4718 = clamp(dot(_670, _861), -1.0, 1.0);
                                            float _4724 = cos(0.5 * abs(asin(_4718) - asin(_4716)));
                                            vec3 _4726 = _13._m0[_4440]._m9 - (_670 * _4716);
                                            vec3 _4728 = _861 - (_670 * _4718);
                                            float _4734 = dot(_4726, _4728) * inversesqrt(fma(dot(_4726, _4726), dot(_4728, _4728), 9.9999997473787516355514526367188e-05));
                                            float _4737 = sqrt(clamp(fma(0.5, _4734, 0.5), 0.0, 1.0));
                                            float _4766 = _894 * _894;
                                            vec3 _4771 = vec3(_4766 * (1.41421353816986083984375 * _4737), _4766 * 0.5, _4766 * 2.0);
                                            vec3 _4783 = exp((pow(spvNMax(abs(vec3(_4716 + _4718) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _4737, sqrt(fma(-_4718, _4718, 1.0)), (-0.06994284689426422119140625) * _4718), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_4771 * _4771)) / (_4771 * 2.5066282749176025390625);
                                            float _4784 = dot(_861, _13._m0[_4440]._m9);
                                            float _4804 = 1.0 / fma(0.36000001430511474609375, _4724, 1.190000057220458984375 / _4724);
                                            float _4807 = _4737 * fma(_4804, fma(-0.800000011920928955078125, _4734, 0.60000002384185791015625), 1.0);
                                            float _4812 = -_4724;
                                            vec3 _4828 = spvNMax(abs(_843), vec3(9.9999997473787516355514526367188e-05));
                                            float _4846 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4812, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                            vec3 _4862 = fma(_4714, ((((vec3(0.25 * _4737) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _4784, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _671, clamp(-_4784, 0.0, 1.0))) * _4783.x) + (((pow(_4828, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_4807 * _4804), 9.9999997473787516355514526367188e-05), 2.0))) / _4724)) * (exp(fma(-3.650000095367431640625, _4734, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4812, sqrt(clamp(fma(-_4807, _4807, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _671) * _4783.y)) + ((pow(_4828, vec3(0.800000011920928955078125 / _4724)) * (exp(fma(17.0, _4734, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _4846), 9.9999997473787516355514526367188e-05), 2.0) * _4846))) * _4783.z), _4424);
                                            _5013 = _4862;
                                            _5014 = fma(_4714, (sqrt(_843) * ((0.3183098733425140380859375 * mix(clamp((_4574 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_4715), 0.3300000131130218505859375)) * _669)) * pow(spvNMax(abs(_843 / vec3(dot(_843, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _4668)), _4427);
                                        }
                                        _5015 = _5013;
                                        _5016 = _5014;
                                        _5017 = _4666;
                                        _5018 = _4667;
                                    }
                                    else
                                    {
                                        _5015 = _4424;
                                        _5016 = _4427;
                                        _5017 = _4429;
                                        _5018 = _4431;
                                    }
                                    _4425 = _5015;
                                    _4428 = _5016;
                                    _4430 = _5017;
                                    _4432 = _5018;
                                }
                                else
                                {
                                    _4425 = _4424;
                                    _4428 = _4427;
                                    _4430 = _4429;
                                    _4432 = _4431;
                                }
                            }
                            _5019 = _4424;
                            _5020 = _4427;
                        }
                        else
                        {
                            vec3 _3393;
                            vec3 _3394;
                            if (_615 == 6u)
                            {
                                uvec4 _2286 = uvec4(_9._m0[uint(_926)]);
                                uint _2287 = _2286.x;
                                uint _2288 = _2286.y;
                                uint _2291 = ((_2288 >> 0u) & 4095u) + _2287;
                                uint _2294 = ((_2288 >> 12u) & 4095u) + _2291;
                                uint _2298 = ((_2286.z >> 0u) & 1023u) + _2294;
                                float _2300 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                                vec3 _2302;
                                vec3 _2305;
                                float _2307;
                                bool _2309;
                                uint _2311;
                                _2302 = vec3(0.0);
                                _2305 = vec3(0.0);
                                _2307 = _398;
                                _2309 = false;
                                _2311 = _2287;
                                vec3 _2303;
                                vec3 _2306;
                                float _2308;
                                bool _2310;
                                for (; _2311 < _2291; _2302 = _2303, _2305 = _2306, _2307 = _2308, _2309 = _2310, _2311++)
                                {
                                    uint _2318 = uint(_10._m0[_2311]);
                                    float _2336 = abs(_11._m0[_2318]._m5);
                                    if ((_11._m0[_2318]._m6 & (1u << (_617 & 31u))) != 0u)
                                    {
                                        vec3 _2351 = _11._m0[_2318]._m0.xyz - _859;
                                        float _2352 = dot(_2351, _2351);
                                        vec3 _2355 = _2351 * inversesqrt(spvNMax(_2352, 1.0000000133514319600180897396058e-10));
                                        float _2356 = _11._m0[_2318]._m0.w * _11._m0[_2318]._m0.w;
                                        vec3 _2637;
                                        vec3 _2638;
                                        float _2639;
                                        bool _2640;
                                        if (_2352 < (1.0 / _2356))
                                        {
                                            vec3 _2361 = _861 + _2355;
                                            vec3 _2365 = _2361 * inversesqrt(spvNMax(dot(_2361, _2361), 1.0000000133514319600180897396058e-10));
                                            float _2367 = clamp(dot(_2355, _2365), 0.0, 1.0);
                                            float _2369 = clamp(dot(_673, _2365), 0.0, 1.0);
                                            float _2371 = clamp(dot(_673, _2355), 0.0, 1.0);
                                            float _2372 = _2352 * _2356;
                                            float _2378 = pow(spvNMax(abs(clamp(fma(-_2372, _2372, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_2318]._m4);
                                            float _2388;
                                            if (_11._m0[_2318]._m5 < 0.0)
                                            {
                                                _2388 = _2378 * fma(4.0, _2356, _2336);
                                            }
                                            else
                                            {
                                                _2388 = _2378 * ((1.0 / spvNMax(_2352, 9.9999997473787516355514526367188e-05)) + _2336);
                                            }
                                            float _2390 = 0.079577468335628509521484375 * (_2371 * _2388);
                                            float _2526;
                                            bool _2527;
                                            float _2528;
                                            if ((_11._m0[_2318]._m7 & 1u) != 0u)
                                            {
                                                uint _2415;
                                                do
                                                {
                                                    vec3 _2395 = -_2355;
                                                    float _2396 = dot(_2395, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                                    float _2397 = dot(_2395, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                                    float _2398 = dot(_2395, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                                    float _2402 = spvNMax(spvNMax(_2396, _2397), spvNMax(_2398, dot(_2395, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                                    if (_2402 == _2396)
                                                    {
                                                        _2415 = 0u;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        if (_2402 == _2397)
                                                        {
                                                            _2415 = 1u;
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            if (_2402 == _2398)
                                                            {
                                                                _2415 = 2u;
                                                                break;
                                                            }
                                                            else
                                                            {
                                                                _2415 = 3u;
                                                                break;
                                                            }
                                                            break; // unreachable workaround
                                                        }
                                                        break; // unreachable workaround
                                                    }
                                                    break; // unreachable workaround
                                                } while(false);
                                                uint _2417 = uint(int(_11._m0[_2318]._m7 >> 2u)) + _2415;
                                                float _2520;
                                                bool _2521;
                                                float _2522;
                                                do
                                                {
                                                    SPIRV_CROSS_BRANCH
                                                    if ((_2371 <= 0.0) && (!_857))
                                                    {
                                                        _2520 = _2307;
                                                        _2521 = _2309;
                                                        _2522 = 0.0;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        vec4 _2451 = _22._m0[_2417]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_2371)))) * (_22._m0[_2417]._m4 * sqrt(_2352)))), 1.0);
                                                        vec3 _2455 = _2451.xyz / vec3(_2451.w);
                                                        vec2 _2458 = (_2455.xy * 0.5) + vec2(0.5);
                                                        _2458.y = 1.0 - _2458.y;
                                                        float _2467 = (_22._m0[_2417]._m5.y / _22._m0[_2417]._m6) / (_2455.z - _22._m0[_2417]._m5.x);
                                                        float _2472 = _2309 ? _2307 : 6.283185482025146484375;
                                                        float _2473 = _935 * _2472;
                                                        vec2 _2474 = _22._m0[_2417]._m1 + _21._m33;
                                                        vec2 _2477 = (_22._m0[_2417]._m1 + vec2(_22._m0[_2417]._m2)) - _21._m33;
                                                        float _2479;
                                                        _2479 = 0.0;
                                                        for (int _2482 = 0; _2482 < 12; )
                                                        {
                                                            float _2487 = float(uint(_2482));
                                                            float _2490 = sqrt(_2487 + 0.5) * 0.288675129413604736328125;
                                                            float _2491 = fma(_2487, 2.3999631404876708984375, _2473);
                                                            vec2 _2499 = clamp(fma((vec3(cos(_2491), sin(_2491), _2490).xy * _2490) * 2.5, _21._m33, _2458), _2474, _2477);
                                                            vec2 _2502 = fract(fma(vec2(1.0) / _21._m33, _2499, vec2(0.5)));
                                                            vec4 _2508 = vec4(lessThan(vec4(_2467), textureGather(sampler2D(_23, _14), _2499)));
                                                            float _2511 = _2502.x;
                                                            _2479 += clamp(mix(mix(_2508.w, _2508.z, _2511), mix(_2508.x, _2508.y, _2511), _2502.y), 0.0, 1.0);
                                                            _2482++;
                                                            continue;
                                                        }
                                                        _2520 = _2472;
                                                        _2521 = _2309 ? _2309 : true;
                                                        _2522 = _2479 * 0.083333335816860198974609375;
                                                        break;
                                                    }
                                                    break; // unreachable workaround
                                                } while(false);
                                                _2526 = _2520;
                                                _2527 = _2521;
                                                _2528 = _2390 * mix(1.0, _2522, spvNMin(_942, _11._m0[_2318]._m8));
                                            }
                                            else
                                            {
                                                _2526 = _2307;
                                                _2527 = _2309;
                                                _2528 = _2390;
                                            }
                                            vec3 _2635;
                                            vec3 _2636;
                                            SPIRV_CROSS_BRANCH
                                            if (_11._m0[_2318]._m3 < 0.0)
                                            {
                                                vec3 _2633;
                                                vec3 _2634;
                                                if (_2371 > 0.0)
                                                {
                                                    vec3 _2587 = _11._m0[_2318]._m1.xyz * (_2528 * _6._m0[0u]);
                                                    vec3 _2594 = vec3(fma((2.0 * _2367) * _2367, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                    float _2624 = clamp(_2300, 0.0, 1.0);
                                                    _2633 = fma(_2587, _858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(-_2369, _2369, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(-_2371, _2624, _2371 + _2624))), _2302);
                                                    _2634 = fma(_2587, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2594 * pow(spvNMax(abs(1.0 - _2371), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2594 * pow(spvNMax(abs(1.0 - _2300), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _2305);
                                                }
                                                else
                                                {
                                                    _2633 = _2302;
                                                    _2634 = _2305;
                                                }
                                                _2635 = _2633;
                                                _2636 = _2634;
                                            }
                                            else
                                            {
                                                vec3 _2581;
                                                vec3 _2582;
                                                if (_2371 > 0.0)
                                                {
                                                    vec3 _2535 = _11._m0[_2318]._m1.xyz * _2528;
                                                    vec3 _2542 = vec3(fma((2.0 * _2367) * _2367, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                    float _2572 = clamp(_2300, 0.0, 1.0);
                                                    _2581 = fma(_2535, _858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(-_2369, _2369, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(-_2371, _2572, _2371 + _2572))), _2302);
                                                    _2582 = fma(_2535, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2542 * pow(spvNMax(abs(1.0 - _2371), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2542 * pow(spvNMax(abs(1.0 - _2300), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _2305);
                                                }
                                                else
                                                {
                                                    _2581 = _2302;
                                                    _2582 = _2305;
                                                }
                                                _2635 = _2581;
                                                _2636 = _2582;
                                            }
                                            _2637 = _2635;
                                            _2638 = _2636;
                                            _2639 = _2526;
                                            _2640 = _2527;
                                        }
                                        else
                                        {
                                            _2637 = _2302;
                                            _2638 = _2305;
                                            _2639 = _2307;
                                            _2640 = _2309;
                                        }
                                        _2303 = _2637;
                                        _2306 = _2638;
                                        _2308 = _2639;
                                        _2310 = _2640;
                                    }
                                    else
                                    {
                                        _2303 = _2302;
                                        _2306 = _2305;
                                        _2308 = _2307;
                                        _2310 = _2309;
                                    }
                                }
                                vec3 _2642;
                                vec3 _2645;
                                float _2647;
                                bool _2649;
                                uint _2651;
                                _2642 = _2302;
                                _2645 = _2305;
                                _2647 = _2307;
                                _2649 = _2309;
                                _2651 = _2311;
                                vec3 _2643;
                                vec3 _2646;
                                float _2648;
                                bool _2650;
                                for (; _2651 < _2294; _2642 = _2643, _2645 = _2646, _2647 = _2648, _2649 = _2650, _2651++)
                                {
                                    uint _2658 = uint(_10._m0[_2651]);
                                    float _2671 = abs(_11._m0[_2658]._m5);
                                    if ((_11._m0[_2658]._m6 & (1u << (_617 & 31u))) != 0u)
                                    {
                                        vec3 _2689 = _11._m0[_2658]._m0.xyz - _859;
                                        float _2690 = dot(_2689, _2689);
                                        vec3 _2693 = _2689 * inversesqrt(spvNMax(_2690, 1.0000000133514319600180897396058e-10));
                                        float _2694 = _11._m0[_2658]._m0.w * _11._m0[_2658]._m0.w;
                                        vec3 _2965;
                                        vec3 _2966;
                                        float _2967;
                                        bool _2968;
                                        if (_2690 < (1.0 / _2694))
                                        {
                                            vec3 _2699 = _861 + _2693;
                                            vec3 _2703 = _2699 * inversesqrt(spvNMax(dot(_2699, _2699), 1.0000000133514319600180897396058e-10));
                                            float _2705 = clamp(dot(_2693, _2703), 0.0, 1.0);
                                            float _2707 = clamp(dot(_673, _2703), 0.0, 1.0);
                                            float _2709 = clamp(dot(_673, _2693), 0.0, 1.0);
                                            float _2712 = dot(-_2693, normalize(_11._m0[_2658]._m2.xyz));
                                            float _2741;
                                            if (_2712 > _11._m0[_2658]._m1.w)
                                            {
                                                float _2716 = _2690 * _2694;
                                                float _2722 = pow(spvNMax(abs(clamp(fma(-_2716, _2716, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_2658]._m4);
                                                float _2732;
                                                if (_11._m0[_2658]._m5 < 0.0)
                                                {
                                                    _2732 = _2722 * fma(4.0, _2694, _2671);
                                                }
                                                else
                                                {
                                                    _2732 = _2722 * ((1.0 / spvNMax(_2690, 9.9999997473787516355514526367188e-05)) + _2671);
                                                }
                                                float _2737 = clamp((_2712 - _11._m0[_2658]._m1.w) / spvNMax(_11._m0[_2658]._m2.w - _11._m0[_2658]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                                _2741 = _2709 * (_2732 * (_2737 * _2737));
                                            }
                                            else
                                            {
                                                _2741 = 0.0;
                                            }
                                            float _2742 = 0.3183098733425140380859375 * _2741;
                                            float _2854;
                                            bool _2855;
                                            float _2856;
                                            if ((_11._m0[_2658]._m7 & 1u) != 0u)
                                            {
                                                uint _2745 = uint(int(_11._m0[_2658]._m7 >> 2u));
                                                float _2848;
                                                bool _2849;
                                                float _2850;
                                                do
                                                {
                                                    SPIRV_CROSS_BRANCH
                                                    if ((_2709 <= 0.0) && (!_857))
                                                    {
                                                        _2848 = _2647;
                                                        _2849 = _2649;
                                                        _2850 = 0.0;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        vec4 _2779 = _22._m0[_2745]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_2709)))) * (_22._m0[_2745]._m4 * sqrt(_2690)))), 1.0);
                                                        vec3 _2783 = _2779.xyz / vec3(_2779.w);
                                                        vec2 _2786 = (_2783.xy * 0.5) + vec2(0.5);
                                                        _2786.y = 1.0 - _2786.y;
                                                        float _2795 = (_22._m0[_2745]._m5.y / _22._m0[_2745]._m6) / (_2783.z - _22._m0[_2745]._m5.x);
                                                        float _2800 = _2649 ? _2647 : 6.283185482025146484375;
                                                        float _2801 = _935 * _2800;
                                                        vec2 _2802 = _22._m0[_2745]._m1 + _21._m33;
                                                        vec2 _2805 = (_22._m0[_2745]._m1 + vec2(_22._m0[_2745]._m2)) - _21._m33;
                                                        float _2807;
                                                        _2807 = 0.0;
                                                        for (int _2810 = 0; _2810 < 12; )
                                                        {
                                                            float _2815 = float(uint(_2810));
                                                            float _2818 = sqrt(_2815 + 0.5) * 0.288675129413604736328125;
                                                            float _2819 = fma(_2815, 2.3999631404876708984375, _2801);
                                                            vec2 _2827 = clamp(fma((vec3(cos(_2819), sin(_2819), _2818).xy * _2818) * 2.5, _21._m33, _2786), _2802, _2805);
                                                            vec2 _2830 = fract(fma(vec2(1.0) / _21._m33, _2827, vec2(0.5)));
                                                            vec4 _2836 = vec4(lessThan(vec4(_2795), textureGather(sampler2D(_23, _14), _2827)));
                                                            float _2839 = _2830.x;
                                                            _2807 += clamp(mix(mix(_2836.w, _2836.z, _2839), mix(_2836.x, _2836.y, _2839), _2830.y), 0.0, 1.0);
                                                            _2810++;
                                                            continue;
                                                        }
                                                        _2848 = _2800;
                                                        _2849 = _2649 ? _2649 : true;
                                                        _2850 = _2807 * 0.083333335816860198974609375;
                                                        break;
                                                    }
                                                    break; // unreachable workaround
                                                } while(false);
                                                _2854 = _2848;
                                                _2855 = _2849;
                                                _2856 = _2742 * mix(1.0, _2850, spvNMin(_942, _11._m0[_2658]._m8));
                                            }
                                            else
                                            {
                                                _2854 = _2647;
                                                _2855 = _2649;
                                                _2856 = _2742;
                                            }
                                            vec3 _2963;
                                            vec3 _2964;
                                            SPIRV_CROSS_BRANCH
                                            if (_11._m0[_2658]._m3 < 0.0)
                                            {
                                                vec3 _2961;
                                                vec3 _2962;
                                                if (_2709 > 0.0)
                                                {
                                                    vec3 _2915 = _11._m0[_2658]._m1.xyz * (_2856 * _6._m0[0u]);
                                                    vec3 _2922 = vec3(fma((2.0 * _2705) * _2705, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                    float _2952 = clamp(_2300, 0.0, 1.0);
                                                    _2961 = fma(_2915, _858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(-_2707, _2707, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(-_2709, _2952, _2709 + _2952))), _2642);
                                                    _2962 = fma(_2915, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2922 * pow(spvNMax(abs(1.0 - _2709), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2922 * pow(spvNMax(abs(1.0 - _2300), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _2645);
                                                }
                                                else
                                                {
                                                    _2961 = _2642;
                                                    _2962 = _2645;
                                                }
                                                _2963 = _2961;
                                                _2964 = _2962;
                                            }
                                            else
                                            {
                                                vec3 _2909;
                                                vec3 _2910;
                                                if (_2709 > 0.0)
                                                {
                                                    vec3 _2863 = _11._m0[_2658]._m1.xyz * _2856;
                                                    vec3 _2870 = vec3(fma((2.0 * _2705) * _2705, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                    float _2900 = clamp(_2300, 0.0, 1.0);
                                                    _2909 = fma(_2863, _858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(-_2707, _2707, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(-_2709, _2900, _2709 + _2900))), _2642);
                                                    _2910 = fma(_2863, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2870 * pow(spvNMax(abs(1.0 - _2709), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2870 * pow(spvNMax(abs(1.0 - _2300), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _2645);
                                                }
                                                else
                                                {
                                                    _2909 = _2642;
                                                    _2910 = _2645;
                                                }
                                                _2963 = _2909;
                                                _2964 = _2910;
                                            }
                                            _2965 = _2963;
                                            _2966 = _2964;
                                            _2967 = _2854;
                                            _2968 = _2855;
                                        }
                                        else
                                        {
                                            _2965 = _2642;
                                            _2966 = _2645;
                                            _2967 = _2647;
                                            _2968 = _2649;
                                        }
                                        _2643 = _2965;
                                        _2646 = _2966;
                                        _2648 = _2967;
                                        _2650 = _2968;
                                    }
                                    else
                                    {
                                        _2643 = _2642;
                                        _2646 = _2645;
                                        _2648 = _2647;
                                        _2650 = _2649;
                                    }
                                }
                                vec3 _2970;
                                vec3 _2973;
                                _2970 = _2642;
                                _2973 = _2645;
                                vec3 _2971;
                                vec3 _2974;
                                float _2976;
                                bool _2978;
                                float _2975 = _2647;
                                bool _2977 = _2649;
                                uint _2979 = _2651;
                                for (; _2979 < _2298; _2970 = _2971, _2973 = _2974, _2975 = _2976, _2977 = _2978, _2979++)
                                {
                                    uint _2986 = uint(_10._m0[_2979]);
                                    int _3015 = int(_13._m0[_2986]._m1 >> 1u) - 1;
                                    if (((_13._m0[_2986]._m4 & 16777215u) & (1u << (_617 & 31u))) != 0u)
                                    {
                                        vec3 _3026 = _13._m0[_2986]._m6 * vec4(_859, 1.0);
                                        vec3 _3389;
                                        vec3 _3390;
                                        float _3391;
                                        bool _3392;
                                        if (all(lessThan(abs(_3026 - vec3(0.5)), vec3(0.5))))
                                        {
                                            vec3 _3033 = _861 + _13._m0[_2986]._m9;
                                            vec3 _3037 = _3033 * inversesqrt(spvNMax(dot(_3033, _3033), 1.0000000133514319600180897396058e-10));
                                            float _3039 = clamp(dot(_13._m0[_2986]._m9, _3037), 0.0, 1.0);
                                            float _3041 = clamp(dot(_673, _3037), 0.0, 1.0);
                                            float _3043 = clamp(dot(_673, _13._m0[_2986]._m9), 0.0, 1.0);
                                            int _3044 = int(_13._m0[_2986]._m4 >> 24u);
                                            float _3045 = _3026.z;
                                            vec3 _3084;
                                            if (_3045 < _13._m0[_2986]._m2.x)
                                            {
                                                float _3072 = _3045 * _13._m0[_2986]._m2.z;
                                                float _3075 = _3072 * _3072;
                                                vec3 _3083;
                                                _3083.z = dot(_408[_3044], vec4(_3072, _3075, smoothstep(0.0, 1.0, _3072), (_3075 * _3072) * fma(_3072, fma(_3072, 6.0, -15.0), 10.0)));
                                                _3084 = _3083;
                                            }
                                            else
                                            {
                                                vec3 _3070;
                                                if (_3045 > _13._m0[_2986]._m2.y)
                                                {
                                                    float _3058 = (1.0 - _3045) * _13._m0[_2986]._m2.w;
                                                    float _3061 = _3058 * _3058;
                                                    vec3 _3069;
                                                    _3069.z = dot(_408[_3044], vec4(_3058, _3061, smoothstep(0.0, 1.0, _3058), (_3061 * _3058) * fma(_3058, fma(_3058, 6.0, -15.0), 10.0)));
                                                    _3070 = _3069;
                                                }
                                                else
                                                {
                                                    _3070 = vec3(0.0, 0.0, 1.0);
                                                }
                                                _3084 = _3070;
                                            }
                                            vec2 _3085 = _3026.xy;
                                            vec2 _3089 = (vec2(0.5) - abs(_3085 - vec2(0.5))) * _13._m0[_2986]._m3;
                                            float _3090 = _3089.x;
                                            vec3 _3107;
                                            if (_3090 < 1.0)
                                            {
                                                float _3098 = _3090 * _3090;
                                                vec3 _3106 = _3084;
                                                _3106.x = dot(_408[_3044], vec4(_3090, _3098, smoothstep(0.0, 1.0, _3090), (_3098 * _3090) * fma(_3090, fma(_3090, 6.0, -15.0), 10.0)));
                                                _3107 = _3106;
                                            }
                                            else
                                            {
                                                vec3 _3095 = _3084;
                                                _3095.x = 1.0;
                                                _3107 = _3095;
                                            }
                                            float _3108 = _3089.y;
                                            vec3 _3125;
                                            if (_3108 < 1.0)
                                            {
                                                float _3116 = _3108 * _3108;
                                                vec3 _3124 = _3107;
                                                _3124.y = dot(_408[_3044], vec4(_3108, _3116, smoothstep(0.0, 1.0, _3108), (_3116 * _3108) * fma(_3108, fma(_3108, 6.0, -15.0), 10.0)));
                                                _3125 = _3124;
                                            }
                                            else
                                            {
                                                vec3 _3113 = _3107;
                                                _3113.y = 1.0;
                                                _3125 = _3113;
                                            }
                                            float _3131 = _3043 * ((_3125.x * _3125.y) * _3125.z);
                                            float _3237;
                                            bool _3238;
                                            float _3239;
                                            if ((_13._m0[_2986]._m8 & 1u) != 0u)
                                            {
                                                uint _3134 = uint(int(_13._m0[_2986]._m8 >> 2u));
                                                float _3231;
                                                bool _3232;
                                                float _3233;
                                                do
                                                {
                                                    SPIRV_CROSS_BRANCH
                                                    if ((_3043 <= 0.0) && (!_857))
                                                    {
                                                        _3231 = _2975;
                                                        _3232 = _2977;
                                                        _3233 = 0.0;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        vec4 _3166 = _22._m0[_3134]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_3043)))) * _22._m0[_3134]._m4)), 1.0);
                                                        vec2 _3169 = (_3166.xy * 0.5) + vec2(0.5);
                                                        _3169.y = 1.0 - _3169.y;
                                                        float _3178 = ((_3166.z - _22._m0[_3134]._m5.y) / _22._m0[_3134]._m5.x) / _22._m0[_3134]._m6;
                                                        float _3183 = _2977 ? _2975 : 6.283185482025146484375;
                                                        float _3184 = _935 * _3183;
                                                        vec2 _3185 = _22._m0[_3134]._m1 + _21._m33;
                                                        vec2 _3188 = (_22._m0[_3134]._m1 + vec2(_22._m0[_3134]._m2)) - _21._m33;
                                                        float _3190;
                                                        _3190 = 0.0;
                                                        for (int _3193 = 0; _3193 < 12; )
                                                        {
                                                            float _3198 = float(uint(_3193));
                                                            float _3201 = sqrt(_3198 + 0.5) * 0.288675129413604736328125;
                                                            float _3202 = fma(_3198, 2.3999631404876708984375, _3184);
                                                            vec2 _3210 = clamp(fma((vec3(cos(_3202), sin(_3202), _3201).xy * _3201) * 2.5, _21._m33, _3169), _3185, _3188);
                                                            vec2 _3213 = fract(fma(vec2(1.0) / _21._m33, _3210, vec2(0.5)));
                                                            vec4 _3219 = vec4(lessThan(vec4(_3178), textureGather(sampler2D(_23, _14), _3210)));
                                                            float _3222 = _3213.x;
                                                            _3190 += clamp(mix(mix(_3219.w, _3219.z, _3222), mix(_3219.x, _3219.y, _3222), _3213.y), 0.0, 1.0);
                                                            _3193++;
                                                            continue;
                                                        }
                                                        _3231 = _3183;
                                                        _3232 = _2977 ? _2977 : true;
                                                        _3233 = _3190 * 0.083333335816860198974609375;
                                                        break;
                                                    }
                                                    break; // unreachable workaround
                                                } while(false);
                                                _3237 = _3231;
                                                _3238 = _3232;
                                                _3239 = _3131 * mix(1.0, _3233, spvNMin(_942, _13._m0[_2986]._m5));
                                            }
                                            else
                                            {
                                                _3237 = _2975;
                                                _3238 = _2977;
                                                _3239 = _3131;
                                            }
                                            vec3 _3280;
                                            if (_3015 >= 0)
                                            {
                                                uint _3244 = gl_SubgroupInvocationID & 3u;
                                                vec2 _3250 = (subgroupQuadSwapHorizontal(_3085) - _3085) * (((_3244 & 1u) != 0u) ? (-1.0) : 1.0);
                                                vec2 _3256 = (subgroupQuadSwapVertical(_3085) - _3085) * (((_3244 & 2u) != 0u) ? (-1.0) : 1.0);
                                                vec2 _3260 = mix(_3250, vec2(0.0), bvec2(any(isnan(_3250))));
                                                vec2 _3264 = mix(_3256, vec2(0.0), bvec2(any(isnan(_3256))));
                                                bvec2 _3273 = bvec2(any(greaterThan(abs(vec4(_3260, _3264)), vec4(0.015625))));
                                                int _85 = _3015;
                                                _3280 = _13._m0[_2986]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_85], _7)), _3085, mix(_3260, vec2(0.0), _3273), mix(_3264, vec2(0.0), _3273)).xyz;
                                            }
                                            else
                                            {
                                                _3280 = _13._m0[_2986]._m0;
                                            }
                                            vec3 _3387;
                                            vec3 _3388;
                                            SPIRV_CROSS_BRANCH
                                            if ((_13._m0[_2986]._m1 & 1u) != 0u)
                                            {
                                                vec3 _3385;
                                                vec3 _3386;
                                                if (_3043 > 0.0)
                                                {
                                                    vec3 _3339 = _3280 * (_3239 * _6._m0[0u]);
                                                    vec3 _3346 = vec3(fma((2.0 * _3039) * _3039, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                    float _3376 = clamp(_2300, 0.0, 1.0);
                                                    _3385 = fma(_3339, _858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(-_3041, _3041, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(-_3043, _3376, _3043 + _3376))), _2970);
                                                    _3386 = fma(_3339, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3346 * pow(spvNMax(abs(1.0 - _3043), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3346 * pow(spvNMax(abs(1.0 - _2300), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _2973);
                                                }
                                                else
                                                {
                                                    _3385 = _2970;
                                                    _3386 = _2973;
                                                }
                                                _3387 = _3385;
                                                _3388 = _3386;
                                            }
                                            else
                                            {
                                                vec3 _3333;
                                                vec3 _3334;
                                                if (_3043 > 0.0)
                                                {
                                                    vec3 _3287 = _3280 * _3239;
                                                    vec3 _3294 = vec3(fma((2.0 * _3039) * _3039, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                    float _3324 = clamp(_2300, 0.0, 1.0);
                                                    _3333 = fma(_3287, _858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(-_3041, _3041, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(-_3043, _3324, _3043 + _3324))), _2970);
                                                    _3334 = fma(_3287, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3294 * pow(spvNMax(abs(1.0 - _3043), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3294 * pow(spvNMax(abs(1.0 - _2300), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _2973);
                                                }
                                                else
                                                {
                                                    _3333 = _2970;
                                                    _3334 = _2973;
                                                }
                                                _3387 = _3333;
                                                _3388 = _3334;
                                            }
                                            _3389 = _3387;
                                            _3390 = _3388;
                                            _3391 = _3237;
                                            _3392 = _3238;
                                        }
                                        else
                                        {
                                            _3389 = _2970;
                                            _3390 = _2973;
                                            _3391 = _2975;
                                            _3392 = _2977;
                                        }
                                        _2971 = _3389;
                                        _2974 = _3390;
                                        _2976 = _3391;
                                        _2978 = _3392;
                                    }
                                    else
                                    {
                                        _2971 = _2970;
                                        _2974 = _2973;
                                        _2976 = _2975;
                                        _2978 = _2977;
                                    }
                                }
                                _3393 = _2970;
                                _3394 = _2973;
                            }
                            else
                            {
                                vec3 _2281;
                                vec3 _2282;
                                if (_615 == 7u)
                                {
                                    uvec4 _970 = uvec4(_9._m0[uint(_926)]);
                                    uint _971 = _970.x;
                                    uint _972 = _970.y;
                                    uint _975 = ((_972 >> 0u) & 4095u) + _971;
                                    uint _978 = ((_972 >> 12u) & 4095u) + _975;
                                    uint _982 = ((_970.z >> 0u) & 1023u) + _978;
                                    float _984 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                                    vec3 _986;
                                    vec3 _989;
                                    float _991;
                                    bool _993;
                                    uint _995;
                                    _986 = vec3(0.0);
                                    _989 = vec3(0.0);
                                    _991 = _398;
                                    _993 = false;
                                    _995 = _971;
                                    vec3 _987;
                                    vec3 _990;
                                    float _992;
                                    bool _994;
                                    for (; _995 < _975; _986 = _987, _989 = _990, _991 = _992, _993 = _994, _995++)
                                    {
                                        uint _1002 = uint(_10._m0[_995]);
                                        float _1020 = abs(_11._m0[_1002]._m5);
                                        if ((_11._m0[_1002]._m6 & (1u << (_617 & 31u))) != 0u)
                                        {
                                            vec3 _1035 = _11._m0[_1002]._m0.xyz - _859;
                                            float _1036 = dot(_1035, _1035);
                                            vec3 _1039 = _1035 * inversesqrt(spvNMax(_1036, 1.0000000133514319600180897396058e-10));
                                            float _1040 = _11._m0[_1002]._m0.w * _11._m0[_1002]._m0.w;
                                            vec3 _1389;
                                            vec3 _1390;
                                            float _1391;
                                            bool _1392;
                                            if (_1036 < (1.0 / _1040))
                                            {
                                                vec3 _1045 = _861 + _1039;
                                                vec3 _1049 = _1045 * inversesqrt(spvNMax(dot(_1045, _1045), 1.0000000133514319600180897396058e-10));
                                                float _1051 = clamp(dot(_1039, _1049), 0.0, 1.0);
                                                float _1053 = clamp(dot(_673, _1049), 0.0, 1.0);
                                                float _1055 = clamp(dot(_673, _1039), 0.0, 1.0);
                                                float _1056 = _1036 * _1040;
                                                float _1062 = pow(spvNMax(abs(clamp(fma(-_1056, _1056, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1002]._m4);
                                                float _1072;
                                                if (_11._m0[_1002]._m5 < 0.0)
                                                {
                                                    _1072 = _1062 * fma(4.0, _1040, _1020);
                                                }
                                                else
                                                {
                                                    _1072 = _1062 * ((1.0 / spvNMax(_1036, 9.9999997473787516355514526367188e-05)) + _1020);
                                                }
                                                float _1074 = 0.079577468335628509521484375 * (_1055 * _1072);
                                                float _1210;
                                                bool _1211;
                                                float _1212;
                                                if ((_11._m0[_1002]._m7 & 1u) != 0u)
                                                {
                                                    uint _1099;
                                                    do
                                                    {
                                                        vec3 _1079 = -_1039;
                                                        float _1080 = dot(_1079, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                                        float _1081 = dot(_1079, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                                        float _1082 = dot(_1079, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                                        float _1086 = spvNMax(spvNMax(_1080, _1081), spvNMax(_1082, dot(_1079, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                                        if (_1086 == _1080)
                                                        {
                                                            _1099 = 0u;
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            if (_1086 == _1081)
                                                            {
                                                                _1099 = 1u;
                                                                break;
                                                            }
                                                            else
                                                            {
                                                                if (_1086 == _1082)
                                                                {
                                                                    _1099 = 2u;
                                                                    break;
                                                                }
                                                                else
                                                                {
                                                                    _1099 = 3u;
                                                                    break;
                                                                }
                                                                break; // unreachable workaround
                                                            }
                                                            break; // unreachable workaround
                                                        }
                                                        break; // unreachable workaround
                                                    } while(false);
                                                    uint _1101 = uint(int(_11._m0[_1002]._m7 >> 2u)) + _1099;
                                                    float _1204;
                                                    bool _1205;
                                                    float _1206;
                                                    do
                                                    {
                                                        SPIRV_CROSS_BRANCH
                                                        if ((_1055 <= 0.0) && (!_857))
                                                        {
                                                            _1204 = _991;
                                                            _1205 = _993;
                                                            _1206 = 0.0;
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            vec4 _1135 = _22._m0[_1101]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_1055)))) * (_22._m0[_1101]._m4 * sqrt(_1036)))), 1.0);
                                                            vec3 _1139 = _1135.xyz / vec3(_1135.w);
                                                            vec2 _1142 = (_1139.xy * 0.5) + vec2(0.5);
                                                            _1142.y = 1.0 - _1142.y;
                                                            float _1151 = (_22._m0[_1101]._m5.y / _22._m0[_1101]._m6) / (_1139.z - _22._m0[_1101]._m5.x);
                                                            float _1156 = _993 ? _991 : 6.283185482025146484375;
                                                            float _1157 = _935 * _1156;
                                                            vec2 _1158 = _22._m0[_1101]._m1 + _21._m33;
                                                            vec2 _1161 = (_22._m0[_1101]._m1 + vec2(_22._m0[_1101]._m2)) - _21._m33;
                                                            float _1163;
                                                            _1163 = 0.0;
                                                            for (int _1166 = 0; _1166 < 12; )
                                                            {
                                                                float _1171 = float(uint(_1166));
                                                                float _1174 = sqrt(_1171 + 0.5) * 0.288675129413604736328125;
                                                                float _1175 = fma(_1171, 2.3999631404876708984375, _1157);
                                                                vec2 _1183 = clamp(fma((vec3(cos(_1175), sin(_1175), _1174).xy * _1174) * 2.5, _21._m33, _1142), _1158, _1161);
                                                                vec2 _1186 = fract(fma(vec2(1.0) / _21._m33, _1183, vec2(0.5)));
                                                                vec4 _1192 = vec4(lessThan(vec4(_1151), textureGather(sampler2D(_23, _14), _1183)));
                                                                float _1195 = _1186.x;
                                                                _1163 += clamp(mix(mix(_1192.w, _1192.z, _1195), mix(_1192.x, _1192.y, _1195), _1186.y), 0.0, 1.0);
                                                                _1166++;
                                                                continue;
                                                            }
                                                            _1204 = _1156;
                                                            _1205 = _993 ? _993 : true;
                                                            _1206 = _1163 * 0.083333335816860198974609375;
                                                            break;
                                                        }
                                                        break; // unreachable workaround
                                                    } while(false);
                                                    _1210 = _1204;
                                                    _1211 = _1205;
                                                    _1212 = _1074 * mix(1.0, _1206, spvNMin(_942, _11._m0[_1002]._m8));
                                                }
                                                else
                                                {
                                                    _1210 = _991;
                                                    _1211 = _993;
                                                    _1212 = _1074;
                                                }
                                                vec3 _1387;
                                                vec3 _1388;
                                                SPIRV_CROSS_BRANCH
                                                if (_11._m0[_1002]._m3 < 0.0)
                                                {
                                                    vec3 _1385;
                                                    vec3 _1386;
                                                    if (_1055 > 0.0)
                                                    {
                                                        vec3 _1305 = _11._m0[_1002]._m1.xyz * (_1212 * _6._m0[0u]);
                                                        vec3 _1312 = vec3(fma((2.0 * _1051) * _1051, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                        float _1333 = (_894 + 1.0) * 0.5;
                                                        float _1334 = _894 * _894;
                                                        float _1342 = _1333 * _1333;
                                                        float _1347 = -_1055;
                                                        float _1354 = _1334 * _1334;
                                                        float _1355 = -_1053;
                                                        float _1357 = fma(fma(_1053, _1354, _1355), _1053, 1.0);
                                                        float _1374 = clamp(_984, 0.0, 1.0);
                                                        _1385 = fma(_1305, (((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _1051), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1055, sqrt(fma(fma(-_984, _1342, _984), _984, _1342)), _984 * sqrt(fma(fma(_1347, _1342, _1055), _1055, _1342)))) * (_1354 * (0.3183098733425140380859375 / (_1357 * _1357))))) * _858.w) + ((_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(_1355, _1053, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(_1347, _1374, _1055 + _1374)))) * (1.0 - _858.w)), _986);
                                                        _1386 = fma(_1305, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1312 * pow(spvNMax(abs(1.0 - _1055), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1312 * pow(spvNMax(abs(1.0 - _984), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _989);
                                                    }
                                                    else
                                                    {
                                                        _1385 = _986;
                                                        _1386 = _989;
                                                    }
                                                    _1387 = _1385;
                                                    _1388 = _1386;
                                                }
                                                else
                                                {
                                                    vec3 _1299;
                                                    vec3 _1300;
                                                    if (_1055 > 0.0)
                                                    {
                                                        vec3 _1219 = _11._m0[_1002]._m1.xyz * _1212;
                                                        vec3 _1226 = vec3(fma((2.0 * _1051) * _1051, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                        float _1247 = (_894 + 1.0) * 0.5;
                                                        float _1248 = _894 * _894;
                                                        float _1256 = _1247 * _1247;
                                                        float _1261 = -_1055;
                                                        float _1268 = _1248 * _1248;
                                                        float _1269 = -_1053;
                                                        float _1271 = fma(fma(_1053, _1268, _1269), _1053, 1.0);
                                                        float _1288 = clamp(_984, 0.0, 1.0);
                                                        _1299 = fma(_1219, (((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _1051), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1055, sqrt(fma(fma(-_984, _1256, _984), _984, _1256)), _984 * sqrt(fma(fma(_1261, _1256, _1055), _1055, _1256)))) * (_1268 * (0.3183098733425140380859375 / (_1271 * _1271))))) * _858.w) + ((_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(_1269, _1053, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(_1261, _1288, _1055 + _1288)))) * (1.0 - _858.w)), _986);
                                                        _1300 = fma(_1219, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1226 * pow(spvNMax(abs(1.0 - _1055), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1226 * pow(spvNMax(abs(1.0 - _984), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _989);
                                                    }
                                                    else
                                                    {
                                                        _1299 = _986;
                                                        _1300 = _989;
                                                    }
                                                    _1387 = _1299;
                                                    _1388 = _1300;
                                                }
                                                _1389 = _1387;
                                                _1390 = _1388;
                                                _1391 = _1210;
                                                _1392 = _1211;
                                            }
                                            else
                                            {
                                                _1389 = _986;
                                                _1390 = _989;
                                                _1391 = _991;
                                                _1392 = _993;
                                            }
                                            _987 = _1389;
                                            _990 = _1390;
                                            _992 = _1391;
                                            _994 = _1392;
                                        }
                                        else
                                        {
                                            _987 = _986;
                                            _990 = _989;
                                            _992 = _991;
                                            _994 = _993;
                                        }
                                    }
                                    vec3 _1394;
                                    vec3 _1397;
                                    float _1399;
                                    bool _1401;
                                    uint _1403;
                                    _1394 = _986;
                                    _1397 = _989;
                                    _1399 = _991;
                                    _1401 = _993;
                                    _1403 = _995;
                                    vec3 _1395;
                                    vec3 _1398;
                                    float _1400;
                                    bool _1402;
                                    for (; _1403 < _978; _1394 = _1395, _1397 = _1398, _1399 = _1400, _1401 = _1402, _1403++)
                                    {
                                        uint _1410 = uint(_10._m0[_1403]);
                                        float _1423 = abs(_11._m0[_1410]._m5);
                                        if ((_11._m0[_1410]._m6 & (1u << (_617 & 31u))) != 0u)
                                        {
                                            vec3 _1441 = _11._m0[_1410]._m0.xyz - _859;
                                            float _1442 = dot(_1441, _1441);
                                            vec3 _1445 = _1441 * inversesqrt(spvNMax(_1442, 1.0000000133514319600180897396058e-10));
                                            float _1446 = _11._m0[_1410]._m0.w * _11._m0[_1410]._m0.w;
                                            vec3 _1785;
                                            vec3 _1786;
                                            float _1787;
                                            bool _1788;
                                            if (_1442 < (1.0 / _1446))
                                            {
                                                vec3 _1451 = _861 + _1445;
                                                vec3 _1455 = _1451 * inversesqrt(spvNMax(dot(_1451, _1451), 1.0000000133514319600180897396058e-10));
                                                float _1457 = clamp(dot(_1445, _1455), 0.0, 1.0);
                                                float _1459 = clamp(dot(_673, _1455), 0.0, 1.0);
                                                float _1461 = clamp(dot(_673, _1445), 0.0, 1.0);
                                                float _1464 = dot(-_1445, normalize(_11._m0[_1410]._m2.xyz));
                                                float _1493;
                                                if (_1464 > _11._m0[_1410]._m1.w)
                                                {
                                                    float _1468 = _1442 * _1446;
                                                    float _1474 = pow(spvNMax(abs(clamp(fma(-_1468, _1468, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1410]._m4);
                                                    float _1484;
                                                    if (_11._m0[_1410]._m5 < 0.0)
                                                    {
                                                        _1484 = _1474 * fma(4.0, _1446, _1423);
                                                    }
                                                    else
                                                    {
                                                        _1484 = _1474 * ((1.0 / spvNMax(_1442, 9.9999997473787516355514526367188e-05)) + _1423);
                                                    }
                                                    float _1489 = clamp((_1464 - _11._m0[_1410]._m1.w) / spvNMax(_11._m0[_1410]._m2.w - _11._m0[_1410]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                                    _1493 = _1461 * (_1484 * (_1489 * _1489));
                                                }
                                                else
                                                {
                                                    _1493 = 0.0;
                                                }
                                                float _1494 = 0.3183098733425140380859375 * _1493;
                                                float _1606;
                                                bool _1607;
                                                float _1608;
                                                if ((_11._m0[_1410]._m7 & 1u) != 0u)
                                                {
                                                    uint _1497 = uint(int(_11._m0[_1410]._m7 >> 2u));
                                                    float _1600;
                                                    bool _1601;
                                                    float _1602;
                                                    do
                                                    {
                                                        SPIRV_CROSS_BRANCH
                                                        if ((_1461 <= 0.0) && (!_857))
                                                        {
                                                            _1600 = _1399;
                                                            _1601 = _1401;
                                                            _1602 = 0.0;
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            vec4 _1531 = _22._m0[_1497]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_1461)))) * (_22._m0[_1497]._m4 * sqrt(_1442)))), 1.0);
                                                            vec3 _1535 = _1531.xyz / vec3(_1531.w);
                                                            vec2 _1538 = (_1535.xy * 0.5) + vec2(0.5);
                                                            _1538.y = 1.0 - _1538.y;
                                                            float _1547 = (_22._m0[_1497]._m5.y / _22._m0[_1497]._m6) / (_1535.z - _22._m0[_1497]._m5.x);
                                                            float _1552 = _1401 ? _1399 : 6.283185482025146484375;
                                                            float _1553 = _935 * _1552;
                                                            vec2 _1554 = _22._m0[_1497]._m1 + _21._m33;
                                                            vec2 _1557 = (_22._m0[_1497]._m1 + vec2(_22._m0[_1497]._m2)) - _21._m33;
                                                            float _1559;
                                                            _1559 = 0.0;
                                                            for (int _1562 = 0; _1562 < 12; )
                                                            {
                                                                float _1567 = float(uint(_1562));
                                                                float _1570 = sqrt(_1567 + 0.5) * 0.288675129413604736328125;
                                                                float _1571 = fma(_1567, 2.3999631404876708984375, _1553);
                                                                vec2 _1579 = clamp(fma((vec3(cos(_1571), sin(_1571), _1570).xy * _1570) * 2.5, _21._m33, _1538), _1554, _1557);
                                                                vec2 _1582 = fract(fma(vec2(1.0) / _21._m33, _1579, vec2(0.5)));
                                                                vec4 _1588 = vec4(lessThan(vec4(_1547), textureGather(sampler2D(_23, _14), _1579)));
                                                                float _1591 = _1582.x;
                                                                _1559 += clamp(mix(mix(_1588.w, _1588.z, _1591), mix(_1588.x, _1588.y, _1591), _1582.y), 0.0, 1.0);
                                                                _1562++;
                                                                continue;
                                                            }
                                                            _1600 = _1552;
                                                            _1601 = _1401 ? _1401 : true;
                                                            _1602 = _1559 * 0.083333335816860198974609375;
                                                            break;
                                                        }
                                                        break; // unreachable workaround
                                                    } while(false);
                                                    _1606 = _1600;
                                                    _1607 = _1601;
                                                    _1608 = _1494 * mix(1.0, _1602, spvNMin(_942, _11._m0[_1410]._m8));
                                                }
                                                else
                                                {
                                                    _1606 = _1399;
                                                    _1607 = _1401;
                                                    _1608 = _1494;
                                                }
                                                vec3 _1783;
                                                vec3 _1784;
                                                SPIRV_CROSS_BRANCH
                                                if (_11._m0[_1410]._m3 < 0.0)
                                                {
                                                    vec3 _1781;
                                                    vec3 _1782;
                                                    if (_1461 > 0.0)
                                                    {
                                                        vec3 _1701 = _11._m0[_1410]._m1.xyz * (_1608 * _6._m0[0u]);
                                                        vec3 _1708 = vec3(fma((2.0 * _1457) * _1457, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                        float _1729 = (_894 + 1.0) * 0.5;
                                                        float _1730 = _894 * _894;
                                                        float _1738 = _1729 * _1729;
                                                        float _1743 = -_1461;
                                                        float _1750 = _1730 * _1730;
                                                        float _1751 = -_1459;
                                                        float _1753 = fma(fma(_1459, _1750, _1751), _1459, 1.0);
                                                        float _1770 = clamp(_984, 0.0, 1.0);
                                                        _1781 = fma(_1701, (((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _1457), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1461, sqrt(fma(fma(-_984, _1738, _984), _984, _1738)), _984 * sqrt(fma(fma(_1743, _1738, _1461), _1461, _1738)))) * (_1750 * (0.3183098733425140380859375 / (_1753 * _1753))))) * _858.w) + ((_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(_1751, _1459, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(_1743, _1770, _1461 + _1770)))) * (1.0 - _858.w)), _1394);
                                                        _1782 = fma(_1701, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1708 * pow(spvNMax(abs(1.0 - _1461), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1708 * pow(spvNMax(abs(1.0 - _984), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _1397);
                                                    }
                                                    else
                                                    {
                                                        _1781 = _1394;
                                                        _1782 = _1397;
                                                    }
                                                    _1783 = _1781;
                                                    _1784 = _1782;
                                                }
                                                else
                                                {
                                                    vec3 _1695;
                                                    vec3 _1696;
                                                    if (_1461 > 0.0)
                                                    {
                                                        vec3 _1615 = _11._m0[_1410]._m1.xyz * _1608;
                                                        vec3 _1622 = vec3(fma((2.0 * _1457) * _1457, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                        float _1643 = (_894 + 1.0) * 0.5;
                                                        float _1644 = _894 * _894;
                                                        float _1652 = _1643 * _1643;
                                                        float _1657 = -_1461;
                                                        float _1664 = _1644 * _1644;
                                                        float _1665 = -_1459;
                                                        float _1667 = fma(fma(_1459, _1664, _1665), _1459, 1.0);
                                                        float _1684 = clamp(_984, 0.0, 1.0);
                                                        _1695 = fma(_1615, (((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _1457), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1461, sqrt(fma(fma(-_984, _1652, _984), _984, _1652)), _984 * sqrt(fma(fma(_1657, _1652, _1461), _1461, _1652)))) * (_1664 * (0.3183098733425140380859375 / (_1667 * _1667))))) * _858.w) + ((_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(_1665, _1459, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(_1657, _1684, _1461 + _1684)))) * (1.0 - _858.w)), _1394);
                                                        _1696 = fma(_1615, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1622 * pow(spvNMax(abs(1.0 - _1461), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1622 * pow(spvNMax(abs(1.0 - _984), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _1397);
                                                    }
                                                    else
                                                    {
                                                        _1695 = _1394;
                                                        _1696 = _1397;
                                                    }
                                                    _1783 = _1695;
                                                    _1784 = _1696;
                                                }
                                                _1785 = _1783;
                                                _1786 = _1784;
                                                _1787 = _1606;
                                                _1788 = _1607;
                                            }
                                            else
                                            {
                                                _1785 = _1394;
                                                _1786 = _1397;
                                                _1787 = _1399;
                                                _1788 = _1401;
                                            }
                                            _1395 = _1785;
                                            _1398 = _1786;
                                            _1400 = _1787;
                                            _1402 = _1788;
                                        }
                                        else
                                        {
                                            _1395 = _1394;
                                            _1398 = _1397;
                                            _1400 = _1399;
                                            _1402 = _1401;
                                        }
                                    }
                                    vec3 _1790;
                                    vec3 _1793;
                                    _1790 = _1394;
                                    _1793 = _1397;
                                    vec3 _1791;
                                    vec3 _1794;
                                    float _1796;
                                    bool _1798;
                                    float _1795 = _1399;
                                    bool _1797 = _1401;
                                    uint _1799 = _1403;
                                    for (; _1799 < _982; _1790 = _1791, _1793 = _1794, _1795 = _1796, _1797 = _1798, _1799++)
                                    {
                                        uint _1806 = uint(_10._m0[_1799]);
                                        int _1835 = int(_13._m0[_1806]._m1 >> 1u) - 1;
                                        if (((_13._m0[_1806]._m4 & 16777215u) & (1u << (_617 & 31u))) != 0u)
                                        {
                                            vec3 _1846 = _13._m0[_1806]._m6 * vec4(_859, 1.0);
                                            vec3 _2277;
                                            vec3 _2278;
                                            float _2279;
                                            bool _2280;
                                            if (all(lessThan(abs(_1846 - vec3(0.5)), vec3(0.5))))
                                            {
                                                vec3 _1853 = _861 + _13._m0[_1806]._m9;
                                                vec3 _1857 = _1853 * inversesqrt(spvNMax(dot(_1853, _1853), 1.0000000133514319600180897396058e-10));
                                                float _1859 = clamp(dot(_13._m0[_1806]._m9, _1857), 0.0, 1.0);
                                                float _1861 = clamp(dot(_673, _1857), 0.0, 1.0);
                                                float _1863 = clamp(dot(_673, _13._m0[_1806]._m9), 0.0, 1.0);
                                                int _1864 = int(_13._m0[_1806]._m4 >> 24u);
                                                float _1865 = _1846.z;
                                                vec3 _1904;
                                                if (_1865 < _13._m0[_1806]._m2.x)
                                                {
                                                    float _1892 = _1865 * _13._m0[_1806]._m2.z;
                                                    float _1895 = _1892 * _1892;
                                                    vec3 _1903;
                                                    _1903.z = dot(_408[_1864], vec4(_1892, _1895, smoothstep(0.0, 1.0, _1892), (_1895 * _1892) * fma(_1892, fma(_1892, 6.0, -15.0), 10.0)));
                                                    _1904 = _1903;
                                                }
                                                else
                                                {
                                                    vec3 _1890;
                                                    if (_1865 > _13._m0[_1806]._m2.y)
                                                    {
                                                        float _1878 = (1.0 - _1865) * _13._m0[_1806]._m2.w;
                                                        float _1881 = _1878 * _1878;
                                                        vec3 _1889;
                                                        _1889.z = dot(_408[_1864], vec4(_1878, _1881, smoothstep(0.0, 1.0, _1878), (_1881 * _1878) * fma(_1878, fma(_1878, 6.0, -15.0), 10.0)));
                                                        _1890 = _1889;
                                                    }
                                                    else
                                                    {
                                                        _1890 = vec3(0.0, 0.0, 1.0);
                                                    }
                                                    _1904 = _1890;
                                                }
                                                vec2 _1905 = _1846.xy;
                                                vec2 _1909 = (vec2(0.5) - abs(_1905 - vec2(0.5))) * _13._m0[_1806]._m3;
                                                float _1910 = _1909.x;
                                                vec3 _1927;
                                                if (_1910 < 1.0)
                                                {
                                                    float _1918 = _1910 * _1910;
                                                    vec3 _1926 = _1904;
                                                    _1926.x = dot(_408[_1864], vec4(_1910, _1918, smoothstep(0.0, 1.0, _1910), (_1918 * _1910) * fma(_1910, fma(_1910, 6.0, -15.0), 10.0)));
                                                    _1927 = _1926;
                                                }
                                                else
                                                {
                                                    vec3 _1915 = _1904;
                                                    _1915.x = 1.0;
                                                    _1927 = _1915;
                                                }
                                                float _1928 = _1909.y;
                                                vec3 _1945;
                                                if (_1928 < 1.0)
                                                {
                                                    float _1936 = _1928 * _1928;
                                                    vec3 _1944 = _1927;
                                                    _1944.y = dot(_408[_1864], vec4(_1928, _1936, smoothstep(0.0, 1.0, _1928), (_1936 * _1928) * fma(_1928, fma(_1928, 6.0, -15.0), 10.0)));
                                                    _1945 = _1944;
                                                }
                                                else
                                                {
                                                    vec3 _1933 = _1927;
                                                    _1933.y = 1.0;
                                                    _1945 = _1933;
                                                }
                                                float _1951 = _1863 * ((_1945.x * _1945.y) * _1945.z);
                                                float _2057;
                                                bool _2058;
                                                float _2059;
                                                if ((_13._m0[_1806]._m8 & 1u) != 0u)
                                                {
                                                    uint _1954 = uint(int(_13._m0[_1806]._m8 >> 2u));
                                                    float _2051;
                                                    bool _2052;
                                                    float _2053;
                                                    do
                                                    {
                                                        SPIRV_CROSS_BRANCH
                                                        if ((_1863 <= 0.0) && (!_857))
                                                        {
                                                            _2051 = _1795;
                                                            _2052 = _1797;
                                                            _2053 = 0.0;
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            vec4 _1986 = _22._m0[_1954]._m0 * vec4(_859 + (_673 * ((3.5 * float(int(sign(_1863)))) * _22._m0[_1954]._m4)), 1.0);
                                                            vec2 _1989 = (_1986.xy * 0.5) + vec2(0.5);
                                                            _1989.y = 1.0 - _1989.y;
                                                            float _1998 = ((_1986.z - _22._m0[_1954]._m5.y) / _22._m0[_1954]._m5.x) / _22._m0[_1954]._m6;
                                                            float _2003 = _1797 ? _1795 : 6.283185482025146484375;
                                                            float _2004 = _935 * _2003;
                                                            vec2 _2005 = _22._m0[_1954]._m1 + _21._m33;
                                                            vec2 _2008 = (_22._m0[_1954]._m1 + vec2(_22._m0[_1954]._m2)) - _21._m33;
                                                            float _2010;
                                                            _2010 = 0.0;
                                                            for (int _2013 = 0; _2013 < 12; )
                                                            {
                                                                float _2018 = float(uint(_2013));
                                                                float _2021 = sqrt(_2018 + 0.5) * 0.288675129413604736328125;
                                                                float _2022 = fma(_2018, 2.3999631404876708984375, _2004);
                                                                vec2 _2030 = clamp(fma((vec3(cos(_2022), sin(_2022), _2021).xy * _2021) * 2.5, _21._m33, _1989), _2005, _2008);
                                                                vec2 _2033 = fract(fma(vec2(1.0) / _21._m33, _2030, vec2(0.5)));
                                                                vec4 _2039 = vec4(lessThan(vec4(_1998), textureGather(sampler2D(_23, _14), _2030)));
                                                                float _2042 = _2033.x;
                                                                _2010 += clamp(mix(mix(_2039.w, _2039.z, _2042), mix(_2039.x, _2039.y, _2042), _2033.y), 0.0, 1.0);
                                                                _2013++;
                                                                continue;
                                                            }
                                                            _2051 = _2003;
                                                            _2052 = _1797 ? _1797 : true;
                                                            _2053 = _2010 * 0.083333335816860198974609375;
                                                            break;
                                                        }
                                                        break; // unreachable workaround
                                                    } while(false);
                                                    _2057 = _2051;
                                                    _2058 = _2052;
                                                    _2059 = _1951 * mix(1.0, _2053, spvNMin(_942, _13._m0[_1806]._m5));
                                                }
                                                else
                                                {
                                                    _2057 = _1795;
                                                    _2058 = _1797;
                                                    _2059 = _1951;
                                                }
                                                vec3 _2100;
                                                if (_1835 >= 0)
                                                {
                                                    uint _2064 = gl_SubgroupInvocationID & 3u;
                                                    vec2 _2070 = (subgroupQuadSwapHorizontal(_1905) - _1905) * (((_2064 & 1u) != 0u) ? (-1.0) : 1.0);
                                                    vec2 _2076 = (subgroupQuadSwapVertical(_1905) - _1905) * (((_2064 & 2u) != 0u) ? (-1.0) : 1.0);
                                                    vec2 _2080 = mix(_2070, vec2(0.0), bvec2(any(isnan(_2070))));
                                                    vec2 _2084 = mix(_2076, vec2(0.0), bvec2(any(isnan(_2076))));
                                                    bvec2 _2093 = bvec2(any(greaterThan(abs(vec4(_2080, _2084)), vec4(0.015625))));
                                                    int _81 = _1835;
                                                    _2100 = _13._m0[_1806]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_81], _7)), _1905, mix(_2080, vec2(0.0), _2093), mix(_2084, vec2(0.0), _2093)).xyz;
                                                }
                                                else
                                                {
                                                    _2100 = _13._m0[_1806]._m0;
                                                }
                                                vec3 _2275;
                                                vec3 _2276;
                                                SPIRV_CROSS_BRANCH
                                                if ((_13._m0[_1806]._m1 & 1u) != 0u)
                                                {
                                                    vec3 _2273;
                                                    vec3 _2274;
                                                    if (_1863 > 0.0)
                                                    {
                                                        vec3 _2193 = _2100 * (_2059 * _6._m0[0u]);
                                                        vec3 _2200 = vec3(fma((2.0 * _1859) * _1859, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                        float _2221 = (_894 + 1.0) * 0.5;
                                                        float _2222 = _894 * _894;
                                                        float _2230 = _2221 * _2221;
                                                        float _2235 = -_1863;
                                                        float _2242 = _2222 * _2222;
                                                        float _2243 = -_1861;
                                                        float _2245 = fma(fma(_1861, _2242, _2243), _1861, 1.0);
                                                        float _2262 = clamp(_984, 0.0, 1.0);
                                                        _2273 = fma(_2193, (((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _1859), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1863, sqrt(fma(fma(-_984, _2230, _984), _984, _2230)), _984 * sqrt(fma(fma(_2235, _2230, _1863), _1863, _2230)))) * (_2242 * (0.3183098733425140380859375 / (_2245 * _2245))))) * _858.w) + ((_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(_2243, _1861, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(_2235, _2262, _1863 + _2262)))) * (1.0 - _858.w)), _1790);
                                                        _2274 = fma(_2193, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2200 * pow(spvNMax(abs(1.0 - _1863), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2200 * pow(spvNMax(abs(1.0 - _984), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _1793);
                                                    }
                                                    else
                                                    {
                                                        _2273 = _1790;
                                                        _2274 = _1793;
                                                    }
                                                    _2275 = _2273;
                                                    _2276 = _2274;
                                                }
                                                else
                                                {
                                                    vec3 _2187;
                                                    vec3 _2188;
                                                    if (_1863 > 0.0)
                                                    {
                                                        vec3 _2107 = _2100 * _2059;
                                                        vec3 _2114 = vec3(fma((2.0 * _1859) * _1859, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                                        float _2135 = (_894 + 1.0) * 0.5;
                                                        float _2136 = _894 * _894;
                                                        float _2144 = _2135 * _2135;
                                                        float _2149 = -_1863;
                                                        float _2156 = _2136 * _2136;
                                                        float _2157 = -_1861;
                                                        float _2159 = fma(fma(_1861, _2156, _2157), _1861, 1.0);
                                                        float _2176 = clamp(_984, 0.0, 1.0);
                                                        _2187 = fma(_2107, (((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - _1859), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1863, sqrt(fma(fma(-_984, _2144, _984), _984, _2144)), _984 * sqrt(fma(fma(_2149, _2144, _1863), _1863, _2144)))) * (_2156 * (0.3183098733425140380859375 / (_2159 * _2159))))) * _858.w) + ((_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(_2157, _1861, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(_2149, _2176, _1863 + _2176)))) * (1.0 - _858.w)), _1790);
                                                        _2188 = fma(_2107, _843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2114 * pow(spvNMax(abs(1.0 - _1863), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2114 * pow(spvNMax(abs(1.0 - _984), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))), _1793);
                                                    }
                                                    else
                                                    {
                                                        _2187 = _1790;
                                                        _2188 = _1793;
                                                    }
                                                    _2275 = _2187;
                                                    _2276 = _2188;
                                                }
                                                _2277 = _2275;
                                                _2278 = _2276;
                                                _2279 = _2057;
                                                _2280 = _2058;
                                            }
                                            else
                                            {
                                                _2277 = _1790;
                                                _2278 = _1793;
                                                _2279 = _1795;
                                                _2280 = _1797;
                                            }
                                            _1791 = _2277;
                                            _1794 = _2278;
                                            _1796 = _2279;
                                            _1798 = _2280;
                                        }
                                        else
                                        {
                                            _1791 = _1790;
                                            _1794 = _1793;
                                            _1796 = _1795;
                                            _1798 = _1797;
                                        }
                                    }
                                    _2281 = _1790;
                                    _2282 = _1793;
                                }
                                else
                                {
                                    _2281 = vec3(0.0);
                                    _2282 = vec3(0.0);
                                }
                                _3393 = _2281;
                                _3394 = _2282;
                            }
                            _5019 = _3393;
                            _5020 = _3394;
                        }
                        _6526 = _5019;
                        _6527 = _5020;
                    }
                    _8145 = _6526;
                    _8146 = _6527;
                }
                _9443 = _8145;
                _9444 = _8146;
            }
            _10497 = _9443;
            _10498 = _9444;
        }
        vec3 _10500 = reflect(-_861, _673);
        float _10501 = dot(_861, _673);
        float _10505;
        if (_633)
        {
            _10505 = abs(_10501);
        }
        else
        {
            _10505 = _10501;
        }
        bool _10506 = _615 == 7u;
        vec3 _10512 = mix(_844, mix(_858.xyz, _844, vec3(_858.w)), bvec3(_10506));
        vec3 _10522 = textureLod(samplerCube(_16, _7), _673, 0.0).xyz * _21._m27;
        float _10525 = fma(_894, 8.0, _21._m30 - 8.0);
        vec3 _10529 = textureLod(samplerCube(_17, _7), _10500, _10525).xyz * _21._m27;
        bool _10532 = _21._m29 > 0.0;
        vec3 _10554;
        vec3 _10555;
        SPIRV_CROSS_BRANCH
        if (_10532)
        {
            vec3 _10544 = vec3(_21._m29);
            _10554 = mix(_10529, textureLod(samplerCube(_19, _7), _10500, fma(_894, 8.0, _21._m31 - 8.0)).xyz * _21._m28, _10544);
            _10555 = mix(_10522, textureLod(samplerCube(_18, _7), _673, 0.0).xyz * _21._m28, _10544);
        }
        else
        {
            _10554 = _10529;
            _10555 = _10522;
        }
        float _10556 = spvNMax(_10505, 0.001953125);
        vec4 _10561 = textureLod(sampler2D(_20, _14), vec2(_10556, _894), 0.0);
        vec3 _10564 = _10555 * (_843 * _10561.z);
        vec3 _10570 = _10554 * ((_10512 * _10561.x) + vec3(_10561.y));
        float _10627;
        vec3 _10628;
        vec3 _10629;
        if (_633)
        {
            vec3 _10573 = -_673;
            float _10575 = abs(dot(_861, _10573));
            vec3 _10576 = -_10500;
            vec3 _10580 = textureLod(samplerCube(_16, _7), _10573, 0.0).xyz * _21._m27;
            vec3 _10584 = textureLod(samplerCube(_17, _7), _10576, _10525).xyz * _21._m27;
            vec3 _10606;
            vec3 _10607;
            SPIRV_CROSS_BRANCH
            if (_10532)
            {
                vec3 _10596 = vec3(_21._m29);
                _10606 = mix(_10584, textureLod(samplerCube(_19, _7), _10576, fma(_894, 8.0, _21._m31 - 8.0)).xyz * _21._m28, _10596);
                _10607 = mix(_10580, textureLod(samplerCube(_18, _7), _10573, 0.0).xyz * _21._m28, _10596);
            }
            else
            {
                _10606 = _10584;
                _10607 = _10580;
            }
            vec4 _10611 = textureLod(sampler2D(_20, _14), vec2(spvNMax(_10575, 0.001953125), _894), 0.0);
            _10627 = _10575;
            _10628 = (_10570 * 0.300000011920928955078125) + ((_10606 * ((_10512 * _10611.x) + vec3(_10611.y))) * 0.699999988079071044921875);
            _10629 = (_10564 * 0.300000011920928955078125) + ((_10607 * (_843 * _10611.z)) * 0.699999988079071044921875);
        }
        else
        {
            _10627 = _10505;
            _10628 = _10570;
            _10629 = _10564;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_10555, _894);
            _10628 *= rdx_mod;
            _10629 *= rdx_mod;
        }
        uvec4 _10633 = uvec4(_9._m0[uint(_926)]);
        uint _10635 = _10633.y;
        uint _10645 = ((_10633.z >> 0u) & 1023u) + (((_10635 >> 12u) & 4095u) + (((_10635 >> 0u) & 4095u) + _10633.x));
        uint _10647 = (_10635 >> 24u) + _10645;
        vec3 _10649;
        vec3 _10652;
        _10649 = _10628;
        _10652 = _10629;
        vec3 _10650;
        vec3 _10653;
        for (uint _10654 = _10645; _10654 < _10647; _10649 = _10650, _10652 = _10653, _10654++)
        {
            uint _10661 = uint(_10._m0[_10654]);
            int _10680 = int((_15._m0[_10661]._m5 >> 1u) & 3u);
            mat3 _10684 = mat3(_15._m0[_10661]._m1[0], _15._m0[_10661]._m1[1], _15._m0[_10661]._m1[2]);
            int _10690 = (int((_15._m0[_10661]._m5 >> 3u) & 16383u) - 1) * 2;
            int _10695 = (int((_15._m0[_10661]._m5 >> 17u) & 16383u) - 1) * 2;
            int _10700 = (int((_15._m0[_10661]._m6 >> 0u) & 65535u) - 1) * 2;
            int _10705 = (int((_15._m0[_10661]._m6 >> 16u) & 65535u) - 1) * 2;
            float _10708 = (_15._m0[_10661]._m3 < 0.0) ? (-_15._m0[_10661]._m3) : 1.0;
            vec3 _10710 = _10684 * (_859 - _15._m0[_10661]._m1[3]);
            bool _10711 = int(_15._m0[_10661]._m5 & 1u) == 1;
            vec3 _10712 = abs(_10710);
            float _10715 = dot(_10710, _10710);
            if (_10711 ? any(greaterThanEqual(_10712, _15._m0[_10661]._m0.xyz)) : (_10715 >= _15._m0[_10661]._m0.y))
            {
                _10650 = _10649;
                _10653 = _10652;
                continue;
            }
            vec3 _11057;
            SPIRV_CROSS_FLATTEN
            if ((_10680 & 1) != 0)
            {
                vec3 _10725 = _10684 * _673;
                vec2 _10814;
                bool _10815;
                if (_10711)
                {
                    vec2 _10809;
                    bool _10813;
                    do
                    {
                        vec3 _10793 = (_15._m0[_10661]._m0.xyz - _10710) / _10725;
                        vec3 _10796 = ((-_15._m0[_10661]._m0.xyz) - _10710) / _10725;
                        vec3 _10797 = spvNMin(_10793, _10796);
                        vec3 _10798 = spvNMax(_10793, _10796);
                        float _10803 = spvNMax(_10797.x, spvNMax(_10797.y, _10797.z));
                        float _10808 = spvNMin(_10798.x, spvNMin(_10798.y, _10798.z));
                        _10809 = vec2(_10803, _10808);
                        if (_10803 > _10808)
                        {
                            _10813 = false;
                            break;
                        }
                        _10813 = true;
                        break;
                    } while(false);
                    _10814 = _10809;
                    _10815 = _10813;
                }
                else
                {
                    vec2 _10788;
                    bool _10789;
                    do
                    {
                        float _10731 = dot(_10725, _10725);
                        float _10732 = dot(_10725, _10710);
                        float _10733 = 2.0 * _10732;
                        float _10734 = _10715 - _15._m0[_10661]._m0.y;
                        float _10770;
                        float _10771;
                        bool _10772;
                        do
                        {
                            float _10740 = fma(_10733, _10733, -((4.0 * _10731) * _10734));
                            float _10768;
                            float _10769;
                            if (_10740 < 0.0)
                            {
                                _10770 = 0.0;
                                _10771 = 0.0;
                                _10772 = false;
                                break;
                            }
                            else
                            {
                                if (_10740 == 0.0)
                                {
                                    float _10767 = (_10732 * (-1.0)) * (1.0 / _10731);
                                    _10768 = _10767;
                                    _10769 = _10767;
                                }
                                else
                                {
                                    float _10760;
                                    if (_10733 > 0.0)
                                    {
                                        _10760 = (-0.5) * fma(2.0, _10732, sqrt(_10740));
                                    }
                                    else
                                    {
                                        _10760 = (-0.5) * fma(2.0, _10732, -sqrt(_10740));
                                    }
                                    _10768 = _10734 * (1.0 / _10760);
                                    _10769 = _10760 * (1.0 / _10731);
                                }
                            }
                            _10770 = _10768;
                            _10771 = _10769;
                            _10772 = true;
                            break;
                        } while(false);
                        if (!_10772)
                        {
                            _10788 = vec2(0.0);
                            _10789 = false;
                            break;
                        }
                        if ((_10771 < 0.0) && (_10770 < 0.0))
                        {
                            _10788 = vec2(0.0);
                            _10789 = false;
                            break;
                        }
                        vec2 _10787;
                        if (_10771 > _10770)
                        {
                            _10787 = vec2(_10770, _10771);
                        }
                        else
                        {
                            _10787 = vec2(_10771, _10770);
                        }
                        _10788 = _10787;
                        _10789 = true;
                        break;
                    } while(false);
                    _10814 = _10788;
                    _10815 = _10789;
                }
                vec3 _10818 = _10710 + (_10725 * _10814.y);
                float _10839;
                if (_10711)
                {
                    _10839 = 1.0 - clamp(length(spvNMax(_10712 - (_15._m0[_10661]._m0.xyz - vec3(_15._m0[_10661]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _10839 = clamp((_15._m0[_10661]._m0.x - length(_10710)) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _10842 = float(_10815) * smoothstep(0.0, 1.0, _10839);
                vec4 _10884;
                SPIRV_CROSS_BRANCH
                if (_10842 > 9.9999997473787516355514526367188e-05)
                {
                    float _10851 = mix(clamp((_10814.y * (1.0 / length(_10818))) * _894, 0.0, _894), _894, _894);
                    vec3 _10853 = mix(_10818, _10725, vec3(_10851));
                    int _109 = _10690;
                    vec4 _10854 = textureLod(nonuniformEXT(samplerCube(_26[_109], _7)), _10853, 0.0);
                    int _113 = _10690 + 1;
                    _10854.w = textureLod(nonuniformEXT(samplerCube(_26[_113], _7)), _10853, 0.0).x;
                    vec4 _10869;
                    SPIRV_CROSS_BRANCH
                    if (_10695 >= 0)
                    {
                        int _117 = _10695;
                        vec4 _10862 = textureLod(nonuniformEXT(samplerCube(_26[_117], _7)), _10853, 0.0);
                        int _121 = _10695 + 1;
                        _10862.w = textureLod(nonuniformEXT(samplerCube(_26[_121], _7)), _10853, 0.0).x;
                        _10869 = mix(_10854, _10862, vec4(_15._m0[_10661]._m3));
                    }
                    else
                    {
                        _10869 = _10854;
                    }
                    vec4 _10870 = _10869 * _10708;
                    vec3 _10879 = (_10870.xyz * _15._m0[_10661]._m4).xyz * (_843 * textureLod(sampler2D(_20, _14), vec2(_10556, _10851), 0.0).z);
                    vec4 _10880 = vec4(_10879.x, _10879.y, _10879.z, _10870.w);
                    _10880.w = _10870.w * _10842;
                    _10884 = _10880;
                }
                else
                {
                    _10884 = vec4(0.0);
                }
                vec4 _11052;
                if (_633)
                {
                    vec3 _10888 = _10684 * (-_673);
                    vec2 _10977;
                    bool _10978;
                    if (_10711)
                    {
                        vec2 _10972;
                        bool _10976;
                        do
                        {
                            vec3 _10956 = (_15._m0[_10661]._m0.xyz - _10710) / _10888;
                            vec3 _10959 = ((-_15._m0[_10661]._m0.xyz) - _10710) / _10888;
                            vec3 _10960 = spvNMin(_10956, _10959);
                            vec3 _10961 = spvNMax(_10956, _10959);
                            float _10966 = spvNMax(_10960.x, spvNMax(_10960.y, _10960.z));
                            float _10971 = spvNMin(_10961.x, spvNMin(_10961.y, _10961.z));
                            _10972 = vec2(_10966, _10971);
                            if (_10966 > _10971)
                            {
                                _10976 = false;
                                break;
                            }
                            _10976 = true;
                            break;
                        } while(false);
                        _10977 = _10972;
                        _10978 = _10976;
                    }
                    else
                    {
                        vec2 _10951;
                        bool _10952;
                        do
                        {
                            float _10894 = dot(_10888, _10888);
                            float _10895 = dot(_10888, _10710);
                            float _10896 = 2.0 * _10895;
                            float _10897 = _10715 - _15._m0[_10661]._m0.y;
                            float _10933;
                            float _10934;
                            bool _10935;
                            do
                            {
                                float _10903 = fma(_10896, _10896, -((4.0 * _10894) * _10897));
                                float _10931;
                                float _10932;
                                if (_10903 < 0.0)
                                {
                                    _10933 = 0.0;
                                    _10934 = 0.0;
                                    _10935 = false;
                                    break;
                                }
                                else
                                {
                                    if (_10903 == 0.0)
                                    {
                                        float _10930 = (_10895 * (-1.0)) * (1.0 / _10894);
                                        _10931 = _10930;
                                        _10932 = _10930;
                                    }
                                    else
                                    {
                                        float _10923;
                                        if (_10896 > 0.0)
                                        {
                                            _10923 = (-0.5) * fma(2.0, _10895, sqrt(_10903));
                                        }
                                        else
                                        {
                                            _10923 = (-0.5) * fma(2.0, _10895, -sqrt(_10903));
                                        }
                                        _10931 = _10897 * (1.0 / _10923);
                                        _10932 = _10923 * (1.0 / _10894);
                                    }
                                }
                                _10933 = _10931;
                                _10934 = _10932;
                                _10935 = true;
                                break;
                            } while(false);
                            if (!_10935)
                            {
                                _10951 = vec2(0.0);
                                _10952 = false;
                                break;
                            }
                            if ((_10934 < 0.0) && (_10933 < 0.0))
                            {
                                _10951 = vec2(0.0);
                                _10952 = false;
                                break;
                            }
                            vec2 _10950;
                            if (_10934 > _10933)
                            {
                                _10950 = vec2(_10933, _10934);
                            }
                            else
                            {
                                _10950 = vec2(_10934, _10933);
                            }
                            _10951 = _10950;
                            _10952 = true;
                            break;
                        } while(false);
                        _10977 = _10951;
                        _10978 = _10952;
                    }
                    vec3 _10981 = _10710 + (_10888 * _10977.y);
                    float _11002;
                    if (_10711)
                    {
                        _11002 = 1.0 - clamp(length(spvNMax(_10712 - (_15._m0[_10661]._m0.xyz - vec3(_15._m0[_10661]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    else
                    {
                        _11002 = clamp((_15._m0[_10661]._m0.x - length(_10710)) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    float _11005 = float(_10978) * smoothstep(0.0, 1.0, _11002);
                    vec4 _11048;
                    SPIRV_CROSS_BRANCH
                    if (_11005 > 9.9999997473787516355514526367188e-05)
                    {
                        float _11014 = mix(clamp((_10977.y * (1.0 / length(_10981))) * _894, 0.0, _894), _894, _894);
                        vec3 _11016 = mix(_10981, _10888, vec3(_11014));
                        int _125 = _10690;
                        vec4 _11017 = textureLod(nonuniformEXT(samplerCube(_26[_125], _7)), _11016, 0.0);
                        int _129 = _10690 + 1;
                        _11017.w = textureLod(nonuniformEXT(samplerCube(_26[_129], _7)), _11016, 0.0).x;
                        vec4 _11032;
                        SPIRV_CROSS_BRANCH
                        if (_10695 >= 0)
                        {
                            int _133 = _10695;
                            vec4 _11025 = textureLod(nonuniformEXT(samplerCube(_26[_133], _7)), _11016, 0.0);
                            int _137 = _10695 + 1;
                            _11025.w = textureLod(nonuniformEXT(samplerCube(_26[_137], _7)), _11016, 0.0).x;
                            _11032 = mix(_11017, _11025, vec4(_15._m0[_10661]._m3));
                        }
                        else
                        {
                            _11032 = _11017;
                        }
                        vec4 _11033 = _11032 * _10708;
                        vec3 _11043 = (_11033.xyz * _15._m0[_10661]._m4).xyz * (_843 * textureLod(sampler2D(_20, _14), vec2(spvNMax(_10627, 0.001953125), _11014), 0.0).z);
                        vec4 _11044 = vec4(_11043.x, _11043.y, _11043.z, _11033.w);
                        _11044.w = _11033.w * _11005;
                        _11048 = _11044;
                    }
                    else
                    {
                        _11048 = vec4(0.0);
                    }
                    _11052 = (_10884 * 0.300000011920928955078125) + (_11048 * 0.699999988079071044921875);
                }
                else
                {
                    _11052 = _10884;
                }
                _11057 = mix(_10652, _11052.xyz, vec3(_11052.w));
            }
            else
            {
                _11057 = _10652;
            }
            vec3 _11414;
            SPIRV_CROSS_FLATTEN
            if ((_10680 & 2) != 0)
            {
                vec3 _11062 = _10684 * _10500;
                vec2 _11151;
                bool _11152;
                if (_10711)
                {
                    vec2 _11146;
                    bool _11150;
                    do
                    {
                        vec3 _11130 = (_15._m0[_10661]._m0.xyz - _10710) / _11062;
                        vec3 _11133 = ((-_15._m0[_10661]._m0.xyz) - _10710) / _11062;
                        vec3 _11134 = spvNMin(_11130, _11133);
                        vec3 _11135 = spvNMax(_11130, _11133);
                        float _11140 = spvNMax(_11134.x, spvNMax(_11134.y, _11134.z));
                        float _11145 = spvNMin(_11135.x, spvNMin(_11135.y, _11135.z));
                        _11146 = vec2(_11140, _11145);
                        if (_11140 > _11145)
                        {
                            _11150 = false;
                            break;
                        }
                        _11150 = true;
                        break;
                    } while(false);
                    _11151 = _11146;
                    _11152 = _11150;
                }
                else
                {
                    vec2 _11125;
                    bool _11126;
                    do
                    {
                        float _11068 = dot(_11062, _11062);
                        float _11069 = dot(_11062, _10710);
                        float _11070 = 2.0 * _11069;
                        float _11071 = _10715 - _15._m0[_10661]._m0.y;
                        float _11107;
                        float _11108;
                        bool _11109;
                        do
                        {
                            float _11077 = fma(_11070, _11070, -((4.0 * _11068) * _11071));
                            float _11105;
                            float _11106;
                            if (_11077 < 0.0)
                            {
                                _11107 = 0.0;
                                _11108 = 0.0;
                                _11109 = false;
                                break;
                            }
                            else
                            {
                                if (_11077 == 0.0)
                                {
                                    float _11104 = (_11069 * (-1.0)) * (1.0 / _11068);
                                    _11105 = _11104;
                                    _11106 = _11104;
                                }
                                else
                                {
                                    float _11097;
                                    if (_11070 > 0.0)
                                    {
                                        _11097 = (-0.5) * fma(2.0, _11069, sqrt(_11077));
                                    }
                                    else
                                    {
                                        _11097 = (-0.5) * fma(2.0, _11069, -sqrt(_11077));
                                    }
                                    _11105 = _11071 * (1.0 / _11097);
                                    _11106 = _11097 * (1.0 / _11068);
                                }
                            }
                            _11107 = _11105;
                            _11108 = _11106;
                            _11109 = true;
                            break;
                        } while(false);
                        if (!_11109)
                        {
                            _11125 = vec2(0.0);
                            _11126 = false;
                            break;
                        }
                        if ((_11108 < 0.0) && (_11107 < 0.0))
                        {
                            _11125 = vec2(0.0);
                            _11126 = false;
                            break;
                        }
                        vec2 _11124;
                        if (_11108 > _11107)
                        {
                            _11124 = vec2(_11107, _11108);
                        }
                        else
                        {
                            _11124 = vec2(_11108, _11107);
                        }
                        _11125 = _11124;
                        _11126 = true;
                        break;
                    } while(false);
                    _11151 = _11125;
                    _11152 = _11126;
                }
                vec3 _11155 = _10710 + (_11062 * _11151.y);
                float _11176;
                if (_10711)
                {
                    _11176 = 1.0 - clamp(length(spvNMax(_10712 - (_15._m0[_10661]._m0.xyz - vec3(_15._m0[_10661]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _11176 = clamp((_15._m0[_10661]._m0.x - length(_10710)) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _11179 = float(_11152) * smoothstep(0.0, 1.0, _11176);
                vec4 _11231;
                SPIRV_CROSS_BRANCH
                if (_11179 > 9.9999997473787516355514526367188e-05)
                {
                    float _11188 = mix(clamp((_11151.y * (1.0 / length(_11155))) * _894, 0.0, _894), _894, _894);
                    vec3 _11190 = mix(_11155, _11062, vec3(_11188));
                    float _11191 = _11188 * 8.0;
                    int _141 = _10700;
                    int _145 = _10700 + 1;
                    vec4 _11199 = vec4(textureLod(nonuniformEXT(samplerCube(_26[_141], _7)), _11190, _11191).xyz, textureLod(nonuniformEXT(samplerCube(_26[_145], _7)), _11190, _11191).x);
                    vec4 _11213;
                    SPIRV_CROSS_BRANCH
                    if (_10705 >= 0)
                    {
                        int _149 = _10705;
                        int _153 = _10705 + 1;
                        _11213 = mix(_11199, vec4(textureLod(nonuniformEXT(samplerCube(_26[_149], _7)), _11190, _11191).xyz, textureLod(nonuniformEXT(samplerCube(_26[_153], _7)), _11190, _11191).x), vec4(_15._m0[_10661]._m3));
                    }
                    else
                    {
                        _11213 = _11199;
                    }
                    vec4 _11214 = _11213 * _10708;
                    vec4 _11219 = textureLod(sampler2D(_20, _14), vec2(_10556, _11188), 0.0);
                    vec3 _11226 = (_11214.xyz * _15._m0[_10661]._m4).xyz * ((_10512 * _11219.x) + vec3(_11219.y));
                    vec4 _11227 = vec4(_11226.x, _11226.y, _11226.z, _11214.w);
                    _11227.w = _11214.w * _11179;
                    _11231 = _11227;
                }
                else
                {
                    _11231 = vec4(0.0);
                }
                vec4 _11409;
                if (_633)
                {
                    vec3 _11235 = _10684 * (-_10500);
                    vec2 _11324;
                    bool _11325;
                    if (_10711)
                    {
                        vec2 _11319;
                        bool _11323;
                        do
                        {
                            vec3 _11303 = (_15._m0[_10661]._m0.xyz - _10710) / _11235;
                            vec3 _11306 = ((-_15._m0[_10661]._m0.xyz) - _10710) / _11235;
                            vec3 _11307 = spvNMin(_11303, _11306);
                            vec3 _11308 = spvNMax(_11303, _11306);
                            float _11313 = spvNMax(_11307.x, spvNMax(_11307.y, _11307.z));
                            float _11318 = spvNMin(_11308.x, spvNMin(_11308.y, _11308.z));
                            _11319 = vec2(_11313, _11318);
                            if (_11313 > _11318)
                            {
                                _11323 = false;
                                break;
                            }
                            _11323 = true;
                            break;
                        } while(false);
                        _11324 = _11319;
                        _11325 = _11323;
                    }
                    else
                    {
                        vec2 _11298;
                        bool _11299;
                        do
                        {
                            float _11241 = dot(_11235, _11235);
                            float _11242 = dot(_11235, _10710);
                            float _11243 = 2.0 * _11242;
                            float _11244 = _10715 - _15._m0[_10661]._m0.y;
                            float _11280;
                            float _11281;
                            bool _11282;
                            do
                            {
                                float _11250 = fma(_11243, _11243, -((4.0 * _11241) * _11244));
                                float _11278;
                                float _11279;
                                if (_11250 < 0.0)
                                {
                                    _11280 = 0.0;
                                    _11281 = 0.0;
                                    _11282 = false;
                                    break;
                                }
                                else
                                {
                                    if (_11250 == 0.0)
                                    {
                                        float _11277 = (_11242 * (-1.0)) * (1.0 / _11241);
                                        _11278 = _11277;
                                        _11279 = _11277;
                                    }
                                    else
                                    {
                                        float _11270;
                                        if (_11243 > 0.0)
                                        {
                                            _11270 = (-0.5) * fma(2.0, _11242, sqrt(_11250));
                                        }
                                        else
                                        {
                                            _11270 = (-0.5) * fma(2.0, _11242, -sqrt(_11250));
                                        }
                                        _11278 = _11244 * (1.0 / _11270);
                                        _11279 = _11270 * (1.0 / _11241);
                                    }
                                }
                                _11280 = _11278;
                                _11281 = _11279;
                                _11282 = true;
                                break;
                            } while(false);
                            if (!_11282)
                            {
                                _11298 = vec2(0.0);
                                _11299 = false;
                                break;
                            }
                            if ((_11281 < 0.0) && (_11280 < 0.0))
                            {
                                _11298 = vec2(0.0);
                                _11299 = false;
                                break;
                            }
                            vec2 _11297;
                            if (_11281 > _11280)
                            {
                                _11297 = vec2(_11280, _11281);
                            }
                            else
                            {
                                _11297 = vec2(_11281, _11280);
                            }
                            _11298 = _11297;
                            _11299 = true;
                            break;
                        } while(false);
                        _11324 = _11298;
                        _11325 = _11299;
                    }
                    vec3 _11328 = _10710 + (_11235 * _11324.y);
                    float _11349;
                    if (_10711)
                    {
                        _11349 = 1.0 - clamp(length(spvNMax(_10712 - (_15._m0[_10661]._m0.xyz - vec3(_15._m0[_10661]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    else
                    {
                        _11349 = clamp((_15._m0[_10661]._m0.x - length(_10710)) * (1.0 / spvNMax(_15._m0[_10661]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    float _11352 = float(_11325) * smoothstep(0.0, 1.0, _11349);
                    vec4 _11405;
                    SPIRV_CROSS_BRANCH
                    if (_11352 > 9.9999997473787516355514526367188e-05)
                    {
                        float _11361 = mix(clamp((_11324.y * (1.0 / length(_11328))) * _894, 0.0, _894), _894, _894);
                        vec3 _11363 = mix(_11328, _11235, vec3(_11361));
                        float _11364 = _11361 * 8.0;
                        int _157 = _10700;
                        int _161 = _10700 + 1;
                        vec4 _11372 = vec4(textureLod(nonuniformEXT(samplerCube(_26[_157], _7)), _11363, _11364).xyz, textureLod(nonuniformEXT(samplerCube(_26[_161], _7)), _11363, _11364).x);
                        vec4 _11386;
                        SPIRV_CROSS_BRANCH
                        if (_10705 >= 0)
                        {
                            int _165 = _10705;
                            int _169 = _10705 + 1;
                            _11386 = mix(_11372, vec4(textureLod(nonuniformEXT(samplerCube(_26[_165], _7)), _11363, _11364).xyz, textureLod(nonuniformEXT(samplerCube(_26[_169], _7)), _11363, _11364).x), vec4(_15._m0[_10661]._m3));
                        }
                        else
                        {
                            _11386 = _11372;
                        }
                        vec4 _11387 = _11386 * _10708;
                        vec4 _11393 = textureLod(sampler2D(_20, _14), vec2(spvNMax(_10627, 0.001953125), _11361), 0.0);
                        vec3 _11400 = (_11387.xyz * _15._m0[_10661]._m4).xyz * ((_10512 * _11393.x) + vec3(_11393.y));
                        vec4 _11401 = vec4(_11400.x, _11400.y, _11400.z, _11387.w);
                        _11401.w = _11387.w * _11352;
                        _11405 = _11401;
                    }
                    else
                    {
                        _11405 = vec4(0.0);
                    }
                    _11409 = (_11231 * 0.300000011920928955078125) + (_11405 * 0.699999988079071044921875);
                }
                else
                {
                    _11409 = _11231;
                }
                _11414 = mix(_10649, _11409.xyz, vec3(_11409.w));
            }
            else
            {
                _11414 = _10649;
            }
            _10650 = _11414;
            _10653 = _11057;
        }
        float _11415 = _6._m0[0u] * 100.0;
        bool _11420 = _29._m19 > 0.0;
        vec3 _11481;
        SPIRV_CROSS_BRANCH
        if (_11420 && (_29._m35 == 0.0))
        {
            vec3 _11434 = vec3(0.0, 636100.0, 0.0) + _30._m6;
            float _11435 = length(_11434);
            vec3 _11446;
            float _11447;
            if (_11435 < (0.89999997615814208984375 * _32._m0))
            {
                vec3 _11444 = _11434;
                _11444.z = _11434.z + _32._m0;
                _11446 = _11444;
                _11447 = length(_11444);
            }
            else
            {
                _11446 = _11434;
                _11447 = _11435;
            }
            float _11450 = dot(_11446 / vec3(_11447), _29._m36);
            float _11451 = _32._m0 / _11447;
            _11481 = (mix(textureLod(sampler2D(_33, _7), vec2(atan((_11450 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_11447 - _32._m0) / (_32._m1 - _32._m0))), 0.0).xyz, vec3(0.0), bvec3(_11450 < (-sqrt(fma(-_11451, _11451, 1.0))))) * 1.0) * (_29._m34 * _29._m20);
        }
        else
        {
            _11481 = _29._m2;
        }
        float _11494 = texelFetch(_44, ivec3(int(_929), int(_930), 0).xy, 0).x;
        float _11579;
        SPIRV_CROSS_BRANCH
        if (_29._m21 > 0.0)
        {
            vec3 _11518 = _30._m6 + _859;
            vec3 _11525 = vec3(0.0, _29._m18.z, 0.0) + (_11518 - vec3(0.0, _29._m25, 0.0));
            float _11529 = dot(_11525, _29._m24);
            vec2 _11539 = ((((_11525 + (_29._m24 * (sqrt(fma(_11529, _11529, fma(_29._m18.z, _29._m18.z, -dot(_11525, _11525)))) - _11529))).xz * _29._m18.w) * 0.5) + vec2(0.5)) + _29._m18.xy;
            _11539.x = 1.0 - _11539.x;
            vec3 _11552 = vec3(0.0, _29._m23.z, 0.0) + (_11518 - vec3(0.0, _29._m27, 0.0));
            float _11556 = dot(_11552, _29._m26);
            vec2 _11566 = ((((_11552 + (_29._m26 * (sqrt(fma(_11556, _11556, fma(_29._m23.z, _29._m23.z, -dot(_11552, _11552)))) - _11556))).xz * _29._m23.w) * 0.5) + vec2(0.5)) + _29._m23.xy;
            _11566.x = 1.0 - _11566.x;
            _11579 = _11494 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_35, _7), _11539, 0.0).x, textureLod(sampler2D(_36, _7), _11566, 0.0).x, _29._m16)) * _29._m21, 0.0, 1.0));
        }
        else
        {
            _11579 = _11494;
        }
        float _11669;
        SPIRV_CROSS_BRANCH
        if (_29._m17 > 0.0)
        {
            vec3 _11607 = _30._m6 + _859;
            vec3 _11615 = vec3(0.0, _29._m28.z, 0.0) + ((_29._m29 + _11607) - vec3(0.0, _29._m30, 0.0));
            float _11619 = dot(_11615, _29._m24);
            vec2 _11629 = ((((_11615 + (_29._m24 * (sqrt(fma(_11619, _11619, fma(_29._m28.z, _29._m28.z, -dot(_11615, _11615)))) - _11619))).xz * _29._m28.w) * 0.5) + vec2(0.5)) + _29._m28.xy;
            _11629.x = 1.0 - _11629.x;
            vec3 _11643 = vec3(0.0, _29._m31.z, 0.0) + ((_29._m32 + _11607) - vec3(0.0, _29._m33, 0.0));
            float _11647 = dot(_11643, _29._m26);
            vec2 _11657 = ((((_11643 + (_29._m26 * (sqrt(fma(_11647, _11647, fma(_29._m31.z, _29._m31.z, -dot(_11643, _11643)))) - _11647))).xz * _29._m31.w) * 0.5) + vec2(0.5)) + _29._m31.xy;
            _11657.x = 1.0 - _11657.x;
            _11669 = _11579 * (1.0 - clamp(mix(textureLod(sampler2D(_24, _7), _11629, 0.0).x, textureLod(sampler2D(_25, _7), _11657, 0.0).x, _29._m16) * _29._m17, 0.0, 1.0));
        }
        else
        {
            _11669 = _11579;
        }
        float _11741;
        SPIRV_CROSS_BRANCH
        if (_856)
        {
            float _11676 = 1.0 - abs(dot(_673, _29._m0));
            vec4 _11683 = vec4(_859 - (_673 * (0.0199999995529651641845703125 * _11676)), 1.0);
            float _11739;
            int _11685 = 0;
            SPIRV_CROSS_UNROLL
            for (;;)
            {
                if (_11685 < 4)
                {
                    vec4 _11693 = _11683 * _21._m10[_11685];
                    uint _11694 = uint(_11685);
                    vec2 _11709 = clamp((vec2(1.0) - abs((clamp(_11693.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / vec2(_21._m6), vec2(0.0), vec2(1.0));
                    float _11710 = _11693.z;
                    if (((_11709.x * _11709.y) * clamp((clamp(_11710, 0.0, 1.0) * _21._m8[_11694]) / ((_21._m9[_11694] * 0.5) * _21._m6), 0.0, 1.0)) > 0.0)
                    {
                        _11739 = fma(0.0199999995529651641845703125, _11676, abs(fma(1.0 - _11710, _21._m8[_11694], -((1.0 - textureLod(sampler2DArray(_8, _14), vec3(_11693.xy, float(_11685)), 0.0).x) * _21._m8[_11694]))));
                        break;
                    }
                    _11685++;
                    continue;
                }
                else
                {
                    _11739 = 0.0;
                    break;
                }
            }
            _11741 = _11739 * 1000.0;
        }
        else
        {
            _11741 = 0.0;
        }
        vec3 _11743 = _11481 * (_11669 * _6._m0[0u]);
        vec3 _12514;
        vec3 _12515;
        SPIRV_CROSS_BRANCH
        if (_943)
        {
            vec3 _12424 = reflect(_861, _673);
            float _12426 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
            float _12430 = clamp(dot(_29._m0, normalize(_861 + _29._m0)), 0.0, 1.0);
            float _12432 = clamp(dot(_673, _29._m0), 0.0, 1.0);
            vec3 _12439 = vec3(fma((2.0 * _12430) * _12430, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
            float _12458 = dot(_29._m0, _12424);
            vec3 _12468 = mix(_12424, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_12424 - (_29._m0 * _12458)) * 0.0045900647528469562530517578125)), bvec3(_12458 < 0.999989449977874755859375));
            vec3 _12470 = normalize(_861 + _12468);
            float _12474 = clamp(dot(_673, _12470), 0.0, 1.0);
            float _12476 = clamp(dot(_673, _12468), 0.0, 1.0);
            float _12478 = (_894 + 1.0) * 0.5;
            float _12479 = _894 * _894;
            float _12487 = _12478 * _12478;
            float _12499 = _12479 * _12479;
            float _12502 = fma(fma(_12474, _12499, -_12474), _12474, 1.0);
            _12514 = _10497 + ((_11743 * ((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - clamp(dot(_12468, _12470), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_12476, sqrt(fma(fma(-_12426, _12487, _12426), _12426, _12487)), _12426 * sqrt(fma(fma(-_12476, _12487, _12476), _12476, _12487)))) * (_12499 * (0.3183098733425140380859375 / (_12502 * _12502)))))) * _12432);
            _12515 = _10498 + ((_11743 * (_843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_12439 * pow(spvNMax(abs(1.0 - _12432), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_12439 * pow(spvNMax(abs(1.0 - _12426), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))))) * _12432);
        }
        else
        {
            vec3 _12420;
            vec3 _12421;
            if (_686)
            {
                vec3 _12312 = reflect(_861, _673);
                float _12314 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                float _12318 = clamp(dot(_29._m0, normalize(_861 + _29._m0)), 0.0, 1.0);
                float _12320 = clamp(dot(_673, _29._m0), 0.0, 1.0);
                vec3 _12327 = vec3(fma((2.0 * _12318) * _12318, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                float _12346 = dot(_29._m0, _12312);
                vec3 _12356 = mix(_12312, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_12312 - (_29._m0 * _12346)) * 0.0045900647528469562530517578125)), bvec3(_12346 < 0.999989449977874755859375));
                vec3 _12358 = normalize(_861 + _12356);
                float _12362 = clamp(dot(_673, _12358), 0.0, 1.0);
                float _12364 = clamp(dot(_673, _12356), 0.0, 1.0);
                float _12365 = dot(_12358, _846);
                float _12367 = (_894 + 1.0) * 0.5;
                float _12368 = _894 * _894;
                float _12376 = _12367 * _12367;
                float _12390 = sqrt(fma(-_845, 0.89999997615814208984375, 1.0));
                float _12393 = spvNMax(0.001000000047497451305389404296875, clamp(_12368 / _12390, 0.0, 1.0));
                float _12395 = spvNMax(0.001000000047497451305389404296875, _12368 * _12390);
                float _12406 = fma(_12362, _12362, ((_12365 * _12365) / (_12393 * _12393)) + (fma(-_12362, _12362, fma(-_12365, _12365, 1.0)) / (_12395 * _12395)));
                _12420 = _10497 + ((_11743 * ((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - clamp(dot(_12356, _12358), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_12364, sqrt(fma(fma(-_12314, _12376, _12314), _12314, _12376)), _12314 * sqrt(fma(fma(-_12364, _12376, _12364), _12364, _12376)))) * (1.0 / ((((_12393 * _12395) * 3.1415927410125732421875) * _12406) * _12406))))) * _12320);
                _12421 = _10498 + ((_11743 * (_843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_12327 * pow(spvNMax(abs(1.0 - _12320), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_12327 * pow(spvNMax(abs(1.0 - _12314), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))))) * _12320);
            }
            else
            {
                vec3 _12308;
                vec3 _12309;
                if (_674)
                {
                    vec3 _12207 = reflect(_861, _673);
                    float _12209 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                    float _12213 = clamp(dot(_29._m0, normalize(_861 + _29._m0)), 0.0, 1.0);
                    float _12215 = clamp(dot(_673, _29._m0), 0.0, 1.0);
                    vec3 _12222 = vec3(fma((2.0 * _12213) * _12213, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                    float _12241 = dot(_29._m0, _12207);
                    vec3 _12251 = mix(_12207, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_12207 - (_29._m0 * _12241)) * 0.0045900647528469562530517578125)), bvec3(_12241 < 0.999989449977874755859375));
                    vec3 _12253 = normalize(_861 + _12251);
                    float _12257 = clamp(dot(_673, _12253), 0.0, 1.0);
                    float _12259 = clamp(dot(_673, _12251), 0.0, 1.0);
                    float _12261 = (_894 + 1.0) * 0.5;
                    float _12264 = _894 * _894;
                    float _12265 = mix(_850 * _850, _12264, _672);
                    float _12266 = mix(_851 * _851, _12264, _672);
                    float _12274 = _12261 * _12261;
                    float _12286 = _12265 * _12265;
                    float _12287 = -_12257;
                    float _12289 = fma(fma(_12257, _12286, _12287), _12257, 1.0);
                    float _12293 = _12266 * _12266;
                    float _12295 = fma(fma(_12257, _12293, _12287), _12257, 1.0);
                    _12308 = _10497 + ((_11743 * ((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - clamp(dot(_12251, _12253), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_12259, sqrt(fma(fma(-_12209, _12274, _12209), _12209, _12274)), _12209 * sqrt(fma(fma(-_12259, _12274, _12259), _12259, _12274)))) * mix(_12286 * (0.3183098733425140380859375 / (_12289 * _12289)), _12293 * (0.3183098733425140380859375 / (_12295 * _12295)), _852)))) * _12215);
                    _12309 = _10498 + ((_11743 * (_843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_12222 * pow(spvNMax(abs(1.0 - _12215), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_12222 * pow(spvNMax(abs(1.0 - _12209), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))))) * _12215);
                }
                else
                {
                    vec3 _12203;
                    vec3 _12204;
                    if (_615 == 4u)
                    {
                        vec3 _12113 = reflect(_861, _673);
                        float _12115 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                        float _12119 = clamp(dot(_29._m0, normalize(_861 + _29._m0)), 0.0, 1.0);
                        float _12121 = clamp(dot(_673, _29._m0), 0.0, 1.0);
                        vec3 _12128 = vec3(fma((2.0 * _12119) * _12119, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                        float _12147 = dot(_29._m0, _12113);
                        vec3 _12157 = mix(_12113, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_12113 - (_29._m0 * _12147)) * 0.0045900647528469562530517578125)), bvec3(_12147 < 0.999989449977874755859375));
                        vec3 _12159 = normalize(_861 + _12157);
                        float _12163 = clamp(dot(_673, _12159), 0.0, 1.0);
                        float _12165 = clamp(dot(_673, _12157), 0.0, 1.0);
                        float _12167 = (_894 + 1.0) * 0.5;
                        float _12168 = _894 * _894;
                        float _12176 = _12167 * _12167;
                        float _12188 = _12168 * _12168;
                        float _12191 = fma(fma(_12163, _12188, -_12163), _12163, 1.0);
                        _12203 = _10497 + ((_11743 * ((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - clamp(dot(_12157, _12159), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_12165, sqrt(fma(fma(-_12115, _12176, _12115), _12115, _12176)), _12115 * sqrt(fma(fma(-_12165, _12176, _12165), _12165, _12176)))) * (_12188 * (0.3183098733425140380859375 / (_12191 * _12191)))))) * _12121);
                        _12204 = _10498 + ((_11743 * (_843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_12128 * pow(spvNMax(abs(1.0 - _12121), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_12128 * pow(spvNMax(abs(1.0 - _12115), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))))) * _12121);
                    }
                    else
                    {
                        vec3 _12109;
                        vec3 _12110;
                        if (_633)
                        {
                            float _11959 = dot(_670, _29._m0);
                            float _11960 = clamp(_11959, -1.0, 1.0);
                            float _11962 = clamp(dot(_670, _861), -1.0, 1.0);
                            float _11968 = cos(0.5 * abs(asin(_11962) - asin(_11960)));
                            vec3 _11970 = _29._m0 - (_670 * _11960);
                            vec3 _11972 = _861 - (_670 * _11962);
                            float _11978 = dot(_11970, _11972) * inversesqrt(fma(dot(_11970, _11970), dot(_11972, _11972), 9.9999997473787516355514526367188e-05));
                            float _11981 = sqrt(clamp(fma(0.5, _11978, 0.5), 0.0, 1.0));
                            float _12011 = _894 * _894;
                            vec3 _12016 = vec3(_12011 * (1.41421353816986083984375 * _11981), _12011 * 0.5, _12011 * 2.0);
                            vec3 _12028 = exp((pow(spvNMax(abs(vec3(_11960 + _11962) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _11981, sqrt(fma(-_11962, _11962, 1.0)), (-0.06994284689426422119140625) * _11962), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_12016 * _12016)) / (_12016 * 2.5066282749176025390625);
                            float _12029 = dot(_861, _29._m0);
                            float _12049 = 1.0 / fma(0.36000001430511474609375, _11968, 1.190000057220458984375 / _11968);
                            float _12052 = _11981 * fma(_12049, fma(-0.800000011920928955078125, _11978, 0.60000002384185791015625), 1.0);
                            float _12057 = -_11968;
                            vec3 _12073 = spvNMax(abs(_843), vec3(9.9999997473787516355514526367188e-05));
                            float _12091 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_12057, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                            vec3 _12108 = fma(_11743, ((((vec3(0.25 * _11981) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _12029, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _671, clamp(-_12029, 0.0, 1.0))) * _12028.x) + (((pow(_12073, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_12052 * _12049), 9.9999997473787516355514526367188e-05), 2.0))) / _11968)) * (exp(fma(-3.650000095367431640625, _11978, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_12057, sqrt(clamp(fma(-_12052, _12052, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _671) * _12028.y)) + ((pow(_12073, vec3(0.800000011920928955078125 / _11968)) * (exp(fma(17.0, _11978, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _12091), 9.9999997473787516355514526367188e-05), 2.0) * _12091))) * _12028.z), _10497);
                            _12109 = _12108;
                            _12110 = fma(_11743, (sqrt(_843) * ((0.3183098733425140380859375 * mix(clamp((dot(_673, _29._m0) + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_11959), 0.3300000131130218505859375)) * _669)) * pow(spvNMax(abs(_843 / vec3(dot(_843, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(fma(-_11669, _11669, 1.0))), _10498);
                        }
                        else
                        {
                            vec3 _11955;
                            vec3 _11956;
                            if (_615 == 6u)
                            {
                                vec3 _11881 = reflect(_861, _673);
                                float _11883 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                                float _11887 = clamp(dot(_29._m0, normalize(_861 + _29._m0)), 0.0, 1.0);
                                float _11889 = clamp(dot(_673, _29._m0), 0.0, 1.0);
                                vec3 _11896 = vec3(fma((2.0 * _11887) * _11887, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                float _11915 = dot(_29._m0, _11881);
                                vec3 _11925 = mix(_11881, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_11881 - (_29._m0 * _11915)) * 0.0045900647528469562530517578125)), bvec3(_11915 < 0.999989449977874755859375));
                                float _11929 = clamp(dot(_673, normalize(_861 + _11925)), 0.0, 1.0);
                                float _11931 = clamp(dot(_673, _11925), 0.0, 1.0);
                                float _11942 = clamp(_11883, 0.0, 1.0);
                                _11955 = _10497 + ((_11743 * (_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(-_11929, _11929, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(-_11931, _11942, _11931 + _11942))))) * _11931);
                                _11956 = _10498 + ((_11743 * (_843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_11896 * pow(spvNMax(abs(1.0 - _11889), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_11896 * pow(spvNMax(abs(1.0 - _11883), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))))) * _11889);
                            }
                            else
                            {
                                vec3 _11877;
                                vec3 _11878;
                                if (_10506)
                                {
                                    vec3 _11768 = reflect(_861, _673);
                                    float _11770 = spvNMax(dot(_673, _861), 9.9999997473787516355514526367188e-06);
                                    float _11774 = clamp(dot(_29._m0, normalize(_861 + _29._m0)), 0.0, 1.0);
                                    float _11776 = clamp(dot(_673, _29._m0), 0.0, 1.0);
                                    vec3 _11783 = vec3(fma((2.0 * _11774) * _11774, _894, mix(0.0, 0.5, _894))) - vec3(1.0);
                                    float _11802 = dot(_29._m0, _11768);
                                    vec3 _11812 = mix(_11768, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_11768 - (_29._m0 * _11802)) * 0.0045900647528469562530517578125)), bvec3(_11802 < 0.999989449977874755859375));
                                    vec3 _11814 = normalize(_861 + _11812);
                                    float _11818 = clamp(dot(_673, _11814), 0.0, 1.0);
                                    float _11820 = clamp(dot(_673, _11812), 0.0, 1.0);
                                    float _11822 = (_894 + 1.0) * 0.5;
                                    float _11823 = _894 * _894;
                                    float _11831 = _11822 * _11822;
                                    float _11836 = -_11820;
                                    float _11843 = _11823 * _11823;
                                    float _11844 = -_11818;
                                    float _11846 = fma(fma(_11818, _11843, _11844), _11818, 1.0);
                                    float _11862 = clamp(_11770, 0.0, 1.0);
                                    _11877 = _10497 + ((_11743 * ((((_844 + ((vec3(1.0) - _844) * pow(spvNMax(abs(1.0 - clamp(dot(_11812, _11814), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_11820, sqrt(fma(fma(-_11770, _11831, _11770), _11770, _11831)), _11770 * sqrt(fma(fma(_11836, _11831, _11820), _11820, _11831)))) * (_11843 * (0.3183098733425140380859375 / (_11846 * _11846))))) * _858.w) + ((_858.xyz * ((((2.0 + (1.0 / _894)) * pow(spvNMax(abs(fma(_11844, _11818, 1.0)), 9.9999997473787516355514526367188e-05), 0.5 / _894)) * 0.15915493667125701904296875) * (0.25 / fma(_11836, _11862, _11820 + _11862)))) * (1.0 - _858.w)))) * _11820);
                                    _11878 = _10498 + ((_11743 * (_843 * (0.3183098733425140380859375 * (((vec3(1.0) + (_11783 * pow(spvNMax(abs(1.0 - _11776), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_11783 * pow(spvNMax(abs(1.0 - _11770), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _894))))) * _11776);
                                }
                                else
                                {
                                    _11877 = _10497;
                                    _11878 = _10498;
                                }
                                _11955 = _11877;
                                _11956 = _11878;
                            }
                            _12109 = _11955;
                            _12110 = _11956;
                        }
                        _12203 = _12109;
                        _12204 = _12110;
                    }
                    _12308 = _12203;
                    _12309 = _12204;
                }
                _12420 = _12308;
                _12421 = _12309;
            }
            _12514 = _12420;
            _12515 = _12421;
        }
        vec3 _12553;
        SPIRV_CROSS_BRANCH
        if (_855)
        {
            vec3 _12522 = vec3(1.0) / spvNMax((_847 * vec3(0.09660939872264862060546875)) * (_848 * _853), vec3(9.9999997473787516355514526367188e-05));
            vec3 _12540;
            SPIRV_CROSS_BRANCH
            if (_856)
            {
                vec3 _12536 = exp2(_12522 * ((-0.4808983504772186279296875) * spvNMax(_854, _11741)));
                _12540 = _849 * (_12536 * fma(_12536, _12536, vec3(3.0)));
            }
            else
            {
                vec3 _12528 = exp2(_12522 * ((-0.4808983504772186279296875) * _854));
                _12540 = (_849 * (_12528 * fma(_12528, _12528, vec3(3.0)))) * _11669;
            }
            _12553 = _12515 + ((_12540 * ((_11481 * clamp((0.2588190734386444091796875 - dot(_673, _29._m0)) * 0.631063938140869140625, 0.0, 1.0)) * (_843 * 0.3183098733425140380859375))) * _6._m0[0u]);
        }
        else
        {
            _12553 = _12515;
        }
        float _12573;
        float _12574;
        if (_37._m0.x > 0.0)
        {
            vec4 _12561 = textureLod(sampler2D(_43, _14), _546, 0.0);
            float _12562 = _12561.x;
            _12573 = clamp((pow(spvNMax(abs(dot(_673, _861) + _12562), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _894, -1.0))) - 1.0) + _12562, 0.0, 1.0);
            _12574 = _12562;
        }
        else
        {
            _12573 = 1.0;
            _12574 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _12574, 0.7);
            _12514 -= _10497 * (1.0 - rdx_ao_factor);
            _12553 -= _10498 * (1.0 - rdx_ao_factor);
        }
        vec3 _12582 = (_12553 * mix(1.0, _12574, _37._m0.y)) + ((_10652 * _11415) * _12574);
        vec3 _12584 = (_12514 * mix(1.0, _12573, _37._m0.y)) + ((_10649 * _11415) * _12573);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _12584 *= rdx_multi_scatter_compensation(_10505, _894, _844);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _11494, 0.5);
            _12582 *= _rdx_csm_shadow;
            _12584 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz) * _29._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _42, _7, _546, _rdx_marchDir, _588, vec2(_37._m1));
            _rdx_dbg_micro = _rdx_micro;
            _12582 *= _rdx_micro;
            _12584 *= _rdx_micro;
        }
        vec3 _13089;
        vec3 _13090;
        SPIRV_CROSS_BRANCH
        if (_11420)
        {
            vec3 _12592 = vec3(0.0, 636100.0, 0.0) + _30._m6;
            vec3 _12593 = vec3(0.0, 636100.0, 0.0) + (_859 + _30._m6);
            float _12594 = length(_12593);
            vec3 _12598 = (_12593 / vec3(_12594)) * spvNMax(_12594, 636100.0);
            vec3 _12599 = _12598 - _12592;
            float _12600 = length(_12599);
            vec3 _12602 = _12599 / vec3(_12600);
            float _12603 = length(_12592);
            vec3 _12617;
            vec3 _12618;
            float _12619;
            if (_12603 < (0.89999997615814208984375 * _32._m0))
            {
                vec3 _12612 = _12592;
                _12612.z = _12592.z + _32._m0;
                vec3 _12615 = _12598;
                _12615.z = _12598.z + _32._m0;
                _12617 = _12615;
                _12618 = _12612;
                _12619 = length(_12612);
            }
            else
            {
                _12617 = _12598;
                _12618 = _12592;
                _12619 = _12603;
            }
            float _12620 = dot(_12618, _12602);
            float _12631 = spvNMax((-_12620) - sqrt(fma(_32._m1, _32._m1, fma(_12620, _12620, -(_12619 * _12619)))), 0.0);
            bool _12634 = (_12631 > 0.0) && (_12631 < _12600);
            vec3 _12642;
            float _12643;
            float _12644;
            if (_12634)
            {
                _12642 = _12618 + (_12602 * _12631);
                _12643 = _12600 - _12631;
                _12644 = (_12620 + _12631) / _32._m1;
            }
            else
            {
                _12642 = _12618;
                _12643 = _12600;
                _12644 = _12620 / _12619;
            }
            float _12645 = _12634 ? _32._m1 : _12619;
            vec3 _13082;
            vec3 _13083;
            if (_12645 <= _32._m1)
            {
                float _12650 = dot(_12602, _29._m36);
                float _12652 = dot(_12642, _29._m36) / _12645;
                float _12653 = _32._m0 + 600.0;
                bool _12654 = _12645 < _12653;
                vec3 _12659;
                if (_12654)
                {
                    _12659 = _12617 * (_12653 / _12645);
                }
                else
                {
                    _12659 = _12617;
                }
                float _12660 = _12654 ? _12653 : _12645;
                float _12661 = length(_12659);
                float _12662 = dot(_12659, _12602);
                float _12664 = dot(_12659, _29._m36) / _12661;
                vec2 _12675 = vec2(_12644, _12644 + (_12643 / _12660));
                vec2 _12676 = _12675 * sqrt((0.5 / _32._m4) * _12660);
                vec2 _12679 = vec2(ivec2(sign(_12676)));
                vec2 _12680 = _12676 * _12676;
                float _12694 = -_12643;
                float _12696 = 2.0 * _12660;
                float _12698 = (_12643 / _12696) + _12644;
                float _12706 = _32._m0 - _12660;
                vec2 _12721 = _12675 * sqrt((0.5 / _32._m6) * _12660);
                vec2 _12724 = vec2(ivec2(sign(_12721)));
                vec2 _12725 = _12721 * _12721;
                vec3 _12755 = exp(((-_32._m5) * ((sqrt((6.283100128173828125 * _32._m4) * _12660) * exp(_12706 / _32._m4)) * (((_12679.y > _12679.x) ? exp(_12680.x) : 0.0) + dot((_12679 / ((abs(_12676) * 2.3192999362945556640625) + sqrt((_12680 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_12694 / _32._m4) * _12698)), vec2(1.0, -1.0))))) - (_32._m8 * ((sqrt((6.283100128173828125 * _32._m6) * _12660) * exp(_12706 / _32._m6)) * (((_12724.y > _12724.x) ? exp(_12725.x) : 0.0) + dot((_12724 / ((abs(_12721) * 2.3192999362945556640625) + sqrt((_12725 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_12694 / _32._m6) * _12698)), vec2(1.0, -1.0))))));
                vec3 _12756 = spvNMin(_12755, vec3(1.0));
                float _12757 = _32._m0 / _12660;
                float _12760 = sqrt(fma(-_12757, _12757, 1.0));
                float _12762 = _12644 - (-_12760);
                vec4 _13045;
                if (abs(_12762) < 0.0040000001899898052215576171875)
                {
                    float _12870 = (-0.0040000001899898052215576171875) - _12760;
                    float _12872 = fma(_12660, _12660, _12643 * _12643);
                    float _12873 = _12696 * _12643;
                    float _12875 = sqrt(fma(_12873, _12870, _12872));
                    float _12876 = fma(_12660, _12870, _12643);
                    float _12879 = -(_32._m0 * _32._m0);
                    float _12881 = sqrt(fma(_32._m1, _32._m1, _12879));
                    float _12883 = sqrt(fma(_12660, _12660, _12879));
                    float _12884 = _12660 * _12870;
                    float _12886 = -(_12660 * _12660);
                    float _12888 = fma(_32._m0, _32._m0, fma(_12884, _12884, _12886));
                    vec4 _12894 = vec4(-1.0, _12881 * _12881, _12881, 0.50390625);
                    vec4 _12895 = mix(_12894, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_12884 < 0.0) && (_12888 > 0.0)));
                    float _12897 = fma(_12883 / _12881, 0.96875, 0.015625);
                    float _12907 = fma(fma(_12884, _12895.x, sqrt(_12888 + _12895.y)) / (_12883 + _12895.z), 0.4921875, _12895.w);
                    float _12913 = _12650 + 1.0;
                    float _12915 = floor(_12913 * 3.5);
                    float _12917 = fma(_12913, 3.5, -_12915);
                    float _12918 = _12915 + fma(fma(atan(spvNMax(_12652, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _12919 = _12918 * 0.125;
                    float _12923 = 1.0 - _12917;
                    float _12926 = (_12918 + 1.0) * 0.125;
                    float _12933 = sqrt(fma(_12875, _12875, _12879));
                    float _12937 = fma(_32._m0, _32._m0, fma(_12876, _12876, -(_12875 * _12875)));
                    vec4 _12942 = mix(_12894, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_12876 < 0.0) && (_12937 > 0.0)));
                    float _12944 = fma(_12933 / _12881, 0.96875, 0.015625);
                    float _12954 = fma(fma(_12876, _12942.x, sqrt(_12937 + _12942.y)) / (_12933 + _12942.z), 0.4921875, _12942.w);
                    float _12960 = _12915 + fma(fma(atan(spvNMax(_12664, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _12961 = _12960 * 0.125;
                    float _12967 = (_12960 + 1.0) * 0.125;
                    vec4 _12973 = _12756.xyzx;
                    float _12977 = 0.0040000001899898052215576171875 - _12760;
                    float _12979 = sqrt(fma(_12873, _12977, _12872));
                    float _12980 = fma(_12660, _12977, _12643);
                    float _12981 = _12660 * _12977;
                    float _12983 = fma(_32._m0, _32._m0, fma(_12981, _12981, _12886));
                    vec4 _12988 = mix(_12894, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_12981 < 0.0) && (_12983 > 0.0)));
                    float _12998 = fma(fma(_12981, _12988.x, sqrt(_12983 + _12988.y)) / (_12883 + _12988.z), 0.4921875, _12988.w);
                    float _13009 = sqrt(fma(_12979, _12979, _12879));
                    float _13013 = fma(_32._m0, _32._m0, fma(_12980, _12980, -(_12979 * _12979)));
                    vec4 _13018 = mix(_12894, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_12980 < 0.0) && (_13013 > 0.0)));
                    float _13020 = fma(_13009 / _12881, 0.96875, 0.015625);
                    float _13030 = fma(fma(_12980, _13018.x, sqrt(_13013 + _13018.y)) / (_13009 + _13018.z), 0.4921875, _13018.w);
                    _13045 = mix(spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_12961, _12954, _12944), 0.0) * _12923) + (textureLod(sampler3D(_34, _7), vec3(_12967, _12954, _12944), 0.0) * _12917)), _12973, (textureLod(sampler3D(_34, _7), vec3(_12919, _12907, _12897), 0.0) * _12923) + (textureLod(sampler3D(_34, _7), vec3(_12926, _12907, _12897), 0.0) * _12917)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_12961, _13030, _13020), 0.0) * _12923) + (textureLod(sampler3D(_34, _7), vec3(_12967, _13030, _13020), 0.0) * _12917)), _12973, (textureLod(sampler3D(_34, _7), vec3(_12919, _12998, _12897), 0.0) * _12923) + (textureLod(sampler3D(_34, _7), vec3(_12926, _12998, _12897), 0.0) * _12917)), vec4(0.0)), vec4((_12762 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _12770 = -(_32._m0 * _32._m0);
                    float _12772 = sqrt(fma(_32._m1, _32._m1, _12770));
                    float _12774 = sqrt(fma(_12660, _12660, _12770));
                    float _12775 = _12660 * _12644;
                    float _12779 = fma(_32._m0, _32._m0, fma(_12775, _12775, -(_12660 * _12660)));
                    vec4 _12785 = vec4(-1.0, _12772 * _12772, _12772, 0.50390625);
                    vec4 _12786 = mix(_12785, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_12775 < 0.0) && (_12779 > 0.0)));
                    float _12788 = fma(_12774 / _12772, 0.96875, 0.015625);
                    float _12798 = fma(fma(_12775, _12786.x, sqrt(_12779 + _12786.y)) / (_12774 + _12786.z), 0.4921875, _12786.w);
                    float _12804 = _12650 + 1.0;
                    float _12806 = floor(_12804 * 3.5);
                    float _12808 = fma(_12804, 3.5, -_12806);
                    float _12809 = _12806 + fma(fma(atan(spvNMax(_12652, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _12814 = 1.0 - _12808;
                    float _12824 = sqrt(fma(_12661, _12661, _12770));
                    float _12828 = fma(_32._m0, _32._m0, fma(_12662, _12662, -(_12661 * _12661)));
                    vec4 _12833 = mix(_12785, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_12662 < 0.0) && (_12828 > 0.0)));
                    float _12835 = fma(_12824 / _12772, 0.96875, 0.015625);
                    float _12845 = fma(fma(_12662, _12833.x, sqrt(_12828 + _12833.y)) / (_12824 + _12833.z), 0.4921875, _12833.w);
                    float _12851 = _12806 + fma(fma(atan(spvNMax(_12664, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _13045 = spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_12851 * 0.125, _12845, _12835), 0.0) * _12814) + (textureLod(sampler3D(_34, _7), vec3((_12851 + 1.0) * 0.125, _12845, _12835), 0.0) * _12808)), _12756.xyzx, (textureLod(sampler3D(_34, _7), vec3(_12809 * 0.125, _12798, _12788), 0.0) * _12814) + (textureLod(sampler3D(_34, _7), vec3((_12809 + 1.0) * 0.125, _12798, _12788), 0.0) * _12808)), vec4(0.0));
                }
                float _13060 = fma(_12650, _12650, 1.0);
                _13082 = _12756;
                _13083 = (_13045.xyz * (0.0596831031143665313720703125 * _13060)) + ((((_13045.xyz * (_13045.w * smoothstep(0.0, 0.0199999995529651641845703125, _12652))) / vec3(spvNMax(_13045.x, 9.9999997473787516355514526367188e-05))) * (vec3(_32._m5.x) / _32._m5)) * ((((0.119366206228733062744140625 * fma(-_32._m9, _32._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_32._m9 * (-2.0), _12650, fma(_32._m9, _32._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _13060) / fma(_32._m9, _32._m9, 2.0)));
            }
            else
            {
                _13082 = vec3(1.0);
                _13083 = vec3(0.0);
            }
            _13089 = _12584 * _13082;
            _13090 = fma(_12582, _13082, _13083 * ((_29._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _13089 = _12584;
            _13090 = _12582;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz) * _29._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_42, _7, _546, _rdx_dir, _588, vec2(_37._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _13090 = vec3(_rdx_vis);
            _13089 = vec3(0.0);
        }
        imageStore(_46, ivec2(_529), vec4(_13090, 1.0));
        imageStore(_47, ivec2(_529), vec4(_13089, 1.0));
        break;
    } while(false);
}

