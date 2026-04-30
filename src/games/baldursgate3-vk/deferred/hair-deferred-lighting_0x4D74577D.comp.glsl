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

float _347;
const vec4 _363[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _391;
vec3 _396;
vec3 _397;

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

// --- RenoDX: Cubemap / IBL Modulation ---
float rdx_cubemap_modulation(vec3 skyLight, float roughness) {
    float skyLum = max(0.0, dot(skyLight, vec3(0.2126, 0.7152, 0.0722)));
    float mod_factor = smoothstep(0.0, 0.25, skyLum)
                     * mix(0.5, 1.0, clamp(roughness, 0.0, 1.0));
    return mix(0.3, 1.0, mod_factor);
}

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

void main()
{
    do
    {
        uint _432 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _434 = _42._m0[_432];
        uvec2 _439 = (uvec2(_434 & 65535u, _434 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_439, _28._m3)) || any(greaterThan(_439, _28._m4)))
        {
            break;
        }
        vec2 _451 = vec2(_439);
        vec2 _456 = (_451 + vec2(0.5)) / vec2(_34._m1);
        vec2 _463 = ((_456 - _28._m1) / _28._m0) * 0.5;
        float _467 = _463.x;
        float _469 = _463.y;
        ivec2 _487 = ivec3(int(_439.x), int(_439.y), 0).xy;
        vec4 _491 = texelFetch(_36, _487, 0);
        vec4 _493 = texelFetch(_37, _487, 0);
        vec4 _495 = texelFetch(_38, _487, 0);
        vec4 _497 = texelFetch(_39, _487, 0);
        float _498 = _497.x;
        vec3 _516;
        do
        {
            vec3 _504 = fma(vec3(texelFetch(_35, _487, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _505 = dot(_504, _504);
            if (_505 > 54000001024.0)
            {
                _516 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _510 = 2.0 / _505;
                vec2 _512 = _504.xy * _510;
                vec3 _513 = vec3(_512.x, _512.y, _396.z);
                _513.z = 1.0 - _510;
                _516 = _513;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _518 = _493.y;
        float _519 = _493.z;
        uint _525 = (uint(roundEven(_493.w * 255.0)) & 112u) >> 4u;
        vec3 _536 = _495.xyz * 255.0;
        float _538 = _536.y * 0.0625;
        vec2 _548 = clamp((vec2(fma(_536.x, 16.0, floor(_538)), fma(fract(_538), 4096.0, _536.z)) * 0.000488519784994423389434814453125) - vec2(1.0), vec2(-1.0), vec2(1.0));
        float _554 = (1.0 - abs(_548.x)) - abs(_548.y);
        vec3 _555;
        _555.z = _554;
        vec2 _564 = mix((vec2(1.0) - abs(_548.yx)) * mix(vec2(-1.0), vec2(1.0), greaterThanEqual(_548, vec2(0.0))), _548, bvec2(_554 >= 0.0));
        vec3 _566 = normalize(vec3(_564.x, _564.y, _555.z));
        float _567 = _495.w;
        vec3 _568 = _516 * mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        vec3 _570 = vec3(_491.x, _491.y, _491.z) * 1.0;
        vec3 _573 = vec3(0.1599999964237213134765625 * (_518 * _518));
        float _574 = spvNMax(0.0900000035762786865234375, _493.x);
        vec3 _575 = (((_26._m7[0].xyz * ((1.0 - _467) - _469)) + (_26._m7[1].xyz * _467)) + (_26._m7[2].xyz * _469)) * _498;
        vec3 _577 = normalize(-_575);
        ivec2 _586 = ivec2(uvec2(_451) / uvec2(_19._m25));
        float _612 = _451.x;
        float _613 = _451.y;
        float _618 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _612, 0.005837149918079376220703125 * _613)));
        float _625 = clamp(fma(_19._m34.y, length(_575), _19._m34.x), 0.0, 1.0);
        uint _626 = uint(int(fma(fma(float(int(clamp(fma(log2(_498 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_586.y)), _19._m23, float(_586.x))));
        uvec4 _629 = uvec4(_8._m0[_626]);
        uint _630 = _629.x;
        uint _631 = _629.y;
        uint _634 = ((_631 >> 0u) & 4095u) + _630;
        uint _637 = ((_631 >> 12u) & 4095u) + _634;
        uint _641 = ((_629.z >> 0u) & 1023u) + _637;
        float _643;
        bool _646;
        vec3 _648;
        vec3 _650;
        uint _652;
        _643 = _347;
        _646 = false;
        _648 = vec3(0.0);
        _650 = vec3(0.0);
        _652 = _630;
        float _644;
        bool _647;
        vec3 _649;
        vec3 _651;
        for (; _652 < _634; _643 = _644, _646 = _647, _648 = _649, _650 = _651, _652++)
        {
            uint _659 = uint(_9._m0[_652]);
            float _677 = abs(_10._m0[_659]._m5);
            if ((_10._m0[_659]._m6 & (1u << (_525 & 31u))) != 0u)
            {
                vec3 _692 = _10._m0[_659]._m0.xyz - _575;
                float _693 = dot(_692, _692);
                vec3 _696 = _692 * inversesqrt(spvNMax(_693, 1.0000000133514319600180897396058e-10));
                float _697 = _10._m0[_659]._m0.w * _10._m0[_659]._m0.w;
                float _1150;
                bool _1151;
                vec3 _1152;
                vec3 _1153;
                if (_693 < (1.0 / _697))
                {
                    float _702 = _693 * _697;
                    float _708 = pow(spvNMax(abs(clamp(fma(-_702, _702, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_659]._m4);
                    float _718;
                    if (_10._m0[_659]._m5 < 0.0)
                    {
                        _718 = _708 * fma(4.0, _697, _677);
                    }
                    else
                    {
                        _718 = _708 * ((1.0 / spvNMax(_693, 9.9999997473787516355514526367188e-05)) + _677);
                    }
                    float _720 = dot(_568, _696);
                    float _842;
                    bool _843;
                    float _844;
                    if ((_10._m0[_659]._m7 & 1u) != 0u)
                    {
                        uint _747;
                        do
                        {
                            vec3 _727 = -_696;
                            float _728 = dot(_727, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                            float _729 = dot(_727, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                            float _730 = dot(_727, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                            float _734 = spvNMax(spvNMax(_728, _729), spvNMax(_730, dot(_727, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                            if (_734 == _728)
                            {
                                _747 = 0u;
                                break;
                            }
                            else
                            {
                                if (_734 == _729)
                                {
                                    _747 = 1u;
                                    break;
                                }
                                else
                                {
                                    if (_734 == _730)
                                    {
                                        _747 = 2u;
                                        break;
                                    }
                                    else
                                    {
                                        _747 = 3u;
                                        break;
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            }
                            break; // unreachable workaround
                        } while(false);
                        uint _749 = uint(int(_10._m0[_659]._m7 >> 2u)) + _747;
                        vec4 _771 = _20._m0[_749]._m0 * vec4(_575 + (_696 * (3.5 * (_20._m0[_749]._m4 * sqrt(_693)))), 1.0);
                        vec3 _775 = _771.xyz / vec3(_771.w);
                        vec2 _778 = (_775.xy * 0.5) + vec2(0.5);
                        _778.y = 1.0 - _778.y;
                        float _787 = (_20._m0[_749]._m5.y / _20._m0[_749]._m6) / (_775.z - _20._m0[_749]._m5.x);
                        float _792 = _646 ? _643 : 6.283185482025146484375;
                        float _793 = _618 * _792;
                        vec2 _794 = _20._m0[_749]._m1 + _19._m33;
                        vec2 _797 = (_20._m0[_749]._m1 + vec2(_20._m0[_749]._m2)) - _19._m33;
                        float _799;
                        _799 = 0.0;
                        for (int _802 = 0; _802 < 12; )
                        {
                            float _807 = float(uint(_802));
                            float _810 = sqrt(_807 + 0.5) * 0.288675129413604736328125;
                            float _811 = fma(_807, 2.3999631404876708984375, _793);
                            vec2 _819 = clamp(fma((vec3(cos(_811), sin(_811), _810).xy * _810) * 2.5, _19._m33, _778), _794, _797);
                            vec2 _822 = fract(fma(vec2(1.0) / _19._m33, _819, vec2(0.5)));
                            vec4 _828 = vec4(lessThan(vec4(_787), textureGather(sampler2D(_21, _12), _819)));
                            float _831 = _822.x;
                            _799 += clamp(mix(mix(_828.w, _828.z, _831), mix(_828.x, _828.y, _831), _822.y), 0.0, 1.0);
                            _802++;
                            continue;
                        }
                        _842 = _792;
                        _843 = _646 ? _646 : true;
                        _844 = mix(1.0, _799 * 0.083333335816860198974609375, spvNMin(_625, _10._m0[_659]._m8));
                    }
                    else
                    {
                        _842 = _643;
                        _843 = _646;
                        _844 = clamp(fma(2.0, _720, 0.5), 0.0, 1.0);
                    }
                    float _845 = (0.079577468335628509521484375 * _718) * _844;
                    vec3 _1148;
                    vec3 _1149;
                    SPIRV_CROSS_BRANCH
                    if (_10._m0[_659]._m3 < 0.0)
                    {
                        vec3 _999 = _10._m0[_659]._m1.xyz * (_845 * _6._m0[0u]);
                        float _1000 = dot(_566, _696);
                        float _1001 = clamp(_1000, -1.0, 1.0);
                        float _1003 = clamp(dot(_566, _577), -1.0, 1.0);
                        float _1009 = cos(0.5 * abs(asin(_1003) - asin(_1001)));
                        vec3 _1011 = _696 - (_566 * _1001);
                        vec3 _1013 = _577 - (_566 * _1003);
                        float _1019 = dot(_1011, _1013) * inversesqrt(fma(dot(_1011, _1011), dot(_1013, _1013), 9.9999997473787516355514526367188e-05));
                        float _1022 = sqrt(clamp(fma(0.5, _1019, 0.5), 0.0, 1.0));
                        float _1051 = _574 * _574;
                        vec3 _1056 = vec3(_1051 * (1.41421353816986083984375 * _1022), _1051 * 0.5, _1051 * 2.0);
                        vec3 _1068 = exp((pow(spvNMax(abs(vec3(_1001 + _1003) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _1022, sqrt(fma(-_1003, _1003, 1.0)), (-0.06994284689426422119140625) * _1003), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_1056 * _1056)) / (_1056 * 2.5066282749176025390625);
                        float _1069 = dot(_577, _696);
                        float _1089 = 1.0 / fma(0.36000001430511474609375, _1009, 1.190000057220458984375 / _1009);
                        float _1092 = _1022 * fma(_1089, fma(-0.800000011920928955078125, _1019, 0.60000002384185791015625), 1.0);
                        float _1097 = -_1009;
                        vec3 _1113 = spvNMax(abs(_570), vec3(9.9999997473787516355514526367188e-05));
                        float _1131 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1097, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                        vec3 _1147 = fma(_999, ((((vec3(0.25 * _1022) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _1069, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _519, clamp(-_1069, 0.0, 1.0))) * _1068.x) + (((pow(_1113, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_1092 * _1089), 9.9999997473787516355514526367188e-05), 2.0))) / _1009)) * (exp(fma(-3.650000095367431640625, _1019, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1097, sqrt(clamp(fma(-_1092, _1092, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _519) * _1068.y)) + ((pow(_1113, vec3(0.800000011920928955078125 / _1009)) * (exp(fma(17.0, _1019, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _1131), 9.9999997473787516355514526367188e-05), 2.0) * _1131))) * _1068.z), _648);
                        _1148 = _1147;
                        _1149 = fma(_999, (sqrt(_570) * ((0.3183098733425140380859375 * mix(clamp((_720 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_1000), 0.3300000131130218505859375)) * _567)) * pow(spvNMax(abs(_570 / vec3(dot(_570, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _844)), _650);
                    }
                    else
                    {
                        vec3 _849 = _10._m0[_659]._m1.xyz * _845;
                        float _850 = dot(_566, _696);
                        float _851 = clamp(_850, -1.0, 1.0);
                        float _853 = clamp(dot(_566, _577), -1.0, 1.0);
                        float _859 = cos(0.5 * abs(asin(_853) - asin(_851)));
                        vec3 _861 = _696 - (_566 * _851);
                        vec3 _863 = _577 - (_566 * _853);
                        float _869 = dot(_861, _863) * inversesqrt(fma(dot(_861, _861), dot(_863, _863), 9.9999997473787516355514526367188e-05));
                        float _872 = sqrt(clamp(fma(0.5, _869, 0.5), 0.0, 1.0));
                        float _901 = _574 * _574;
                        vec3 _906 = vec3(_901 * (1.41421353816986083984375 * _872), _901 * 0.5, _901 * 2.0);
                        vec3 _918 = exp((pow(spvNMax(abs(vec3(_851 + _853) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _872, sqrt(fma(-_853, _853, 1.0)), (-0.06994284689426422119140625) * _853), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_906 * _906)) / (_906 * 2.5066282749176025390625);
                        float _919 = dot(_577, _696);
                        float _939 = 1.0 / fma(0.36000001430511474609375, _859, 1.190000057220458984375 / _859);
                        float _942 = _872 * fma(_939, fma(-0.800000011920928955078125, _869, 0.60000002384185791015625), 1.0);
                        float _947 = -_859;
                        vec3 _963 = spvNMax(abs(_570), vec3(9.9999997473787516355514526367188e-05));
                        float _981 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_947, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                        vec3 _997 = fma(_849, ((((vec3(0.25 * _872) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _919, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _519, clamp(-_919, 0.0, 1.0))) * _918.x) + (((pow(_963, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_942 * _939), 9.9999997473787516355514526367188e-05), 2.0))) / _859)) * (exp(fma(-3.650000095367431640625, _869, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_947, sqrt(clamp(fma(-_942, _942, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _519) * _918.y)) + ((pow(_963, vec3(0.800000011920928955078125 / _859)) * (exp(fma(17.0, _869, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _981), 9.9999997473787516355514526367188e-05), 2.0) * _981))) * _918.z), _648);
                        _1148 = _997;
                        _1149 = fma(_849, (sqrt(_570) * ((0.3183098733425140380859375 * mix(clamp((_720 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_850), 0.3300000131130218505859375)) * _567)) * pow(spvNMax(abs(_570 / vec3(dot(_570, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _844)), _650);
                    }
                    _1150 = _842;
                    _1151 = _843;
                    _1152 = _1148;
                    _1153 = _1149;
                }
                else
                {
                    _1150 = _643;
                    _1151 = _646;
                    _1152 = _648;
                    _1153 = _650;
                }
                _644 = _1150;
                _647 = _1151;
                _649 = _1152;
                _651 = _1153;
            }
            else
            {
                _644 = _643;
                _647 = _646;
                _649 = _648;
                _651 = _650;
            }
        }
        float _1155;
        bool _1158;
        vec3 _1160;
        vec3 _1162;
        uint _1164;
        _1155 = _643;
        _1158 = _646;
        _1160 = _648;
        _1162 = _650;
        _1164 = _652;
        float _1156;
        bool _1159;
        vec3 _1161;
        vec3 _1163;
        for (; _1164 < _637; _1155 = _1156, _1158 = _1159, _1160 = _1161, _1162 = _1163, _1164++)
        {
            uint _1171 = uint(_9._m0[_1164]);
            float _1184 = abs(_10._m0[_1171]._m5);
            if ((_10._m0[_1171]._m6 & (1u << (_525 & 31u))) != 0u)
            {
                vec3 _1202 = _10._m0[_1171]._m0.xyz - _575;
                float _1203 = dot(_1202, _1202);
                vec3 _1206 = _1202 * inversesqrt(spvNMax(_1203, 1.0000000133514319600180897396058e-10));
                float _1207 = _10._m0[_1171]._m0.w * _10._m0[_1171]._m0.w;
                float _1650;
                bool _1651;
                vec3 _1652;
                vec3 _1653;
                if (_1203 < (1.0 / _1207))
                {
                    float _1214 = dot(-_1206, normalize(_10._m0[_1171]._m2.xyz));
                    float _1242;
                    if (_1214 > _10._m0[_1171]._m1.w)
                    {
                        float _1218 = _1203 * _1207;
                        float _1224 = pow(spvNMax(abs(clamp(fma(-_1218, _1218, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1171]._m4);
                        float _1234;
                        if (_10._m0[_1171]._m5 < 0.0)
                        {
                            _1234 = _1224 * fma(4.0, _1207, _1184);
                        }
                        else
                        {
                            _1234 = _1224 * ((1.0 / spvNMax(_1203, 9.9999997473787516355514526367188e-05)) + _1184);
                        }
                        float _1239 = clamp((_1214 - _10._m0[_1171]._m1.w) / spvNMax(_10._m0[_1171]._m2.w - _10._m0[_1171]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1242 = _1234 * (_1239 * _1239);
                    }
                    else
                    {
                        _1242 = 0.0;
                    }
                    float _1244 = dot(_568, _1206);
                    float _1342;
                    bool _1343;
                    float _1344;
                    if ((_10._m0[_1171]._m7 & 1u) != 0u)
                    {
                        uint _1249 = uint(int(_10._m0[_1171]._m7 >> 2u));
                        vec4 _1271 = _20._m0[_1249]._m0 * vec4(_575 + (_1206 * (3.5 * (_20._m0[_1249]._m4 * sqrt(_1203)))), 1.0);
                        vec3 _1275 = _1271.xyz / vec3(_1271.w);
                        vec2 _1278 = (_1275.xy * 0.5) + vec2(0.5);
                        _1278.y = 1.0 - _1278.y;
                        float _1287 = (_20._m0[_1249]._m5.y / _20._m0[_1249]._m6) / (_1275.z - _20._m0[_1249]._m5.x);
                        float _1292 = _1158 ? _1155 : 6.283185482025146484375;
                        float _1293 = _618 * _1292;
                        vec2 _1294 = _20._m0[_1249]._m1 + _19._m33;
                        vec2 _1297 = (_20._m0[_1249]._m1 + vec2(_20._m0[_1249]._m2)) - _19._m33;
                        float _1299;
                        _1299 = 0.0;
                        for (int _1302 = 0; _1302 < 12; )
                        {
                            float _1307 = float(uint(_1302));
                            float _1310 = sqrt(_1307 + 0.5) * 0.288675129413604736328125;
                            float _1311 = fma(_1307, 2.3999631404876708984375, _1293);
                            vec2 _1319 = clamp(fma((vec3(cos(_1311), sin(_1311), _1310).xy * _1310) * 2.5, _19._m33, _1278), _1294, _1297);
                            vec2 _1322 = fract(fma(vec2(1.0) / _19._m33, _1319, vec2(0.5)));
                            vec4 _1328 = vec4(lessThan(vec4(_1287), textureGather(sampler2D(_21, _12), _1319)));
                            float _1331 = _1322.x;
                            _1299 += clamp(mix(mix(_1328.w, _1328.z, _1331), mix(_1328.x, _1328.y, _1331), _1322.y), 0.0, 1.0);
                            _1302++;
                            continue;
                        }
                        _1342 = _1292;
                        _1343 = _1158 ? _1158 : true;
                        _1344 = mix(1.0, _1299 * 0.083333335816860198974609375, spvNMin(_625, _10._m0[_1171]._m8));
                    }
                    else
                    {
                        _1342 = _1155;
                        _1343 = _1158;
                        _1344 = clamp(fma(2.0, _1244, 0.5), 0.0, 1.0);
                    }
                    float _1345 = (0.3183098733425140380859375 * _1242) * _1344;
                    vec3 _1648;
                    vec3 _1649;
                    SPIRV_CROSS_BRANCH
                    if (_10._m0[_1171]._m3 < 0.0)
                    {
                        vec3 _1499 = _10._m0[_1171]._m1.xyz * (_1345 * _6._m0[0u]);
                        float _1500 = dot(_566, _1206);
                        float _1501 = clamp(_1500, -1.0, 1.0);
                        float _1503 = clamp(dot(_566, _577), -1.0, 1.0);
                        float _1509 = cos(0.5 * abs(asin(_1503) - asin(_1501)));
                        vec3 _1511 = _1206 - (_566 * _1501);
                        vec3 _1513 = _577 - (_566 * _1503);
                        float _1519 = dot(_1511, _1513) * inversesqrt(fma(dot(_1511, _1511), dot(_1513, _1513), 9.9999997473787516355514526367188e-05));
                        float _1522 = sqrt(clamp(fma(0.5, _1519, 0.5), 0.0, 1.0));
                        float _1551 = _574 * _574;
                        vec3 _1556 = vec3(_1551 * (1.41421353816986083984375 * _1522), _1551 * 0.5, _1551 * 2.0);
                        vec3 _1568 = exp((pow(spvNMax(abs(vec3(_1501 + _1503) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _1522, sqrt(fma(-_1503, _1503, 1.0)), (-0.06994284689426422119140625) * _1503), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_1556 * _1556)) / (_1556 * 2.5066282749176025390625);
                        float _1569 = dot(_577, _1206);
                        float _1589 = 1.0 / fma(0.36000001430511474609375, _1509, 1.190000057220458984375 / _1509);
                        float _1592 = _1522 * fma(_1589, fma(-0.800000011920928955078125, _1519, 0.60000002384185791015625), 1.0);
                        float _1597 = -_1509;
                        vec3 _1613 = spvNMax(abs(_570), vec3(9.9999997473787516355514526367188e-05));
                        float _1631 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1597, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                        vec3 _1647 = fma(_1499, ((((vec3(0.25 * _1522) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _1569, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _519, clamp(-_1569, 0.0, 1.0))) * _1568.x) + (((pow(_1613, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_1592 * _1589), 9.9999997473787516355514526367188e-05), 2.0))) / _1509)) * (exp(fma(-3.650000095367431640625, _1519, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1597, sqrt(clamp(fma(-_1592, _1592, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _519) * _1568.y)) + ((pow(_1613, vec3(0.800000011920928955078125 / _1509)) * (exp(fma(17.0, _1519, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _1631), 9.9999997473787516355514526367188e-05), 2.0) * _1631))) * _1568.z), _1160);
                        _1648 = _1647;
                        _1649 = fma(_1499, (sqrt(_570) * ((0.3183098733425140380859375 * mix(clamp((_1244 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_1500), 0.3300000131130218505859375)) * _567)) * pow(spvNMax(abs(_570 / vec3(dot(_570, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1344)), _1162);
                    }
                    else
                    {
                        vec3 _1349 = _10._m0[_1171]._m1.xyz * _1345;
                        float _1350 = dot(_566, _1206);
                        float _1351 = clamp(_1350, -1.0, 1.0);
                        float _1353 = clamp(dot(_566, _577), -1.0, 1.0);
                        float _1359 = cos(0.5 * abs(asin(_1353) - asin(_1351)));
                        vec3 _1361 = _1206 - (_566 * _1351);
                        vec3 _1363 = _577 - (_566 * _1353);
                        float _1369 = dot(_1361, _1363) * inversesqrt(fma(dot(_1361, _1361), dot(_1363, _1363), 9.9999997473787516355514526367188e-05));
                        float _1372 = sqrt(clamp(fma(0.5, _1369, 0.5), 0.0, 1.0));
                        float _1401 = _574 * _574;
                        vec3 _1406 = vec3(_1401 * (1.41421353816986083984375 * _1372), _1401 * 0.5, _1401 * 2.0);
                        vec3 _1418 = exp((pow(spvNMax(abs(vec3(_1351 + _1353) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _1372, sqrt(fma(-_1353, _1353, 1.0)), (-0.06994284689426422119140625) * _1353), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_1406 * _1406)) / (_1406 * 2.5066282749176025390625);
                        float _1419 = dot(_577, _1206);
                        float _1439 = 1.0 / fma(0.36000001430511474609375, _1359, 1.190000057220458984375 / _1359);
                        float _1442 = _1372 * fma(_1439, fma(-0.800000011920928955078125, _1369, 0.60000002384185791015625), 1.0);
                        float _1447 = -_1359;
                        vec3 _1463 = spvNMax(abs(_570), vec3(9.9999997473787516355514526367188e-05));
                        float _1481 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1447, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                        vec3 _1497 = fma(_1349, ((((vec3(0.25 * _1372) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _1419, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _519, clamp(-_1419, 0.0, 1.0))) * _1418.x) + (((pow(_1463, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_1442 * _1439), 9.9999997473787516355514526367188e-05), 2.0))) / _1359)) * (exp(fma(-3.650000095367431640625, _1369, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1447, sqrt(clamp(fma(-_1442, _1442, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _519) * _1418.y)) + ((pow(_1463, vec3(0.800000011920928955078125 / _1359)) * (exp(fma(17.0, _1369, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _1481), 9.9999997473787516355514526367188e-05), 2.0) * _1481))) * _1418.z), _1160);
                        _1648 = _1497;
                        _1649 = fma(_1349, (sqrt(_570) * ((0.3183098733425140380859375 * mix(clamp((_1244 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_1350), 0.3300000131130218505859375)) * _567)) * pow(spvNMax(abs(_570 / vec3(dot(_570, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1344)), _1162);
                    }
                    _1650 = _1342;
                    _1651 = _1343;
                    _1652 = _1648;
                    _1653 = _1649;
                }
                else
                {
                    _1650 = _1155;
                    _1651 = _1158;
                    _1652 = _1160;
                    _1653 = _1162;
                }
                _1156 = _1650;
                _1159 = _1651;
                _1161 = _1652;
                _1163 = _1653;
            }
            else
            {
                _1156 = _1155;
                _1159 = _1158;
                _1161 = _1160;
                _1163 = _1162;
            }
        }
        vec3 _1660;
        vec3 _1662;
        _1660 = _1160;
        _1662 = _1162;
        float _1656;
        bool _1659;
        vec3 _1661;
        vec3 _1663;
        float _1655 = _1155;
        bool _1658 = _1158;
        uint _1664 = _1164;
        for (; _1664 < _641; _1655 = _1656, _1658 = _1659, _1660 = _1661, _1662 = _1663, _1664++)
        {
            uint _1671 = uint(_9._m0[_1664]);
            int _1700 = int(_11._m0[_1671]._m1 >> 1u) - 1;
            if (((_11._m0[_1671]._m4 & 16777215u) & (1u << (_525 & 31u))) != 0u)
            {
                vec3 _1711 = _11._m0[_1671]._m6 * vec4(_575, 1.0);
                float _2246;
                bool _2247;
                vec3 _2248;
                vec3 _2249;
                if (all(lessThan(abs(_1711 - vec3(0.5)), vec3(0.5))))
                {
                    int _1718 = int(_11._m0[_1671]._m4 >> 24u);
                    float _1719 = _1711.z;
                    vec3 _1758;
                    if (_1719 < _11._m0[_1671]._m2.x)
                    {
                        float _1746 = _1719 * _11._m0[_1671]._m2.z;
                        float _1749 = _1746 * _1746;
                        vec3 _1757;
                        _1757.z = dot(_363[_1718], vec4(_1746, _1749, smoothstep(0.0, 1.0, _1746), (_1749 * _1746) * fma(_1746, fma(_1746, 6.0, -15.0), 10.0)));
                        _1758 = _1757;
                    }
                    else
                    {
                        vec3 _1744;
                        if (_1719 > _11._m0[_1671]._m2.y)
                        {
                            float _1732 = (1.0 - _1719) * _11._m0[_1671]._m2.w;
                            float _1735 = _1732 * _1732;
                            vec3 _1743;
                            _1743.z = dot(_363[_1718], vec4(_1732, _1735, smoothstep(0.0, 1.0, _1732), (_1735 * _1732) * fma(_1732, fma(_1732, 6.0, -15.0), 10.0)));
                            _1744 = _1743;
                        }
                        else
                        {
                            _1744 = vec3(0.0, 0.0, 1.0);
                        }
                        _1758 = _1744;
                    }
                    vec2 _1759 = _1711.xy;
                    vec2 _1763 = (vec2(0.5) - abs(_1759 - vec2(0.5))) * _11._m0[_1671]._m3;
                    float _1764 = _1763.x;
                    vec3 _1781;
                    if (_1764 < 1.0)
                    {
                        float _1772 = _1764 * _1764;
                        vec3 _1780 = _1758;
                        _1780.x = dot(_363[_1718], vec4(_1764, _1772, smoothstep(0.0, 1.0, _1764), (_1772 * _1764) * fma(_1764, fma(_1764, 6.0, -15.0), 10.0)));
                        _1781 = _1780;
                    }
                    else
                    {
                        vec3 _1769 = _1758;
                        _1769.x = 1.0;
                        _1781 = _1769;
                    }
                    float _1782 = _1763.y;
                    vec3 _1799;
                    if (_1782 < 1.0)
                    {
                        float _1790 = _1782 * _1782;
                        vec3 _1798 = _1781;
                        _1798.y = dot(_363[_1718], vec4(_1782, _1790, smoothstep(0.0, 1.0, _1782), (_1790 * _1782) * fma(_1782, fma(_1782, 6.0, -15.0), 10.0)));
                        _1799 = _1798;
                    }
                    else
                    {
                        vec3 _1787 = _1781;
                        _1787.y = 1.0;
                        _1799 = _1787;
                    }
                    float _1805 = dot(_568, _11._m0[_1671]._m9);
                    float _1897;
                    bool _1898;
                    float _1899;
                    if ((_11._m0[_1671]._m8 & 1u) != 0u)
                    {
                        uint _1810 = uint(int(_11._m0[_1671]._m8 >> 2u));
                        vec4 _1830 = _20._m0[_1810]._m0 * vec4(_575 + (_11._m0[_1671]._m9 * (3.5 * _20._m0[_1810]._m4)), 1.0);
                        vec2 _1833 = (_1830.xy * 0.5) + vec2(0.5);
                        _1833.y = 1.0 - _1833.y;
                        float _1842 = ((_1830.z - _20._m0[_1810]._m5.y) / _20._m0[_1810]._m5.x) / _20._m0[_1810]._m6;
                        float _1847 = _1658 ? _1655 : 6.283185482025146484375;
                        float _1848 = _618 * _1847;
                        vec2 _1849 = _20._m0[_1810]._m1 + _19._m33;
                        vec2 _1852 = (_20._m0[_1810]._m1 + vec2(_20._m0[_1810]._m2)) - _19._m33;
                        float _1854;
                        _1854 = 0.0;
                        for (int _1857 = 0; _1857 < 12; )
                        {
                            float _1862 = float(uint(_1857));
                            float _1865 = sqrt(_1862 + 0.5) * 0.288675129413604736328125;
                            float _1866 = fma(_1862, 2.3999631404876708984375, _1848);
                            vec2 _1874 = clamp(fma((vec3(cos(_1866), sin(_1866), _1865).xy * _1865) * 2.5, _19._m33, _1833), _1849, _1852);
                            vec2 _1877 = fract(fma(vec2(1.0) / _19._m33, _1874, vec2(0.5)));
                            vec4 _1883 = vec4(lessThan(vec4(_1842), textureGather(sampler2D(_21, _12), _1874)));
                            float _1886 = _1877.x;
                            _1854 += clamp(mix(mix(_1883.w, _1883.z, _1886), mix(_1883.x, _1883.y, _1886), _1877.y), 0.0, 1.0);
                            _1857++;
                            continue;
                        }
                        _1897 = _1847;
                        _1898 = _1658 ? _1658 : true;
                        _1899 = mix(1.0, _1854 * 0.083333335816860198974609375, spvNMin(_625, _11._m0[_1671]._m5));
                    }
                    else
                    {
                        _1897 = _1655;
                        _1898 = _1658;
                        _1899 = clamp(fma(2.0, _1805, 0.5), 0.0, 1.0);
                    }
                    float _1900 = ((_1799.x * _1799.y) * _1799.z) * _1899;
                    vec3 _1941;
                    if (_1700 >= 0)
                    {
                        uint _1905 = gl_SubgroupInvocationID & 3u;
                        vec2 _1911 = (subgroupQuadSwapHorizontal(_1759) - _1759) * (((_1905 & 1u) != 0u) ? (-1.0) : 1.0);
                        vec2 _1917 = (subgroupQuadSwapVertical(_1759) - _1759) * (((_1905 & 2u) != 0u) ? (-1.0) : 1.0);
                        vec2 _1921 = mix(_1911, vec2(0.0), bvec2(any(isnan(_1911))));
                        vec2 _1925 = mix(_1917, vec2(0.0), bvec2(any(isnan(_1917))));
                        bvec2 _1934 = bvec2(any(greaterThan(abs(vec4(_1921, _1925)), vec4(0.015625))));
                        int _74 = _1700;
                        _1941 = _11._m0[_1671]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_74], _7)), _1759, mix(_1921, vec2(0.0), _1934), mix(_1925, vec2(0.0), _1934)).xyz;
                    }
                    else
                    {
                        _1941 = _11._m0[_1671]._m0;
                    }
                    vec3 _2244;
                    vec3 _2245;
                    SPIRV_CROSS_BRANCH
                    if ((_11._m0[_1671]._m1 & 1u) != 0u)
                    {
                        vec3 _2095 = _1941 * (_1900 * _6._m0[0u]);
                        float _2096 = dot(_566, _11._m0[_1671]._m9);
                        float _2097 = clamp(_2096, -1.0, 1.0);
                        float _2099 = clamp(dot(_566, _577), -1.0, 1.0);
                        float _2105 = cos(0.5 * abs(asin(_2099) - asin(_2097)));
                        vec3 _2107 = _11._m0[_1671]._m9 - (_566 * _2097);
                        vec3 _2109 = _577 - (_566 * _2099);
                        float _2115 = dot(_2107, _2109) * inversesqrt(fma(dot(_2107, _2107), dot(_2109, _2109), 9.9999997473787516355514526367188e-05));
                        float _2118 = sqrt(clamp(fma(0.5, _2115, 0.5), 0.0, 1.0));
                        float _2147 = _574 * _574;
                        vec3 _2152 = vec3(_2147 * (1.41421353816986083984375 * _2118), _2147 * 0.5, _2147 * 2.0);
                        vec3 _2164 = exp((pow(spvNMax(abs(vec3(_2097 + _2099) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _2118, sqrt(fma(-_2099, _2099, 1.0)), (-0.06994284689426422119140625) * _2099), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_2152 * _2152)) / (_2152 * 2.5066282749176025390625);
                        float _2165 = dot(_577, _11._m0[_1671]._m9);
                        float _2185 = 1.0 / fma(0.36000001430511474609375, _2105, 1.190000057220458984375 / _2105);
                        float _2188 = _2118 * fma(_2185, fma(-0.800000011920928955078125, _2115, 0.60000002384185791015625), 1.0);
                        float _2193 = -_2105;
                        vec3 _2209 = spvNMax(abs(_570), vec3(9.9999997473787516355514526367188e-05));
                        float _2227 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2193, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                        vec3 _2243 = fma(_2095, ((((vec3(0.25 * _2118) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _2165, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _519, clamp(-_2165, 0.0, 1.0))) * _2164.x) + (((pow(_2209, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_2188 * _2185), 9.9999997473787516355514526367188e-05), 2.0))) / _2105)) * (exp(fma(-3.650000095367431640625, _2115, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2193, sqrt(clamp(fma(-_2188, _2188, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _519) * _2164.y)) + ((pow(_2209, vec3(0.800000011920928955078125 / _2105)) * (exp(fma(17.0, _2115, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _2227), 9.9999997473787516355514526367188e-05), 2.0) * _2227))) * _2164.z), _1660);
                        _2244 = _2243;
                        _2245 = fma(_2095, (sqrt(_570) * ((0.3183098733425140380859375 * mix(clamp((_1805 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_2096), 0.3300000131130218505859375)) * _567)) * pow(spvNMax(abs(_570 / vec3(dot(_570, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1899)), _1662);
                    }
                    else
                    {
                        vec3 _1945 = _1941 * _1900;
                        float _1946 = dot(_566, _11._m0[_1671]._m9);
                        float _1947 = clamp(_1946, -1.0, 1.0);
                        float _1949 = clamp(dot(_566, _577), -1.0, 1.0);
                        float _1955 = cos(0.5 * abs(asin(_1949) - asin(_1947)));
                        vec3 _1957 = _11._m0[_1671]._m9 - (_566 * _1947);
                        vec3 _1959 = _577 - (_566 * _1949);
                        float _1965 = dot(_1957, _1959) * inversesqrt(fma(dot(_1957, _1957), dot(_1959, _1959), 9.9999997473787516355514526367188e-05));
                        float _1968 = sqrt(clamp(fma(0.5, _1965, 0.5), 0.0, 1.0));
                        float _1997 = _574 * _574;
                        vec3 _2002 = vec3(_1997 * (1.41421353816986083984375 * _1968), _1997 * 0.5, _1997 * 2.0);
                        vec3 _2014 = exp((pow(spvNMax(abs(vec3(_1947 + _1949) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _1968, sqrt(fma(-_1949, _1949, 1.0)), (-0.06994284689426422119140625) * _1949), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_2002 * _2002)) / (_2002 * 2.5066282749176025390625);
                        float _2015 = dot(_577, _11._m0[_1671]._m9);
                        float _2035 = 1.0 / fma(0.36000001430511474609375, _1955, 1.190000057220458984375 / _1955);
                        float _2038 = _1968 * fma(_2035, fma(-0.800000011920928955078125, _1965, 0.60000002384185791015625), 1.0);
                        float _2043 = -_1955;
                        vec3 _2059 = spvNMax(abs(_570), vec3(9.9999997473787516355514526367188e-05));
                        float _2077 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2043, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                        vec3 _2093 = fma(_1945, ((((vec3(0.25 * _1968) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _2015, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _519, clamp(-_2015, 0.0, 1.0))) * _2014.x) + (((pow(_2059, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_2038 * _2035), 9.9999997473787516355514526367188e-05), 2.0))) / _1955)) * (exp(fma(-3.650000095367431640625, _1965, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2043, sqrt(clamp(fma(-_2038, _2038, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _519) * _2014.y)) + ((pow(_2059, vec3(0.800000011920928955078125 / _1955)) * (exp(fma(17.0, _1965, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _2077), 9.9999997473787516355514526367188e-05), 2.0) * _2077))) * _2014.z), _1660);
                        _2244 = _2093;
                        _2245 = fma(_1945, (sqrt(_570) * ((0.3183098733425140380859375 * mix(clamp((_1805 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_1946), 0.3300000131130218505859375)) * _567)) * pow(spvNMax(abs(_570 / vec3(dot(_570, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1899)), _1662);
                    }
                    _2246 = _1897;
                    _2247 = _1898;
                    _2248 = _2244;
                    _2249 = _2245;
                }
                else
                {
                    _2246 = _1655;
                    _2247 = _1658;
                    _2248 = _1660;
                    _2249 = _1662;
                }
                _1656 = _2246;
                _1659 = _2247;
                _1661 = _2248;
                _1663 = _2249;
            }
            else
            {
                _1656 = _1655;
                _1659 = _1658;
                _1661 = _1660;
                _1663 = _1662;
            }
        }
        vec3 _2251 = reflect(-_577, _568);
        vec3 _2254 = vec3(_573.x, _573.y, _573.z);
        vec3 _2264 = textureLod(samplerCube(_14, _7), _568, 0.0).xyz * _19._m27;
        float _2267 = fma(_574, 8.0, _19._m30 - 8.0);
        vec3 _2271 = textureLod(samplerCube(_15, _7), _2251, _2267).xyz * _19._m27;
        bool _2274 = _19._m29 > 0.0;
        vec3 _2296;
        vec3 _2297;
        SPIRV_CROSS_BRANCH
        if (_2274)
        {
            vec3 _2286 = vec3(_19._m29);
            _2296 = mix(_2271, textureLod(samplerCube(_17, _7), _2251, fma(_574, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _2286);
            _2297 = mix(_2264, textureLod(samplerCube(_16, _7), _568, 0.0).xyz * _19._m28, _2286);
        }
        else
        {
            _2296 = _2271;
            _2297 = _2264;
        }
        float _2298 = spvNMax(abs(dot(_577, _568)), 0.001953125);
        vec4 _2303 = textureLod(sampler2D(_18, _12), vec2(_2298, _574), 0.0);
        vec3 _2313 = -_568;
        vec3 _2316 = -_2251;
        vec3 _2320 = textureLod(samplerCube(_14, _7), _2313, 0.0).xyz * _19._m27;
        vec3 _2324 = textureLod(samplerCube(_15, _7), _2316, _2267).xyz * _19._m27;
        vec3 _2346;
        vec3 _2347;
        SPIRV_CROSS_BRANCH
        if (_2274)
        {
            vec3 _2336 = vec3(_19._m29);
            _2346 = mix(_2324, textureLod(samplerCube(_17, _7), _2316, fma(_574, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _2336);
            _2347 = mix(_2320, textureLod(samplerCube(_16, _7), _2313, 0.0).xyz * _19._m28, _2336);
        }
        else
        {
            _2346 = _2324;
            _2347 = _2320;
        }
        float _2348 = spvNMax(abs(dot(_577, _2313)), 0.001953125);
        vec4 _2351 = textureLod(sampler2D(_18, _12), vec2(_2348, _574), 0.0);
        uvec4 _2368 = uvec4(_8._m0[_626]);
        uint _2370 = _2368.y;
        uint _2380 = ((_2368.z >> 0u) & 1023u) + (((_2370 >> 12u) & 4095u) + (((_2370 >> 0u) & 4095u) + _2368.x));
        uint _2382 = (_2370 >> 24u) + _2380;
        vec3 _2384;
        vec3 _2387;
        _2384 = ((_2296 * ((_2254 * _2303.x) + vec3(_2303.y))) * 0.300000011920928955078125) + ((_2346 * ((_2254 * _2351.x) + vec3(_2351.y))) * 0.699999988079071044921875);
        _2387 = ((_2297 * (_570 * _2303.z)) * 0.300000011920928955078125) + ((_2347 * (_570 * _2351.z)) * 0.699999988079071044921875);
        vec3 _2385;
        vec3 _2388;
        for (uint _2389 = _2380; _2389 < _2382; _2384 = _2385, _2387 = _2388, _2389++)
        {
            uint _2396 = uint(_9._m0[_2389]);
            int _2415 = int((_13._m0[_2396]._m5 >> 1u) & 3u);
            mat3 _2419 = mat3(_13._m0[_2396]._m1[0], _13._m0[_2396]._m1[1], _13._m0[_2396]._m1[2]);
            int _2425 = (int((_13._m0[_2396]._m5 >> 3u) & 16383u) - 1) * 2;
            int _2430 = (int((_13._m0[_2396]._m5 >> 17u) & 16383u) - 1) * 2;
            int _2435 = (int((_13._m0[_2396]._m6 >> 0u) & 65535u) - 1) * 2;
            int _2440 = (int((_13._m0[_2396]._m6 >> 16u) & 65535u) - 1) * 2;
            float _2443 = (_13._m0[_2396]._m3 < 0.0) ? (-_13._m0[_2396]._m3) : 1.0;
            vec3 _2445 = _2419 * (_575 - _13._m0[_2396]._m1[3]);
            bool _2446 = int(_13._m0[_2396]._m5 & 1u) == 1;
            vec3 _2447 = abs(_2445);
            float _2450 = dot(_2445, _2445);
            if (_2446 ? any(greaterThanEqual(_2447, _13._m0[_2396]._m0.xyz)) : (_2450 >= _13._m0[_2396]._m0.y))
            {
                _2385 = _2384;
                _2388 = _2387;
                continue;
            }
            vec3 _2787;
            SPIRV_CROSS_FLATTEN
            if ((_2415 & 1) != 0)
            {
                vec3 _2460 = _2419 * _568;
                vec2 _2549;
                bool _2550;
                if (_2446)
                {
                    vec2 _2544;
                    bool _2548;
                    do
                    {
                        vec3 _2528 = (_13._m0[_2396]._m0.xyz - _2445) / _2460;
                        vec3 _2531 = ((-_13._m0[_2396]._m0.xyz) - _2445) / _2460;
                        vec3 _2532 = spvNMin(_2528, _2531);
                        vec3 _2533 = spvNMax(_2528, _2531);
                        float _2538 = spvNMax(_2532.x, spvNMax(_2532.y, _2532.z));
                        float _2543 = spvNMin(_2533.x, spvNMin(_2533.y, _2533.z));
                        _2544 = vec2(_2538, _2543);
                        if (_2538 > _2543)
                        {
                            _2548 = false;
                            break;
                        }
                        _2548 = true;
                        break;
                    } while(false);
                    _2549 = _2544;
                    _2550 = _2548;
                }
                else
                {
                    vec2 _2523;
                    bool _2524;
                    do
                    {
                        float _2466 = dot(_2460, _2460);
                        float _2467 = dot(_2460, _2445);
                        float _2468 = 2.0 * _2467;
                        float _2469 = _2450 - _13._m0[_2396]._m0.y;
                        float _2505;
                        float _2506;
                        bool _2507;
                        do
                        {
                            float _2475 = fma(_2468, _2468, -((4.0 * _2466) * _2469));
                            float _2503;
                            float _2504;
                            if (_2475 < 0.0)
                            {
                                _2505 = 0.0;
                                _2506 = 0.0;
                                _2507 = false;
                                break;
                            }
                            else
                            {
                                if (_2475 == 0.0)
                                {
                                    float _2502 = (_2467 * (-1.0)) * (1.0 / _2466);
                                    _2503 = _2502;
                                    _2504 = _2502;
                                }
                                else
                                {
                                    float _2495;
                                    if (_2468 > 0.0)
                                    {
                                        _2495 = (-0.5) * fma(2.0, _2467, sqrt(_2475));
                                    }
                                    else
                                    {
                                        _2495 = (-0.5) * fma(2.0, _2467, -sqrt(_2475));
                                    }
                                    _2503 = _2469 * (1.0 / _2495);
                                    _2504 = _2495 * (1.0 / _2466);
                                }
                            }
                            _2505 = _2503;
                            _2506 = _2504;
                            _2507 = true;
                            break;
                        } while(false);
                        if (!_2507)
                        {
                            _2523 = vec2(0.0);
                            _2524 = false;
                            break;
                        }
                        if ((_2506 < 0.0) && (_2505 < 0.0))
                        {
                            _2523 = vec2(0.0);
                            _2524 = false;
                            break;
                        }
                        vec2 _2522;
                        if (_2506 > _2505)
                        {
                            _2522 = vec2(_2505, _2506);
                        }
                        else
                        {
                            _2522 = vec2(_2506, _2505);
                        }
                        _2523 = _2522;
                        _2524 = true;
                        break;
                    } while(false);
                    _2549 = _2523;
                    _2550 = _2524;
                }
                vec3 _2553 = _2445 + (_2460 * _2549.y);
                float _2574;
                if (_2446)
                {
                    _2574 = 1.0 - clamp(length(spvNMax(_2447 - (_13._m0[_2396]._m0.xyz - vec3(_13._m0[_2396]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2574 = clamp((_13._m0[_2396]._m0.x - length(_2445)) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2577 = float(_2550) * smoothstep(0.0, 1.0, _2574);
                vec4 _2619;
                SPIRV_CROSS_BRANCH
                if (_2577 > 9.9999997473787516355514526367188e-05)
                {
                    float _2586 = mix(clamp((_2549.y * (1.0 / length(_2553))) * _574, 0.0, _574), _574, _574);
                    vec3 _2588 = mix(_2553, _2460, vec3(_2586));
                    int _78 = _2425;
                    vec4 _2589 = textureLod(nonuniformEXT(samplerCube(_24[_78], _7)), _2588, 0.0);
                    int _82 = _2425 + 1;
                    _2589.w = textureLod(nonuniformEXT(samplerCube(_24[_82], _7)), _2588, 0.0).x;
                    vec4 _2604;
                    SPIRV_CROSS_BRANCH
                    if (_2430 >= 0)
                    {
                        int _86 = _2430;
                        vec4 _2597 = textureLod(nonuniformEXT(samplerCube(_24[_86], _7)), _2588, 0.0);
                        int _90 = _2430 + 1;
                        _2597.w = textureLod(nonuniformEXT(samplerCube(_24[_90], _7)), _2588, 0.0).x;
                        _2604 = mix(_2589, _2597, vec4(_13._m0[_2396]._m3));
                    }
                    else
                    {
                        _2604 = _2589;
                    }
                    vec4 _2605 = _2604 * _2443;
                    vec3 _2614 = (_2605.xyz * _13._m0[_2396]._m4).xyz * (_570 * textureLod(sampler2D(_18, _12), vec2(_2298, _2586), 0.0).z);
                    vec4 _2615 = vec4(_2614.x, _2614.y, _2614.z, _2605.w);
                    _2615.w = _2605.w * _2577;
                    _2619 = _2615;
                }
                else
                {
                    _2619 = vec4(0.0);
                }
                vec3 _2620 = _2419 * _2313;
                vec2 _2709;
                bool _2710;
                if (_2446)
                {
                    vec2 _2704;
                    bool _2708;
                    do
                    {
                        vec3 _2688 = (_13._m0[_2396]._m0.xyz - _2445) / _2620;
                        vec3 _2691 = ((-_13._m0[_2396]._m0.xyz) - _2445) / _2620;
                        vec3 _2692 = spvNMin(_2688, _2691);
                        vec3 _2693 = spvNMax(_2688, _2691);
                        float _2698 = spvNMax(_2692.x, spvNMax(_2692.y, _2692.z));
                        float _2703 = spvNMin(_2693.x, spvNMin(_2693.y, _2693.z));
                        _2704 = vec2(_2698, _2703);
                        if (_2698 > _2703)
                        {
                            _2708 = false;
                            break;
                        }
                        _2708 = true;
                        break;
                    } while(false);
                    _2709 = _2704;
                    _2710 = _2708;
                }
                else
                {
                    vec2 _2683;
                    bool _2684;
                    do
                    {
                        float _2626 = dot(_2620, _2620);
                        float _2627 = dot(_2620, _2445);
                        float _2628 = 2.0 * _2627;
                        float _2629 = _2450 - _13._m0[_2396]._m0.y;
                        float _2665;
                        float _2666;
                        bool _2667;
                        do
                        {
                            float _2635 = fma(_2628, _2628, -((4.0 * _2626) * _2629));
                            float _2663;
                            float _2664;
                            if (_2635 < 0.0)
                            {
                                _2665 = 0.0;
                                _2666 = 0.0;
                                _2667 = false;
                                break;
                            }
                            else
                            {
                                if (_2635 == 0.0)
                                {
                                    float _2662 = (_2627 * (-1.0)) * (1.0 / _2626);
                                    _2663 = _2662;
                                    _2664 = _2662;
                                }
                                else
                                {
                                    float _2655;
                                    if (_2628 > 0.0)
                                    {
                                        _2655 = (-0.5) * fma(2.0, _2627, sqrt(_2635));
                                    }
                                    else
                                    {
                                        _2655 = (-0.5) * fma(2.0, _2627, -sqrt(_2635));
                                    }
                                    _2663 = _2629 * (1.0 / _2655);
                                    _2664 = _2655 * (1.0 / _2626);
                                }
                            }
                            _2665 = _2663;
                            _2666 = _2664;
                            _2667 = true;
                            break;
                        } while(false);
                        if (!_2667)
                        {
                            _2683 = vec2(0.0);
                            _2684 = false;
                            break;
                        }
                        if ((_2666 < 0.0) && (_2665 < 0.0))
                        {
                            _2683 = vec2(0.0);
                            _2684 = false;
                            break;
                        }
                        vec2 _2682;
                        if (_2666 > _2665)
                        {
                            _2682 = vec2(_2665, _2666);
                        }
                        else
                        {
                            _2682 = vec2(_2666, _2665);
                        }
                        _2683 = _2682;
                        _2684 = true;
                        break;
                    } while(false);
                    _2709 = _2683;
                    _2710 = _2684;
                }
                vec3 _2713 = _2445 + (_2620 * _2709.y);
                float _2734;
                if (_2446)
                {
                    _2734 = 1.0 - clamp(length(spvNMax(_2447 - (_13._m0[_2396]._m0.xyz - vec3(_13._m0[_2396]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2734 = clamp((_13._m0[_2396]._m0.x - length(_2445)) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2737 = float(_2710) * smoothstep(0.0, 1.0, _2734);
                vec4 _2779;
                SPIRV_CROSS_BRANCH
                if (_2737 > 9.9999997473787516355514526367188e-05)
                {
                    float _2746 = mix(clamp((_2709.y * (1.0 / length(_2713))) * _574, 0.0, _574), _574, _574);
                    vec3 _2748 = mix(_2713, _2620, vec3(_2746));
                    int _94 = _2425;
                    vec4 _2749 = textureLod(nonuniformEXT(samplerCube(_24[_94], _7)), _2748, 0.0);
                    int _98 = _2425 + 1;
                    _2749.w = textureLod(nonuniformEXT(samplerCube(_24[_98], _7)), _2748, 0.0).x;
                    vec4 _2764;
                    SPIRV_CROSS_BRANCH
                    if (_2430 >= 0)
                    {
                        int _102 = _2430;
                        vec4 _2757 = textureLod(nonuniformEXT(samplerCube(_24[_102], _7)), _2748, 0.0);
                        int _106 = _2430 + 1;
                        _2757.w = textureLod(nonuniformEXT(samplerCube(_24[_106], _7)), _2748, 0.0).x;
                        _2764 = mix(_2749, _2757, vec4(_13._m0[_2396]._m3));
                    }
                    else
                    {
                        _2764 = _2749;
                    }
                    vec4 _2765 = _2764 * _2443;
                    vec3 _2774 = (_2765.xyz * _13._m0[_2396]._m4).xyz * (_570 * textureLod(sampler2D(_18, _12), vec2(_2348, _2746), 0.0).z);
                    vec4 _2775 = vec4(_2774.x, _2774.y, _2774.z, _2765.w);
                    _2775.w = _2765.w * _2737;
                    _2779 = _2775;
                }
                else
                {
                    _2779 = vec4(0.0);
                }
                vec4 _2782 = (_2619 * 0.300000011920928955078125) + (_2779 * 0.699999988079071044921875);
                _2787 = mix(_2387, _2782.xyz, vec3(_2782.w));
            }
            else
            {
                _2787 = _2387;
            }
            vec3 _3139;
            SPIRV_CROSS_FLATTEN
            if ((_2415 & 2) != 0)
            {
                vec3 _2792 = _2419 * _2251;
                vec2 _2881;
                bool _2882;
                if (_2446)
                {
                    vec2 _2876;
                    bool _2880;
                    do
                    {
                        vec3 _2860 = (_13._m0[_2396]._m0.xyz - _2445) / _2792;
                        vec3 _2863 = ((-_13._m0[_2396]._m0.xyz) - _2445) / _2792;
                        vec3 _2864 = spvNMin(_2860, _2863);
                        vec3 _2865 = spvNMax(_2860, _2863);
                        float _2870 = spvNMax(_2864.x, spvNMax(_2864.y, _2864.z));
                        float _2875 = spvNMin(_2865.x, spvNMin(_2865.y, _2865.z));
                        _2876 = vec2(_2870, _2875);
                        if (_2870 > _2875)
                        {
                            _2880 = false;
                            break;
                        }
                        _2880 = true;
                        break;
                    } while(false);
                    _2881 = _2876;
                    _2882 = _2880;
                }
                else
                {
                    vec2 _2855;
                    bool _2856;
                    do
                    {
                        float _2798 = dot(_2792, _2792);
                        float _2799 = dot(_2792, _2445);
                        float _2800 = 2.0 * _2799;
                        float _2801 = _2450 - _13._m0[_2396]._m0.y;
                        float _2837;
                        float _2838;
                        bool _2839;
                        do
                        {
                            float _2807 = fma(_2800, _2800, -((4.0 * _2798) * _2801));
                            float _2835;
                            float _2836;
                            if (_2807 < 0.0)
                            {
                                _2837 = 0.0;
                                _2838 = 0.0;
                                _2839 = false;
                                break;
                            }
                            else
                            {
                                if (_2807 == 0.0)
                                {
                                    float _2834 = (_2799 * (-1.0)) * (1.0 / _2798);
                                    _2835 = _2834;
                                    _2836 = _2834;
                                }
                                else
                                {
                                    float _2827;
                                    if (_2800 > 0.0)
                                    {
                                        _2827 = (-0.5) * fma(2.0, _2799, sqrt(_2807));
                                    }
                                    else
                                    {
                                        _2827 = (-0.5) * fma(2.0, _2799, -sqrt(_2807));
                                    }
                                    _2835 = _2801 * (1.0 / _2827);
                                    _2836 = _2827 * (1.0 / _2798);
                                }
                            }
                            _2837 = _2835;
                            _2838 = _2836;
                            _2839 = true;
                            break;
                        } while(false);
                        if (!_2839)
                        {
                            _2855 = vec2(0.0);
                            _2856 = false;
                            break;
                        }
                        if ((_2838 < 0.0) && (_2837 < 0.0))
                        {
                            _2855 = vec2(0.0);
                            _2856 = false;
                            break;
                        }
                        vec2 _2854;
                        if (_2838 > _2837)
                        {
                            _2854 = vec2(_2837, _2838);
                        }
                        else
                        {
                            _2854 = vec2(_2838, _2837);
                        }
                        _2855 = _2854;
                        _2856 = true;
                        break;
                    } while(false);
                    _2881 = _2855;
                    _2882 = _2856;
                }
                vec3 _2885 = _2445 + (_2792 * _2881.y);
                float _2906;
                if (_2446)
                {
                    _2906 = 1.0 - clamp(length(spvNMax(_2447 - (_13._m0[_2396]._m0.xyz - vec3(_13._m0[_2396]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2906 = clamp((_13._m0[_2396]._m0.x - length(_2445)) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2909 = float(_2882) * smoothstep(0.0, 1.0, _2906);
                vec4 _2961;
                SPIRV_CROSS_BRANCH
                if (_2909 > 9.9999997473787516355514526367188e-05)
                {
                    float _2918 = mix(clamp((_2881.y * (1.0 / length(_2885))) * _574, 0.0, _574), _574, _574);
                    vec3 _2920 = mix(_2885, _2792, vec3(_2918));
                    float _2921 = _2918 * 8.0;
                    int _110 = _2435;
                    int _114 = _2435 + 1;
                    vec4 _2929 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_110], _7)), _2920, _2921).xyz, textureLod(nonuniformEXT(samplerCube(_24[_114], _7)), _2920, _2921).x);
                    vec4 _2943;
                    SPIRV_CROSS_BRANCH
                    if (_2440 >= 0)
                    {
                        int _118 = _2440;
                        int _122 = _2440 + 1;
                        _2943 = mix(_2929, vec4(textureLod(nonuniformEXT(samplerCube(_24[_118], _7)), _2920, _2921).xyz, textureLod(nonuniformEXT(samplerCube(_24[_122], _7)), _2920, _2921).x), vec4(_13._m0[_2396]._m3));
                    }
                    else
                    {
                        _2943 = _2929;
                    }
                    vec4 _2944 = _2943 * _2443;
                    vec4 _2949 = textureLod(sampler2D(_18, _12), vec2(_2298, _2918), 0.0);
                    vec3 _2956 = (_2944.xyz * _13._m0[_2396]._m4).xyz * ((_2254 * _2949.x) + vec3(_2949.y));
                    vec4 _2957 = vec4(_2956.x, _2956.y, _2956.z, _2944.w);
                    _2957.w = _2944.w * _2909;
                    _2961 = _2957;
                }
                else
                {
                    _2961 = vec4(0.0);
                }
                vec3 _2962 = _2419 * _2316;
                vec2 _3051;
                bool _3052;
                if (_2446)
                {
                    vec2 _3046;
                    bool _3050;
                    do
                    {
                        vec3 _3030 = (_13._m0[_2396]._m0.xyz - _2445) / _2962;
                        vec3 _3033 = ((-_13._m0[_2396]._m0.xyz) - _2445) / _2962;
                        vec3 _3034 = spvNMin(_3030, _3033);
                        vec3 _3035 = spvNMax(_3030, _3033);
                        float _3040 = spvNMax(_3034.x, spvNMax(_3034.y, _3034.z));
                        float _3045 = spvNMin(_3035.x, spvNMin(_3035.y, _3035.z));
                        _3046 = vec2(_3040, _3045);
                        if (_3040 > _3045)
                        {
                            _3050 = false;
                            break;
                        }
                        _3050 = true;
                        break;
                    } while(false);
                    _3051 = _3046;
                    _3052 = _3050;
                }
                else
                {
                    vec2 _3025;
                    bool _3026;
                    do
                    {
                        float _2968 = dot(_2962, _2962);
                        float _2969 = dot(_2962, _2445);
                        float _2970 = 2.0 * _2969;
                        float _2971 = _2450 - _13._m0[_2396]._m0.y;
                        float _3007;
                        float _3008;
                        bool _3009;
                        do
                        {
                            float _2977 = fma(_2970, _2970, -((4.0 * _2968) * _2971));
                            float _3005;
                            float _3006;
                            if (_2977 < 0.0)
                            {
                                _3007 = 0.0;
                                _3008 = 0.0;
                                _3009 = false;
                                break;
                            }
                            else
                            {
                                if (_2977 == 0.0)
                                {
                                    float _3004 = (_2969 * (-1.0)) * (1.0 / _2968);
                                    _3005 = _3004;
                                    _3006 = _3004;
                                }
                                else
                                {
                                    float _2997;
                                    if (_2970 > 0.0)
                                    {
                                        _2997 = (-0.5) * fma(2.0, _2969, sqrt(_2977));
                                    }
                                    else
                                    {
                                        _2997 = (-0.5) * fma(2.0, _2969, -sqrt(_2977));
                                    }
                                    _3005 = _2971 * (1.0 / _2997);
                                    _3006 = _2997 * (1.0 / _2968);
                                }
                            }
                            _3007 = _3005;
                            _3008 = _3006;
                            _3009 = true;
                            break;
                        } while(false);
                        if (!_3009)
                        {
                            _3025 = vec2(0.0);
                            _3026 = false;
                            break;
                        }
                        if ((_3008 < 0.0) && (_3007 < 0.0))
                        {
                            _3025 = vec2(0.0);
                            _3026 = false;
                            break;
                        }
                        vec2 _3024;
                        if (_3008 > _3007)
                        {
                            _3024 = vec2(_3007, _3008);
                        }
                        else
                        {
                            _3024 = vec2(_3008, _3007);
                        }
                        _3025 = _3024;
                        _3026 = true;
                        break;
                    } while(false);
                    _3051 = _3025;
                    _3052 = _3026;
                }
                vec3 _3055 = _2445 + (_2962 * _3051.y);
                float _3076;
                if (_2446)
                {
                    _3076 = 1.0 - clamp(length(spvNMax(_2447 - (_13._m0[_2396]._m0.xyz - vec3(_13._m0[_2396]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3076 = clamp((_13._m0[_2396]._m0.x - length(_2445)) * (1.0 / spvNMax(_13._m0[_2396]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3079 = float(_3052) * smoothstep(0.0, 1.0, _3076);
                vec4 _3131;
                SPIRV_CROSS_BRANCH
                if (_3079 > 9.9999997473787516355514526367188e-05)
                {
                    float _3088 = mix(clamp((_3051.y * (1.0 / length(_3055))) * _574, 0.0, _574), _574, _574);
                    vec3 _3090 = mix(_3055, _2962, vec3(_3088));
                    float _3091 = _3088 * 8.0;
                    int _126 = _2435;
                    int _130 = _2435 + 1;
                    vec4 _3099 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_126], _7)), _3090, _3091).xyz, textureLod(nonuniformEXT(samplerCube(_24[_130], _7)), _3090, _3091).x);
                    vec4 _3113;
                    SPIRV_CROSS_BRANCH
                    if (_2440 >= 0)
                    {
                        int _134 = _2440;
                        int _138 = _2440 + 1;
                        _3113 = mix(_3099, vec4(textureLod(nonuniformEXT(samplerCube(_24[_134], _7)), _3090, _3091).xyz, textureLod(nonuniformEXT(samplerCube(_24[_138], _7)), _3090, _3091).x), vec4(_13._m0[_2396]._m3));
                    }
                    else
                    {
                        _3113 = _3099;
                    }
                    vec4 _3114 = _3113 * _2443;
                    vec4 _3119 = textureLod(sampler2D(_18, _12), vec2(_2348, _3088), 0.0);
                    vec3 _3126 = (_3114.xyz * _13._m0[_2396]._m4).xyz * ((_2254 * _3119.x) + vec3(_3119.y));
                    vec4 _3127 = vec4(_3126.x, _3126.y, _3126.z, _3114.w);
                    _3127.w = _3114.w * _3079;
                    _3131 = _3127;
                }
                else
                {
                    _3131 = vec4(0.0);
                }
                vec4 _3134 = (_2961 * 0.300000011920928955078125) + (_3131 * 0.699999988079071044921875);
                _3139 = mix(_2384, _3134.xyz, vec3(_3134.w));
            }
            else
            {
                _3139 = _2384;
            }
            _2385 = _3139;
            _2388 = _2787;
        }
        float _3140 = _6._m0[0u] * 100.0;
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_2297, _574);
            _2384 *= rdx_mod;
            _2387 *= rdx_mod;
        }
        bool _3145 = _26._m19 > 0.0;
        vec3 _3206;
        SPIRV_CROSS_BRANCH
        if (_3145 && (_26._m35 == 0.0))
        {
            vec3 _3159 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _3160 = length(_3159);
            vec3 _3171;
            float _3172;
            if (_3160 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _3169 = _3159;
                _3169.z = _3159.z + _29._m0;
                _3171 = _3169;
                _3172 = length(_3169);
            }
            else
            {
                _3171 = _3159;
                _3172 = _3160;
            }
            float _3175 = dot(_3171 / vec3(_3172), _26._m36);
            float _3176 = _29._m0 / _3172;
            _3206 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_3175 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_3172 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_3175 < (-sqrt(fma(-_3176, _3176, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _3206 = _26._m2;
        }
        float _3219 = texelFetch(_41, ivec3(int(_612), int(_613), 0).xy, 0).x;
        float _3304;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _3243 = _27._m6 + _575;
            vec3 _3250 = vec3(0.0, _26._m18.z, 0.0) + (_3243 - vec3(0.0, _26._m25, 0.0));
            float _3254 = dot(_3250, _26._m24);
            vec2 _3264 = ((((_3250 + (_26._m24 * (sqrt(fma(_3254, _3254, fma(_26._m18.z, _26._m18.z, -dot(_3250, _3250)))) - _3254))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _3264.x = 1.0 - _3264.x;
            vec3 _3277 = vec3(0.0, _26._m23.z, 0.0) + (_3243 - vec3(0.0, _26._m27, 0.0));
            float _3281 = dot(_3277, _26._m26);
            vec2 _3291 = ((((_3277 + (_26._m26 * (sqrt(fma(_3281, _3281, fma(_26._m23.z, _26._m23.z, -dot(_3277, _3277)))) - _3281))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _3291.x = 1.0 - _3291.x;
            _3304 = _3219 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _3264, 0.0).x, textureLod(sampler2D(_33, _7), _3291, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _3304 = _3219;
        }
        float _3394;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _3332 = _27._m6 + _575;
            vec3 _3340 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _3332) - vec3(0.0, _26._m30, 0.0));
            float _3344 = dot(_3340, _26._m24);
            vec2 _3354 = ((((_3340 + (_26._m24 * (sqrt(fma(_3344, _3344, fma(_26._m28.z, _26._m28.z, -dot(_3340, _3340)))) - _3344))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _3354.x = 1.0 - _3354.x;
            vec3 _3368 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _3332) - vec3(0.0, _26._m33, 0.0));
            float _3372 = dot(_3368, _26._m26);
            vec2 _3382 = ((((_3368 + (_26._m26 * (sqrt(fma(_3372, _3372, fma(_26._m31.z, _26._m31.z, -dot(_3368, _3368)))) - _3372))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _3382.x = 1.0 - _3382.x;
            _3394 = _3304 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _3354, 0.0).x, textureLod(sampler2D(_23, _7), _3382, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _3394 = _3304;
        }
        vec3 _3396 = _3206 * (_3394 * _6._m0[0u]);
        float _3399 = dot(_566, _26._m0);
        float _3400 = clamp(_3399, -1.0, 1.0);
        float _3402 = clamp(dot(_566, _577), -1.0, 1.0);
        float _3408 = cos(0.5 * abs(asin(_3402) - asin(_3400)));
        vec3 _3410 = _26._m0 - (_566 * _3400);
        vec3 _3412 = _577 - (_566 * _3402);
        float _3418 = dot(_3410, _3412) * inversesqrt(fma(dot(_3410, _3410), dot(_3412, _3412), 9.9999997473787516355514526367188e-05));
        float _3421 = sqrt(clamp(fma(0.5, _3418, 0.5), 0.0, 1.0));
        float _3451 = _574 * _574;
        vec3 _3456 = vec3(_3451 * (1.41421353816986083984375 * _3421), _3451 * 0.5, _3451 * 2.0);
        vec3 _3468 = exp((pow(spvNMax(abs(vec3(_3400 + _3402) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _3421, sqrt(fma(-_3402, _3402, 1.0)), (-0.06994284689426422119140625) * _3402), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_3456 * _3456)) / (_3456 * 2.5066282749176025390625);
        float _3469 = dot(_577, _26._m0);
        float _3489 = 1.0 / fma(0.36000001430511474609375, _3408, 1.190000057220458984375 / _3408);
        float _3492 = _3421 * fma(_3489, fma(-0.800000011920928955078125, _3418, 0.60000002384185791015625), 1.0);
        float _3497 = -_3408;
        vec3 _3513 = spvNMax(abs(_570), vec3(9.9999997473787516355514526367188e-05));
        float _3531 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_3497, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
        vec3 _3548 = fma(_3396, ((((vec3(0.25 * _3421) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _3469, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _519, clamp(-_3469, 0.0, 1.0))) * _3468.x) + (((pow(_3513, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_3492 * _3489), 9.9999997473787516355514526367188e-05), 2.0))) / _3408)) * (exp(fma(-3.650000095367431640625, _3418, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_3497, sqrt(clamp(fma(-_3492, _3492, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _519) * _3468.y)) + ((pow(_3513, vec3(0.800000011920928955078125 / _3408)) * (exp(fma(17.0, _3418, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _3531), 9.9999997473787516355514526367188e-05), 2.0) * _3531))) * _3468.z), _1660);
        float _3568;
        float _3569;
        if (_34._m0.x > 0.0)
        {
            vec4 _3556 = textureLod(sampler2D(_40, _12), _456, 0.0);
            float _3557 = _3556.x;
            _3568 = clamp((pow(spvNMax(abs(dot(_568, _577) + _3557), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _574, -1.0))) - 1.0) + _3557, 0.0, 1.0);
            _3569 = _3557;
        }
        else
        {
            _3568 = 1.0;
            _3569 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _3569, 0.7);
            _3548 *= rdx_ao_factor;
            _1662 *= rdx_ao_factor;
        }
        vec3 _3577 = (fma(_3396, (sqrt(_570) * ((0.3183098733425140380859375 * mix(clamp((dot(_568, _26._m0) + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_3399), 0.3300000131130218505859375)) * _567)) * pow(spvNMax(abs(_570 / vec3(dot(_570, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(fma(-_3394, _3394, 1.0))), _1662) * mix(1.0, _3569, _34._m0.y)) + ((_2387 * _3140) * _3569);
        vec3 _3579 = (_3548 * mix(1.0, _3568, _34._m0.y)) + ((_2384 * _3140) * _3568);
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _3219, 0.5);
            _3577 *= _rdx_csm_shadow;
            _3579 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _39, _7, _456, _rdx_marchDir, _498, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _3577 *= _rdx_micro;
            _3579 *= _rdx_micro;
        }
        vec3 _4084;
        vec3 _4085;
        SPIRV_CROSS_BRANCH
        if (_3145)
        {
            vec3 _3587 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _3588 = vec3(0.0, 636100.0, 0.0) + (_575 + _27._m6);
            float _3589 = length(_3588);
            vec3 _3593 = (_3588 / vec3(_3589)) * spvNMax(_3589, 636100.0);
            vec3 _3594 = _3593 - _3587;
            float _3595 = length(_3594);
            vec3 _3597 = _3594 / vec3(_3595);
            float _3598 = length(_3587);
            vec3 _3612;
            vec3 _3613;
            float _3614;
            if (_3598 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _3607 = _3587;
                _3607.z = _3587.z + _29._m0;
                vec3 _3610 = _3593;
                _3610.z = _3593.z + _29._m0;
                _3612 = _3610;
                _3613 = _3607;
                _3614 = length(_3607);
            }
            else
            {
                _3612 = _3593;
                _3613 = _3587;
                _3614 = _3598;
            }
            float _3615 = dot(_3613, _3597);
            float _3626 = spvNMax((-_3615) - sqrt(fma(_29._m1, _29._m1, fma(_3615, _3615, -(_3614 * _3614)))), 0.0);
            bool _3629 = (_3626 > 0.0) && (_3626 < _3595);
            vec3 _3637;
            float _3638;
            float _3639;
            if (_3629)
            {
                _3637 = _3613 + (_3597 * _3626);
                _3638 = _3595 - _3626;
                _3639 = (_3615 + _3626) / _29._m1;
            }
            else
            {
                _3637 = _3613;
                _3638 = _3595;
                _3639 = _3615 / _3614;
            }
            float _3640 = _3629 ? _29._m1 : _3614;
            vec3 _4077;
            vec3 _4078;
            if (_3640 <= _29._m1)
            {
                float _3645 = dot(_3597, _26._m36);
                float _3647 = dot(_3637, _26._m36) / _3640;
                float _3648 = _29._m0 + 600.0;
                bool _3649 = _3640 < _3648;
                vec3 _3654;
                if (_3649)
                {
                    _3654 = _3612 * (_3648 / _3640);
                }
                else
                {
                    _3654 = _3612;
                }
                float _3655 = _3649 ? _3648 : _3640;
                float _3656 = length(_3654);
                float _3657 = dot(_3654, _3597);
                float _3659 = dot(_3654, _26._m36) / _3656;
                vec2 _3670 = vec2(_3639, _3639 + (_3638 / _3655));
                vec2 _3671 = _3670 * sqrt((0.5 / _29._m4) * _3655);
                vec2 _3674 = vec2(ivec2(sign(_3671)));
                vec2 _3675 = _3671 * _3671;
                float _3689 = -_3638;
                float _3691 = 2.0 * _3655;
                float _3693 = (_3638 / _3691) + _3639;
                float _3701 = _29._m0 - _3655;
                vec2 _3716 = _3670 * sqrt((0.5 / _29._m6) * _3655);
                vec2 _3719 = vec2(ivec2(sign(_3716)));
                vec2 _3720 = _3716 * _3716;
                vec3 _3750 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _3655) * exp(_3701 / _29._m4)) * (((_3674.y > _3674.x) ? exp(_3675.x) : 0.0) + dot((_3674 / ((abs(_3671) * 2.3192999362945556640625) + sqrt((_3675 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3689 / _29._m4) * _3693)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _3655) * exp(_3701 / _29._m6)) * (((_3719.y > _3719.x) ? exp(_3720.x) : 0.0) + dot((_3719 / ((abs(_3716) * 2.3192999362945556640625) + sqrt((_3720 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_3689 / _29._m6) * _3693)), vec2(1.0, -1.0))))));
                vec3 _3751 = spvNMin(_3750, vec3(1.0));
                float _3752 = _29._m0 / _3655;
                float _3755 = sqrt(fma(-_3752, _3752, 1.0));
                float _3757 = _3639 - (-_3755);
                vec4 _4040;
                if (abs(_3757) < 0.0040000001899898052215576171875)
                {
                    float _3865 = (-0.0040000001899898052215576171875) - _3755;
                    float _3867 = fma(_3655, _3655, _3638 * _3638);
                    float _3868 = _3691 * _3638;
                    float _3870 = sqrt(fma(_3868, _3865, _3867));
                    float _3871 = fma(_3655, _3865, _3638);
                    float _3874 = -(_29._m0 * _29._m0);
                    float _3876 = sqrt(fma(_29._m1, _29._m1, _3874));
                    float _3878 = sqrt(fma(_3655, _3655, _3874));
                    float _3879 = _3655 * _3865;
                    float _3881 = -(_3655 * _3655);
                    float _3883 = fma(_29._m0, _29._m0, fma(_3879, _3879, _3881));
                    vec4 _3889 = vec4(-1.0, _3876 * _3876, _3876, 0.50390625);
                    vec4 _3890 = mix(_3889, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3879 < 0.0) && (_3883 > 0.0)));
                    float _3892 = fma(_3878 / _3876, 0.96875, 0.015625);
                    float _3902 = fma(fma(_3879, _3890.x, sqrt(_3883 + _3890.y)) / (_3878 + _3890.z), 0.4921875, _3890.w);
                    float _3908 = _3645 + 1.0;
                    float _3910 = floor(_3908 * 3.5);
                    float _3912 = fma(_3908, 3.5, -_3910);
                    float _3913 = _3910 + fma(fma(atan(spvNMax(_3647, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3914 = _3913 * 0.125;
                    float _3918 = 1.0 - _3912;
                    float _3921 = (_3913 + 1.0) * 0.125;
                    float _3928 = sqrt(fma(_3870, _3870, _3874));
                    float _3932 = fma(_29._m0, _29._m0, fma(_3871, _3871, -(_3870 * _3870)));
                    vec4 _3937 = mix(_3889, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3871 < 0.0) && (_3932 > 0.0)));
                    float _3939 = fma(_3928 / _3876, 0.96875, 0.015625);
                    float _3949 = fma(fma(_3871, _3937.x, sqrt(_3932 + _3937.y)) / (_3928 + _3937.z), 0.4921875, _3937.w);
                    float _3955 = _3910 + fma(fma(atan(spvNMax(_3659, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3956 = _3955 * 0.125;
                    float _3962 = (_3955 + 1.0) * 0.125;
                    vec4 _3968 = _3751.xyzx;
                    float _3972 = 0.0040000001899898052215576171875 - _3755;
                    float _3974 = sqrt(fma(_3868, _3972, _3867));
                    float _3975 = fma(_3655, _3972, _3638);
                    float _3976 = _3655 * _3972;
                    float _3978 = fma(_29._m0, _29._m0, fma(_3976, _3976, _3881));
                    vec4 _3983 = mix(_3889, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3976 < 0.0) && (_3978 > 0.0)));
                    float _3993 = fma(fma(_3976, _3983.x, sqrt(_3978 + _3983.y)) / (_3878 + _3983.z), 0.4921875, _3983.w);
                    float _4004 = sqrt(fma(_3974, _3974, _3874));
                    float _4008 = fma(_29._m0, _29._m0, fma(_3975, _3975, -(_3974 * _3974)));
                    vec4 _4013 = mix(_3889, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3975 < 0.0) && (_4008 > 0.0)));
                    float _4015 = fma(_4004 / _3876, 0.96875, 0.015625);
                    float _4025 = fma(fma(_3975, _4013.x, sqrt(_4008 + _4013.y)) / (_4004 + _4013.z), 0.4921875, _4013.w);
                    _4040 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_3956, _3949, _3939), 0.0) * _3918) + (textureLod(sampler3D(_31, _7), vec3(_3962, _3949, _3939), 0.0) * _3912)), _3968, (textureLod(sampler3D(_31, _7), vec3(_3914, _3902, _3892), 0.0) * _3918) + (textureLod(sampler3D(_31, _7), vec3(_3921, _3902, _3892), 0.0) * _3912)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_3956, _4025, _4015), 0.0) * _3918) + (textureLod(sampler3D(_31, _7), vec3(_3962, _4025, _4015), 0.0) * _3912)), _3968, (textureLod(sampler3D(_31, _7), vec3(_3914, _3993, _3892), 0.0) * _3918) + (textureLod(sampler3D(_31, _7), vec3(_3921, _3993, _3892), 0.0) * _3912)), vec4(0.0)), vec4((_3757 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _3765 = -(_29._m0 * _29._m0);
                    float _3767 = sqrt(fma(_29._m1, _29._m1, _3765));
                    float _3769 = sqrt(fma(_3655, _3655, _3765));
                    float _3770 = _3655 * _3639;
                    float _3774 = fma(_29._m0, _29._m0, fma(_3770, _3770, -(_3655 * _3655)));
                    vec4 _3780 = vec4(-1.0, _3767 * _3767, _3767, 0.50390625);
                    vec4 _3781 = mix(_3780, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3770 < 0.0) && (_3774 > 0.0)));
                    float _3783 = fma(_3769 / _3767, 0.96875, 0.015625);
                    float _3793 = fma(fma(_3770, _3781.x, sqrt(_3774 + _3781.y)) / (_3769 + _3781.z), 0.4921875, _3781.w);
                    float _3799 = _3645 + 1.0;
                    float _3801 = floor(_3799 * 3.5);
                    float _3803 = fma(_3799, 3.5, -_3801);
                    float _3804 = _3801 + fma(fma(atan(spvNMax(_3647, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3809 = 1.0 - _3803;
                    float _3819 = sqrt(fma(_3656, _3656, _3765));
                    float _3823 = fma(_29._m0, _29._m0, fma(_3657, _3657, -(_3656 * _3656)));
                    vec4 _3828 = mix(_3780, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3657 < 0.0) && (_3823 > 0.0)));
                    float _3830 = fma(_3819 / _3767, 0.96875, 0.015625);
                    float _3840 = fma(fma(_3657, _3828.x, sqrt(_3823 + _3828.y)) / (_3819 + _3828.z), 0.4921875, _3828.w);
                    float _3846 = _3801 + fma(fma(atan(spvNMax(_3659, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _4040 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_3846 * 0.125, _3840, _3830), 0.0) * _3809) + (textureLod(sampler3D(_31, _7), vec3((_3846 + 1.0) * 0.125, _3840, _3830), 0.0) * _3803)), _3751.xyzx, (textureLod(sampler3D(_31, _7), vec3(_3804 * 0.125, _3793, _3783), 0.0) * _3809) + (textureLod(sampler3D(_31, _7), vec3((_3804 + 1.0) * 0.125, _3793, _3783), 0.0) * _3803)), vec4(0.0));
                }
                float _4055 = fma(_3645, _3645, 1.0);
                _4077 = _3751;
                _4078 = (_4040.xyz * (0.0596831031143665313720703125 * _4055)) + ((((_4040.xyz * (_4040.w * smoothstep(0.0, 0.0199999995529651641845703125, _3647))) / vec3(spvNMax(_4040.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _3645, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _4055) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _4077 = vec3(1.0);
                _4078 = vec3(0.0);
            }
            _4084 = _3579 * _4077;
            _4085 = fma(_3577, _4077, _4078 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _4084 = _3579;
            _4085 = _3577;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_39, _7, _456, _rdx_dir, _498, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _4085 = vec3(_rdx_vis);
            _4084 = vec3(0.0);
        }
        imageStore(_43, ivec2(_439), vec4(_4085, 1.0));
        imageStore(_44, ivec2(_439), vec4(_4084, 1.0));
        break;
    } while(false);
}

