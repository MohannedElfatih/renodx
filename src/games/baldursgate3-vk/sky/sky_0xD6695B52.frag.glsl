#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_scalar_block_layout : require
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

layout(set = 0, binding = 0, std140) uniform _16_5
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    float _m5;
    int _m6;
    float _m7;
} _5;

layout(set = 0, binding = 1, std140) uniform _18_6
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

layout(set = 0, binding = 2, std140) uniform _19_7
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    vec3 _m6;
    int _m7;
} _7;

layout(set = 2, binding = 0, std430) readonly buffer _21_8
{
    float _m0[];
} _8;

layout(set = 5, binding = 0, scalar) uniform _22_12
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    vec3 _m5;
    float _m6;
    vec3 _m7;
    vec3 _m8;
    float _m9;
} _12;

layout(set = 2, binding = 1) uniform texture2D _9;
layout(set = 2, binding = 2) uniform texture2D _10;
layout(set = 2, binding = 3) uniform sampler _11;
layout(set = 5, binding = 1) uniform texture2D _13;
layout(set = 5, binding = 2) uniform texture3D _14;
layout(set = 1, binding = 0) uniform sampler _15;

layout(location = 0) in vec3 _3;
layout(location = 0) out vec4 _4;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    vec3 _108 = normalize(_3);
    float _122 = atan(_108.z, _108.x);
    float _126 = 1.0 - fma(asin(_108.y), 0.3183098733425140380859375, 0.5);
    bool _163 = _6._m19 > 0.0;
    vec3 _310;
    vec3 _311;
    SPIRV_CROSS_BRANCH
    if (_163)
    {
        vec3 _168 = vec3(0.0, 636100.0, 0.0) + _7._m6;
        float _172 = length(_168);
        float _173 = dot(_168, _108);
        float _184 = spvNMax((-_173) - sqrt(fma(_12._m1, _12._m1, fma(_173, _173, -(_172 * _172)))), 0.0);
        bool _185 = _184 > 0.0;
        float _192;
        float _193;
        vec3 _194;
        if (_185)
        {
            float _190 = _173 + _184;
            _192 = _190 / _12._m1;
            _193 = _190;
            _194 = _168 + (_108 * _184);
        }
        else
        {
            _192 = _173 / _172;
            _193 = _173;
            _194 = _168;
        }
        float _195 = _185 ? _12._m1 : _172;
        vec3 _306;
        vec3 _307;
        if (_195 <= _12._m1)
        {
            float _200 = dot(_108, _6._m36);
            float _207 = -(_12._m0 * _12._m0);
            float _209 = sqrt(fma(_12._m1, _12._m1, _207));
            float _211 = sqrt(fma(_195, _195, _207));
            float _215 = fma(_12._m0, _12._m0, fma(_193, _193, -(_195 * _195)));
            vec4 _222 = mix(vec4(-1.0, _209 * _209, _209, 0.50390625), vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_193 < 0.0) && (_215 > 0.0)));
            float _224 = fma(_211 / _209, 0.96875, 0.015625);
            float _234 = fma(fma(_193, _222.x, sqrt(_215 + _222.y)) / (_211 + _222.z), 0.4921875, _222.w);
            float _240 = _200 + 1.0;
            float _242 = floor(_240 * 3.5);
            float _244 = fma(_240, 3.5, -_242);
            float _245 = _242 + fma(fma(atan(spvNMax(dot(_194, _6._m36) / _195, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
            vec4 _258 = (textureLod(sampler3D(_14, _15), vec3(_245 * 0.125, _234, _224), 0.0) * (1.0 - _244)) + (textureLod(sampler3D(_14, _15), vec3((_245 + 1.0) * 0.125, _234, _224), 0.0) * _244);
            vec3 _272 = _258.xyz;
            float _286 = fma(_200, _200, 1.0);
            _306 = textureLod(sampler2D(_13, _15), vec2(atan((_192 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_195 - _12._m0) / (_12._m1 - _12._m0))), 0.0).xyz;
            _307 = (_272 * (0.0596831031143665313720703125 * _286)) + ((((_272 * _258.w) / vec3(spvNMax(_258.x, 9.9999997473787516355514526367188e-05))) * (vec3(_12._m5.x) / _12._m5)) * ((((0.119366206228733062744140625 * fma(-_12._m9, _12._m9, 1.0)) * (-pow(abs(fma(_12._m9 * (-2.0), _200, fma(_12._m9, _12._m9, 1.0))), 1.5))) * _286) / fma(_12._m9, _12._m9, 2.0)));
        }
        else
        {
            _306 = vec3(1.0);
            _307 = vec3(0.0);
        }
        _310 = (_307 * _6._m19) * 10.0;
        _311 = _306;
    }
    else
    {
        _310 = vec3(0.0);
        _311 = vec3(1.0);
    }
    vec3 _336;
    SPIRV_CROSS_BRANCH
    if (_163)
    {
        vec3 _335;
        if (_5._m1 == 0.0)
        {
            vec3 _334;
            if (dot(_108, _6._m36) > 0.999956309795379638671875)
            {
                _334 = _310 + ((((_311 * 1.0) * _6._m34) * _6._m20) * 10.0);
            }
            else
            {
                _334 = _310;
            }
            _335 = _334;
        }
        else
        {
            _335 = _310;
        }
        _336 = _335;
    }
    else
    {
        _336 = _310;
    }
    _4 = vec4(fma(mix(mix(_6._m8.xyz, textureLod(sampler2D(_9, _11), vec2(fma(_122 - _6._m12, 0.15915493667125701904296875, 0.5), _126), 0.0).xyz * _6._m11, bvec3(_6._m10 == 1.0)), mix(_6._m9.xyz, textureLod(sampler2D(_10, _11), vec2(fma(_122 - _6._m15, 0.15915493667125701904296875, 0.5), _126), 0.0).xyz * _6._m14, bvec3(_6._m13 == 1.0)), vec3(_6._m16)), _311, _336) * _8._m0[0u], 1.0);
}

