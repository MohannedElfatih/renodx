

[[vk::binding(0, 1)]]
cbuffer _8_7 : register(b0, space1)
{
    float _7_m0 : packoffset(c0);
    float _7_m1 : packoffset(c0.y);
    float _7_m2 : packoffset(c0.z);
    float _7_m3 : packoffset(c0.w);
};

[[vk::binding(1, 1)]]
Texture2D<float4> _5 : register(t1, space1);
[[vk::binding(3, 1)]]
SamplerState _6 : register(s3, space1);

static float2 _3 = (float2)0;
static float4 _4 = (float4)0;

struct SPIRV_Cross_Input
{
    float2 _3 : TEXCOORD0;
};

struct SPIRV_Cross_Output
{
    float4 _4 : SV_Target0;
};

void frag_main()
{
    float3 _38 = _5.SampleLevel(_6, _3, 0.0f).xyz;
    bool3 _39 = bool3(_38.x == 0.0f.xxx.x, _38.y == 0.0f.xxx.y, _38.z == 0.0f.xxx.z);
    float3 _44 = pow(max(_38, 0.0f.xxx), _7_m1.xxx); // The original code had a clamp here
    _4 = float4(float3(_39.x ? 0.0f.xxx.x : _44.x, _39.y ? 0.0f.xxx.y : _44.y, _39.z ? 0.0f.xxx.z : _44.z), 1.0f);
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    _3 = stage_input._3;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output._4 = _4;
    return stage_output;
}

