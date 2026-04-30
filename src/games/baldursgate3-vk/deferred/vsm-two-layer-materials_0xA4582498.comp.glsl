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

float _313;
const vec4 _324[4] = vec4[](vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
vec3 _359;
vec3 _364;
vec3 _365;

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
        uint _408 = (((_36._m2 & 1u) != 0u) ? ((_36._m3 - 1u) - gl_WorkGroupID.x) : gl_WorkGroupID.x) + ((_36._m2 / 2u) * _36._m3);
        uint _410 = _44._m0[_408];
        uvec2 _415 = (uvec2(_410 & 65535u, _410 >> 16u) * uvec2(8u)) + uvec2((gl_LocalInvocationIndex & 1u) | (((gl_LocalInvocationIndex >> 2u) & 7u) & 4294967294u), (((gl_LocalInvocationIndex >> 1u) & 3u) & 3u) | (((gl_LocalInvocationIndex >> 3u) & 7u) & 4294967292u));
        if (any(lessThan(_415, _30._m3)) || any(greaterThan(_415, _30._m4)))
        {
            break;
        }
        vec2 _427 = vec2(_415);
        vec2 _432 = (_427 + vec2(0.5)) / vec2(_36._m1);
        vec2 _439 = ((_432 - _30._m1) / _30._m0) * 0.5;
        float _443 = _439.x;
        float _445 = _439.y;
        ivec2 _463 = ivec3(int(_415.x), int(_415.y), 0).xy;
        vec4 _467 = texelFetch(_38, _463, 0);
        vec4 _469 = texelFetch(_39, _463, 0);
        vec4 _471 = texelFetch(_40, _463, 0);
        vec4 _473 = texelFetch(_41, _463, 0);
        float _474 = _473.x;
        vec3 _492;
        do
        {
            vec3 _480 = fma(vec3(texelFetch(_37, _463, 0).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _481 = dot(_480, _480);
            if (_481 > 54000001024.0)
            {
                _492 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _486 = 2.0 / _481;
                vec2 _488 = _480.xy * _486;
                vec3 _489 = vec3(_488.x, _488.y, _364.z);
                _489.z = 1.0 - _486;
                _492 = _489;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _495 = _469.y;
        float _496 = _469.z;
        uint _500 = uint(roundEven(_469.w * 255.0));
        uint _501 = _500 & 7u;
        uint _503 = (_500 & 112u) >> 4u;
        vec3 _513 = _492 * mat3(_28._m6[0].xyz, _28._m6[1].xyz, _28._m6[2].xyz);
        vec3 _516 = vec3(_467.x, _467.y, _467.z) * (1.0 - _496);
        vec3 _521 = mix(vec3(0.1599999964237213134765625 * (_495 * _495)), _467.xyz, vec3(_496));
        float _522 = spvNMax(0.0900000035762786865234375, _469.x);
        bool _523 = _501 == 4u;
        vec3 _546;
        float _547;
        vec3 _548;
        float _549;
        bool _550;
        bool _551;
        if (_523)
        {
            uint _529 = uint(int(_471.x * 255.0));
            bool _544 = _12._m0[_529]._m2.z == 1.0;
            _546 = _12._m0[_529]._m0.xyz;
            _547 = _12._m0[_529]._m0.w;
            _548 = _12._m0[_529]._m1.xyz;
            _549 = fma(_12._m0[_529]._m2.y, _471.z, _12._m0[_529]._m2.x);
            _550 = _544;
            _551 = !_544;
        }
        else
        {
            _546 = vec3(1.0);
            _547 = 0.0;
            _548 = vec3(1.0);
            _549 = 0.0;
            _550 = false;
            _551 = false;
        }
        vec3 _553 = (((_28._m7[0].xyz * ((1.0 - _443) - _445)) + (_28._m7[1].xyz * _443)) + (_28._m7[2].xyz * _445)) * _474;
        vec3 _555 = normalize(-_553);
        uint _557 = gl_SubgroupInvocationID & 3u;
        float _562 = ((_557 & 1u) != 0u) ? (-1.0) : 1.0;
        vec3 _563 = (subgroupQuadSwapHorizontal(_492) - _492) * _562;
        float _568 = ((_557 & 2u) != 0u) ? (-1.0) : 1.0;
        vec3 _569 = (subgroupQuadSwapVertical(_492) - _492) * _568;
        vec3 _573 = mix(_563, vec3(0.0), bvec3(any(isnan(_563))));
        vec3 _577 = mix(_569, vec3(0.0), bvec3(any(isnan(_569))));
        float _584 = sqrt(clamp(fma(_522, _522, spvNMin(dot(_573, _573) + dot(_577, _577), 0.180000007152557373046875)), 0.0, 1.0));
        ivec2 _593 = ivec2(uvec2(_427) / uvec2(_21._m25));
        int _616 = int(fma(fma(float(int(clamp(fma(log2(_474 * _29._m4), _21._m21, _21._m22), 0.0, float(_21._m26)))), _21._m24, float(_593.y)), _21._m23, float(_593.x)));
        float _619 = _427.x;
        float _620 = _427.y;
        float _625 = fract(52.98291778564453125 * fract(fma(0.067110560834407806396484375, _619, 0.005837149918079376220703125 * _620)));
        float _632 = clamp(fma(_21._m34.y, length(_553), _21._m34.x), 0.0, 1.0);
        bool _633 = _501 == 0u;
        vec3 _3180;
        vec3 _3181;
        SPIRV_CROSS_BRANCH
        if (_633)
        {
            uvec4 _2139 = uvec4(_9._m0[uint(_616)]);
            uint _2140 = _2139.x;
            uint _2141 = _2139.y;
            uint _2144 = ((_2141 >> 0u) & 4095u) + _2140;
            uint _2147 = ((_2141 >> 12u) & 4095u) + _2144;
            uint _2151 = ((_2139.z >> 0u) & 1023u) + _2147;
            float _2153 = spvNMax(dot(_513, _555), 9.9999997473787516355514526367188e-06);
            float _2155;
            bool _2158;
            vec3 _2160;
            vec3 _2162;
            uint _2164;
            _2155 = _313;
            _2158 = false;
            _2160 = vec3(0.0);
            _2162 = vec3(0.0);
            _2164 = _2140;
            float _2156;
            bool _2159;
            vec3 _2161;
            vec3 _2163;
            for (; _2164 < _2144; _2155 = _2156, _2158 = _2159, _2160 = _2161, _2162 = _2163, _2164++)
            {
                uint _2171 = uint(_10._m0[_2164]);
                float _2189 = abs(_11._m0[_2171]._m5);
                if ((_11._m0[_2171]._m6 & (1u << (_503 & 31u))) != 0u)
                {
                    vec3 _2204 = _11._m0[_2171]._m0.xyz - _553;
                    float _2205 = dot(_2204, _2204);
                    vec3 _2208 = _2204 * inversesqrt(spvNMax(_2205, 1.0000000133514319600180897396058e-10));
                    float _2209 = _11._m0[_2171]._m0.w * _11._m0[_2171]._m0.w;
                    float _2448;
                    bool _2449;
                    vec3 _2450;
                    vec3 _2451;
                    if (_2205 < (1.0 / _2209))
                    {
                        vec3 _2214 = _555 + _2208;
                        vec3 _2218 = _2214 * inversesqrt(spvNMax(dot(_2214, _2214), 1.0000000133514319600180897396058e-10));
                        float _2220 = clamp(dot(_2208, _2218), 0.0, 1.0);
                        float _2222 = clamp(dot(_513, _2218), 0.0, 1.0);
                        float _2224 = clamp(dot(_513, _2208), 0.0, 1.0);
                        float _2225 = _2205 * _2209;
                        float _2231 = pow(spvNMax(abs(clamp(fma(-_2225, _2225, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_2171]._m4);
                        float _2241;
                        if (_11._m0[_2171]._m5 < 0.0)
                        {
                            _2241 = _2231 * fma(4.0, _2209, _2189);
                        }
                        else
                        {
                            _2241 = _2231 * ((1.0 / spvNMax(_2205, 9.9999997473787516355514526367188e-05)) + _2189);
                        }
                        float _2243 = 0.079577468335628509521484375 * (_2224 * _2241);
                        float _2379;
                        bool _2380;
                        float _2381;
                        if ((_11._m0[_2171]._m7 & 1u) != 0u)
                        {
                            uint _2268;
                            do
                            {
                                vec3 _2248 = -_2208;
                                float _2249 = dot(_2248, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                float _2250 = dot(_2248, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                float _2251 = dot(_2248, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                float _2255 = spvNMax(spvNMax(_2249, _2250), spvNMax(_2251, dot(_2248, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                if (_2255 == _2249)
                                {
                                    _2268 = 0u;
                                    break;
                                }
                                else
                                {
                                    if (_2255 == _2250)
                                    {
                                        _2268 = 1u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_2255 == _2251)
                                        {
                                            _2268 = 2u;
                                            break;
                                        }
                                        else
                                        {
                                            _2268 = 3u;
                                            break;
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            } while(false);
                            uint _2270 = uint(int(_11._m0[_2171]._m7 >> 2u)) + _2268;
                            float _2373;
                            bool _2374;
                            float _2375;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2224 <= 0.0) && (!_551))
                                {
                                    _2373 = _2155;
                                    _2374 = _2158;
                                    _2375 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2304 = _22._m0[_2270]._m0 * vec4(_553 + (_513 * ((3.5 * float(int(sign(_2224)))) * (_22._m0[_2270]._m4 * sqrt(_2205)))), 1.0);
                                    vec3 _2308 = _2304.xyz / vec3(_2304.w);
                                    vec2 _2311 = (_2308.xy * 0.5) + vec2(0.5);
                                    _2311.y = 1.0 - _2311.y;
                                    float _2320 = (_22._m0[_2270]._m5.y / _22._m0[_2270]._m6) / (_2308.z - _22._m0[_2270]._m5.x);
                                    float _2325 = _2158 ? _2155 : 6.283185482025146484375;
                                    float _2326 = _625 * _2325;
                                    vec2 _2327 = _22._m0[_2270]._m1 + _21._m33;
                                    vec2 _2330 = (_22._m0[_2270]._m1 + vec2(_22._m0[_2270]._m2)) - _21._m33;
                                    float _2332;
                                    _2332 = 0.0;
                                    for (int _2335 = 0; _2335 < 12; )
                                    {
                                        float _2340 = float(uint(_2335));
                                        float _2343 = sqrt(_2340 + 0.5) * 0.288675129413604736328125;
                                        float _2344 = fma(_2340, 2.3999631404876708984375, _2326);
                                        vec2 _2352 = clamp(fma((vec3(cos(_2344), sin(_2344), _2343).xy * _2343) * 2.5, _21._m33, _2311), _2327, _2330);
                                        vec2 _2355 = fract(fma(vec2(1.0) / _21._m33, _2352, vec2(0.5)));
                                        vec4 _2361 = vec4(lessThan(vec4(_2320), textureGather(sampler2D(_23, _14), _2352)));
                                        float _2364 = _2355.x;
                                        _2332 += clamp(mix(mix(_2361.w, _2361.z, _2364), mix(_2361.x, _2361.y, _2364), _2355.y), 0.0, 1.0);
                                        _2335++;
                                        continue;
                                    }
                                    _2373 = _2325;
                                    _2374 = _2158 ? _2158 : true;
                                    _2375 = _2332 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2379 = _2373;
                            _2380 = _2374;
                            _2381 = _2243 * mix(1.0, _2375, spvNMin(_632, _11._m0[_2171]._m8));
                        }
                        else
                        {
                            _2379 = _2155;
                            _2380 = _2158;
                            _2381 = _2243;
                        }
                        vec3 _2446;
                        vec3 _2447;
                        if (_2224 > 0.0)
                        {
                            vec3 _2387 = _11._m0[_2171]._m1.xyz * (_2381 * ((_11._m0[_2171]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2394 = vec3(fma((2.0 * _2220) * _2220, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                            float _2415 = (_584 + 1.0) * 0.5;
                            float _2416 = _584 * _584;
                            float _2424 = _2415 * _2415;
                            float _2436 = _2416 * _2416;
                            float _2439 = fma(fma(_2222, _2436, -_2222), _2222, 1.0);
                            _2446 = fma(_2387, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _2220), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2224, sqrt(fma(fma(-_2153, _2424, _2153), _2153, _2424)), _2153 * sqrt(fma(fma(-_2224, _2424, _2224), _2224, _2424)))) * (_2436 * (0.3183098733425140380859375 / (_2439 * _2439)))), _2160);
                            _2447 = fma(_2387, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2394 * pow(spvNMax(abs(1.0 - _2224), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2394 * pow(spvNMax(abs(1.0 - _2153), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _2162);
                        }
                        else
                        {
                            _2446 = _2160;
                            _2447 = _2162;
                        }
                        _2448 = _2379;
                        _2449 = _2380;
                        _2450 = _2446;
                        _2451 = _2447;
                    }
                    else
                    {
                        _2448 = _2155;
                        _2449 = _2158;
                        _2450 = _2160;
                        _2451 = _2162;
                    }
                    _2156 = _2448;
                    _2159 = _2449;
                    _2161 = _2450;
                    _2163 = _2451;
                }
                else
                {
                    _2156 = _2155;
                    _2159 = _2158;
                    _2161 = _2160;
                    _2163 = _2162;
                }
            }
            float _2453;
            bool _2456;
            vec3 _2458;
            vec3 _2460;
            uint _2462;
            _2453 = _2155;
            _2456 = _2158;
            _2458 = _2160;
            _2460 = _2162;
            _2462 = _2164;
            float _2454;
            bool _2457;
            vec3 _2459;
            vec3 _2461;
            for (; _2462 < _2147; _2453 = _2454, _2456 = _2457, _2458 = _2459, _2460 = _2461, _2462++)
            {
                uint _2469 = uint(_10._m0[_2462]);
                float _2482 = abs(_11._m0[_2469]._m5);
                if ((_11._m0[_2469]._m6 & (1u << (_503 & 31u))) != 0u)
                {
                    vec3 _2500 = _11._m0[_2469]._m0.xyz - _553;
                    float _2501 = dot(_2500, _2500);
                    vec3 _2504 = _2500 * inversesqrt(spvNMax(_2501, 1.0000000133514319600180897396058e-10));
                    float _2505 = _11._m0[_2469]._m0.w * _11._m0[_2469]._m0.w;
                    float _2734;
                    bool _2735;
                    vec3 _2736;
                    vec3 _2737;
                    if (_2501 < (1.0 / _2505))
                    {
                        vec3 _2510 = _555 + _2504;
                        vec3 _2514 = _2510 * inversesqrt(spvNMax(dot(_2510, _2510), 1.0000000133514319600180897396058e-10));
                        float _2516 = clamp(dot(_2504, _2514), 0.0, 1.0);
                        float _2518 = clamp(dot(_513, _2514), 0.0, 1.0);
                        float _2520 = clamp(dot(_513, _2504), 0.0, 1.0);
                        float _2523 = dot(-_2504, normalize(_11._m0[_2469]._m2.xyz));
                        float _2552;
                        if (_2523 > _11._m0[_2469]._m1.w)
                        {
                            float _2527 = _2501 * _2505;
                            float _2533 = pow(spvNMax(abs(clamp(fma(-_2527, _2527, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_2469]._m4);
                            float _2543;
                            if (_11._m0[_2469]._m5 < 0.0)
                            {
                                _2543 = _2533 * fma(4.0, _2505, _2482);
                            }
                            else
                            {
                                _2543 = _2533 * ((1.0 / spvNMax(_2501, 9.9999997473787516355514526367188e-05)) + _2482);
                            }
                            float _2548 = clamp((_2523 - _11._m0[_2469]._m1.w) / spvNMax(_11._m0[_2469]._m2.w - _11._m0[_2469]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                            _2552 = _2520 * (_2543 * (_2548 * _2548));
                        }
                        else
                        {
                            _2552 = 0.0;
                        }
                        float _2553 = 0.3183098733425140380859375 * _2552;
                        float _2665;
                        bool _2666;
                        float _2667;
                        if ((_11._m0[_2469]._m7 & 1u) != 0u)
                        {
                            uint _2556 = uint(int(_11._m0[_2469]._m7 >> 2u));
                            float _2659;
                            bool _2660;
                            float _2661;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2520 <= 0.0) && (!_551))
                                {
                                    _2659 = _2453;
                                    _2660 = _2456;
                                    _2661 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2590 = _22._m0[_2556]._m0 * vec4(_553 + (_513 * ((3.5 * float(int(sign(_2520)))) * (_22._m0[_2556]._m4 * sqrt(_2501)))), 1.0);
                                    vec3 _2594 = _2590.xyz / vec3(_2590.w);
                                    vec2 _2597 = (_2594.xy * 0.5) + vec2(0.5);
                                    _2597.y = 1.0 - _2597.y;
                                    float _2606 = (_22._m0[_2556]._m5.y / _22._m0[_2556]._m6) / (_2594.z - _22._m0[_2556]._m5.x);
                                    float _2611 = _2456 ? _2453 : 6.283185482025146484375;
                                    float _2612 = _625 * _2611;
                                    vec2 _2613 = _22._m0[_2556]._m1 + _21._m33;
                                    vec2 _2616 = (_22._m0[_2556]._m1 + vec2(_22._m0[_2556]._m2)) - _21._m33;
                                    float _2618;
                                    _2618 = 0.0;
                                    for (int _2621 = 0; _2621 < 12; )
                                    {
                                        float _2626 = float(uint(_2621));
                                        float _2629 = sqrt(_2626 + 0.5) * 0.288675129413604736328125;
                                        float _2630 = fma(_2626, 2.3999631404876708984375, _2612);
                                        vec2 _2638 = clamp(fma((vec3(cos(_2630), sin(_2630), _2629).xy * _2629) * 2.5, _21._m33, _2597), _2613, _2616);
                                        vec2 _2641 = fract(fma(vec2(1.0) / _21._m33, _2638, vec2(0.5)));
                                        vec4 _2647 = vec4(lessThan(vec4(_2606), textureGather(sampler2D(_23, _14), _2638)));
                                        float _2650 = _2641.x;
                                        _2618 += clamp(mix(mix(_2647.w, _2647.z, _2650), mix(_2647.x, _2647.y, _2650), _2641.y), 0.0, 1.0);
                                        _2621++;
                                        continue;
                                    }
                                    _2659 = _2611;
                                    _2660 = _2456 ? _2456 : true;
                                    _2661 = _2618 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _2665 = _2659;
                            _2666 = _2660;
                            _2667 = _2553 * mix(1.0, _2661, spvNMin(_632, _11._m0[_2469]._m8));
                        }
                        else
                        {
                            _2665 = _2453;
                            _2666 = _2456;
                            _2667 = _2553;
                        }
                        vec3 _2732;
                        vec3 _2733;
                        if (_2520 > 0.0)
                        {
                            vec3 _2673 = _11._m0[_2469]._m1.xyz * (_2667 * ((_11._m0[_2469]._m3 < 0.0) ? _6._m0[0u] : 1.0));
                            vec3 _2680 = vec3(fma((2.0 * _2516) * _2516, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                            float _2701 = (_584 + 1.0) * 0.5;
                            float _2702 = _584 * _584;
                            float _2710 = _2701 * _2701;
                            float _2722 = _2702 * _2702;
                            float _2725 = fma(fma(_2518, _2722, -_2518), _2518, 1.0);
                            _2732 = fma(_2673, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _2516), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2520, sqrt(fma(fma(-_2153, _2710, _2153), _2153, _2710)), _2153 * sqrt(fma(fma(-_2520, _2710, _2520), _2520, _2710)))) * (_2722 * (0.3183098733425140380859375 / (_2725 * _2725)))), _2458);
                            _2733 = fma(_2673, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2680 * pow(spvNMax(abs(1.0 - _2520), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2680 * pow(spvNMax(abs(1.0 - _2153), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _2460);
                        }
                        else
                        {
                            _2732 = _2458;
                            _2733 = _2460;
                        }
                        _2734 = _2665;
                        _2735 = _2666;
                        _2736 = _2732;
                        _2737 = _2733;
                    }
                    else
                    {
                        _2734 = _2453;
                        _2735 = _2456;
                        _2736 = _2458;
                        _2737 = _2460;
                    }
                    _2454 = _2734;
                    _2457 = _2735;
                    _2459 = _2736;
                    _2461 = _2737;
                }
                else
                {
                    _2454 = _2453;
                    _2457 = _2456;
                    _2459 = _2458;
                    _2461 = _2460;
                }
            }
            vec3 _2744;
            vec3 _2746;
            _2744 = _2458;
            _2746 = _2460;
            float _2740;
            bool _2743;
            vec3 _2745;
            vec3 _2747;
            float _2739 = _2453;
            bool _2742 = _2456;
            uint _2748 = _2462;
            for (; _2748 < _2151; _2739 = _2740, _2742 = _2743, _2744 = _2745, _2746 = _2747, _2748++)
            {
                uint _2755 = uint(_10._m0[_2748]);
                int _2784 = int(_13._m0[_2755]._m1 >> 1u) - 1;
                if (((_13._m0[_2755]._m4 & 16777215u) & (1u << (_503 & 31u))) != 0u)
                {
                    vec3 _2795 = _13._m0[_2755]._m6 * vec4(_553, 1.0);
                    float _3176;
                    bool _3177;
                    vec3 _3178;
                    vec3 _3179;
                    if (all(lessThan(abs(_2795 - vec3(0.5)), vec3(0.5))))
                    {
                        vec3 _2802 = _555 + _13._m0[_2755]._m9;
                        vec3 _2806 = _2802 * inversesqrt(spvNMax(dot(_2802, _2802), 1.0000000133514319600180897396058e-10));
                        float _2808 = clamp(dot(_13._m0[_2755]._m9, _2806), 0.0, 1.0);
                        float _2810 = clamp(dot(_513, _2806), 0.0, 1.0);
                        float _2812 = clamp(dot(_513, _13._m0[_2755]._m9), 0.0, 1.0);
                        int _2813 = int(_13._m0[_2755]._m4 >> 24u);
                        float _2814 = _2795.z;
                        vec3 _2853;
                        if (_2814 < _13._m0[_2755]._m2.x)
                        {
                            float _2841 = _2814 * _13._m0[_2755]._m2.z;
                            float _2844 = _2841 * _2841;
                            vec3 _2852;
                            _2852.z = dot(_324[_2813], vec4(_2841, _2844, smoothstep(0.0, 1.0, _2841), (_2844 * _2841) * fma(_2841, fma(_2841, 6.0, -15.0), 10.0)));
                            _2853 = _2852;
                        }
                        else
                        {
                            vec3 _2839;
                            if (_2814 > _13._m0[_2755]._m2.y)
                            {
                                float _2827 = (1.0 - _2814) * _13._m0[_2755]._m2.w;
                                float _2830 = _2827 * _2827;
                                vec3 _2838;
                                _2838.z = dot(_324[_2813], vec4(_2827, _2830, smoothstep(0.0, 1.0, _2827), (_2830 * _2827) * fma(_2827, fma(_2827, 6.0, -15.0), 10.0)));
                                _2839 = _2838;
                            }
                            else
                            {
                                _2839 = vec3(0.0, 0.0, 1.0);
                            }
                            _2853 = _2839;
                        }
                        vec2 _2854 = _2795.xy;
                        vec2 _2858 = (vec2(0.5) - abs(_2854 - vec2(0.5))) * _13._m0[_2755]._m3;
                        float _2859 = _2858.x;
                        vec3 _2876;
                        if (_2859 < 1.0)
                        {
                            float _2867 = _2859 * _2859;
                            vec3 _2875 = _2853;
                            _2875.x = dot(_324[_2813], vec4(_2859, _2867, smoothstep(0.0, 1.0, _2859), (_2867 * _2859) * fma(_2859, fma(_2859, 6.0, -15.0), 10.0)));
                            _2876 = _2875;
                        }
                        else
                        {
                            vec3 _2864 = _2853;
                            _2864.x = 1.0;
                            _2876 = _2864;
                        }
                        float _2877 = _2858.y;
                        vec3 _2894;
                        if (_2877 < 1.0)
                        {
                            float _2885 = _2877 * _2877;
                            vec3 _2893 = _2876;
                            _2893.y = dot(_324[_2813], vec4(_2877, _2885, smoothstep(0.0, 1.0, _2877), (_2885 * _2877) * fma(_2877, fma(_2877, 6.0, -15.0), 10.0)));
                            _2894 = _2893;
                        }
                        else
                        {
                            vec3 _2882 = _2876;
                            _2882.y = 1.0;
                            _2894 = _2882;
                        }
                        float _2900 = _2812 * ((_2894.x * _2894.y) * _2894.z);
                        float _3006;
                        bool _3007;
                        float _3008;
                        if ((_13._m0[_2755]._m8 & 1u) != 0u)
                        {
                            uint _2903 = uint(int(_13._m0[_2755]._m8 >> 2u));
                            float _3000;
                            bool _3001;
                            float _3002;
                            do
                            {
                                SPIRV_CROSS_BRANCH
                                if ((_2812 <= 0.0) && (!_551))
                                {
                                    _3000 = _2739;
                                    _3001 = _2742;
                                    _3002 = 0.0;
                                    break;
                                }
                                else
                                {
                                    vec4 _2935 = _22._m0[_2903]._m0 * vec4(_553 + (_513 * ((3.5 * float(int(sign(_2812)))) * _22._m0[_2903]._m4)), 1.0);
                                    vec2 _2938 = (_2935.xy * 0.5) + vec2(0.5);
                                    _2938.y = 1.0 - _2938.y;
                                    float _2947 = ((_2935.z - _22._m0[_2903]._m5.y) / _22._m0[_2903]._m5.x) / _22._m0[_2903]._m6;
                                    float _2952 = _2742 ? _2739 : 6.283185482025146484375;
                                    float _2953 = _625 * _2952;
                                    vec2 _2954 = _22._m0[_2903]._m1 + _21._m33;
                                    vec2 _2957 = (_22._m0[_2903]._m1 + vec2(_22._m0[_2903]._m2)) - _21._m33;
                                    float _2959;
                                    _2959 = 0.0;
                                    for (int _2962 = 0; _2962 < 12; )
                                    {
                                        float _2967 = float(uint(_2962));
                                        float _2970 = sqrt(_2967 + 0.5) * 0.288675129413604736328125;
                                        float _2971 = fma(_2967, 2.3999631404876708984375, _2953);
                                        vec2 _2979 = clamp(fma((vec3(cos(_2971), sin(_2971), _2970).xy * _2970) * 2.5, _21._m33, _2938), _2954, _2957);
                                        vec2 _2982 = fract(fma(vec2(1.0) / _21._m33, _2979, vec2(0.5)));
                                        vec4 _2988 = vec4(lessThan(vec4(_2947), textureGather(sampler2D(_23, _14), _2979)));
                                        float _2991 = _2982.x;
                                        _2959 += clamp(mix(mix(_2988.w, _2988.z, _2991), mix(_2988.x, _2988.y, _2991), _2982.y), 0.0, 1.0);
                                        _2962++;
                                        continue;
                                    }
                                    _3000 = _2952;
                                    _3001 = _2742 ? _2742 : true;
                                    _3002 = _2959 * 0.083333335816860198974609375;
                                    break;
                                }
                                break; // unreachable workaround
                            } while(false);
                            _3006 = _3000;
                            _3007 = _3001;
                            _3008 = _2900 * mix(1.0, _3002, spvNMin(_632, _13._m0[_2755]._m5));
                        }
                        else
                        {
                            _3006 = _2739;
                            _3007 = _2742;
                            _3008 = _2900;
                        }
                        vec3 _3041;
                        if (_2784 >= 0)
                        {
                            vec2 _3014 = (subgroupQuadSwapHorizontal(_2854) - _2854) * _562;
                            vec2 _3017 = (subgroupQuadSwapVertical(_2854) - _2854) * _568;
                            vec2 _3021 = mix(_3014, vec2(0.0), bvec2(any(isnan(_3014))));
                            vec2 _3025 = mix(_3017, vec2(0.0), bvec2(any(isnan(_3017))));
                            bvec2 _3034 = bvec2(any(greaterThan(abs(vec4(_3021, _3025)), vec4(0.015625))));
                            int _83 = _2784;
                            _3041 = _13._m0[_2755]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_83], _7)), _2854, mix(_3021, vec2(0.0), _3034), mix(_3025, vec2(0.0), _3034)).xyz;
                        }
                        else
                        {
                            _3041 = _13._m0[_2755]._m0;
                        }
                        vec3 _3174;
                        vec3 _3175;
                        SPIRV_CROSS_BRANCH
                        if ((_13._m0[_2755]._m1 & 1u) != 0u)
                        {
                            vec3 _3172;
                            vec3 _3173;
                            if (_2812 > 0.0)
                            {
                                vec3 _3113 = _3041 * (_3008 * _6._m0[0u]);
                                vec3 _3120 = vec3(fma((2.0 * _2808) * _2808, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                float _3141 = (_584 + 1.0) * 0.5;
                                float _3142 = _584 * _584;
                                float _3150 = _3141 * _3141;
                                float _3162 = _3142 * _3142;
                                float _3165 = fma(fma(_2810, _3162, -_2810), _2810, 1.0);
                                _3172 = fma(_3113, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _2808), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2812, sqrt(fma(fma(-_2153, _3150, _2153), _2153, _3150)), _2153 * sqrt(fma(fma(-_2812, _3150, _2812), _2812, _3150)))) * (_3162 * (0.3183098733425140380859375 / (_3165 * _3165)))), _2744);
                                _3173 = fma(_3113, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3120 * pow(spvNMax(abs(1.0 - _2812), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3120 * pow(spvNMax(abs(1.0 - _2153), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _2746);
                            }
                            else
                            {
                                _3172 = _2744;
                                _3173 = _2746;
                            }
                            _3174 = _3172;
                            _3175 = _3173;
                        }
                        else
                        {
                            vec3 _3107;
                            vec3 _3108;
                            if (_2812 > 0.0)
                            {
                                vec3 _3048 = _3041 * _3008;
                                vec3 _3055 = vec3(fma((2.0 * _2808) * _2808, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                float _3076 = (_584 + 1.0) * 0.5;
                                float _3077 = _584 * _584;
                                float _3085 = _3076 * _3076;
                                float _3097 = _3077 * _3077;
                                float _3100 = fma(fma(_2810, _3097, -_2810), _2810, 1.0);
                                _3107 = fma(_3048, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _2808), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_2812, sqrt(fma(fma(-_2153, _3085, _2153), _2153, _3085)), _2153 * sqrt(fma(fma(-_2812, _3085, _2812), _2812, _3085)))) * (_3097 * (0.3183098733425140380859375 / (_3100 * _3100)))), _2744);
                                _3108 = fma(_3048, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_3055 * pow(spvNMax(abs(1.0 - _2812), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_3055 * pow(spvNMax(abs(1.0 - _2153), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _2746);
                            }
                            else
                            {
                                _3107 = _2744;
                                _3108 = _2746;
                            }
                            _3174 = _3107;
                            _3175 = _3108;
                        }
                        _3176 = _3006;
                        _3177 = _3007;
                        _3178 = _3174;
                        _3179 = _3175;
                    }
                    else
                    {
                        _3176 = _2739;
                        _3177 = _2742;
                        _3178 = _2744;
                        _3179 = _2746;
                    }
                    _2740 = _3176;
                    _2743 = _3177;
                    _2745 = _3178;
                    _2747 = _3179;
                }
                else
                {
                    _2740 = _2739;
                    _2743 = _2742;
                    _2745 = _2744;
                    _2747 = _2746;
                }
            }
            _3180 = _2744;
            _3181 = _2746;
        }
        else
        {
            vec3 _2134;
            vec3 _2135;
            if (_523)
            {
                uvec4 _643 = uvec4(_9._m0[uint(_616)]);
                uint _644 = _643.x;
                uint _645 = _643.y;
                uint _648 = ((_645 >> 0u) & 4095u) + _644;
                uint _651 = ((_645 >> 12u) & 4095u) + _648;
                uint _655 = ((_643.z >> 0u) & 1023u) + _651;
                float _657 = spvNMax(dot(_513, _555), 9.9999997473787516355514526367188e-06);
                vec3 _659;
                vec3 _662;
                float _664;
                bool _666;
                uint _668;
                _659 = vec3(0.0);
                _662 = vec3(0.0);
                _664 = _313;
                _666 = false;
                _668 = _644;
                vec3 _660;
                vec3 _663;
                float _665;
                bool _667;
                for (; _668 < _648; _659 = _660, _662 = _663, _664 = _665, _666 = _667, _668++)
                {
                    uint _675 = uint(_10._m0[_668]);
                    float _693 = abs(_11._m0[_675]._m5);
                    bool _697 = _11._m0[_675]._m5 < 0.0;
                    if ((_11._m0[_675]._m6 & (1u << (_503 & 31u))) != 0u)
                    {
                        vec3 _708 = _11._m0[_675]._m0.xyz - _553;
                        float _709 = dot(_708, _708);
                        vec3 _712 = _708 * inversesqrt(spvNMax(_709, 1.0000000133514319600180897396058e-10));
                        float _713 = _11._m0[_675]._m0.w * _11._m0[_675]._m0.w;
                        vec3 _1100;
                        vec3 _1101;
                        float _1102;
                        bool _1103;
                        if (_709 < (1.0 / _713))
                        {
                            vec3 _718 = _555 + _712;
                            vec3 _722 = _718 * inversesqrt(spvNMax(dot(_718, _718), 1.0000000133514319600180897396058e-10));
                            float _724 = clamp(dot(_712, _722), 0.0, 1.0);
                            float _726 = clamp(dot(_513, _722), 0.0, 1.0);
                            float _727 = dot(_513, _712);
                            float _728 = clamp(_727, 0.0, 1.0);
                            float _729 = _709 * _713;
                            float _735 = pow(spvNMax(abs(clamp(fma(-_729, _729, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_675]._m4);
                            float _745;
                            if (_697)
                            {
                                _745 = _735 * fma(4.0, _713, _693);
                            }
                            else
                            {
                                _745 = _735 * ((1.0 / spvNMax(_709, 9.9999997473787516355514526367188e-05)) + _693);
                            }
                            float _747 = 0.079577468335628509521484375 * (_728 * _745);
                            float _913;
                            bool _914;
                            float _915;
                            float _916;
                            float _917;
                            if ((_11._m0[_675]._m7 & 1u) != 0u)
                            {
                                uint _772;
                                do
                                {
                                    vec3 _752 = -_712;
                                    float _753 = dot(_752, vec3(0.0, -0.57735025882720947265625, 0.8164966106414794921875));
                                    float _754 = dot(_752, vec3(0.0, -0.57735025882720947265625, -0.8164966106414794921875));
                                    float _755 = dot(_752, vec3(-0.8164966106414794921875, 0.57735025882720947265625, 0.0));
                                    float _759 = spvNMax(spvNMax(_753, _754), spvNMax(_755, dot(_752, vec3(0.8164966106414794921875, 0.57735025882720947265625, 0.0))));
                                    if (_759 == _753)
                                    {
                                        _772 = 0u;
                                        break;
                                    }
                                    else
                                    {
                                        if (_759 == _754)
                                        {
                                            _772 = 1u;
                                            break;
                                        }
                                        else
                                        {
                                            if (_759 == _755)
                                            {
                                                _772 = 2u;
                                                break;
                                            }
                                            else
                                            {
                                                _772 = 3u;
                                                break;
                                            }
                                            break; // unreachable workaround
                                        }
                                        break; // unreachable workaround
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                uint _774 = uint(int(_11._m0[_675]._m7 >> 2u)) + _772;
                                float _787 = sqrt(_709);
                                float _877;
                                bool _878;
                                float _879;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_727 <= 0.0) && (!_551))
                                    {
                                        _877 = _664;
                                        _878 = _666;
                                        _879 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _808 = _22._m0[_774]._m0 * vec4(_553 + (_513 * ((3.5 * float(int(sign(_727)))) * (_22._m0[_774]._m4 * _787))), 1.0);
                                        vec3 _812 = _808.xyz / vec3(_808.w);
                                        vec2 _815 = (_812.xy * 0.5) + vec2(0.5);
                                        _815.y = 1.0 - _815.y;
                                        float _824 = (_22._m0[_774]._m5.y / _22._m0[_774]._m6) / (_812.z - _22._m0[_774]._m5.x);
                                        float _829 = _666 ? _664 : 6.283185482025146484375;
                                        float _830 = _625 * _829;
                                        vec2 _831 = _22._m0[_774]._m1 + _21._m33;
                                        vec2 _834 = (_22._m0[_774]._m1 + vec2(_22._m0[_774]._m2)) - _21._m33;
                                        float _836;
                                        _836 = 0.0;
                                        for (int _839 = 0; _839 < 12; )
                                        {
                                            float _844 = float(uint(_839));
                                            float _847 = sqrt(_844 + 0.5) * 0.288675129413604736328125;
                                            float _848 = fma(_844, 2.3999631404876708984375, _830);
                                            vec2 _856 = clamp(fma((vec3(cos(_848), sin(_848), _847).xy * _847) * 2.5, _21._m33, _815), _831, _834);
                                            vec2 _859 = fract(fma(vec2(1.0) / _21._m33, _856, vec2(0.5)));
                                            vec4 _865 = vec4(lessThan(vec4(_824), textureGather(sampler2D(_23, _14), _856)));
                                            float _868 = _859.x;
                                            _836 += clamp(mix(mix(_865.w, _865.z, _868), mix(_865.x, _865.y, _868), _859.y), 0.0, 1.0);
                                            _839++;
                                            continue;
                                        }
                                        _877 = _829;
                                        _878 = _666 ? _666 : true;
                                        _879 = _836 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                float _881 = mix(1.0, _879, spvNMin(_632, _11._m0[_675]._m8));
                                float _912;
                                SPIRV_CROSS_BRANCH
                                if (_550)
                                {
                                    float _885 = _22._m0[_774]._m4 * _787;
                                    vec4 _892 = _22._m0[_774]._m0 * vec4(_553 - (_513 * _885), 1.0);
                                    float _893 = _892.w;
                                    _912 = fma(_885, clamp(dot(-_513, _712), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_892.xyz / vec3(_893)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_774]._m6, _893))) * 1000.0;
                                }
                                else
                                {
                                    _912 = 0.0;
                                }
                                _913 = _877;
                                _914 = _878;
                                _915 = _747 * _881;
                                _916 = _912;
                                _917 = _881;
                            }
                            else
                            {
                                _913 = _664;
                                _914 = _666;
                                _915 = _747;
                                _916 = 0.0;
                                _917 = 1.0;
                            }
                            vec3 _921 = vec3(1.0) / spvNMax((_546 * vec3(0.09660939872264862060546875)) * _547, vec3(9.9999997473787516355514526367188e-05));
                            vec3 _939;
                            SPIRV_CROSS_BRANCH
                            if (_550)
                            {
                                vec3 _935 = exp2(_921 * ((-0.4808983504772186279296875) * spvNMax(_549, _916)));
                                _939 = _548 * (_935 * fma(_935, _935, vec3(3.0)));
                            }
                            else
                            {
                                vec3 _927 = exp2(_921 * ((-0.4808983504772186279296875) * _549));
                                _939 = (_548 * (_927 * fma(_927, _927, vec3(3.0)))) * _917;
                            }
                            float _952;
                            if (_697)
                            {
                                _952 = _735 * fma(4.0, _713, _693);
                            }
                            else
                            {
                                _952 = _735 * ((1.0 / spvNMax(_709, 9.9999997473787516355514526367188e-05)) + _693);
                            }
                            float _953 = clamp((0.2588190734386444091796875 - _727) * 0.631063938140869140625, 0.0, 1.0) * _952;
                            vec3 _1098;
                            vec3 _1099;
                            SPIRV_CROSS_BRANCH
                            if (_11._m0[_675]._m3 < 0.0)
                            {
                                vec3 _1090;
                                vec3 _1091;
                                if (_728 > 0.0)
                                {
                                    vec3 _1031 = (_11._m0[_675]._m1.xyz * _915) * _6._m0[0u];
                                    vec3 _1038 = vec3(fma((2.0 * _724) * _724, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                    float _1059 = (_584 + 1.0) * 0.5;
                                    float _1060 = _584 * _584;
                                    float _1068 = _1059 * _1059;
                                    float _1080 = _1060 * _1060;
                                    float _1083 = fma(fma(_726, _1080, -_726), _726, 1.0);
                                    _1090 = fma(_1031, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _724), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_728, sqrt(fma(fma(-_657, _1068, _657), _657, _1068)), _657 * sqrt(fma(fma(-_728, _1068, _728), _728, _1068)))) * (_1080 * (0.3183098733425140380859375 / (_1083 * _1083)))), _659);
                                    _1091 = fma(_1031, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1038 * pow(spvNMax(abs(1.0 - _728), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1038 * pow(spvNMax(abs(1.0 - _657), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _662);
                                }
                                else
                                {
                                    _1090 = _659;
                                    _1091 = _662;
                                }
                                _1098 = _1090;
                                _1099 = _1091 + (((_939 * _11._m0[_675]._m1.xyz) * _516) * ((_953 * 0.0253302939236164093017578125) * _6._m0[0u]));
                            }
                            else
                            {
                                vec3 _1020;
                                vec3 _1021;
                                if (_728 > 0.0)
                                {
                                    vec3 _961 = (_11._m0[_675]._m1.xyz * _915) * 1.0;
                                    vec3 _968 = vec3(fma((2.0 * _724) * _724, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                    float _989 = (_584 + 1.0) * 0.5;
                                    float _990 = _584 * _584;
                                    float _998 = _989 * _989;
                                    float _1010 = _990 * _990;
                                    float _1013 = fma(fma(_726, _1010, -_726), _726, 1.0);
                                    _1020 = fma(_961, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _724), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_728, sqrt(fma(fma(-_657, _998, _657), _657, _998)), _657 * sqrt(fma(fma(-_728, _998, _728), _728, _998)))) * (_1010 * (0.3183098733425140380859375 / (_1013 * _1013)))), _659);
                                    _1021 = fma(_961, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_968 * pow(spvNMax(abs(1.0 - _728), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_968 * pow(spvNMax(abs(1.0 - _657), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _662);
                                }
                                else
                                {
                                    _1020 = _659;
                                    _1021 = _662;
                                }
                                _1098 = _1020;
                                _1099 = _1021 + (((_939 * _11._m0[_675]._m1.xyz) * _516) * (_953 * 0.0253302939236164093017578125));
                            }
                            _1100 = _1098;
                            _1101 = _1099;
                            _1102 = _913;
                            _1103 = _914;
                        }
                        else
                        {
                            _1100 = _659;
                            _1101 = _662;
                            _1102 = _664;
                            _1103 = _666;
                        }
                        _660 = _1100;
                        _663 = _1101;
                        _665 = _1102;
                        _667 = _1103;
                    }
                    else
                    {
                        _660 = _659;
                        _663 = _662;
                        _665 = _664;
                        _667 = _666;
                    }
                }
                vec3 _1105;
                vec3 _1108;
                float _1110;
                bool _1112;
                uint _1114;
                _1105 = _659;
                _1108 = _662;
                _1110 = _664;
                _1112 = _666;
                _1114 = _668;
                vec3 _1106;
                vec3 _1109;
                float _1111;
                bool _1113;
                for (; _1114 < _651; _1105 = _1106, _1108 = _1109, _1110 = _1111, _1112 = _1113, _1114++)
                {
                    uint _1121 = uint(_10._m0[_1114]);
                    float _1134 = abs(_11._m0[_1121]._m5);
                    bool _1141 = _11._m0[_1121]._m5 < 0.0;
                    if ((_11._m0[_1121]._m6 & (1u << (_503 & 31u))) != 0u)
                    {
                        vec3 _1152 = _11._m0[_1121]._m0.xyz - _553;
                        float _1153 = dot(_1152, _1152);
                        vec3 _1156 = _1152 * inversesqrt(spvNMax(_1153, 1.0000000133514319600180897396058e-10));
                        float _1157 = _11._m0[_1121]._m0.w * _11._m0[_1121]._m0.w;
                        vec3 _1553;
                        vec3 _1554;
                        float _1555;
                        bool _1556;
                        if (_1153 < (1.0 / _1157))
                        {
                            vec3 _1162 = _555 + _1156;
                            vec3 _1166 = _1162 * inversesqrt(spvNMax(dot(_1162, _1162), 1.0000000133514319600180897396058e-10));
                            float _1168 = clamp(dot(_1156, _1166), 0.0, 1.0);
                            float _1170 = clamp(dot(_513, _1166), 0.0, 1.0);
                            float _1171 = dot(_513, _1156);
                            float _1172 = clamp(_1171, 0.0, 1.0);
                            float _1175 = dot(-_1156, normalize(_11._m0[_1121]._m2.xyz));
                            bool _1176 = _1175 > _11._m0[_1121]._m1.w;
                            float _1204;
                            if (_1176)
                            {
                                float _1179 = _1153 * _1157;
                                float _1185 = pow(spvNMax(abs(clamp(fma(-_1179, _1179, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1121]._m4);
                                float _1195;
                                if (_1141)
                                {
                                    _1195 = _1185 * fma(4.0, _1157, _1134);
                                }
                                else
                                {
                                    _1195 = _1185 * ((1.0 / spvNMax(_1153, 9.9999997473787516355514526367188e-05)) + _1134);
                                }
                                float _1200 = clamp((_1175 - _11._m0[_1121]._m1.w) / spvNMax(_11._m0[_1121]._m2.w - _11._m0[_1121]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _1204 = _1172 * (_1195 * (_1200 * _1200));
                            }
                            else
                            {
                                _1204 = 0.0;
                            }
                            float _1205 = 0.3183098733425140380859375 * _1204;
                            float _1347;
                            bool _1348;
                            float _1349;
                            float _1350;
                            float _1351;
                            if ((_11._m0[_1121]._m7 & 1u) != 0u)
                            {
                                uint _1208 = uint(int(_11._m0[_1121]._m7 >> 2u));
                                float _1221 = sqrt(_1153);
                                float _1311;
                                bool _1312;
                                float _1313;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1171 <= 0.0) && (!_551))
                                    {
                                        _1311 = _1110;
                                        _1312 = _1112;
                                        _1313 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1242 = _22._m0[_1208]._m0 * vec4(_553 + (_513 * ((3.5 * float(int(sign(_1171)))) * (_22._m0[_1208]._m4 * _1221))), 1.0);
                                        vec3 _1246 = _1242.xyz / vec3(_1242.w);
                                        vec2 _1249 = (_1246.xy * 0.5) + vec2(0.5);
                                        _1249.y = 1.0 - _1249.y;
                                        float _1258 = (_22._m0[_1208]._m5.y / _22._m0[_1208]._m6) / (_1246.z - _22._m0[_1208]._m5.x);
                                        float _1263 = _1112 ? _1110 : 6.283185482025146484375;
                                        float _1264 = _625 * _1263;
                                        vec2 _1265 = _22._m0[_1208]._m1 + _21._m33;
                                        vec2 _1268 = (_22._m0[_1208]._m1 + vec2(_22._m0[_1208]._m2)) - _21._m33;
                                        float _1270;
                                        _1270 = 0.0;
                                        for (int _1273 = 0; _1273 < 12; )
                                        {
                                            float _1278 = float(uint(_1273));
                                            float _1281 = sqrt(_1278 + 0.5) * 0.288675129413604736328125;
                                            float _1282 = fma(_1278, 2.3999631404876708984375, _1264);
                                            vec2 _1290 = clamp(fma((vec3(cos(_1282), sin(_1282), _1281).xy * _1281) * 2.5, _21._m33, _1249), _1265, _1268);
                                            vec2 _1293 = fract(fma(vec2(1.0) / _21._m33, _1290, vec2(0.5)));
                                            vec4 _1299 = vec4(lessThan(vec4(_1258), textureGather(sampler2D(_23, _14), _1290)));
                                            float _1302 = _1293.x;
                                            _1270 += clamp(mix(mix(_1299.w, _1299.z, _1302), mix(_1299.x, _1299.y, _1302), _1293.y), 0.0, 1.0);
                                            _1273++;
                                            continue;
                                        }
                                        _1311 = _1263;
                                        _1312 = _1112 ? _1112 : true;
                                        _1313 = _1270 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                float _1315 = mix(1.0, _1313, spvNMin(_632, _11._m0[_1121]._m8));
                                float _1346;
                                SPIRV_CROSS_BRANCH
                                if (_550)
                                {
                                    float _1319 = _22._m0[_1208]._m4 * _1221;
                                    vec4 _1326 = _22._m0[_1208]._m0 * vec4(_553 - (_513 * _1319), 1.0);
                                    float _1327 = _1326.w;
                                    _1346 = fma(_1319, clamp(dot(-_513, _1156), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma((_1326.xyz / vec3(_1327)).xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1208]._m6, _1327))) * 1000.0;
                                }
                                else
                                {
                                    _1346 = 0.0;
                                }
                                _1347 = _1311;
                                _1348 = _1312;
                                _1349 = _1205 * _1315;
                                _1350 = _1346;
                                _1351 = _1315;
                            }
                            else
                            {
                                _1347 = _1110;
                                _1348 = _1112;
                                _1349 = _1205;
                                _1350 = 0.0;
                                _1351 = 1.0;
                            }
                            vec3 _1355 = vec3(1.0) / spvNMax((_546 * vec3(0.09660939872264862060546875)) * _547, vec3(9.9999997473787516355514526367188e-05));
                            vec3 _1373;
                            SPIRV_CROSS_BRANCH
                            if (_550)
                            {
                                vec3 _1369 = exp2(_1355 * ((-0.4808983504772186279296875) * spvNMax(_549, _1350)));
                                _1373 = _548 * (_1369 * fma(_1369, _1369, vec3(3.0)));
                            }
                            else
                            {
                                vec3 _1361 = exp2(_1355 * ((-0.4808983504772186279296875) * _549));
                                _1373 = (_548 * (_1361 * fma(_1361, _1361, vec3(3.0)))) * _1351;
                            }
                            float _1406;
                            if (_1176)
                            {
                                float _1381 = _1153 * _1157;
                                float _1387 = pow(spvNMax(abs(clamp(fma(-_1381, _1381, 1.0), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), _11._m0[_1121]._m4);
                                float _1397;
                                if (_1141)
                                {
                                    _1397 = _1387 * fma(4.0, _1157, _1134);
                                }
                                else
                                {
                                    _1397 = _1387 * ((1.0 / spvNMax(_1153, 9.9999997473787516355514526367188e-05)) + _1134);
                                }
                                float _1402 = clamp((_1175 - _11._m0[_1121]._m1.w) / spvNMax(_11._m0[_1121]._m2.w - _11._m0[_1121]._m1.w, 9.9999997473787516355514526367188e-05), 0.0, 1.0);
                                _1406 = clamp((dot(-_513, _1156) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * (_1397 * (_1402 * _1402));
                            }
                            else
                            {
                                _1406 = 0.0;
                            }
                            vec3 _1551;
                            vec3 _1552;
                            SPIRV_CROSS_BRANCH
                            if (_11._m0[_1121]._m3 < 0.0)
                            {
                                vec3 _1543;
                                vec3 _1544;
                                if (_1172 > 0.0)
                                {
                                    vec3 _1484 = (_11._m0[_1121]._m1.xyz * _1349) * _6._m0[0u];
                                    vec3 _1491 = vec3(fma((2.0 * _1168) * _1168, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                    float _1512 = (_584 + 1.0) * 0.5;
                                    float _1513 = _584 * _584;
                                    float _1521 = _1512 * _1512;
                                    float _1533 = _1513 * _1513;
                                    float _1536 = fma(fma(_1170, _1533, -_1170), _1170, 1.0);
                                    _1543 = fma(_1484, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _1168), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1172, sqrt(fma(fma(-_657, _1521, _657), _657, _1521)), _657 * sqrt(fma(fma(-_1172, _1521, _1172), _1172, _1521)))) * (_1533 * (0.3183098733425140380859375 / (_1536 * _1536)))), _1105);
                                    _1544 = fma(_1484, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1491 * pow(spvNMax(abs(1.0 - _1172), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1491 * pow(spvNMax(abs(1.0 - _657), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _1108);
                                }
                                else
                                {
                                    _1543 = _1105;
                                    _1544 = _1108;
                                }
                                _1551 = _1543;
                                _1552 = _1544 + (((_1373 * _11._m0[_1121]._m1.xyz) * _516) * ((_1406 * 0.10132117569446563720703125) * _6._m0[0u]));
                            }
                            else
                            {
                                vec3 _1473;
                                vec3 _1474;
                                if (_1172 > 0.0)
                                {
                                    vec3 _1414 = (_11._m0[_1121]._m1.xyz * _1349) * 1.0;
                                    vec3 _1421 = vec3(fma((2.0 * _1168) * _1168, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                    float _1442 = (_584 + 1.0) * 0.5;
                                    float _1443 = _584 * _584;
                                    float _1451 = _1442 * _1442;
                                    float _1463 = _1443 * _1443;
                                    float _1466 = fma(fma(_1170, _1463, -_1170), _1170, 1.0);
                                    _1473 = fma(_1414, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _1168), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1172, sqrt(fma(fma(-_657, _1451, _657), _657, _1451)), _657 * sqrt(fma(fma(-_1172, _1451, _1172), _1172, _1451)))) * (_1463 * (0.3183098733425140380859375 / (_1466 * _1466)))), _1105);
                                    _1474 = fma(_1414, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1421 * pow(spvNMax(abs(1.0 - _1172), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1421 * pow(spvNMax(abs(1.0 - _657), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _1108);
                                }
                                else
                                {
                                    _1473 = _1105;
                                    _1474 = _1108;
                                }
                                _1551 = _1473;
                                _1552 = _1474 + (((_1373 * _11._m0[_1121]._m1.xyz) * _516) * (_1406 * 0.10132117569446563720703125));
                            }
                            _1553 = _1551;
                            _1554 = _1552;
                            _1555 = _1347;
                            _1556 = _1348;
                        }
                        else
                        {
                            _1553 = _1105;
                            _1554 = _1108;
                            _1555 = _1110;
                            _1556 = _1112;
                        }
                        _1106 = _1553;
                        _1109 = _1554;
                        _1111 = _1555;
                        _1113 = _1556;
                    }
                    else
                    {
                        _1106 = _1105;
                        _1109 = _1108;
                        _1111 = _1110;
                        _1113 = _1112;
                    }
                }
                vec3 _1558;
                vec3 _1561;
                _1558 = _1105;
                _1561 = _1108;
                vec3 _1559;
                vec3 _1562;
                float _1564;
                bool _1566;
                float _1563 = _1110;
                bool _1565 = _1112;
                uint _1567 = _1114;
                for (; _1567 < _655; _1558 = _1559, _1561 = _1562, _1563 = _1564, _1565 = _1566, _1567++)
                {
                    uint _1574 = uint(_10._m0[_1567]);
                    int _1603 = int(_13._m0[_1574]._m1 >> 1u) - 1;
                    if (((_13._m0[_1574]._m4 & 16777215u) & (1u << (_503 & 31u))) != 0u)
                    {
                        vec3 _1614 = _13._m0[_1574]._m6 * vec4(_553, 1.0);
                        vec3 _2130;
                        vec3 _2131;
                        float _2132;
                        bool _2133;
                        if (all(lessThan(abs(_1614 - vec3(0.5)), vec3(0.5))))
                        {
                            vec3 _1621 = _555 + _13._m0[_1574]._m9;
                            vec3 _1625 = _1621 * inversesqrt(spvNMax(dot(_1621, _1621), 1.0000000133514319600180897396058e-10));
                            float _1627 = clamp(dot(_13._m0[_1574]._m9, _1625), 0.0, 1.0);
                            float _1629 = clamp(dot(_513, _1625), 0.0, 1.0);
                            float _1630 = dot(_513, _13._m0[_1574]._m9);
                            float _1631 = clamp(_1630, 0.0, 1.0);
                            int _1632 = int(_13._m0[_1574]._m4 >> 24u);
                            float _1633 = _1614.z;
                            bool _1635 = _1633 < _13._m0[_1574]._m2.x;
                            vec3 _1672;
                            if (_1635)
                            {
                                float _1660 = _1633 * _13._m0[_1574]._m2.z;
                                float _1663 = _1660 * _1660;
                                vec3 _1671;
                                _1671.z = dot(_324[_1632], vec4(_1660, _1663, smoothstep(0.0, 1.0, _1660), (_1663 * _1660) * fma(_1660, fma(_1660, 6.0, -15.0), 10.0)));
                                _1672 = _1671;
                            }
                            else
                            {
                                vec3 _1658;
                                if (_1633 > _13._m0[_1574]._m2.y)
                                {
                                    float _1646 = (1.0 - _1633) * _13._m0[_1574]._m2.w;
                                    float _1649 = _1646 * _1646;
                                    vec3 _1657;
                                    _1657.z = dot(_324[_1632], vec4(_1646, _1649, smoothstep(0.0, 1.0, _1646), (_1649 * _1646) * fma(_1646, fma(_1646, 6.0, -15.0), 10.0)));
                                    _1658 = _1657;
                                }
                                else
                                {
                                    _1658 = vec3(0.0, 0.0, 1.0);
                                }
                                _1672 = _1658;
                            }
                            vec2 _1673 = _1614.xy;
                            vec2 _1677 = (vec2(0.5) - abs(_1673 - vec2(0.5))) * _13._m0[_1574]._m3;
                            float _1678 = _1677.x;
                            bool _1679 = _1678 < 1.0;
                            vec3 _1695;
                            if (_1679)
                            {
                                float _1686 = _1678 * _1678;
                                vec3 _1694 = _1672;
                                _1694.x = dot(_324[_1632], vec4(_1678, _1686, smoothstep(0.0, 1.0, _1678), (_1686 * _1678) * fma(_1678, fma(_1678, 6.0, -15.0), 10.0)));
                                _1695 = _1694;
                            }
                            else
                            {
                                vec3 _1683 = _1672;
                                _1683.x = 1.0;
                                _1695 = _1683;
                            }
                            float _1696 = _1677.y;
                            bool _1697 = _1696 < 1.0;
                            vec3 _1713;
                            if (_1697)
                            {
                                float _1704 = _1696 * _1696;
                                vec3 _1712 = _1695;
                                _1712.y = dot(_324[_1632], vec4(_1696, _1704, smoothstep(0.0, 1.0, _1696), (_1704 * _1696) * fma(_1696, fma(_1696, 6.0, -15.0), 10.0)));
                                _1713 = _1712;
                            }
                            else
                            {
                                vec3 _1701 = _1695;
                                _1701.y = 1.0;
                                _1713 = _1701;
                            }
                            float _1719 = _1631 * ((_1713.x * _1713.y) * _1713.z);
                            float _1855;
                            bool _1856;
                            float _1857;
                            float _1858;
                            float _1859;
                            if ((_13._m0[_1574]._m8 & 1u) != 0u)
                            {
                                uint _1722 = uint(int(_13._m0[_1574]._m8 >> 2u));
                                float _1819;
                                bool _1820;
                                float _1821;
                                do
                                {
                                    SPIRV_CROSS_BRANCH
                                    if ((_1630 <= 0.0) && (!_551))
                                    {
                                        _1819 = _1563;
                                        _1820 = _1565;
                                        _1821 = 0.0;
                                        break;
                                    }
                                    else
                                    {
                                        vec4 _1754 = _22._m0[_1722]._m0 * vec4(_553 + (_513 * ((3.5 * float(int(sign(_1630)))) * _22._m0[_1722]._m4)), 1.0);
                                        vec2 _1757 = (_1754.xy * 0.5) + vec2(0.5);
                                        _1757.y = 1.0 - _1757.y;
                                        float _1766 = ((_1754.z - _22._m0[_1722]._m5.y) / _22._m0[_1722]._m5.x) / _22._m0[_1722]._m6;
                                        float _1771 = _1565 ? _1563 : 6.283185482025146484375;
                                        float _1772 = _625 * _1771;
                                        vec2 _1773 = _22._m0[_1722]._m1 + _21._m33;
                                        vec2 _1776 = (_22._m0[_1722]._m1 + vec2(_22._m0[_1722]._m2)) - _21._m33;
                                        float _1778;
                                        _1778 = 0.0;
                                        for (int _1781 = 0; _1781 < 12; )
                                        {
                                            float _1786 = float(uint(_1781));
                                            float _1789 = sqrt(_1786 + 0.5) * 0.288675129413604736328125;
                                            float _1790 = fma(_1786, 2.3999631404876708984375, _1772);
                                            vec2 _1798 = clamp(fma((vec3(cos(_1790), sin(_1790), _1789).xy * _1789) * 2.5, _21._m33, _1757), _1773, _1776);
                                            vec2 _1801 = fract(fma(vec2(1.0) / _21._m33, _1798, vec2(0.5)));
                                            vec4 _1807 = vec4(lessThan(vec4(_1766), textureGather(sampler2D(_23, _14), _1798)));
                                            float _1810 = _1801.x;
                                            _1778 += clamp(mix(mix(_1807.w, _1807.z, _1810), mix(_1807.x, _1807.y, _1810), _1801.y), 0.0, 1.0);
                                            _1781++;
                                            continue;
                                        }
                                        _1819 = _1771;
                                        _1820 = _1565 ? _1565 : true;
                                        _1821 = _1778 * 0.083333335816860198974609375;
                                        break;
                                    }
                                    break; // unreachable workaround
                                } while(false);
                                float _1823 = mix(1.0, _1821, spvNMin(_632, _13._m0[_1574]._m5));
                                float _1854;
                                SPIRV_CROSS_BRANCH
                                if (_550)
                                {
                                    vec4 _1833 = _22._m0[_1722]._m0 * vec4(_553 - (_513 * _22._m0[_1722]._m4), 1.0);
                                    _1854 = fma(_22._m0[_1722]._m4, clamp(dot(-_513, _13._m0[_1574]._m9), 0.0, 1.0), spvNMax(9.9999997473787516355514526367188e-06, fma(-textureLod(sampler2D(_23, _14), fma(_1833.xy, vec2(0.5, -0.5), vec2(0.5)), 0.0).x, _22._m0[_1722]._m6, (_1833.z - _22._m0[_1722]._m5.y) / _22._m0[_1722]._m5.x))) * 1000.0;
                                }
                                else
                                {
                                    _1854 = 0.0;
                                }
                                _1855 = _1819;
                                _1856 = _1820;
                                _1857 = _1719 * _1823;
                                _1858 = _1854;
                                _1859 = _1823;
                            }
                            else
                            {
                                _1855 = _1563;
                                _1856 = _1565;
                                _1857 = _1719;
                                _1858 = 0.0;
                                _1859 = 1.0;
                            }
                            vec3 _1863 = vec3(1.0) / spvNMax((_546 * vec3(0.09660939872264862060546875)) * _547, vec3(9.9999997473787516355514526367188e-05));
                            vec3 _1881;
                            SPIRV_CROSS_BRANCH
                            if (_550)
                            {
                                vec3 _1877 = exp2(_1863 * ((-0.4808983504772186279296875) * spvNMax(_549, _1858)));
                                _1881 = _548 * (_1877 * fma(_1877, _1877, vec3(3.0)));
                            }
                            else
                            {
                                vec3 _1869 = exp2(_1863 * ((-0.4808983504772186279296875) * _549));
                                _1881 = (_548 * (_1869 * fma(_1869, _1869, vec3(3.0)))) * _1859;
                            }
                            vec3 _1923;
                            if (_1635)
                            {
                                float _1911 = _1633 * _13._m0[_1574]._m2.z;
                                float _1914 = _1911 * _1911;
                                vec3 _1922;
                                _1922.z = dot(_324[_1632], vec4(_1911, _1914, smoothstep(0.0, 1.0, _1911), (_1914 * _1911) * fma(_1911, fma(_1911, 6.0, -15.0), 10.0)));
                                _1923 = _1922;
                            }
                            else
                            {
                                vec3 _1909;
                                if (_1633 > _13._m0[_1574]._m2.y)
                                {
                                    float _1897 = (1.0 - _1633) * _13._m0[_1574]._m2.w;
                                    float _1900 = _1897 * _1897;
                                    vec3 _1908;
                                    _1908.z = dot(_324[_1632], vec4(_1897, _1900, smoothstep(0.0, 1.0, _1897), (_1900 * _1897) * fma(_1897, fma(_1897, 6.0, -15.0), 10.0)));
                                    _1909 = _1908;
                                }
                                else
                                {
                                    _1909 = vec3(0.0, 0.0, 1.0);
                                }
                                _1923 = _1909;
                            }
                            vec3 _1939;
                            if (_1679)
                            {
                                float _1930 = _1678 * _1678;
                                vec3 _1938 = _1923;
                                _1938.x = dot(_324[_1632], vec4(_1678, _1930, smoothstep(0.0, 1.0, _1678), (_1930 * _1678) * fma(_1678, fma(_1678, 6.0, -15.0), 10.0)));
                                _1939 = _1938;
                            }
                            else
                            {
                                vec3 _1927 = _1923;
                                _1927.x = 1.0;
                                _1939 = _1927;
                            }
                            vec3 _1955;
                            if (_1697)
                            {
                                float _1946 = _1696 * _1696;
                                vec3 _1954 = _1939;
                                _1954.y = dot(_324[_1632], vec4(_1696, _1946, smoothstep(0.0, 1.0, _1696), (_1946 * _1696) * fma(_1696, fma(_1696, 6.0, -15.0), 10.0)));
                                _1955 = _1954;
                            }
                            else
                            {
                                vec3 _1943 = _1939;
                                _1943.y = 1.0;
                                _1955 = _1943;
                            }
                            float _1961 = clamp((dot(-_513, _13._m0[_1574]._m9) + 0.2588190734386444091796875) * 0.631063938140869140625, 0.0, 1.0) * ((_1955.x * _1955.y) * _1955.z);
                            vec3 _1983;
                            if (_1603 >= 0)
                            {
                                vec2 _1967 = (subgroupQuadSwapHorizontal(_1673) - _1673) * _562;
                                vec2 _1970 = (subgroupQuadSwapVertical(_1673) - _1673) * _568;
                                int _79 = _1603;
                                _1983 = _13._m0[_1574]._m0 * textureGrad(nonuniformEXT(sampler2D(_27[_79], _7)), _1673, mix(_1967, vec2(0.0), bvec2(any(isnan(_1967)))), mix(_1970, vec2(0.0), bvec2(any(isnan(_1970))))).xyz;
                            }
                            else
                            {
                                _1983 = _13._m0[_1574]._m0;
                            }
                            vec3 _2128;
                            vec3 _2129;
                            SPIRV_CROSS_BRANCH
                            if ((_13._m0[_1574]._m1 & 1u) != 0u)
                            {
                                vec3 _2120;
                                vec3 _2121;
                                if (_1631 > 0.0)
                                {
                                    vec3 _2061 = (_1983 * _1857) * _6._m0[0u];
                                    vec3 _2068 = vec3(fma((2.0 * _1627) * _1627, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                    float _2089 = (_584 + 1.0) * 0.5;
                                    float _2090 = _584 * _584;
                                    float _2098 = _2089 * _2089;
                                    float _2110 = _2090 * _2090;
                                    float _2113 = fma(fma(_1629, _2110, -_1629), _1629, 1.0);
                                    _2120 = fma(_2061, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _1627), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1631, sqrt(fma(fma(-_657, _2098, _657), _657, _2098)), _657 * sqrt(fma(fma(-_1631, _2098, _1631), _1631, _2098)))) * (_2110 * (0.3183098733425140380859375 / (_2113 * _2113)))), _1558);
                                    _2121 = fma(_2061, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_2068 * pow(spvNMax(abs(1.0 - _1631), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_2068 * pow(spvNMax(abs(1.0 - _657), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _1561);
                                }
                                else
                                {
                                    _2120 = _1558;
                                    _2121 = _1561;
                                }
                                _2128 = _2120;
                                _2129 = _2121 + (((_1881 * _1983) * _516) * ((0.3183098733425140380859375 * _1961) * _6._m0[0u]));
                            }
                            else
                            {
                                vec3 _2050;
                                vec3 _2051;
                                if (_1631 > 0.0)
                                {
                                    vec3 _1991 = (_1983 * _1857) * 1.0;
                                    vec3 _1998 = vec3(fma((2.0 * _1627) * _1627, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                                    float _2019 = (_584 + 1.0) * 0.5;
                                    float _2020 = _584 * _584;
                                    float _2028 = _2019 * _2019;
                                    float _2040 = _2020 * _2020;
                                    float _2043 = fma(fma(_1629, _2040, -_1629), _1629, 1.0);
                                    _2050 = fma(_1991, (_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - _1627), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_1631, sqrt(fma(fma(-_657, _2028, _657), _657, _2028)), _657 * sqrt(fma(fma(-_1631, _2028, _1631), _1631, _2028)))) * (_2040 * (0.3183098733425140380859375 / (_2043 * _2043)))), _1558);
                                    _2051 = fma(_1991, _516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_1998 * pow(spvNMax(abs(1.0 - _1631), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_1998 * pow(spvNMax(abs(1.0 - _657), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))), _1561);
                                }
                                else
                                {
                                    _2050 = _1558;
                                    _2051 = _1561;
                                }
                                _2128 = _2050;
                                _2129 = _2051 + (((_1881 * _1983) * _516) * (0.3183098733425140380859375 * _1961));
                            }
                            _2130 = _2128;
                            _2131 = _2129;
                            _2132 = _1855;
                            _2133 = _1856;
                        }
                        else
                        {
                            _2130 = _1558;
                            _2131 = _1561;
                            _2132 = _1563;
                            _2133 = _1565;
                        }
                        _1559 = _2130;
                        _1562 = _2131;
                        _1564 = _2132;
                        _1566 = _2133;
                    }
                    else
                    {
                        _1559 = _1558;
                        _1562 = _1561;
                        _1564 = _1563;
                        _1566 = _1565;
                    }
                }
                _2134 = _1558;
                _2135 = _1561;
            }
            else
            {
                _2134 = vec3(0.0);
                _2135 = vec3(0.0);
            }
            _3180 = _2134;
            _3181 = _2135;
        }
        vec3 _3183 = reflect(-_555, _513);
        vec3 _3185 = vec3(_521.x, _521.y, _521.z);
        vec3 _3195 = textureLod(samplerCube(_16, _7), _513, 0.0).xyz * _21._m27;
        vec3 _3202 = textureLod(samplerCube(_17, _7), _3183, fma(_584, 8.0, _21._m30 - 8.0)).xyz * _21._m27;
        vec3 _3227;
        vec3 _3228;
        SPIRV_CROSS_BRANCH
        if (_21._m29 > 0.0)
        {
            vec3 _3217 = vec3(_21._m29);
            _3227 = mix(_3202, textureLod(samplerCube(_19, _7), _3183, fma(_584, 8.0, _21._m31 - 8.0)).xyz * _21._m28, _3217);
            _3228 = mix(_3195, textureLod(samplerCube(_18, _7), _513, 0.0).xyz * _21._m28, _3217);
        }
        else
        {
            _3227 = _3202;
            _3228 = _3195;
        }
        // --- RenoDX: IBL Modulation ---
        if (pc.rendering_cubemap_mod > 0.0) {
            float rdx_mod = rdx_cubemap_modulation(_3228, _584);
            _3227 *= rdx_mod;
            _3228 *= rdx_mod;
        }
        float _3229 = spvNMax(dot(_555, _513), 0.001953125);
        vec4 _3234 = textureLod(sampler2D(_20, _14), vec2(_3229, _584), 0.0);
        uvec4 _3247 = uvec4(_9._m0[uint(_616)]);
        uint _3249 = _3247.y;
        uint _3259 = ((_3247.z >> 0u) & 1023u) + (((_3249 >> 12u) & 4095u) + (((_3249 >> 0u) & 4095u) + _3247.x));
        uint _3261 = (_3249 >> 24u) + _3259;
        vec3 _3263;
        vec3 _3266;
        _3263 = _3227 * ((_3185 * _3234.x) + vec3(_3234.y));
        _3266 = _3228 * (_516 * _3234.z);
        vec3 _3264;
        vec3 _3267;
        for (uint _3268 = _3259; _3268 < _3261; _3263 = _3264, _3266 = _3267, _3268++)
        {
            uint _3275 = uint(_10._m0[_3268]);
            int _3294 = int((_15._m0[_3275]._m5 >> 1u) & 3u);
            mat3 _3298 = mat3(_15._m0[_3275]._m1[0], _15._m0[_3275]._m1[1], _15._m0[_3275]._m1[2]);
            int _3304 = (int((_15._m0[_3275]._m5 >> 3u) & 16383u) - 1) * 2;
            int _3309 = (int((_15._m0[_3275]._m5 >> 17u) & 16383u) - 1) * 2;
            int _3314 = (int((_15._m0[_3275]._m6 >> 0u) & 65535u) - 1) * 2;
            int _3319 = (int((_15._m0[_3275]._m6 >> 16u) & 65535u) - 1) * 2;
            float _3322 = (_15._m0[_3275]._m3 < 0.0) ? (-_15._m0[_3275]._m3) : 1.0;
            vec3 _3324 = _3298 * (_553 - _15._m0[_3275]._m1[3]);
            bool _3325 = int(_15._m0[_3275]._m5 & 1u) == 1;
            vec3 _3326 = abs(_3324);
            float _3329 = dot(_3324, _3324);
            if (_3325 ? any(greaterThanEqual(_3326, _15._m0[_3275]._m0.xyz)) : (_3329 >= _15._m0[_3275]._m0.y))
            {
                _3264 = _3263;
                _3267 = _3266;
                continue;
            }
            vec3 _3503;
            SPIRV_CROSS_FLATTEN
            if ((_3294 & 1) != 0)
            {
                vec3 _3339 = _3298 * _513;
                vec2 _3428;
                bool _3429;
                if (_3325)
                {
                    vec2 _3423;
                    bool _3427;
                    do
                    {
                        vec3 _3407 = (_15._m0[_3275]._m0.xyz - _3324) / _3339;
                        vec3 _3410 = ((-_15._m0[_3275]._m0.xyz) - _3324) / _3339;
                        vec3 _3411 = spvNMin(_3407, _3410);
                        vec3 _3412 = spvNMax(_3407, _3410);
                        float _3417 = spvNMax(_3411.x, spvNMax(_3411.y, _3411.z));
                        float _3422 = spvNMin(_3412.x, spvNMin(_3412.y, _3412.z));
                        _3423 = vec2(_3417, _3422);
                        if (_3417 > _3422)
                        {
                            _3427 = false;
                            break;
                        }
                        _3427 = true;
                        break;
                    } while(false);
                    _3428 = _3423;
                    _3429 = _3427;
                }
                else
                {
                    vec2 _3402;
                    bool _3403;
                    do
                    {
                        float _3345 = dot(_3339, _3339);
                        float _3346 = dot(_3339, _3324);
                        float _3347 = 2.0 * _3346;
                        float _3348 = _3329 - _15._m0[_3275]._m0.y;
                        float _3384;
                        float _3385;
                        bool _3386;
                        do
                        {
                            float _3354 = fma(_3347, _3347, -((4.0 * _3345) * _3348));
                            float _3382;
                            float _3383;
                            if (_3354 < 0.0)
                            {
                                _3384 = 0.0;
                                _3385 = 0.0;
                                _3386 = false;
                                break;
                            }
                            else
                            {
                                if (_3354 == 0.0)
                                {
                                    float _3381 = (_3346 * (-1.0)) * (1.0 / _3345);
                                    _3382 = _3381;
                                    _3383 = _3381;
                                }
                                else
                                {
                                    float _3374;
                                    if (_3347 > 0.0)
                                    {
                                        _3374 = (-0.5) * fma(2.0, _3346, sqrt(_3354));
                                    }
                                    else
                                    {
                                        _3374 = (-0.5) * fma(2.0, _3346, -sqrt(_3354));
                                    }
                                    _3382 = _3348 * (1.0 / _3374);
                                    _3383 = _3374 * (1.0 / _3345);
                                }
                            }
                            _3384 = _3382;
                            _3385 = _3383;
                            _3386 = true;
                            break;
                        } while(false);
                        if (!_3386)
                        {
                            _3402 = vec2(0.0);
                            _3403 = false;
                            break;
                        }
                        if ((_3385 < 0.0) && (_3384 < 0.0))
                        {
                            _3402 = vec2(0.0);
                            _3403 = false;
                            break;
                        }
                        vec2 _3401;
                        if (_3385 > _3384)
                        {
                            _3401 = vec2(_3384, _3385);
                        }
                        else
                        {
                            _3401 = vec2(_3385, _3384);
                        }
                        _3402 = _3401;
                        _3403 = true;
                        break;
                    } while(false);
                    _3428 = _3402;
                    _3429 = _3403;
                }
                vec3 _3432 = _3324 + (_3339 * _3428.y);
                float _3453;
                if (_3325)
                {
                    _3453 = 1.0 - clamp(length(spvNMax(_3326 - (_15._m0[_3275]._m0.xyz - vec3(_15._m0[_3275]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_3275]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3453 = clamp((_15._m0[_3275]._m0.x - length(_3324)) * (1.0 / spvNMax(_15._m0[_3275]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3456 = float(_3429) * smoothstep(0.0, 1.0, _3453);
                vec4 _3498;
                SPIRV_CROSS_BRANCH
                if (_3456 > 9.9999997473787516355514526367188e-05)
                {
                    float _3465 = mix(clamp((_3428.y * (1.0 / length(_3432))) * _584, 0.0, _584), _584, _584);
                    vec3 _3467 = mix(_3432, _3339, vec3(_3465));
                    int _87 = _3304;
                    vec4 _3468 = textureLod(nonuniformEXT(samplerCube(_26[_87], _7)), _3467, 0.0);
                    int _91 = _3304 + 1;
                    _3468.w = textureLod(nonuniformEXT(samplerCube(_26[_91], _7)), _3467, 0.0).x;
                    vec4 _3483;
                    SPIRV_CROSS_BRANCH
                    if (_3309 >= 0)
                    {
                        int _95 = _3309;
                        vec4 _3476 = textureLod(nonuniformEXT(samplerCube(_26[_95], _7)), _3467, 0.0);
                        int _99 = _3309 + 1;
                        _3476.w = textureLod(nonuniformEXT(samplerCube(_26[_99], _7)), _3467, 0.0).x;
                        _3483 = mix(_3468, _3476, vec4(_15._m0[_3275]._m3));
                    }
                    else
                    {
                        _3483 = _3468;
                    }
                    vec4 _3484 = _3483 * _3322;
                    vec3 _3493 = (_3484.xyz * _15._m0[_3275]._m4).xyz * (_516 * textureLod(sampler2D(_20, _14), vec2(_3229, _3465), 0.0).z);
                    vec4 _3494 = vec4(_3493.x, _3493.y, _3493.z, _3484.w);
                    _3494.w = _3484.w * _3456;
                    _3498 = _3494;
                }
                else
                {
                    _3498 = vec4(0.0);
                }
                _3503 = mix(_3266, _3498.xyz, vec3(_3498.w));
            }
            else
            {
                _3503 = _3266;
            }
            vec3 _3682;
            SPIRV_CROSS_FLATTEN
            if ((_3294 & 2) != 0)
            {
                vec3 _3508 = _3298 * _3183;
                vec2 _3597;
                bool _3598;
                if (_3325)
                {
                    vec2 _3592;
                    bool _3596;
                    do
                    {
                        vec3 _3576 = (_15._m0[_3275]._m0.xyz - _3324) / _3508;
                        vec3 _3579 = ((-_15._m0[_3275]._m0.xyz) - _3324) / _3508;
                        vec3 _3580 = spvNMin(_3576, _3579);
                        vec3 _3581 = spvNMax(_3576, _3579);
                        float _3586 = spvNMax(_3580.x, spvNMax(_3580.y, _3580.z));
                        float _3591 = spvNMin(_3581.x, spvNMin(_3581.y, _3581.z));
                        _3592 = vec2(_3586, _3591);
                        if (_3586 > _3591)
                        {
                            _3596 = false;
                            break;
                        }
                        _3596 = true;
                        break;
                    } while(false);
                    _3597 = _3592;
                    _3598 = _3596;
                }
                else
                {
                    vec2 _3571;
                    bool _3572;
                    do
                    {
                        float _3514 = dot(_3508, _3508);
                        float _3515 = dot(_3508, _3324);
                        float _3516 = 2.0 * _3515;
                        float _3517 = _3329 - _15._m0[_3275]._m0.y;
                        float _3553;
                        float _3554;
                        bool _3555;
                        do
                        {
                            float _3523 = fma(_3516, _3516, -((4.0 * _3514) * _3517));
                            float _3551;
                            float _3552;
                            if (_3523 < 0.0)
                            {
                                _3553 = 0.0;
                                _3554 = 0.0;
                                _3555 = false;
                                break;
                            }
                            else
                            {
                                if (_3523 == 0.0)
                                {
                                    float _3550 = (_3515 * (-1.0)) * (1.0 / _3514);
                                    _3551 = _3550;
                                    _3552 = _3550;
                                }
                                else
                                {
                                    float _3543;
                                    if (_3516 > 0.0)
                                    {
                                        _3543 = (-0.5) * fma(2.0, _3515, sqrt(_3523));
                                    }
                                    else
                                    {
                                        _3543 = (-0.5) * fma(2.0, _3515, -sqrt(_3523));
                                    }
                                    _3551 = _3517 * (1.0 / _3543);
                                    _3552 = _3543 * (1.0 / _3514);
                                }
                            }
                            _3553 = _3551;
                            _3554 = _3552;
                            _3555 = true;
                            break;
                        } while(false);
                        if (!_3555)
                        {
                            _3571 = vec2(0.0);
                            _3572 = false;
                            break;
                        }
                        if ((_3554 < 0.0) && (_3553 < 0.0))
                        {
                            _3571 = vec2(0.0);
                            _3572 = false;
                            break;
                        }
                        vec2 _3570;
                        if (_3554 > _3553)
                        {
                            _3570 = vec2(_3553, _3554);
                        }
                        else
                        {
                            _3570 = vec2(_3554, _3553);
                        }
                        _3571 = _3570;
                        _3572 = true;
                        break;
                    } while(false);
                    _3597 = _3571;
                    _3598 = _3572;
                }
                vec3 _3601 = _3324 + (_3508 * _3597.y);
                float _3622;
                if (_3325)
                {
                    _3622 = 1.0 - clamp(length(spvNMax(_3326 - (_15._m0[_3275]._m0.xyz - vec3(_15._m0[_3275]._m0.w)), vec3(0.0))) * (1.0 / spvNMax(_15._m0[_3275]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                else
                {
                    _3622 = clamp((_15._m0[_3275]._m0.x - length(_3324)) * (1.0 / spvNMax(_15._m0[_3275]._m0.w, 9.9999997473787516355514526367188e-05)), 0.0, 1.0);
                }
                float _3625 = float(_3598) * smoothstep(0.0, 1.0, _3622);
                vec4 _3677;
                SPIRV_CROSS_BRANCH
                if (_3625 > 9.9999997473787516355514526367188e-05)
                {
                    float _3634 = mix(clamp((_3597.y * (1.0 / length(_3601))) * _584, 0.0, _584), _584, _584);
                    vec3 _3636 = mix(_3601, _3508, vec3(_3634));
                    float _3637 = _3634 * 8.0;
                    int _103 = _3314;
                    int _107 = _3314 + 1;
                    vec4 _3645 = vec4(textureLod(nonuniformEXT(samplerCube(_26[_103], _7)), _3636, _3637).xyz, textureLod(nonuniformEXT(samplerCube(_26[_107], _7)), _3636, _3637).x);
                    vec4 _3659;
                    SPIRV_CROSS_BRANCH
                    if (_3319 >= 0)
                    {
                        int _111 = _3319;
                        int _115 = _3319 + 1;
                        _3659 = mix(_3645, vec4(textureLod(nonuniformEXT(samplerCube(_26[_111], _7)), _3636, _3637).xyz, textureLod(nonuniformEXT(samplerCube(_26[_115], _7)), _3636, _3637).x), vec4(_15._m0[_3275]._m3));
                    }
                    else
                    {
                        _3659 = _3645;
                    }
                    vec4 _3660 = _3659 * _3322;
                    vec4 _3665 = textureLod(sampler2D(_20, _14), vec2(_3229, _3634), 0.0);
                    vec3 _3672 = (_3660.xyz * _15._m0[_3275]._m4).xyz * ((_3185 * _3665.x) + vec3(_3665.y));
                    vec4 _3673 = vec4(_3672.x, _3672.y, _3672.z, _3660.w);
                    _3673.w = _3660.w * _3625;
                    _3677 = _3673;
                }
                else
                {
                    _3677 = vec4(0.0);
                }
                _3682 = mix(_3263, _3677.xyz, vec3(_3677.w));
            }
            else
            {
                _3682 = _3263;
            }
            _3264 = _3682;
            _3267 = _3503;
        }
        float _3683 = _6._m0[0u] * 100.0;
        bool _3688 = _28._m19 > 0.0;
        vec3 _3749;
        SPIRV_CROSS_BRANCH
        if (_3688 && (_28._m35 == 0.0))
        {
            vec3 _3702 = vec3(0.0, 636100.0, 0.0) + _29._m6;
            float _3703 = length(_3702);
            vec3 _3714;
            float _3715;
            if (_3703 < (0.89999997615814208984375 * _31._m0))
            {
                vec3 _3712 = _3702;
                _3712.z = _3702.z + _31._m0;
                _3714 = _3712;
                _3715 = length(_3712);
            }
            else
            {
                _3714 = _3702;
                _3715 = _3703;
            }
            float _3718 = dot(_3714 / vec3(_3715), _28._m36);
            float _3719 = _31._m0 / _3715;
            _3749 = (mix(textureLod(sampler2D(_32, _7), vec2(atan((_3718 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_3715 - _31._m0) / (_31._m1 - _31._m0))), 0.0).xyz, vec3(0.0), bvec3(_3718 < (-sqrt(fma(-_3719, _3719, 1.0))))) * 1.0) * (_28._m34 * _28._m20);
        }
        else
        {
            _3749 = _28._m2;
        }
        float _3762 = texelFetch(_43, ivec3(int(_619), int(_620), 0).xy, 0).x;
        float _3847;
        SPIRV_CROSS_BRANCH
        if (_28._m21 > 0.0)
        {
            vec3 _3786 = _29._m6 + _553;
            vec3 _3793 = vec3(0.0, _28._m18.z, 0.0) + (_3786 - vec3(0.0, _28._m25, 0.0));
            float _3797 = dot(_3793, _28._m24);
            vec2 _3807 = ((((_3793 + (_28._m24 * (sqrt(fma(_3797, _3797, fma(_28._m18.z, _28._m18.z, -dot(_3793, _3793)))) - _3797))).xz * _28._m18.w) * 0.5) + vec2(0.5)) + _28._m18.xy;
            _3807.x = 1.0 - _3807.x;
            vec3 _3820 = vec3(0.0, _28._m23.z, 0.0) + (_3786 - vec3(0.0, _28._m27, 0.0));
            float _3824 = dot(_3820, _28._m26);
            vec2 _3834 = ((((_3820 + (_28._m26 * (sqrt(fma(_3824, _3824, fma(_28._m23.z, _28._m23.z, -dot(_3820, _3820)))) - _3824))).xz * _28._m23.w) * 0.5) + vec2(0.5)) + _28._m23.xy;
            _3834.x = 1.0 - _3834.x;
            _3847 = _3762 * (1.0 - clamp(smoothstep(0.0500000007450580596923828125, 0.550000011920928955078125, mix(textureLod(sampler2D(_34, _7), _3807, 0.0).x, textureLod(sampler2D(_35, _7), _3834, 0.0).x, _28._m16)) * _28._m21, 0.0, 1.0));
        }
        else
        {
            _3847 = _3762;
        }
        float _3937;
        SPIRV_CROSS_BRANCH
        if (_28._m17 > 0.0)
        {
            vec3 _3875 = _29._m6 + _553;
            vec3 _3883 = vec3(0.0, _28._m28.z, 0.0) + ((_28._m29 + _3875) - vec3(0.0, _28._m30, 0.0));
            float _3887 = dot(_3883, _28._m24);
            vec2 _3897 = ((((_3883 + (_28._m24 * (sqrt(fma(_3887, _3887, fma(_28._m28.z, _28._m28.z, -dot(_3883, _3883)))) - _3887))).xz * _28._m28.w) * 0.5) + vec2(0.5)) + _28._m28.xy;
            _3897.x = 1.0 - _3897.x;
            vec3 _3911 = vec3(0.0, _28._m31.z, 0.0) + ((_28._m32 + _3875) - vec3(0.0, _28._m33, 0.0));
            float _3915 = dot(_3911, _28._m26);
            vec2 _3925 = ((((_3911 + (_28._m26 * (sqrt(fma(_3915, _3915, fma(_28._m31.z, _28._m31.z, -dot(_3911, _3911)))) - _3915))).xz * _28._m31.w) * 0.5) + vec2(0.5)) + _28._m31.xy;
            _3925.x = 1.0 - _3925.x;
            _3937 = _3847 * (1.0 - clamp(mix(textureLod(sampler2D(_24, _7), _3897, 0.0).x, textureLod(sampler2D(_25, _7), _3925, 0.0).x, _28._m16) * _28._m17, 0.0, 1.0));
        }
        else
        {
            _3937 = _3847;
        }
        float _4009;
        SPIRV_CROSS_BRANCH
        if (_550)
        {
            float _3944 = 1.0 - abs(dot(_513, _28._m0));
            vec4 _3951 = vec4(_553 - (_513 * (0.0199999995529651641845703125 * _3944)), 1.0);
            float _4007;
            int _3953 = 0;
            SPIRV_CROSS_UNROLL
            for (;;)
            {
                if (_3953 < 4)
                {
                    vec4 _3961 = _3951 * _21._m10[_3953];
                    uint _3962 = uint(_3953);
                    vec2 _3977 = clamp((vec2(1.0) - abs((clamp(_3961.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / vec2(_21._m6), vec2(0.0), vec2(1.0));
                    float _3978 = _3961.z;
                    if (((_3977.x * _3977.y) * clamp((clamp(_3978, 0.0, 1.0) * _21._m8[_3962]) / ((_21._m9[_3962] * 0.5) * _21._m6), 0.0, 1.0)) > 0.0)
                    {
                        _4007 = fma(0.0199999995529651641845703125, _3944, abs(fma(1.0 - _3978, _21._m8[_3962], -((1.0 - textureLod(sampler2DArray(_8, _14), vec3(_3961.xy, float(_3953)), 0.0).x) * _21._m8[_3962]))));
                        break;
                    }
                    _3953++;
                    continue;
                }
                else
                {
                    _4007 = 0.0;
                    break;
                }
            }
            _4009 = _4007 * 1000.0;
        }
        else
        {
            _4009 = 0.0;
        }
        vec3 _4011 = _3749 * (_3937 * _6._m0[0u]);
        vec3 _4204;
        vec3 _4205;
        SPIRV_CROSS_BRANCH
        if (_633)
        {
            vec3 _4114 = reflect(_555, _513);
            float _4116 = spvNMax(dot(_513, _555), 9.9999997473787516355514526367188e-06);
            float _4120 = clamp(dot(_28._m0, normalize(_555 + _28._m0)), 0.0, 1.0);
            float _4122 = clamp(dot(_513, _28._m0), 0.0, 1.0);
            vec3 _4129 = vec3(fma((2.0 * _4120) * _4120, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
            float _4148 = dot(_28._m0, _4114);
            vec3 _4158 = mix(_4114, normalize((_28._m0 * 0.999989449977874755859375) + (normalize(_4114 - (_28._m0 * _4148)) * 0.0045900647528469562530517578125)), bvec3(_4148 < 0.999989449977874755859375));
            vec3 _4160 = normalize(_555 + _4158);
            float _4164 = clamp(dot(_513, _4160), 0.0, 1.0);
            float _4166 = clamp(dot(_513, _4158), 0.0, 1.0);
            float _4168 = (_584 + 1.0) * 0.5;
            float _4169 = _584 * _584;
            float _4177 = _4168 * _4168;
            float _4189 = _4169 * _4169;
            float _4192 = fma(fma(_4164, _4189, -_4164), _4164, 1.0);
            _4204 = _3180 + ((_4011 * ((_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - clamp(dot(_4158, _4160), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_4166, sqrt(fma(fma(-_4116, _4177, _4116), _4116, _4177)), _4116 * sqrt(fma(fma(-_4166, _4177, _4166), _4166, _4177)))) * (_4189 * (0.3183098733425140380859375 / (_4192 * _4192)))))) * _4122);
            _4205 = _3181 + ((_4011 * (_516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_4129 * pow(spvNMax(abs(1.0 - _4122), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_4129 * pow(spvNMax(abs(1.0 - _4116), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))))) * _4122);
        }
        else
        {
            vec3 _4110;
            vec3 _4111;
            if (_523)
            {
                vec3 _4020 = reflect(_555, _513);
                float _4022 = spvNMax(dot(_513, _555), 9.9999997473787516355514526367188e-06);
                float _4026 = clamp(dot(_28._m0, normalize(_555 + _28._m0)), 0.0, 1.0);
                float _4028 = clamp(dot(_513, _28._m0), 0.0, 1.0);
                vec3 _4035 = vec3(fma((2.0 * _4026) * _4026, _584, mix(0.0, 0.5, _584))) - vec3(1.0);
                float _4054 = dot(_28._m0, _4020);
                vec3 _4064 = mix(_4020, normalize((_28._m0 * 0.999989449977874755859375) + (normalize(_4020 - (_28._m0 * _4054)) * 0.0045900647528469562530517578125)), bvec3(_4054 < 0.999989449977874755859375));
                vec3 _4066 = normalize(_555 + _4064);
                float _4070 = clamp(dot(_513, _4066), 0.0, 1.0);
                float _4072 = clamp(dot(_513, _4064), 0.0, 1.0);
                float _4074 = (_584 + 1.0) * 0.5;
                float _4075 = _584 * _584;
                float _4083 = _4074 * _4074;
                float _4095 = _4075 * _4075;
                float _4098 = fma(fma(_4070, _4095, -_4070), _4070, 1.0);
                _4110 = _3180 + ((_4011 * ((_521 + ((vec3(1.0) - _521) * pow(spvNMax(abs(1.0 - clamp(dot(_4064, _4066), 0.0, 1.0)), 9.9999997473787516355514526367188e-05), 5.0))) * ((0.5 / fma(_4072, sqrt(fma(fma(-_4022, _4083, _4022), _4022, _4083)), _4022 * sqrt(fma(fma(-_4072, _4083, _4072), _4072, _4083)))) * (_4095 * (0.3183098733425140380859375 / (_4098 * _4098)))))) * _4028);
                _4111 = _3181 + ((_4011 * (_516 * (0.3183098733425140380859375 * (((vec3(1.0) + (_4035 * pow(spvNMax(abs(1.0 - _4028), 9.9999997473787516355514526367188e-05), 5.0))).x * (vec3(1.0) + (_4035 * pow(spvNMax(abs(1.0 - _4022), 9.9999997473787516355514526367188e-05), 5.0))).x) * mix(1.0, 0.662251651287078857421875, _584))))) * _4028);
            }
            else
            {
                _4110 = _3180;
                _4111 = _3181;
            }
            _4204 = _4110;
            _4205 = _4111;
        }
        vec3 _4242;
        SPIRV_CROSS_BRANCH
        if (_523 ? true : false)
        {
            vec3 _4211 = vec3(1.0) / spvNMax((_546 * vec3(0.09660939872264862060546875)) * _547, vec3(9.9999997473787516355514526367188e-05));
            vec3 _4229;
            SPIRV_CROSS_BRANCH
            if (_550)
            {
                vec3 _4225 = exp2(_4211 * ((-0.4808983504772186279296875) * spvNMax(_549, _4009)));
                _4229 = _548 * (_4225 * fma(_4225, _4225, vec3(3.0)));
            }
            else
            {
                vec3 _4217 = exp2(_4211 * ((-0.4808983504772186279296875) * _549));
                _4229 = (_548 * (_4217 * fma(_4217, _4217, vec3(3.0)))) * _3937;
            }
            _4242 = _4205 + ((_4229 * ((_3749 * clamp((0.2588190734386444091796875 - dot(_513, _28._m0)) * 0.631063938140869140625, 0.0, 1.0)) * (_516 * 0.3183098733425140380859375))) * _6._m0[0u]);
        }
        else
        {
            _4242 = _4205;
        }
        float _4262;
        float _4263;
        if (_36._m0.x > 0.0)
        {
            vec4 _4250 = textureLod(sampler2D(_42, _14), _432, 0.0);
            float _4251 = _4250.x;
            _4262 = clamp((pow(spvNMax(abs(dot(_513, _555) + _4251), 9.9999997473787516355514526367188e-05), exp2(fma(-16.0, _584, -1.0))) - 1.0) + _4251, 0.0, 1.0);
            _4263 = _4251;
        }
        else
        {
            _4262 = 1.0;
            _4263 = 1.0;
        }
        // --- RenoDX: AO on Direct Lights ---
        if (pc.rendering_ao_direct > 0.0) {
            float rdx_ao_factor = mix(1.0, _4263, 0.7);
            _4204 *= rdx_ao_factor;
            _4242 *= rdx_ao_factor;
        }
        vec3 _4271 = (_4242 * mix(1.0, _4263, _36._m0.y)) + ((_3266 * _3683) * _4263);
        vec3 _4273 = (_4204 * mix(1.0, _4262, _36._m0.y)) + ((_3263 * _3683) * _4262);
        // --- RenoDX: Multi-Scatter GGX ---
        if (pc.rendering_multi_scatter > 0.0) {
            _4273 *= rdx_multi_scatter_compensation(_3229, _584, _521);
        }
        float _rdx_dbg_micro = 1.0;
        // --- RenoDX: CSM Ambient Shadow Fix (underground/no-CSM areas) ---
        if (pc.rendering_shadow_improvements > 0.5 && _6._m0[0u] > 0.001) {
            float _rdx_csm_shadow = mix(1.0, _3762, 0.5);
            _4271 *= _rdx_csm_shadow;
            _4273 *= _rdx_csm_shadow;
        }
        // --- RenoDX: Micro Shadow Detail (all scenes with sun) ---
        if (pc.rendering_micro_shadows > 0.5 && _6._m0[0u] > 0.001) {
            vec3 _rdx_lightView = mat3(_28._m6[0].xyz, _28._m6[1].xyz, _28._m6[2].xyz) * _28._m0;
            vec2 _rdx_marchDir = normalize(vec2(_rdx_lightView.x, -_rdx_lightView.y));
            float _rdx_micro = rdx_micro_shadow_march(
                _41, _7, _432, _rdx_marchDir, _474, vec2(_36._m1));
            _rdx_dbg_micro = _rdx_micro;
            _4271 *= _rdx_micro;
            _4273 *= _rdx_micro;
        }
        vec3 _4778;
        vec3 _4779;
        SPIRV_CROSS_BRANCH
        if (_3688)
        {
            vec3 _4281 = vec3(0.0, 636100.0, 0.0) + _29._m6;
            vec3 _4282 = vec3(0.0, 636100.0, 0.0) + (_553 + _29._m6);
            float _4283 = length(_4282);
            vec3 _4287 = (_4282 / vec3(_4283)) * spvNMax(_4283, 636100.0);
            vec3 _4288 = _4287 - _4281;
            float _4289 = length(_4288);
            vec3 _4291 = _4288 / vec3(_4289);
            float _4292 = length(_4281);
            vec3 _4306;
            vec3 _4307;
            float _4308;
            if (_4292 < (0.89999997615814208984375 * _31._m0))
            {
                vec3 _4301 = _4281;
                _4301.z = _4281.z + _31._m0;
                vec3 _4304 = _4287;
                _4304.z = _4287.z + _31._m0;
                _4306 = _4304;
                _4307 = _4301;
                _4308 = length(_4301);
            }
            else
            {
                _4306 = _4287;
                _4307 = _4281;
                _4308 = _4292;
            }
            float _4309 = dot(_4307, _4291);
            float _4320 = spvNMax((-_4309) - sqrt(fma(_31._m1, _31._m1, fma(_4309, _4309, -(_4308 * _4308)))), 0.0);
            bool _4323 = (_4320 > 0.0) && (_4320 < _4289);
            vec3 _4331;
            float _4332;
            float _4333;
            if (_4323)
            {
                _4331 = _4307 + (_4291 * _4320);
                _4332 = _4289 - _4320;
                _4333 = (_4309 + _4320) / _31._m1;
            }
            else
            {
                _4331 = _4307;
                _4332 = _4289;
                _4333 = _4309 / _4308;
            }
            float _4334 = _4323 ? _31._m1 : _4308;
            vec3 _4771;
            vec3 _4772;
            if (_4334 <= _31._m1)
            {
                float _4339 = dot(_4291, _28._m36);
                float _4341 = dot(_4331, _28._m36) / _4334;
                float _4342 = _31._m0 + 600.0;
                bool _4343 = _4334 < _4342;
                vec3 _4348;
                if (_4343)
                {
                    _4348 = _4306 * (_4342 / _4334);
                }
                else
                {
                    _4348 = _4306;
                }
                float _4349 = _4343 ? _4342 : _4334;
                float _4350 = length(_4348);
                float _4351 = dot(_4348, _4291);
                float _4353 = dot(_4348, _28._m36) / _4350;
                vec2 _4364 = vec2(_4333, _4333 + (_4332 / _4349));
                vec2 _4365 = _4364 * sqrt((0.5 / _31._m4) * _4349);
                vec2 _4368 = vec2(ivec2(sign(_4365)));
                vec2 _4369 = _4365 * _4365;
                float _4383 = -_4332;
                float _4385 = 2.0 * _4349;
                float _4387 = (_4332 / _4385) + _4333;
                float _4395 = _31._m0 - _4349;
                vec2 _4410 = _4364 * sqrt((0.5 / _31._m6) * _4349);
                vec2 _4413 = vec2(ivec2(sign(_4410)));
                vec2 _4414 = _4410 * _4410;
                vec3 _4444 = exp(((-_31._m5) * ((sqrt((6.283100128173828125 * _31._m4) * _4349) * exp(_4395 / _31._m4)) * (((_4368.y > _4368.x) ? exp(_4369.x) : 0.0) + dot((_4368 / ((abs(_4365) * 2.3192999362945556640625) + sqrt((_4369 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4383 / _31._m4) * _4387)), vec2(1.0, -1.0))))) - (_31._m8 * ((sqrt((6.283100128173828125 * _31._m6) * _4349) * exp(_4395 / _31._m6)) * (((_4413.y > _4413.x) ? exp(_4414.x) : 0.0) + dot((_4413 / ((abs(_4410) * 2.3192999362945556640625) + sqrt((_4414 * 1.519999980926513671875) + vec2(4.0)))) * vec2(1.0, exp((_4383 / _31._m6) * _4387)), vec2(1.0, -1.0))))));
                vec3 _4445 = spvNMin(_4444, vec3(1.0));
                float _4446 = _31._m0 / _4349;
                float _4449 = sqrt(fma(-_4446, _4446, 1.0));
                float _4451 = _4333 - (-_4449);
                vec4 _4734;
                if (abs(_4451) < 0.0040000001899898052215576171875)
                {
                    float _4559 = (-0.0040000001899898052215576171875) - _4449;
                    float _4561 = fma(_4349, _4349, _4332 * _4332);
                    float _4562 = _4385 * _4332;
                    float _4564 = sqrt(fma(_4562, _4559, _4561));
                    float _4565 = fma(_4349, _4559, _4332);
                    float _4568 = -(_31._m0 * _31._m0);
                    float _4570 = sqrt(fma(_31._m1, _31._m1, _4568));
                    float _4572 = sqrt(fma(_4349, _4349, _4568));
                    float _4573 = _4349 * _4559;
                    float _4575 = -(_4349 * _4349);
                    float _4577 = fma(_31._m0, _31._m0, fma(_4573, _4573, _4575));
                    vec4 _4583 = vec4(-1.0, _4570 * _4570, _4570, 0.50390625);
                    vec4 _4584 = mix(_4583, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4573 < 0.0) && (_4577 > 0.0)));
                    float _4586 = fma(_4572 / _4570, 0.96875, 0.015625);
                    float _4596 = fma(fma(_4573, _4584.x, sqrt(_4577 + _4584.y)) / (_4572 + _4584.z), 0.4921875, _4584.w);
                    float _4602 = _4339 + 1.0;
                    float _4604 = floor(_4602 * 3.5);
                    float _4606 = fma(_4602, 3.5, -_4604);
                    float _4607 = _4604 + fma(fma(atan(spvNMax(_4341, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4608 = _4607 * 0.125;
                    float _4612 = 1.0 - _4606;
                    float _4615 = (_4607 + 1.0) * 0.125;
                    float _4622 = sqrt(fma(_4564, _4564, _4568));
                    float _4626 = fma(_31._m0, _31._m0, fma(_4565, _4565, -(_4564 * _4564)));
                    vec4 _4631 = mix(_4583, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4565 < 0.0) && (_4626 > 0.0)));
                    float _4633 = fma(_4622 / _4570, 0.96875, 0.015625);
                    float _4643 = fma(fma(_4565, _4631.x, sqrt(_4626 + _4631.y)) / (_4622 + _4631.z), 0.4921875, _4631.w);
                    float _4649 = _4604 + fma(fma(atan(spvNMax(_4353, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4650 = _4649 * 0.125;
                    float _4656 = (_4649 + 1.0) * 0.125;
                    vec4 _4662 = _4445.xyzx;
                    float _4666 = 0.0040000001899898052215576171875 - _4449;
                    float _4668 = sqrt(fma(_4562, _4666, _4561));
                    float _4669 = fma(_4349, _4666, _4332);
                    float _4670 = _4349 * _4666;
                    float _4672 = fma(_31._m0, _31._m0, fma(_4670, _4670, _4575));
                    vec4 _4677 = mix(_4583, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4670 < 0.0) && (_4672 > 0.0)));
                    float _4687 = fma(fma(_4670, _4677.x, sqrt(_4672 + _4677.y)) / (_4572 + _4677.z), 0.4921875, _4677.w);
                    float _4698 = sqrt(fma(_4668, _4668, _4568));
                    float _4702 = fma(_31._m0, _31._m0, fma(_4669, _4669, -(_4668 * _4668)));
                    vec4 _4707 = mix(_4583, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4669 < 0.0) && (_4702 > 0.0)));
                    float _4709 = fma(_4698 / _4570, 0.96875, 0.015625);
                    float _4719 = fma(fma(_4669, _4707.x, sqrt(_4702 + _4707.y)) / (_4698 + _4707.z), 0.4921875, _4707.w);
                    _4734 = mix(spvNMax(fma(-((textureLod(sampler3D(_33, _7), vec3(_4650, _4643, _4633), 0.0) * _4612) + (textureLod(sampler3D(_33, _7), vec3(_4656, _4643, _4633), 0.0) * _4606)), _4662, (textureLod(sampler3D(_33, _7), vec3(_4608, _4596, _4586), 0.0) * _4612) + (textureLod(sampler3D(_33, _7), vec3(_4615, _4596, _4586), 0.0) * _4606)), vec4(0.0)), spvNMax(fma(-((textureLod(sampler3D(_33, _7), vec3(_4650, _4719, _4709), 0.0) * _4612) + (textureLod(sampler3D(_33, _7), vec3(_4656, _4719, _4709), 0.0) * _4606)), _4662, (textureLod(sampler3D(_33, _7), vec3(_4608, _4687, _4586), 0.0) * _4612) + (textureLod(sampler3D(_33, _7), vec3(_4615, _4687, _4586), 0.0) * _4606)), vec4(0.0)), vec4((_4451 + 0.0040000001899898052215576171875) * 124.99999237060546875));
                }
                else
                {
                    float _4459 = -(_31._m0 * _31._m0);
                    float _4461 = sqrt(fma(_31._m1, _31._m1, _4459));
                    float _4463 = sqrt(fma(_4349, _4349, _4459));
                    float _4464 = _4349 * _4333;
                    float _4468 = fma(_31._m0, _31._m0, fma(_4464, _4464, -(_4349 * _4349)));
                    vec4 _4474 = vec4(-1.0, _4461 * _4461, _4461, 0.50390625);
                    vec4 _4475 = mix(_4474, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4464 < 0.0) && (_4468 > 0.0)));
                    float _4477 = fma(_4463 / _4461, 0.96875, 0.015625);
                    float _4487 = fma(fma(_4464, _4475.x, sqrt(_4468 + _4475.y)) / (_4463 + _4475.z), 0.4921875, _4475.w);
                    float _4493 = _4339 + 1.0;
                    float _4495 = floor(_4493 * 3.5);
                    float _4497 = fma(_4493, 3.5, -_4495);
                    float _4498 = _4495 + fma(fma(atan(spvNMax(_4341, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    float _4503 = 1.0 - _4497;
                    float _4513 = sqrt(fma(_4350, _4350, _4459));
                    float _4517 = fma(_31._m0, _31._m0, fma(_4351, _4351, -(_4350 * _4350)));
                    vec4 _4522 = mix(_4474, vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_4351 < 0.0) && (_4517 > 0.0)));
                    float _4524 = fma(_4513 / _4461, 0.96875, 0.015625);
                    float _4534 = fma(fma(_4351, _4522.x, sqrt(_4517 + _4522.y)) / (_4513 + _4522.z), 0.4921875, _4522.w);
                    float _4540 = _4495 + fma(fma(atan(spvNMax(_4353, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    _4734 = spvNMax(fma(-((textureLod(sampler3D(_33, _7), vec3(_4540 * 0.125, _4534, _4524), 0.0) * _4503) + (textureLod(sampler3D(_33, _7), vec3((_4540 + 1.0) * 0.125, _4534, _4524), 0.0) * _4497)), _4445.xyzx, (textureLod(sampler3D(_33, _7), vec3(_4498 * 0.125, _4487, _4477), 0.0) * _4503) + (textureLod(sampler3D(_33, _7), vec3((_4498 + 1.0) * 0.125, _4487, _4477), 0.0) * _4497)), vec4(0.0));
                }
                float _4749 = fma(_4339, _4339, 1.0);
                _4771 = _4445;
                _4772 = (_4734.xyz * (0.0596831031143665313720703125 * _4749)) + ((((_4734.xyz * (_4734.w * smoothstep(0.0, 0.0199999995529651641845703125, _4341))) / vec3(spvNMax(_4734.x, 9.9999997473787516355514526367188e-05))) * (vec3(_31._m5.x) / _31._m5)) * ((((0.119366206228733062744140625 * fma(-_31._m9, _31._m9, 1.0)) * (-pow(spvNMax(abs(abs(fma(_31._m9 * (-2.0), _4339, fma(_31._m9, _31._m9, 1.0)))), 9.9999997473787516355514526367188e-05), 1.5))) * _4749) / fma(_31._m9, _31._m9, 2.0)));
            }
            else
            {
                _4771 = vec3(1.0);
                _4772 = vec3(0.0);
            }
            _4778 = _4273 * _4771;
            _4779 = fma(_4271, _4771, _4772 * ((_28._m19 * 10.0) * _6._m0[0u]));
        }
        else
        {
            _4778 = _4273;
            _4779 = _4271;
        }
        // --- RenoDX: Micro Shadow Debug View ---
        if (pc.rendering_micro_shadows_debug > 0.5) {
            vec3 _rdx_lv = mat3(_28._m6[0].xyz, _28._m6[1].xyz, _28._m6[2].xyz) * _28._m0;
            vec2 _rdx_raw = vec2(_rdx_lv.x, -_rdx_lv.y);
            float _rdx_len = length(_rdx_raw);
            vec2 _rdx_dir = (_rdx_len > 0.0001) ? (_rdx_raw / _rdx_len) : vec2(1.0, 0.0);
            float _rdx_v = rdx_micro_shadow_march(_41, _7, _432, _rdx_dir, _474, vec2(_36._m1));
            float _rdx_vis = clamp((_rdx_v - 0.5) * 2.0, 0.0, 1.0);
            _4779 = vec3(_rdx_vis);
            _4778 = vec3(0.0);
        }
        imageStore(_45, ivec2(_415), vec4(_4779, 1.0));
        imageStore(_46, ivec2(_415), vec4(_4778, 1.0));
        break;
    } while(false);
}

