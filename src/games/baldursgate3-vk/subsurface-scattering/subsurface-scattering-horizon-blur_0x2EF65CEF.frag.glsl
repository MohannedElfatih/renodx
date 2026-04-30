#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_demote_to_helper_invocation : require
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

struct _15
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
};

layout(set = 2, binding = 15, std430) readonly buffer _17_6
{
    _15 _m0[];
} _6;

layout(set = 0, binding = 2, std140) uniform _18_7
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

layout(set = 1, binding = 0, std140) uniform _21_8
{
    vec4 _m0[16][25];
} _8;

layout(set = 1, binding = 1) uniform sampler _9;
layout(set = 1, binding = 2) uniform sampler _10;
layout(set = 1, binding = 3) uniform texture2D _11;
layout(set = 1, binding = 4) uniform texture2D _12;
layout(set = 1, binding = 5) uniform texture2D _13;
layout(set = 1, binding = 6) uniform texture2D _14;

layout(location = 0) in vec2 _4;
layout(location = 0) out vec4 _5;

void main()
{
    ivec2 _93 = ivec3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy;
    if ((uint(roundEven(texelFetch(_14, _93, 0).w * 255.0)) & 7u) != 3u)
    {
        demote;
    }
    vec4 _105 = texelFetch(_13, _93, 0);
    int _109 = clamp(int(_105.x * 255.0), 0, 15);
    float _115 = (_6._m0[uint(_109)]._m0.w * _105.y) * 0.001000000047497451305389404296875;
    vec4 _119 = textureLod(sampler2D(_11, _9), _4, 0.0);
    vec4 _122 = textureLod(sampler2D(_12, _9), _4, 0.0);
    float _123 = _122.x;
    vec2 _134 = (vec2(1.0, 0.0) * (_115 * (1.0 / (((2.0 * _123) * _7._m4) / _7._m1[0u].x)))) * 0.3333333432674407958984375;
    vec3 _138 = _119.xyz;
    vec2 _144 = _4 + (_134 * _8._m0[_109][1].w);
    vec4 _146 = textureGather(sampler2D(_14, _9), _144, 3);
    vec3 _191;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_146.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_146.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_146.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_146.w * 255.0)) & 7u) == 3u))
    {
        _191 = mix(textureLod(sampler2D(_11, _10), _144, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _144, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _191 = _138;
    }
    vec2 _200 = _4 + (_134 * _8._m0[_109][2].w);
    vec4 _202 = textureGather(sampler2D(_14, _9), _200, 3);
    vec3 _247;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_202.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_202.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_202.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_202.w * 255.0)) & 7u) == 3u))
    {
        _247 = mix(textureLod(sampler2D(_11, _10), _200, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _200, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _247 = _138;
    }
    vec2 _256 = _4 + (_134 * _8._m0[_109][3].w);
    vec4 _258 = textureGather(sampler2D(_14, _9), _256, 3);
    vec3 _303;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_258.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_258.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_258.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_258.w * 255.0)) & 7u) == 3u))
    {
        _303 = mix(textureLod(sampler2D(_11, _10), _256, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _256, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _303 = _138;
    }
    vec2 _312 = _4 + (_134 * _8._m0[_109][4].w);
    vec4 _314 = textureGather(sampler2D(_14, _9), _312, 3);
    vec3 _359;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_314.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_314.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_314.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_314.w * 255.0)) & 7u) == 3u))
    {
        _359 = mix(textureLod(sampler2D(_11, _10), _312, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _312, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _359 = _138;
    }
    vec2 _368 = _4 + (_134 * _8._m0[_109][5].w);
    vec4 _370 = textureGather(sampler2D(_14, _9), _368, 3);
    vec3 _415;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_370.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_370.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_370.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_370.w * 255.0)) & 7u) == 3u))
    {
        _415 = mix(textureLod(sampler2D(_11, _10), _368, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _368, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _415 = _138;
    }
    vec2 _424 = _4 + (_134 * _8._m0[_109][6].w);
    vec4 _426 = textureGather(sampler2D(_14, _9), _424, 3);
    vec3 _471;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_426.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_426.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_426.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_426.w * 255.0)) & 7u) == 3u))
    {
        _471 = mix(textureLod(sampler2D(_11, _10), _424, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _424, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _471 = _138;
    }
    vec2 _480 = _4 + (_134 * _8._m0[_109][7].w);
    vec4 _482 = textureGather(sampler2D(_14, _9), _480, 3);
    vec3 _527;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_482.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_482.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_482.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_482.w * 255.0)) & 7u) == 3u))
    {
        _527 = mix(textureLod(sampler2D(_11, _10), _480, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _480, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _527 = _138;
    }
    vec2 _536 = _4 + (_134 * _8._m0[_109][8].w);
    vec4 _538 = textureGather(sampler2D(_14, _9), _536, 3);
    vec3 _583;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_538.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_538.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_538.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_538.w * 255.0)) & 7u) == 3u))
    {
        _583 = mix(textureLod(sampler2D(_11, _10), _536, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _536, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _583 = _138;
    }
    vec2 _592 = _4 + (_134 * _8._m0[_109][9].w);
    vec4 _594 = textureGather(sampler2D(_14, _9), _592, 3);
    vec3 _639;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_594.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_594.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_594.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_594.w * 255.0)) & 7u) == 3u))
    {
        _639 = mix(textureLod(sampler2D(_11, _10), _592, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _592, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _639 = _138;
    }
    vec2 _648 = _4 + (_134 * _8._m0[_109][10].w);
    vec4 _650 = textureGather(sampler2D(_14, _9), _648, 3);
    vec3 _695;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_650.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_650.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_650.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_650.w * 255.0)) & 7u) == 3u))
    {
        _695 = mix(textureLod(sampler2D(_11, _10), _648, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _648, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _695 = _138;
    }
    vec2 _704 = _4 + (_134 * _8._m0[_109][11].w);
    vec4 _706 = textureGather(sampler2D(_14, _9), _704, 3);
    vec3 _751;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_706.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_706.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_706.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_706.w * 255.0)) & 7u) == 3u))
    {
        _751 = mix(textureLod(sampler2D(_11, _10), _704, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _704, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _751 = _138;
    }
    vec2 _760 = _4 + (_134 * _8._m0[_109][12].w);
    vec4 _762 = textureGather(sampler2D(_14, _9), _760, 3);
    vec3 _807;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_762.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_762.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_762.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_762.w * 255.0)) & 7u) == 3u))
    {
        _807 = mix(textureLod(sampler2D(_11, _10), _760, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _760, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _807 = _138;
    }
    vec2 _816 = _4 + (_134 * _8._m0[_109][13].w);
    vec4 _818 = textureGather(sampler2D(_14, _9), _816, 3);
    vec3 _863;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_818.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_818.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_818.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_818.w * 255.0)) & 7u) == 3u))
    {
        _863 = mix(textureLod(sampler2D(_11, _10), _816, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _816, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _863 = _138;
    }
    vec3 _866 = fma(_8._m0[_109][12].xyz, _807, fma(_8._m0[_109][11].xyz, _751, fma(_8._m0[_109][10].xyz, _695, fma(_8._m0[_109][9].xyz, _639, fma(_8._m0[_109][8].xyz, _583, fma(_8._m0[_109][7].xyz, _527, fma(_8._m0[_109][6].xyz, _471, fma(_8._m0[_109][5].xyz, _415, fma(_8._m0[_109][4].xyz, _359, fma(_8._m0[_109][3].xyz, _303, fma(_8._m0[_109][2].xyz, _247, fma(_8._m0[_109][1].xyz, _191, (_138 * _8._m0[_109][0].xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz;
    vec2 _872 = _4 + (_134 * _8._m0[_109][14].w);
    vec4 _874 = textureGather(sampler2D(_14, _9), _872, 3);
    vec3 _919;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_874.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_874.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_874.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_874.w * 255.0)) & 7u) == 3u))
    {
        _919 = mix(textureLod(sampler2D(_11, _10), _872, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _872, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _919 = _138;
    }
    vec2 _928 = _4 + (_134 * _8._m0[_109][15].w);
    vec4 _930 = textureGather(sampler2D(_14, _9), _928, 3);
    vec3 _975;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_930.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_930.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_930.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_930.w * 255.0)) & 7u) == 3u))
    {
        _975 = mix(textureLod(sampler2D(_11, _10), _928, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _928, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _975 = _138;
    }
    vec2 _984 = _4 + (_134 * _8._m0[_109][16].w);
    vec4 _986 = textureGather(sampler2D(_14, _9), _984, 3);
    vec3 _1031;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_986.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_986.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_986.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_986.w * 255.0)) & 7u) == 3u))
    {
        _1031 = mix(textureLod(sampler2D(_11, _10), _984, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _984, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1031 = _138;
    }
    vec2 _1040 = _4 + (_134 * _8._m0[_109][17].w);
    vec4 _1042 = textureGather(sampler2D(_14, _9), _1040, 3);
    vec3 _1087;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1042.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1042.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1042.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1042.w * 255.0)) & 7u) == 3u))
    {
        _1087 = mix(textureLod(sampler2D(_11, _10), _1040, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1040, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1087 = _138;
    }
    vec2 _1096 = _4 + (_134 * _8._m0[_109][18].w);
    vec4 _1098 = textureGather(sampler2D(_14, _9), _1096, 3);
    vec3 _1143;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1098.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1098.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1098.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1098.w * 255.0)) & 7u) == 3u))
    {
        _1143 = mix(textureLod(sampler2D(_11, _10), _1096, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1096, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1143 = _138;
    }
    vec2 _1152 = _4 + (_134 * _8._m0[_109][19].w);
    vec4 _1154 = textureGather(sampler2D(_14, _9), _1152, 3);
    vec3 _1199;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1154.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1154.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1154.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1154.w * 255.0)) & 7u) == 3u))
    {
        _1199 = mix(textureLod(sampler2D(_11, _10), _1152, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1152, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1199 = _138;
    }
    vec2 _1208 = _4 + (_134 * _8._m0[_109][20].w);
    vec4 _1210 = textureGather(sampler2D(_14, _9), _1208, 3);
    vec3 _1255;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1210.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1210.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1210.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1210.w * 255.0)) & 7u) == 3u))
    {
        _1255 = mix(textureLod(sampler2D(_11, _10), _1208, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1208, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1255 = _138;
    }
    vec2 _1264 = _4 + (_134 * _8._m0[_109][21].w);
    vec4 _1266 = textureGather(sampler2D(_14, _9), _1264, 3);
    vec3 _1311;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1266.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1266.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1266.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1266.w * 255.0)) & 7u) == 3u))
    {
        _1311 = mix(textureLod(sampler2D(_11, _10), _1264, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1264, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1311 = _138;
    }
    vec2 _1320 = _4 + (_134 * _8._m0[_109][22].w);
    vec4 _1322 = textureGather(sampler2D(_14, _9), _1320, 3);
    vec3 _1367;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1322.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1322.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1322.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1322.w * 255.0)) & 7u) == 3u))
    {
        _1367 = mix(textureLod(sampler2D(_11, _10), _1320, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1320, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1367 = _138;
    }
    vec2 _1376 = _4 + (_134 * _8._m0[_109][23].w);
    vec4 _1378 = textureGather(sampler2D(_14, _9), _1376, 3);
    vec3 _1423;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1378.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1378.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1378.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1378.w * 255.0)) & 7u) == 3u))
    {
        _1423 = mix(textureLod(sampler2D(_11, _10), _1376, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1376, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1423 = _138;
    }
    vec2 _1432 = _4 + (_134 * _8._m0[_109][24].w);
    vec4 _1434 = textureGather(sampler2D(_14, _9), _1432, 3);
    vec3 _1479;
    SPIRV_CROSS_BRANCH
    if (((((uint(roundEven(_1434.x * 255.0)) & 7u) == 3u) && ((uint(roundEven(_1434.y * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1434.z * 255.0)) & 7u) == 3u)) && ((uint(roundEven(_1434.w * 255.0)) & 7u) == 3u))
    {
        _1479 = mix(textureLod(sampler2D(_11, _10), _1432, 0.0).xyz, _138, vec3(clamp((abs(_123 - textureLod(sampler2D(_12, _10), _1432, 0.0).x) * _7._m4) / _115, 0.0, 1.0)));
    }
    else
    {
        _1479 = _138;
    }
    vec3 _1483 = fma(_8._m0[_109][24].xyz, _1479, fma(_8._m0[_109][23].xyz, _1423, fma(_8._m0[_109][22].xyz, _1367, fma(_8._m0[_109][21].xyz, _1311, fma(_8._m0[_109][20].xyz, _1255, fma(_8._m0[_109][19].xyz, _1199, fma(_8._m0[_109][18].xyz, _1143, fma(_8._m0[_109][17].xyz, _1087, fma(_8._m0[_109][16].xyz, _1031, fma(_8._m0[_109][15].xyz, _975, fma(_8._m0[_109][14].xyz, _919, fma(_8._m0[_109][13].xyz, _863, _866).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz).xyz);
    _5 = vec4(_1483.x, _1483.y, _1483.z, _119.w);
}

