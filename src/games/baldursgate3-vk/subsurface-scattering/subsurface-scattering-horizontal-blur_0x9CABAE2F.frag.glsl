#version 450
#extension GL_EXT_samplerless_texture_functions : require

layout(set = 0, binding = 3, std140) uniform _16_9
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
} _9;

layout(set = 0, binding = 4, std140) uniform _17_10
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
} _10;

layout(set = 1, binding = 4, std140) uniform _18_15
{
    vec2 _m0;
    vec2 _m1;
} _15;

layout(set = 1, binding = 0) uniform sampler _11;
layout(set = 1, binding = 1) uniform texture2D _12;
layout(set = 1, binding = 2) uniform texture2D _13;
layout(set = 1, binding = 3) uniform texture2D _14;

layout(location = 0) in vec2 _4;
layout(location = 0) out vec3 _5;
layout(location = 1) out vec3 _6;
layout(location = 2) out vec3 _7;
layout(location = 3) out vec3 _8;

void main()
{
    vec3 _538;
    vec3 _539;
    vec3 _540;
    vec3 _541;
    do
    {
        vec4 _112 = texelFetch(_14, ivec3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy, 0);
        float _113 = _112.x;
        if (_113 <= 0.0)
        {
            _538 = vec3(0.0);
            _539 = vec3(0.0);
            _540 = vec3(0.0);
            _541 = vec3(0.0);
            break;
        }
        vec2 _125 = (vec2(_9._m2, _9._m3) * _15._m0) * _113;
        vec2 _131 = clamp(fma(_125, vec2(-8.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _151 = vec4(texture(sampler2D(_12, _11), _131).xyz, texture(sampler2D(_13, _11), _131).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _131).x), 0.0, 1.0);
        vec2 _154 = clamp(fma(_125, vec2(-7.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _171 = vec4(texture(sampler2D(_12, _11), _154).xyz, texture(sampler2D(_13, _11), _154).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _154).x), 0.0, 1.0);
        vec2 _177 = clamp(fma(_125, vec2(-6.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _194 = vec4(texture(sampler2D(_12, _11), _177).xyz, texture(sampler2D(_13, _11), _177).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _177).x), 0.0, 1.0);
        vec2 _201 = clamp(fma(_125, vec2(-5.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _218 = vec4(texture(sampler2D(_12, _11), _201).xyz, texture(sampler2D(_13, _11), _201).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _201).x), 0.0, 1.0);
        vec2 _225 = clamp(fma(_125, vec2(-4.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _242 = vec4(texture(sampler2D(_12, _11), _225).xyz, texture(sampler2D(_13, _11), _225).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _225).x), 0.0, 1.0);
        vec2 _249 = clamp(fma(_125, vec2(-3.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _266 = vec4(texture(sampler2D(_12, _11), _249).xyz, texture(sampler2D(_13, _11), _249).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _249).x), 0.0, 1.0);
        vec2 _273 = clamp(fma(_125, vec2(-2.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _290 = vec4(texture(sampler2D(_12, _11), _273).xyz, texture(sampler2D(_13, _11), _273).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _273).x), 0.0, 1.0);
        vec2 _297 = clamp(fma(_125, vec2(-1.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _314 = vec4(texture(sampler2D(_12, _11), _297).xyz, texture(sampler2D(_13, _11), _297).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _297).x), 0.0, 1.0);
        vec2 _320 = clamp(_4, _10._m9, _10._m10);
        vec4 _337 = vec4(texture(sampler2D(_12, _11), _320).xyz, texture(sampler2D(_13, _11), _320).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _320).x), 0.0, 1.0);
        vec2 _342 = clamp(fma(_125, vec2(1.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _359 = vec4(texture(sampler2D(_12, _11), _342).xyz, texture(sampler2D(_13, _11), _342).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _342).x), 0.0, 1.0);
        vec2 _366 = clamp(fma(_125, vec2(2.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _383 = vec4(texture(sampler2D(_12, _11), _366).xyz, texture(sampler2D(_13, _11), _366).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _366).x), 0.0, 1.0);
        vec2 _390 = clamp(fma(_125, vec2(3.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _407 = vec4(texture(sampler2D(_12, _11), _390).xyz, texture(sampler2D(_13, _11), _390).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _390).x), 0.0, 1.0);
        vec2 _414 = clamp(fma(_125, vec2(4.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _431 = vec4(texture(sampler2D(_12, _11), _414).xyz, texture(sampler2D(_13, _11), _414).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _414).x), 0.0, 1.0);
        vec2 _438 = clamp(fma(_125, vec2(5.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _455 = vec4(texture(sampler2D(_12, _11), _438).xyz, texture(sampler2D(_13, _11), _438).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _438).x), 0.0, 1.0);
        vec2 _462 = clamp(fma(_125, vec2(6.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _479 = vec4(texture(sampler2D(_12, _11), _462).xyz, texture(sampler2D(_13, _11), _462).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _462).x), 0.0, 1.0);
        vec2 _486 = clamp(fma(_125, vec2(7.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _503 = vec4(texture(sampler2D(_12, _11), _486).xyz, texture(sampler2D(_13, _11), _486).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _486).x), 0.0, 1.0);
        vec4 _506 = ((((((((((((((_171 * 0.00931099988520145416259765625) + (_194 * 0.02437599934637546539306640625)) + (_218 * 0.043940000236034393310546875)) + (_242 * 0.0653750002384185791015625)) + (_266 * 0.08553899824619293212890625)) + (_290 * 0.101695001125335693359375)) + (_314 * 0.11200200021266937255859375)) + (_337 * 0.115525998175144195556640625)) + (_359 * 0.11200200021266937255859375)) + (_383 * 0.101695001125335693359375)) + (_407 * 0.08553899824619293212890625)) + (_431 * 0.0653750002384185791015625)) + (_455 * 0.043940000236034393310546875)) + (_479 * 0.02437599934637546539306640625)) + (_503 * 0.00931099988520145416259765625);
        vec2 _510 = clamp(fma(_125, vec2(8.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _527 = vec4(texture(sampler2D(_12, _11), _510).xyz, texture(sampler2D(_13, _11), _510).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _510).x), 0.0, 1.0);
        vec4 _528 = (((((((((((((((_151 + _171) + _194) + _218) + _242) + _266) + _290) + _314) + _337) + _359) + _383) + _407) + _431) + _455) + _479) + _503) + _527;
        vec4 _530 = (((((((((((((((_151 * 0.05114699900150299072265625) + (_171 * 0.07527600228786468505859375)) + (_194 * 0.09268499910831451416015625)) + (_218 * 0.096591003239154815673828125)) + (_242 * 0.084521003067493438720703125)) + (_266 * 0.0599480010569095611572265625)) + (_290 * 0.031254000961780548095703125)) + (_314 * 0.008577999658882617950439453125)) + (_359 * 0.008577999658882617950439453125)) + (_383 * 0.031254000961780548095703125)) + (_407 * 0.0599480010569095611572265625)) + (_431 * 0.084521003067493438720703125)) + (_455 * 0.096591003239154815673828125)) + (_479 * 0.09268499910831451416015625)) + (_503 * 0.07527600228786468505859375)) + (_527 * 0.05114699900150299072265625);
        _538 = _506.xyz;
        _539 = _530.xyz;
        _540 = vec3(_506.w, _530.w, _528.w);
        _541 = _528.xyz;
        break;
    } while(false);
    _5 = _538;
    _6 = _539;
    _7 = _540;
    _8 = _541;
}

