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

float _317;
const vec4 _328[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _361;
vec3 _366;
vec3 _367;

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
        uint _410 = (((_37._m2 & 1u) != 0u) ? ((_37._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_37._m2 / 2u) * _37._m3);
        uint _412 = _45._m0[_410];
        uvec2 _417 = (uvec2(_412 & 65535u, _412 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_417, _31._m3)) || any(greaterThan(_417, _31._m4)))
        {
            break;
        }
        vec2 _429 = vec2(_417);
        vec2 _434 = (_429 + vec2(0.5)) / vec2(_37._m1);
        vec2 _441 = ((_434 - _31._m1) / _31._m0) * 0.5;
        float _445 = _441.x;
        float _447 = _441.y;
        ivec2 _465 = ivec3(int(_417.x), int(_417.y), 0).xy;
        vec4 _471 = texelFetch(_40, _465, 0);
        vec4 _473 = texelFetch(_41, _465, 0);
        vec4 _475 = texelFetch(_42, _465, 0);
        float _476 = _475.x;
        vec3 _494;
        do
        {
            vec3 _482 = fma(vec3(texelFetch(_38, _465, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _483 = dot(_482, _482);
            if (_483 > 54000001024.0)
            {
                _494 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _488 = 2.0 / _483;
                vec2 _490 = _482.xy * _488;
                vec3 _491 = vec3(_490.x, _490.y, _366.z);
                _491.z = 1.0 - _488;
                _494 = _491;
                break;
            }
            break; // unreachable workaround
        } while(false);
        vec3 _495 = texelFetch(_39, _465, 0).xyz;
        float _497 = _471.y;
        float _498 = _471.z;
        uint _502 = uint(roundEven(_471.w * 255.0));
        uint _503 = _502 & 7u;
        uint _505 = (_502 & 112u) >> 4u;
        vec3 _518 = _494 * mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz);
        bool _519 = _503 == 3u;
        vec3 _524 = mix(_495, vec3(1.0), bvec3(_519 && (_28._m4 != 0.0))) * (1.0 - _498);
        vec3 _529 = mix(vec3(0.1599999964237213134765625 * (_497 * _497)), _495, vec3(_498));
        float _530 = spvNMax(0.0900000035762786865234375, _471.x);
        vec3 _568;
        float _569;
        vec3 _570;
        float _571;
        float _572;
        float _573;
        float _574;
        float _575;
        bool _576;
        bool _577;
        bool _578;
        if (_519)
        {
            uint _537 = uint(int(_473.x * 255.0));
            bool _562 = _473.w != 0.0;
            bool _564 = _12._m0[_537]._m2.z == 1.0;
            _568 = _12._m0[_537]._m0.xyz;
            _569 = _12._m0[_537]._m0.w;
            _570 = _12._m0[_537]._m1.xyz;
            _571 = spvNMax(clamp(_12._m0[_537]._m3.x * _530, 0.0, 1.0), 0.0900000035762786865234375);
            _572 = spvNMax(clamp(_12._m0[_537]._m3.y * _530, 0.0, 1.0), 0.0900000035762786865234375);
            _573 = _12._m0[_537]._m3.z;
            _574 = _473.y;
            _575 = fma(_12._m0[_537]._m2.y, _473.z, _12._m0[_537]._m2.x);
            _576 = _562;
            _577 = _562 && _564;
            _578 = _562 && (!_564);
        }
        else
        {
            _568 = vec3(1.0);
            _569 = 0.0;
            _570 = vec3(1.0);
            _571 = 0.5;
            _572 = 0.5;
            _573 = 0.5;
            _574 = 1.0;
            _575 = 0.0;
            _576 = false;
            _577 = false;
            _578 = false;
        }
        vec3 _579 = (((_29._m7[0].xyz * ((1.0 - _445) - _447)) + (_29._m7[1].xyz * _445)) + (_29._m7[2].xyz * _447)) * _476;
        vec3 _581 = normalize(-_579);
        uint _583 = gl_SubgroupInvocationID & 3u;
        float _588 = ((_583 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _589 = (subgroupQuadSwapHorizontal(_494) - _494) * _588;
        float _594 = ((_583 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _595 = (subgroupQuadSwapVertical(_494) - _494) * _594;
        vec3 _599 = mix(_589, vec3(0.0), bvec3(any(isnan(_589))));
        vec3 _603 = mix(_595, vec3(0.0), bvec3(any(isnan(_595))));
        float _610 = sqrt(clamp(fma(_530, _530, spvNMin(dot(_599, _599) + dot(_603, _603), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _619 = ivec2(uvec2(_429) / uvec2(_21._m25));
        int _642 = int(fma(fma(float(int(clamp(fma(log2(_476 * _30._m4), _21._m21, _21._m22), 0.0, float(_21._m26)))), _21._m24, float(_619.y)), _21._m23, float(_619.x)));
        float _645 = _429.x;
        float _646 = _429.y;
        float _651 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _645, 0.005837149918079376220703125 * _646)));
        float _658 = clamp(fma(_21._m34.y, length(_579), _21._m34.x), 0.0, 1.0);
        bool _659 = _503 == 0u;
        vec3 _3321;
        vec3 _3322;
        SPIRV_CROSS_BRANCH
        if (_659)
        {
            uvec4 _2280 = uvec4(_9._m0[uint(_642)]);
            uint _2281 = _2280.x;
            uint _2282 = _2280.y;
            uint _2285 = ((_2282 >> 0u) & 4095u) + _2281;
            uint _2288 = ((_2282 >> 12u) & 4095u) + _2285;
            uint _2292 = ((_2280.z >> 0u) & 1023u) + _2288;
            float _2294 = spvNMax(dot(_518, _581), 9.9999997473787516355514526367188e-06);
            float _2296;
            bool _2299;
            vec3 _2301;
            vec3 _2303;
            uint _2305;
            _2296 = _317;
            _2299 = false;
            _2301 = vec3(0.0);
            _2303 = vec3(0.0);
            _2305 = _2281;
            float _2297;
            bool _2300;
            vec3 _2302;
            vec3 _2304;
            for (; _2305 < _2285; _2296 = _2297, _2299 = _2300, _2301 = _2302, _2303 = _2304, _2305++)
            {
                uint _2312 = uint(_10._m0[_2305]);
                float _2330 = abs(_11._m0[_2312]._m5);
                if ((_11._m0[_2312]._m6 & (1u << (_505 & 31u))) != 0u)
                {
                    vec3 _2345 = _11._m0[_2312]._m0.xyz - _579;
                    float _2346 = dot(_2345, _2345);
                    vec3 _2349 = _2345 * inversesqrt(spvNMax(_2346, 1.0000000133514319600180897396058e-10));
                    float _2350 = _11._m0[_2312]._m0.w * _11._m0[_2312]._m0.w;
                    float _2589;
                    bool _2590;
                    vec3 _2591;
                    vec3 _2592;
                    if (_2346 < (1.0 / _2350))
                    {
                        vec3 _2355 = _581 + _2349;
                        vec3 _2359 = _2355 * inversesqrt(spvNMax(dot(_2355, _2355), 1.0000000133514319600180897396058e-10));
                        float _2361 = clamp(dot(_2349, _2359), 0.0, 1.0);
                        float _2363 = clamp(dot(_518, _2359), 0.0, 1.0);
                        float _2365 = clamp(dot(_518, _2349), 0.0, 1.0);
                        float _2366 = _2346 * _2350;
                        float _2372 = pow(spvNMax(abs(clamp(fma(-_2366, _2366, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_2312]._m4);
                        float _2382;
                        if (_11._m0[_2312]._m5 < 0.0)
                        {
                            _2382 = _2372 * fma(4.0, _2350, _2330);
                        }
                        else
                        {
                            _2382 = _2372 * ((1.0 / spvNMax(_2346, 9.9999997473787516355514526367188e-05)) + _2330);
                        }
                        float _2384 = 0.079577468335628509521484375 * (_2365 * _2382);
                        float _2520;
                        bool _2521;
                        float _2522;
                        if ((_11._m0[_2312]._m7 & 1u) != 0u)
                        {
                            uint _2409;
                            do
                            {
                                vec3 _2389 = -_2349;
                                float _2390 = dot(_2389, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _2391 = dot(_2389, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _2392 = dot(_2389, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _2396 = spvNMax(spvNMax(_2390, _2391), spvNMax(_2392, dot(_2389, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_2396 == _2390)
                                {
                                    _2409 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_2396 == _2391)
                                    {
                                        _2409 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_2396 == _2392)
                                        {
                                            _2409 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _2409 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _2411 = uint(int(_11._m0[_2312]._m7 >> 2u)) + _2409;
                            float _2514;
                            bool _2515;
                            float _2516;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2365 <= 0.0) && (!_578))
                                {
                                    _2514 = _2296;
                                    _2515 = _2299;
                                    _2516 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2445 = _22._m0[_2411]._m0 * vec4(_579 + (_518 * ((3.5 * float(int(sign(_2365)))) * (_22._m0[_2411]._m4 * sqrt(_2346)))), 1.0);
                                    vec3 _2449 = _2445.xyz / vec3(_2445.w);
                                    vec2 _2452 = (_2449.xy * 0.5) + vec2(0.5);
                                    _2452.y = 1.0 - _2452.y;
                                    float _2461 = (_22._m0[_2411]._m5.y / _22._m0[_2411]._m6) / (_2449.z - _22._m0[_2411]._m5.x);
                                    float _2466 = _2299 ? _2296 : 6.283185482025146484375;
                                    float _2467 = _651 * _2466;
                                    vec2 _2468 = _22._m0[_2411]._m1 + _21._m33;
                                    vec2 _2471 = (_22._m0[_2411]._m1 + vec2(_22._m0[_2411]._m2)) - _21._m33;
                                    float _2473;
                                    _2473 = 0.0;
                                    for (int _2476 = 0; _2476 < 12; )
                                    {
                                        float _2481 = float(uint(_2476));
                                        float _2484 = sqrt(_2481 + 0.5) * 0.288675129413604736328125;
                                        float _2485 = fma(_2481, 2.3999631404876708984375, _2467);
                                        vec2 _2493 = clamp(fma((vec3(cos(_2485), sin(_2485), _2484).xy * _2484) * 2.5, _21._m33, _2452), _2468, _2471);
                                        vec2 _2496 = fract(fma(vec2(1.0) / _21._m33, _2493, vec2(0.5)));
                                        vec4 _2502 = vec4(lessThan(vec4(_2461), textureGather(sampler2D(_23, _14), _2493)));
                                        float _2505 = _2496.x;
                                        _2473 += clamp(mix(mix(_2502.w, _2502.z, _2505), mix(_2502.x, _2502.y, _2505), _2496.y), 0.0, 1.0);
                                        _2476++;
                                        continue;
                                    }
                                    _2514 = _2466;
                                    _2515 = _2299 ? _2299 : true;
                                    _2516 = _2473 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2520 = _2514;
                            _2521 = _2515;
                            _2522 = _2384 * mix(1.0, _2516, spvNMin(_658, _11._m0[_2312]._m8));
                        }
                        else
                        {
                            _2520 = _2296;
                            _2521 = _2299;
                            _2522 = _2384;
                        }
                        vec3 _2587;
                        vec3 _2588;
                        if (_2365 > 0.0)
                        {
                            vec3 _2528 = _11._m0[_2312]._m1.xyz * (_2522 * ((_11._m0[_2312]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2535 = vec3(fma((2.0 * _2361) * _2361, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                            float _2556 = (_610 + 1.0) * 0.5;
                            float _2557 = _610 * _610;
                            float _2565 = _2556 * _2556;
                            float _2577 = _2557 * _2557;
                            float _2580 = fma(fma(_2363, _2577, -_2363), _2363, 1.0);
                            _2587 = fma(_2528, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _2361), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2365, sqrt(fma(fma(-_2294, _2565, _2294), _2294, _2565)), _2294 * sqrt(fma(fma(-_2365, _2565, _2365), _2365, _2565)))) * (_2577 * (0.3183098733425140380859375 / (_2580 * _2580)))), _2301);
                            _2588 = fma(_2528, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2535 * pow(spvNMax(abs(1.0 - _2365), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2535 * pow(spvNMax(abs(1.0 - _2294), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _2303);
                        }
                        else
                        {
                            _2587 = _2301;
                            _2588 = _2303;
                        }
                        _2589 = _2520;
                        _2590 = _2521;
                        _2591 = _2587;
                        _2592 = _2588;
                    }
                    else
                    {
                        _2589 = _2296;
                        _2590 = _2299;
                        _2591 = _2301;
                        _2592 = _2303;
                    }
                    _2297 = _2589;
                    _2300 = _2590;
                    _2302 = _2591;
                    _2304 = _2592;
                }
                else
                {
                    _2297 = _2296;
                    _2300 = _2299;
                    _2302 = _2301;
                    _2304 = _2303;
                }
            }
            float _2594;
            bool _2597;
            vec3 _2599;
            vec3 _2601;
            uint _2603;
            _2594 = _2296;
            _2597 = _2299;
            _2599 = _2301;
            _2601 = _2303;
            _2603 = _2305;
            float _2595;
            bool _2598;
            vec3 _2600;
            vec3 _2602;
            for (; _2603 < _2288; _2594 = _2595, _2597 = _2598, _2599 = _2600, _2601 = _2602, _2603++)
            {
                uint _2610 = uint(_10._m0[_2603]);
                float _2623 = abs(_11._m0[_2610]._m5);
                if ((_11._m0[_2610]._m6 & (1u << (_505 & 31u))) != 0u)
                {
                    vec3 _2641 = _11._m0[_2610]._m0.xyz - _579;
                    float _2642 = dot(_2641, _2641);
                    vec3 _2645 = _2641 * inversesqrt(spvNMax(_2642, 1.0000000133514319600180897396058e-10));
                    float _2646 = _11._m0[_2610]._m0.w * _11._m0[_2610]._m0.w;
                    float _2875;
                    bool _2876;
                    vec3 _2877;
                    vec3 _2878;
                    if (_2642 < (1.0 / _2646))
                    {
                        vec3 _2651 = _581 + _2645;
                        vec3 _2655 = _2651 * inversesqrt(spvNMax(dot(_2651, _2651), 1.0000000133514319600180897396058e-10));
                        float _2657 = clamp(dot(_2645, _2655), 0.0, 1.0);
                        float _2659 = clamp(dot(_518, _2655), 0.0, 1.0);
                        float _2661 = clamp(dot(_518, _2645), 0.0, 1.0);
                        float _2664 = dot(-_2645, normalize(_11._m0[_2610]._m2.xyz));
                        float _2693;
                        if (_2664 > _11._m0[_2610]._m1.w)
                        {
                            float _2668 = _2642 * _2646;
                            float _2674 = pow(spvNMax(abs(clamp(fma(-_2668, _2668, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_2610]._m4);
                            float _2684;
                            if (_11._m0[_2610]._m5 < 0.0)
                            {
                                _2684 = _2674 * fma(4.0, _2646, _2623);
                            }
                            else
                            {
                                _2684 = _2674 * ((1.0 / spvNMax(_2642, 9.9999997473787516355514526367188e-05)) + _2623);
                            }
                            float _2689 = clamp((_2664 - _11._m0[_2610]._m1.w) / spvNMax(_11._m0[_2610]._m2.w - _11._m0[_2610]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _2693 = _2661 * (_2684 * (_2689 * _2689));
                        }
                        else
                        {
                            _2693 = 0.0;
                        }
                        float _2694 = 0.3183098733425140380859375 * _2693;
                        float _2806;
                        bool _2807;
                        float _2808;
                        if ((_11._m0[_2610]._m7 & 1u) != 0u)
                        {
                            uint _2697 = uint(int(_11._m0[_2610]._m7 >> 2u));
                            float _2800;
                            bool _2801;
                            float _2802;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2661 <= 0.0) && (!_578))
                                {
                                    _2800 = _2594;
                                    _2801 = _2597;
                                    _2802 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2731 = _22._m0[_2697]._m0 * vec4(_579 + (_518 * ((3.5 * float(int(sign(_2661)))) * (_22._m0[_2697]._m4 * sqrt(_2642)))), 1.0);
                                    vec3 _2735 = _2731.xyz / vec3(_2731.w);
                                    vec2 _2738 = (_2735.xy * 0.5) + vec2(0.5);
                                    _2738.y = 1.0 - _2738.y;
                                    float _2747 = (_22._m0[_2697]._m5.y / _22._m0[_2697]._m6) / (_2735.z - _22._m0[_2697]._m5.x);
                                    float _2752 = _2597 ? _2594 : 6.283185482025146484375;
                                    float _2753 = _651 * _2752;
                                    vec2 _2754 = _22._m0[_2697]._m1 + _21._m33;
                                    vec2 _2757 = (_22._m0[_2697]._m1 + vec2(_22._m0[_2697]._m2)) - _21._m33;
                                    float _2759;
                                    _2759 = 0.0;
                                    for (int _2762 = 0; _2762 < 12; )
                                    {
                                        float _2767 = float(uint(_2762));
                                        float _2770 = sqrt(_2767 + 0.5) * 0.288675129413604736328125;
                                        float _2771 = fma(_2767, 2.3999631404876708984375, _2753);
                                        vec2 _2779 = clamp(fma((vec3(cos(_2771), sin(_2771), _2770).xy * _2770) * 2.5, _21._m33, _2738), _2754, _2757);
                                        vec2 _2782 = fract(fma(vec2(1.0) / _21._m33, _2779, vec2(0.5)));
                                        vec4 _2788 = vec4(lessThan(vec4(_2747), textureGather(sampler2D(_23, _14), _2779)));
                                        float _2791 = _2782.x;
                                        _2759 += clamp(mix(mix(_2788.w, _2788.z, _2791), mix(_2788.x, _2788.y, _2791), _2782.y), 0.0, 1.0);
                                        _2762++;
                                        continue;
                                    }
                                    _2800 = _2752;
                                    _2801 = _2597 ? _2597 : true;
                                    _2802 = _2759 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2806 = _2800;
                            _2807 = _2801;
                            _2808 = _2694 * mix(1.0, _2802, spvNMin(_658, _11._m0[_2610]._m8));
                        }
                        else
                        {
                            _2806 = _2594;
                            _2807 = _2597;
                            _2808 = _2694;
                        }
                        vec3 _2873;
                        vec3 _2874;
                        if (_2661 > 0.0)
                        {
                            vec3 _2814 = _11._m0[_2610]._m1.xyz * (_2808 * ((_11._m0[_2610]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2821 = vec3(fma((2.0 * _2657) * _2657, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                            float _2842 = (_610 + 1.0) * 0.5;
                            float _2843 = _610 * _610;
                            float _2851 = _2842 * _2842;
                            float _2863 = _2843 * _2843;
                            float _2866 = fma(fma(_2659, _2863, -_2659), _2659, 1.0);
                            _2873 = fma(_2814, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _2657), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2661, sqrt(fma(fma(-_2294, _2851, _2294), _2294, _2851)), _2294 * sqrt(fma(fma(-_2661, _2851, _2661), _2661, _2851)))) * (_2863 * (0.3183098733425140380859375 / (_2866 * _2866)))), _2599);
                            _2874 = fma(_2814, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2821 * pow(spvNMax(abs(1.0 - _2661), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2821 * pow(spvNMax(abs(1.0 - _2294), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _2601);
                        }
                        else
                        {
                            _2873 = _2599;
                            _2874 = _2601;
                        }
                        _2875 = _2806;
                        _2876 = _2807;
                        _2877 = _2873;
                        _2878 = _2874;
                    }
                    else
                    {
                        _2875 = _2594;
                        _2876 = _2597;
                        _2877 = _2599;
                        _2878 = _2601;
                    }
                    _2595 = _2875;
                    _2598 = _2876;
                    _2600 = _2877;
                    _2602 = _2878;
                }
                else
                {
                    _2595 = _2594;
                    _2598 = _2597;
                    _2600 = _2599;
                    _2602 = _2601;
                }
            }
            vec3 _2885;
            vec3 _2887;
            _2885 = _2599;
            _2887 = _2601;
            float _2881;
            bool _2884;
            vec3 _2886;
            vec3 _2888;
            float _2880 = _2594;
            bool _2883 = _2597;
            uint _2889 = _2603;
            for (; _2889 < _2292; _2880 = _2881, _2883 = _2884, _2885 = _2886, _2887 = _2888, _2889++)
            {
                uint _2896 = uint(_10._m0[_2889]);
                int _2925 = int(_13._m0[_2896]._m1 >> 1u) - 1;
                if (((_13._m0[_2896]._m4 & 16777215u) & (1u << (_505 & 31u))) != 0u)
                {
                    vec3 _2936 = _13._m0[_2896]._m6 * vec4(_579, 1.0);
                    float _3317;
                    bool _3318;
                    vec3 _3319;
                    vec3 _3320;
                    if (all(lessThan(abs(_2936 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _2943 = _581 + _13._m0[_2896]._m9;
                        vec3 _2947 = _2943 * inversesqrt(spvNMax(dot(_2943, _2943), 1.0000000133514319600180897396058e-10));
                        float _2949 = clamp(dot(_13._m0[_2896]._m9, _2947), 0.0, 1.0);
                        float _2951 = clamp(dot(_518, _2947), 0.0, 1.0);
                        float _2953 = clamp(dot(_518, _13._m0[_2896]._m9), 0.0, 1.0);
                        int _2954 = int(_13._m0[_2896]._m4 >> 24u);
                        float _2955 = _2936.z;
                        vec3 _2994;
                        if (_2955 < _13._m0[_2896]._m2.x)
                        {
                            float _2982 = _2955 * _13._m0[_2896]._m2.z;
                            float _2985 = _2982 * _2982;
                            vec3 _2993;
                            _2993.z = dot(_328[_2954], vec4(_2982, _2985, smoothstep(0.0, 1.0, _2982), (_2985 * _2982) * fma(_2982, fma(_2982, 6.0, -15.0), 10.0)));
                            _2994 = _2993;
                        }
                        else
                        {
                            vec3 _2980;
                            if (_2955 > _13._m0[_2896]._m2.y)
                            {
                                float _2968 = (1.0 - _2955) * _13._m0[_2896]._m2.w;
                                float _2971 = _2968 * _2968;
                                vec3 _2979;
                                _2979.z = dot(_328[_2954], vec4(_2968, _2971, smoothstep(0.0, 1.0, _2968), (_2971 * _2968) * fma(_2968, fma(_2968, 6.0, -15.0), 10.0)));
                                _2980 = _2979;
                            }
                            else
                            {
                                _2980 = vec3(0.0, 0.0, 1.0);
                            }
                            _2994 = _2980;
                        }
                        vec2 _2995 = _2936.xy;
                        vec2 _2999 = (vec2(0.5) - abs(_2995 - vec2(0.5))) * _13._m0[_2896]._m3;
                        float _3000 = _2999.x;
                        vec3 _3017;
                        if (_3000 < 1.0)
                        {
                            float _3008 = _3000 * _3000;
                            vec3 _3016 = _2994;
                            _3016.x = dot(_328[_2954], vec4(_3000, _3008, smoothstep(0.0, 1.0, _3000), (_3008 * _3000) * fma(_3000, fma(_3000, 6.0, -15.0), 10.0)));
                            _3017 = _3016;
                        }
                        else
                        {
                            vec3 _3005 = _2994;
                            _3005.x = 1.0;
                            _3017 = _3005;
                        }
                        float _3018 = _2999.y;
                        vec3 _3035;
                        if (_3018 < 1.0)
                        {
                            float _3026 = _3018 * _3018;
                            vec3 _3034 = _3017;
                            _3034.y = dot(_328[_2954], vec4(_3018, _3026, smoothstep(0.0, 1.0, _3018), (_3026 * _3018) * fma(_3018, fma(_3018, 6.0, -15.0), 10.0)));
                            _3035 = _3034;
                        }
                        else
                        {
                            vec3 _3023 = _3017;
                            _3023.y = 1.0;
                            _3035 = _3023;
                        }
                        float _3041 = _2953 * ((_3035.x * _3035.y) * _3035.z);
                        float _3147;
                        bool _3148;
                        float _3149;
                        if ((_13._m0[_2896]._m8 & 1u) != 0u)
                        {
                            uint _3044 = uint(int(_13._m0[_2896]._m8 >> 2u));
                            float _3141;
                            bool _3142;
                            float _3143;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2953 <= 0.0) && (!_578))
                                {
                                    _3141 = _2880;
                                    _3142 = _2883;
                                    _3143 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _3076 = _22._m0[_3044]._m0 * vec4(_579 + (_518 * ((3.5 * float(int(sign(_2953)))) * _22._m0[_3044]._m4)), 1.0);
                                    vec2 _3079 = (_3076.xy * 0.5) + vec2(0.5);
                                    _3079.y = 1.0 - _3079.y;
                                    float _3088 = ((_3076.z - _22._m0[_3044]._m5.y) / _22._m0[_3044]._m5.x) / _22._m0[_3044]._m6;
                                    float _3093 = _2883 ? _2880 : 6.283185482025146484375;
                                    float _3094 = _651 * _3093;
                                    vec2 _3095 = _22._m0[_3044]._m1 + _21._m33;
                                    vec2 _3098 = (_22._m0[_3044]._m1 + vec2(_22._m0[_3044]._m2)) - _21._m33;
                                    float _3100;
                                    _3100 = 0.0;
                                    for (int _3103 = 0; _3103 < 12; )
                                    {
                                        float _3108 = float(uint(_3103));
                                        float _3111 = sqrt(_3108 + 0.5) * 0.288675129413604736328125;
                                        float _3112 = fma(_3108, 2.3999631404876708984375, _3094);
                                        vec2 _3120 = clamp(fma((vec3(cos(_3112), sin(_3112), _3111).xy * _3111) * 2.5, _21._m33, _3079), _3095, _3098);
                                        vec2 _3123 = fract(fma(vec2(1.0) / _21._m33, _3120, vec2(0.5)));
                                        vec4 _3129 = vec4(lessThan(vec4(_3088), textureGather(sampler2D(_23, _14), _3120)));
                                        float _3132 = _3123.x;
                                        _3100 += clamp(mix(mix(_3129.w, _3129.z, _3132), mix(_3129.x, _3129.y, _3132), _3123.y), 0.0, 1.0);
                                        _3103++;
                                        continue;
                                    }
                                    _3141 = _3093;
                                    _3142 = _2883 ? _2883 : true;
                                    _3143 = _3100 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _3147 = _3141;
                            _3148 = _3142;
                            _3149 = _3041 * mix(1.0, _3143, spvNMin(_658, _13._m0[_2896]._m5));
                        }
                        else
                        {
                            _3147 = _2880;
                            _3148 = _2883;
                            _3149 = _3041;
                        }
                        vec3 _3182;
                        if (_2925 >= 0)
                        {
                            vec2 _3155 = (subgroupQuadSwapHorizontal(_2995) - _2995) * _588;
                            vec2 _3158 = (subgroupQuadSwapVertical(_2995) - _2995) * _594;
                            vec2 _3162 = mix(_3155, vec2(0.0), bvec2(any(isnan(_3155))));
                            vec2 _3166 = mix(_3158, vec2(0.0), bvec2(any(isnan(_3158))));
                            bvec2 _3175 = bvec2(any(greaterThan(abs(vec4(_3162, _3166)), vec4(0.015625))));
                            int _85 = _2925;
                            _3182 = _13._m0[_2896]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_85], _7)), _2995, mix(_3162, vec2(0.0), _3175), mix(_3166, vec2(0.0), _3175)).xyz;
                        }
                        else
                        {
                            _3182 = _13._m0[_2896]._m0;
                        }
                        vec3 _3315;
                        vec3 _3316;
                        SPIRV_CROSS_BRANCH
                        if ((_13._m0[_2896]._m1 & 1u) != 0u)
                        {
                            vec3 _3313;
                            vec3 _3314;
                            if (_2953 > 0.0)
                            {
                                vec3 _3254 = _3182 * (_3149 * _6._m0[0u]);
                                vec3 _3261 = vec3(fma((2.0 * _2949) * _2949, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                float _3282 = (_610 + 1.0) * 0.5;
                                float _3283 = _610 * _610;
                                float _3291 = _3282 * _3282;
                                float _3303 = _3283 * _3283;
                                float _3306 = fma(fma(_2951, _3303, -_2951), _2951, 1.0);
                                _3313 = fma(_3254, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _2949), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2953, sqrt(fma(fma(-_2294, _3291, _2294), _2294, _3291)), _2294 * sqrt(fma(fma(-_2953, _3291, _2953), _2953, _3291)))) * (_3303 * (0.3183098733425140380859375 / (_3306 * _3306)))), _2885);
                                _3314 = fma(_3254, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3261 * pow(spvNMax(abs(1.0 - _2953), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3261 * pow(spvNMax(abs(1.0 - _2294), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _2887);
                            }
                            else
                            {
                                _3313 = _2885;
                                _3314 = _2887;
                            }
                            _3315 = _3313;
                            _3316 = _3314;
                        }
                        else
                        {
                            vec3 _3248;
                            vec3 _3249;
                            if (_2953 > 0.0)
                            {
                                vec3 _3189 = _3182 * _3149;
                                vec3 _3196 = vec3(fma((2.0 * _2949) * _2949, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                float _3217 = (_610 + 1.0) * 0.5;
                                float _3218 = _610 * _610;
                                float _3226 = _3217 * _3217;
                                float _3238 = _3218 * _3218;
                                float _3241 = fma(fma(_2951, _3238, -_2951), _2951, 1.0);
                                _3248 = fma(_3189, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _2949), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2953, sqrt(fma(fma(-_2294, _3226, _2294), _2294, _3226)), _2294 * sqrt(fma(fma(-_2953, _3226, _2953), _2953, _3226)))) * (_3238 * (0.3183098733425140380859375 / (_3241 * _3241)))), _2885);
                                _3249 = fma(_3189, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3196 * pow(spvNMax(abs(1.0 - _2953), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3196 * pow(spvNMax(abs(1.0 - _2294), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _2887);
                            }
                            else
                            {
                                _3248 = _2885;
                                _3249 = _2887;
                            }
                            _3315 = _3248;
                            _3316 = _3249;
                        }
                        _3317 = _3147;
                        _3318 = _3148;
                        _3319 = _3315;
                        _3320 = _3316;
                    }
                    else
                    {
                        _3317 = _2880;
                        _3318 = _2883;
                        _3319 = _2885;
                        _3320 = _2887;
                    }
                    _2881 = _3317;
                    _2884 = _3318;
                    _2886 = _3319;
                    _2888 = _3320;
                }
                else
                {
                    _2881 = _2880;
                    _2884 = _2883;
                    _2886 = _2885;
                    _2888 = _2887;
                }
            }
            _3321 = _2885;
            _3322 = _2887;
        }
        else
        {
            vec3 _2275;
            vec3 _2276;
            if (_519)
            {
                uvec4 _669 = uvec4(_9._m0[uint(_642)]);
                uint _670 = _669.x;
                uint _671 = _669.y;
                uint _674 = ((_671 >> 0u) & 4095u) + _670;
                uint _677 = ((_671 >> 12u) & 4095u) + _674;
                uint _681 = ((_669.z >> 0u) & 1023u) + _677;
                float _683 = spvNMax(dot(_518, _581), 9.9999997473787516355514526367188e-06);
                vec3 _685;
                vec3 _688;
                float _690;
                bool _692;
                uint _694;
                _685 = vec3(0.0);
                _688 = vec3(0.0);
                _690 = _317;
                _692 = false;
                _694 = _670;
                vec3 _686;
                vec3 _689;
                float _691;
                bool _693;
                for (; _694 < _674; _685 = _686, _688 = _689, _690 = _691, _692 = _693, _694++)
                {
                    uint _701 = uint(_10._m0[_694]);
                    float _719 = abs(_11._m0[_701]._m5);
                    bool _723 = _11._m0[_701]._m5 < 0.0;
                    if ((_11._m0[_701]._m6 & (1u << (_505 & 31u))) != 0u)
                    {
                        vec3 _734 = _11._m0[_701]._m0.xyz - _579;
                        float _735 = dot(_734, _734);
                        vec3 _738 = _734 * inversesqrt(spvNMax(_735, 1.0000000133514319600180897396058e-10));
                        float _739 = _11._m0[_701]._m0.w * _11._m0[_701]._m0.w;
                        vec3 _1161;
                        vec3 _1162;
                        float _1163;
                        bool _1164;
                        if (_735 < (1.0 / _739))
                        {
                            vec3 _744 = _581 + _738;
                            vec3 _748 = _744 * inversesqrt(spvNMax(dot(_744, _744), 1.0000000133514319600180897396058e-10));
                            float _750 = clamp(dot(_738, _748), 0.0, 1.0);
                            float _752 = clamp(dot(_518, _748), 0.0, 1.0);
                            float _753 = dot(_518, _738);
                            float _754 = clamp(_753, 0.0, 1.0);
                            float _755 = _735 * _739;
                            float _761 = pow(spvNMax(abs(clamp(fma(-_755, _755, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_701]._m4);
                            float _771;
                            if (_723)
                            {
                                _771 = _761 * fma(4.0, _739, _719);
                            }
                            else
                            {
                                _771 = _761 * ((1.0 / spvNMax(_735, 9.9999997473787516355514526367188e-05)) + _719);
                            }
                            float _773 = 0.079577468335628509521484375 * (_754 * _771);
                            float _940;
                            bool _941;
                            float _942;
                            float _943;
                            float _944;
                            if ((_11._m0[_701]._m7 & 1u) != 0u)
                            {
                                uint _798;
                                do
                                {
                                    vec3 _778 = -_738;
                                    float _779 = dot(_778, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                    float _780 = dot(_778, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                    float _781 = dot(_778, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                    float _785 = spvNMax(spvNMax(_779, _780), spvNMax(_781, dot(_778, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                    if (_785 == _779)
                                    {
                                        _798 = 0u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_785 == _780)
                                        {
                                            _798 = 1u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_785 == _781)
                                            {
                                                _798 = 2u;
                                                break;
                                            }
                                            else
                                            {
                                                _798 = 3u;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                uint _800 = uint(int(_11._m0[_701]._m7 >> 2u)) + _798;
                                float _813 = sqrt(_735);
                                float _903;
                                bool _904;
                                float _905;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_753 <= 0.0) && (!_578))
                                    {
                                        _903 = _690;
                                        _904 = _692;
                                        _905 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _834 = _22._m0[_800]._m0 * vec4(_579 + (_518 * ((3.5 * float(int(sign(_753)))) * (_22._m0[_800]._m4 * _813))), 1.0);
                                        vec3 _838 = _834.xyz / vec3(_834.w);
                                        vec2 _841 = (_838.xy * 0.5) + vec2(0.5);
                                        _841.y = 1.0 - _841.y;
                                        float _850 = (_22._m0[_800]._m5.y / _22._m0[_800]._m6) / (_838.z - _22._m0[_800]._m5.x);
                                        float _855 = _692 ? _690 : 6.283185482025146484375;
                                        float _856 = _651 * _855;
                                        vec2 _857 = _22._m0[_800]._m1 + _21._m33;
                                        vec2 _860 = (_22._m0[_800]._m1 + vec2(_22._m0[_800]._m2)) - _21._m33;
                                        float _862;
                                        _862 = 0.0;
                                        for (int _865 = 0; _865 < 12; )
                                        {
                                            float _870 = float(uint(_865));
                                            float _873 = sqrt(_870 + 0.5) * 0.288675129413604736328125;
                                            float _874 = fma(_870, 2.3999631404876708984375, _856);
                                            vec2 _882 = clamp(fma((vec3(cos(_874), sin(_874), _873).xy * _873) * 2.5, _21._m33, _841), _857, _860);
                                            vec2 _885 = fract(fma(vec2(1.0) / _21._m33, _882, vec2(0.5)));
                                            vec4 _891 = vec4(lessThan(vec4(_850), textureGather(sampler2D(_23, _14), _882)));
                                            float _894 = _885.x;
                                            _862 += clamp(mix(mix(_891.w, _891.z, _894), mix(_891.x, _891.y, _894), _885.y), 0.0, 1.0);
                                            _865++;
                                            continue;
                                        }
                                        _903 = _855;
                                        _904 = _692 ? _692 : true;
                                        _905 = _862 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                float _907 = mix(1.0, _905, spvNMin(_658, _11._m0[_701]._m8));
                                float _939;
                                SPIRV_CROSS_BRANCH
                                if (_576 && _577)
                                {
                                    float _912 = _22._m0[_800]._m4 * _813;
                                    vec4 _919 = _22._m0[_800]._m0 * vec4(_579 - (_518 * _912), 1.0);
                                    float _920 = _919.w;
                                    _939 = fma(_912, clamp(dot(-_518, _738), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_919.xyz / vec3(_920)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_800]._m6, _920))) * 1000.0;
                                }
                                else
                                {
                                    _939 = 0.0;
                                }
                                _940 = _903;
                                _941 = _904;
                                _942 = _773 * _907;
                                _943 = _939;
                                _944 = _907;
                            }
                            else
                            {
                                _940 = _690;
                                _941 = _692;
                                _942 = _773;
                                _943 = 0.0;
                                _944 = 1.0;
                            }
                            float _985;
                            vec3 _986;
                            SPIRV_CROSS_BRANCH
                            if (_576)
                            {
                                vec3 _951 = vec3(1.0) / spvNMax((_568 * vec3(0.09660939872264862060546875)) * (_569 * _574), vec3(9.9999997473787516355514526367188e-05));
                                vec3 _969;
                                SPIRV_CROSS_BRANCH
                                if (_577)
                                {
                                    vec3 _965 = exp2(_951 * ((-0.4808983504772186279296875) * spvNMax(_575, _943)));
                                    _969 = _570 * (_965 * fma(_965, _965, vec3(3.0)));
                                }
                                else
                                {
                                    vec3 _957 = exp2(_951 * ((-0.4808983504772186279296875) * _575));
                                    _969 = (_570 * (_957 * fma(_957, _957, vec3(3.0)))) * _944;
                                }
                                float _982;
                                if (_723)
                                {
                                    _982 = _761 * fma(4.0, _739, _719);
                                }
                                else
                                {
                                    _982 = _761 * ((1.0 / spvNMax(_735, 9.9999997473787516355514526367188e-05)) + _719);
                                }
                                _985 = 0.079577468335628509521484375 * (clamp((0.2588190734386444091796875 - _753) * 0.631063938140869140625, 0.0, 1.0) * _982);
                                _986 = _969;
                            }
                            else
                            {
                                _985 = 0.0;
                                _986 = vec3(0.0);
                            }
                            vec3 _1159;
                            vec3 _1160;
                            SPIRV_CROSS_BRANCH
                            if (_11._m0[_701]._m3 < 0.0)
                            {
                                vec3 _1148;
                                vec3 _1149;
                                if (_754 > 0.0)
                                {
                                    vec3 _1078 = (_11._m0[_701]._m1.xyz * _942) * _6._m0[0u];
                                    vec3 _1085 = vec3(fma((2.0 * _750) * _750, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                    float _1106 = (_610 + 1.0) * 0.5;
                                    float _1109 = _610 * _610;
                                    float _1110 = mix(_571 * _571, _1109, _498);
                                    float _1111 = mix(_572 * _572, _1109, _498);
                                    float _1119 = _1106 * _1106;
                                    float _1131 = _1110 * _1110;
                                    float _1132 = -_752;
                                    float _1134 = fma(fma(_752, _1131, _1132), _752, 1.0);
                                    float _1138 = _1111 * _1111;
                                    float _1140 = fma(fma(_752, _1138, _1132), _752, 1.0);
                                    _1148 = fma(_1078, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _750), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_754, sqrt(fma(fma(-_683, _1119, _683), _683, _1119)), _683 * sqrt(fma(fma(-_754, _1119, _754), _754, _1119)))) * mix(_1131 * (0.3183098733425140380859375 / (_1134 * _1134)), _1138 * (0.3183098733425140380859375 / (_1140 * _1140)), _573)), _685);
                                    _1149 = fma(_1078, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1085 * pow(spvNMax(abs(1.0 - _754), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1085 * pow(spvNMax(abs(1.0 - _683), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _688);
                                }
                                else
                                {
                                    _1148 = _685;
                                    _1149 = _688;
                                }
                                vec3 _1158;
                                SPIRV_CROSS_BRANCH
                                if (_576)
                                {
                                    _1158 = _1149 + (((_986 * _11._m0[_701]._m1.xyz) * _524) * ((0.3183098733425140380859375 * _985) * _6._m0[0u]));
                                }
                                else
                                {
                                    _1158 = _1149;
                                }
                                _1159 = _1148;
                                _1160 = _1158;
                            }
                            else
                            {
                                vec3 _1064;
                                vec3 _1065;
                                if (_754 > 0.0)
                                {
                                    vec3 _994 = (_11._m0[_701]._m1.xyz * _942) * 1.0;
                                    vec3 _1001 = vec3(fma((2.0 * _750) * _750, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                    float _1022 = (_610 + 1.0) * 0.5;
                                    float _1025 = _610 * _610;
                                    float _1026 = mix(_571 * _571, _1025, _498);
                                    float _1027 = mix(_572 * _572, _1025, _498);
                                    float _1035 = _1022 * _1022;
                                    float _1047 = _1026 * _1026;
                                    float _1048 = -_752;
                                    float _1050 = fma(fma(_752, _1047, _1048), _752, 1.0);
                                    float _1054 = _1027 * _1027;
                                    float _1056 = fma(fma(_752, _1054, _1048), _752, 1.0);
                                    _1064 = fma(_994, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _750), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_754, sqrt(fma(fma(-_683, _1035, _683), _683, _1035)), _683 * sqrt(fma(fma(-_754, _1035, _754), _754, _1035)))) * mix(_1047 * (0.3183098733425140380859375 / (_1050 * _1050)), _1054 * (0.3183098733425140380859375 / (_1056 * _1056)), _573)), _685);
                                    _1065 = fma(_994, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1001 * pow(spvNMax(abs(1.0 - _754), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1001 * pow(spvNMax(abs(1.0 - _683), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _688);
                                }
                                else
                                {
                                    _1064 = _685;
                                    _1065 = _688;
                                }
                                vec3 _1073;
                                SPIRV_CROSS_BRANCH
                                if (_576)
                                {
                                    _1073 = _1065 + (((_986 * _11._m0[_701]._m1.xyz) * _524) * (0.3183098733425140380859375 * _985));
                                }
                                else
                                {
                                    _1073 = _1065;
                                }
                                _1159 = _1064;
                                _1160 = _1073;
                            }
                            _1161 = _1159;
                            _1162 = _1160;
                            _1163 = _940;
                            _1164 = _941;
                        }
                        else
                        {
                            _1161 = _685;
                            _1162 = _688;
                            _1163 = _690;
                            _1164 = _692;
                        }
                        _686 = _1161;
                        _689 = _1162;
                        _691 = _1163;
                        _693 = _1164;
                    }
                    else
                    {
                        _686 = _685;
                        _689 = _688;
                        _691 = _690;
                        _693 = _692;
                    }
                }
                vec3 _1166;
                vec3 _1169;
                float _1171;
                bool _1173;
                uint _1175;
                _1166 = _685;
                _1169 = _688;
                _1171 = _690;
                _1173 = _692;
                _1175 = _694;
                vec3 _1167;
                vec3 _1170;
                float _1172;
                bool _1174;
                for (; _1175 < _677; _1166 = _1167, _1169 = _1170, _1171 = _1172, _1173 = _1174, _1175++)
                {
                    uint _1182 = uint(_10._m0[_1175]);
                    float _1195 = abs(_11._m0[_1182]._m5);
                    bool _1202 = _11._m0[_1182]._m5 < 0.0;
                    if ((_11._m0[_1182]._m6 & (1u << (_505 & 31u))) != 0u)
                    {
                        vec3 _1213 = _11._m0[_1182]._m0.xyz - _579;
                        float _1214 = dot(_1213, _1213);
                        vec3 _1217 = _1213 * inversesqrt(spvNMax(_1214, 1.0000000133514319600180897396058e-10));
                        float _1218 = _11._m0[_1182]._m0.w * _11._m0[_1182]._m0.w;
                        vec3 _1649;
                        vec3 _1650;
                        float _1651;
                        bool _1652;
                        if (_1214 < (1.0 / _1218))
                        {
                            vec3 _1223 = _581 + _1217;
                            vec3 _1227 = _1223 * inversesqrt(spvNMax(dot(_1223, _1223), 1.0000000133514319600180897396058e-10));
                            float _1229 = clamp(dot(_1217, _1227), 0.0, 1.0);
                            float _1231 = clamp(dot(_518, _1227), 0.0, 1.0);
                            float _1232 = dot(_518, _1217);
                            float _1233 = clamp(_1232, 0.0, 1.0);
                            float _1236 = dot(-_1217, normalize(_11._m0[_1182]._m2.xyz));
                            bool _1237 = _1236 > _11._m0[_1182]._m1.w;
                            float _1265;
                            if (_1237)
                            {
                                float _1240 = _1214 * _1218;
                                float _1246 = pow(spvNMax(abs(clamp(fma(-_1240, _1240, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1182]._m4);
                                float _1256;
                                if (_1202)
                                {
                                    _1256 = _1246 * fma(4.0, _1218, _1195);
                                }
                                else
                                {
                                    _1256 = _1246 * ((1.0 / spvNMax(_1214, 9.9999997473787516355514526367188e-05)) + _1195);
                                }
                                float _1261 = clamp((_1236 - _11._m0[_1182]._m1.w) / spvNMax(_11._m0[_1182]._m2.w - _11._m0[_1182]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _1265 = _1233 * (_1256 * (_1261 * _1261));
                            }
                            else
                            {
                                _1265 = 0.0;
                            }
                            float _1266 = 0.3183098733425140380859375 * _1265;
                            float _1409;
                            bool _1410;
                            float _1411;
                            float _1412;
                            float _1413;
                            if ((_11._m0[_1182]._m7 & 1u) != 0u)
                            {
                                uint _1269 = uint(int(_11._m0[_1182]._m7 >> 2u));
                                float _1282 = sqrt(_1214);
                                float _1372;
                                bool _1373;
                                float _1374;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1232 <= 0.0) && (!_578))
                                    {
                                        _1372 = _1171;
                                        _1373 = _1173;
                                        _1374 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1303 = _22._m0[_1269]._m0 * vec4(_579 + (_518 * ((3.5 * float(int(sign(_1232)))) * (_22._m0[_1269]._m4 * _1282))), 1.0);
                                        vec3 _1307 = _1303.xyz / vec3(_1303.w);
                                        vec2 _1310 = (_1307.xy * 0.5) + vec2(0.5);
                                        _1310.y = 1.0 - _1310.y;
                                        float _1319 = (_22._m0[_1269]._m5.y / _22._m0[_1269]._m6) / (_1307.z - _22._m0[_1269]._m5.x);
                                        float _1324 = _1173 ? _1171 : 6.283185482025146484375;
                                        float _1325 = _651 * _1324;
                                        vec2 _1326 = _22._m0[_1269]._m1 + _21._m33;
                                        vec2 _1329 = (_22._m0[_1269]._m1 + vec2(_22._m0[_1269]._m2)) - _21._m33;
                                        float _1331;
                                        _1331 = 0.0;
                                        for (int _1334 = 0; _1334 < 12; )
                                        {
                                            float _1339 = float(uint(_1334));
                                            float _1342 = sqrt(_1339 + 0.5) * 0.288675129413604736328125;
                                            float _1343 = fma(_1339, 2.3999631404876708984375, _1325);
                                            vec2 _1351 = clamp(fma((vec3(cos(_1343), sin(_1343), _1342).xy * _1342) * 2.5, _21._m33, _1310), _1326, _1329);
                                            vec2 _1354 = fract(fma(vec2(1.0) / _21._m33, _1351, vec2(0.5)));
                                            vec4 _1360 = vec4(lessThan(vec4(_1319), textureGather(sampler2D(_23, _14), _1351)));
                                            float _1363 = _1354.x;
                                            _1331 += clamp(mix(mix(_1360.w, _1360.z, _1363), mix(_1360.x, _1360.y, _1363), _1354.y), 0.0, 1.0);
                                            _1334++;
                                            continue;
                                        }
                                        _1372 = _1324;
                                        _1373 = _1173 ? _1173 : true;
                                        _1374 = _1331 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                float _1376 = mix(1.0, _1374, spvNMin(_658, _11._m0[_1182]._m8));
                                float _1408;
                                SPIRV_CROSS_BRANCH
                                if (_576 && _577)
                                {
                                    float _1381 = _22._m0[_1269]._m4 * _1282;
                                    vec4 _1388 = _22._m0[_1269]._m0 * vec4(_579 - (_518 * _1381), 1.0);
                                    float _1389 = _1388.w;
                                    _1408 = fma(_1381, clamp(dot(-_518, _1217), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_1388.xyz / vec3(_1389)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1269]._m6, _1389))) * 1000.0;
                                }
                                else
                                {
                                    _1408 = 0.0;
                                }
                                _1409 = _1372;
                                _1410 = _1373;
                                _1411 = _1266 * _1376;
                                _1412 = _1408;
                                _1413 = _1376;
                            }
                            else
                            {
                                _1409 = _1171;
                                _1410 = _1173;
                                _1411 = _1266;
                                _1412 = 0.0;
                                _1413 = 1.0;
                            }
                            float _1473;
                            vec3 _1474;
                            SPIRV_CROSS_BRANCH
                            if (_576)
                            {
                                vec3 _1420 = vec3(1.0) / spvNMax((_568 * vec3(0.09660939872264862060546875)) * (_569 * _574), vec3(9.9999997473787516355514526367188e-05));
                                vec3 _1438;
                                SPIRV_CROSS_BRANCH
                                if (_577)
                                {
                                    vec3 _1434 = exp2(_1420 * ((-0.4808983504772186279296875) * spvNMax(_575, _1412)));
                                    _1438 = _570 * (_1434 * fma(_1434, _1434, vec3(3.0)));
                                }
                                else
                                {
                                    vec3 _1426 = exp2(_1420 * ((-0.4808983504772186279296875) * _575));
                                    _1438 = (_570 * (_1426 * fma(_1426, _1426, vec3(3.0)))) * _1413;
                                }
                                float _1471;
                                if (_1237)
                                {
                                    float _1446 = _1214 * _1218;
                                    float _1452 = pow(spvNMax(abs(clamp(fma(-_1446, _1446, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1182]._m4);
                                    float _1462;
                                    if (_1202)
                                    {
                                        _1462 = _1452 * fma(4.0, _1218, _1195);
                                    }
                                    else
                                    {
                                        _1462 = _1452 * ((1.0 / spvNMax(_1214, 9.9999997473787516355514526367188e-05)) + _1195);
                                    }
                                    float _1467 = clamp((_1236 - _11._m0[_1182]._m1.w) / spvNMax(_11._m0[_1182]._m2.w - _11._m0[_1182]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                    _1471 = clamp((dot(-_518, _1217) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * (_1462 * (_1467 * _1467));
                                }
                                else
                                {
                                    _1471 = 0.0;
                                }
                                _1473 = 0.3183098733425140380859375 * _1471;
                                _1474 = _1438;
                            }
                            else
                            {
                                _1473 = 0.0;
                                _1474 = vec3(0.0);
                            }
                            vec3 _1647;
                            vec3 _1648;
                            SPIRV_CROSS_BRANCH
                            if (_11._m0[_1182]._m3 < 0.0)
                            {
                                vec3 _1636;
                                vec3 _1637;
                                if (_1233 > 0.0)
                                {
                                    vec3 _1566 = (_11._m0[_1182]._m1.xyz * _1411) * _6._m0[0u];
                                    vec3 _1573 = vec3(fma((2.0 * _1229) * _1229, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                    float _1594 = (_610 + 1.0) * 0.5;
                                    float _1597 = _610 * _610;
                                    float _1598 = mix(_571 * _571, _1597, _498);
                                    float _1599 = mix(_572 * _572, _1597, _498);
                                    float _1607 = _1594 * _1594;
                                    float _1619 = _1598 * _1598;
                                    float _1620 = -_1231;
                                    float _1622 = fma(fma(_1231, _1619, _1620), _1231, 1.0);
                                    float _1626 = _1599 * _1599;
                                    float _1628 = fma(fma(_1231, _1626, _1620), _1231, 1.0);
                                    _1636 = fma(_1566, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _1229), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1233, sqrt(fma(fma(-_683, _1607, _683), _683, _1607)), _683 * sqrt(fma(fma(-_1233, _1607, _1233), _1233, _1607)))) * mix(_1619 * (0.3183098733425140380859375 / (_1622 * _1622)), _1626 * (0.3183098733425140380859375 / (_1628 * _1628)), _573)), _1166);
                                    _1637 = fma(_1566, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1573 * pow(spvNMax(abs(1.0 - _1233), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1573 * pow(spvNMax(abs(1.0 - _683), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _1169);
                                }
                                else
                                {
                                    _1636 = _1166;
                                    _1637 = _1169;
                                }
                                vec3 _1646;
                                SPIRV_CROSS_BRANCH
                                if (_576)
                                {
                                    _1646 = _1637 + (((_1474 * _11._m0[_1182]._m1.xyz) * _524) * ((0.3183098733425140380859375 * _1473) * _6._m0[0u]));
                                }
                                else
                                {
                                    _1646 = _1637;
                                }
                                _1647 = _1636;
                                _1648 = _1646;
                            }
                            else
                            {
                                vec3 _1552;
                                vec3 _1553;
                                if (_1233 > 0.0)
                                {
                                    vec3 _1482 = (_11._m0[_1182]._m1.xyz * _1411) * 1.0;
                                    vec3 _1489 = vec3(fma((2.0 * _1229) * _1229, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                    float _1510 = (_610 + 1.0) * 0.5;
                                    float _1513 = _610 * _610;
                                    float _1514 = mix(_571 * _571, _1513, _498);
                                    float _1515 = mix(_572 * _572, _1513, _498);
                                    float _1523 = _1510 * _1510;
                                    float _1535 = _1514 * _1514;
                                    float _1536 = -_1231;
                                    float _1538 = fma(fma(_1231, _1535, _1536), _1231, 1.0);
                                    float _1542 = _1515 * _1515;
                                    float _1544 = fma(fma(_1231, _1542, _1536), _1231, 1.0);
                                    _1552 = fma(_1482, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _1229), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1233, sqrt(fma(fma(-_683, _1523, _683), _683, _1523)), _683 * sqrt(fma(fma(-_1233, _1523, _1233), _1233, _1523)))) * mix(_1535 * (0.3183098733425140380859375 / (_1538 * _1538)), _1542 * (0.3183098733425140380859375 / (_1544 * _1544)), _573)), _1166);
                                    _1553 = fma(_1482, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1489 * pow(spvNMax(abs(1.0 - _1233), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1489 * pow(spvNMax(abs(1.0 - _683), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _1169);
                                }
                                else
                                {
                                    _1552 = _1166;
                                    _1553 = _1169;
                                }
                                vec3 _1561;
                                SPIRV_CROSS_BRANCH
                                if (_576)
                                {
                                    _1561 = _1553 + (((_1474 * _11._m0[_1182]._m1.xyz) * _524) * (0.3183098733425140380859375 * _1473));
                                }
                                else
                                {
                                    _1561 = _1553;
                                }
                                _1647 = _1552;
                                _1648 = _1561;
                            }
                            _1649 = _1647;
                            _1650 = _1648;
                            _1651 = _1409;
                            _1652 = _1410;
                        }
                        else
                        {
                            _1649 = _1166;
                            _1650 = _1169;
                            _1651 = _1171;
                            _1652 = _1173;
                        }
                        _1167 = _1649;
                        _1170 = _1650;
                        _1172 = _1651;
                        _1174 = _1652;
                    }
                    else
                    {
                        _1167 = _1166;
                        _1170 = _1169;
                        _1172 = _1171;
                        _1174 = _1173;
                    }
                }
                vec3 _1654;
                vec3 _1657;
                _1654 = _1166;
                _1657 = _1169;
                vec3 _1655;
                vec3 _1658;
                float _1660;
                bool _1662;
                float _1659 = _1171;
                bool _1661 = _1173;
                uint _1663 = _1175;
                for (; _1663 < _681; _1654 = _1655, _1657 = _1658, _1659 = _1660, _1661 = _1662, _1663++)
                {
                    uint _1670 = uint(_10._m0[_1663]);
                    int _1699 = int(_13._m0[_1670]._m1 >> 1u) - 1;
                    if (((_13._m0[_1670]._m4 & 16777215u) & (1u << (_505 & 31u))) != 0u)
                    {
                        vec3 _1710 = _13._m0[_1670]._m6 * vec4(_579, 1.0);
                        vec3 _2271;
                        vec3 _2272;
                        float _2273;
                        bool _2274;
                        if (all(lessThan(abs(_1710 - vec3(0.5)), vec3(0.5))))
                        {
                            vec3 _1717 = _581 + _13._m0[_1670]._m9;
                            vec3 _1721 = _1717 * inversesqrt(spvNMax(dot(_1717, _1717), 1.0000000133514319600180897396058e-10));
                            float _1723 = clamp(dot(_13._m0[_1670]._m9, _1721), 0.0, 1.0);
                            float _1725 = clamp(dot(_518, _1721), 0.0, 1.0);
                            float _1726 = dot(_518, _13._m0[_1670]._m9);
                            float _1727 = clamp(_1726, 0.0, 1.0);
                            int _1728 = int(_13._m0[_1670]._m4 >> 24u);
                            float _1729 = _1710.z;
                            bool _1731 = _1729 < _13._m0[_1670]._m2.x;
                            vec3 _1768;
                            if (_1731)
                            {
                                float _1756 = _1729 * _13._m0[_1670]._m2.z;
                                float _1759 = _1756 * _1756;
                                vec3 _1767;
                                _1767.z = dot(_328[_1728], vec4(_1756, _1759, smoothstep(0.0, 1.0, _1756), (_1759 * _1756) * fma(_1756, fma(_1756, 6.0, -15.0), 10.0)));
                                _1768 = _1767;
                            }
                            else
                            {
                                vec3 _1754;
                                if (_1729 > _13._m0[_1670]._m2.y)
                                {
                                    float _1742 = (1.0 - _1729) * _13._m0[_1670]._m2.w;
                                    float _1745 = _1742 * _1742;
                                    vec3 _1753;
                                    _1753.z = dot(_328[_1728], vec4(_1742, _1745, smoothstep(0.0, 1.0, _1742), (_1745 * _1742) * fma(_1742, fma(_1742, 6.0, -15.0), 10.0)));
                                    _1754 = _1753;
                                }
                                else
                                {
                                    _1754 = vec3(0.0, 0.0, 1.0);
                                }
                                _1768 = _1754;
                            }
                            vec2 _1769 = _1710.xy;
                            vec2 _1773 = (vec2(0.5) - abs(_1769 - vec2(0.5))) * _13._m0[_1670]._m3;
                            float _1774 = _1773.x;
                            bool _1775 = _1774 < 1.0;
                            vec3 _1791;
                            if (_1775)
                            {
                                float _1782 = _1774 * _1774;
                                vec3 _1790 = _1768;
                                _1790.x = dot(_328[_1728], vec4(_1774, _1782, smoothstep(0.0, 1.0, _1774), (_1782 * _1774) * fma(_1774, fma(_1774, 6.0, -15.0), 10.0)));
                                _1791 = _1790;
                            }
                            else
                            {
                                vec3 _1779 = _1768;
                                _1779.x = 1.0;
                                _1791 = _1779;
                            }
                            float _1792 = _1773.y;
                            bool _1793 = _1792 < 1.0;
                            vec3 _1809;
                            if (_1793)
                            {
                                float _1800 = _1792 * _1792;
                                vec3 _1808 = _1791;
                                _1808.y = dot(_328[_1728], vec4(_1792, _1800, smoothstep(0.0, 1.0, _1792), (_1800 * _1792) * fma(_1792, fma(_1792, 6.0, -15.0), 10.0)));
                                _1809 = _1808;
                            }
                            else
                            {
                                vec3 _1797 = _1791;
                                _1797.y = 1.0;
                                _1809 = _1797;
                            }
                            float _1815 = _1727 * ((_1809.x * _1809.y) * _1809.z);
                            float _1952;
                            bool _1953;
                            float _1954;
                            float _1955;
                            float _1956;
                            if ((_13._m0[_1670]._m8 & 1u) != 0u)
                            {
                                uint _1818 = uint(int(_13._m0[_1670]._m8 >> 2u));
                                float _1915;
                                bool _1916;
                                float _1917;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1726 <= 0.0) && (!_578))
                                    {
                                        _1915 = _1659;
                                        _1916 = _1661;
                                        _1917 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1850 = _22._m0[_1818]._m0 * vec4(_579 + (_518 * ((3.5 * float(int(sign(_1726)))) * _22._m0[_1818]._m4)), 1.0);
                                        vec2 _1853 = (_1850.xy * 0.5) + vec2(0.5);
                                        _1853.y = 1.0 - _1853.y;
                                        float _1862 = ((_1850.z - _22._m0[_1818]._m5.y) / _22._m0[_1818]._m5.x) / _22._m0[_1818]._m6;
                                        float _1867 = _1661 ? _1659 : 6.283185482025146484375;
                                        float _1868 = _651 * _1867;
                                        vec2 _1869 = _22._m0[_1818]._m1 + _21._m33;
                                        vec2 _1872 = (_22._m0[_1818]._m1 + vec2(_22._m0[_1818]._m2)) - _21._m33;
                                        float _1874;
                                        _1874 = 0.0;
                                        for (int _1877 = 0; _1877 < 12; )
                                        {
                                            float _1882 = float(uint(_1877));
                                            float _1885 = sqrt(_1882 + 0.5) * 0.288675129413604736328125;
                                            float _1886 = fma(_1882, 2.3999631404876708984375, _1868);
                                            vec2 _1894 = clamp(fma((vec3(cos(_1886), sin(_1886), _1885).xy * _1885) * 2.5, _21._m33, _1853), _1869, _1872);
                                            vec2 _1897 = fract(fma(vec2(1.0) / _21._m33, _1894, vec2(0.5)));
                                            vec4 _1903 = vec4(lessThan(vec4(_1862), textureGather(sampler2D(_23, _14), _1894)));
                                            float _1906 = _1897.x;
                                            _1874 += clamp(mix(mix(_1903.w, _1903.z, _1906), mix(_1903.x, _1903.y, _1906), _1897.y), 0.0, 1.0);
                                            _1877++;
                                            continue;
                                        }
                                        _1915 = _1867;
                                        _1916 = _1661 ? _1661 : true;
                                        _1917 = _1874 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                float _1919 = mix(1.0, _1917, spvNMin(_658, _13._m0[_1670]._m5));
                                float _1951;
                                SPIRV_CROSS_BRANCH
                                if (_576 && _577)
                                {
                                    vec4 _1930 = _22._m0[_1818]._m0 * vec4(_579 - (_518 * _22._m0[_1818]._m4), 1.0);
                                    _1951 = fma(_22._m0[_1818]._m4, clamp(dot(-_518, _13._m0[_1670]._m9), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma(_1930.xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1818]._m6, (_1930.z - _22._m0[_1818]._m5.y) / _22._m0[_1818]._m5.x))) * 1000.0;
                                }
                                else
                                {
                                    _1951 = 0.0;
                                }
                                _1952 = _1915;
                                _1953 = _1916;
                                _1954 = _1815 * _1919;
                                _1955 = _1951;
                                _1956 = _1919;
                            }
                            else
                            {
                                _1952 = _1659;
                                _1953 = _1661;
                                _1954 = _1815;
                                _1955 = 0.0;
                                _1956 = 1.0;
                            }
                            float _2062;
                            vec3 _2063;
                            SPIRV_CROSS_BRANCH
                            if (_576)
                            {
                                vec3 _1963 = vec3(1.0) / spvNMax((_568 * vec3(0.09660939872264862060546875)) * (_569 * _574), vec3(9.9999997473787516355514526367188e-05));
                                vec3 _1981;
                                SPIRV_CROSS_BRANCH
                                if (_577)
                                {
                                    vec3 _1977 = exp2(_1963 * ((-0.4808983504772186279296875) * spvNMax(_575, _1955)));
                                    _1981 = _570 * (_1977 * fma(_1977, _1977, vec3(3.0)));
                                }
                                else
                                {
                                    vec3 _1969 = exp2(_1963 * ((-0.4808983504772186279296875) * _575));
                                    _1981 = (_570 * (_1969 * fma(_1969, _1969, vec3(3.0)))) * _1956;
                                }
                                vec3 _2023;
                                if (_1731)
                                {
                                    float _2011 = _1729 * _13._m0[_1670]._m2.z;
                                    float _2014 = _2011 * _2011;
                                    vec3 _2022;
                                    _2022.z = dot(_328[_1728], vec4(_2011, _2014, smoothstep(0.0, 1.0, _2011), (_2014 * _2011) * fma(_2011, fma(_2011, 6.0, -15.0), 10.0)));
                                    _2023 = _2022;
                                }
                                else
                                {
                                    vec3 _2009;
                                    if (_1729 > _13._m0[_1670]._m2.y)
                                    {
                                        float _1997 = (1.0 - _1729) * _13._m0[_1670]._m2.w;
                                        float _2000 = _1997 * _1997;
                                        vec3 _2008;
                                        _2008.z = dot(_328[_1728], vec4(_1997, _2000, smoothstep(0.0, 1.0, _1997), (_2000 * _1997) * fma(_1997, fma(_1997, 6.0, -15.0), 10.0)));
                                        _2009 = _2008;
                                    }
                                    else
                                    {
                                        _2009 = vec3(0.0, 0.0, 1.0);
                                    }
                                    _2023 = _2009;
                                }
                                vec3 _2039;
                                if (_1775)
                                {
                                    float _2030 = _1774 * _1774;
                                    vec3 _2038 = _2023;
                                    _2038.x = dot(_328[_1728], vec4(_1774, _2030, smoothstep(0.0, 1.0, _1774), (_2030 * _1774) * fma(_1774, fma(_1774, 6.0, -15.0), 10.0)));
                                    _2039 = _2038;
                                }
                                else
                                {
                                    vec3 _2027 = _2023;
                                    _2027.x = 1.0;
                                    _2039 = _2027;
                                }
                                vec3 _2055;
                                if (_1793)
                                {
                                    float _2046 = _1792 * _1792;
                                    vec3 _2054 = _2039;
                                    _2054.y = dot(_328[_1728], vec4(_1792, _2046, smoothstep(0.0, 1.0, _1792), (_2046 * _1792) * fma(_1792, fma(_1792, 6.0, -15.0), 10.0)));
                                    _2055 = _2054;
                                }
                                else
                                {
                                    vec3 _2043 = _2039;
                                    _2043.y = 1.0;
                                    _2055 = _2043;
                                }
                                _2062 = clamp((dot(-_518, _13._m0[_1670]._m9) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * ((_2055.x * _2055.y) * _2055.z);
                                _2063 = _1981;
                            }
                            else
                            {
                                _2062 = 0.0;
                                _2063 = vec3(0.0);
                            }
                            vec3 _2096;
                            if (_1699 >= 0)
                            {
                                vec2 _2069 = (subgroupQuadSwapHorizontal(_1769) - _1769) * _588;
                                vec2 _2072 = (subgroupQuadSwapVertical(_1769) - _1769) * _594;
                                vec2 _2076 = mix(_2069, vec2(0.0), bvec2(any(isnan(_2069))));
                                vec2 _2080 = mix(_2072, vec2(0.0), bvec2(any(isnan(_2072))));
                                bvec2 _2089 = bvec2(any(greaterThan(abs(vec4(_2076, _2080)), vec4(0.015625))));
                                int _81 = _1699;
                                _2096 = _13._m0[_1670]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_81], _7)), _1769, mix(_2076, vec2(0.0), _2089), mix(_2080, vec2(0.0), _2089)).xyz;
                            }
                            else
                            {
                                _2096 = _13._m0[_1670]._m0;
                            }
                            vec3 _2269;
                            vec3 _2270;
                            SPIRV_CROSS_BRANCH
                            if ((_13._m0[_1670]._m1 & 1u) != 0u)
                            {
                                vec3 _2258;
                                vec3 _2259;
                                if (_1727 > 0.0)
                                {
                                    vec3 _2188 = (_2096 * _1954) * _6._m0[0u];
                                    vec3 _2195 = vec3(fma((2.0 * _1723) * _1723, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                    float _2216 = (_610 + 1.0) * 0.5;
                                    float _2219 = _610 * _610;
                                    float _2220 = mix(_571 * _571, _2219, _498);
                                    float _2221 = mix(_572 * _572, _2219, _498);
                                    float _2229 = _2216 * _2216;
                                    float _2241 = _2220 * _2220;
                                    float _2242 = -_1725;
                                    float _2244 = fma(fma(_1725, _2241, _2242), _1725, 1.0);
                                    float _2248 = _2221 * _2221;
                                    float _2250 = fma(fma(_1725, _2248, _2242), _1725, 1.0);
                                    _2258 = fma(_2188, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _1723), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1727, sqrt(fma(fma(-_683, _2229, _683), _683, _2229)), _683 * sqrt(fma(fma(-_1727, _2229, _1727), _1727, _2229)))) * mix(_2241 * (0.3183098733425140380859375 / (_2244 * _2244)), _2248 * (0.3183098733425140380859375 / (_2250 * _2250)), _573)), _1654);
                                    _2259 = fma(_2188, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2195 * pow(spvNMax(abs(1.0 - _1727), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2195 * pow(spvNMax(abs(1.0 - _683), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _1657);
                                }
                                else
                                {
                                    _2258 = _1654;
                                    _2259 = _1657;
                                }
                                vec3 _2268;
                                SPIRV_CROSS_BRANCH
                                if (_576)
                                {
                                    _2268 = _2259 + (((_2063 * _2096) * _524) * ((0.3183098733425140380859375 * _2062) * _6._m0[0u]));
                                }
                                else
                                {
                                    _2268 = _2259;
                                }
                                _2269 = _2258;
                                _2270 = _2268;
                            }
                            else
                            {
                                vec3 _2174;
                                vec3 _2175;
                                if (_1727 > 0.0)
                                {
                                    vec3 _2104 = (_2096 * _1954) * 1.0;
                                    vec3 _2111 = vec3(fma((2.0 * _1723) * _1723, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                                    float _2132 = (_610 + 1.0) * 0.5;
                                    float _2135 = _610 * _610;
                                    float _2136 = mix(_571 * _571, _2135, _498);
                                    float _2137 = mix(_572 * _572, _2135, _498);
                                    float _2145 = _2132 * _2132;
                                    float _2157 = _2136 * _2136;
                                    float _2158 = -_1725;
                                    float _2160 = fma(fma(_1725, _2157, _2158), _1725, 1.0);
                                    float _2164 = _2137 * _2137;
                                    float _2166 = fma(fma(_1725, _2164, _2158), _1725, 1.0);
                                    _2174 = fma(_2104, (_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - _1723), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1727, sqrt(fma(fma(-_683, _2145, _683), _683, _2145)), _683 * sqrt(fma(fma(-_1727, _2145, _1727), _1727, _2145)))) * mix(_2157 * (0.3183098733425140380859375 / (_2160 * _2160)), _2164 * (0.3183098733425140380859375 / (_2166 * _2166)), _573)), _1654);
                                    _2175 = fma(_2104, _524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2111 * pow(spvNMax(abs(1.0 - _1727), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2111 * pow(spvNMax(abs(1.0 - _683), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))), _1657);
                                }
                                else
                                {
                                    _2174 = _1654;
                                    _2175 = _1657;
                                }
                                vec3 _2183;
                                SPIRV_CROSS_BRANCH
                                if (_576)
                                {
                                    _2183 = _2175 + (((_2063 * _2096) * _524) * (0.3183098733425140380859375 * _2062));
                                }
                                else
                                {
                                    _2183 = _2175;
                                }
                                _2269 = _2174;
                                _2270 = _2183;
                            }
                            _2271 = _2269;
                            _2272 = _2270;
                            _2273 = _1952;
                            _2274 = _1953;
                        }
                        else
                        {
                            _2271 = _1654;
                            _2272 = _1657;
                            _2273 = _1659;
                            _2274 = _1661;
                        }
                        _1655 = _2271;
                        _1658 = _2272;
                        _1660 = _2273;
                        _1662 = _2274;
                    }
                    else
                    {
                        _1655 = _1654;
                        _1658 = _1657;
                        _1660 = _1659;
                        _1662 = _1661;
                    }
                }
                _2275 = _1654;
                _2276 = _1657;
            }
            else
            {
                _2275 = vec3(0.0);
                _2276 = vec3(0.0);
            }
            _3321 = _2275;
            _3322 = _2276;
        }
        vec3 _3324 = reflect(-_581, _518);
        vec3 _3326 = vec3(_529.x, _529.y, _529.z);
        vec3 _3336 = textureLod(samplerCube(_16, _7), _518, 0.0).xyz * _21._m27;
        vec3 _3343 = textureLod(samplerCube(_17, _7), _3324, fma(_610, 8.0, _21._m30 - 8.0)).xyz * _21._m27;
        vec3 _3368;
        vec3 _3369;
        SPIRV_CROSS_BRANCH
        if (_21._m29 > 0.0)
        {
            vec3 _3358 = vec3(_21._m29);
            _3368 = mix(_3343, textureLod(samplerCube(_19, _7), _3324, fma(_610, 8.0, _21._m31 - 8.0)).xyz * _21._m28, _3358);
            _3369 = mix(_3336, textureLod(samplerCube(_18, _7), _518, 0.0).xyz * _21._m28, _3358);
        }
        else
        {
            _3368 = _3343;
            _3369 = _3336;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_3369, _610);
            _3368 *= rdx_mod;
            _3369 *= rdx_mod;
        }
        float _3370 = spvNMax(dot(_581, _518), 0.001953125);
        vec4 _3375 = textureLod(sampler2D(_20, _14), vec2(_3370, _610), 0.0);
        uvec4 _3388 = uvec4(_9._m0[uint(_642)]);
        uint _3390 = _3388.y;
        uint _3400 = ((_3388.z >> 0u) & 1023u) + (((_3390 >> 12u) & 4095u) + (((_3390 >> 0u) & 4095u) + _3388.x));
        uint _3402 = (_3390 >> 24u) + _3400;
        vec3 _3404;
        vec3 _3407;
        _3404 = _3368 * ((_3326 * _3375.x) + vec3(_3375.y));
        _3407 = _3369 * (_524 * _3375.z);
        vec3 _3405;
        vec3 _3408;
        for (uint _3409 = _3400; _3409 < _3402; _3404 = _3405, _3407 = _3408, _3409++)
        {
            uint _3416 = uint(_10._m0[_3409]);
            int _3435 = int((_15._m0[_3416]._m5 >> 1u) & 3u);
            mat3 _3439 = mat3(_15._m0[_3416]._m1[0], _15._m0[_3416]._m1[1], _15._m0[_3416]._m1[2]);
            int _3445 = (int((_15._m0[_3416]._m5 >> 3u) & 16383u) - 1) * 2;
            int _3450 = (int((_15._m0[_3416]._m5 >> 17u) & 16383u) - 1) * 2;
            int _3455 = (int((_15._m0[_3416]._m6 >> 0u) & 65535u) - 1) * 2;
            int _3460 = (int((_15._m0[_3416]._m6 >> 16u) & 65535u) - 1) * 2;
            float _3463 = (_15._m0[_3416]._m3 < 0.0) ? (-_15._m0[_3416]._m3) : 1.0;
            vec3 _3465 = _3439 * (_579 - _15._m0[_3416]._m1[3]);
            bool _3466 = int(_15._m0[_3416]._m5 & 1u) == 1;
            vec3 _3467 = abs(_3465);
            float _3470 = dot(_3465, _3465);
            if (_3466 ? any(greaterThanEqual(_3467, _15._m0[_3416]._m0.xyz)) : (_3470 >= _15._m0[_3416]._m0.y))
            {
                _3405 = _3404;
                _3408 = _3407;
                continue;
            }
            vec3 _3644;
            SPIRV_CROSS_FLATTEN
            if ((_3435 & 1) != 0)
            {
                vec3 _3480 = _3439 * _518;
                vec2 _3569;
                bool _3570;
                if (_3466)
                {
                    vec2 _3564;
                    bool _3568;
                    do
                    {
                        vec3 _3548 = (_15._m0[_3416]._m0.xyz - _3465) / _3480;
                        vec3 _3551 = ((-_15._m0[_3416]._m0.xyz) - _3465) / _3480;
                        vec3 _3552 = spvNMin(_3548, _3551);
                        vec3 _3553 = spvNMax(_3548, _3551);
                        float _3558 = spvNMax(_3552.x, spvNMax(_3552.y, _3552.z));
                        float _3563 = spvNMin(_3553.x, spvNMin(_3553.y, _3553.z));
                        _3564 = vec2(_3558, _3563);
                        if (_3558 > _3563)
                        {
                            _3568 = false;
                            break;
                        }
                        _3568 = true;
                        break;
                    } while(false);
                    _3569 = _3564;
                    _3570 = _3568;
                }
                else
                {
                    vec2 _3543;
                    bool _3544;
                    do
                    {
                        float _3486 = dot(_3480, _3480);
                        float _3487 = dot(_3480, _3465);
                        float _3488 = 2.0 * _3487;
                        float _3489 = _3470 - _15._m0[_3416]._m0.y;
                        float _3525;
                        float _3526;
                        bool _3527;
                        do
                        {
                            float _3495 = fma(_3488, _3488, -((4.0 * _3486) * _3489));
                            float _3523;
                            float _3524;
                            if (_3495 < 0.0)
                            {
                                _3525 = 0.0;
                                _3526 = 0.0;
                                _3527 = false;
                                break;
                            }
                            else
                            {
                                if (_3495 == 0.0)
                                {
                                    float _3522 = (_3487 * (-1.0)) * (1.0 / _3486);
                                    _3523 = _3522;
                                    _3524 = _3522;
                                }
                                else
                                {
                                    float _3515;
                                    if (_3488 > 0.0)
                                    {
                                        _3515 = (-0.5) * fma(2.0, _3487, sqrt(_3495));
                                    }
                                    else
                                    {
                                        _3515 = (-0.5) * fma(2.0, _3487, -sqrt(_3495));
                                    }
                                    _3523 = _3489 * (1.0 / _3515);
                                    _3524 = _3515 * (1.0 / _3486);
                                }
                            }
                            _3525 = _3523;
                            _3526 = _3524;
                            _3527 = true;
                            break;
                        } while(false);
                        if (!_3527)
                        {
                            _3543 = vec2(0.0);
                            _3544 = false;
                            break;
                        }
                        if ((_3526 < 0.0) && (_3525 < 0.0))
                        {
                            _3543 = vec2(0.0);
                            _3544 = false;
                            break;
                        }
                        vec2 _3542;
                        if (_3526 > _3525)
                        {
                            _3542 = vec2(_3525, _3526);
                        }
                        else
                        {
                            _3542 = vec2(_3526, _3525);
                        }
                        _3543 = _3542;
                        _3544 = true;
                        break;
                    } while(false);
                    _3569 = _3543;
                    _3570 = _3544;
                }
                vec3 _3573 = _3465 + (_3480 * _3569.y);
                float _3594;
                if (_3466)
                {
                    _3594 = 1.0 - clamp(length(spvNMax(_3467 - (_15._m0[_3416]._m0.xyz - vec3(_15._m0[_3416]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_3416]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3594 = clamp((_15._m0[_3416]._m0.x - length(_3465)) * (1.0 / spvNMax(_15._m0[_3416]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3597 = float(_3570) * smoothstep(0.0, 1.0, _3594);
                vec4 _3639;
                SPIRV_CROSS_BRANCH
                if (_3597 > 9.9999997473787516355514526367188e-05)
                {
                    float _3606 = mix(clamp((_3569.y * (1.0 / length(_3573))) * _610, 0.0, _610), _610, _610);
                    vec3 _3608 = mix(_3573, _3480, vec3(_3606));
                    int _89 = _3445;
                    vec4 _3609 = textureLod(nonuniformEXT(samplerCube(_26[_89], _7)), _3608, 0.0);
                    int _93 = _3445 + 1;
                    _3609.w = textureLod(nonuniformEXT(samplerCube(_26[_93], _7)), _3608, 0.0).x;
                    vec4 _3624;
                    SPIRV_CROSS_BRANCH
                    if (_3450 >= 0)
                    {
                        int _97 = _3450;
                        vec4 _3617 = textureLod(nonuniformEXT(samplerCube(_26[_97], _7)), _3608, 0.0);
                        int _101 = _3450 + 1;
                        _3617.w = textureLod(nonuniformEXT(samplerCube(_26[_101], _7)), _3608, 0.0).x;
                        _3624 = mix(_3609, _3617, vec4(_15._m0[_3416]._m3));
                    }
                    else
                    {
                        _3624 = _3609;
                    }
                    vec4 _3625 = _3624 * _3463;
                    vec3 _3634 = (_3625.xyz * _15._m0[_3416]._m4).xyz * (_524 * textureLod(sampler2D(_20, _14), vec2(_3370, _3606), 0.0).z);
                    vec4 _3635 = vec4(_3634.x, _3634.y, _3634.z, _3625.w);
                    _3635.w = _3625.w * _3597;
                    _3639 = _3635;
                }
                else
                {
                    _3639 = vec4(0.0);
                }
                _3644 = mix(_3407, _3639.xyz, vec3(_3639.w));
            }
            else
            {
                _3644 = _3407;
            }
            vec3 _3823;
            SPIRV_CROSS_FLATTEN
            if ((_3435 & 2) != 0)
            {
                vec3 _3649 = _3439 * _3324;
                vec2 _3738;
                bool _3739;
                if (_3466)
                {
                    vec2 _3733;
                    bool _3737;
                    do
                    {
                        vec3 _3717 = (_15._m0[_3416]._m0.xyz - _3465) / _3649;
                        vec3 _3720 = ((-_15._m0[_3416]._m0.xyz) - _3465) / _3649;
                        vec3 _3721 = spvNMin(_3717, _3720);
                        vec3 _3722 = spvNMax(_3717, _3720);
                        float _3727 = spvNMax(_3721.x, spvNMax(_3721.y, _3721.z));
                        float _3732 = spvNMin(_3722.x, spvNMin(_3722.y, _3722.z));
                        _3733 = vec2(_3727, _3732);
                        if (_3727 > _3732)
                        {
                            _3737 = false;
                            break;
                        }
                        _3737 = true;
                        break;
                    } while(false);
                    _3738 = _3733;
                    _3739 = _3737;
                }
                else
                {
                    vec2 _3712;
                    bool _3713;
                    do
                    {
                        float _3655 = dot(_3649, _3649);
                        float _3656 = dot(_3649, _3465);
                        float _3657 = 2.0 * _3656;
                        float _3658 = _3470 - _15._m0[_3416]._m0.y;
                        float _3694;
                        float _3695;
                        bool _3696;
                        do
                        {
                            float _3664 = fma(_3657, _3657, -((4.0 * _3655) * _3658));
                            float _3692;
                            float _3693;
                            if (_3664 < 0.0)
                            {
                                _3694 = 0.0;
                                _3695 = 0.0;
                                _3696 = false;
                                break;
                            }
                            else
                            {
                                if (_3664 == 0.0)
                                {
                                    float _3691 = (_3656 * (-1.0)) * (1.0 / _3655);
                                    _3692 = _3691;
                                    _3693 = _3691;
                                }
                                else
                                {
                                    float _3684;
                                    if (_3657 > 0.0)
                                    {
                                        _3684 = (-0.5) * fma(2.0, _3656, sqrt(_3664));
                                    }
                                    else
                                    {
                                        _3684 = (-0.5) * fma(2.0, _3656, -sqrt(_3664));
                                    }
                                    _3692 = _3658 * (1.0 / _3684);
                                    _3693 = _3684 * (1.0 / _3655);
                                }
                            }
                            _3694 = _3692;
                            _3695 = _3693;
                            _3696 = true;
                            break;
                        } while(false);
                        if (!_3696)
                        {
                            _3712 = vec2(0.0);
                            _3713 = false;
                            break;
                        }
                        if ((_3695 < 0.0) && (_3694 < 0.0))
                        {
                            _3712 = vec2(0.0);
                            _3713 = false;
                            break;
                        }
                        vec2 _3711;
                        if (_3695 > _3694)
                        {
                            _3711 = vec2(_3694, _3695);
                        }
                        else
                        {
                            _3711 = vec2(_3695, _3694);
                        }
                        _3712 = _3711;
                        _3713 = true;
                        break;
                    } while(false);
                    _3738 = _3712;
                    _3739 = _3713;
                }
                vec3 _3742 = _3465 + (_3649 * _3738.y);
                float _3763;
                if (_3466)
                {
                    _3763 = 1.0 - clamp(length(spvNMax(_3467 - (_15._m0[_3416]._m0.xyz - vec3(_15._m0[_3416]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_3416]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3763 = clamp((_15._m0[_3416]._m0.x - length(_3465)) * (1.0 / spvNMax(_15._m0[_3416]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3766 = float(_3739) * smoothstep(0.0, 1.0, _3763);
                vec4 _3818;
                SPIRV_CROSS_BRANCH
                if (_3766 > 9.9999997473787516355514526367188e-05)
                {
                    float _3775 = mix(clamp((_3738.y * (1.0 / length(_3742))) * _610, 0.0, _610), _610, _610);
                    vec3 _3777 = mix(_3742, _3649, vec3(_3775));
                    float _3778 = _3775 * 8.0;
                    int _105 = _3455;
                    int _109 = _3455 + 1;
                    vec4 _3786 = vec4(textureLod(nonuniformEXT(samplerCube(_26[_105], _7)), _3777, _3778).xyz, textureLod(nonuniformEXT(samplerCube(_26[_109], _7)), _3777, _3778).x);
                    vec4 _3800;
                    SPIRV_CROSS_BRANCH
                    if (_3460 >= 0)
                    {
                        int _113 = _3460;
                        int _117 = _3460 + 1;
                        _3800 = mix(_3786, vec4(textureLod(nonuniformEXT(samplerCube(_26[_113], _7)), _3777, _3778).xyz, textureLod(nonuniformEXT(samplerCube(_26[_117], _7)), _3777, _3778).x), vec4(_15._m0[_3416]._m3));
                    }
                    else
                    {
                        _3800 = _3786;
                    }
                    vec4 _3801 = _3800 * _3463;
                    vec4 _3806 = textureLod(sampler2D(_20, _14), vec2(_3370, _3775), 0.0);
                    vec3 _3813 = (_3801.xyz * _15._m0[_3416]._m4).xyz * ((_3326 * _3806.x) + vec3(_3806.y));
                    vec4 _3814 = vec4(_3813.x, _3813.y, _3813.z, _3801.w);
                    _3814.w = _3801.w * _3766;
                    _3818 = _3814;
                }
                else
                {
                    _3818 = vec4(0.0);
                }
                _3823 = mix(_3404, _3818.xyz, vec3(_3818.w));
            }
            else
            {
                _3823 = _3404;
            }
            _3405 = _3823;
            _3408 = _3644;
        }
        float _3824 = _6._m0[0u] * 100.0;
        bool _3829 = _29._m19 > 0.0;
        vec3 _3890;
        SPIRV_CROSS_BRANCH
        if (_3829 && (_29._m35 == 0.0))
        {
            vec3 _3843 = vec3(0.0, 636100.0, 0.0) + _30._m6;
            float _3844 = length(_3843);
            vec3 _3855;
            float _3856;
            if (_3844 < (0.89999997615814208984375 * _32._m0))
            {
                vec3 _3853 = _3843;
                _3853.z = _3843.z + _32._m0;
                _3855 = _3853;
                _3856 = length(_3853);
            }
            else
            {
                _3855 = _3843;
                _3856 = _3844;
            }
            float _3859 = dot(_3855 / vec3(_3856), _29._m36);
            float _3860 = _32._m0 / _3856;
            _3890 = (mix(textureLod(sampler2D(_33, _7), vec2(atan((_3859 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_3856 - _32._m0) / (_32._m1 - _32._m0))), 0.0).xyz, vec3(0.0), bvec3(_3859 < (-sqrt(fma(-_3860, _3860, 1.0))))) * 1.0) * (_29._m34 * _29._m20);
        }
        else
        {
            _3890 = _29._m2;
        }
        float _3903 = texelFetch(_44, ivec3(int(_645), int(_646), 0).xy, 0).x;
        float _3988;
        SPIRV_CROSS_BRANCH
        if (_29._m21 > 0.0)
        {
            vec3 _3927 = _30._m6 + _579;
            vec3 _3934 = vec3(0.0, _29._m18.z, 0.0) + (_3927 - vec3(0.0, _29._m25, 0.0));
            float _3938 = dot(_3934, _29._m24);
            vec2 _3948 = ((((_3934 + (_29._m24 * (sqrt(fma(_3938, _3938, fma(_29._m18.z, _29._m18.z, -dot(_3934, _3934)))) - _3938))).xz * _29._m18.w) * 0.5) + vec2(0.5)) + _29._m18.xy;
            _3948.x = 1.0 - _3948.x;
            vec3 _3961 = vec3(0.0, _29._m23.z, 0.0) + (_3927 - vec3(0.0, _29._m27, 0.0));
            float _3965 = dot(_3961, _29._m26);
            vec2 _3975 = ((((_3961 + (_29._m26 * (sqrt(fma(_3965, _3965, fma(_29._m23.z, _29._m23.z, -dot(_3961, _3961)))) - _3965))).xz * _29._m23.w) * 0.5) + vec2(0.5)) + _29._m23.xy;
            _3975.x = 1.0 - _3975.x;
            _3988 = _3903 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_35, _7), _3948, 0.0).x, textureLod(sampler2D(_36, _7), _3975, 0.0).x, _29._m16)) * _29._m21, 0.0, 1.0));
        }
        else
        {
            _3988 = _3903;
        }
        float _4078;
        SPIRV_CROSS_BRANCH
        if (_29._m17 > 0.0)
        {
            vec3 _4016 = _30._m6 + _579;
            vec3 _4024 = vec3(0.0, _29._m28.z, 0.0) + ((_29._m29 + _4016) - vec3(0.0, _29._m30, 0.0));
            float _4028 = dot(_4024, _29._m24);
            vec2 _4038 = ((((_4024 + (_29._m24 * (sqrt(fma(_4028, _4028, fma(_29._m28.z, _29._m28.z, -dot(_4024, _4024)))) - _4028))).xz * _29._m28.w) * 0.5) + vec2(0.5)) + _29._m28.xy;
            _4038.x = 1.0 - _4038.x;
            vec3 _4052 = vec3(0.0, _29._m31.z, 0.0) + ((_29._m32 + _4016) - vec3(0.0, _29._m33, 0.0));
            float _4056 = dot(_4052, _29._m26);
            vec2 _4066 = ((((_4052 + (_29._m26 * (sqrt(fma(_4056, _4056, fma(_29._m31.z, _29._m31.z, -dot(_4052, _4052)))) - _4056))).xz * _29._m31.w) * 0.5) + vec2(0.5)) + _29._m31.xy;
            _4066.x = 1.0 - _4066.x;
            _4078 = _3988 * (1.0 - clamp(mix(textureLod(sampler2D(_24, _7), _4038, 0.0).x, textureLod(sampler2D(_25, _7), _4066, 0.0).x, _29._m16) * _29._m17, 0.0, 1.0));
        }
        else
        {
            _4078 = _3988;
        }
        float _4150;
        SPIRV_CROSS_BRANCH
        if (_577)
        {
            float _4085 = 1.0 - abs(dot(_518, _29._m0));
            vec4 _4092 = vec4(_579 - (_518 * (0.0199999995529651641845703125 * _4085)), 1.0);
            float _4148;
            int _4094 = 0;
            SPIRV_CROSS_UNROLL
            for (;;)
            {
                if (_4094 < 4)
                {
                    vec4 _4102 = _4092 * _21._m10[_4094];
                    uint _4103 = uint(_4094);
                    vec2 _4118 = clamp((vec2(1.0) - abs((clamp(_4102.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / vec2(_21._m6), vec2(0.0), vec2(1.0));
                    float _4119 = _4102.z;
                    if (((_4118.x * _4118.y) * clamp((clamp(_4119, 0.0, 1.0) * _21._m8[_4103]) / ((_21._m9[_4103] * 0.5) * _21._m6), 0.0, 1.0)) > 0.0)
                    {
                        _4148 = fma(0.0199999995529651641845703125, _4085, abs(fma(1.0 - _4119, _21._m8[_4103], -((1.0 - textureLod(sampler2DArray(_8, _14), vec3(_4102.xy, float(_4094)), 0.0).x) * _21._m8[_4103]))));
                        break;
                    }
                    _4094++;
                    continue;
                }
                else
                {
                    _4148 = 0.0;
                    break;
                }
            }
            _4150 = _4148 * 1000.0;
        }
        else
        {
            _4150 = 0.0;
        }
        vec3 _4152 = _3890 * (_4078 * _6._m0[0u]);
        vec3 _4356;
        vec3 _4357;
        SPIRV_CROSS_BRANCH
        if (_659)
        {
            vec3 _4266 = reflect(_581, _518);
            float _4268 = spvNMax(dot(_518, _581), 9.9999997473787516355514526367188e-06);
            float _4272 = clamp(dot(_29._m0, normalize(_581 + _29._m0)), 0.0, 1.0);
            float _4274 = clamp(dot(_518, _29._m0), 0.0, 1.0);
            vec3 _4281 = vec3(fma((2.0 * _4272) * _4272, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
            float _4300 = dot(_29._m0, _4266);
            vec3 _4310 = mix(_4266, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_4266 - (_29._m0 * _4300)) * 0.0045900647528469562530517578125)), bvec3(_4300 < 0.999989449977874755859375));
            vec3 _4312 = normalize(_581 + _4310);
            float _4316 = clamp(dot(_518, _4312), 0.0, 1.0);
            float _4318 = clamp(dot(_518, _4310), 0.0, 1.0);
            float _4320 = (_610 + 1.0) * 0.5;
            float _4321 = _610 * _610;
            float _4329 = _4320 * _4320;
            float _4341 = _4321 * _4321;
            float _4344 = fma(fma(_4316, _4341, -_4316), _4316, 1.0);
            _4356 = _3321 + ((_4152 * ((_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - clamp(dot(_4310, _4312), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_4318, sqrt(fma(fma(-_4268, _4329, _4268), _4268, _4329)), _4268 * sqrt(fma(fma(-_4318, _4329, _4318), _4318, _4329)))) * (_4341 * (0.3183098733425140380859375 / (_4344 * _4344)))))) * _4274);
            _4357 = _3322 + ((_4152 * (_524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_4281 * pow(spvNMax(abs(1.0 - _4274), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_4281 * pow(spvNMax(abs(1.0 - _4268), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))))) * _4274);
        }
        else
        {
            vec3 _4262;
            vec3 _4263;
            if (_519)
            {
                vec3 _4161 = reflect(_581, _518);
                float _4163 = spvNMax(dot(_518, _581), 9.9999997473787516355514526367188e-06);
                float _4167 = clamp(dot(_29._m0, normalize(_581 + _29._m0)), 0.0, 1.0);
                float _4169 = clamp(dot(_518, _29._m0), 0.0, 1.0);
                vec3 _4176 = vec3(fma((2.0 * _4167) * _4167, _610, mix(0.0, 0.5, _610))) - vec3(1.0);
                float _4195 = dot(_29._m0, _4161);
                vec3 _4205 = mix(_4161, normalize((_29._m0 * 0.999989449977874755859375) + (normalize(_4161 - (_29._m0 * _4195)) * 0.0045900647528469562530517578125)), bvec3(_4195 < 0.999989449977874755859375));
                vec3 _4207 = normalize(_581 + _4205);
                float _4211 = clamp(dot(_518, _4207), 0.0, 1.0);
                float _4213 = clamp(dot(_518, _4205), 0.0, 1.0);
                float _4215 = (_610 + 1.0) * 0.5;
                float _4218 = _610 * _610;
                float _4219 = mix(_571 * _571, _4218, _498);
                float _4220 = mix(_572 * _572, _4218, _498);
                float _4228 = _4215 * _4215;
                float _4240 = _4219 * _4219;
                float _4241 = -_4211;
                float _4243 = fma(fma(_4211, _4240, _4241), _4211, 1.0);
                float _4247 = _4220 * _4220;
                float _4249 = fma(fma(_4211, _4247, _4241), _4211, 1.0);
                _4262 = _3321 + ((_4152 * ((_529 + ((vec3(1.0) - _529) * pow(spvNMax(abs(1.0 - clamp(dot(_4205, _4207), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_4213, sqrt(fma(fma(-_4163, _4228, _4163), _4163, _4228)), _4163 * sqrt(fma(fma(-_4213, _4228, _4213), _4213, _4228)))) * mix(_4240 * (0.3183098733425140380859375 / (_4243 * _4243)), _4247 * (0.3183098733425140380859375 / (_4249 * _4249)), _573)))) * _4169);
                _4263 = _3322 + ((_4152 * (_524 * (0.3183098733425140380859375 * (((vec3(1.0) + (_4176 * pow(spvNMax(abs(1.0 - _4169), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_4176 * pow(spvNMax(abs(1.0 - _4163), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _610))))) * _4169);
            }
            else
            {
                _4262 = _3321;
                _4263 = _3322;
            }
            _4356 = _4262;
            _4357 = _4263;
        }
        vec3 _4395;
        SPIRV_CROSS_BRANCH
        if (_576)
        {
            vec3 _4364 = vec3(1.0) / spvNMax((_568 * vec3(0.09660939872264862060546875)) * (_569 * _574), vec3(9.9999997473787516355514526367188e-05));
            vec3 _4382;
            SPIRV_CROSS_BRANCH
            if (_577)
            {
                vec3 _4378 = exp2(_4364 * ((-0.4808983504772186279296875) * spvNMax(_575, _4150)));
                _4382 = _570 * (_4378 * fma(_4378, _4378, vec3(3.0)));
            }
            else
            {
                vec3 _4370 = exp2(_4364 * ((-0.4808983504772186279296875) * _575));
                _4382 = (_570 * (_4370 * fma(_4370, _4370, vec3(3.0)))) * _4078;
            }
            _4395 = _4357 + ((_4382 * ((_3890 * clamp((0.2588190734386444091796875 - dot(_518, _29._m0)) * 0.631063938140869140625, 0.0, 1.0)) * (_524 * 0.3183098733425140380859375))) * _6._m0[0u]);
        }
        else
        {
            _4395 = _4357;
        }
        float _4415;
        float _4416;
        if (_37._m0.x > 0.0)
        {
            vec4 _4403 = textureLod(sampler2D(_43, _14), _434, 0.0);
            float _4404 = _4403.x;
            _4415 = clamp((pow(spvNMax(abs(dot(_518, _581) + _4404), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _610, -1.0))) - 1.0) + _4404, 0.0, 1.0);
            _4416 = _4404;
        }
        else
        {
            _4415 = 1.0;
            _4416 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _4416, 0.7);
            _4356 *= rdx_ao_factor;
            _4395 *= rdx_ao_factor;
        }
        vec3 _4424 = (_4395 * mix(1.0, _4416, _37._m0.y)) + ((_3407 * _3824) * _4416);
        vec3 _4426 = (_4356 * mix(1.0, _4415, _37._m0.y)) + ((_3404 * _3824) * _4415);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _4426 *= rdx_multi_scatter_compensation(_3370, _610, _529);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _3903, 0.5);
            _4424 *= _rdx_csm_shadow;
            _4426 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz) * _29._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _42, _7, _434, _rdx_marchDir, _476, vec2(_37._m1));
            _rdx_dbg_micro = _rdx_micro;
            _4424 *= _rdx_micro;
            _4426 *= _rdx_micro;
        }
        vec3 _4931;
        vec3 _4932;
        SPIRV_CROSS_BRANCH
        if (_3829)
        {
            vec3 _4434 = vec3(0.0, 636100.0, 0.0) + _30._m6;
            vec3 _4435 = vec3(0.0, 636100.0, 0.0) + (_579 + _30._m6);
            float _4436 = length(_4435);
            vec3 _4440 = (_4435 / vec3(_4436)) * spvNMax(_4436, 636100.0);
            vec3 _4441 = _4440 - _4434;
            float _4442 = length(_4441);
            vec3 _4444 = _4441 / vec3(_4442);
            float _4445 = length(_4434);
            vec3 _4459;
            vec3 _4460;
            float _4461;
            if (_4445 < (0.89999997615814208984375 * _32._m0))
            {
                vec3 _4454 = _4434;
                _4454.z = _4434.z + _32._m0;
                vec3 _4457 = _4440;
                _4457.z = _4440.z + _32._m0;
                _4459 = _4457;
                _4460 = _4454;
                _4461 = length(_4454);
            }
            else
            {
                _4459 = _4440;
                _4460 = _4434;
                _4461 = _4445;
            }
            float _4462 = dot(_4460, _4444);
            float _4473 = spvNMax((-_4462) - sqrt(fma(_32._m1, _32._m1, fma(_4462, _4462, -(_4461 * _4461)))), 0.0);
            bool _4476 = (_4473 > 0.0) && (_4473 < _4442);
            vec3 _4484;
            float _4485;
            float _4486;
            if (_4476)
            {
                _4484 = _4460 + (_4444 * _4473);
                _4485 = _4442 - _4473;
                _4486 = (_4462 + _4473) / _32._m1;
            }
            else
            {
                _4484 = _4460;
                _4485 = _4442;
                _4486 = _4462 / _4461;
            }
            float _4487 = _4476 ? _32._m1 : _4461;
            vec3 _4924;
            vec3 _4925;
            if (_4487 <= _32._m1)
            {
                float _4492 = dot(_4444, _29._m36);
                float _4494 = dot(_4484, _29._m36) / _4487;
                float _4495 = _32._m0 + 600.0;
                bool _4496 = _4487 < _4495;
                vec3 _4501;
                if (_4496)
                {
                    _4501 = _4459 * (_4495 / _4487);
                }
                else
                {
                    _4501 = _4459;
                }
                float _4502 = _4496 ? _4495 : _4487;
                float _4503 = length(_4501);
                float _4504 = dot(_4501, _4444);
                float _4506 = dot(_4501, _29._m36) / _4503;
                vec2 _4517 = vec2(_4486, _4486 + (_4485 / _4502));
                vec2 _4518 = _4517 * sqrt((0.5 / _32._m4) * _4502);
                vec2 _4521 = vec2(ivec2(sign(_4518)));
                vec2 _4522 = _4518 * _4518;
                float _4536 = -_4485;
                float _4538 = 2.0 * _4502;
                float _4540 = (_4485 / _4538) + _4486;
                float _4548 = _32._m0 - _4502;
                vec2 _4563 = _4517 * sqrt((0.5 / _32._m6) * _4502);
                vec2 _4566 = vec2(ivec2(sign(_4563)));
                vec2 _4567 = _4563 * _4563;
                vec3 _4597 = exp(((-_32._m5) * ((sqrt((6.283100128173828125 * _32._m4) * _4502) * exp(_4548 / _32._m4)) * (((_4521.y > _4521.x) ? exp(_4522.x) : 0.0) + dot((_4521 / ((abs(_4518) * 2.3192999362945556640625) + sqrt((_4522 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4536 / _32._m4) * _4540)), vec2(1.0, -1.0))))) - (_32._m8 * ((sqrt((6.283100128173828125 * _32._m6) * _4502) * exp(_4548 / _32._m6)) * (((_4566.y > _4566.x) ? exp(_4567.x) : 0.0) + dot((_4566 / ((abs(_4563) * 2.3192999362945556640625) + sqrt((_4567 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4536 / _32._m6) * _4540)), vec2(1.0, -1.0))))));
                vec3 _4598 = spvNMin(_4597, vec3(1.0));
                float _4599 = _32._m0 / _4502;
                float _4602 = sqrt(fma(-_4599, _4599, 1.0));
                float _4604 = _4486 - (-_4602);
                vec4 _4887;
                if (abs(_4604) < 0.0040000001899898052215576171875)
                {
                    float _4712 = (-0.0040000001899898052215576171875) - _4602;
                    float _4714 = fma(_4502, _4502, _4485 * _4485);
                    float _4715 = _4538 * _4485;
                    float _4717 = sqrt(fma(_4715, _4712, _4714));
                    float _4718 = fma(_4502, _4712, _4485);
                    float _4721 = -(_32._m0 * _32._m0);
                    float _4723 = sqrt(fma(_32._m1, _32._m1, _4721));
                    float _4725 = sqrt(fma(_4502, _4502, _4721));
                    float _4726 = _4502 * _4712;
                    float _4728 = -(_4502 * _4502);
                    float _4730 = fma(_32._m0, _32._m0, fma(_4726, _4726, _4728));
                    vec4 _4736 = vec4(-1.0, _4723 * _4723, _4723, 0.50390625);
                    vec4 _4737 = mix(_4736, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4726 < 0.0) && (_4730 > 0.0)));
                    float _4739 = fma(_4725 / _4723, 0.96875, 0.015625);
                    float _4749 = fma(fma(_4726, _4737.x, sqrt(_4730 + _4737.y)) / (_4725 + _4737.z), 0.4921875, _4737.w);
                    float _4755 = _4492 + 1.0;
                    float _4757 = floor(_4755 * 3.5);
                    float _4759 = fma(_4755, 3.5, -_4757);
                    float _4760 = _4757 + fma(fma(atan(spvNMax(_4494, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4761 = _4760 * 0.125;
                    float _4765 = 1.0 - _4759;
                    float _4768 = (_4760 + 1.0) * 0.125;
                    float _4775 = sqrt(fma(_4717, _4717, _4721));
                    float _4779 = fma(_32._m0, _32._m0, fma(_4718, _4718, -(_4717 * _4717)));
                    vec4 _4784 = mix(_4736, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4718 < 0.0) && (_4779 > 0.0)));
                    float _4786 = fma(_4775 / _4723, 0.96875, 0.015625);
                    float _4796 = fma(fma(_4718, _4784.x, sqrt(_4779 + _4784.y)) / (_4775 + _4784.z), 0.4921875, _4784.w);
                    float _4802 = _4757 + fma(fma(atan(spvNMax(_4506, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4803 = _4802 * 0.125;
                    float _4809 = (_4802 + 1.0) * 0.125;
                    vec4 _4815 = _4598.xyzx;
                    float _4819 = 0.0040000001899898052215576171875 - _4602;
                    float _4821 = sqrt(fma(_4715, _4819, _4714));
                    float _4822 = fma(_4502, _4819, _4485);
                    float _4823 = _4502 * _4819;
                    float _4825 = fma(_32._m0, _32._m0, fma(_4823, _4823, _4728));
                    vec4 _4830 = mix(_4736, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4823 < 0.0) && (_4825 > 0.0)));
                    float _4840 = fma(fma(_4823, _4830.x, sqrt(_4825 + _4830.y)) / (_4725 + _4830.z), 0.4921875, _4830.w);
                    float _4851 = sqrt(fma(_4821, _4821, _4721));
                    float _4855 = fma(_32._m0, _32._m0, fma(_4822, _4822, -(_4821 * _4821)));
                    vec4 _4860 = mix(_4736, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4822 < 0.0) && (_4855 > 0.0)));
                    float _4862 = fma(_4851 / _4723, 0.96875, 0.015625);
                    float _4872 = fma(fma(_4822, _4860.x, sqrt(_4855 + _4860.y)) / (_4851 + _4860.z), 0.4921875, _4860.w);
                    _4887 = mix(spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_4803, _4796, _4786), 0.0) * _4765) + (textureLod(sampler3D(_34, _7), vec3(_4809, _4796, _4786), 0.0) * _4759)), _4815, (textureLod(sampler3D(_34, _7), vec3(_4761, _4749, _4739), 0.0) * _4765) + (textureLod(sampler3D(_34, _7), vec3(_4768, _4749, _4739), 0.0) * _4759)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_4803, _4872, _4862), 0.0) * _4765) + (textureLod(sampler3D(_34, _7), vec3(_4809, _4872, _4862), 0.0) * _4759)), _4815, (textureLod(sampler3D(_34, _7), vec3(_4761, _4840, _4739), 0.0) * _4765) + (textureLod(sampler3D(_34, _7), vec3(_4768, _4840, _4739), 0.0) * _4759)), vec4(0.0)), vec4((_4604 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _4612 = -(_32._m0 * _32._m0);
                    float _4614 = sqrt(fma(_32._m1, _32._m1, _4612));
                    float _4616 = sqrt(fma(_4502, _4502, _4612));
                    float _4617 = _4502 * _4486;
                    float _4621 = fma(_32._m0, _32._m0, fma(_4617, _4617, -(_4502 * _4502)));
                    vec4 _4627 = vec4(-1.0, _4614 * _4614, _4614, 0.50390625);
                    vec4 _4628 = mix(_4627, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4617 < 0.0) && (_4621 > 0.0)));
                    float _4630 = fma(_4616 / _4614, 0.96875, 0.015625);
                    float _4640 = fma(fma(_4617, _4628.x, sqrt(_4621 + _4628.y)) / (_4616 + _4628.z), 0.4921875, _4628.w);
                    float _4646 = _4492 + 1.0;
                    float _4648 = floor(_4646 * 3.5);
                    float _4650 = fma(_4646, 3.5, -_4648);
                    float _4651 = _4648 + fma(fma(atan(spvNMax(_4494, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4656 = 1.0 - _4650;
                    float _4666 = sqrt(fma(_4503, _4503, _4612));
                    float _4670 = fma(_32._m0, _32._m0, fma(_4504, _4504, -(_4503 * _4503)));
                    vec4 _4675 = mix(_4627, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4504 < 0.0) && (_4670 > 0.0)));
                    float _4677 = fma(_4666 / _4614, 0.96875, 0.015625);
                    float _4687 = fma(fma(_4504, _4675.x, sqrt(_4670 + _4675.y)) / (_4666 + _4675.z), 0.4921875, _4675.w);
                    float _4693 = _4648 + fma(fma(atan(spvNMax(_4506, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _4887 = spvNMax(fma(-((textureLod(sampler3D(_34, _7), vec3(_4693 * 0.125, _4687, _4677), 0.0) * _4656) + (textureLod(sampler3D(_34, _7), vec3((_4693 + 1.0) * 0.125, _4687, _4677), 0.0) * _4650)), _4598.xyzx, (textureLod(sampler3D(_34, _7), vec3(_4651 * 0.125, _4640, _4630), 0.0) * _4656) + (textureLod(sampler3D(_34, _7), vec3((_4651 + 1.0) * 0.125, _4640, _4630), 0.0) * _4650)), vec4(0.0));
                }
                float _4902 = fma(_4492, _4492, 1.0);
                _4924 = _4598;
                _4925 = (_4887.xyz * (0.0596831031143665313720703125 * _4902)) + ((((_4887.xyz * (_4887.w * smoothstep(0.0, 0.0199999995529651641845703125, _4494))) / vec3(spvNMax(_4887.x, 9.9999997473787516355514526367188e-05))) * (vec3(_32._m5.x) / _32._m5)) * ((((0.119366206228733062744140625 * fma(-_32._m9, _32._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_32._m9 * (-2.0), _4492, fma(_32._m9, _32._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _4902) / fma(_32._m9, _32._m9, 2.0)));
            }
            else
            {
                _4924 = vec3(1.0);
                _4925 = vec3(0.0);
            }
            _4931 = _4426 * _4924;
            _4932 = fma(_4424, _4924, _4925 * ((_29._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _4931 = _4426;
            _4932 = _4424;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_29._m6[0].xyz, _29._m6[1].xyz, _29._m6[2].xyz) * _29._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_42, _7, _434, _rdx_dir, _476, vec2(_37._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _4932 = vec3(_rdx_vis);
            _4931 = vec3(0.0);
        }
        imageStore(_46, ivec2(_417), vec4(_4932, 1.0));
        imageStore(_47, ivec2(_417), vec4(_4931, 1.0));
        break;
    } while(false);
}

