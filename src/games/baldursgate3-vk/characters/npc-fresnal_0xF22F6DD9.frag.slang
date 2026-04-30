

struct _20
{
    column_major float4x4 _m0[2];
};

[[vk::binding(12, 0)]]
ByteAddressBuffer _12 : register(t12, space0);
[[vk::binding(0, 1)]]
cbuffer _24_13 : register(b0, space1)
{
    column_major float4x4 _13_m0 : packoffset(c0);
    float4 _13_m1[2] : packoffset(c4);
    uint _13_m2 : packoffset(c6);
    uint _13_m3 : packoffset(c6.y);
    uint _13_m4 : packoffset(c6.z);
    uint _13_m5 : packoffset(c6.w);
};

[[vk::binding(1, 1)]]
cbuffer _25_14 : register(b1, space1)
{
    float3 _14_m0 : packoffset(c0);
    float _14_m1 : packoffset(c0.w);
};

[[vk::binding(7, 0)]]
SamplerState _11 : register(s7, space0);
[[vk::binding(2, 1)]]
SamplerState _15 : register(s2, space1);
[[vk::binding(3, 1)]]
Texture2D<float4> _16 : register(t3, space1);
[[vk::binding(4, 1)]]
Texture2D<float4> _17 : register(t4, space1);
[[vk::binding(5, 1)]]
Texture2DArray<float4> _18 : register(t5, space1);

static float2 _3 = (float2)0;
static float4 _4 = (float4)0;
static float3 _5 = (float3)0;
static float3 _6 = (float3)0;
static float3 _7 = (float3)0;
static float3 _8 = (float3)0;
static float3 _9 = (float3)0;
static float4 _10 = (float4)0;

struct SPIRV_Cross_Input
{
    float2 _3 : TEXCOORD0;
    float4 _4 : TEXCOORD1;
    float3 _5 : TEXCOORD2;
    float3 _6 : TEXCOORD3;
    float3 _7 : TEXCOORD4;
    float3 _8 : TEXCOORD5;
    float3 _9 : TEXCOORD6;
};

struct SPIRV_Cross_Output
{
    float4 _10 : SV_Target0;
};

void frag_main()
{
    float4 _96 = _16.Sample(_11, _3);
    float3 _99 = (_96.wzy * 2.0f) - 1.0f.xxx;
    float4 _100 = float4(_99.x, _99.y, _99.z, _96.x);
    _100.z = -_99.z;
    _20 _117;
    [unroll]
    for (int _2ident = 0; _2ident < 2; _2ident++)
    {
        _117._m0[_2ident] = float4x4(asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 0)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 16)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 32)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 48)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 4)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 20)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 36)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 52)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 8)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 24)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 40)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 56)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 12)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 28)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 44)), asfloat(_12.Load(_2ident * 64 + _13_m3 * 128 + 60)));
    }
    float2 _123 = _13_m1[0].zw * ddx(_3);
    float2 _125 = _13_m1[0].zw * ddy(_3);
    float2 _128 = mad(frac(_3), _13_m1[0].zw, _13_m1[0].xy);
    float2 _131 = float2(_117._m0[0][2].x, _117._m0[0][3].x);
    float2 _132 = _123 * _131;
    float2 _133 = _125 * _131;
    float _134 = dot(_132, _132);
    float _135 = dot(_133, _133);
    float _138 = log2(max(_134, _135));
    float _151 = floor(min(max(mad(0.5f, _138, -min(mad(0.5f, _138, log2(min(_134, _135)) * (-0.5f)), _117._m0[0][1].x)) - 0.5f, 0.0f), _13_m1[1].x) + 0.5f);
    float2 _161 = floor((_128 * float2(_117._m0[0][0].w, _117._m0[0][0].w * _117._m0[0][1].w)) * pow(max(abs(0.5f), 9.9999997473787516355514526367188e-05f), _151));
    int _162 = int(_151);
    uint _171 = asuint(_17.Load(int3(int3(int(_161.x), int(_161.y), _162).xy, _162)).y);
    float _182 = pow(max(abs(2.0f), 9.9999997473787516355514526367188e-05f), float(_171 & 15u));
    float2 _184 = float2(_182, _182 * _117._m0[0][1].w);
    float2 _189 = float2(_117._m0[0][0].z, _117._m0[0][1].z);
    float2 _196 = float2(_117._m0[1][0].y, _117._m0[1][1].y);
    float2 _208 = ((_184 * _189) * _196) * _117._m0[0][0].y;
    float4 _212 = _18.SampleGrad(_15, float3(mad(mad(frac(_128 * _184), _189, float2(float((_171 >> 14u) & 1023u), float((_171 >> 4u) & 1023u))), _196, float2(_117._m0[1][2].y, _117._m0[1][3].y)), float((_171 >> 24u) & 127u)), _123 * _208, _125 * _208);
    bool4 _215 = (_117._m0[0][2].w != 2202.0f).xxxx;
    float4 _216 = float4(_215.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _212.x, _215.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _212.y, _215.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _212.z, _215.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _212.w);
    float3 _219 = (_216.wzy * 2.0f) - 1.0f.xxx;
    float4 _220 = float4(_219.x, _219.y, _219.z, _216.x);
    _220.z = -_219.z;
    _10 = float4(0.0f, 0.0f, 0.0f, 0.0f); // zeroed out NPC fresnal glow
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    _3 = stage_input._3;
    _4 = stage_input._4;
    _5 = stage_input._5;
    _6 = stage_input._6;
    _7 = stage_input._7;
    _8 = stage_input._8;
    _9 = stage_input._9;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output._10 = _10;
    return stage_output;
}
