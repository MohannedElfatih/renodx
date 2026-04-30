#version 450
#extension GL_EXT_samplerless_texture_functions : require

layout(set = 0, binding = 4, std140) uniform _10_8
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
} _8;

layout(set = 1, binding = 0) uniform texture2D _9;

layout(location = 0) out float _4;
layout(location = 1) out float _5;
layout(location = 2) out float _6;
layout(location = 3) out float _7;

void main()
{
    ivec2 _40 = ivec2(gl_FragCoord.xy) * ivec2(2);
    ivec2 _43 = ivec2(_8._m19);
    ivec2 _46 = ivec2(_8._m20);
    _4 = texelFetch(_9, ivec2(uvec2(clamp(_40, _43, _46))), int(0u)).x;
    _5 = texelFetch(_9, ivec2(uvec2(clamp(_40 + ivec2(1, 0), _43, _46))), int(0u)).x;
    _6 = texelFetch(_9, ivec2(uvec2(clamp(_40 + ivec2(0, 1), _43, _46))), int(0u)).x;
    _7 = texelFetch(_9, ivec2(uvec2(clamp(_40 + ivec2(1), _43, _46))), int(0u)).x;
}

