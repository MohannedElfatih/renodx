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
    vec3 _536;
    vec3 _537;
    vec3 _538;
    vec3 _539;
    do
    {
        vec4 _112 = texelFetch(_14, ivec3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy, 0);
        float _113 = _112.x;
        if (_113 <= 0.0)
        {
            _536 = vec3(0.0);
            _537 = vec3(0.0);
            _538 = vec3(0.0);
            _539 = vec3(0.0);
            break;
        }
        vec2 _125 = (vec2(_9._m2, _9._m3) * _15._m0) * _113;
        vec2 _131 = clamp(fma(_125, vec2(-8.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _151 = vec4(texture(sampler2D(_12, _11), _131).xyz, texture(sampler2D(_13, _11), _131).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _131).x), 0.0, 1.0);
        vec2 _155 = clamp(fma(_125, vec2(-7.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _172 = vec4(texture(sampler2D(_12, _11), _155).xyz, texture(sampler2D(_13, _11), _155).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _155).x), 0.0, 1.0);
        vec2 _177 = clamp(fma(_125, vec2(-6.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _194 = vec4(texture(sampler2D(_12, _11), _177).xyz, texture(sampler2D(_13, _11), _177).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _177).x), 0.0, 1.0);
        vec2 _199 = clamp(fma(_125, vec2(-5.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _216 = vec4(texture(sampler2D(_12, _11), _199).xyz, texture(sampler2D(_13, _11), _199).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _199).x), 0.0, 1.0);
        vec2 _223 = clamp(fma(_125, vec2(-4.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _240 = vec4(texture(sampler2D(_12, _11), _223).xyz, texture(sampler2D(_13, _11), _223).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _223).x), 0.0, 1.0);
        vec2 _247 = clamp(fma(_125, vec2(-3.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _264 = vec4(texture(sampler2D(_12, _11), _247).xyz, texture(sampler2D(_13, _11), _247).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _247).x), 0.0, 1.0);
        vec2 _271 = clamp(fma(_125, vec2(-2.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _288 = vec4(texture(sampler2D(_12, _11), _271).xyz, texture(sampler2D(_13, _11), _271).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _271).x), 0.0, 1.0);
        vec2 _295 = clamp(fma(_125, vec2(-1.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _312 = vec4(texture(sampler2D(_12, _11), _295).xyz, texture(sampler2D(_13, _11), _295).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _295).x), 0.0, 1.0);
        vec2 _318 = clamp(_4, _10._m9, _10._m10);
        vec4 _335 = vec4(texture(sampler2D(_12, _11), _318).xyz, texture(sampler2D(_13, _11), _318).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _318).x), 0.0, 1.0);
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
        vec2 _484 = clamp(fma(_125, vec2(7.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _501 = vec4(texture(sampler2D(_12, _11), _484).xyz, texture(sampler2D(_13, _11), _484).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _484).x), 0.0, 1.0);
        vec2 _506 = clamp(fma(_125, vec2(8.0, 0.0), _4), _10._m9, _10._m10);
        vec4 _523 = vec4(texture(sampler2D(_12, _11), _506).xyz, texture(sampler2D(_13, _11), _506).x) * clamp(1.0 - abs(_113 - texture(sampler2D(_14, _11), _506).x), 0.0, 1.0);
        vec4 _524 = (((((((((((((((_151 + _172) + _194) + _216) + _240) + _264) + _288) + _312) + _335) + _359) + _383) + _407) + _431) + _455) + _479) + _501) + _523;
        vec4 _526 = ((((((((((((((_151 * 0.055991001427173614501953125) + (_172 * 0.01918799988925457000732421875)) + (_216 * 0.01830100081861019134521484375)) + (_240 * 0.0548450015485286712646484375)) + (_264 * 0.085768997669219970703125)) + (_288 * 0.102517001330852508544921875)) + (_312 * 0.108534999191761016845703125)) + (_335 * 0.109709002077579498291015625)) + (_359 * 0.108534999191761016845703125)) + (_383 * 0.102517001330852508544921875)) + (_407 * 0.085768997669219970703125)) + (_431 * 0.0548450015485286712646484375)) + (_455 * 0.01830100081861019134521484375)) + (_501 * 0.01918799988925457000732421875)) + (_523 * 0.055991001427173614501953125);
        vec4 _528 = ((((((((((((((_151 * 0.0044129998423159122467041015625) + (_194 * 0.049222998321056365966796875)) + (_216 * 0.099928997457027435302734375)) + (_240 * 0.114688999950885772705078125)) + (_264 * 0.097079999744892120361328125)) + (_288 * 0.0686739981174468994140625)) + (_312 * 0.0466430000960826873779296875)) + (_335 * 0.0386970005929470062255859375)) + (_359 * 0.0466430000960826873779296875)) + (_383 * 0.0686739981174468994140625)) + (_407 * 0.097079999744892120361328125)) + (_431 * 0.114688999950885772705078125)) + (_455 * 0.099928997457027435302734375)) + (_479 * 0.049222998321056365966796875)) + (_523 * 0.0044129998423159122467041015625);
        _536 = _526.xyz;
        _537 = _528.xyz;
        _538 = vec3(_526.w, _528.w, _524.w);
        _539 = _524.xyz;
        break;
    } while(false);
    _5 = _536;
    _6 = _537;
    _7 = _538;
    _8 = _539;
}

