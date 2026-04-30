#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
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

struct _25
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
};

layout(set = 0, binding = 0, std140) uniform _21_6
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    float _m5;
    int _m6;
    float _m7;
} _6;

layout(set = 0, binding = 1, std140) uniform _23_7
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
} _7;

layout(set = 0, binding = 2, std140) uniform _24_8
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    vec3 _m6;
    int _m7;
} _8;

layout(set = 2, binding = 15, std430) readonly buffer _27_12
{
    _25 _m0[];
} _12;

layout(set = 2, binding = 26, std140) uniform _30_13
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
} _13;

layout(set = 1, binding = 0, std140) uniform _31_19
{
    uint _m0;
    uint _m1;
    uint _m2;
    float _m3;
    layout(row_major) mat4 _m4;
    layout(row_major) mat4 _m5;
} _19;

layout(set = 2, binding = 8) uniform texture2DArray _9;
layout(set = 2, binding = 9) uniform samplerShadow _10;
layout(set = 2, binding = 14) uniform sampler _11;
layout(set = 1, binding = 1) uniform texture2D _14;
layout(set = 1, binding = 2) uniform texture2D _15;
layout(set = 1, binding = 3) uniform texture2DArray _16;
layout(set = 1, binding = 4) uniform texture2DArray _17;
layout(set = 1, binding = 5) uniform texture2D _18;
layout(set = 1, binding = 6) uniform texture2D _20;

layout(location = 0) in vec3 _4;
layout(location = 0) out vec4 _5;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

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
    float csm_debug;                     // 104
} pc;

void main()
{
    int _124 = int(gl_FragCoord.x);
    int _125 = int(gl_FragCoord.y);
    ivec2 _127 = ivec3(_124, _125, 0).xy;
    vec4 _129 = texelFetch(_14, _127, 0);
    float _130 = _129.x;
    vec3 _131 = _4 * _130;
    float _158 = fma(fract(_6._m2 * 0.25), _6._m3, fma(0.2700000107288360595703125, fma(((_125 & 1) == 0) ? 1.0 : (-1.0), 0.5, ((_124 & 1) == 0) ? 1.0 : (-1.0)) + 1.5, texelFetch(_18, ivec3(ivec2(gl_FragCoord.xy * 0.5) & ivec2(63), 0).xy, 0).x));

    // CSM Diagnostic setup
    int csmMode = int(pc.csm_debug + 0.5);
    float _159 = _158 * 6.283185482025146484375;
    float _166 = 230.0 / spvNMax(_8._m3, _130 * _8._m4);
    vec3 _167 = dFdxFine(_131);
    vec3 _168 = dFdyFine(_131);
    vec3 _171 = cross(_167, _168) * (_166 * _166);
    vec3 _172 = subgroupQuadSwapDiagonal(_131);
    float _183 = spvNMax(0.0, spvNMin(1.0, fma(2.0, spvNMax(dot(_171, _171), (abs(dot(_171, _172 - _131)) * _166) * 60.0), -0.20000000298023223876953125)));

    // FIX: The CSM shader reconstructs position as _4 * _130 (jittered ray × unjittered depth),
    // but never unjitters the ray direction. This makes dFdxFine/dFdyFine normals wobble
    // each frame with TAA jitter → bias offset changes → shadow acne and flickering.
    //
    // Split normal usage: derivative normal for backface detection (needs surface orientation),
    // light direction for bias offset (needs frame-to-frame stability).
    vec3 _186_deriv = normalize(_171).xyz;
    vec3 _186;
    if (pc.rendering_shadow_improvements > 0.5)
    {
        // Blend derivative normal (surface-aware XY offset) with light direction (stable Z).
        // The derivative normal wobbles with TAA jitter → flickering.
        // The light direction is perfectly stable but lacks surface-angle awareness → acne.
        // 70% light direction for stability, 30% surface normal for XY receiver-plane bias.
        _186 = normalize(mix(_186_deriv, normalize(_7._m0), 0.7));
    }
    else
    {
        _186 = _186_deriv;
    }
    // CSM mode 3/4: diagnostic — force light direction as normal
    if (csmMode == 3 || csmMode == 4) { _186 = normalize(_7._m0); }
    bool _188 = dot(_7._m0, _186_deriv) < 0.0;
    bool _191 = _19._m0 != 0u;
    bool _235;
    float _236;
    SPIRV_CROSS_BRANCH
    if (_191 || _188)
    {
        uint _200 = uint(roundEven(texelFetch(_15, _127, 0).w * 255.0));
        float _208;
        if (_191)
        {
            _208 = (((_200 & 128u) >> 1u) != 0u) ? 20.0 : 0.0;
        }
        else
        {
            _208 = 0.0;
        }
        bool _234;
        if (_188)
        {
            int _211 = int(_200 & 7u);
            bool _212 = _211 == 3;
            bool _233;
            SPIRV_CROSS_BRANCH
            if (_212 || (_211 == 4))
            {
                vec4 _218 = texelFetch(_20, _127, 0);
                _233 = ((!_212) || (_218.w != 0.0)) && (!(_12._m0[uint(int(_218.x * 255.0))]._m2.z == 1.0));
            }
            else
            {
                _233 = false;
            }
            _234 = _233;
        }
        else
        {
            _234 = false;
        }
        _235 = _234;
        _236 = _208;
    }
    else
    {
        _235 = false;
        _236 = 0.0;
    }
    vec4 _244;
    float _251;
    vec2 _259;
    float _696;
    int rdx_cascadeIdx = -1;
    do
    {
        _244 = vec4(_131, 1.0);
        vec4 _245 = _244 * _13._m10[0];
        _251 = 0.5 * _13._m6;
        _259 = vec2(_13._m6);
        vec2 _261 = clamp((vec2(1.0) - abs((clamp(_245.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / _259, vec2(0.0), vec2(1.0));
        float _272 = (_261.x * _261.y) * clamp((clamp(_245.z, 0.0, 1.0) * _13._m8.x) / (_13._m9.x * _251), 0.0, 1.0);
        vec3 _302;
        int _303;
        float _304;
        SPIRV_CROSS_BRANCH
        if (_272 == 0.0)
        {
            vec4 _278 = _244 * _13._m10[1];
            vec2 _290 = clamp((vec2(1.0) - abs((clamp(_278.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / _259, vec2(0.0), vec2(1.0));
            _302 = _278.xyz;
            _303 = 1;
            _304 = (_290.x * _290.y) * clamp((clamp(_278.z, 0.0, 1.0) * _13._m8.y) / (_13._m9.y * _251), 0.0, 1.0);
        }
        else
        {
            _302 = _245.xyz;
            _303 = 0;
            _304 = _272;
        }
        vec3 _334;
        int _335;
        float _336;
        SPIRV_CROSS_BRANCH
        if (_304 == 0.0)
        {
            vec4 _310 = _244 * _13._m10[2];
            vec2 _322 = clamp((vec2(1.0) - abs((clamp(_310.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / _259, vec2(0.0), vec2(1.0));
            _334 = _310.xyz;
            _335 = 2;
            _336 = (_322.x * _322.y) * clamp((clamp(_310.z, 0.0, 1.0) * _13._m8.z) / (_13._m9.z * _251), 0.0, 1.0);
        }
        else
        {
            _334 = _302;
            _335 = _303;
            _336 = _304;
        }
        vec3 _366;
        int _367;
        float _368;
        SPIRV_CROSS_BRANCH
        if (_336 == 0.0)
        {
            vec4 _342 = _244 * _13._m10[3];
            vec2 _354 = clamp((vec2(1.0) - abs((clamp(_342.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / _259, vec2(0.0), vec2(1.0));
            _366 = _342.xyz;
            _367 = 3;
            _368 = (_354.x * _354.y) * clamp((clamp(_342.z, 0.0, 1.0) * _13._m8.w) / (_13._m9.w * _251), 0.0, 1.0);
        }
        else
        {
            _366 = _334;
            _367 = _335;
            _368 = _336;
        }
        rdx_cascadeIdx = _367;
        bool _369 = _368 > 0.0;
        float _370 = float(_369);
        if ((((!_369) && (subgroupQuadSwapHorizontal(_370) < 0.5)) && (subgroupQuadSwapVertical(_370) < 0.5)) && (subgroupQuadSwapDiagonal(_370) < 0.5))
        {
            _696 = 1.0;
            break;
        }
        vec3 _439;
        float _440;
        vec3 _441;
        SPIRV_CROSS_BRANCH
        if (_369)
        {
            uint _386 = uint(_367);
            float _391 = _13._m9[_386] / _13._m9.x;
            vec3 _403 = _186 * mat3(_13._m10[_367][0].xyz, _13._m10[_367][1].xyz, _13._m10[_367][2].xyz);
            vec3 _407;
            if (_235)
            {
                _407 = -_403;
            }
            else
            {
                _407 = _403;
            }
            float _408 = 0.00048828125 * _13._m9[_386];
            vec3 _409 = _407 * _408;
            _409.z = _409.z + spvNMax(0.0, 1.52587890625e-05 - (_408 / _13._m8[_386]));
            vec3 _417 = _409 * (1.0 - _183);
            _417.z = fma((_13._m7 / _13._m8[_386]) * mix(_391, _13._m8[_386] / _13._m8.x, 0.75), _183, _417.z);
            _439 = _366 + _417;
            _440 = spvNMax(spvNMin(0.20999999344348907470703125, tan(_13._m4) * ((1.0 - _366.z) * _13._m8[_386])) / _13._m9[_386], spvNMax(2.0 / _391, _236) * 0.00048828125);
            _441 = _417 * 2048.0;
        }
        else
        {
            _439 = _366;
            _440 = _236;
            _441 = vec3(0.0);
        }
        vec3 _442 = _441 * 1.10000002384185791015625;
        float _511;
        do
        {
            float _491;
            float _492;
            SPIRV_CROSS_BRANCH
            if (_369)
            {
                int _448 = 7 - _367;
                float _450;
                float _453;
                _450 = 0.0;
                _453 = 0.0;
                float _451;
                float _454;
                for (int _455 = 0; _455 < _448; _450 = _451, _453 = _454, _455++)
                {
                    float _462 = float(uint(_455));
                    float _468 = fma(_462, 2.3999631404876708984375, _159);
                    vec3 _475 = _439 + ((_442 + vec3(cos(_468), sin(_468), 0.0)) * ((sqrt(_462 + 0.5) / sqrt(float(uint(_448)))) * _440));
                    vec4 _483 = textureLod(sampler2DArray(_9, _11), vec3(_475.xy, float(_367)), 0.0);
                    float _484 = _483.x;
                    if (_484 > _475.z)
                    {
                        _451 = _450 + 1.0;
                        _454 = _453 + _484;
                    }
                    else
                    {
                        _451 = _450;
                        _454 = _453;
                    }
                }
                _491 = _450;
                _492 = _453;
            }
            else
            {
                _491 = 0.0;
                _492 = 0.0;
            }
            if (_183 > 0.0)
            {
                _511 = (((_492 + subgroupQuadSwapHorizontal(_492)) + subgroupQuadSwapVertical(_492)) + subgroupQuadSwapDiagonal(_492)) / spvNMax(((_491 + subgroupQuadSwapHorizontal(_491)) + subgroupQuadSwapVertical(_491)) + subgroupQuadSwapDiagonal(_491), 1.0);
                break;
            }
            _511 = _492 / spvNMax(_491, 1.0);
            break;
        } while(false);
        // CSM mode 2/4: skip blocker search — force _511 = surface depth (no PCSS)
        if (csmMode == 2 || csmMode == 4) { _511 = _366.z; }
        float _579;
        float _580;
        bool _581;
        SPIRV_CROSS_BRANCH
        if (_369)
        {
            uint _515 = uint(_367);
            float _531 = spvNMax(spvNMin(0.20999999344348907470703125, tan(_13._m4) * ((_511 - _366.z) * _13._m8[_515])) / _13._m9[_515], spvNMax(2.0 / (_13._m9[_515] / _13._m9.x), _236) * 0.00048828125);
            int _532 = 9 - _367;
            float _534;
            _534 = 0.0;
            for (int _537 = 0; _537 < _532; )
            {
                float _543 = float(uint(_537));
                float _549 = fma(_543, 2.3999631404876708984375, _159);
                vec3 _556 = _439 + ((_441 + vec3(cos(_549), sin(_549), 0.0)) * ((sqrt(_543 + 0.5) / sqrt(float(uint(_532)))) * _531));
                _534 += textureGrad(sampler2DArrayShadow(_9, _10), vec4(vec3(_556.xy, float(_367)), _556.z), vec2(0.0), vec2(0.0));
                _537++;
                continue;
            }
            float _567 = _534 / float(_532);
            int _569 = _367 + 1;
            float _575;
            if (_569 == 4)
            {
                _575 = fma(_567, _368, 1.0 - _368);
            }
            else
            {
                _575 = _567 * _368;
            }
            _579 = _575;
            _580 = _531;
            _581 = (_569 < 4) && (_368 < 1.0);
        }
        else
        {
            _579 = 1.0;
            _580 = _236;
            _581 = _369;
        }
        SPIRV_CROSS_BRANCH
        if (!_581)
        {
            _696 = _579;
            break;
        }
        int _585 = _367 + 1;
        float _586 = fma(_158, 6.283185482025146484375, 0.785398185253143310546875);
        vec4 _589 = _244 * _13._m10[_585];
        uint _591 = uint(_585);
        vec2 _602 = clamp((vec2(1.0) - abs((clamp(_589.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / _259, vec2(0.0), vec2(1.0));
        SPIRV_CROSS_BRANCH
        if (!(_581 && (((_602.x * _602.y) * clamp((clamp(_589.z, 0.0, 1.0) * _13._m8[_591]) / (_13._m9[_591] * _251), 0.0, 1.0)) > 0.0)))
        {
            _696 = _579;
            break;
        }
        vec3 _629 = _186 * mat3(_13._m10[_585][0].xyz, _13._m10[_585][1].xyz, _13._m10[_585][2].xyz);
        vec3 _633;
        if (_235)
        {
            _633 = -_629;
        }
        else
        {
            _633 = _629;
        }
        float _634 = 0.00048828125 * _13._m9[_591];
        vec3 _635 = _633 * _634;
        _635.z = _635.z + spvNMax(0.0, 1.52587890625e-05 - (_634 / _13._m8[_591]));
        vec3 _643 = _635 * (1.0 - _183);
        _643.z = fma((_13._m7 / _13._m8[_591]) * mix(_13._m9[_591] / _13._m9.x, _13._m8[_591] / _13._m8.x, 0.75), _183, _643.z);
        vec3 _651 = _589.xyz + _643;
        vec3 _652 = _643 * 2048.0;
        float _657 = _580 * (_13._m9[uint(_367)] / _13._m9[_591]);
        int _658 = 8 - _367;
        float _660;
        _660 = 0.0;
        for (int _663 = 0; _663 < _658; )
        {
            float _669 = float(uint(_663));
            float _675 = fma(_669, 2.3999631404876708984375, _586);
            vec3 _682 = _651 + ((_652 + vec3(cos(_675), sin(_675), 0.0)) * ((sqrt(_669 + 0.5) / sqrt(float(uint(_658)))) * _657));
            _660 += textureGrad(sampler2DArrayShadow(_9, _10), vec4(vec3(_682.xy, float(_585)), _682.z), vec2(0.0), vec2(0.0));
            _663++;
            continue;
        }
        _696 = fma(_660 / float(_658), 1.0 - _368, _579);
        break;
    } while(false);
    float _788;
    if (_19._m1 != 0u)
    {
        float _787;
        if ((_8._m4 * _130) > _19._m3)
        {
            vec4 _716 = _244 * _19._m5;
            float _722 = _716.z;
            float _786;
            if (all(lessThan(abs(_716.xy - vec2(0.5)), vec2(0.5))) && (_722 >= 0.0))
            {
                vec4 _750 = _244 * _13._m10[3u];
                vec2 _761 = clamp((vec2(1.0) - abs((clamp(_750.xy, vec2(0.0), vec2(1.0)) * 2.0) - vec2(1.0))) / _259, vec2(0.0), vec2(1.0));
                float _785;
                if (((_761.x * _761.y) * clamp((clamp(_750.z, 0.0, 1.0) * _13._m8.w) / (_13._m9.w * _251), 0.0, 1.0)) < 1.0)
                {
                    _785 = spvNMin(_696, textureGrad(sampler2DArrayShadow(_17, _10), vec4(vec3(_716.xy, float(_19._m2)), _722 + 4.9999998736893758177757263183594e-05), vec2(0.0), vec2(0.0)));
                }
                else
                {
                    _785 = _696;
                }
                _786 = _785;
            }
            else
            {
                vec4 _728 = _244 * _19._m4;
                float _734 = _728.z;
                float _747;
                if (all(lessThan(abs(_728.xy - vec2(0.5)), vec2(0.5))) && (_734 >= 0.0))
                {
                    _747 = textureGrad(sampler2DArrayShadow(_16, _10), vec4(vec3(_728.xy, float(_19._m2)), _734 + 0.00069999997504055500030517578125), vec2(0.0), vec2(0.0));
                }
                else
                {
                    _747 = _696;
                }
                _786 = _747;
            }
            _787 = _786;
        }
        else
        {
            _787 = _696;
        }
        _788 = _787;
    }
    else
    {
        _788 = _696;
    }
    // CSM Diagnostic Modes (functional — modify shadow computation)
    // 0 = off (vanilla)
    // 1 = cascade bands
    // 2 = skip blocker search — use fixed PCF radius (tests PCSS instability)
    // 3 = stable normal (light dir instead of ddx/ddy — tests normal instability)
    // 4 = both: skip blocker + stable normal
    if (csmMode == 1)
    {
        float cv = (rdx_cascadeIdx == 0) ? 0.2 :
                   (rdx_cascadeIdx == 1) ? 0.4 :
                   (rdx_cascadeIdx == 2) ? 0.7 : 1.0;
        _5 = vec4(cv);
    }
    else
    {
        _5 = vec4(_788);
    }
}

