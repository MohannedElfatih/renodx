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
const vec4 _312[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _339;
vec3 _344;
vec3 _345;

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

void main()
{
    do
    {
        uint _380 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _382 = _42._m0[_380];
        uvec2 _387 = (uvec2(_382 & 65535u, _382 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_387, _28._m3)) || any(greaterThan(_387, _28._m4)))
        {
            break;
        }
        vec2 _399 = vec2(_387);
        vec2 _404 = (_399 + vec2(0.5)) / vec2(_34._m1);
        vec2 _411 = ((_404 - _28._m1) / _28._m0) * 0.5;
        float _415 = _411.x;
        float _417 = _411.y;
        ivec2 _435 = ivec3(int(_387.x), int(_387.y), 0).xy;
        vec4 _439 = texelFetch(_36, _435, 0);
        vec4 _441 = texelFetch(_37, _435, 0);
        vec4 _443 = texelFetch(_38, _435, 0);
        vec4 _445 = texelFetch(_39, _435, 0);
        float _446 = _445.x;
        vec3 _464;
        do
        {
            vec3 _452 = fma(vec3(texelFetch(_35, _435, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _453 = dot(_452, _452);
            if (_453 > 54000001024.0)
            {
                _464 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _458 = 2.0 / _453;
                vec2 _460 = _452.xy * _458;
                vec3 _461 = vec3(_460.x, _460.y, _344.z);
                _461.z = 1.0 - _458;
                _464 = _461;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _467 = _441.y;
        float _468 = _441.z;
        uint _474 = (uint(roundEven(_441.w * 255.0)) & 112u) >> 4u;
        mat3 _483 = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        vec3 _484 = _464 * _483;
        vec3 _487 = vec3(_439.x, _439.y, _439.z) * (1.0 - _468);
        vec3 _492 = mix(vec3(0.1599999964237213134765625 * (_467 * _467)), _439.xyz, vec3(_468));
        float _493 = spvNMax(0.0900000035762786865234375, _441.x);
        vec3 _495 = _443.xyz * 255.0;
        float _497 = _495.y * 0.0625;
        vec2 _507 = clamp((vec2(fma(_495.x, 16.0, floor(_497)), fma(fract(_497), 4096.0, _495.z)) * 0.000488519784994423389434814453125) - vec2(1.0), vec2(-1.0), vec2(1.0));
        float _513 = (1.0 - abs(_507.x)) - abs(_507.y);
        vec3 _514;
        _514.z = _513;
        vec2 _523 = mix((vec2(1.0) - abs(_507.yx)) * mix(vec2(-1.0), vec2(1.0), greaterThanEqual(_507, vec2(0.0))), _507, bvec2(_513 >= 0.0));
        vec3 _526 = normalize(vec3(_523.x, _523.y, _514.z)) * _483;
        float _527 = _443.w;
        vec3 _528 = (((_26._m7[0].xyz * ((1.0 - _415) - _417)) + (_26._m7[1].xyz * _415)) + (_26._m7[2].xyz * _417)) * _446;
        vec3 _530 = normalize(-_528);
        uint _532 = gl_SubgroupInvocationID & 3u;
        float _537 = ((_532 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _538 = (subgroupQuadSwapHorizontal(_464) - _464) * _537;
        float _543 = ((_532 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _544 = (subgroupQuadSwapVertical(_464) - _464) * _543;
        vec3 _548 = mix(_538, vec3(0.0), bvec3(any(isnan(_538))));
        vec3 _552 = mix(_544, vec3(0.0), bvec3(any(isnan(_544))));
        float _559 = sqrt(clamp(fma(_493, _493, spvNMin(dot(_548, _548) + dot(_552, _552), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _568 = ivec2(uvec2(_399) / uvec2(_19._m25));
        float _594 = _399.x;
        float _595 = _399.y;
        float _600 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _594, 0.005837149918079376220703125 * _595)));
        float _607 = clamp(fma(_19._m34.y, length(_528), _19._m34.x), 0.0, 1.0);
        uint _608 = uint(int(fma(fma(float(int(clamp(fma(log2(_446 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_568.y)), _19._m23, float(_568.x))));
        uvec4 _611 = uvec4(_8._m0[_608]);
        uint _612 = _611.x;
        uint _613 = _611.y;
        uint _616 = ((_613 >> 0u) & 4095u) + _612;
        uint _619 = ((_613 >> 12u) & 4095u) + _616;
        uint _623 = ((_611.z >> 0u) & 1023u) + _619;
        float _624 = dot(_484, _530);
        float _625 = spvNMax(_624, 9.9999997473787516355514526367188e-06);
        float _627;
        bool _630;
        vec3 _632;
        vec3 _634;
        uint _636;
        _627 = _300;
        _630 = false;
        _632 = vec3(0.0);
        _634 = vec3(0.0);
        _636 = _612;
        float _628;
        bool _631;
        vec3 _633;
        vec3 _635;
        for (; _636 < _616; _627 = _628, _630 = _631, _632 = _633, _634 = _635, _636++)
        {
            uint _643 = uint(_9._m0[_636]);
            float _661 = abs(_10._m0[_643]._m5);
            if ((_10._m0[_643]._m6 & (1u << (_474 & 31u))) != 0u)
            {
                vec3 _676 = _10._m0[_643]._m0.xyz - _528;
                float _677 = dot(_676, _676);
                vec3 _680 = _676 * inversesqrt(spvNMax(_677, 1.0000000133514319600180897396058e-10));
                float _681 = _10._m0[_643]._m0.w * _10._m0[_643]._m0.w;
                float _1023;
                bool _1024;
                vec3 _1025;
                vec3 _1026;
                if (_677 < (1.0 / _681))
                {
                    vec3 _686 = _530 + _680;
                    vec3 _690 = _686 * inversesqrt(spvNMax(dot(_686, _686), 1.0000000133514319600180897396058e-10));
                    float _692 = clamp(dot(_680, _690), 0.0, 1.0);
                    float _694 = clamp(dot(_484, _690), 0.0, 1.0);
                    float _696 = clamp(dot(_484, _680), 0.0, 1.0);
                    float _697 = _677 * _681;
                    float _703 = pow(spvNMax(abs(clamp(fma(-_697, _697, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_643]._m4);
                    float _713;
                    if (_10._m0[_643]._m5 < 0.0)
                    {
                        _713 = _703 * fma(4.0, _681, _661);
                    }
                    else
                    {
                        _713 = _703 * ((1.0 / spvNMax(_677, 9.9999997473787516355514526367188e-05)) + _661);
                    }
                    float _715 = 0.079577468335628509521484375 * (_696 * _713);
                    float _850;
                    bool _851;
                    float _852;
                    if ((_10._m0[_643]._m7 & 1u) != 0u)
                    {
                        uint _740;
                        do
                        {
                            vec3 _720 = -_680;
                            float _721 = dot(_720, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                            float _722 = dot(_720, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                            float _723 = dot(_720, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                            float _727 = spvNMax(spvNMax(_721, _722), spvNMax(_723, dot(_720, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                            if (_727 == _721)
                            {
                                _740 = 0u;
                                break;
                            }
                            else
                            {
                                if (_727 == _722)
                                {
                                    _740 = 1u;
                                    break;
                                }
                                else
                                {
                                    if (_727 == _723)
                                    {
                                        _740 = 2u;
                                        break;
                                    }
                                    else
                                    {
                                        _740 = 3u;
                                        break;
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            }
                            break; // unreachable workaround
                        } while(false);
                        uint _742 = uint(int(_10._m0[_643]._m7 >> 2u)) + _740;
                        float _844;
                        bool _845;
                        float _846;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_696 <= 0.0) && true)
                            {
                                _844 = _627;
                                _845 = _630;
                                _846 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _775 = _20._m0[_742]._m0 * vec4(_528 + (_484 * ((3.5 * float(int(sign(_696)))) * (_20._m0[_742]._m4 * sqrt(_677)))), 1.0);
                                vec3 _779 = _775.xyz / vec3(_775.w);
                                vec2 _782 = (_779.xy * 0.5) + vec2(0.5);
                                _782.y = 1.0 - _782.y;
                                float _791 = (_20._m0[_742]._m5.y / _20._m0[_742]._m6) / (_779.z - _20._m0[_742]._m5.x);
                                float _796 = _630 ? _627 : 6.283185482025146484375;
                                float _797 = _600 * _796;
                                vec2 _798 = _20._m0[_742]._m1 + _19._m33;
                                vec2 _801 = (_20._m0[_742]._m1 + vec2(_20._m0[_742]._m2)) - _19._m33;
                                float _803;
                                _803 = 0.0;
                                for (int _806 = 0; _806 < 12; )
                                {
                                    float _811 = float(uint(_806));
                                    float _814 = sqrt(_811 + 0.5) * 0.288675129413604736328125;
                                    float _815 = fma(_811, 2.3999631404876708984375, _797);
                                    vec2 _823 = clamp(fma((vec3(cos(_815), sin(_815), _814).xy * _814) * 2.5, _19._m33, _782), _798, _801);
                                    vec2 _826 = fract(fma(vec2(1.0) / _19._m33, _823, vec2(0.5)));
                                    vec4 _832 = vec4(lessThan(vec4(_791), textureGather(sampler2D(_21, _12), _823)));
                                    float _835 = _826.x;
                                    _803 += clamp(mix(mix(_832.w, _832.z, _835), mix(_832.x, _832.y, _835), _826.y), 0.0, 1.0);
                                    _806++;
                                    continue;
                                }
                                _844 = _796;
                                _845 = _630 ? _630 : true;
                                _846 = _803 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _850 = _844;
                        _851 = _845;
                        _852 = _715 * mix(1.0, _846, spvNMin(_607, _10._m0[_643]._m8));
                    }
                    else
                    {
                        _850 = _627;
                        _851 = _630;
                        _852 = _715;
                    }
                    // --- RenoDX: Per-Light Micro Shadow ---
                    if (pc.rendering_micro_shadows > 0.5 && _852 > 0.0) {
                        vec3 _rdx_pl_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * normalize(_676);
                        vec2 _rdx_pl_md = normalize(vec2(_rdx_pl_lv.x, -_rdx_pl_lv.y));
                        float _rdx_pl_ms = rdx_micro_shadow_march(
                            _39, _7, _404, _rdx_pl_md, _446, vec2(_34._m1));
                        _852 *= _rdx_pl_ms;
                    }
                    vec3 _1021;
                    vec3 _1022;
                    SPIRV_CROSS_BRANCH
                    if (_10._m0[_643]._m3 < 0.0)
                    {
                        float _938 = dot(_690, _526);
                        vec3 _1019;
                        vec3 _1020;
                        if (_696 > 0.0)
                        {
                            vec3 _943 = _10._m0[_643]._m1.xyz * (_852 * _6._m0[0u]);
                            vec3 _950 = vec3(fma((2.0 * _692) * _692, _559, mix(0.0, 0.5, _559))) - vec3(1.0);
                            float _971 = (_559 + 1.0) * 0.5;
                            float _972 = _559 * _559;
                            float _980 = _971 * _971;
                            float _994 = sqrt(fma(-_527, 0.89999997615814208984375, 1.0));
                            float _997 = spvNMax(0.001000000047497451305389404296875, clamp(_972 / _994, 0.0, 1.0));
                            float _999 = spvNMax(0.001000000047497451305389404296875, _972 * _994);
                            float _1010 = fma(_694, _694, ((_938 * _938) / (_997 * _997)) + (fma(-_694, _694, fma(-_938, _938, 1.0)) / (_999 * _999)));
                            _1019 = fma(_943, (_492 + ((vec3(1.0) - _492) * pow(spvNMax(abs(1.0 - _692), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_696, sqrt(fma(fma(-_625, _980, _625), _625, _980)), _625 * sqrt(fma(fma(-_696, _980, _696), _696, _980)))) * (1.0 / ((((_997 * _999) * 3.1415927410125732421875) * _1010) * _1010))), _632);
                            _1020 = fma(_943, _487 * (0.3183098733425140380859375 * (((vec3(1.0) + (_950 * pow(spvNMax(abs(1.0 - _696), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_950 * pow(spvNMax(abs(1.0 - _625), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _559))), _634);
                        }
                        else
                        {
                            _1019 = _632;
                            _1020 = _634;
                        }
                        _1021 = _1019;
                        _1022 = _1020;
                    }
                    else
                    {
                        float _856 = dot(_690, _526);
                        vec3 _936;
                        vec3 _937;
                        if (_696 > 0.0)
                        {
                            vec3 _860 = _10._m0[_643]._m1.xyz * _852;
                            vec3 _867 = vec3(fma((2.0 * _692) * _692, _559, mix(0.0, 0.5, _559))) - vec3(1.0);
                            float _888 = (_559 + 1.0) * 0.5;
                            float _889 = _559 * _559;
                            float _897 = _888 * _888;
                            float _911 = sqrt(fma(-_527, 0.89999997615814208984375, 1.0));
                            float _914 = spvNMax(0.001000000047497451305389404296875, clamp(_889 / _911, 0.0, 1.0));
                            float _916 = spvNMax(0.001000000047497451305389404296875, _889 * _911);
                            float _927 = fma(_694, _694, ((_856 * _856) / (_914 * _914)) + (fma(-_694, _694, fma(-_856, _856, 1.0)) / (_916 * _916)));
                            _936 = fma(_860, (_492 + ((vec3(1.0) - _492) * pow(spvNMax(abs(1.0 - _692), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_696, sqrt(fma(fma(-_625, _897, _625), _625, _897)), _625 * sqrt(fma(fma(-_696, _897, _696), _696, _897)))) * (1.0 / ((((_914 * _916) * 3.1415927410125732421875) * _927) * _927))), _632);
                            _937 = fma(_860, _487 * (0.3183098733425140380859375 * (((vec3(1.0) + (_867 * pow(spvNMax(abs(1.0 - _696), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_867 * pow(spvNMax(abs(1.0 - _625), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _559))), _634);
                        }
                        else
                        {
                            _936 = _632;
                            _937 = _634;
                        }
                        _1021 = _936;
                        _1022 = _937;
                    }
                    _1023 = _850;
                    _1024 = _851;
                    _1025 = _1021;
                    _1026 = _1022;
                }
                else
                {
                    _1023 = _627;
                    _1024 = _630;
                    _1025 = _632;
                    _1026 = _634;
                }
                _628 = _1023;
                _631 = _1024;
                _633 = _1025;
                _635 = _1026;
            }
            else
            {
                _628 = _627;
                _631 = _630;
                _633 = _632;
                _635 = _634;
            }
        }
        float _1028;
        bool _1031;
        vec3 _1033;
        vec3 _1035;
        uint _1037;
        _1028 = _627;
        _1031 = _630;
        _1033 = _632;
        _1035 = _634;
        _1037 = _636;
        float _1029;
        bool _1032;
        vec3 _1034;
        vec3 _1036;
        for (; _1037 < _619; _1028 = _1029, _1031 = _1032, _1033 = _1034, _1035 = _1036, _1037++)
        {
            uint _1044 = uint(_9._m0[_1037]);
            float _1057 = abs(_10._m0[_1044]._m5);
            if ((_10._m0[_1044]._m6 & (1u << (_474 & 31u))) != 0u)
            {
                vec3 _1075 = _10._m0[_1044]._m0.xyz - _528;
                float _1076 = dot(_1075, _1075);
                vec3 _1079 = _1075 * inversesqrt(spvNMax(_1076, 1.0000000133514319600180897396058e-10));
                float _1080 = _10._m0[_1044]._m0.w * _10._m0[_1044]._m0.w;
                float _1412;
                bool _1413;
                vec3 _1414;
                vec3 _1415;
                if (_1076 < (1.0 / _1080))
                {
                    vec3 _1085 = _530 + _1079;
                    vec3 _1089 = _1085 * inversesqrt(spvNMax(dot(_1085, _1085), 1.0000000133514319600180897396058e-10));
                    float _1091 = clamp(dot(_1079, _1089), 0.0, 1.0);
                    float _1093 = clamp(dot(_484, _1089), 0.0, 1.0);
                    float _1095 = clamp(dot(_484, _1079), 0.0, 1.0);
                    float _1098 = dot(-_1079, normalize(_10._m0[_1044]._m2.xyz));
                    float _1127;
                    if (_1098 > _10._m0[_1044]._m1.w)
                    {
                        float _1102 = _1076 * _1080;
                        float _1108 = pow(spvNMax(abs(clamp(fma(-_1102, _1102, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1044]._m4);
                        float _1118;
                        if (_10._m0[_1044]._m5 < 0.0)
                        {
                            _1118 = _1108 * fma(4.0, _1080, _1057);
                        }
                        else
                        {
                            _1118 = _1108 * ((1.0 / spvNMax(_1076, 9.9999997473787516355514526367188e-05)) + _1057);
                        }
                        float _1123 = clamp((_1098 - _10._m0[_1044]._m1.w) / spvNMax(_10._m0[_1044]._m2.w - _10._m0[_1044]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                        _1127 = _1095 * (_1118 * (_1123 * _1123));
                    }
                    else
                    {
                        _1127 = 0.0;
                    }
                    float _1128 = 0.3183098733425140380859375 * _1127;
                    float _1239;
                    bool _1240;
                    float _1241;
                    if ((_10._m0[_1044]._m7 & 1u) != 0u)
                    {
                        uint _1131 = uint(int(_10._m0[_1044]._m7 >> 2u));
                        float _1233;
                        bool _1234;
                        float _1235;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1095 <= 0.0) && true)
                            {
                                _1233 = _1028;
                                _1234 = _1031;
                                _1235 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1164 = _20._m0[_1131]._m0 * vec4(_528 + (_484 * ((3.5 * float(int(sign(_1095)))) * (_20._m0[_1131]._m4 * sqrt(_1076)))), 1.0);
                                vec3 _1168 = _1164.xyz / vec3(_1164.w);
                                vec2 _1171 = (_1168.xy * 0.5) + vec2(0.5);
                                _1171.y = 1.0 - _1171.y;
                                float _1180 = (_20._m0[_1131]._m5.y / _20._m0[_1131]._m6) / (_1168.z - _20._m0[_1131]._m5.x);
                                float _1185 = _1031 ? _1028 : 6.283185482025146484375;
                                float _1186 = _600 * _1185;
                                vec2 _1187 = _20._m0[_1131]._m1 + _19._m33;
                                vec2 _1190 = (_20._m0[_1131]._m1 + vec2(_20._m0[_1131]._m2)) - _19._m33;
                                float _1192;
                                _1192 = 0.0;
                                for (int _1195 = 0; _1195 < 12; )
                                {
                                    float _1200 = float(uint(_1195));
                                    float _1203 = sqrt(_1200 + 0.5) * 0.288675129413604736328125;
                                    float _1204 = fma(_1200, 2.3999631404876708984375, _1186);
                                    vec2 _1212 = clamp(fma((vec3(cos(_1204), sin(_1204), _1203).xy * _1203) * 2.5, _19._m33, _1171), _1187, _1190);
                                    vec2 _1215 = fract(fma(vec2(1.0) / _19._m33, _1212, vec2(0.5)));
                                    vec4 _1221 = vec4(lessThan(vec4(_1180), textureGather(sampler2D(_21, _12), _1212)));
                                    float _1224 = _1215.x;
                                    _1192 += clamp(mix(mix(_1221.w, _1221.z, _1224), mix(_1221.x, _1221.y, _1224), _1215.y), 0.0, 1.0);
                                    _1195++;
                                    continue;
                                }
                                _1233 = _1185;
                                _1234 = _1031 ? _1031 : true;
                                _1235 = _1192 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _1239 = _1233;
                        _1240 = _1234;
                        _1241 = _1128 * mix(1.0, _1235, spvNMin(_607, _10._m0[_1044]._m8));
                    }
                    else
                    {
                        _1239 = _1028;
                        _1240 = _1031;
                        _1241 = _1128;
                    }
                    vec3 _1410;
                    vec3 _1411;
                    SPIRV_CROSS_BRANCH
                    if (_10._m0[_1044]._m3 < 0.0)
                    {
                        float _1327 = dot(_1089, _526);
                        vec3 _1408;
                        vec3 _1409;
                        if (_1095 > 0.0)
                        {
                            vec3 _1332 = _10._m0[_1044]._m1.xyz * (_1241 * _6._m0[0u]);
                            vec3 _1339 = vec3(fma((2.0 * _1091) * _1091, _559, mix(0.0, 0.5, _559))) - vec3(1.0);
                            float _1360 = (_559 + 1.0) * 0.5;
                            float _1361 = _559 * _559;
                            float _1369 = _1360 * _1360;
                            float _1383 = sqrt(fma(-_527, 0.89999997615814208984375, 1.0));
                            float _1386 = spvNMax(0.001000000047497451305389404296875, clamp(_1361 / _1383, 0.0, 1.0));
                            float _1388 = spvNMax(0.001000000047497451305389404296875, _1361 * _1383);
                            float _1399 = fma(_1093, _1093, ((_1327 * _1327) / (_1386 * _1386)) + (fma(-_1093, _1093, fma(-_1327, _1327, 1.0)) / (_1388 * _1388)));
                            _1408 = fma(_1332, (_492 + ((vec3(1.0) - _492) * pow(spvNMax(abs(1.0 - _1091), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1095, sqrt(fma(fma(-_625, _1369, _625), _625, _1369)), _625 * sqrt(fma(fma(-_1095, _1369, _1095), _1095, _1369)))) * (1.0 / ((((_1386 * _1388) * 3.1415927410125732421875) * _1399) * _1399))), _1033);
                            _1409 = fma(_1332, _487 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1339 * pow(spvNMax(abs(1.0 - _1095), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1339 * pow(spvNMax(abs(1.0 - _625), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _559))), _1035);
                        }
                        else
                        {
                            _1408 = _1033;
                            _1409 = _1035;
                        }
                        _1410 = _1408;
                        _1411 = _1409;
                    }
                    else
                    {
                        float _1245 = dot(_1089, _526);
                        vec3 _1325;
                        vec3 _1326;
                        if (_1095 > 0.0)
                        {
                            vec3 _1249 = _10._m0[_1044]._m1.xyz * _1241;
                            vec3 _1256 = vec3(fma((2.0 * _1091) * _1091, _559, mix(0.0, 0.5, _559))) - vec3(1.0);
                            float _1277 = (_559 + 1.0) * 0.5;
                            float _1278 = _559 * _559;
                            float _1286 = _1277 * _1277;
                            float _1300 = sqrt(fma(-_527, 0.89999997615814208984375, 1.0));
                            float _1303 = spvNMax(0.001000000047497451305389404296875, clamp(_1278 / _1300, 0.0, 1.0));
                            float _1305 = spvNMax(0.001000000047497451305389404296875, _1278 * _1300);
                            float _1316 = fma(_1093, _1093, ((_1245 * _1245) / (_1303 * _1303)) + (fma(-_1093, _1093, fma(-_1245, _1245, 1.0)) / (_1305 * _1305)));
                            _1325 = fma(_1249, (_492 + ((vec3(1.0) - _492) * pow(spvNMax(abs(1.0 - _1091), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1095, sqrt(fma(fma(-_625, _1286, _625), _625, _1286)), _625 * sqrt(fma(fma(-_1095, _1286, _1095), _1095, _1286)))) * (1.0 / ((((_1303 * _1305) * 3.1415927410125732421875) * _1316) * _1316))), _1033);
                            _1326 = fma(_1249, _487 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1256 * pow(spvNMax(abs(1.0 - _1095), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1256 * pow(spvNMax(abs(1.0 - _625), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _559))), _1035);
                        }
                        else
                        {
                            _1325 = _1033;
                            _1326 = _1035;
                        }
                        _1410 = _1325;
                        _1411 = _1326;
                    }
                    _1412 = _1239;
                    _1413 = _1240;
                    _1414 = _1410;
                    _1415 = _1411;
                }
                else
                {
                    _1412 = _1028;
                    _1413 = _1031;
                    _1414 = _1033;
                    _1415 = _1035;
                }
                _1029 = _1412;
                _1032 = _1413;
                _1034 = _1414;
                _1036 = _1415;
            }
            else
            {
                _1029 = _1028;
                _1032 = _1031;
                _1034 = _1033;
                _1036 = _1035;
            }
        }
        vec3 _1422;
        vec3 _1424;
        _1422 = _1033;
        _1424 = _1035;
        float _1418;
        bool _1421;
        vec3 _1423;
        vec3 _1425;
        float _1417 = _1028;
        bool _1420 = _1031;
        uint _1426 = _1037;
        for (; _1426 < _623; _1417 = _1418, _1420 = _1421, _1422 = _1423, _1424 = _1425, _1426++)
        {
            uint _1433 = uint(_9._m0[_1426]);
            int _1462 = int(_11._m0[_1433]._m1 >> 1u) - 1;
            if (((_11._m0[_1433]._m4 & 16777215u) & (1u << (_474 & 31u))) != 0u)
            {
                vec3 _1473 = _11._m0[_1433]._m6 * vec4(_528, 1.0);
                float _1889;
                bool _1890;
                vec3 _1891;
                vec3 _1892;
                if (all(lessThan(abs(_1473 - vec3(0.5)), vec3(0.5))))
                {
                    vec3 _1480 = _530 + _11._m0[_1433]._m9;
                    vec3 _1484 = _1480 * inversesqrt(spvNMax(dot(_1480, _1480), 1.0000000133514319600180897396058e-10));
                    float _1486 = clamp(dot(_11._m0[_1433]._m9, _1484), 0.0, 1.0);
                    float _1488 = clamp(dot(_484, _1484), 0.0, 1.0);
                    float _1490 = clamp(dot(_484, _11._m0[_1433]._m9), 0.0, 1.0);
                    int _1491 = int(_11._m0[_1433]._m4 >> 24u);
                    float _1492 = _1473.z;
                    vec3 _1531;
                    if (_1492 < _11._m0[_1433]._m2.x)
                    {
                        float _1519 = _1492 * _11._m0[_1433]._m2.z;
                        float _1522 = _1519 * _1519;
                        vec3 _1530;
                        _1530.z = dot(_312[_1491], vec4(_1519, _1522, smoothstep(0.0, 1.0, _1519), (_1522 * _1519) * fma(_1519, fma(_1519, 6.0, -15.0), 10.0)));
                        _1531 = _1530;
                    }
                    else
                    {
                        vec3 _1517;
                        if (_1492 > _11._m0[_1433]._m2.y)
                        {
                            float _1505 = (1.0 - _1492) * _11._m0[_1433]._m2.w;
                            float _1508 = _1505 * _1505;
                            vec3 _1516;
                            _1516.z = dot(_312[_1491], vec4(_1505, _1508, smoothstep(0.0, 1.0, _1505), (_1508 * _1505) * fma(_1505, fma(_1505, 6.0, -15.0), 10.0)));
                            _1517 = _1516;
                        }
                        else
                        {
                            _1517 = vec3(0.0, 0.0, 1.0);
                        }
                        _1531 = _1517;
                    }
                    vec2 _1532 = _1473.xy;
                    vec2 _1536 = (vec2(0.5) - abs(_1532 - vec2(0.5))) * _11._m0[_1433]._m3;
                    float _1537 = _1536.x;
                    vec3 _1554;
                    if (_1537 < 1.0)
                    {
                        float _1545 = _1537 * _1537;
                        vec3 _1553 = _1531;
                        _1553.x = dot(_312[_1491], vec4(_1537, _1545, smoothstep(0.0, 1.0, _1537), (_1545 * _1537) * fma(_1537, fma(_1537, 6.0, -15.0), 10.0)));
                        _1554 = _1553;
                    }
                    else
                    {
                        vec3 _1542 = _1531;
                        _1542.x = 1.0;
                        _1554 = _1542;
                    }
                    float _1555 = _1536.y;
                    vec3 _1572;
                    if (_1555 < 1.0)
                    {
                        float _1563 = _1555 * _1555;
                        vec3 _1571 = _1554;
                        _1571.y = dot(_312[_1491], vec4(_1555, _1563, smoothstep(0.0, 1.0, _1555), (_1563 * _1555) * fma(_1555, fma(_1555, 6.0, -15.0), 10.0)));
                        _1572 = _1571;
                    }
                    else
                    {
                        vec3 _1560 = _1554;
                        _1560.y = 1.0;
                        _1572 = _1560;
                    }
                    float _1578 = _1490 * ((_1572.x * _1572.y) * _1572.z);
                    float _1683;
                    bool _1684;
                    float _1685;
                    if ((_11._m0[_1433]._m8 & 1u) != 0u)
                    {
                        uint _1581 = uint(int(_11._m0[_1433]._m8 >> 2u));
                        float _1677;
                        bool _1678;
                        float _1679;
                        do
                        {
                            SPIRV_CROSS_BRANCH
                            if ((_1490 <= 0.0) && true)
                            {
                                _1677 = _1417;
                                _1678 = _1420;
                                _1679 = 0.0;
                                break;
                            }
                            else
                            {
                                vec4 _1612 = _20._m0[_1581]._m0 * vec4(_528 + (_484 * ((3.5 * float(int(sign(_1490)))) * _20._m0[_1581]._m4)), 1.0);
                                vec2 _1615 = (_1612.xy * 0.5) + vec2(0.5);
                                _1615.y = 1.0 - _1615.y;
                                float _1624 = ((_1612.z - _20._m0[_1581]._m5.y) / _20._m0[_1581]._m5.x) / _20._m0[_1581]._m6;
                                float _1629 = _1420 ? _1417 : 6.283185482025146484375;
                                float _1630 = _600 * _1629;
                                vec2 _1631 = _20._m0[_1581]._m1 + _19._m33;
                                vec2 _1634 = (_20._m0[_1581]._m1 + vec2(_20._m0[_1581]._m2)) - _19._m33;
                                float _1636;
                                _1636 = 0.0;
                                for (int _1639 = 0; _1639 < 12; )
                                {
                                    float _1644 = float(uint(_1639));
                                    float _1647 = sqrt(_1644 + 0.5) * 0.288675129413604736328125;
                                    float _1648 = fma(_1644, 2.3999631404876708984375, _1630);
                                    vec2 _1656 = clamp(fma((vec3(cos(_1648), sin(_1648), _1647).xy * _1647) * 2.5, _19._m33, _1615), _1631, _1634);
                                    vec2 _1659 = fract(fma(vec2(1.0) / _19._m33, _1656, vec2(0.5)));
                                    vec4 _1665 = vec4(lessThan(vec4(_1624), textureGather(sampler2D(_21, _12), _1656)));
                                    float _1668 = _1659.x;
                                    _1636 += clamp(mix(mix(_1665.w, _1665.z, _1668), mix(_1665.x, _1665.y, _1668), _1659.y), 0.0, 1.0);
                                    _1639++;
                                    continue;
                                }
                                _1677 = _1629;
                                _1678 = _1420 ? _1420 : true;
                                _1679 = _1636 * 0.083333335816860198974609375;
                                break;
                            }
                            break; // unreachable workaround
                        } while(false);
                        _1683 = _1677;
                        _1684 = _1678;
                        _1685 = _1578 * mix(1.0, _1679, spvNMin(_607, _11._m0[_1433]._m5));
                    }
                    else
                    {
                        _1683 = _1417;
                        _1684 = _1420;
                        _1685 = _1578;
                    }
                    vec3 _1718;
                    if (_1462 >= 0)
                    {
                        vec2 _1691 = (subgroupQuadSwapHorizontal(_1532) - _1532) * _537;
                        vec2 _1694 = (subgroupQuadSwapVertical(_1532) - _1532) * _543;
                        vec2 _1698 = mix(_1691, vec2(0.0), bvec2(any(isnan(_1691))));
                        vec2 _1702 = mix(_1694, vec2(0.0), bvec2(any(isnan(_1694))));
                        bvec2 _1711 = bvec2(any(greaterThan(abs(vec4(_1698, _1702)), vec4(0.015625))));
                        int _74 = _1462;
                        _1718 = _11._m0[_1433]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_74], _7)), _1532, mix(_1698, vec2(0.0), _1711), mix(_1702, vec2(0.0), _1711)).xyz;
                    }
                    else
                    {
                        _1718 = _11._m0[_1433]._m0;
                    }
                    vec3 _1887;
                    vec3 _1888;
                    SPIRV_CROSS_BRANCH
                    if ((_11._m0[_1433]._m1 & 1u) != 0u)
                    {
                        float _1804 = dot(_1484, _526);
                        vec3 _1885;
                        vec3 _1886;
                        if (_1490 > 0.0)
                        {
                            vec3 _1809 = _1718 * (_1685 * _6._m0[0u]);
                            vec3 _1816 = vec3(fma((2.0 * _1486) * _1486, _559, mix(0.0, 0.5, _559))) - vec3(1.0);
                            float _1837 = (_559 + 1.0) * 0.5;
                            float _1838 = _559 * _559;
                            float _1846 = _1837 * _1837;
                            float _1860 = sqrt(fma(-_527, 0.89999997615814208984375, 1.0));
                            float _1863 = spvNMax(0.001000000047497451305389404296875, clamp(_1838 / _1860, 0.0, 1.0));
                            float _1865 = spvNMax(0.001000000047497451305389404296875, _1838 * _1860);
                            float _1876 = fma(_1488, _1488, ((_1804 * _1804) / (_1863 * _1863)) + (fma(-_1488, _1488, fma(-_1804, _1804, 1.0)) / (_1865 * _1865)));
                            _1885 = fma(_1809, (_492 + ((vec3(1.0) - _492) * pow(spvNMax(abs(1.0 - _1486), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1490, sqrt(fma(fma(-_625, _1846, _625), _625, _1846)), _625 * sqrt(fma(fma(-_1490, _1846, _1490), _1490, _1846)))) * (1.0 / ((((_1863 * _1865) * 3.1415927410125732421875) * _1876) * _1876))), _1422);
                            _1886 = fma(_1809, _487 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1816 * pow(spvNMax(abs(1.0 - _1490), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1816 * pow(spvNMax(abs(1.0 - _625), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _559))), _1424);
                        }
                        else
                        {
                            _1885 = _1422;
                            _1886 = _1424;
                        }
                        _1887 = _1885;
                        _1888 = _1886;
                    }
                    else
                    {
                        float _1722 = dot(_1484, _526);
                        vec3 _1802;
                        vec3 _1803;
                        if (_1490 > 0.0)
                        {
                            vec3 _1726 = _1718 * _1685;
                            vec3 _1733 = vec3(fma((2.0 * _1486) * _1486, _559, mix(0.0, 0.5, _559))) - vec3(1.0);
                            float _1754 = (_559 + 1.0) * 0.5;
                            float _1755 = _559 * _559;
                            float _1763 = _1754 * _1754;
                            float _1777 = sqrt(fma(-_527, 0.89999997615814208984375, 1.0));
                            float _1780 = spvNMax(0.001000000047497451305389404296875, clamp(_1755 / _1777, 0.0, 1.0));
                            float _1782 = spvNMax(0.001000000047497451305389404296875, _1755 * _1777);
                            float _1793 = fma(_1488, _1488, ((_1722 * _1722) / (_1780 * _1780)) + (fma(-_1488, _1488, fma(-_1722, _1722, 1.0)) / (_1782 * _1782)));
                            _1802 = fma(_1726, (_492 + ((vec3(1.0) - _492) * pow(spvNMax(abs(1.0 - _1486), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1490, sqrt(fma(fma(-_625, _1763, _625), _625, _1763)), _625 * sqrt(fma(fma(-_1490, _1763, _1490), _1490, _1763)))) * (1.0 / ((((_1780 * _1782) * 3.1415927410125732421875) * _1793) * _1793))), _1422);
                            _1803 = fma(_1726, _487 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1733 * pow(spvNMax(abs(1.0 - _1490), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1733 * pow(spvNMax(abs(1.0 - _625), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _559))), _1424);
                        }
                        else
                        {
                            _1802 = _1422;
                            _1803 = _1424;
                        }
                        _1887 = _1802;
                        _1888 = _1803;
                    }
                    _1889 = _1683;
                    _1890 = _1684;
                    _1891 = _1887;
                    _1892 = _1888;
                }
                else
                {
                    _1889 = _1417;
                    _1890 = _1420;
                    _1891 = _1422;
                    _1892 = _1424;
                }
                _1418 = _1889;
                _1421 = _1890;
                _1423 = _1891;
                _1425 = _1892;
            }
            else
            {
                _1418 = _1417;
                _1421 = _1420;
                _1423 = _1422;
                _1425 = _1424;
            }
        }
        vec3 _1894 = reflect(-_530, _484);
        vec3 _1896 = vec3(_492.x, _492.y, _492.z);
        vec3 _1906 = textureLod(samplerCube(_14, _7), _484, 0.0).xyz * _19._m27;
        vec3 _1913 = textureLod(samplerCube(_15, _7), _1894, fma(_559, 8.0, _19._m30 - 8.0)).xyz * _19._m27;
        vec3 _1938;
        vec3 _1939;
        SPIRV_CROSS_BRANCH
        if (_19._m29 > 0.0)
        {
            vec3 _1928 = vec3(_19._m29);
            _1938 = mix(_1913, textureLod(samplerCube(_17, _7), _1894, fma(_559, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _1928);
            _1939 = mix(_1906, textureLod(samplerCube(_16, _7), _484, 0.0).xyz * _19._m28, _1928);
        }
        else
        {
            _1938 = _1913;
            _1939 = _1906;
        }
        float _1940 = spvNMax(dot(_530, _484), 0.001953125);
        vec4 _1945 = textureLod(sampler2D(_18, _12), vec2(_1940, _559), 0.0);
        uvec4 _1956 = uvec4(_8._m0[_608]);
        uint _1958 = _1956.y;
        uint _1968 = ((_1956.z >> 0u) & 1023u) + (((_1958 >> 12u) & 4095u) + (((_1958 >> 0u) & 4095u) + _1956.x));
        uint _1970 = (_1958 >> 24u) + _1968;
        vec3 _1972;
        vec3 _1975;
        _1972 = _1938 * ((_1896 * _1945.x) + vec3(_1945.y));
        _1975 = _1939 * (_487 * _1945.z);
        vec3 _1973;
        vec3 _1976;
        for (uint _1977 = _1968; _1977 < _1970; _1972 = _1973, _1975 = _1976, _1977++)
        {
            uint _1984 = uint(_9._m0[_1977]);
            int _2003 = int((_13._m0[_1984]._m5 >> 1u) & 3u);
            mat3 _2007 = mat3(_13._m0[_1984]._m1[0], _13._m0[_1984]._m1[1], _13._m0[_1984]._m1[2]);
            int _2013 = (int((_13._m0[_1984]._m5 >> 3u) & 16383u) - 1) * 2;
            int _2018 = (int((_13._m0[_1984]._m5 >> 17u) & 16383u) - 1) * 2;
            int _2023 = (int((_13._m0[_1984]._m6 >> 0u) & 65535u) - 1) * 2;
            int _2028 = (int((_13._m0[_1984]._m6 >> 16u) & 65535u) - 1) * 2;
            float _2031 = (_13._m0[_1984]._m3 < 0.0) ? (-_13._m0[_1984]._m3) : 1.0;
            vec3 _2033 = _2007 * (_528 - _13._m0[_1984]._m1[3]);
            bool _2034 = int(_13._m0[_1984]._m5 & 1u) == 1;
            vec3 _2035 = abs(_2033);
            float _2038 = dot(_2033, _2033);
            if (_2034 ? any(greaterThanEqual(_2035, _13._m0[_1984]._m0.xyz)) : (_2038 >= _13._m0[_1984]._m0.y))
            {
                _1973 = _1972;
                _1976 = _1975;
                continue;
            }
            vec3 _2212;
            SPIRV_CROSS_FLATTEN
            if ((_2003 & 1) != 0)
            {
                vec3 _2048 = _2007 * _484;
                vec2 _2137;
                bool _2138;
                if (_2034)
                {
                    vec2 _2132;
                    bool _2136;
                    do
                    {
                        vec3 _2116 = (_13._m0[_1984]._m0.xyz - _2033) / _2048;
                        vec3 _2119 = ((-_13._m0[_1984]._m0.xyz) - _2033) / _2048;
                        vec3 _2120 = spvNMin(_2116, _2119);
                        vec3 _2121 = spvNMax(_2116, _2119);
                        float _2126 = spvNMax(_2120.x, spvNMax(_2120.y, _2120.z));
                        float _2131 = spvNMin(_2121.x, spvNMin(_2121.y, _2121.z));
                        _2132 = vec2(_2126, _2131);
                        if (_2126 > _2131)
                        {
                            _2136 = false;
                            break;
                        }
                        _2136 = true;
                        break;
                    } while(false);
                    _2137 = _2132;
                    _2138 = _2136;
                }
                else
                {
                    vec2 _2111;
                    bool _2112;
                    do
                    {
                        float _2054 = dot(_2048, _2048);
                        float _2055 = dot(_2048, _2033);
                        float _2056 = 2.0 * _2055;
                        float _2057 = _2038 - _13._m0[_1984]._m0.y;
                        float _2093;
                        float _2094;
                        bool _2095;
                        do
                        {
                            float _2063 = fma(_2056, _2056, -((4.0 * _2054) * _2057));
                            float _2091;
                            float _2092;
                            if (_2063 < 0.0)
                            {
                                _2093 = 0.0;
                                _2094 = 0.0;
                                _2095 = false;
                                break;
                            }
                            else
                            {
                                if (_2063 == 0.0)
                                {
                                    float _2090 = (_2055 * (-1.0)) * (1.0 / _2054);
                                    _2091 = _2090;
                                    _2092 = _2090;
                                }
                                else
                                {
                                    float _2083;
                                    if (_2056 > 0.0)
                                    {
                                        _2083 = (-0.5) * fma(2.0, _2055, sqrt(_2063));
                                    }
                                    else
                                    {
                                        _2083 = (-0.5) * fma(2.0, _2055, -sqrt(_2063));
                                    }
                                    _2091 = _2057 * (1.0 / _2083);
                                    _2092 = _2083 * (1.0 / _2054);
                                }
                            }
                            _2093 = _2091;
                            _2094 = _2092;
                            _2095 = true;
                            break;
                        } while(false);
                        if (!_2095)
                        {
                            _2111 = vec2(0.0);
                            _2112 = false;
                            break;
                        }
                        if ((_2094 < 0.0) && (_2093 < 0.0))
                        {
                            _2111 = vec2(0.0);
                            _2112 = false;
                            break;
                        }
                        vec2 _2110;
                        if (_2094 > _2093)
                        {
                            _2110 = vec2(_2093, _2094);
                        }
                        else
                        {
                            _2110 = vec2(_2094, _2093);
                        }
                        _2111 = _2110;
                        _2112 = true;
                        break;
                    } while(false);
                    _2137 = _2111;
                    _2138 = _2112;
                }
                vec3 _2141 = _2033 + (_2048 * _2137.y);
                float _2162;
                if (_2034)
                {
                    _2162 = 1.0 - clamp(length(spvNMax(_2035 - (_13._m0[_1984]._m0.xyz - vec3(_13._m0[_1984]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1984]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2162 = clamp((_13._m0[_1984]._m0.x - length(_2033)) * (1.0 / spvNMax(_13._m0[_1984]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2165 = float(_2138) * smoothstep(0.0, 1.0, _2162);
                vec4 _2207;
                SPIRV_CROSS_BRANCH
                if (_2165 > 9.9999997473787516355514526367188e-05)
                {
                    float _2174 = mix(clamp((_2137.y * (1.0 / length(_2141))) * _559, 0.0, _559), _559, _559);
                    vec3 _2176 = mix(_2141, _2048, vec3(_2174));
                    int _78 = _2013;
                    vec4 _2177 = textureLod(nonuniformEXT(samplerCube(_24[_78], _7)), _2176, 0.0);
                    int _82 = _2013 + 1;
                    _2177.w = textureLod(nonuniformEXT(samplerCube(_24[_82], _7)), _2176, 0.0).x;
                    vec4 _2192;
                    SPIRV_CROSS_BRANCH
                    if (_2018 >= 0)
                    {
                        int _86 = _2018;
                        vec4 _2185 = textureLod(nonuniformEXT(samplerCube(_24[_86], _7)), _2176, 0.0);
                        int _90 = _2018 + 1;
                        _2185.w = textureLod(nonuniformEXT(samplerCube(_24[_90], _7)), _2176, 0.0).x;
                        _2192 = mix(_2177, _2185, vec4(_13._m0[_1984]._m3));
                    }
                    else
                    {
                        _2192 = _2177;
                    }
                    vec4 _2193 = _2192 * _2031;
                    vec3 _2202 = (_2193.xyz * _13._m0[_1984]._m4).xyz * (_487 * textureLod(sampler2D(_18, _12), vec2(_1940, _2174), 0.0).z);
                    vec4 _2203 = vec4(_2202.x, _2202.y, _2202.z, _2193.w);
                    _2203.w = _2193.w * _2165;
                    _2207 = _2203;
                }
                else
                {
                    _2207 = vec4(0.0);
                }
                _2212 = mix(_1975, _2207.xyz, vec3(_2207.w));
            }
            else
            {
                _2212 = _1975;
            }
            vec3 _2391;
            SPIRV_CROSS_FLATTEN
            if ((_2003 & 2) != 0)
            {
                vec3 _2217 = _2007 * _1894;
                vec2 _2306;
                bool _2307;
                if (_2034)
                {
                    vec2 _2301;
                    bool _2305;
                    do
                    {
                        vec3 _2285 = (_13._m0[_1984]._m0.xyz - _2033) / _2217;
                        vec3 _2288 = ((-_13._m0[_1984]._m0.xyz) - _2033) / _2217;
                        vec3 _2289 = spvNMin(_2285, _2288);
                        vec3 _2290 = spvNMax(_2285, _2288);
                        float _2295 = spvNMax(_2289.x, spvNMax(_2289.y, _2289.z));
                        float _2300 = spvNMin(_2290.x, spvNMin(_2290.y, _2290.z));
                        _2301 = vec2(_2295, _2300);
                        if (_2295 > _2300)
                        {
                            _2305 = false;
                            break;
                        }
                        _2305 = true;
                        break;
                    } while(false);
                    _2306 = _2301;
                    _2307 = _2305;
                }
                else
                {
                    vec2 _2280;
                    bool _2281;
                    do
                    {
                        float _2223 = dot(_2217, _2217);
                        float _2224 = dot(_2217, _2033);
                        float _2225 = 2.0 * _2224;
                        float _2226 = _2038 - _13._m0[_1984]._m0.y;
                        float _2262;
                        float _2263;
                        bool _2264;
                        do
                        {
                            float _2232 = fma(_2225, _2225, -((4.0 * _2223) * _2226));
                            float _2260;
                            float _2261;
                            if (_2232 < 0.0)
                            {
                                _2262 = 0.0;
                                _2263 = 0.0;
                                _2264 = false;
                                break;
                            }
                            else
                            {
                                if (_2232 == 0.0)
                                {
                                    float _2259 = (_2224 * (-1.0)) * (1.0 / _2223);
                                    _2260 = _2259;
                                    _2261 = _2259;
                                }
                                else
                                {
                                    float _2252;
                                    if (_2225 > 0.0)
                                    {
                                        _2252 = (-0.5) * fma(2.0, _2224, sqrt(_2232));
                                    }
                                    else
                                    {
                                        _2252 = (-0.5) * fma(2.0, _2224, -sqrt(_2232));
                                    }
                                    _2260 = _2226 * (1.0 / _2252);
                                    _2261 = _2252 * (1.0 / _2223);
                                }
                            }
                            _2262 = _2260;
                            _2263 = _2261;
                            _2264 = true;
                            break;
                        } while(false);
                        if (!_2264)
                        {
                            _2280 = vec2(0.0);
                            _2281 = false;
                            break;
                        }
                        if ((_2263 < 0.0) && (_2262 < 0.0))
                        {
                            _2280 = vec2(0.0);
                            _2281 = false;
                            break;
                        }
                        vec2 _2279;
                        if (_2263 > _2262)
                        {
                            _2279 = vec2(_2262, _2263);
                        }
                        else
                        {
                            _2279 = vec2(_2263, _2262);
                        }
                        _2280 = _2279;
                        _2281 = true;
                        break;
                    } while(false);
                    _2306 = _2280;
                    _2307 = _2281;
                }
                vec3 _2310 = _2033 + (_2217 * _2306.y);
                float _2331;
                if (_2034)
                {
                    _2331 = 1.0 - clamp(length(spvNMax(_2035 - (_13._m0[_1984]._m0.xyz - vec3(_13._m0[_1984]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_1984]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _2331 = clamp((_13._m0[_1984]._m0.x - length(_2033)) * (1.0 / spvNMax(_13._m0[_1984]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _2334 = float(_2307) * smoothstep(0.0, 1.0, _2331);
                vec4 _2386;
                SPIRV_CROSS_BRANCH
                if (_2334 > 9.9999997473787516355514526367188e-05)
                {
                    float _2343 = mix(clamp((_2306.y * (1.0 / length(_2310))) * _559, 0.0, _559), _559, _559);
                    vec3 _2345 = mix(_2310, _2217, vec3(_2343));
                    float _2346 = _2343 * 8.0;
                    int _94 = _2023;
                    int _98 = _2023 + 1;
                    vec4 _2354 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_94], _7)), _2345, _2346).xyz, textureLod(nonuniformEXT(samplerCube(_24[_98], _7)), _2345, _2346).x);
                    vec4 _2368;
                    SPIRV_CROSS_BRANCH
                    if (_2028 >= 0)
                    {
                        int _102 = _2028;
                        int _106 = _2028 + 1;
                        _2368 = mix(_2354, vec4(textureLod(nonuniformEXT(samplerCube(_24[_102], _7)), _2345, _2346).xyz, textureLod(nonuniformEXT(samplerCube(_24[_106], _7)), _2345, _2346).x), vec4(_13._m0[_1984]._m3));
                    }
                    else
                    {
                        _2368 = _2354;
                    }
                    vec4 _2369 = _2368 * _2031;
                    vec4 _2374 = textureLod(sampler2D(_18, _12), vec2(_1940, _2343), 0.0);
                    vec3 _2381 = (_2369.xyz * _13._m0[_1984]._m4).xyz * ((_1896 * _2374.x) + vec3(_2374.y));
                    vec4 _2382 = vec4(_2381.x, _2381.y, _2381.z, _2369.w);
                    _2382.w = _2369.w * _2334;
                    _2386 = _2382;
                }
                else
                {
                    _2386 = vec4(0.0);
                }
                _2391 = mix(_1972, _2386.xyz, vec3(_2386.w));
            }
            else
            {
                _2391 = _1972;
            }
            _1973 = _2391;
            _1976 = _2212;
        }
        float _2392 = _6._m0[0u] * 100.0;
        bool _2397 = _26._m19 > 0.0;
        vec3 _2458;
        SPIRV_CROSS_BRANCH
        if (_2397 && (_26._m35 == 0.0))
        {
            vec3 _2411 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _2412 = length(_2411);
            vec3 _2423;
            float _2424;
            if (_2412 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2421 = _2411;
                _2421.z = _2411.z + _29._m0;
                _2423 = _2421;
                _2424 = length(_2421);
            }
            else
            {
                _2423 = _2411;
                _2424 = _2412;
            }
            float _2427 = dot(_2423 / vec3(_2424), _26._m36);
            float _2428 = _29._m0 / _2424;
            _2458 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_2427 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_2424 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_2427 < (-sqrt(fma(-_2428, _2428, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _2458 = _26._m2;
        }
        float _2471 = texelFetch(_41, ivec3(int(_594), int(_595), 0).xy, 0).x;
        float _2556;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _2495 = _27._m6 + _528;
            vec3 _2502 = vec3(0.0, _26._m18.z, 0.0) + (_2495 - vec3(0.0, _26._m25, 0.0));
            float _2506 = dot(_2502, _26._m24);
            vec2 _2516 = ((((_2502 + (_26._m24 * (sqrt(fma(_2506, _2506, fma(_26._m18.z, _26._m18.z, -dot(_2502, _2502)))) - _2506))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _2516.x = 1.0 - _2516.x;
            vec3 _2529 = vec3(0.0, _26._m23.z, 0.0) + (_2495 - vec3(0.0, _26._m27, 0.0));
            float _2533 = dot(_2529, _26._m26);
            vec2 _2543 = ((((_2529 + (_26._m26 * (sqrt(fma(_2533, _2533, fma(_26._m23.z, _26._m23.z, -dot(_2529, _2529)))) - _2533))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _2543.x = 1.0 - _2543.x;
            _2556 = _2471 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _2516, 0.0).x, textureLod(sampler2D(_33, _7), _2543, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _2556 = _2471;
        }
        float _2646;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _2584 = _27._m6 + _528;
            vec3 _2592 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _2584) - vec3(0.0, _26._m30, 0.0));
            float _2596 = dot(_2592, _26._m24);
            vec2 _2606 = ((((_2592 + (_26._m24 * (sqrt(fma(_2596, _2596, fma(_26._m28.z, _26._m28.z, -dot(_2592, _2592)))) - _2596))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _2606.x = 1.0 - _2606.x;
            vec3 _2620 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _2584) - vec3(0.0, _26._m33, 0.0));
            float _2624 = dot(_2620, _26._m26);
            vec2 _2634 = ((((_2620 + (_26._m26 * (sqrt(fma(_2624, _2624, fma(_26._m31.z, _26._m31.z, -dot(_2620, _2620)))) - _2624))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _2634.x = 1.0 - _2634.x;
            _2646 = _2556 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _2606, 0.0).x, textureLod(sampler2D(_23, _7), _2634, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _2646 = _2556;
        }
        vec3 _2648 = _2458 * (_2646 * _6._m0[0u]);
        vec3 _2651 = reflect(_530, _484);
        float _2655 = clamp(dot(_26._m0, normalize(_530 + _26._m0)), 0.0, 1.0);
        float _2657 = clamp(dot(_484, _26._m0), 0.0, 1.0);
        vec3 _2664 = vec3(fma((2.0 * _2655) * _2655, _559, mix(0.0, 0.5, _559))) - vec3(1.0);
        float _2683 = dot(_26._m0, _2651);
        vec3 _2693 = mix(_2651, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_2651 - (_26._m0 * _2683)) * 0.0045900647528469562530517578125)), bvec3(_2683 < 0.999989449977874755859375));
        vec3 _2695 = normalize(_530 + _2693);
        float _2699 = clamp(dot(_484, _2695), 0.0, 1.0);
        float _2701 = clamp(dot(_484, _2693), 0.0, 1.0);
        float _2702 = dot(_2695, _526);
        float _2704 = (_559 + 1.0) * 0.5;
        float _2705 = _559 * _559;
        float _2713 = _2704 * _2704;
        float _2727 = sqrt(fma(-_527, 0.89999997615814208984375, 1.0));
        float _2730 = spvNMax(0.001000000047497451305389404296875, clamp(_2705 / _2727, 0.0, 1.0));
        float _2732 = spvNMax(0.001000000047497451305389404296875, _2705 * _2727);
        float _2743 = fma(_2699, _2699, ((_2702 * _2702) / (_2730 * _2730)) + (fma(-_2699, _2699, fma(-_2702, _2702, 1.0)) / (_2732 * _2732)));
        float _2775;
        float _2776;
        if (_34._m0.x > 0.0)
        {
            vec4 _2764 = textureLod(sampler2D(_40, _12), _404, 0.0);
            float _2765 = _2764.x;
            _2775 = clamp((pow(spvNMax(abs(_624 + _2765), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _559, -1.0))) - 1.0) + _2765, 0.0, 1.0);
            _2776 = _2765;
        }
        else
        {
            _2775 = 1.0;
            _2776 = 1.0;
        }
        vec3 _2784 = ((_1424 + ((_2648 * (_487 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2664 * pow(spvNMax(abs(1.0 - _2657), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2664 * pow(spvNMax(abs(1.0 - _625), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _559))))) * _2657)) * mix(1.0, _2776, _34._m0.y)) + ((_1975 * _2392) * _2776);
        vec3 _2786 = ((_1422 + ((_2648 * ((_492 + ((vec3(1.0) - _492) * pow(spvNMax(abs(1.0 - clamp(dot(_2693, _2695), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2701, sqrt(fma(fma(-_625, _2713, _625), _625, _2713)), _625 * sqrt(fma(fma(-_2701, _2713, _2701), _2701, _2713)))) * (1.0 / ((((_2730 * _2732) * 3.1415927410125732421875) * _2743) * _2743))))) * _2657)) * mix(1.0, _2775, _34._m0.y)) + ((_1972 * _2392) * _2775);
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _2646, 0.5);
            _2784 *= _rdx_csm_shadow;
            _2786 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _39, _7, _404, _rdx_marchDir, _446, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _2784 *= _rdx_micro;
            _2786 *= _rdx_micro;
        }
        vec3 _3291;
        vec3 _3292;
        SPIRV_CROSS_BRANCH
        if (_2397)
        {
            vec3 _2794 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _2795 = vec3(0.0, 636100.0, 0.0) + (_528 + _27._m6);
            float _2796 = length(_2795);
            vec3 _2800 = (_2795 / vec3(_2796)) * spvNMax(_2796, 636100.0);
            vec3 _2801 = _2800 - _2794;
            float _2802 = length(_2801);
            vec3 _2804 = _2801 / vec3(_2802);
            float _2805 = length(_2794);
            vec3 _2819;
            vec3 _2820;
            float _2821;
            if (_2805 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _2814 = _2794;
                _2814.z = _2794.z + _29._m0;
                vec3 _2817 = _2800;
                _2817.z = _2800.z + _29._m0;
                _2819 = _2817;
                _2820 = _2814;
                _2821 = length(_2814);
            }
            else
            {
                _2819 = _2800;
                _2820 = _2794;
                _2821 = _2805;
            }
            float _2822 = dot(_2820, _2804);
            float _2833 = spvNMax((-_2822) - sqrt(fma(_29._m1, _29._m1, fma(_2822, _2822, -(_2821 * _2821)))), 0.0);
            bool _2836 = (_2833 > 0.0) && (_2833 < _2802);
            vec3 _2844;
            float _2845;
            float _2846;
            if (_2836)
            {
                _2844 = _2820 + (_2804 * _2833);
                _2845 = _2802 - _2833;
                _2846 = (_2822 + _2833) / _29._m1;
            }
            else
            {
                _2844 = _2820;
                _2845 = _2802;
                _2846 = _2822 / _2821;
            }
            float _2847 = _2836 ? _29._m1 : _2821;
            vec3 _3284;
            vec3 _3285;
            if (_2847 <= _29._m1)
            {
                float _2852 = dot(_2804, _26._m36);
                float _2854 = dot(_2844, _26._m36) / _2847;
                float _2855 = _29._m0 + 600.0;
                bool _2856 = _2847 < _2855;
                vec3 _2861;
                if (_2856)
                {
                    _2861 = _2819 * (_2855 / _2847);
                }
                else
                {
                    _2861 = _2819;
                }
                float _2862 = _2856 ? _2855 : _2847;
                float _2863 = length(_2861);
                float _2864 = dot(_2861, _2804);
                float _2866 = dot(_2861, _26._m36) / _2863;
                vec2 _2877 = vec2(_2846, _2846 + (_2845 / _2862));
                vec2 _2878 = _2877 * sqrt((0.5 / _29._m4) * _2862);
                vec2 _2881 = vec2(ivec2(sign(_2878)));
                vec2 _2882 = _2878 * _2878;
                float _2896 = -_2845;
                float _2898 = 2.0 * _2862;
                float _2900 = (_2845 / _2898) + _2846;
                float _2908 = _29._m0 - _2862;
                vec2 _2923 = _2877 * sqrt((0.5 / _29._m6) * _2862);
                vec2 _2926 = vec2(ivec2(sign(_2923)));
                vec2 _2927 = _2923 * _2923;
                vec3 _2957 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _2862) * exp(_2908 / _29._m4)) * (((_2881.y > _2881.x) ? exp(_2882.x) : 0.0) + dot((_2881 / ((abs(_2878) * 2.3192999362945556640625) + sqrt((_2882 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2896 / _29._m4) * _2900)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _2862) * exp(_2908 / _29._m6)) * (((_2926.y > _2926.x) ? exp(_2927.x) : 0.0) + dot((_2926 / ((abs(_2923) * 2.3192999362945556640625) + sqrt((_2927 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_2896 / _29._m6) * _2900)), vec2(1.0, -1.0))))));
                vec3 _2958 = spvNMin(_2957, vec3(1.0));
                float _2959 = _29._m0 / _2862;
                float _2962 = sqrt(fma(-_2959, _2959, 1.0));
                float _2964 = _2846 - (-_2962);
                vec4 _3247;
                if (abs(_2964) < 0.0040000001899898052215576171875)
                {
                    float _3072 = (-0.0040000001899898052215576171875) - _2962;
                    float _3074 = fma(_2862, _2862, _2845 * _2845);
                    float _3075 = _2898 * _2845;
                    float _3077 = sqrt(fma(_3075, _3072, _3074));
                    float _3078 = fma(_2862, _3072, _2845);
                    float _3081 = -(_29._m0 * _29._m0);
                    float _3083 = sqrt(fma(_29._m1, _29._m1, _3081));
                    float _3085 = sqrt(fma(_2862, _2862, _3081));
                    float _3086 = _2862 * _3072;
                    float _3088 = -(_2862 * _2862);
                    float _3090 = fma(_29._m0, _29._m0, fma(_3086, _3086, _3088));
                    vec4 _3096 = vec4(-1.0, _3083 * _3083, _3083, 0.50390625);
                    vec4 _3097 = mix(_3096, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3086 < 0.0) && (_3090 > 0.0)));
                    float _3099 = fma(_3085 / _3083, 0.96875, 0.015625);
                    float _3109 = fma(fma(_3086, _3097.x, sqrt(_3090 + _3097.y)) / (_3085 + _3097.z), 0.4921875, _3097.w);
                    float _3115 = _2852 + 1.0;
                    float _3117 = floor(_3115 * 3.5);
                    float _3119 = fma(_3115, 3.5, -_3117);
                    float _3120 = _3117 + fma(fma(atan(spvNMax(_2854, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3121 = _3120 * 0.125;
                    float _3125 = 1.0 - _3119;
                    float _3128 = (_3120 + 1.0) * 0.125;
                    float _3135 = sqrt(fma(_3077, _3077, _3081));
                    float _3139 = fma(_29._m0, _29._m0, fma(_3078, _3078, -(_3077 * _3077)));
                    vec4 _3144 = mix(_3096, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3078 < 0.0) && (_3139 > 0.0)));
                    float _3146 = fma(_3135 / _3083, 0.96875, 0.015625);
                    float _3156 = fma(fma(_3078, _3144.x, sqrt(_3139 + _3144.y)) / (_3135 + _3144.z), 0.4921875, _3144.w);
                    float _3162 = _3117 + fma(fma(atan(spvNMax(_2866, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3163 = _3162 * 0.125;
                    float _3169 = (_3162 + 1.0) * 0.125;
                    vec4 _3175 = _2958.xyzx;
                    float _3179 = 0.0040000001899898052215576171875 - _2962;
                    float _3181 = sqrt(fma(_3075, _3179, _3074));
                    float _3182 = fma(_2862, _3179, _2845);
                    float _3183 = _2862 * _3179;
                    float _3185 = fma(_29._m0, _29._m0, fma(_3183, _3183, _3088));
                    vec4 _3190 = mix(_3096, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3183 < 0.0) && (_3185 > 0.0)));
                    float _3200 = fma(fma(_3183, _3190.x, sqrt(_3185 + _3190.y)) / (_3085 + _3190.z), 0.4921875, _3190.w);
                    float _3211 = sqrt(fma(_3181, _3181, _3081));
                    float _3215 = fma(_29._m0, _29._m0, fma(_3182, _3182, -(_3181 * _3181)));
                    vec4 _3220 = mix(_3096, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_3182 < 0.0) && (_3215 > 0.0)));
                    float _3222 = fma(_3211 / _3083, 0.96875, 0.015625);
                    float _3232 = fma(fma(_3182, _3220.x, sqrt(_3215 + _3220.y)) / (_3211 + _3220.z), 0.4921875, _3220.w);
                    _3247 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_3163, _3156, _3146), 0.0) * _3125) + (textureLod(sampler3D(_31, _7), vec3(_3169, _3156, _3146), 0.0) * _3119)), _3175, (textureLod(sampler3D(_31, _7), vec3(_3121, _3109, _3099), 0.0) * _3125) + (textureLod(sampler3D(_31, _7), vec3(_3128, _3109, _3099), 0.0) * _3119)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_3163, _3232, _3222), 0.0) * _3125) + (textureLod(sampler3D(_31, _7), vec3(_3169, _3232, _3222), 0.0) * _3119)), _3175, (textureLod(sampler3D(_31, _7), vec3(_3121, _3200, _3099), 0.0) * _3125) + (textureLod(sampler3D(_31, _7), vec3(_3128, _3200, _3099), 0.0) * _3119)), vec4(0.0)), vec4((_2964 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _2972 = -(_29._m0 * _29._m0);
                    float _2974 = sqrt(fma(_29._m1, _29._m1, _2972));
                    float _2976 = sqrt(fma(_2862, _2862, _2972));
                    float _2977 = _2862 * _2846;
                    float _2981 = fma(_29._m0, _29._m0, fma(_2977, _2977, -(_2862 * _2862)));
                    vec4 _2987 = vec4(-1.0, _2974 * _2974, _2974, 0.50390625);
                    vec4 _2988 = mix(_2987, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2977 < 0.0) && (_2981 > 0.0)));
                    float _2990 = fma(_2976 / _2974, 0.96875, 0.015625);
                    float _3000 = fma(fma(_2977, _2988.x, sqrt(_2981 + _2988.y)) / (_2976 + _2988.z), 0.4921875, _2988.w);
                    float _3006 = _2852 + 1.0;
                    float _3008 = floor(_3006 * 3.5);
                    float _3010 = fma(_3006, 3.5, -_3008);
                    float _3011 = _3008 + fma(fma(atan(spvNMax(_2854, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _3016 = 1.0 - _3010;
                    float _3026 = sqrt(fma(_2863, _2863, _2972));
                    float _3030 = fma(_29._m0, _29._m0, fma(_2864, _2864, -(_2863 * _2863)));
                    vec4 _3035 = mix(_2987, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_2864 < 0.0) && (_3030 > 0.0)));
                    float _3037 = fma(_3026 / _2974, 0.96875, 0.015625);
                    float _3047 = fma(fma(_2864, _3035.x, sqrt(_3030 + _3035.y)) / (_3026 + _3035.z), 0.4921875, _3035.w);
                    float _3053 = _3008 + fma(fma(atan(spvNMax(_2866, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _3247 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_3053 * 0.125, _3047, _3037), 0.0) * _3016) + (textureLod(sampler3D(_31, _7), vec3((_3053 + 1.0) * 0.125, _3047, _3037), 0.0) * _3010)), _2958.xyzx, (textureLod(sampler3D(_31, _7), vec3(_3011 * 0.125, _3000, _2990), 0.0) * _3016) + (textureLod(sampler3D(_31, _7), vec3((_3011 + 1.0) * 0.125, _3000, _2990), 0.0) * _3010)), vec4(0.0));
                }
                float _3262 = fma(_2852, _2852, 1.0);
                _3284 = _2958;
                _3285 = (_3247.xyz * (0.0596831031143665313720703125 * _3262)) + ((((_3247.xyz * (_3247.w * smoothstep(0.0, 0.0199999995529651641845703125, _2854))) / vec3(spvNMax(_3247.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _2852, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _3262) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _3284 = vec3(1.0);
                _3285 = vec3(0.0);
            }
            _3291 = _2786 * _3284;
            _3292 = fma(_2784, _3284, _3285 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _3291 = _2786;
            _3292 = _2784;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_39, _7, _404, _rdx_dir, _446, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _3292 = vec3(_rdx_vis);
            _3291 = vec3(0.0);
        }
        imageStore(_43, ivec2(_387), vec4(_3292, 1.0));
        imageStore(_44, ivec2(_387), vec4(_3291, 1.0));
        break;
    } while(false);
}

