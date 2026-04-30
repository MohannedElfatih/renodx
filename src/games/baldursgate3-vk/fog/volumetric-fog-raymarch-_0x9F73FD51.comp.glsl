#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_samplerless_texture_functions : require
layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

layout(set = 1, binding = 42, std140) uniform _14_5
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
} _5;

layout(set = 0, binding = 1, std140) uniform _16_6
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
} _6;

layout(set = 0, binding = 4, std140) uniform _17_7
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

layout(set = 1, binding = 3, scalar) uniform _18_11
{
    uint _m0;
    uvec3 _m1;
} _11;

layout(set = 1, binding = 12) uniform texture2D _4;
layout(set = 1, binding = 0) uniform texture3D _8;
layout(set = 1, binding = 1) uniform texture3D _9;
layout(set = 1, binding = 2, rgba32f) uniform writeonly image3D _10;

void main()
{
    do
    {
        uvec2 _86 = uvec2(_11._m0);
        uvec2 _92 = gl_GlobalInvocationID.xy + (_7._m3 / _86);
        uvec3 _93 = uvec3(_92.x, _92.y, gl_GlobalInvocationID.z);
        uvec2 _94 = _92.xy;
        if (any(greaterThan(_94, (_7._m4 / _86))))
        {
            break;
        }
        float _147;
        vec2 _114 = ((clamp((vec2(_94) + vec2(0.5)) * vec2(_5._m32, _5._m18), vec2(0.0), vec2(1.0)) - _7._m1) / _7._m0) * 0.5;
        float _118 = _114.x;
        float _120 = _114.y;
        float _133 = length(((_6._m7[0].xyz * ((1.0 - _118) - _120)) + (_6._m7[1].xyz * _118)) + (_6._m7[2].xyz * _120));
        uint _142 = uint(fma(texelFetch(_4, ivec2(_94 + uvec2(_7._m5, 0u)), int(0u)).x, 255.0, 0.5));
        float _160;
        do
        {
            _147 = _5._m19[1].x;
            if (0.0 <= _147)
            {
                _160 = _5._m19[0].y * (-_5._m19[3].x);
                break;
            }
            else
            {
                _160 = _5._m19[1].z * (1.0 - _5._m19[3].y);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _93.z = 0u;
        vec4 _163;
        float _166;
        uvec3 _168;
        _163 = vec4(0.0, 0.0, 0.0, 1.0);
        _166 = _160;
        _168 = _93;
        vec4 _164;
        uvec3 _169;
        float _167;
        uint _170;
        for (;;)
        {
            _170 = _168.z;
            if (_170 <= _142)
            {
                uvec3 _175 = _168 + uvec3(_7._m5, 0u, 0u);
                vec4 _178 = texelFetch(_8, ivec3(_175), int(0u)) * 0.0001220703125;
                float _185 = float(_170) + 0.5;
                do
                {
                    if (_185 <= _147)
                    {
                        _167 = _5._m19[0].y * (_185 - _5._m19[3].x);
                        break;
                    }
                    else
                    {
                        _167 = _5._m19[1].z * (exp2(_5._m19[0].z * _185) - _5._m19[3].y);
                        break;
                    }
                    break; // unreachable workaround
                } while(false);
                float _204 = (_167 - _166) * _133;
                float _205 = _178.w;
                float _206 = _204 * _205;
                float _208 = exp2(_206 * (-1.44269502162933349609375));
                float _217;
                if (_206 < 0.0039956313557922840118408203125)
                {
                    _217 = fma(-0.5, _206, 1.0) * _204;
                }
                else
                {
                    _217 = (1.0 - _208) / _205;
                }
                vec3 _222 = _163.xyz + (((texelFetch(_9, ivec3(_175), int(0u)).xyz * _178.xyz) * _217) * _163.w);
                _164 = vec4(_222.x, _222.y, _222.z, _163.w);
                _164.w = _163.w * _208;
                imageStore(_10, ivec3(_175), vec4(_222, fma(-_163.w, _208, 1.0) * 32768.0));
                _169 = _168;
                _169.z = _170 + 1u;
                _163 = _164;
                _166 = _167;
                _168 = _169;
                continue;
            }
            else
            {
                break;
            }
        }
        break;
    } while(false);
}

