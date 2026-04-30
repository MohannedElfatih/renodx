#version 450
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

layout(set = 0, binding = 4, std140) uniform _9_5
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
} _5;

layout(set = 1, binding = 0, std140) uniform _10_8
{
    vec2 _m0;
    vec2 _m1;
} _8;

layout(set = 1, binding = 1) uniform texture2D _6;
layout(set = 1, binding = 2) uniform sampler _7;

layout(location = 0) in vec2 _3;
layout(location = 0) out float _4;

void main()
{
    vec4 _44 = texture(sampler2D(_6, _7), _3);
    float _45 = _44.y;
    float _46 = 1.0 - _45;
    float _48 = mix(0.0, 32.0, clamp(_46, 0.0, 1.0));
    float _50 = (_45 - 1.0) * _48;
    vec4 _61 = texture(sampler2D(_6, _7), clamp(_3 + _8._m0, _5._m9, _5._m10));
    float _62 = _61.y;
    float _63 = _62 - _46;
    float _66 = fma(_62 - _63, _48, _50);
    float _69 = exp2(fma(-_66, _66, -0.22222222387790679931640625));
    float _73;
    float _76;
    _73 = 1.0 + _69;
    _76 = fma(_69, _61.x, _44.x);
    SPIRV_CROSS_UNROLL
    for (float _78 = 2.0; _78 <= 2.0; )
    {
        vec4 _86 = texture(sampler2D(_6, _7), clamp((_8._m0 * _78) + _3, _5._m9, _5._m10));
        float _91 = fma(fma(-_63, _78, _86.y), _48, _50);
        float _97 = exp2(fma((-_78) * _78, 0.22222222387790679931640625, -(_91 * _91)));
        _73 += _97;
        _76 = fma(_97, _86.x, _76);
        _78 += 1.0;
        continue;
    }
    vec2 _98 = -_8._m0;
    vec4 _102 = texture(sampler2D(_6, _7), clamp(_3 + _98, _5._m9, _5._m10));
    float _103 = _102.y;
    float _104 = _103 - _46;
    float _107 = fma(_103 - _104, _48, _50);
    float _110 = exp2(fma(-_107, _107, -0.22222222387790679931640625));
    float _114;
    float _117;
    _114 = _73 + _110;
    _117 = fma(_110, _102.x, _76);
    SPIRV_CROSS_UNROLL
    for (float _119 = 2.0; _119 <= 2.0; )
    {
        vec4 _127 = texture(sampler2D(_6, _7), clamp((_98 * _119) + _3, _5._m9, _5._m10));
        float _132 = fma(fma(-_104, _119, _127.y), _48, _50);
        float _138 = exp2(fma((-_119) * _119, 0.22222222387790679931640625, -(_132 * _132)));
        _114 += _138;
        _117 = fma(_138, _127.x, _117);
        _119 += 1.0;
        continue;
    }
    _4 = _117 / _114;
}

