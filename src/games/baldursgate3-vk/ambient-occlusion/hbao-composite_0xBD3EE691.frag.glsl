#version 450
#extension GL_EXT_samplerless_texture_functions : require

layout(set = 1, binding = 0) uniform texture2D _4;
layout(set = 1, binding = 1) uniform texture2DArray _5;

layout(location = 0) out vec2 _3;

void main()
{
    ivec2 _33 = ivec2(gl_FragCoord.xy);
    ivec2 _34 = _33 & ivec2(1);
    _3 = vec2(texelFetch(_5, ivec4(_33 >> (ivec2(1) & ivec2(31)), (_34.y * 2) + _34.x, 0).xyz, 0).x, texelFetch(_4, ivec2(uvec2(_33)), int(0u)).x);
}

