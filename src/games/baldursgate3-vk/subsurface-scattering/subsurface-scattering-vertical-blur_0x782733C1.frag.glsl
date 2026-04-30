#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_samplerless_texture_functions : require
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

struct _16
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
};

layout(set = 2, binding = 15, std430) readonly buffer _18_6
{
    _16 _m0[];
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

layout(set = 1, binding = 0, std140) uniform _22_8
{
    vec4 _m0[16][25];
} _8;

layout(set = 1, binding = 1) uniform sampler _9;
layout(set = 1, binding = 2) uniform sampler _10;
layout(set = 1, binding = 3) uniform texture2D _11;
layout(set = 1, binding = 4) uniform texture2D _12;
layout(set = 1, binding = 5) uniform texture2D _13;
layout(set = 1, binding = 6) uniform texture2D _14;
layout(set = 1, binding = 7) uniform texture2D _15;

layout(location = 0) in vec2 _4;
layout(location = 0) out vec4 _5;

void main()
{
    ivec2 _94 = ivec3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy;
    vec4 _98 = texelFetch(_13, _94, 0);
    int _102 = clamp(int(_98.x * 255.0), 0, 15);
    float _108 = (_6._m0[uint(_102)]._m0.w * _98.y) * 0.001000000047497451305389404296875;
    vec4 _117 = textureLod(sampler2D(_11, _9), _4, 0.0);
    vec4 _120 = textureLod(sampler2D(_12, _9), _4, 0.0);
    float _121 = _120.x;
    vec2 _132 = (vec2(0.0, 1.0) * (_108 * (1.0 / (((2.0 * _121) * _7._m4) / _7._m1[1u].y)))) * 0.3333333432674407958984375;
    vec3 _136 = _117.xyz;
    vec2 _142 = _4 + (_132 * _8._m0[_102][1].w);
    vec4 _144 = textureGather(sampler2D(_15, _9), _142, 3);
    vec3 _189;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_144.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_144.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_144.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_144.w * 255.0)) & 7u) == 3u))
    {
        _189 = mix(textureLod(sampler2D(_11, _10), _142, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _142, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _189 = _136;
    }
    vec2 _198 = _4 + (_132 * _8._m0[_102][2].w);
    vec4 _200 = textureGather(sampler2D(_15, _9), _198, 3);
    vec3 _245;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_200.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_200.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_200.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_200.w * 255.0)) & 7u) == 3u))
    {
        _245 = mix(textureLod(sampler2D(_11, _10), _198, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _198, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _245 = _136;
    }
    vec2 _254 = _4 + (_132 * _8._m0[_102][3].w);
    vec4 _256 = textureGather(sampler2D(_15, _9), _254, 3);
    vec3 _301;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_256.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_256.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_256.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_256.w * 255.0)) & 7u) == 3u))
    {
        _301 = mix(textureLod(sampler2D(_11, _10), _254, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _254, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _301 = _136;
    }
    vec2 _310 = _4 + (_132 * _8._m0[_102][4].w);
    vec4 _312 = textureGather(sampler2D(_15, _9), _310, 3);
    vec3 _357;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_312.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_312.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_312.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_312.w * 255.0)) & 7u) == 3u))
    {
        _357 = mix(textureLod(sampler2D(_11, _10), _310, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _310, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _357 = _136;
    }
    vec2 _366 = _4 + (_132 * _8._m0[_102][5].w);
    vec4 _368 = textureGather(sampler2D(_15, _9), _366, 3);
    vec3 _413;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_368.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_368.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_368.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_368.w * 255.0)) & 7u) == 3u))
    {
        _413 = mix(textureLod(sampler2D(_11, _10), _366, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _366, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _413 = _136;
    }
    vec2 _422 = _4 + (_132 * _8._m0[_102][6].w);
    vec4 _424 = textureGather(sampler2D(_15, _9), _422, 3);
    vec3 _469;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_424.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_424.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_424.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_424.w * 255.0)) & 7u) == 3u))
    {
        _469 = mix(textureLod(sampler2D(_11, _10), _422, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _422, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _469 = _136;
    }
    vec2 _478 = _4 + (_132 * _8._m0[_102][7].w);
    vec4 _480 = textureGather(sampler2D(_15, _9), _478, 3);
    vec3 _525;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_480.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_480.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_480.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_480.w * 255.0)) & 7u) == 3u))
    {
        _525 = mix(textureLod(sampler2D(_11, _10), _478, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _478, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _525 = _136;
    }
    vec2 _534 = _4 + (_132 * _8._m0[_102][8].w);
    vec4 _536 = textureGather(sampler2D(_15, _9), _534, 3);
    vec3 _581;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_536.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_536.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_536.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_536.w * 255.0)) & 7u) == 3u))
    {
        _581 = mix(textureLod(sampler2D(_11, _10), _534, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _534, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _581 = _136;
    }
    vec2 _590 = _4 + (_132 * _8._m0[_102][9].w);
    vec4 _592 = textureGather(sampler2D(_15, _9), _590, 3);
    vec3 _637;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_592.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_592.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_592.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_592.w * 255.0)) & 7u) == 3u))
    {
        _637 = mix(textureLod(sampler2D(_11, _10), _590, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _590, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _637 = _136;
    }
    vec2 _646 = _4 + (_132 * _8._m0[_102][10].w);
    vec4 _648 = textureGather(sampler2D(_15, _9), _646, 3);
    vec3 _693;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_648.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_648.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_648.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_648.w * 255.0)) & 7u) == 3u))
    {
        _693 = mix(textureLod(sampler2D(_11, _10), _646, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _646, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _693 = _136;
    }
    vec2 _702 = _4 + (_132 * _8._m0[_102][11].w);
    vec4 _704 = textureGather(sampler2D(_15, _9), _702, 3);
    vec3 _749;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_704.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_704.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_704.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_704.w * 255.0)) & 7u) == 3u))
    {
        _749 = mix(textureLod(sampler2D(_11, _10), _702, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _702, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _749 = _136;
    }
    vec2 _758 = _4 + (_132 * _8._m0[_102][12].w);
    vec4 _760 = textureGather(sampler2D(_15, _9), _758, 3);
    vec3 _805;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_760.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_760.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_760.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_760.w * 255.0)) & 7u) == 3u))
    {
        _805 = mix(textureLod(sampler2D(_11, _10), _758, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _758, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _805 = _136;
    }
    vec2 _814 = _4 + (_132 * _8._m0[_102][13].w);
    vec4 _816 = textureGather(sampler2D(_15, _9), _814, 3);
    vec3 _861;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_816.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_816.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_816.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_816.w * 255.0)) & 7u) == 3u))
    {
        _861 = mix(textureLod(sampler2D(_11, _10), _814, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _814, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _861 = _136;
    }
    vec3 _864 = fma(_8._m0[_102][12].xyz, _805, fma(_8._m0[_102][11].xyz, _749, fma(_8._m0[_102][10].xyz, _693, fma(_8._m0[_102][9].xyz, _637, fma(_8._m0[_102][8].xyz, _581, fma(_8._m0[_102][7].xyz, _525, fma(_8._m0[_102][6].xyz, _469, fma(_8._m0[_102][5].xyz, _413, fma(_8._m0[_102][4].xyz, _357, fma(_8._m0[_102][3].xyz, _301, fma(_8._m0[_102][2].xyz, _245, fma(_8._m0[_102][1].xyz, _189, (_136 * _8._m0[_102][0].xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz;
    vec2 _870 = _4 + (_132 * _8._m0[_102][14].w);
    vec4 _872 = textureGather(sampler2D(_15, _9), _870, 3);
    vec3 _917;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_872.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_872.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_872.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_872.w * 255.0)) & 7u) == 3u))
    {
        _917 = mix(textureLod(sampler2D(_11, _10), _870, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _870, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _917 = _136;
    }
    vec2 _926 = _4 + (_132 * _8._m0[_102][15].w);
    vec4 _928 = textureGather(sampler2D(_15, _9), _926, 3);
    vec3 _973;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_928.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_928.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_928.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_928.w * 255.0)) & 7u) == 3u))
    {
        _973 = mix(textureLod(sampler2D(_11, _10), _926, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _926, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _973 = _136;
    }
    vec2 _982 = _4 + (_132 * _8._m0[_102][16].w);
    vec4 _984 = textureGather(sampler2D(_15, _9), _982, 3);
    vec3 _1029;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_984.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_984.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_984.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_984.w * 255.0)) & 7u) == 3u))
    {
        _1029 = mix(textureLod(sampler2D(_11, _10), _982, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _982, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1029 = _136;
    }
    vec2 _1038 = _4 + (_132 * _8._m0[_102][17].w);
    vec4 _1040 = textureGather(sampler2D(_15, _9), _1038, 3);
    vec3 _1085;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1040.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1040.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1040.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1040.w * 255.0)) & 7u) == 3u))
    {
        _1085 = mix(textureLod(sampler2D(_11, _10), _1038, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1038, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1085 = _136;
    }
    vec2 _1094 = _4 + (_132 * _8._m0[_102][18].w);
    vec4 _1096 = textureGather(sampler2D(_15, _9), _1094, 3);
    vec3 _1141;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1096.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1096.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1096.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1096.w * 255.0)) & 7u) == 3u))
    {
        _1141 = mix(textureLod(sampler2D(_11, _10), _1094, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1094, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1141 = _136;
    }
    vec2 _1150 = _4 + (_132 * _8._m0[_102][19].w);
    vec4 _1152 = textureGather(sampler2D(_15, _9), _1150, 3);
    vec3 _1197;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1152.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1152.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1152.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1152.w * 255.0)) & 7u) == 3u))
    {
        _1197 = mix(textureLod(sampler2D(_11, _10), _1150, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1150, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1197 = _136;
    }
    vec2 _1206 = _4 + (_132 * _8._m0[_102][20].w);
    vec4 _1208 = textureGather(sampler2D(_15, _9), _1206, 3);
    vec3 _1253;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1208.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1208.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1208.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1208.w * 255.0)) & 7u) == 3u))
    {
        _1253 = mix(textureLod(sampler2D(_11, _10), _1206, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1206, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1253 = _136;
    }
    vec2 _1262 = _4 + (_132 * _8._m0[_102][21].w);
    vec4 _1264 = textureGather(sampler2D(_15, _9), _1262, 3);
    vec3 _1309;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1264.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1264.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1264.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1264.w * 255.0)) & 7u) == 3u))
    {
        _1309 = mix(textureLod(sampler2D(_11, _10), _1262, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1262, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1309 = _136;
    }
    vec2 _1318 = _4 + (_132 * _8._m0[_102][22].w);
    vec4 _1320 = textureGather(sampler2D(_15, _9), _1318, 3);
    vec3 _1365;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1320.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1320.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1320.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1320.w * 255.0)) & 7u) == 3u))
    {
        _1365 = mix(textureLod(sampler2D(_11, _10), _1318, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1318, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1365 = _136;
    }
    vec2 _1374 = _4 + (_132 * _8._m0[_102][23].w);
    vec4 _1376 = textureGather(sampler2D(_15, _9), _1374, 3);
    vec3 _1421;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1376.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1376.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1376.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1376.w * 255.0)) & 7u) == 3u))
    {
        _1421 = mix(textureLod(sampler2D(_11, _10), _1374, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1374, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1421 = _136;
    }
    vec2 _1430 = _4 + (_132 * _8._m0[_102][24].w);
    vec4 _1432 = textureGather(sampler2D(_15, _9), _1430, 3);
    vec3 _1477;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1432.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1432.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1432.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1432.w * 255.0)) & 7u) == 3u))
    {
        _1477 = mix(textureLod(sampler2D(_11, _10), _1430, 0.0).xyz, _136, vec3(clamp((abs(_121 - textureLod(sampler2D(_12, _10), _1430, 0.0).x) * _7._m4) / _108, 0.0, 1.0)));
    }
    else
    {
        _1477 = _136;
    }
    vec3 _1481 = fma(_8._m0[_102][24].xyz, _1477, fma(_8._m0[_102][23].xyz, _1421, fma(_8._m0[_102][22].xyz, _1365, fma(_8._m0[_102][21].xyz, _1309, fma(_8._m0[_102][20].xyz, _1253, fma(_8._m0[_102][19].xyz, _1197, fma(_8._m0[_102][18].xyz, _1141, fma(_8._m0[_102][17].xyz, _1085, fma(_8._m0[_102][16].xyz, _1029, fma(_8._m0[_102][15].xyz, _973, fma(_8._m0[_102][14].xyz, _917, fma(_8._m0[_102][13].xyz, _861, _864).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz);
    _5 = vec4(texelFetch(_14, _94, 0).xyz, 1.0) * vec4(_1481.x, _1481.y, _1481.z, _117.w);
}

