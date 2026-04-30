#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_spirv_intrinsics : require
layout(local_size_x = 64, local_size_y = 1, local_size_z = 1) in;

layout(set = 1, binding = 2, std430) readonly buffer _11_7
{
    float _m0[];
} _7;

layout(set = 1, binding = 4, std140) uniform _12_9
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
} _9;

layout(set = 1, binding = 0) uniform sampler _5;
layout(set = 1, binding = 1) uniform texture2D _6;
layout(set = 1, binding = 3, r16f) uniform writeonly image2D _8;

shared float _63[64];

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    vec4 _166 = textureLod(sampler2D(_6, _5), vec2(fma(float((gl_WorkGroupID.x * 8u) + ((((gl_LocalInvocationID.x >> 2u) & 7u) & 65534u) | (gl_LocalInvocationID.x & 1u))) * 0.001953125, _9._m1, _9._m0), fma(float((gl_WorkGroupID.y * 8u) + (((gl_LocalInvocationID.x >> 1u) & 3u) | (((gl_LocalInvocationID.x >> 3u) & 7u) & 65532u))) * 0.001953125, _9._m3, _9._m2)), 0.0);
    uint _175 = floatBitsToUint(_166.x) & 2147483647u;
    uint _179 = floatBitsToUint(_166.y) & 2147483647u;
    uint _184 = floatBitsToUint(_166.z) & 2147483647u;
    _63[gl_LocalInvocationID.x] = ((((_175 > 2139095040u) || (_179 > 2139095040u)) || (_184 > 2139095040u)) || (((_175 == 2139095040u) || (_179 == 2139095040u)) || (_184 == 2139095040u))) ? 0.0 : (log2(spvNMax(dot(vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875), _166.xyz) * (1.0 / _7._m0[0u]), 9.9999997473787516355514526367188e-06)) + 3.0);
    barrier();
    if (((gl_LocalInvocationID.x == 0u) && (gl_LocalInvocationID.y == 0u)) && (gl_LocalInvocationID.z == 0u))
    {
        float _271 = (((((((((((((((((((((_63[0u] + _63[1u]) + _63[2u]) + _63[3u]) + _63[4u]) + _63[5u]) + _63[6u]) + _63[7u]) + _63[8u]) + _63[9u]) + _63[10u]) + _63[11u]) + _63[12u]) + _63[13u]) + _63[14u]) + _63[15u]) + _63[16u]) + _63[17u]) + _63[18u]) + _63[19u]) + _63[20u]) + _63[21u]) + _63[22u];
        float _340 = ((((((((((((((((((((((_271 + _63[23u]) + _63[24u]) + _63[25u]) + _63[26u]) + _63[27u]) + _63[28u]) + _63[29u]) + _63[30u]) + _63[31u]) + _63[32u]) + _63[33u]) + _63[34u]) + _63[35u]) + _63[36u]) + _63[37u]) + _63[38u]) + _63[39u]) + _63[40u]) + _63[41u]) + _63[42u]) + _63[43u]) + _63[44u]) + _63[45u];
        imageStore(_8, ivec2(gl_WorkGroupID.xy), vec4(((((((((((((((((((_340 + _63[46u]) + _63[47u]) + _63[48u]) + _63[49u]) + _63[50u]) + _63[51u]) + _63[52u]) + _63[53u]) + _63[54u]) + _63[55u]) + _63[56u]) + _63[57u]) + _63[58u]) + _63[59u]) + _63[60u]) + _63[61u]) + _63[62u]) + _63[63u]) * 0.015625));
    }
}

