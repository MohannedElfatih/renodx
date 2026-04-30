#version 450
#extension GL_EXT_nonuniform_qualifier : require
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

vec3 _70;
const vec2 _75[4] = vec2[](vec2(1.0, 0.0), vec2(0.0, 1.0), vec2(-1.0, 0.0), vec2(0.0, -1.0));

layout(set = 0, binding = 2, std140) uniform _12_5
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    vec3 _m6;
    int _m7;
} _5;

layout(set = 0, binding = 3, std140) uniform _13_6
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
} _6;

layout(set = 0, binding = 4, std140) uniform _14_7
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
} _7;

layout(set = 1, binding = 0, std140) uniform _15_8
{
    vec4 _m0;
    vec4 _m1;
    vec2 _m2;
    vec2 _m3;
    float _m4;
    float _m5;
    float _m6;
    float _m7;
} _8;

layout(set = 1, binding = 1) uniform texture2D _9;
layout(set = 1, binding = 2) uniform texture2D _10;
layout(set = 1, binding = 3) uniform texture2D _11;

layout(location = 0) out float _4;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    float _84 = (-1.0) / (_8._m5 * _8._m5);
    float _300;
    do
    {
        ivec2 _98 = ivec2(gl_FragCoord.xy);
        vec4 _101 = texelFetch(_11, ivec2(uvec2(_98)), int(0u));
        float _102 = _101.x;
        vec2 _106 = _8._m2 * 0.5;
        float _112 = _102 * _5._m4;
        vec2 _115 = vec2(_7._m3);
        vec3 _123 = vec3(fma((vec2(_98) + _106) - _115, _8._m1.xy, _8._m1.zw) * _112, _112);
        SPIRV_CROSS_BRANCH
        if (_102 >= 1.0)
        {
            _300 = 1.0;
            break;
        }
        uvec2 _137 = uvec2(clamp((_98 * ivec2(2)) + ivec2(_8._m2), ivec2(_7._m19), ivec2(_7._m20)));
        vec3 _157;
        do
        {
            vec3 _145 = fma(vec3(texelFetch(_9, ivec2(_137), int(0u)).xy, 0.0), vec3(3.55539989471435546875, 3.55539989471435546875, 0.0), vec3(-1.777699947357177734375, -1.777699947357177734375, 1.0));
            float _146 = dot(_145, _145);
            if (_146 > 54000001024.0)
            {
                _157 = vec3(0.0, 0.0, 1.0);
                break;
            }
            else
            {
                float _151 = 2.0 / _146;
                vec2 _153 = _145.xy * _151;
                vec3 _154 = vec3(_153.x, _153.y, _70.z);
                _154.z = 1.0 - _151;
                _157 = _154;
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _159 = (((_5._m1[1u].y * (_6._m1 * 0.5)) * _7._m0.y) * _8._m5) / _112;
        SPIRV_CROSS_BRANCH
        if (_159 < 1.0)
        {
            _300 = 1.0;
            break;
        }
        float _163 = _159 * 0.20000000298023223876953125;
        float _167;
        float _170;
        _167 = 0.0;
        _170 = 0.0;
        float _171;
        float _168;
        SPIRV_CROSS_UNROLL
        for (float _172 = 0.0; _172 < 4.0; _167 = _168, _170 = _171, _172 += 1.0)
        {
            int _177 = int(_172);
            vec2 _189 = vec2(fma(_8._m0.x, _75[_177].x, -(_8._m0.y * _75[_177].y)), fma(_8._m0.x, _75[_177].y, _8._m0.y * _75[_177].x));
            float _191 = fma(_8._m0.z, _163, 1.0);
            vec2 _200 = vec2((_7._m4 - _7._m3) + uvec2(1u));
            ivec2 _201 = ivec2(_7._m3);
            vec2 _206 = abs(vec2((_98 + ivec2(roundEven(_189 * _191))) - _201) + vec2(0.5)) + _200;
            vec2 _207 = _200 * 2.0;
            ivec2 _214 = ivec2(_7._m3 + uvec2(ivec2(abs((_206 - _207 * trunc(_206 / _207)) - _200))));
            float _220 = texelFetch(_11, ivec2(uvec2(_214)), int(0u)).x * _5._m4;
            float _227 = fma(_159, 0.20000000298023223876953125, _191);
            vec3 _228 = vec3(fma((vec2(_214) + _106) - _115, _8._m1.xy, _8._m1.zw) * _220, _220) - _123;
            float _229 = dot(_228, _228);
            float _234 = -_8._m6;
            _171 = fma(clamp(fma(dot(_157, _228), inversesqrt(_229), _234), 0.0, 1.0), clamp(fma(_229, _84, 1.0), 0.0, 1.0), _170);
            _168 = _167;
            SPIRV_CROSS_UNROLL
            for (float _242 = _227, _244 = 1.0; _244 < 4.0; )
            {
                vec2 _256 = abs(vec2((_98 + ivec2(roundEven(_189 * _242))) - _201) + vec2(0.5)) + _200;
                ivec2 _263 = ivec2(_7._m3 + uvec2(ivec2(abs((_256 - _207 * trunc(_256 / _207)) - _200))));
                float _269 = texelFetch(_11, ivec2(uvec2(_263)), int(0u)).x * _5._m4;
                vec3 _276 = vec3(fma((vec2(_263) + _106) - _115, _8._m1.xy, _8._m1.zw) * _269, _269) - _123;
                float _277 = dot(_276, _276);
                _168 = fma(clamp(fma(dot(_157, _276), inversesqrt(_277), _234), 0.0, 1.0), clamp(fma(_277, _84, 1.0), 0.0, 1.0), _168);
                _242 = fma(_159, 0.20000000298023223876953125, _242);
                _244 += 1.0;
                continue;
            }
        }
        _300 = clamp(fma(-(spvNMax((_170 + _167) * 0.15625, clamp(1.0 - texelFetch(_10, ivec2(_137), int(0u)).w, 0.0, 1.0)) * clamp(fma(_112, -0.004999999888241291046142578125, 1.0), 0.0, 1.0)), _8._m4, 1.0), 0.0, 1.0);
        break;
    } while(false);
    _4 = _300;
}

