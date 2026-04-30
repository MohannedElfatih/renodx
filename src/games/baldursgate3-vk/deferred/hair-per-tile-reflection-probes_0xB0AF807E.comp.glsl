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

float _354;
const vec4 _365[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _401;
vec3 _405;
vec3 _406;

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
        uint _445 = (((_34._m2 & 1u) != 0u) ? ((_34._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_34._m2 / 2u) * _34._m3);
        uint _447 = _42._m0[_445];
        uvec2 _452 = (uvec2(_447 & 65535u, _447 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_452, _28._m3)) || any(greaterThan(_452, _28._m4)))
        {
            break;
        }
        vec2 _464 = vec2(_452);
        vec2 _469 = (_464 + vec2(0.5)) / vec2(_34._m1);
        vec2 _476 = ((_469 - _28._m1) / _28._m0) * 0.5;
        float _480 = _476.x;
        float _482 = _476.y;
        ivec2 _500 = ivec3(int(_452.x), int(_452.y), 0).xy;
        vec4 _504 = texelFetch(_36, _500, 0);
        vec4 _506 = texelFetch(_37, _500, 0);
        vec4 _508 = texelFetch(_38, _500, 0);
        vec4 _510 = texelFetch(_39, _500, 0);
        float _511 = _510.x;
        vec3 _529;
        do
        {
            vec3 _517 = fma(vec3(texelFetch(_35, _500, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _518 = dot(_517, _517);
            if (_518 > 54000001024.0)
            {
                _529 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _523 = 2.0 / _518;
                vec2 _525 = _517.xy * _523;
                vec3 _526 = vec3(_525.x, _525.y, _405.z);
                _526.z = 1.0 - _523;
                _529 = _526;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _532 = _506.y;
        float _533 = _506.z;
        uint _537 = uint(roundEven(_506.w * 255.0));
        uint _538 = _537 & 7u;
        uint _540 = (_537 & 112u) >> 4u;
        bool _550 = _538 == 5u;
        float _586;
        vec3 _587;
        float _588;
        float _589;
        SPIRV_CROSS_BRANCH
        if (_550)
        {
            vec3 _554 = _508.xyz * 255.0;
            float _556 = _554.y * 0.0625;
            vec2 _566 = clamp((vec2(fma(_554.x, 16.0, floor(_556)), fma(fract(_556), 4096.0, _554.z)) * 0.000488519784994423389434814453125) - vec2(1.0), vec2(-1.0), vec2(1.0));
            float _572 = (1.0 - abs(_566.x)) - abs(_566.y);
            vec3 _573;
            _573.z = _572;
            vec2 _582 = mix((vec2(1.0) - abs(_566.yx)) * mix(vec2(-1.0), vec2(1.0), greaterThanEqual(_566, vec2(0.0))), _566, bvec2(_572 >= 0.0));
            _586 = _508.w;
            _587 = normalize(vec3(_582.x, _582.y, _573.z));
            _588 = _533;
            _589 = 0.0;
        }
        else
        {
            _586 = 0.0;
            _587 = vec3(0.0, 0.0, 1.0);
            _588 = 0.0;
            _589 = _533;
        }
        vec3 _590 = _529 * mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz);
        vec3 _593 = vec3(_504.x, _504.y, _504.z) * (1.0 - _589);
        vec3 _598 = mix(vec3(0.1599999964237213134765625 * (_532 * _532)), _504.xyz, vec3(_589));
        float _599 = spvNMax(0.0900000035762786865234375, _506.x);
        vec3 _600 = (((_26._m7[0].xyz * ((1.0 - _480) - _482)) + (_26._m7[1].xyz * _480)) + (_26._m7[2].xyz * _482)) * _511;
        vec3 _602 = normalize(-_600);
        float _635;
        if (!_550)
        {
            uint _607 = gl_SubgroupInvocationID & 3u;
            vec3 _613 = (subgroupQuadSwapHorizontal(_529) - _529) * (((_607 & 1u) != 0u) ? (-1.0) : 1.0);
            vec3 _619 = (subgroupQuadSwapVertical(_529) - _529) * (((_607 & 2u) != 0u) ? (-1.0) : 1.0);
            vec3 _623 = mix(_613, vec3(0.0), bvec3(any(isnan(_613))));
            vec3 _627 = mix(_619, vec3(0.0), bvec3(any(isnan(_619))));
            _635 = sqrt(clamp(fma(_599, _599, spvNMin(dot(_623, _623) + dot(_627, _627), 0.180000007152557373046875)), 0.0, 1.0));
        }
        else
        {
            _635 = _599;
        }
        ivec2 _644 = ivec2(uvec2(_464) / uvec2(_19._m25));
        int _667 = int(fma(fma(float(int(clamp(fma(log2(_511 * _27._m4), _19._m21, _19._m22), 0.0, float(_19._m26)))), _19._m24, float(_644.y)), _19._m23, float(_644.x)));
        float _670 = _464.x;
        float _671 = _464.y;
        float _676 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _670, 0.005837149918079376220703125 * _671)));
        float _683 = clamp(fma(_19._m34.y, length(_600), _19._m34.x), 0.0, 1.0);
        bool _684 = _538 == 0u;
        vec3 _3366;
        vec3 _3367;
        SPIRV_CROSS_BRANCH
        if (_684)
        {
            uvec4 _2320 = uvec4(_8._m0[uint(_667)]);
            uint _2321 = _2320.x;
            uint _2322 = _2320.y;
            uint _2325 = ((_2322 >> 0u) & 4095u) + _2321;
            uint _2328 = ((_2322 >> 12u) & 4095u) + _2325;
            uint _2332 = ((_2320.z >> 0u) & 1023u) + _2328;
            float _2334 = spvNMax(dot(_590, _602), 9.9999997473787516355514526367188e-06);
            float _2336;
            bool _2339;
            vec3 _2341;
            vec3 _2343;
            uint _2345;
            _2336 = _354;
            _2339 = false;
            _2341 = vec3(0.0);
            _2343 = vec3(0.0);
            _2345 = _2321;
            float _2337;
            bool _2340;
            vec3 _2342;
            vec3 _2344;
            for (; _2345 < _2325; _2336 = _2337, _2339 = _2340, _2341 = _2342, _2343 = _2344, _2345++)
            {
                uint _2352 = uint(_9._m0[_2345]);
                float _2370 = abs(_10._m0[_2352]._m5);
                if ((_10._m0[_2352]._m6 & (1u << (_540 & 31u))) != 0u)
                {
                    vec3 _2385 = _10._m0[_2352]._m0.xyz - _600;
                    float _2386 = dot(_2385, _2385);
                    vec3 _2389 = _2385 * inversesqrt(spvNMax(_2386, 1.0000000133514319600180897396058e-10));
                    float _2390 = _10._m0[_2352]._m0.w * _10._m0[_2352]._m0.w;
                    float _2628;
                    bool _2629;
                    vec3 _2630;
                    vec3 _2631;
                    if (_2386 < (1.0 / _2390))
                    {
                        vec3 _2395 = _602 + _2389;
                        vec3 _2399 = _2395 * inversesqrt(spvNMax(dot(_2395, _2395), 1.0000000133514319600180897396058e-10));
                        float _2401 = clamp(dot(_2389, _2399), 0.0, 1.0);
                        float _2403 = clamp(dot(_590, _2399), 0.0, 1.0);
                        float _2405 = clamp(dot(_590, _2389), 0.0, 1.0);
                        float _2406 = _2386 * _2390;
                        float _2412 = pow(spvNMax(abs(clamp(fma(-_2406, _2406, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_2352]._m4);
                        float _2422;
                        if (_10._m0[_2352]._m5 < 0.0)
                        {
                            _2422 = _2412 * fma(4.0, _2390, _2370);
                        }
                        else
                        {
                            _2422 = _2412 * ((1.0 / spvNMax(_2386, 9.9999997473787516355514526367188e-05)) + _2370);
                        }
                        float _2424 = 0.079577468335628509521484375 * (_2405 * _2422);
                        float _2559;
                        bool _2560;
                        float _2561;
                        if ((_10._m0[_2352]._m7 & 1u) != 0u)
                        {
                            uint _2449;
                            do
                            {
                                vec3 _2429 = -_2389;
                                float _2430 = dot(_2429, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _2431 = dot(_2429, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _2432 = dot(_2429, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _2436 = spvNMax(spvNMax(_2430, _2431), spvNMax(_2432, dot(_2429, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_2436 == _2430)
                                {
                                    _2449 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_2436 == _2431)
                                    {
                                        _2449 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_2436 == _2432)
                                        {
                                            _2449 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _2449 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _2451 = uint(int(_10._m0[_2352]._m7 >> 2u)) + _2449;
                            float _2553;
                            bool _2554;
                            float _2555;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2405 <= 0.0) && true)
                                {
                                    _2553 = _2336;
                                    _2554 = _2339;
                                    _2555 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2484 = _20._m0[_2451]._m0 * vec4(_600 + (_590 * ((3.5 * float(int(sign(_2405)))) * (_20._m0[_2451]._m4 * sqrt(_2386)))), 1.0);
                                    vec3 _2488 = _2484.xyz / vec3(_2484.w);
                                    vec2 _2491 = (_2488.xy * 0.5) + vec2(0.5);
                                    _2491.y = 1.0 - _2491.y;
                                    float _2500 = (_20._m0[_2451]._m5.y / _20._m0[_2451]._m6) / (_2488.z - _20._m0[_2451]._m5.x);
                                    float _2505 = _2339 ? _2336 : 6.283185482025146484375;
                                    float _2506 = _676 * _2505;
                                    vec2 _2507 = _20._m0[_2451]._m1 + _19._m33;
                                    vec2 _2510 = (_20._m0[_2451]._m1 + vec2(_20._m0[_2451]._m2)) - _19._m33;
                                    float _2512;
                                    _2512 = 0.0;
                                    for (int _2515 = 0; _2515 < 12; )
                                    {
                                        float _2520 = float(uint(_2515));
                                        float _2523 = sqrt(_2520 + 0.5) * 0.288675129413604736328125;
                                        float _2524 = fma(_2520, 2.3999631404876708984375, _2506);
                                        vec2 _2532 = clamp(fma((vec3(cos(_2524), sin(_2524), _2523).xy * _2523) * 2.5, _19._m33, _2491), _2507, _2510);
                                        vec2 _2535 = fract(fma(vec2(1.0) / _19._m33, _2532, vec2(0.5)));
                                        vec4 _2541 = vec4(lessThan(vec4(_2500), textureGather(sampler2D(_21, _12), _2532)));
                                        float _2544 = _2535.x;
                                        _2512 += clamp(mix(mix(_2541.w, _2541.z, _2544), mix(_2541.x, _2541.y, _2544), _2535.y), 0.0, 1.0);
                                        _2515++;
                                        continue;
                                    }
                                    _2553 = _2505;
                                    _2554 = _2339 ? _2339 : true;
                                    _2555 = _2512 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2559 = _2553;
                            _2560 = _2554;
                            _2561 = _2424 * mix(1.0, _2555, spvNMin(_683, _10._m0[_2352]._m8));
                        }
                        else
                        {
                            _2559 = _2336;
                            _2560 = _2339;
                            _2561 = _2424;
                        }
                        vec3 _2626;
                        vec3 _2627;
                        if (_2405 > 0.0)
                        {
                            vec3 _2567 = _10._m0[_2352]._m1.xyz * (_2561 * ((_10._m0[_2352]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2574 = vec3(fma((2.0 * _2401) * _2401, _635, mix(0.0, 0.5, _635))) - vec3(1.0);
                            float _2595 = (_635 + 1.0) * 0.5;
                            float _2596 = _635 * _635;
                            float _2604 = _2595 * _2595;
                            float _2616 = _2596 * _2596;
                            float _2619 = fma(fma(_2403, _2616, -_2403), _2403, 1.0);
                            _2626 = fma(_2567, (_598 + ((vec3(1.0) - _598) * pow(spvNMax(abs(1.0 - _2401), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2405, sqrt(fma(fma(-_2334, _2604, _2334), _2334, _2604)), _2334 * sqrt(fma(fma(-_2405, _2604, _2405), _2405, _2604)))) * (_2616 * (0.3183098733425140380859375 / (_2619 * _2619)))), _2341);
                            _2627 = fma(_2567, _593 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2574 * pow(spvNMax(abs(1.0 - _2405), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2574 * pow(spvNMax(abs(1.0 - _2334), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _635))), _2343);
                        }
                        else
                        {
                            _2626 = _2341;
                            _2627 = _2343;
                        }
                        _2628 = _2559;
                        _2629 = _2560;
                        _2630 = _2626;
                        _2631 = _2627;
                    }
                    else
                    {
                        _2628 = _2336;
                        _2629 = _2339;
                        _2630 = _2341;
                        _2631 = _2343;
                    }
                    _2337 = _2628;
                    _2340 = _2629;
                    _2342 = _2630;
                    _2344 = _2631;
                }
                else
                {
                    _2337 = _2336;
                    _2340 = _2339;
                    _2342 = _2341;
                    _2344 = _2343;
                }
            }
            float _2633;
            bool _2636;
            vec3 _2638;
            vec3 _2640;
            uint _2642;
            _2633 = _2336;
            _2636 = _2339;
            _2638 = _2341;
            _2640 = _2343;
            _2642 = _2345;
            float _2634;
            bool _2637;
            vec3 _2639;
            vec3 _2641;
            for (; _2642 < _2328; _2633 = _2634, _2636 = _2637, _2638 = _2639, _2640 = _2641, _2642++)
            {
                uint _2649 = uint(_9._m0[_2642]);
                float _2662 = abs(_10._m0[_2649]._m5);
                if ((_10._m0[_2649]._m6 & (1u << (_540 & 31u))) != 0u)
                {
                    vec3 _2680 = _10._m0[_2649]._m0.xyz - _600;
                    float _2681 = dot(_2680, _2680);
                    vec3 _2684 = _2680 * inversesqrt(spvNMax(_2681, 1.0000000133514319600180897396058e-10));
                    float _2685 = _10._m0[_2649]._m0.w * _10._m0[_2649]._m0.w;
                    float _2913;
                    bool _2914;
                    vec3 _2915;
                    vec3 _2916;
                    if (_2681 < (1.0 / _2685))
                    {
                        vec3 _2690 = _602 + _2684;
                        vec3 _2694 = _2690 * inversesqrt(spvNMax(dot(_2690, _2690), 1.0000000133514319600180897396058e-10));
                        float _2696 = clamp(dot(_2684, _2694), 0.0, 1.0);
                        float _2698 = clamp(dot(_590, _2694), 0.0, 1.0);
                        float _2700 = clamp(dot(_590, _2684), 0.0, 1.0);
                        float _2703 = dot(-_2684, normalize(_10._m0[_2649]._m2.xyz));
                        float _2732;
                        if (_2703 > _10._m0[_2649]._m1.w)
                        {
                            float _2707 = _2681 * _2685;
                            float _2713 = pow(spvNMax(abs(clamp(fma(-_2707, _2707, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_2649]._m4);
                            float _2723;
                            if (_10._m0[_2649]._m5 < 0.0)
                            {
                                _2723 = _2713 * fma(4.0, _2685, _2662);
                            }
                            else
                            {
                                _2723 = _2713 * ((1.0 / spvNMax(_2681, 9.9999997473787516355514526367188e-05)) + _2662);
                            }
                            float _2728 = clamp((_2703 - _10._m0[_2649]._m1.w) / spvNMax(_10._m0[_2649]._m2.w - _10._m0[_2649]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _2732 = _2700 * (_2723 * (_2728 * _2728));
                        }
                        else
                        {
                            _2732 = 0.0;
                        }
                        float _2733 = 0.3183098733425140380859375 * _2732;
                        float _2844;
                        bool _2845;
                        float _2846;
                        if ((_10._m0[_2649]._m7 & 1u) != 0u)
                        {
                            uint _2736 = uint(int(_10._m0[_2649]._m7 >> 2u));
                            float _2838;
                            bool _2839;
                            float _2840;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2700 <= 0.0) && true)
                                {
                                    _2838 = _2633;
                                    _2839 = _2636;
                                    _2840 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2769 = _20._m0[_2736]._m0 * vec4(_600 + (_590 * ((3.5 * float(int(sign(_2700)))) * (_20._m0[_2736]._m4 * sqrt(_2681)))), 1.0);
                                    vec3 _2773 = _2769.xyz / vec3(_2769.w);
                                    vec2 _2776 = (_2773.xy * 0.5) + vec2(0.5);
                                    _2776.y = 1.0 - _2776.y;
                                    float _2785 = (_20._m0[_2736]._m5.y / _20._m0[_2736]._m6) / (_2773.z - _20._m0[_2736]._m5.x);
                                    float _2790 = _2636 ? _2633 : 6.283185482025146484375;
                                    float _2791 = _676 * _2790;
                                    vec2 _2792 = _20._m0[_2736]._m1 + _19._m33;
                                    vec2 _2795 = (_20._m0[_2736]._m1 + vec2(_20._m0[_2736]._m2)) - _19._m33;
                                    float _2797;
                                    _2797 = 0.0;
                                    for (int _2800 = 0; _2800 < 12; )
                                    {
                                        float _2805 = float(uint(_2800));
                                        float _2808 = sqrt(_2805 + 0.5) * 0.288675129413604736328125;
                                        float _2809 = fma(_2805, 2.3999631404876708984375, _2791);
                                        vec2 _2817 = clamp(fma((vec3(cos(_2809), sin(_2809), _2808).xy * _2808) * 2.5, _19._m33, _2776), _2792, _2795);
                                        vec2 _2820 = fract(fma(vec2(1.0) / _19._m33, _2817, vec2(0.5)));
                                        vec4 _2826 = vec4(lessThan(vec4(_2785), textureGather(sampler2D(_21, _12), _2817)));
                                        float _2829 = _2820.x;
                                        _2797 += clamp(mix(mix(_2826.w, _2826.z, _2829), mix(_2826.x, _2826.y, _2829), _2820.y), 0.0, 1.0);
                                        _2800++;
                                        continue;
                                    }
                                    _2838 = _2790;
                                    _2839 = _2636 ? _2636 : true;
                                    _2840 = _2797 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2844 = _2838;
                            _2845 = _2839;
                            _2846 = _2733 * mix(1.0, _2840, spvNMin(_683, _10._m0[_2649]._m8));
                        }
                        else
                        {
                            _2844 = _2633;
                            _2845 = _2636;
                            _2846 = _2733;
                        }
                        vec3 _2911;
                        vec3 _2912;
                        if (_2700 > 0.0)
                        {
                            vec3 _2852 = _10._m0[_2649]._m1.xyz * (_2846 * ((_10._m0[_2649]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2859 = vec3(fma((2.0 * _2696) * _2696, _635, mix(0.0, 0.5, _635))) - vec3(1.0);
                            float _2880 = (_635 + 1.0) * 0.5;
                            float _2881 = _635 * _635;
                            float _2889 = _2880 * _2880;
                            float _2901 = _2881 * _2881;
                            float _2904 = fma(fma(_2698, _2901, -_2698), _2698, 1.0);
                            _2911 = fma(_2852, (_598 + ((vec3(1.0) - _598) * pow(spvNMax(abs(1.0 - _2696), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2700, sqrt(fma(fma(-_2334, _2889, _2334), _2334, _2889)), _2334 * sqrt(fma(fma(-_2700, _2889, _2700), _2700, _2889)))) * (_2901 * (0.3183098733425140380859375 / (_2904 * _2904)))), _2638);
                            _2912 = fma(_2852, _593 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2859 * pow(spvNMax(abs(1.0 - _2700), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2859 * pow(spvNMax(abs(1.0 - _2334), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _635))), _2640);
                        }
                        else
                        {
                            _2911 = _2638;
                            _2912 = _2640;
                        }
                        _2913 = _2844;
                        _2914 = _2845;
                        _2915 = _2911;
                        _2916 = _2912;
                    }
                    else
                    {
                        _2913 = _2633;
                        _2914 = _2636;
                        _2915 = _2638;
                        _2916 = _2640;
                    }
                    _2634 = _2913;
                    _2637 = _2914;
                    _2639 = _2915;
                    _2641 = _2916;
                }
                else
                {
                    _2634 = _2633;
                    _2637 = _2636;
                    _2639 = _2638;
                    _2641 = _2640;
                }
            }
            vec3 _2923;
            vec3 _2925;
            _2923 = _2638;
            _2925 = _2640;
            float _2919;
            bool _2922;
            vec3 _2924;
            vec3 _2926;
            float _2918 = _2633;
            bool _2921 = _2636;
            uint _2927 = _2642;
            for (; _2927 < _2332; _2918 = _2919, _2921 = _2922, _2923 = _2924, _2925 = _2926, _2927++)
            {
                uint _2934 = uint(_9._m0[_2927]);
                int _2963 = int(_11._m0[_2934]._m1 >> 1u) - 1;
                if (((_11._m0[_2934]._m4 & 16777215u) & (1u << (_540 & 31u))) != 0u)
                {
                    vec3 _2974 = _11._m0[_2934]._m6 * vec4(_600, 1.0);
                    float _3362;
                    bool _3363;
                    vec3 _3364;
                    vec3 _3365;
                    if (all(lessThan(abs(_2974 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _2981 = _602 + _11._m0[_2934]._m9;
                        vec3 _2985 = _2981 * inversesqrt(spvNMax(dot(_2981, _2981), 1.0000000133514319600180897396058e-10));
                        float _2987 = clamp(dot(_11._m0[_2934]._m9, _2985), 0.0, 1.0);
                        float _2989 = clamp(dot(_590, _2985), 0.0, 1.0);
                        float _2991 = clamp(dot(_590, _11._m0[_2934]._m9), 0.0, 1.0);
                        int _2992 = int(_11._m0[_2934]._m4 >> 24u);
                        float _2993 = _2974.z;
                        vec3 _3032;
                        if (_2993 < _11._m0[_2934]._m2.x)
                        {
                            float _3020 = _2993 * _11._m0[_2934]._m2.z;
                            float _3023 = _3020 * _3020;
                            vec3 _3031;
                            _3031.z = dot(_365[_2992], vec4(_3020, _3023, smoothstep(0.0, 1.0, _3020), (_3023 * _3020) * fma(_3020, fma(_3020, 6.0, -15.0), 10.0)));
                            _3032 = _3031;
                        }
                        else
                        {
                            vec3 _3018;
                            if (_2993 > _11._m0[_2934]._m2.y)
                            {
                                float _3006 = (1.0 - _2993) * _11._m0[_2934]._m2.w;
                                float _3009 = _3006 * _3006;
                                vec3 _3017;
                                _3017.z = dot(_365[_2992], vec4(_3006, _3009, smoothstep(0.0, 1.0, _3006), (_3009 * _3006) * fma(_3006, fma(_3006, 6.0, -15.0), 10.0)));
                                _3018 = _3017;
                            }
                            else
                            {
                                _3018 = vec3(0.0, 0.0, 1.0);
                            }
                            _3032 = _3018;
                        }
                        vec2 _3033 = _2974.xy;
                        vec2 _3037 = (vec2(0.5) - abs(_3033 - vec2(0.5))) * _11._m0[_2934]._m3;
                        float _3038 = _3037.x;
                        vec3 _3055;
                        if (_3038 < 1.0)
                        {
                            float _3046 = _3038 * _3038;
                            vec3 _3054 = _3032;
                            _3054.x = dot(_365[_2992], vec4(_3038, _3046, smoothstep(0.0, 1.0, _3038), (_3046 * _3038) * fma(_3038, fma(_3038, 6.0, -15.0), 10.0)));
                            _3055 = _3054;
                        }
                        else
                        {
                            vec3 _3043 = _3032;
                            _3043.x = 1.0;
                            _3055 = _3043;
                        }
                        float _3056 = _3037.y;
                        vec3 _3073;
                        if (_3056 < 1.0)
                        {
                            float _3064 = _3056 * _3056;
                            vec3 _3072 = _3055;
                            _3072.y = dot(_365[_2992], vec4(_3056, _3064, smoothstep(0.0, 1.0, _3056), (_3064 * _3056) * fma(_3056, fma(_3056, 6.0, -15.0), 10.0)));
                            _3073 = _3072;
                        }
                        else
                        {
                            vec3 _3061 = _3055;
                            _3061.y = 1.0;
                            _3073 = _3061;
                        }
                        float _3079 = _2991 * ((_3073.x * _3073.y) * _3073.z);
                        float _3184;
                        bool _3185;
                        float _3186;
                        if ((_11._m0[_2934]._m8 & 1u) != 0u)
                        {
                            uint _3082 = uint(int(_11._m0[_2934]._m8 >> 2u));
                            float _3178;
                            bool _3179;
                            float _3180;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2991 <= 0.0) && true)
                                {
                                    _3178 = _2918;
                                    _3179 = _2921;
                                    _3180 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _3113 = _20._m0[_3082]._m0 * vec4(_600 + (_590 * ((3.5 * float(int(sign(_2991)))) * _20._m0[_3082]._m4)), 1.0);
                                    vec2 _3116 = (_3113.xy * 0.5) + vec2(0.5);
                                    _3116.y = 1.0 - _3116.y;
                                    float _3125 = ((_3113.z - _20._m0[_3082]._m5.y) / _20._m0[_3082]._m5.x) / _20._m0[_3082]._m6;
                                    float _3130 = _2921 ? _2918 : 6.283185482025146484375;
                                    float _3131 = _676 * _3130;
                                    vec2 _3132 = _20._m0[_3082]._m1 + _19._m33;
                                    vec2 _3135 = (_20._m0[_3082]._m1 + vec2(_20._m0[_3082]._m2)) - _19._m33;
                                    float _3137;
                                    _3137 = 0.0;
                                    for (int _3140 = 0; _3140 < 12; )
                                    {
                                        float _3145 = float(uint(_3140));
                                        float _3148 = sqrt(_3145 + 0.5) * 0.288675129413604736328125;
                                        float _3149 = fma(_3145, 2.3999631404876708984375, _3131);
                                        vec2 _3157 = clamp(fma((vec3(cos(_3149), sin(_3149), _3148).xy * _3148) * 2.5, _19._m33, _3116), _3132, _3135);
                                        vec2 _3160 = fract(fma(vec2(1.0) / _19._m33, _3157, vec2(0.5)));
                                        vec4 _3166 = vec4(lessThan(vec4(_3125), textureGather(sampler2D(_21, _12), _3157)));
                                        float _3169 = _3160.x;
                                        _3137 += clamp(mix(mix(_3166.w, _3166.z, _3169), mix(_3166.x, _3166.y, _3169), _3160.y), 0.0, 1.0);
                                        _3140++;
                                        continue;
                                    }
                                    _3178 = _3130;
                                    _3179 = _2921 ? _2921 : true;
                                    _3180 = _3137 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _3184 = _3178;
                            _3185 = _3179;
                            _3186 = _3079 * mix(1.0, _3180, spvNMin(_683, _11._m0[_2934]._m5));
                        }
                        else
                        {
                            _3184 = _2918;
                            _3185 = _2921;
                            _3186 = _3079;
                        }
                        vec3 _3227;
                        if (_2963 >= 0)
                        {
                            uint _3191 = gl_SubgroupInvocationID & 3u;
                            vec2 _3197 = (subgroupQuadSwapHorizontal(_3033) - _3033) * (((_3191 & 1u) != 0u) ? (-1.0) : 1.0);
                            vec2 _3203 = (subgroupQuadSwapVertical(_3033) - _3033) * (((_3191 & 2u) != 0u) ? (-1.0) : 1.0);
                            vec2 _3207 = mix(_3197, vec2(0.0), bvec2(any(isnan(_3197))));
                            vec2 _3211 = mix(_3203, vec2(0.0), bvec2(any(isnan(_3203))));
                            bvec2 _3220 = bvec2(any(greaterThan(abs(vec4(_3207, _3211)), vec4(0.015625))));
                            int _78 = _2963;
                            _3227 = _11._m0[_2934]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_78], _7)), _3033, mix(_3207, vec2(0.0), _3220), mix(_3211, vec2(0.0), _3220)).xyz;
                        }
                        else
                        {
                            _3227 = _11._m0[_2934]._m0;
                        }
                        vec3 _3360;
                        vec3 _3361;
                        SPIRV_CROSS_BRANCH
                        if ((_11._m0[_2934]._m1 & 1u) != 0u)
                        {
                            vec3 _3358;
                            vec3 _3359;
                            if (_2991 > 0.0)
                            {
                                vec3 _3299 = _3227 * (_3186 * _6._m0[0u]);
                                vec3 _3306 = vec3(fma((2.0 * _2987) * _2987, _635, mix(0.0, 0.5, _635))) - vec3(1.0);
                                float _3327 = (_635 + 1.0) * 0.5;
                                float _3328 = _635 * _635;
                                float _3336 = _3327 * _3327;
                                float _3348 = _3328 * _3328;
                                float _3351 = fma(fma(_2989, _3348, -_2989), _2989, 1.0);
                                _3358 = fma(_3299, (_598 + ((vec3(1.0) - _598) * pow(spvNMax(abs(1.0 - _2987), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2991, sqrt(fma(fma(-_2334, _3336, _2334), _2334, _3336)), _2334 * sqrt(fma(fma(-_2991, _3336, _2991), _2991, _3336)))) * (_3348 * (0.3183098733425140380859375 / (_3351 * _3351)))), _2923);
                                _3359 = fma(_3299, _593 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3306 * pow(spvNMax(abs(1.0 - _2991), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3306 * pow(spvNMax(abs(1.0 - _2334), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _635))), _2925);
                            }
                            else
                            {
                                _3358 = _2923;
                                _3359 = _2925;
                            }
                            _3360 = _3358;
                            _3361 = _3359;
                        }
                        else
                        {
                            vec3 _3293;
                            vec3 _3294;
                            if (_2991 > 0.0)
                            {
                                vec3 _3234 = _3227 * _3186;
                                vec3 _3241 = vec3(fma((2.0 * _2987) * _2987, _635, mix(0.0, 0.5, _635))) - vec3(1.0);
                                float _3262 = (_635 + 1.0) * 0.5;
                                float _3263 = _635 * _635;
                                float _3271 = _3262 * _3262;
                                float _3283 = _3263 * _3263;
                                float _3286 = fma(fma(_2989, _3283, -_2989), _2989, 1.0);
                                _3293 = fma(_3234, (_598 + ((vec3(1.0) - _598) * pow(spvNMax(abs(1.0 - _2987), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2991, sqrt(fma(fma(-_2334, _3271, _2334), _2334, _3271)), _2334 * sqrt(fma(fma(-_2991, _3271, _2991), _2991, _3271)))) * (_3283 * (0.3183098733425140380859375 / (_3286 * _3286)))), _2923);
                                _3294 = fma(_3234, _593 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3241 * pow(spvNMax(abs(1.0 - _2991), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3241 * pow(spvNMax(abs(1.0 - _2334), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _635))), _2925);
                            }
                            else
                            {
                                _3293 = _2923;
                                _3294 = _2925;
                            }
                            _3360 = _3293;
                            _3361 = _3294;
                        }
                        _3362 = _3184;
                        _3363 = _3185;
                        _3364 = _3360;
                        _3365 = _3361;
                    }
                    else
                    {
                        _3362 = _2918;
                        _3363 = _2921;
                        _3364 = _2923;
                        _3365 = _2925;
                    }
                    _2919 = _3362;
                    _2922 = _3363;
                    _2924 = _3364;
                    _2926 = _3365;
                }
                else
                {
                    _2919 = _2918;
                    _2922 = _2921;
                    _2924 = _2923;
                    _2926 = _2925;
                }
            }
            _3366 = _2923;
            _3367 = _2925;
        }
        else
        {
            vec3 _2315;
            vec3 _2316;
            if (_550)
            {
                uvec4 _694 = uvec4(_8._m0[uint(_667)]);
                uint _695 = _694.x;
                uint _696 = _694.y;
                uint _699 = ((_696 >> 0u) & 4095u) + _695;
                uint _702 = ((_696 >> 12u) & 4095u) + _699;
                uint _706 = ((_694.z >> 0u) & 1023u) + _702;
                vec3 _708;
                vec3 _711;
                float _713;
                bool _715;
                uint _717;
                _708 = vec3(0.0);
                _711 = vec3(0.0);
                _713 = _354;
                _715 = false;
                _717 = _695;
                vec3 _709;
                vec3 _712;
                float _714;
                bool _716;
                for (; _717 < _699; _708 = _709, _711 = _712, _713 = _714, _715 = _716, _717++)
                {
                    uint _724 = uint(_9._m0[_717]);
                    float _742 = abs(_10._m0[_724]._m5);
                    if ((_10._m0[_724]._m6 & (1u << (_540 & 31u))) != 0u)
                    {
                        vec3 _757 = _10._m0[_724]._m0.xyz - _600;
                        float _758 = dot(_757, _757);
                        vec3 _761 = _757 * inversesqrt(spvNMax(_758, 1.0000000133514319600180897396058e-10));
                        float _762 = _10._m0[_724]._m0.w * _10._m0[_724]._m0.w;
                        vec3 _1215;
                        vec3 _1216;
                        float _1217;
                        bool _1218;
                        if (_758 < (1.0 / _762))
                        {
                            float _767 = _758 * _762;
                            float _773 = pow(spvNMax(abs(clamp(fma(-_767, _767, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_724]._m4);
                            float _783;
                            if (_10._m0[_724]._m5 < 0.0)
                            {
                                _783 = _773 * fma(4.0, _762, _742);
                            }
                            else
                            {
                                _783 = _773 * ((1.0 / spvNMax(_758, 9.9999997473787516355514526367188e-05)) + _742);
                            }
                            float _785 = dot(_590, _761);
                            float _907;
                            bool _908;
                            float _909;
                            if ((_10._m0[_724]._m7 & 1u) != 0u)
                            {
                                uint _812;
                                do
                                {
                                    vec3 _792 = -_761;
                                    float _793 = dot(_792, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                    float _794 = dot(_792, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                    float _795 = dot(_792, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                    float _799 = spvNMax(spvNMax(_793, _794), spvNMax(_795, dot(_792, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                    if (_799 == _793)
                                    {
                                        _812 = 0u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_799 == _794)
                                        {
                                            _812 = 1u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_799 == _795)
                                            {
                                                _812 = 2u;
                                                break;
                                            }
                                            else
                                            {
                                                _812 = 3u;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                uint _814 = uint(int(_10._m0[_724]._m7 >> 2u)) + _812;
                                vec4 _836 = _20._m0[_814]._m0 * vec4(_600 + (_761 * (3.5 * (_20._m0[_814]._m4 * sqrt(_758)))), 1.0);
                                vec3 _840 = _836.xyz / vec3(_836.w);
                                vec2 _843 = (_840.xy * 0.5) + vec2(0.5);
                                _843.y = 1.0 - _843.y;
                                float _852 = (_20._m0[_814]._m5.y / _20._m0[_814]._m6) / (_840.z - _20._m0[_814]._m5.x);
                                float _857 = _715 ? _713 : 6.283185482025146484375;
                                float _858 = _676 * _857;
                                vec2 _859 = _20._m0[_814]._m1 + _19._m33;
                                vec2 _862 = (_20._m0[_814]._m1 + vec2(_20._m0[_814]._m2)) - _19._m33;
                                float _864;
                                _864 = 0.0;
                                for (int _867 = 0; _867 < 12; )
                                {
                                    float _872 = float(uint(_867));
                                    float _875 = sqrt(_872 + 0.5) * 0.288675129413604736328125;
                                    float _876 = fma(_872, 2.3999631404876708984375, _858);
                                    vec2 _884 = clamp(fma((vec3(cos(_876), sin(_876), _875).xy * _875) * 2.5, _19._m33, _843), _859, _862);
                                    vec2 _887 = fract(fma(vec2(1.0) / _19._m33, _884, vec2(0.5)));
                                    vec4 _893 = vec4(lessThan(vec4(_852), textureGather(sampler2D(_21, _12), _884)));
                                    float _896 = _887.x;
                                    _864 += clamp(mix(mix(_893.w, _893.z, _896), mix(_893.x, _893.y, _896), _887.y), 0.0, 1.0);
                                    _867++;
                                    continue;
                                }
                                _907 = _857;
                                _908 = _715 ? _715 : true;
                                _909 = mix(1.0, _864 * 0.083333335816860198974609375, spvNMin(_683, _10._m0[_724]._m8));
                            }
                            else
                            {
                                _907 = _713;
                                _908 = _715;
                                _909 = clamp(fma(2.0, _785, 0.5), 0.0, 1.0);
                            }
                            float _910 = (0.079577468335628509521484375 * _783) * _909;
                            vec3 _1213;
                            vec3 _1214;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_724]._m3 < 0.0)
                            {
                                vec3 _1064 = _10._m0[_724]._m1.xyz * (_910 * _6._m0[0u]);
                                float _1065 = dot(_587, _761);
                                float _1066 = clamp(_1065, -1.0, 1.0);
                                float _1068 = clamp(dot(_587, _602), -1.0, 1.0);
                                float _1074 = cos(0.5 * abs(asin(_1068) - asin(_1066)));
                                vec3 _1076 = _761 - (_587 * _1066);
                                vec3 _1078 = _602 - (_587 * _1068);
                                float _1084 = dot(_1076, _1078) * inversesqrt(fma(dot(_1076, _1076), dot(_1078, _1078), 9.9999997473787516355514526367188e-05));
                                float _1087 = sqrt(clamp(fma(0.5, _1084, 0.5), 0.0, 1.0));
                                float _1116 = _635 * _635;
                                vec3 _1121 = vec3(_1116 * (1.41421353816986083984375 * _1087), _1116 * 0.5, _1116 * 2.0);
                                vec3 _1133 = exp((pow(spvNMax(abs(vec3(_1066 + _1068) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _1087, sqrt(fma(-_1068, _1068, 1.0)), (-0.06994284689426422119140625) * _1068), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_1121 * _1121)) / (_1121 * 2.5066282749176025390625);
                                float _1134 = dot(_602, _761);
                                float _1154 = 1.0 / fma(0.36000001430511474609375, _1074, 1.190000057220458984375 / _1074);
                                float _1157 = _1087 * fma(_1154, fma(-0.800000011920928955078125, _1084, 0.60000002384185791015625), 1.0);
                                float _1162 = -_1074;
                                vec3 _1178 = spvNMax(abs(_593), vec3(9.9999997473787516355514526367188e-05));
                                float _1196 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1162, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                vec3 _1212 = fma(_1064, ((((vec3(0.25 * _1087) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _1134, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _588, clamp(-_1134, 0.0, 1.0))) * _1133.x) + (((pow(_1178, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_1157 * _1154), 9.9999997473787516355514526367188e-05), 2.0))) / _1074)) * (exp(fma(-3.650000095367431640625, _1084, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1162, sqrt(clamp(fma(-_1157, _1157, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _588) * _1133.y)) + ((pow(_1178, vec3(0.800000011920928955078125 / _1074)) * (exp(fma(17.0, _1084, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _1196), 9.9999997473787516355514526367188e-05), 2.0) * _1196))) * _1133.z), _708);
                                _1213 = _1212;
                                _1214 = fma(_1064, (sqrt(_593) * ((0.3183098733425140380859375 * mix(clamp((_785 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_1065), 0.3300000131130218505859375)) * _586)) * pow(spvNMax(abs(_593 / vec3(dot(_593, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _909)), _711);
                            }
                            else
                            {
                                vec3 _914 = _10._m0[_724]._m1.xyz * _910;
                                float _915 = dot(_587, _761);
                                float _916 = clamp(_915, -1.0, 1.0);
                                float _918 = clamp(dot(_587, _602), -1.0, 1.0);
                                float _924 = cos(0.5 * abs(asin(_918) - asin(_916)));
                                vec3 _926 = _761 - (_587 * _916);
                                vec3 _928 = _602 - (_587 * _918);
                                float _934 = dot(_926, _928) * inversesqrt(fma(dot(_926, _926), dot(_928, _928), 9.9999997473787516355514526367188e-05));
                                float _937 = sqrt(clamp(fma(0.5, _934, 0.5), 0.0, 1.0));
                                float _966 = _635 * _635;
                                vec3 _971 = vec3(_966 * (1.41421353816986083984375 * _937), _966 * 0.5, _966 * 2.0);
                                vec3 _983 = exp((pow(spvNMax(abs(vec3(_916 + _918) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _937, sqrt(fma(-_918, _918, 1.0)), (-0.06994284689426422119140625) * _918), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_971 * _971)) / (_971 * 2.5066282749176025390625);
                                float _984 = dot(_602, _761);
                                float _1004 = 1.0 / fma(0.36000001430511474609375, _924, 1.190000057220458984375 / _924);
                                float _1007 = _937 * fma(_1004, fma(-0.800000011920928955078125, _934, 0.60000002384185791015625), 1.0);
                                float _1012 = -_924;
                                vec3 _1028 = spvNMax(abs(_593), vec3(9.9999997473787516355514526367188e-05));
                                float _1046 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1012, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                vec3 _1062 = fma(_914, ((((vec3(0.25 * _937) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _984, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _588, clamp(-_984, 0.0, 1.0))) * _983.x) + (((pow(_1028, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_1007 * _1004), 9.9999997473787516355514526367188e-05), 2.0))) / _924)) * (exp(fma(-3.650000095367431640625, _934, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1012, sqrt(clamp(fma(-_1007, _1007, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _588) * _983.y)) + ((pow(_1028, vec3(0.800000011920928955078125 / _924)) * (exp(fma(17.0, _934, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _1046), 9.9999997473787516355514526367188e-05), 2.0) * _1046))) * _983.z), _708);
                                _1213 = _1062;
                                _1214 = fma(_914, (sqrt(_593) * ((0.3183098733425140380859375 * mix(clamp((_785 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_915), 0.3300000131130218505859375)) * _586)) * pow(spvNMax(abs(_593 / vec3(dot(_593, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _909)), _711);
                            }
                            _1215 = _1213;
                            _1216 = _1214;
                            _1217 = _907;
                            _1218 = _908;
                        }
                        else
                        {
                            _1215 = _708;
                            _1216 = _711;
                            _1217 = _713;
                            _1218 = _715;
                        }
                        _709 = _1215;
                        _712 = _1216;
                        _714 = _1217;
                        _716 = _1218;
                    }
                    else
                    {
                        _709 = _708;
                        _712 = _711;
                        _714 = _713;
                        _716 = _715;
                    }
                }
                vec3 _1220;
                vec3 _1223;
                float _1225;
                bool _1227;
                uint _1229;
                _1220 = _708;
                _1223 = _711;
                _1225 = _713;
                _1227 = _715;
                _1229 = _717;
                vec3 _1221;
                vec3 _1224;
                float _1226;
                bool _1228;
                for (; _1229 < _702; _1220 = _1221, _1223 = _1224, _1225 = _1226, _1227 = _1228, _1229++)
                {
                    uint _1236 = uint(_9._m0[_1229]);
                    float _1249 = abs(_10._m0[_1236]._m5);
                    if ((_10._m0[_1236]._m6 & (1u << (_540 & 31u))) != 0u)
                    {
                        vec3 _1267 = _10._m0[_1236]._m0.xyz - _600;
                        float _1268 = dot(_1267, _1267);
                        vec3 _1271 = _1267 * inversesqrt(spvNMax(_1268, 1.0000000133514319600180897396058e-10));
                        float _1272 = _10._m0[_1236]._m0.w * _10._m0[_1236]._m0.w;
                        vec3 _1715;
                        vec3 _1716;
                        float _1717;
                        bool _1718;
                        if (_1268 < (1.0 / _1272))
                        {
                            float _1279 = dot(-_1271, normalize(_10._m0[_1236]._m2.xyz));
                            float _1307;
                            if (_1279 > _10._m0[_1236]._m1.w)
                            {
                                float _1283 = _1268 * _1272;
                                float _1289 = pow(spvNMax(abs(clamp(fma(-_1283, _1283, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _10._m0[_1236]._m4);
                                float _1299;
                                if (_10._m0[_1236]._m5 < 0.0)
                                {
                                    _1299 = _1289 * fma(4.0, _1272, _1249);
                                }
                                else
                                {
                                    _1299 = _1289 * ((1.0 / spvNMax(_1268, 9.9999997473787516355514526367188e-05)) + _1249);
                                }
                                float _1304 = clamp((_1279 - _10._m0[_1236]._m1.w) / spvNMax(_10._m0[_1236]._m2.w - _10._m0[_1236]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _1307 = _1299 * (_1304 * _1304);
                            }
                            else
                            {
                                _1307 = 0.0;
                            }
                            float _1309 = dot(_590, _1271);
                            float _1407;
                            bool _1408;
                            float _1409;
                            if ((_10._m0[_1236]._m7 & 1u) != 0u)
                            {
                                uint _1314 = uint(int(_10._m0[_1236]._m7 >> 2u));
                                vec4 _1336 = _20._m0[_1314]._m0 * vec4(_600 + (_1271 * (3.5 * (_20._m0[_1314]._m4 * sqrt(_1268)))), 1.0);
                                vec3 _1340 = _1336.xyz / vec3(_1336.w);
                                vec2 _1343 = (_1340.xy * 0.5) + vec2(0.5);
                                _1343.y = 1.0 - _1343.y;
                                float _1352 = (_20._m0[_1314]._m5.y / _20._m0[_1314]._m6) / (_1340.z - _20._m0[_1314]._m5.x);
                                float _1357 = _1227 ? _1225 : 6.283185482025146484375;
                                float _1358 = _676 * _1357;
                                vec2 _1359 = _20._m0[_1314]._m1 + _19._m33;
                                vec2 _1362 = (_20._m0[_1314]._m1 + vec2(_20._m0[_1314]._m2)) - _19._m33;
                                float _1364;
                                _1364 = 0.0;
                                for (int _1367 = 0; _1367 < 12; )
                                {
                                    float _1372 = float(uint(_1367));
                                    float _1375 = sqrt(_1372 + 0.5) * 0.288675129413604736328125;
                                    float _1376 = fma(_1372, 2.3999631404876708984375, _1358);
                                    vec2 _1384 = clamp(fma((vec3(cos(_1376), sin(_1376), _1375).xy * _1375) * 2.5, _19._m33, _1343), _1359, _1362);
                                    vec2 _1387 = fract(fma(vec2(1.0) / _19._m33, _1384, vec2(0.5)));
                                    vec4 _1393 = vec4(lessThan(vec4(_1352), textureGather(sampler2D(_21, _12), _1384)));
                                    float _1396 = _1387.x;
                                    _1364 += clamp(mix(mix(_1393.w, _1393.z, _1396), mix(_1393.x, _1393.y, _1396), _1387.y), 0.0, 1.0);
                                    _1367++;
                                    continue;
                                }
                                _1407 = _1357;
                                _1408 = _1227 ? _1227 : true;
                                _1409 = mix(1.0, _1364 * 0.083333335816860198974609375, spvNMin(_683, _10._m0[_1236]._m8));
                            }
                            else
                            {
                                _1407 = _1225;
                                _1408 = _1227;
                                _1409 = clamp(fma(2.0, _1309, 0.5), 0.0, 1.0);
                            }
                            float _1410 = (0.3183098733425140380859375 * _1307) * _1409;
                            vec3 _1713;
                            vec3 _1714;
                            SPIRV_CROSS_BRANCH
                            if (_10._m0[_1236]._m3 < 0.0)
                            {
                                vec3 _1564 = _10._m0[_1236]._m1.xyz * (_1410 * _6._m0[0u]);
                                float _1565 = dot(_587, _1271);
                                float _1566 = clamp(_1565, -1.0, 1.0);
                                float _1568 = clamp(dot(_587, _602), -1.0, 1.0);
                                float _1574 = cos(0.5 * abs(asin(_1568) - asin(_1566)));
                                vec3 _1576 = _1271 - (_587 * _1566);
                                vec3 _1578 = _602 - (_587 * _1568);
                                float _1584 = dot(_1576, _1578) * inversesqrt(fma(dot(_1576, _1576), dot(_1578, _1578), 9.9999997473787516355514526367188e-05));
                                float _1587 = sqrt(clamp(fma(0.5, _1584, 0.5), 0.0, 1.0));
                                float _1616 = _635 * _635;
                                vec3 _1621 = vec3(_1616 * (1.41421353816986083984375 * _1587), _1616 * 0.5, _1616 * 2.0);
                                vec3 _1633 = exp((pow(spvNMax(abs(vec3(_1566 + _1568) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _1587, sqrt(fma(-_1568, _1568, 1.0)), (-0.06994284689426422119140625) * _1568), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_1621 * _1621)) / (_1621 * 2.5066282749176025390625);
                                float _1634 = dot(_602, _1271);
                                float _1654 = 1.0 / fma(0.36000001430511474609375, _1574, 1.190000057220458984375 / _1574);
                                float _1657 = _1587 * fma(_1654, fma(-0.800000011920928955078125, _1584, 0.60000002384185791015625), 1.0);
                                float _1662 = -_1574;
                                vec3 _1678 = spvNMax(abs(_593), vec3(9.9999997473787516355514526367188e-05));
                                float _1696 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1662, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                vec3 _1712 = fma(_1564, ((((vec3(0.25 * _1587) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _1634, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _588, clamp(-_1634, 0.0, 1.0))) * _1633.x) + (((pow(_1678, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_1657 * _1654), 9.9999997473787516355514526367188e-05), 2.0))) / _1574)) * (exp(fma(-3.650000095367431640625, _1584, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1662, sqrt(clamp(fma(-_1657, _1657, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _588) * _1633.y)) + ((pow(_1678, vec3(0.800000011920928955078125 / _1574)) * (exp(fma(17.0, _1584, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _1696), 9.9999997473787516355514526367188e-05), 2.0) * _1696))) * _1633.z), _1220);
                                _1713 = _1712;
                                _1714 = fma(_1564, (sqrt(_593) * ((0.3183098733425140380859375 * mix(clamp((_1309 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_1565), 0.3300000131130218505859375)) * _586)) * pow(spvNMax(abs(_593 / vec3(dot(_593, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1409)), _1223);
                            }
                            else
                            {
                                vec3 _1414 = _10._m0[_1236]._m1.xyz * _1410;
                                float _1415 = dot(_587, _1271);
                                float _1416 = clamp(_1415, -1.0, 1.0);
                                float _1418 = clamp(dot(_587, _602), -1.0, 1.0);
                                float _1424 = cos(0.5 * abs(asin(_1418) - asin(_1416)));
                                vec3 _1426 = _1271 - (_587 * _1416);
                                vec3 _1428 = _602 - (_587 * _1418);
                                float _1434 = dot(_1426, _1428) * inversesqrt(fma(dot(_1426, _1426), dot(_1428, _1428), 9.9999997473787516355514526367188e-05));
                                float _1437 = sqrt(clamp(fma(0.5, _1434, 0.5), 0.0, 1.0));
                                float _1466 = _635 * _635;
                                vec3 _1471 = vec3(_1466 * (1.41421353816986083984375 * _1437), _1466 * 0.5, _1466 * 2.0);
                                vec3 _1483 = exp((pow(spvNMax(abs(vec3(_1416 + _1418) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _1437, sqrt(fma(-_1418, _1418, 1.0)), (-0.06994284689426422119140625) * _1418), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_1471 * _1471)) / (_1471 * 2.5066282749176025390625);
                                float _1484 = dot(_602, _1271);
                                float _1504 = 1.0 / fma(0.36000001430511474609375, _1424, 1.190000057220458984375 / _1424);
                                float _1507 = _1437 * fma(_1504, fma(-0.800000011920928955078125, _1434, 0.60000002384185791015625), 1.0);
                                float _1512 = -_1424;
                                vec3 _1528 = spvNMax(abs(_593), vec3(9.9999997473787516355514526367188e-05));
                                float _1546 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1512, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                vec3 _1562 = fma(_1414, ((((vec3(0.25 * _1437) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _1484, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _588, clamp(-_1484, 0.0, 1.0))) * _1483.x) + (((pow(_1528, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_1507 * _1504), 9.9999997473787516355514526367188e-05), 2.0))) / _1424)) * (exp(fma(-3.650000095367431640625, _1434, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_1512, sqrt(clamp(fma(-_1507, _1507, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _588) * _1483.y)) + ((pow(_1528, vec3(0.800000011920928955078125 / _1424)) * (exp(fma(17.0, _1434, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _1546), 9.9999997473787516355514526367188e-05), 2.0) * _1546))) * _1483.z), _1220);
                                _1713 = _1562;
                                _1714 = fma(_1414, (sqrt(_593) * ((0.3183098733425140380859375 * mix(clamp((_1309 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_1415), 0.3300000131130218505859375)) * _586)) * pow(spvNMax(abs(_593 / vec3(dot(_593, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1409)), _1223);
                            }
                            _1715 = _1713;
                            _1716 = _1714;
                            _1717 = _1407;
                            _1718 = _1408;
                        }
                        else
                        {
                            _1715 = _1220;
                            _1716 = _1223;
                            _1717 = _1225;
                            _1718 = _1227;
                        }
                        _1221 = _1715;
                        _1224 = _1716;
                        _1226 = _1717;
                        _1228 = _1718;
                    }
                    else
                    {
                        _1221 = _1220;
                        _1224 = _1223;
                        _1226 = _1225;
                        _1228 = _1227;
                    }
                }
                vec3 _1720;
                vec3 _1723;
                _1720 = _1220;
                _1723 = _1223;
                vec3 _1721;
                vec3 _1724;
                float _1726;
                bool _1728;
                float _1725 = _1225;
                bool _1727 = _1227;
                uint _1729 = _1229;
                for (; _1729 < _706; _1720 = _1721, _1723 = _1724, _1725 = _1726, _1727 = _1728, _1729++)
                {
                    uint _1736 = uint(_9._m0[_1729]);
                    int _1765 = int(_11._m0[_1736]._m1 >> 1u) - 1;
                    if (((_11._m0[_1736]._m4 & 16777215u) & (1u << (_540 & 31u))) != 0u)
                    {
                        vec3 _1776 = _11._m0[_1736]._m6 * vec4(_600, 1.0);
                        vec3 _2311;
                        vec3 _2312;
                        float _2313;
                        bool _2314;
                        if (all(lessThan(abs(_1776 - vec3(0.5)), vec3(0.5))))
                        {
                            int _1783 = int(_11._m0[_1736]._m4 >> 24u);
                            float _1784 = _1776.z;
                            vec3 _1823;
                            if (_1784 < _11._m0[_1736]._m2.x)
                            {
                                float _1811 = _1784 * _11._m0[_1736]._m2.z;
                                float _1814 = _1811 * _1811;
                                vec3 _1822;
                                _1822.z = dot(_365[_1783], vec4(_1811, _1814, smoothstep(0.0, 1.0, _1811), (_1814 * _1811) * fma(_1811, fma(_1811, 6.0, -15.0), 10.0)));
                                _1823 = _1822;
                            }
                            else
                            {
                                vec3 _1809;
                                if (_1784 > _11._m0[_1736]._m2.y)
                                {
                                    float _1797 = (1.0 - _1784) * _11._m0[_1736]._m2.w;
                                    float _1800 = _1797 * _1797;
                                    vec3 _1808;
                                    _1808.z = dot(_365[_1783], vec4(_1797, _1800, smoothstep(0.0, 1.0, _1797), (_1800 * _1797) * fma(_1797, fma(_1797, 6.0, -15.0), 10.0)));
                                    _1809 = _1808;
                                }
                                else
                                {
                                    _1809 = vec3(0.0, 0.0, 1.0);
                                }
                                _1823 = _1809;
                            }
                            vec2 _1824 = _1776.xy;
                            vec2 _1828 = (vec2(0.5) - abs(_1824 - vec2(0.5))) * _11._m0[_1736]._m3;
                            float _1829 = _1828.x;
                            vec3 _1846;
                            if (_1829 < 1.0)
                            {
                                float _1837 = _1829 * _1829;
                                vec3 _1845 = _1823;
                                _1845.x = dot(_365[_1783], vec4(_1829, _1837, smoothstep(0.0, 1.0, _1829), (_1837 * _1829) * fma(_1829, fma(_1829, 6.0, -15.0), 10.0)));
                                _1846 = _1845;
                            }
                            else
                            {
                                vec3 _1834 = _1823;
                                _1834.x = 1.0;
                                _1846 = _1834;
                            }
                            float _1847 = _1828.y;
                            vec3 _1864;
                            if (_1847 < 1.0)
                            {
                                float _1855 = _1847 * _1847;
                                vec3 _1863 = _1846;
                                _1863.y = dot(_365[_1783], vec4(_1847, _1855, smoothstep(0.0, 1.0, _1847), (_1855 * _1847) * fma(_1847, fma(_1847, 6.0, -15.0), 10.0)));
                                _1864 = _1863;
                            }
                            else
                            {
                                vec3 _1852 = _1846;
                                _1852.y = 1.0;
                                _1864 = _1852;
                            }
                            float _1870 = dot(_590, _11._m0[_1736]._m9);
                            float _1962;
                            bool _1963;
                            float _1964;
                            if ((_11._m0[_1736]._m8 & 1u) != 0u)
                            {
                                uint _1875 = uint(int(_11._m0[_1736]._m8 >> 2u));
                                vec4 _1895 = _20._m0[_1875]._m0 * vec4(_600 + (_11._m0[_1736]._m9 * (3.5 * _20._m0[_1875]._m4)), 1.0);
                                vec2 _1898 = (_1895.xy * 0.5) + vec2(0.5);
                                _1898.y = 1.0 - _1898.y;
                                float _1907 = ((_1895.z - _20._m0[_1875]._m5.y) / _20._m0[_1875]._m5.x) / _20._m0[_1875]._m6;
                                float _1912 = _1727 ? _1725 : 6.283185482025146484375;
                                float _1913 = _676 * _1912;
                                vec2 _1914 = _20._m0[_1875]._m1 + _19._m33;
                                vec2 _1917 = (_20._m0[_1875]._m1 + vec2(_20._m0[_1875]._m2)) - _19._m33;
                                float _1919;
                                _1919 = 0.0;
                                for (int _1922 = 0; _1922 < 12; )
                                {
                                    float _1927 = float(uint(_1922));
                                    float _1930 = sqrt(_1927 + 0.5) * 0.288675129413604736328125;
                                    float _1931 = fma(_1927, 2.3999631404876708984375, _1913);
                                    vec2 _1939 = clamp(fma((vec3(cos(_1931), sin(_1931), _1930).xy * _1930) * 2.5, _19._m33, _1898), _1914, _1917);
                                    vec2 _1942 = fract(fma(vec2(1.0) / _19._m33, _1939, vec2(0.5)));
                                    vec4 _1948 = vec4(lessThan(vec4(_1907), textureGather(sampler2D(_21, _12), _1939)));
                                    float _1951 = _1942.x;
                                    _1919 += clamp(mix(mix(_1948.w, _1948.z, _1951), mix(_1948.x, _1948.y, _1951), _1942.y), 0.0, 1.0);
                                    _1922++;
                                    continue;
                                }
                                _1962 = _1912;
                                _1963 = _1727 ? _1727 : true;
                                _1964 = mix(1.0, _1919 * 0.083333335816860198974609375, spvNMin(_683, _11._m0[_1736]._m5));
                            }
                            else
                            {
                                _1962 = _1725;
                                _1963 = _1727;
                                _1964 = clamp(fma(2.0, _1870, 0.5), 0.0, 1.0);
                            }
                            float _1965 = ((_1864.x * _1864.y) * _1864.z) * _1964;
                            vec3 _2006;
                            if (_1765 >= 0)
                            {
                                uint _1970 = gl_SubgroupInvocationID & 3u;
                                vec2 _1976 = (subgroupQuadSwapHorizontal(_1824) - _1824) * (((_1970 & 1u) != 0u) ? (-1.0) : 1.0);
                                vec2 _1982 = (subgroupQuadSwapVertical(_1824) - _1824) * (((_1970 & 2u) != 0u) ? (-1.0) : 1.0);
                                vec2 _1986 = mix(_1976, vec2(0.0), bvec2(any(isnan(_1976))));
                                vec2 _1990 = mix(_1982, vec2(0.0), bvec2(any(isnan(_1982))));
                                bvec2 _1999 = bvec2(any(greaterThan(abs(vec4(_1986, _1990)), vec4(0.015625))));
                                int _74 = _1765;
                                _2006 = _11._m0[_1736]._m0 * textureGrad(nonuniformEXT(sampler2D(_25[_74], _7)), _1824, mix(_1986, vec2(0.0), _1999), mix(_1990, vec2(0.0), _1999)).xyz;
                            }
                            else
                            {
                                _2006 = _11._m0[_1736]._m0;
                            }
                            vec3 _2309;
                            vec3 _2310;
                            SPIRV_CROSS_BRANCH
                            if ((_11._m0[_1736]._m1 & 1u) != 0u)
                            {
                                vec3 _2160 = _2006 * (_1965 * _6._m0[0u]);
                                float _2161 = dot(_587, _11._m0[_1736]._m9);
                                float _2162 = clamp(_2161, -1.0, 1.0);
                                float _2164 = clamp(dot(_587, _602), -1.0, 1.0);
                                float _2170 = cos(0.5 * abs(asin(_2164) - asin(_2162)));
                                vec3 _2172 = _11._m0[_1736]._m9 - (_587 * _2162);
                                vec3 _2174 = _602 - (_587 * _2164);
                                float _2180 = dot(_2172, _2174) * inversesqrt(fma(dot(_2172, _2172), dot(_2174, _2174), 9.9999997473787516355514526367188e-05));
                                float _2183 = sqrt(clamp(fma(0.5, _2180, 0.5), 0.0, 1.0));
                                float _2212 = _635 * _635;
                                vec3 _2217 = vec3(_2212 * (1.41421353816986083984375 * _2183), _2212 * 0.5, _2212 * 2.0);
                                vec3 _2229 = exp((pow(spvNMax(abs(vec3(_2162 + _2164) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _2183, sqrt(fma(-_2164, _2164, 1.0)), (-0.06994284689426422119140625) * _2164), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_2217 * _2217)) / (_2217 * 2.5066282749176025390625);
                                float _2230 = dot(_602, _11._m0[_1736]._m9);
                                float _2250 = 1.0 / fma(0.36000001430511474609375, _2170, 1.190000057220458984375 / _2170);
                                float _2253 = _2183 * fma(_2250, fma(-0.800000011920928955078125, _2180, 0.60000002384185791015625), 1.0);
                                float _2258 = -_2170;
                                vec3 _2274 = spvNMax(abs(_593), vec3(9.9999997473787516355514526367188e-05));
                                float _2292 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2258, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                vec3 _2308 = fma(_2160, ((((vec3(0.25 * _2183) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _2230, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _588, clamp(-_2230, 0.0, 1.0))) * _2229.x) + (((pow(_2274, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_2253 * _2250), 9.9999997473787516355514526367188e-05), 2.0))) / _2170)) * (exp(fma(-3.650000095367431640625, _2180, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2258, sqrt(clamp(fma(-_2253, _2253, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _588) * _2229.y)) + ((pow(_2274, vec3(0.800000011920928955078125 / _2170)) * (exp(fma(17.0, _2180, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _2292), 9.9999997473787516355514526367188e-05), 2.0) * _2292))) * _2229.z), _1720);
                                _2309 = _2308;
                                _2310 = fma(_2160, (sqrt(_593) * ((0.3183098733425140380859375 * mix(clamp((_1870 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_2161), 0.3300000131130218505859375)) * _586)) * pow(spvNMax(abs(_593 / vec3(dot(_593, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1964)), _1723);
                            }
                            else
                            {
                                vec3 _2010 = _2006 * _1965;
                                float _2011 = dot(_587, _11._m0[_1736]._m9);
                                float _2012 = clamp(_2011, -1.0, 1.0);
                                float _2014 = clamp(dot(_587, _602), -1.0, 1.0);
                                float _2020 = cos(0.5 * abs(asin(_2014) - asin(_2012)));
                                vec3 _2022 = _11._m0[_1736]._m9 - (_587 * _2012);
                                vec3 _2024 = _602 - (_587 * _2014);
                                float _2030 = dot(_2022, _2024) * inversesqrt(fma(dot(_2022, _2022), dot(_2024, _2024), 9.9999997473787516355514526367188e-05));
                                float _2033 = sqrt(clamp(fma(0.5, _2030, 0.5), 0.0, 1.0));
                                float _2062 = _635 * _635;
                                vec3 _2067 = vec3(_2062 * (1.41421353816986083984375 * _2033), _2062 * 0.5, _2062 * 2.0);
                                vec3 _2079 = exp((pow(spvNMax(abs(vec3(_2012 + _2014) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _2033, sqrt(fma(-_2014, _2014, 1.0)), (-0.06994284689426422119140625) * _2014), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_2067 * _2067)) / (_2067 * 2.5066282749176025390625);
                                float _2080 = dot(_602, _11._m0[_1736]._m9);
                                float _2100 = 1.0 / fma(0.36000001430511474609375, _2020, 1.190000057220458984375 / _2020);
                                float _2103 = _2033 * fma(_2100, fma(-0.800000011920928955078125, _2030, 0.60000002384185791015625), 1.0);
                                float _2108 = -_2020;
                                vec3 _2124 = spvNMax(abs(_593), vec3(9.9999997473787516355514526367188e-05));
                                float _2142 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2108, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                                vec3 _2158 = fma(_2010, ((((vec3(0.25 * _2033) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _2080, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _588, clamp(-_2080, 0.0, 1.0))) * _2079.x) + (((pow(_2124, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_2103 * _2100), 9.9999997473787516355514526367188e-05), 2.0))) / _2020)) * (exp(fma(-3.650000095367431640625, _2030, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_2108, sqrt(clamp(fma(-_2103, _2103, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _588) * _2079.y)) + ((pow(_2124, vec3(0.800000011920928955078125 / _2020)) * (exp(fma(17.0, _2030, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _2142), 9.9999997473787516355514526367188e-05), 2.0) * _2142))) * _2079.z), _1720);
                                _2309 = _2158;
                                _2310 = fma(_2010, (sqrt(_593) * ((0.3183098733425140380859375 * mix(clamp((_1870 + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_2011), 0.3300000131130218505859375)) * _586)) * pow(spvNMax(abs(_593 / vec3(dot(_593, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(1.0 - _1964)), _1723);
                            }
                            _2311 = _2309;
                            _2312 = _2310;
                            _2313 = _1962;
                            _2314 = _1963;
                        }
                        else
                        {
                            _2311 = _1720;
                            _2312 = _1723;
                            _2313 = _1725;
                            _2314 = _1727;
                        }
                        _1721 = _2311;
                        _1724 = _2312;
                        _1726 = _2313;
                        _1728 = _2314;
                    }
                    else
                    {
                        _1721 = _1720;
                        _1724 = _1723;
                        _1726 = _1725;
                        _1728 = _1727;
                    }
                }
                _2315 = _1720;
                _2316 = _1723;
            }
            else
            {
                _2315 = vec3(0.0);
                _2316 = vec3(0.0);
            }
            _3366 = _2315;
            _3367 = _2316;
        }
        vec3 _3369 = reflect(-_602, _590);
        float _3370 = dot(_602, _590);
        float _3374;
        if (_550)
        {
            _3374 = abs(_3370);
        }
        else
        {
            _3374 = _3370;
        }
        vec3 _3375 = vec3(_598.x, _598.y, _598.z);
        vec3 _3385 = textureLod(samplerCube(_14, _7), _590, 0.0).xyz * _19._m27;
        float _3388 = fma(_635, 8.0, _19._m30 - 8.0);
        vec3 _3392 = textureLod(samplerCube(_15, _7), _3369, _3388).xyz * _19._m27;
        bool _3395 = _19._m29 > 0.0;
        vec3 _3417;
        vec3 _3418;
        SPIRV_CROSS_BRANCH
        if (_3395)
        {
            vec3 _3407 = vec3(_19._m29);
            _3417 = mix(_3392, textureLod(samplerCube(_17, _7), _3369, fma(_635, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _3407);
            _3418 = mix(_3385, textureLod(samplerCube(_16, _7), _590, 0.0).xyz * _19._m28, _3407);
        }
        else
        {
            _3417 = _3392;
            _3418 = _3385;
        }
        float _3419 = spvNMax(_3374, 0.001953125);
        vec4 _3424 = textureLod(sampler2D(_18, _12), vec2(_3419, _635), 0.0);
        vec3 _3427 = _3418 * (_593 * _3424.z);
        vec3 _3433 = _3417 * ((_3375 * _3424.x) + vec3(_3424.y));
        float _3490;
        vec3 _3491;
        vec3 _3492;
        if (_550)
        {
            vec3 _3436 = -_590;
            float _3438 = abs(dot(_602, _3436));
            vec3 _3439 = -_3369;
            vec3 _3443 = textureLod(samplerCube(_14, _7), _3436, 0.0).xyz * _19._m27;
            vec3 _3447 = textureLod(samplerCube(_15, _7), _3439, _3388).xyz * _19._m27;
            vec3 _3469;
            vec3 _3470;
            SPIRV_CROSS_BRANCH
            if (_3395)
            {
                vec3 _3459 = vec3(_19._m29);
                _3469 = mix(_3447, textureLod(samplerCube(_17, _7), _3439, fma(_635, 8.0, _19._m31 - 8.0)).xyz * _19._m28, _3459);
                _3470 = mix(_3443, textureLod(samplerCube(_16, _7), _3436, 0.0).xyz * _19._m28, _3459);
            }
            else
            {
                _3469 = _3447;
                _3470 = _3443;
            }
            vec4 _3474 = textureLod(sampler2D(_18, _12), vec2(spvNMax(_3438, 0.001953125), _635), 0.0);
            _3490 = _3438;
            _3491 = (_3433 * 0.300000011920928955078125) + ((_3469 * ((_3375 * _3474.x) + vec3(_3474.y))) * 0.699999988079071044921875);
            _3492 = (_3427 * 0.300000011920928955078125) + ((_3470 * (_593 * _3474.z)) * 0.699999988079071044921875);
        }
        else
        {
            _3490 = _3374;
            _3491 = _3433;
            _3492 = _3427;
        }
        uvec4 _3496 = uvec4(_8._m0[uint(_667)]);
        uint _3498 = _3496.y;
        uint _3508 = ((_3496.z >> 0u) & 1023u) + (((_3498 >> 12u) & 4095u) + (((_3498 >> 0u) & 4095u) + _3496.x));
        uint _3510 = (_3498 >> 24u) + _3508;
        vec3 _3512;
        vec3 _3515;
        _3512 = _3491;
        _3515 = _3492;
        vec3 _3513;
        vec3 _3516;
        for (uint _3517 = _3508; _3517 < _3510; _3512 = _3513, _3515 = _3516, _3517++)
        {
            uint _3524 = uint(_9._m0[_3517]);
            int _3543 = int((_13._m0[_3524]._m5 >> 1u) & 3u);
            mat3 _3547 = mat3(_13._m0[_3524]._m1[0], _13._m0[_3524]._m1[1], _13._m0[_3524]._m1[2]);
            int _3553 = (int((_13._m0[_3524]._m5 >> 3u) & 16383u) - 1) * 2;
            int _3558 = (int((_13._m0[_3524]._m5 >> 17u) & 16383u) - 1) * 2;
            int _3563 = (int((_13._m0[_3524]._m6 >> 0u) & 65535u) - 1) * 2;
            int _3568 = (int((_13._m0[_3524]._m6 >> 16u) & 65535u) - 1) * 2;
            float _3571 = (_13._m0[_3524]._m3 < 0.0) ? (-_13._m0[_3524]._m3) : 1.0;
            vec3 _3573 = _3547 * (_600 - _13._m0[_3524]._m1[3]);
            bool _3574 = int(_13._m0[_3524]._m5 & 1u) == 1;
            vec3 _3575 = abs(_3573);
            float _3578 = dot(_3573, _3573);
            if (_3574 ? any(greaterThanEqual(_3575, _13._m0[_3524]._m0.xyz)) : (_3578 >= _13._m0[_3524]._m0.y))
            {
                _3513 = _3512;
                _3516 = _3515;
                continue;
            }
            vec3 _3920;
            SPIRV_CROSS_FLATTEN
            if ((_3543 & 1) != 0)
            {
                vec3 _3588 = _3547 * _590;
                vec2 _3677;
                bool _3678;
                if (_3574)
                {
                    vec2 _3672;
                    bool _3676;
                    do
                    {
                        vec3 _3656 = (_13._m0[_3524]._m0.xyz - _3573) / _3588;
                        vec3 _3659 = ((-_13._m0[_3524]._m0.xyz) - _3573) / _3588;
                        vec3 _3660 = spvNMin(_3656, _3659);
                        vec3 _3661 = spvNMax(_3656, _3659);
                        float _3666 = spvNMax(_3660.x, spvNMax(_3660.y, _3660.z));
                        float _3671 = spvNMin(_3661.x, spvNMin(_3661.y, _3661.z));
                        _3672 = vec2(_3666, _3671);
                        if (_3666 > _3671)
                        {
                            _3676 = false;
                            break;
                        }
                        _3676 = true;
                        break;
                    } while(false);
                    _3677 = _3672;
                    _3678 = _3676;
                }
                else
                {
                    vec2 _3651;
                    bool _3652;
                    do
                    {
                        float _3594 = dot(_3588, _3588);
                        float _3595 = dot(_3588, _3573);
                        float _3596 = 2.0 * _3595;
                        float _3597 = _3578 - _13._m0[_3524]._m0.y;
                        float _3633;
                        float _3634;
                        bool _3635;
                        do
                        {
                            float _3603 = fma(_3596, _3596, -((4.0 * _3594) * _3597));
                            float _3631;
                            float _3632;
                            if (_3603 < 0.0)
                            {
                                _3633 = 0.0;
                                _3634 = 0.0;
                                _3635 = false;
                                break;
                            }
                            else
                            {
                                if (_3603 == 0.0)
                                {
                                    float _3630 = (_3595 * (-1.0)) * (1.0 / _3594);
                                    _3631 = _3630;
                                    _3632 = _3630;
                                }
                                else
                                {
                                    float _3623;
                                    if (_3596 > 0.0)
                                    {
                                        _3623 = (-0.5) * fma(2.0, _3595, sqrt(_3603));
                                    }
                                    else
                                    {
                                        _3623 = (-0.5) * fma(2.0, _3595, -sqrt(_3603));
                                    }
                                    _3631 = _3597 * (1.0 / _3623);
                                    _3632 = _3623 * (1.0 / _3594);
                                }
                            }
                            _3633 = _3631;
                            _3634 = _3632;
                            _3635 = true;
                            break;
                        } while(false);
                        if (!_3635)
                        {
                            _3651 = vec2(0.0);
                            _3652 = false;
                            break;
                        }
                        if ((_3634 < 0.0) && (_3633 < 0.0))
                        {
                            _3651 = vec2(0.0);
                            _3652 = false;
                            break;
                        }
                        vec2 _3650;
                        if (_3634 > _3633)
                        {
                            _3650 = vec2(_3633, _3634);
                        }
                        else
                        {
                            _3650 = vec2(_3634, _3633);
                        }
                        _3651 = _3650;
                        _3652 = true;
                        break;
                    } while(false);
                    _3677 = _3651;
                    _3678 = _3652;
                }
                vec3 _3681 = _3573 + (_3588 * _3677.y);
                float _3702;
                if (_3574)
                {
                    _3702 = 1.0 - clamp(length(spvNMax(_3575 - (_13._m0[_3524]._m0.xyz - vec3(_13._m0[_3524]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3702 = clamp((_13._m0[_3524]._m0.x - length(_3573)) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3705 = float(_3678) * smoothstep(0.0, 1.0, _3702);
                vec4 _3747;
                SPIRV_CROSS_BRANCH
                if (_3705 > 9.9999997473787516355514526367188e-05)
                {
                    float _3714 = mix(clamp((_3677.y * (1.0 / length(_3681))) * _635, 0.0, _635), _635, _635);
                    vec3 _3716 = mix(_3681, _3588, vec3(_3714));
                    int _82 = _3553;
                    vec4 _3717 = textureLod(nonuniformEXT(samplerCube(_24[_82], _7)), _3716, 0.0);
                    int _86 = _3553 + 1;
                    _3717.w = textureLod(nonuniformEXT(samplerCube(_24[_86], _7)), _3716, 0.0).x;
                    vec4 _3732;
                    SPIRV_CROSS_BRANCH
                    if (_3558 >= 0)
                    {
                        int _90 = _3558;
                        vec4 _3725 = textureLod(nonuniformEXT(samplerCube(_24[_90], _7)), _3716, 0.0);
                        int _94 = _3558 + 1;
                        _3725.w = textureLod(nonuniformEXT(samplerCube(_24[_94], _7)), _3716, 0.0).x;
                        _3732 = mix(_3717, _3725, vec4(_13._m0[_3524]._m3));
                    }
                    else
                    {
                        _3732 = _3717;
                    }
                    vec4 _3733 = _3732 * _3571;
                    vec3 _3742 = (_3733.xyz * _13._m0[_3524]._m4).xyz * (_593 * textureLod(sampler2D(_18, _12), vec2(_3419, _3714), 0.0).z);
                    vec4 _3743 = vec4(_3742.x, _3742.y, _3742.z, _3733.w);
                    _3743.w = _3733.w * _3705;
                    _3747 = _3743;
                }
                else
                {
                    _3747 = vec4(0.0);
                }
                vec4 _3915;
                if (_550)
                {
                    vec3 _3751 = _3547 * (-_590);
                    vec2 _3840;
                    bool _3841;
                    if (_3574)
                    {
                        vec2 _3835;
                        bool _3839;
                        do
                        {
                            vec3 _3819 = (_13._m0[_3524]._m0.xyz - _3573) / _3751;
                            vec3 _3822 = ((-_13._m0[_3524]._m0.xyz) - _3573) / _3751;
                            vec3 _3823 = spvNMin(_3819, _3822);
                            vec3 _3824 = spvNMax(_3819, _3822);
                            float _3829 = spvNMax(_3823.x, spvNMax(_3823.y, _3823.z));
                            float _3834 = spvNMin(_3824.x, spvNMin(_3824.y, _3824.z));
                            _3835 = vec2(_3829, _3834);
                            if (_3829 > _3834)
                            {
                                _3839 = false;
                                break;
                            }
                            _3839 = true;
                            break;
                        } while(false);
                        _3840 = _3835;
                        _3841 = _3839;
                    }
                    else
                    {
                        vec2 _3814;
                        bool _3815;
                        do
                        {
                            float _3757 = dot(_3751, _3751);
                            float _3758 = dot(_3751, _3573);
                            float _3759 = 2.0 * _3758;
                            float _3760 = _3578 - _13._m0[_3524]._m0.y;
                            float _3796;
                            float _3797;
                            bool _3798;
                            do
                            {
                                float _3766 = fma(_3759, _3759, -((4.0 * _3757) * _3760));
                                float _3794;
                                float _3795;
                                if (_3766 < 0.0)
                                {
                                    _3796 = 0.0;
                                    _3797 = 0.0;
                                    _3798 = false;
                                    break;
                                }
                                else
                                {
                                    if (_3766 == 0.0)
                                    {
                                        float _3793 = (_3758 * (-1.0)) * (1.0 / _3757);
                                        _3794 = _3793;
                                        _3795 = _3793;
                                    }
                                    else
                                    {
                                        float _3786;
                                        if (_3759 > 0.0)
                                        {
                                            _3786 = (-0.5) * fma(2.0, _3758, sqrt(_3766));
                                        }
                                        else
                                        {
                                            _3786 = (-0.5) * fma(2.0, _3758, -sqrt(_3766));
                                        }
                                        _3794 = _3760 * (1.0 / _3786);
                                        _3795 = _3786 * (1.0 / _3757);
                                    }
                                }
                                _3796 = _3794;
                                _3797 = _3795;
                                _3798 = true;
                                break;
                            } while(false);
                            if (!_3798)
                            {
                                _3814 = vec2(0.0);
                                _3815 = false;
                                break;
                            }
                            if ((_3797 < 0.0) && (_3796 < 0.0))
                            {
                                _3814 = vec2(0.0);
                                _3815 = false;
                                break;
                            }
                            vec2 _3813;
                            if (_3797 > _3796)
                            {
                                _3813 = vec2(_3796, _3797);
                            }
                            else
                            {
                                _3813 = vec2(_3797, _3796);
                            }
                            _3814 = _3813;
                            _3815 = true;
                            break;
                        } while(false);
                        _3840 = _3814;
                        _3841 = _3815;
                    }
                    vec3 _3844 = _3573 + (_3751 * _3840.y);
                    float _3865;
                    if (_3574)
                    {
                        _3865 = 1.0 - clamp(length(spvNMax(_3575 - (_13._m0[_3524]._m0.xyz - vec3(_13._m0[_3524]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    else
                    {
                        _3865 = clamp((_13._m0[_3524]._m0.x - length(_3573)) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    float _3868 = float(_3841) * smoothstep(0.0, 1.0, _3865);
                    vec4 _3911;
                    SPIRV_CROSS_BRANCH
                    if (_3868 > 9.9999997473787516355514526367188e-05)
                    {
                        float _3877 = mix(clamp((_3840.y * (1.0 / length(_3844))) * _635, 0.0, _635), _635, _635);
                        vec3 _3879 = mix(_3844, _3751, vec3(_3877));
                        int _98 = _3553;
                        vec4 _3880 = textureLod(nonuniformEXT(samplerCube(_24[_98], _7)), _3879, 0.0);
                        int _102 = _3553 + 1;
                        _3880.w = textureLod(nonuniformEXT(samplerCube(_24[_102], _7)), _3879, 0.0).x;
                        vec4 _3895;
                        SPIRV_CROSS_BRANCH
                        if (_3558 >= 0)
                        {
                            int _106 = _3558;
                            vec4 _3888 = textureLod(nonuniformEXT(samplerCube(_24[_106], _7)), _3879, 0.0);
                            int _110 = _3558 + 1;
                            _3888.w = textureLod(nonuniformEXT(samplerCube(_24[_110], _7)), _3879, 0.0).x;
                            _3895 = mix(_3880, _3888, vec4(_13._m0[_3524]._m3));
                        }
                        else
                        {
                            _3895 = _3880;
                        }
                        vec4 _3896 = _3895 * _3571;
                        vec3 _3906 = (_3896.xyz * _13._m0[_3524]._m4).xyz * (_593 * textureLod(sampler2D(_18, _12), vec2(spvNMax(_3490, 0.001953125), _3877), 0.0).z);
                        vec4 _3907 = vec4(_3906.x, _3906.y, _3906.z, _3896.w);
                        _3907.w = _3896.w * _3868;
                        _3911 = _3907;
                    }
                    else
                    {
                        _3911 = vec4(0.0);
                    }
                    _3915 = (_3747 * 0.300000011920928955078125) + (_3911 * 0.699999988079071044921875);
                }
                else
                {
                    _3915 = _3747;
                }
                _3920 = mix(_3515, _3915.xyz, vec3(_3915.w));
            }
            else
            {
                _3920 = _3515;
            }
            vec3 _4277;
            SPIRV_CROSS_FLATTEN
            if ((_3543 & 2) != 0)
            {
                vec3 _3925 = _3547 * _3369;
                vec2 _4014;
                bool _4015;
                if (_3574)
                {
                    vec2 _4009;
                    bool _4013;
                    do
                    {
                        vec3 _3993 = (_13._m0[_3524]._m0.xyz - _3573) / _3925;
                        vec3 _3996 = ((-_13._m0[_3524]._m0.xyz) - _3573) / _3925;
                        vec3 _3997 = spvNMin(_3993, _3996);
                        vec3 _3998 = spvNMax(_3993, _3996);
                        float _4003 = spvNMax(_3997.x, spvNMax(_3997.y, _3997.z));
                        float _4008 = spvNMin(_3998.x, spvNMin(_3998.y, _3998.z));
                        _4009 = vec2(_4003, _4008);
                        if (_4003 > _4008)
                        {
                            _4013 = false;
                            break;
                        }
                        _4013 = true;
                        break;
                    } while(false);
                    _4014 = _4009;
                    _4015 = _4013;
                }
                else
                {
                    vec2 _3988;
                    bool _3989;
                    do
                    {
                        float _3931 = dot(_3925, _3925);
                        float _3932 = dot(_3925, _3573);
                        float _3933 = 2.0 * _3932;
                        float _3934 = _3578 - _13._m0[_3524]._m0.y;
                        float _3970;
                        float _3971;
                        bool _3972;
                        do
                        {
                            float _3940 = fma(_3933, _3933, -((4.0 * _3931) * _3934));
                            float _3968;
                            float _3969;
                            if (_3940 < 0.0)
                            {
                                _3970 = 0.0;
                                _3971 = 0.0;
                                _3972 = false;
                                break;
                            }
                            else
                            {
                                if (_3940 == 0.0)
                                {
                                    float _3967 = (_3932 * (-1.0)) * (1.0 / _3931);
                                    _3968 = _3967;
                                    _3969 = _3967;
                                }
                                else
                                {
                                    float _3960;
                                    if (_3933 > 0.0)
                                    {
                                        _3960 = (-0.5) * fma(2.0, _3932, sqrt(_3940));
                                    }
                                    else
                                    {
                                        _3960 = (-0.5) * fma(2.0, _3932, -sqrt(_3940));
                                    }
                                    _3968 = _3934 * (1.0 / _3960);
                                    _3969 = _3960 * (1.0 / _3931);
                                }
                            }
                            _3970 = _3968;
                            _3971 = _3969;
                            _3972 = true;
                            break;
                        } while(false);
                        if (!_3972)
                        {
                            _3988 = vec2(0.0);
                            _3989 = false;
                            break;
                        }
                        if ((_3971 < 0.0) && (_3970 < 0.0))
                        {
                            _3988 = vec2(0.0);
                            _3989 = false;
                            break;
                        }
                        vec2 _3987;
                        if (_3971 > _3970)
                        {
                            _3987 = vec2(_3970, _3971);
                        }
                        else
                        {
                            _3987 = vec2(_3971, _3970);
                        }
                        _3988 = _3987;
                        _3989 = true;
                        break;
                    } while(false);
                    _4014 = _3988;
                    _4015 = _3989;
                }
                vec3 _4018 = _3573 + (_3925 * _4014.y);
                float _4039;
                if (_3574)
                {
                    _4039 = 1.0 - clamp(length(spvNMax(_3575 - (_13._m0[_3524]._m0.xyz - vec3(_13._m0[_3524]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _4039 = clamp((_13._m0[_3524]._m0.x - length(_3573)) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _4042 = float(_4015) * smoothstep(0.0, 1.0, _4039);
                vec4 _4094;
                SPIRV_CROSS_BRANCH
                if (_4042 > 9.9999997473787516355514526367188e-05)
                {
                    float _4051 = mix(clamp((_4014.y * (1.0 / length(_4018))) * _635, 0.0, _635), _635, _635);
                    vec3 _4053 = mix(_4018, _3925, vec3(_4051));
                    float _4054 = _4051 * 8.0;
                    int _114 = _3563;
                    int _118 = _3563 + 1;
                    vec4 _4062 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_114], _7)), _4053, _4054).xyz, textureLod(nonuniformEXT(samplerCube(_24[_118], _7)), _4053, _4054).x);
                    vec4 _4076;
                    SPIRV_CROSS_BRANCH
                    if (_3568 >= 0)
                    {
                        int _122 = _3568;
                        int _126 = _3568 + 1;
                        _4076 = mix(_4062, vec4(textureLod(nonuniformEXT(samplerCube(_24[_122], _7)), _4053, _4054).xyz, textureLod(nonuniformEXT(samplerCube(_24[_126], _7)), _4053, _4054).x), vec4(_13._m0[_3524]._m3));
                    }
                    else
                    {
                        _4076 = _4062;
                    }
                    vec4 _4077 = _4076 * _3571;
                    vec4 _4082 = textureLod(sampler2D(_18, _12), vec2(_3419, _4051), 0.0);
                    vec3 _4089 = (_4077.xyz * _13._m0[_3524]._m4).xyz * ((_3375 * _4082.x) + vec3(_4082.y));
                    vec4 _4090 = vec4(_4089.x, _4089.y, _4089.z, _4077.w);
                    _4090.w = _4077.w * _4042;
                    _4094 = _4090;
                }
                else
                {
                    _4094 = vec4(0.0);
                }
                vec4 _4272;
                if (_550)
                {
                    vec3 _4098 = _3547 * (-_3369);
                    vec2 _4187;
                    bool _4188;
                    if (_3574)
                    {
                        vec2 _4182;
                        bool _4186;
                        do
                        {
                            vec3 _4166 = (_13._m0[_3524]._m0.xyz - _3573) / _4098;
                            vec3 _4169 = ((-_13._m0[_3524]._m0.xyz) - _3573) / _4098;
                            vec3 _4170 = spvNMin(_4166, _4169);
                            vec3 _4171 = spvNMax(_4166, _4169);
                            float _4176 = spvNMax(_4170.x, spvNMax(_4170.y, _4170.z));
                            float _4181 = spvNMin(_4171.x, spvNMin(_4171.y, _4171.z));
                            _4182 = vec2(_4176, _4181);
                            if (_4176 > _4181)
                            {
                                _4186 = false;
                                break;
                            }
                            _4186 = true;
                            break;
                        } while(false);
                        _4187 = _4182;
                        _4188 = _4186;
                    }
                    else
                    {
                        vec2 _4161;
                        bool _4162;
                        do
                        {
                            float _4104 = dot(_4098, _4098);
                            float _4105 = dot(_4098, _3573);
                            float _4106 = 2.0 * _4105;
                            float _4107 = _3578 - _13._m0[_3524]._m0.y;
                            float _4143;
                            float _4144;
                            bool _4145;
                            do
                            {
                                float _4113 = fma(_4106, _4106, -((4.0 * _4104) * _4107));
                                float _4141;
                                float _4142;
                                if (_4113 < 0.0)
                                {
                                    _4143 = 0.0;
                                    _4144 = 0.0;
                                    _4145 = false;
                                    break;
                                }
                                else
                                {
                                    if (_4113 == 0.0)
                                    {
                                        float _4140 = (_4105 * (-1.0)) * (1.0 / _4104);
                                        _4141 = _4140;
                                        _4142 = _4140;
                                    }
                                    else
                                    {
                                        float _4133;
                                        if (_4106 > 0.0)
                                        {
                                            _4133 = (-0.5) * fma(2.0, _4105, sqrt(_4113));
                                        }
                                        else
                                        {
                                            _4133 = (-0.5) * fma(2.0, _4105, -sqrt(_4113));
                                        }
                                        _4141 = _4107 * (1.0 / _4133);
                                        _4142 = _4133 * (1.0 / _4104);
                                    }
                                }
                                _4143 = _4141;
                                _4144 = _4142;
                                _4145 = true;
                                break;
                            } while(false);
                            if (!_4145)
                            {
                                _4161 = vec2(0.0);
                                _4162 = false;
                                break;
                            }
                            if ((_4144 < 0.0) && (_4143 < 0.0))
                            {
                                _4161 = vec2(0.0);
                                _4162 = false;
                                break;
                            }
                            vec2 _4160;
                            if (_4144 > _4143)
                            {
                                _4160 = vec2(_4143, _4144);
                            }
                            else
                            {
                                _4160 = vec2(_4144, _4143);
                            }
                            _4161 = _4160;
                            _4162 = true;
                            break;
                        } while(false);
                        _4187 = _4161;
                        _4188 = _4162;
                    }
                    vec3 _4191 = _3573 + (_4098 * _4187.y);
                    float _4212;
                    if (_3574)
                    {
                        _4212 = 1.0 - clamp(length(spvNMax(_3575 - (_13._m0[_3524]._m0.xyz - vec3(_13._m0[_3524]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    else
                    {
                        _4212 = clamp((_13._m0[_3524]._m0.x - length(_3573)) * (1.0 / spvNMax(_13._m0[_3524]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                    }
                    float _4215 = float(_4188) * smoothstep(0.0, 1.0, _4212);
                    vec4 _4268;
                    SPIRV_CROSS_BRANCH
                    if (_4215 > 9.9999997473787516355514526367188e-05)
                    {
                        float _4224 = mix(clamp((_4187.y * (1.0 / length(_4191))) * _635, 0.0, _635), _635, _635);
                        vec3 _4226 = mix(_4191, _4098, vec3(_4224));
                        float _4227 = _4224 * 8.0;
                        int _130 = _3563;
                        int _134 = _3563 + 1;
                        vec4 _4235 = vec4(textureLod(nonuniformEXT(samplerCube(_24[_130], _7)), _4226, _4227).xyz, textureLod(nonuniformEXT(samplerCube(_24[_134], _7)), _4226, _4227).x);
                        vec4 _4249;
                        SPIRV_CROSS_BRANCH
                        if (_3568 >= 0)
                        {
                            int _138 = _3568;
                            int _142 = _3568 + 1;
                            _4249 = mix(_4235, vec4(textureLod(nonuniformEXT(samplerCube(_24[_138], _7)), _4226, _4227).xyz, textureLod(nonuniformEXT(samplerCube(_24[_142], _7)), _4226, _4227).x), vec4(_13._m0[_3524]._m3));
                        }
                        else
                        {
                            _4249 = _4235;
                        }
                        vec4 _4250 = _4249 * _3571;
                        vec4 _4256 = textureLod(sampler2D(_18, _12), vec2(spvNMax(_3490, 0.001953125), _4224), 0.0);
                        vec3 _4263 = (_4250.xyz * _13._m0[_3524]._m4).xyz * ((_3375 * _4256.x) + vec3(_4256.y));
                        vec4 _4264 = vec4(_4263.x, _4263.y, _4263.z, _4250.w);
                        _4264.w = _4250.w * _4215;
                        _4268 = _4264;
                    }
                    else
                    {
                        _4268 = vec4(0.0);
                    }
                    _4272 = (_4094 * 0.300000011920928955078125) + (_4268 * 0.699999988079071044921875);
                }
                else
                {
                    _4272 = _4094;
                }
                _4277 = mix(_3512, _4272.xyz, vec3(_4272.w));
            }
            else
            {
                _4277 = _3512;
            }
            _3513 = _4277;
            _3516 = _3920;
        }
        float _4278 = _6._m0[0u] * 100.0;
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_3418, _635);
            _3512 *= rdx_mod;
            _3515 *= rdx_mod;
        }
        bool _4283 = _26._m19 > 0.0;
        vec3 _4344;
        SPIRV_CROSS_BRANCH
        if (_4283 && (_26._m35 == 0.0))
        {
            vec3 _4297 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            float _4298 = length(_4297);
            vec3 _4309;
            float _4310;
            if (_4298 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _4307 = _4297;
                _4307.z = _4297.z + _29._m0;
                _4309 = _4307;
                _4310 = length(_4307);
            }
            else
            {
                _4309 = _4297;
                _4310 = _4298;
            }
            float _4313 = dot(_4309 / vec3(_4310), _26._m36);
            float _4314 = _29._m0 / _4310;
            _4344 = (mix(textureLod(sampler2D(_30, _7), vec2(atan((_4313 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_4310 - _29._m0) / (_29._m1 - _29._m0))), 0.0).xyz, vec3(0.0), bvec3(_4313 < (-sqrt(fma(-_4314, _4314, 1.0))))) * 1.0) * (_26._m34 * _26._m20);
        }
        else
        {
            _4344 = _26._m2;
        }
        float _4357 = texelFetch(_41, ivec3(int(_670), int(_671), 0).xy, 0).x;
        float _4442;
        SPIRV_CROSS_BRANCH
        if (_26._m21 > 0.0)
        {
            vec3 _4381 = _27._m6 + _600;
            vec3 _4388 = vec3(0.0, _26._m18.z, 0.0) + (_4381 - vec3(0.0, _26._m25, 0.0));
            float _4392 = dot(_4388, _26._m24);
            vec2 _4402 = ((((_4388 + (_26._m24 * (sqrt(fma(_4392, _4392, fma(_26._m18.z, _26._m18.z, -dot(_4388, _4388)))) - _4392))).xz * _26._m18.w) * 0.5) + vec2(0.5)) + _26._m18.xy;
            _4402.x = 1.0 - _4402.x;
            vec3 _4415 = vec3(0.0, _26._m23.z, 0.0) + (_4381 - vec3(0.0, _26._m27, 0.0));
            float _4419 = dot(_4415, _26._m26);
            vec2 _4429 = ((((_4415 + (_26._m26 * (sqrt(fma(_4419, _4419, fma(_26._m23.z, _26._m23.z, -dot(_4415, _4415)))) - _4419))).xz * _26._m23.w) * 0.5) + vec2(0.5)) + _26._m23.xy;
            _4429.x = 1.0 - _4429.x;
            _4442 = _4357 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_32, _7), _4402, 0.0).x, textureLod(sampler2D(_33, _7), _4429, 0.0).x, _26._m16)) * _26._m21, 0.0, 1.0));
        }
        else
        {
            _4442 = _4357;
        }
        float _4532;
        SPIRV_CROSS_BRANCH
        if (_26._m17 > 0.0)
        {
            vec3 _4470 = _27._m6 + _600;
            vec3 _4478 = vec3(0.0, _26._m28.z, 0.0) + ((_26._m29 + _4470) - vec3(0.0, _26._m30, 0.0));
            float _4482 = dot(_4478, _26._m24);
            vec2 _4492 = ((((_4478 + (_26._m24 * (sqrt(fma(_4482, _4482, fma(_26._m28.z, _26._m28.z, -dot(_4478, _4478)))) - _4482))).xz * _26._m28.w) * 0.5) + vec2(0.5)) + _26._m28.xy;
            _4492.x = 1.0 - _4492.x;
            vec3 _4506 = vec3(0.0, _26._m31.z, 0.0) + ((_26._m32 + _4470) - vec3(0.0, _26._m33, 0.0));
            float _4510 = dot(_4506, _26._m26);
            vec2 _4520 = ((((_4506 + (_26._m26 * (sqrt(fma(_4510, _4510, fma(_26._m31.z, _26._m31.z, -dot(_4506, _4506)))) - _4510))).xz * _26._m31.w) * 0.5) + vec2(0.5)) + _26._m31.xy;
            _4520.x = 1.0 - _4520.x;
            _4532 = _4442 * (1.0 - clamp(mix(textureLod(sampler2D(_22, _7), _4492, 0.0).x, textureLod(sampler2D(_23, _7), _4520, 0.0).x, _26._m16) * _26._m17, 0.0, 1.0));
        }
        else
        {
            _4532 = _4442;
        }
        vec3 _4534 = _4344 * (_4532 * _6._m0[0u]);
        vec3 _4787;
        vec3 _4788;
        SPIRV_CROSS_BRANCH
        if (_684)
        {
            vec3 _4697 = reflect(_602, _590);
            float _4699 = spvNMax(dot(_590, _602), 9.9999997473787516355514526367188e-06);
            float _4703 = clamp(dot(_26._m0, normalize(_602 + _26._m0)), 0.0, 1.0);
            float _4705 = clamp(dot(_590, _26._m0), 0.0, 1.0);
            vec3 _4712 = vec3(fma((2.0 * _4703) * _4703, _635, mix(0.0, 0.5, _635))) - vec3(1.0);
            float _4731 = dot(_26._m0, _4697);
            vec3 _4741 = mix(_4697, normalize((_26._m0 * 0.999989449977874755859375) + (normalize(_4697 - (_26._m0 * _4731)) * 0.0045900647528469562530517578125)), bvec3(_4731 < 0.999989449977874755859375));
            vec3 _4743 = normalize(_602 + _4741);
            float _4747 = clamp(dot(_590, _4743), 0.0, 1.0);
            float _4749 = clamp(dot(_590, _4741), 0.0, 1.0);
            float _4751 = (_635 + 1.0) * 0.5;
            float _4752 = _635 * _635;
            float _4760 = _4751 * _4751;
            float _4772 = _4752 * _4752;
            float _4775 = fma(fma(_4747, _4772, -_4747), _4747, 1.0);
            _4787 = _3366 + ((_4534 * ((_598 + ((vec3(1.0) - _598) * pow(spvNMax(abs(1.0 - clamp(dot(_4741, _4743), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_4749, sqrt(fma(fma(-_4699, _4760, _4699), _4699, _4760)), _4699 * sqrt(fma(fma(-_4749, _4760, _4749), _4749, _4760)))) * (_4772 * (0.3183098733425140380859375 / (_4775 * _4775)))))) * _4705);
            _4788 = _3367 + ((_4534 * (_593 * (0.3183098733425140380859375 * (((vec3(1.0) + (_4712 * pow(spvNMax(abs(1.0 - _4705), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_4712 * pow(spvNMax(abs(1.0 - _4699), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _635))))) * _4705);
        }
        else
        {
            vec3 _4693;
            vec3 _4694;
            if (_550)
            {
                float _4543 = dot(_587, _26._m0);
                float _4544 = clamp(_4543, -1.0, 1.0);
                float _4546 = clamp(dot(_587, _602), -1.0, 1.0);
                float _4552 = cos(0.5 * abs(asin(_4546) - asin(_4544)));
                vec3 _4554 = _26._m0 - (_587 * _4544);
                vec3 _4556 = _602 - (_587 * _4546);
                float _4562 = dot(_4554, _4556) * inversesqrt(fma(dot(_4554, _4554), dot(_4556, _4556), 9.9999997473787516355514526367188e-05));
                float _4565 = sqrt(clamp(fma(0.5, _4562, 0.5), 0.0, 1.0));
                float _4595 = _635 * _635;
                vec3 _4600 = vec3(_4595 * (1.41421353816986083984375 * _4565), _4595 * 0.5, _4595 * 2.0);
                vec3 _4612 = exp((pow(spvNMax(abs(vec3(_4544 + _4546) - vec3((-0.1398856937885284423828125) * fma(0.997551023960113525390625 * _4565, sqrt(fma(-_4546, _4546, 1.0)), (-0.06994284689426422119140625) * _4546), 0.0350000001490116119384765625, 0.14000000059604644775390625)), vec3(9.9999997473787516355514526367188e-05)), vec3(2.0)) * (-0.5)) / (_4600 * _4600)) / (_4600 * 2.5066282749176025390625);
                float _4613 = dot(_602, _26._m0);
                float _4633 = 1.0 / fma(0.36000001430511474609375, _4552, 1.190000057220458984375 / _4552);
                float _4636 = _4565 * fma(_4633, fma(-0.800000011920928955078125, _4562, 0.60000002384185791015625), 1.0);
                float _4641 = -_4552;
                vec3 _4657 = spvNMax(abs(_593), vec3(9.9999997473787516355514526367188e-05));
                float _4675 = fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4641, 0.5, 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625);
                vec3 _4692 = fma(_4534, ((((vec3(0.25 * _4565) * fma(0.95347940921783447265625, pow(spvNMax(abs(1.0 - sqrt(clamp(fma(0.5, _4613, 0.5), 0.0, 1.0))), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)) * mix(1.0, _588, clamp(-_4613, 0.0, 1.0))) * _4612.x) + (((pow(_4657, vec3((0.5 * sqrt(1.0 - pow(spvNMax(abs(_4636 * _4633), 9.9999997473787516355514526367188e-05), 2.0))) / _4552)) * (exp(fma(-3.650000095367431640625, _4562, -3.980000019073486328125)) * pow(spvNMax(abs(1.0 - fma(0.95347940921783447265625, pow(spvNMax(abs(fma(_4641, sqrt(clamp(fma(-_4636, _4636, 1.0), 0.0, 1.0)), 1.0)), 9.9999997473787516355514526367188e-05), 5.0), 0.046520568430423736572265625)), 9.9999997473787516355514526367188e-05), 2.0))) * _588) * _4612.y)) + ((pow(_4657, vec3(0.800000011920928955078125 / _4552)) * (exp(fma(17.0, _4562, -16.7800006866455078125)) * (pow(spvNMax(abs(1.0 - _4675), 9.9999997473787516355514526367188e-05), 2.0) * _4675))) * _4612.z), _3366);
                _4693 = _4692;
                _4694 = fma(_4534, (sqrt(_593) * ((0.3183098733425140380859375 * mix(clamp((dot(_590, _26._m0) + 1.0) * 0.25, 0.0, 1.0), 1.0 - abs(_4543), 0.3300000131130218505859375)) * _586)) * pow(spvNMax(abs(_593 / vec3(dot(_593, vec3(0.300000011920928955078125, 0.589999973773956298828125, 0.10999999940395355224609375)))), vec3(9.9999997473787516355514526367188e-05)), vec3(fma(-_4532, _4532, 1.0))), _3367);
            }
            else
            {
                _4693 = _3366;
                _4694 = _3367;
            }
            _4787 = _4693;
            _4788 = _4694;
        }
        float _4808;
        float _4809;
        if (_34._m0.x > 0.0)
        {
            vec4 _4796 = textureLod(sampler2D(_40, _12), _469, 0.0);
            float _4797 = _4796.x;
            _4808 = clamp((pow(spvNMax(abs(dot(_590, _602) + _4797), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _635, -1.0))) - 1.0) + _4797, 0.0, 1.0);
            _4809 = _4797;
        }
        else
        {
            _4808 = 1.0;
            _4809 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _4809, 0.7);
            _4787 *= rdx_ao_factor;
            _4788 -= _3367 * (1.0 - rdx_ao_factor);
        }
        vec3 _4817 = (_4788 * mix(1.0, _4809, _34._m0.y)) + ((_3515 * _4278) * _4809);
        vec3 _4819 = (_4787 * mix(1.0, _4808, _34._m0.y)) + ((_3512 * _4278) * _4808);
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _4357, 0.5);
            _4817 *= _rdx_csm_shadow;
            _4819 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _39, _7, _469, _rdx_marchDir, _511, vec2(_34._m1));
            _rdx_dbg_micro = _rdx_micro;
            _4817 *= _rdx_micro;
            _4819 *= _rdx_micro;
        }
        vec3 _5324;
        vec3 _5325;
        SPIRV_CROSS_BRANCH
        if (_4283)
        {
            vec3 _4827 = vec3(0.0, 636100.0, 0.0) + _27._m6;
            vec3 _4828 = vec3(0.0, 636100.0, 0.0) + (_600 + _27._m6);
            float _4829 = length(_4828);
            vec3 _4833 = (_4828 / vec3(_4829)) * spvNMax(_4829, 636100.0);
            vec3 _4834 = _4833 - _4827;
            float _4835 = length(_4834);
            vec3 _4837 = _4834 / vec3(_4835);
            float _4838 = length(_4827);
            vec3 _4852;
            vec3 _4853;
            float _4854;
            if (_4838 < (0.89999997615814208984375 * _29._m0))
            {
                vec3 _4847 = _4827;
                _4847.z = _4827.z + _29._m0;
                vec3 _4850 = _4833;
                _4850.z = _4833.z + _29._m0;
                _4852 = _4850;
                _4853 = _4847;
                _4854 = length(_4847);
            }
            else
            {
                _4852 = _4833;
                _4853 = _4827;
                _4854 = _4838;
            }
            float _4855 = dot(_4853, _4837);
            float _4866 = spvNMax((-_4855) - sqrt(fma(_29._m1, _29._m1, fma(_4855, _4855, -(_4854 * _4854)))), 0.0);
            bool _4869 = (_4866 > 0.0) && (_4866 < _4835);
            vec3 _4877;
            float _4878;
            float _4879;
            if (_4869)
            {
                _4877 = _4853 + (_4837 * _4866);
                _4878 = _4835 - _4866;
                _4879 = (_4855 + _4866) / _29._m1;
            }
            else
            {
                _4877 = _4853;
                _4878 = _4835;
                _4879 = _4855 / _4854;
            }
            float _4880 = _4869 ? _29._m1 : _4854;
            vec3 _5317;
            vec3 _5318;
            if (_4880 <= _29._m1)
            {
                float _4885 = dot(_4837, _26._m36);
                float _4887 = dot(_4877, _26._m36) / _4880;
                float _4888 = _29._m0 + 600.0;
                bool _4889 = _4880 < _4888;
                vec3 _4894;
                if (_4889)
                {
                    _4894 = _4852 * (_4888 / _4880);
                }
                else
                {
                    _4894 = _4852;
                }
                float _4895 = _4889 ? _4888 : _4880;
                float _4896 = length(_4894);
                float _4897 = dot(_4894, _4837);
                float _4899 = dot(_4894, _26._m36) / _4896;
                vec2 _4910 = vec2(_4879, _4879 + (_4878 / _4895));
                vec2 _4911 = _4910 * sqrt((0.5 / _29._m4) * _4895);
                vec2 _4914 = vec2(ivec2(sign(_4911)));
                vec2 _4915 = _4911 * _4911;
                float _4929 = -_4878;
                float _4931 = 2.0 * _4895;
                float _4933 = (_4878 / _4931) + _4879;
                float _4941 = _29._m0 - _4895;
                vec2 _4956 = _4910 * sqrt((0.5 / _29._m6) * _4895);
                vec2 _4959 = vec2(ivec2(sign(_4956)));
                vec2 _4960 = _4956 * _4956;
                vec3 _4990 = exp(((-_29._m5) * ((sqrt((6.283100128173828125 * _29._m4) * _4895) * exp(_4941 / _29._m4)) * (((_4914.y > _4914.x) ? exp(_4915.x) : 0.0) + dot((_4914 / ((abs(_4911) * 2.3192999362945556640625) + sqrt((_4915 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4929 / _29._m4) * _4933)), vec2(1.0, -1.0))))) - (_29._m8 * ((sqrt((6.283100128173828125 * _29._m6) * _4895) * exp(_4941 / _29._m6)) * (((_4959.y > _4959.x) ? exp(_4960.x) : 0.0) + dot((_4959 / ((abs(_4956) * 2.3192999362945556640625) + sqrt((_4960 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4929 / _29._m6) * _4933)), vec2(1.0, -1.0))))));
                vec3 _4991 = spvNMin(_4990, vec3(1.0));
                float _4992 = _29._m0 / _4895;
                float _4995 = sqrt(fma(-_4992, _4992, 1.0));
                float _4997 = _4879 - (-_4995);
                vec4 _5280;
                if (abs(_4997) < 0.0040000001899898052215576171875)
                {
                    float _5105 = (-0.0040000001899898052215576171875) - _4995;
                    float _5107 = fma(_4895, _4895, _4878 * _4878);
                    float _5108 = _4931 * _4878;
                    float _5110 = sqrt(fma(_5108, _5105, _5107));
                    float _5111 = fma(_4895, _5105, _4878);
                    float _5114 = -(_29._m0 * _29._m0);
                    float _5116 = sqrt(fma(_29._m1, _29._m1, _5114));
                    float _5118 = sqrt(fma(_4895, _4895, _5114));
                    float _5119 = _4895 * _5105;
                    float _5121 = -(_4895 * _4895);
                    float _5123 = fma(_29._m0, _29._m0, fma(_5119, _5119, _5121));
                    vec4 _5129 = vec4(-1.0, _5116 * _5116, _5116, 0.50390625);
                    vec4 _5130 = mix(_5129, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5119 < 0.0) && (_5123 > 0.0)));
                    float _5132 = fma(_5118 / _5116, 0.96875, 0.015625);
                    float _5142 = fma(fma(_5119, _5130.x, sqrt(_5123 + _5130.y)) / (_5118 + _5130.z), 0.4921875, _5130.w);
                    float _5148 = _4885 + 1.0;
                    float _5150 = floor(_5148 * 3.5);
                    float _5152 = fma(_5148, 3.5, -_5150);
                    float _5153 = _5150 + fma(fma(atan(spvNMax(_4887, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _5154 = _5153 * 0.125;
                    float _5158 = 1.0 - _5152;
                    float _5161 = (_5153 + 1.0) * 0.125;
                    float _5168 = sqrt(fma(_5110, _5110, _5114));
                    float _5172 = fma(_29._m0, _29._m0, fma(_5111, _5111, -(_5110 * _5110)));
                    vec4 _5177 = mix(_5129, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5111 < 0.0) && (_5172 > 0.0)));
                    float _5179 = fma(_5168 / _5116, 0.96875, 0.015625);
                    float _5189 = fma(fma(_5111, _5177.x, sqrt(_5172 + _5177.y)) / (_5168 + _5177.z), 0.4921875, _5177.w);
                    float _5195 = _5150 + fma(fma(atan(spvNMax(_4899, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _5196 = _5195 * 0.125;
                    float _5202 = (_5195 + 1.0) * 0.125;
                    vec4 _5208 = _4991.xyzx;
                    float _5212 = 0.0040000001899898052215576171875 - _4995;
                    float _5214 = sqrt(fma(_5108, _5212, _5107));
                    float _5215 = fma(_4895, _5212, _4878);
                    float _5216 = _4895 * _5212;
                    float _5218 = fma(_29._m0, _29._m0, fma(_5216, _5216, _5121));
                    vec4 _5223 = mix(_5129, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5216 < 0.0) && (_5218 > 0.0)));
                    float _5233 = fma(fma(_5216, _5223.x, sqrt(_5218 + _5223.y)) / (_5118 + _5223.z), 0.4921875, _5223.w);
                    float _5244 = sqrt(fma(_5214, _5214, _5114));
                    float _5248 = fma(_29._m0, _29._m0, fma(_5215, _5215, -(_5214 * _5214)));
                    vec4 _5253 = mix(_5129, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5215 < 0.0) && (_5248 > 0.0)));
                    float _5255 = fma(_5244 / _5116, 0.96875, 0.015625);
                    float _5265 = fma(fma(_5215, _5253.x, sqrt(_5248 + _5253.y)) / (_5244 + _5253.z), 0.4921875, _5253.w);
                    _5280 = mix(spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_5196, _5189, _5179), 0.0) * _5158) + (textureLod(sampler3D(_31, _7), vec3(_5202, _5189, _5179), 0.0) * _5152)), _5208, (textureLod(sampler3D(_31, _7), vec3(_5154, _5142, _5132), 0.0) * _5158) + (textureLod(sampler3D(_31, _7), vec3(_5161, _5142, _5132), 0.0) * _5152)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_5196, _5265, _5255), 0.0) * _5158) + (textureLod(sampler3D(_31, _7), vec3(_5202, _5265, _5255), 0.0) * _5152)), _5208, (textureLod(sampler3D(_31, _7), vec3(_5154, _5233, _5132), 0.0) * _5158) + (textureLod(sampler3D(_31, _7), vec3(_5161, _5233, _5132), 0.0) * _5152)), vec4(0.0)), vec4((_4997 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _5005 = -(_29._m0 * _29._m0);
                    float _5007 = sqrt(fma(_29._m1, _29._m1, _5005));
                    float _5009 = sqrt(fma(_4895, _4895, _5005));
                    float _5010 = _4895 * _4879;
                    float _5014 = fma(_29._m0, _29._m0, fma(_5010, _5010, -(_4895 * _4895)));
                    vec4 _5020 = vec4(-1.0, _5007 * _5007, _5007, 0.50390625);
                    vec4 _5021 = mix(_5020, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_5010 < 0.0) && (_5014 > 0.0)));
                    float _5023 = fma(_5009 / _5007, 0.96875, 0.015625);
                    float _5033 = fma(fma(_5010, _5021.x, sqrt(_5014 + _5021.y)) / (_5009 + _5021.z), 0.4921875, _5021.w);
                    float _5039 = _4885 + 1.0;
                    float _5041 = floor(_5039 * 3.5);
                    float _5043 = fma(_5039, 3.5, -_5041);
                    float _5044 = _5041 + fma(fma(atan(spvNMax(_4887, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _5049 = 1.0 - _5043;
                    float _5059 = sqrt(fma(_4896, _4896, _5005));
                    float _5063 = fma(_29._m0, _29._m0, fma(_4897, _4897, -(_4896 * _4896)));
                    vec4 _5068 = mix(_5020, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4897 < 0.0) && (_5063 > 0.0)));
                    float _5070 = fma(_5059 / _5007, 0.96875, 0.015625);
                    float _5080 = fma(fma(_4897, _5068.x, sqrt(_5063 + _5068.y)) / (_5059 + _5068.z), 0.4921875, _5068.w);
                    float _5086 = _5041 + fma(fma(atan(spvNMax(_4899, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _5280 = spvNMax(fma(-((textureLod(sampler3D(_31, _7), vec3(_5086 * 0.125, _5080, _5070), 0.0) * _5049) + (textureLod(sampler3D(_31, _7), vec3((_5086 + 1.0) * 0.125, _5080, _5070), 0.0) * _5043)), _4991.xyzx, (textureLod(sampler3D(_31, _7), vec3(_5044 * 0.125, _5033, _5023), 0.0) * _5049) + (textureLod(sampler3D(_31, _7), vec3((_5044 + 1.0) * 0.125, _5033, _5023), 0.0) * _5043)), vec4(0.0));
                }
                float _5295 = fma(_4885, _4885, 1.0);
                _5317 = _4991;
                _5318 = (_5280.xyz * (0.0596831031143665313720703125 * _5295)) + ((((_5280.xyz * (_5280.w * smoothstep(0.0, 0.0199999995529651641845703125, _4887))) / vec3(spvNMax(_5280.x, 9.9999997473787516355514526367188e-05))) * (vec3(_29._m5.x) / _29._m5)) * ((((0.119366206228733062744140625 * fma(-_29._m9, _29._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_29._m9 * (-2.0), _4885, fma(_29._m9, _29._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _5295) / fma(_29._m9, _29._m9, 2.0)));
            }
            else
            {
                _5317 = vec3(1.0);
                _5318 = vec3(0.0);
            }
            _5324 = _4819 * _5317;
            _5325 = fma(_4817, _5317, _5318 * ((_26._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _5324 = _4819;
            _5325 = _4817;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_26._m6[0].xyz, _26._m6[1].xyz, _26._m6[2].xyz) * _26._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_39, _7, _469, _rdx_dir, _511, vec2(_34._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _5325 = vec3(_rdx_vis);
            _5324 = vec3(0.0);
        }
        imageStore(_43, ivec2(_452), vec4(_5325, 1.0));
        imageStore(_44, ivec2(_452), vec4(_5324, 1.0));
        break;
    } while(false);
}

