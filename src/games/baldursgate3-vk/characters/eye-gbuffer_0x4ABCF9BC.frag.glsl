#version 450
#extension GL_EXT_nonuniform_qualifier : require

vec4 _66;

layout(set = 1, binding = 0, std140) uniform _16_12
{
    vec3 _m0;
    uint _m1;
} _12;

layout(set = 1, binding = 1, std140) uniform _17_13
{
    vec3 _m0;
    float _m1;
    vec3 _m2;
    float _m3;
    vec2 _m4;
    vec2 _m5;
    vec2 _m6;
    vec2 _m7;
    vec2 _m8;
    float _m9;
    float _m10;
    float _m11;
    float _m12;
    float _m13;
    float _m14;
} _13;

layout(set = 0, binding = 7) uniform sampler _10;
layout(set = 0, binding = 8) uniform sampler _11;
layout(set = 1, binding = 2) uniform texture2D _14;
layout(set = 1, binding = 3) uniform texture2D _15;

layout(location = 0) in vec3 _3;
layout(location = 1) in vec4 _4;
layout(location = 2) in vec2 _5;
layout(location = 0) out vec4 _6;
layout(location = 1) out vec4 _7;
layout(location = 2) out vec4 _8;
layout(location = 3) out vec4 _9;

void main()
{
    vec3 _71 = normalize(_3);
    vec3 _78 = mix(_13._m2, _13._m0, vec3(_4.z));
    vec3 _81 = vec3(_13._m1);
    vec3 _87 = texture(sampler2D(_14, _10), _5).xyz;
    vec3 _93 = mix(vec3(dot(_87, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))), _87, vec3(_13._m3));
    vec2 _126 = (((_71.xy / vec2(1.0 - _71.z)) * vec2(0.562524616718292236328125)) * 0.5) + vec2(0.5);
    vec3 _128 = clamp(mix(mix(_13._m0, _78, _81), mix(_13._m0 * _93, mix(_78, textureLod(sampler2D(_15, _11), vec2(_4.z, 0.0), 0.0).xyz, vec3(_13._m9)) * _93, _81), vec3(_13._m10)), vec3(0.0), vec3(1.0));
    vec4 _129 = vec4(_128.x, _128.y, _128.z, _66.w);
    _129.w = 1.0;
    _6 = vec4(_126.x, _126.y, vec4(0.0).z, vec4(0.0).w);
    _7 = _129;
    _8 = vec4(clamp(_13._m13, 0.0, 1.0), clamp(_13._m12, 0.0, 1.0), clamp(_13._m11, 0.0, 1.0), float((0u | ((_12._m1 & 7u) << 4u)) | 0u) * 0.0039215688593685626983642578125);
    _9 = vec4(0.0);
}

