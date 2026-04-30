#version 450
#extension GL_EXT_nonuniform_qualifier : require
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
#extension GL_EXT_samplerless_texture_functions : require
layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

layout(set = 1, binding = 42, std140) uniform _13_6
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
} _6;

layout(set = 0, binding = 4, std140) uniform _14_7
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

layout(set = 1, binding = 2, std140) uniform _15_10
{
    vec2 _m0;
    vec2 _m1;
} _10;

layout(set = 1, binding = 35) uniform sampler _5;
layout(set = 1, binding = 0) uniform texture2D _8;
layout(set = 1, binding = 1, r32f) uniform writeonly image2D _9;

shared float _75[64];

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    ivec2 _97 = ivec2(uvec2(ivec2(gl_WorkGroupID.xy * uvec2(18u))) + ((_7._m3 / uvec2(9u)) * uvec2(9u)));
    uint _98 = gl_LocalInvocationIndex / 16u;
    ivec2 _111 = ivec2(int(uint(_97.x) + ((_98 % 2u) * 9u)), int(uint(_97.y) + ((_98 / 2u) * 9u)));
    uvec2 _112 = uvec2(_111);
    uvec2 _113 = _112 / uvec2(9u);
    uint _116 = gl_LocalInvocationIndex % 16u;
    ivec2 _123 = ivec2(int((_116 % 4u) * 2u), int((_116 / 4u) * 2u));
    float _178;
    SPIRV_CROSS_BRANCH
    if (all(greaterThan(_7._m2, uvec2(1u))))
    {
        vec4 _171 = textureGather(sampler2D(_8, _5), vec2(max((_7._m3 + uvec2(1u)), min(_7._m4, (uvec2(_111 + _123) + uvec2(1u))))) * _10._m0);
        vec2 _174 = spvNMax(_171.xy, _171.zw);
        _178 = spvNMax(_174.x, _174.y);
    }
    else
    {
        uvec2 _132 = uvec2(_111 + _123);
        _178 = spvNMax(spvNMax(spvNMax(spvNMax(0.0, texelFetch(_8, ivec2(max(_7._m3, min(_7._m4, (_132 + uvec2(4u, 10u))))), int(0u)).x), texelFetch(_8, ivec2(max(_7._m3, min(_7._m4, (_132 + uvec2(4u, 11u))))), int(0u)).x), texelFetch(_8, ivec2(max(_7._m3, min(_7._m4, (_132 + uvec2(5u, 10u))))), int(0u)).x), texelFetch(_8, ivec2(max(_7._m3, min(_7._m4, (_132 + uvec2(5u, 11u))))), int(0u)).x);
    }
    float _194;
    if (_116 <= 8u)
    {
        uvec2 _183 = _112 + uvec2(8u, _116);
        _194 = spvNMax(_178, texelFetch(_8, ivec3(int(_183.x), int(_183.y), 0).xy, 0).x);
    }
    else
    {
        _194 = _178;
    }
    float _211;
    if (_116 >= 8u)
    {
        uvec2 _200 = _112 + uvec2(_116 - 8u, 8u);
        _211 = spvNMax(_194, texelFetch(_8, ivec3(int(_200.x), int(_200.y), 0).xy, 0).x);
    }
    else
    {
        _211 = _194;
    }
    _75[gl_LocalInvocationIndex] = _211;
    barrier();
    float _231;
    if (_116 < 4u)
    {
        float _218 = _75[gl_LocalInvocationIndex + 4u];
        float _222 = _75[gl_LocalInvocationIndex + 8u];
        float _225 = _75[gl_LocalInvocationIndex + 12u];
        vec2 _227 = spvNMax(vec2(_211, _218), vec2(_222, _225));
        float _230 = spvNMax(_227.x, _227.y);
        _75[gl_LocalInvocationIndex] = _230;
        _231 = _230;
    }
    else
    {
        _231 = _211;
    }
    barrier();
    if ((_116 == 0u) && all(lessThanEqual(_113, (_7._m4 / uvec2(9u)))))
    {
        vec2 _247 = spvNMax(vec2(_231, _75[gl_LocalInvocationIndex + 1u]), vec2(_75[gl_LocalInvocationIndex + 2u], _75[gl_LocalInvocationIndex + 3u]));
        float _250 = spvNMax(_247.x, _247.y);
        float _269;
        do
        {
            if (_250 <= _6._m19[0].x)
            {
                _269 = fma(_6._m19[2].x, _250, _6._m19[3].x);
                break;
            }
            else
            {
                _269 = _6._m19[1].y * log2(fma(_6._m19[2].y, _250, _6._m19[3].y));
                break;
            }
            break; // unreachable workaround
        } while(false);
        imageStore(_9, ivec2(_113 + uvec2(_7._m5, 0u)), vec4(_269 * 0.0039215688593685626983642578125));
    }
}

