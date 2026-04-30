#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_samplerless_texture_functions : require
layout(local_size_x = 64, local_size_y = 1, local_size_z = 1) in;

layout(set = 1, binding = 1, std430) buffer _10_5
{
    float _m0[];
} _5;

layout(set = 1, binding = 2, std430) readonly buffer _9_6
{
    float _m0[];
} _6;

layout(set = 1, binding = 3, std140) uniform _11_7
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
} _7;

layout(set = 1, binding = 0) uniform texture2D _4;

shared float _50[64];

void main()
{
    float _57;
    _57 = 0.0;
    for (uint _60 = 0u; _60 < 64u; )
    {
        _57 += texelFetch(_4, ivec3(int(_60), int(gl_GlobalInvocationID.x), 0).xy, 0).x;
        _60++;
        continue;
    }
    _50[gl_GlobalInvocationID.x] = _57 * 0.015625;
    barrier();
    if (gl_GlobalInvocationID.x == 0u)
    {
        float _79;
        _79 = 0.0;
        for (uint _82 = 0u; _82 < 64u; )
        {
            _79 += _50[_82];
            _82++;
            continue;
        }
        float _93 = _6._m0[2u];
        float _94 = fma(_79, 0.015625, -_7._m2) - _93;
        float _108 = clamp(fma(_94, 1.0 - exp((-_7._m3) * ((_94 > 0.0) ? 2.0 : 1.0)), _93), _7._m0, _7._m1);
        float _109 = pow(2.0, _108);
        _5._m0[0u] = 0.833333313465118408203125 / _109;
        _5._m0[1u] = 1.2000000476837158203125 * _109;
        _5._m0[2u] = _108;
        _5._m0[3u] = -8.0;
        _5._m0[4u] = 26.0;
        _5._m0[5u] = 0.038461498916149139404296875;
    }
}

