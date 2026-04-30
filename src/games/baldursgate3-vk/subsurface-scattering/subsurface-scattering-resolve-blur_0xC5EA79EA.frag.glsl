#version 450
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

layout(set = 0, binding = 3, std140) uniform _14_6
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
} _6;

layout(set = 0, binding = 4, std140) uniform _15_7
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

layout(set = 1, binding = 2, scalar) uniform _16_10
{
    int _m0;
    ivec3 _m1;
} _10;

layout(set = 1, binding = 0) uniform sampler _8;
layout(set = 1, binding = 1) uniform texture2D _9;
layout(set = 1, binding = 3) uniform texture2D _11;
layout(set = 1, binding = 4) uniform texture2D _12;
layout(set = 1, binding = 5) uniform texture2D _13;

layout(location = 0) in vec2 _4;
layout(location = 0) out vec3 _5;

void main()
{
    ivec2 _61 = ivec3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy;
    vec3 _64 = texelFetch(_9, _61, 0).xyz;
    float _68 = clamp(texelFetch(_11, _61, 0).x, 0.0, 1.0);
    vec3 _208;
    SPIRV_CROSS_BRANCH
    if (_68 > 0.0)
    {
        float _79 = float(_10._m0);
        vec2 _85 = vec2(_6._m2 * _79, _6._m3 * _79) * _7._m15;
        float _88 = _85.x;
        vec2 _96 = clamp(fma(_4, _7._m15, vec2(-_88, 0.0)), _7._m11, _7._m12);
        vec4 _98 = texture(sampler2D(_13, _8), _96);
        float _99 = _98.x;
        vec2 _102 = clamp(fma(_4, _7._m15, vec2(_88, 0.0)), _7._m11, _7._m12);
        vec4 _104 = texture(sampler2D(_13, _8), _102);
        float _105 = _104.x;
        vec2 _106 = clamp(_4 * _7._m15, _7._m11, _7._m12);
        vec4 _108 = texture(sampler2D(_13, _8), _106);
        float _109 = _108.x;
        float _110 = _85.y;
        vec2 _114 = clamp(fma(_4, _7._m15, vec2(0.0, -_110)), _7._m11, _7._m12);
        vec4 _116 = texture(sampler2D(_13, _8), _114);
        float _117 = _116.x;
        vec2 _120 = clamp(fma(_4, _7._m15, vec2(0.0, _110)), _7._m11, _7._m12);
        vec4 _122 = texture(sampler2D(_13, _8), _120);
        float _123 = _122.x;
        float _127 = clamp(1.0 - abs(_68 - _99), 0.0, 1.0);
        float _131 = clamp(1.0 - abs(_68 - _105), 0.0, 1.0);
        float _135 = clamp(1.0 - abs(_68 - _109), 0.0, 1.0);
        float _139 = clamp(1.0 - abs(_68 - _117), 0.0, 1.0);
        float _143 = clamp(1.0 - abs(_68 - _123), 0.0, 1.0);
        float _183 = (((_127 + _131) + _135) + _139) + _143;
        vec4 _191 = (((((vec4(texture(sampler2D(_12, _8), _96).xyz, _99) * _127) + (vec4(texture(sampler2D(_12, _8), _102).xyz, _105) * _131)) + (vec4(texture(sampler2D(_12, _8), _106).xyz, _109) * _135)) + (vec4(texture(sampler2D(_12, _8), _114).xyz, _117) * _139)) + (vec4(texture(sampler2D(_12, _8), _120).xyz, _123) * _143)) / vec4((_183 > 0.0) ? _183 : 1.0);
        float _192 = _191.w;
        _208 = mix(_64, (_191.xyz / vec3((_192 > 0.0) ? clamp(_192, 0.0, 1.0) : 1.0)).xyz, vec3(clamp(((1600.0 / float(_10._m0 * _10._m0)) * _68) * _68, 0.0, 1.0)));
    }
    else
    {
        _208 = _64;
    }
    _5 = _208;
}

