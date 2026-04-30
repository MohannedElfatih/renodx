

[[vk::binding(30, 1)]]
cbuffer _16_12 : register(b30, space1)
{
    float _12_m0 : packoffset(c0);
    float _12_m1 : packoffset(c0.y);
    float _12_m2 : packoffset(c0.z);
    float _12_m3 : packoffset(c0.w);
    float _12_m4 : packoffset(c1);
    float _12_m5 : packoffset(c1.y);
    float _12_m6 : packoffset(c1.z);
    float _12_m7 : packoffset(c1.w);
    float4 _12_m8 : packoffset(c2);
    float4 _12_m9 : packoffset(c3);
    column_major float4x4 _12_m10[4] : packoffset(c4);
    float _12_m11 : packoffset(c20);
    float _12_m12 : packoffset(c20.y);
    float _12_m13 : packoffset(c20.z);
    uint _12_m14 : packoffset(c20.w);
    float2 _12_m15 : packoffset(c21);
    float2 _12_m16 : packoffset(c21.z);
    float3 _12_m17 : packoffset(c22);
    float _12_m18 : packoffset(c22.w);
    column_major float4x3 _12_m19 : packoffset(c23);
    float4 _12_m20[4] : packoffset(c26);
    float _12_m21 : packoffset(c30);
    float _12_m22 : packoffset(c30.y);
    float _12_m23 : packoffset(c30.z);
    float _12_m24 : packoffset(c30.w);
    uint _12_m25 : packoffset(c31);
    uint _12_m26 : packoffset(c31.y);
    float _12_m27 : packoffset(c31.z);
    float _12_m28 : packoffset(c31.w);
    float _12_m29 : packoffset(c32);
    float _12_m30 : packoffset(c32.y);
    float _12_m31 : packoffset(c32.z);
    float _12_m32 : packoffset(c32.w);
    float2 _12_m33 : packoffset(c33);
    float2 _12_m34 : packoffset(c33.z);
};

[[vk::binding(4, 0)]]
cbuffer _17_13 : register(b4, space0)
{
    float2 _13_m0 : packoffset(c0);
    float2 _13_m1 : packoffset(c0.z);
    uint2 _13_m2 : packoffset(c1);
    uint2 _13_m3 : packoffset(c1.z);
    uint2 _13_m4 : packoffset(c2);
    uint _13_m5 : packoffset(c2.z);
    uint _13_m6 : packoffset(c2.w);
    float2 _13_m7 : packoffset(c3);
    float2 _13_m8 : packoffset(c3.z);
    float2 _13_m9 : packoffset(c4);
    float2 _13_m10 : packoffset(c4.z);
    float2 _13_m11 : packoffset(c5);
    float2 _13_m12 : packoffset(c5.z);
    float2 _13_m13 : packoffset(c6);
    float2 _13_m14 : packoffset(c6.z);
    float2 _13_m15 : packoffset(c7);
    float2 _13_m16 : packoffset(c7.z);
    uint2 _13_m17 : packoffset(c8);
    uint2 _13_m18 : packoffset(c8.z);
    uint2 _13_m19 : packoffset(c9);
    uint2 _13_m20 : packoffset(c9.z);
    float2 _13_m21 : packoffset(c10);
    float2 _13_m22 : packoffset(c10.z);
};

[[vk::binding(0, 1)]]
Texture2D<float4> _6 : register(t0, space1);
[[vk::binding(1, 1)]]
Texture2D<float4> _7 : register(t1, space1);
[[vk::binding(2, 1)]]
Texture2D<float4> _8 : register(t2, space1);
[[vk::binding(3, 1)]]
Texture2D<float4> _9 : register(t3, space1);
[[vk::binding(21, 1)]]
Texture3D<float4> _10 : register(t21, space1);
[[vk::binding(23, 1)]]
SamplerState _11 : register(s23, space1);

static float4 gl_FragCoord = (float4)0;
static float2 _4 = (float2)0;
static float4 _5 = (float4)0;

struct SPIRV_Cross_Input
{
    float2 _4 : TEXCOORD0;
    float4 gl_FragCoord : SV_Position;
};

struct SPIRV_Cross_Output
{
    float4 _5 : SV_Target0;
};

void frag_main()
{
    int2 _85 = int3(int(gl_FragCoord.x), int(gl_FragCoord.y), 0).xy;
    float4 _87 = _6.Load(int3(_85, 0));
    float _88 = _87.x;
    float4 _92 = _8.Load(int3(_85, 0));
    float4 _104 = float4((_92.xyz + _9.Load(int3(_85, 0)).xyz) + _7.Load(int3(_85, 0)).xyz, _92.w);
    float4 _291;
    do
    {
        if (_12_m19[3].z < 0.0f)
        {
            _291 = float4(0.0f, 0.0f, 0.0f, 1.0f);
            break;
        }
        float _136;
        do
        {
            if (_88 <= _12_m19[0].x)
            {
                _136 = mad(_12_m19[2].x, _88, _12_m19[3].x);
                break;
            }
            else
            {
                _136 = _12_m19[1].y * log2(mad(_12_m19[2].y, _88, _12_m19[3].y));
                break;
            }
            break; // unreachable workaround
        } while(false);
        float3 _147 = (float3(_4 / float2(_12_m32, _12_m18), _136) + float3(float(_13_m5), 0.0f, 0.0f)) - 0.5f.xxx;
        float3 _148 = floor(_147);
        float3 _149 = _147 - _148;
        float3 _150 = 1.0f.xxx - _149;
        float3 _157 = mad(-((_149 * 0.5f) * _149), 2.0f.xxx - _149, 0.666666686534881591796875f.xxx);
        float3 _164 = (_149 * 0.16666667163372039794921875f) * _149;
        float3 _166 = mad((_150 * 0.16666667163372039794921875f) * _150, _150, _157);
        float3 _173 = _12_m17 * (((_157 / _166) - 0.5f.xxx) + _148);
        float3 _177 = _12_m17 * ((((_164 * _149) / mad(_164, _149, mad(-((_150 * 0.5f) * _150), _149 + 1.0f.xxx, 0.666666686534881591796875f.xxx))) + 1.5f.xxx) + _148);
        float _185 = _173.z;
        float _191 = _177.x;
        float2 _195 = max(_12_m15, min(_12_m16, float2(_191, _173.y)));
        float _196 = _195.x;
        float4 _202 = _166.x.xxxx;
        float _204 = _173.x;
        float2 _208 = max(_12_m15, min(_12_m16, float2(_204, _177.y)));
        float _209 = _208.x;
        float4 _224 = _166.y.xxxx;
        float _229 = _177.z;
        float4 _255 = lerp(lerp(lerp(_10.SampleLevel(_11, float3(max(_12_m15, min(_12_m16, _177.xy)), _229), 0.0f), _10.SampleLevel(_11, float3(_209, _208.y, _229), 0.0f), _202), lerp(_10.SampleLevel(_11, float3(_196, _195.y, _229), 0.0f), _10.SampleLevel(_11, float3(max(_12_m15, min(_12_m16, float2(_204, _173.y))), _229), 0.0f), _202), _224), lerp(lerp(_10.SampleLevel(_11, float3(max(_12_m15, min(_12_m16, float2(_191, _177.y))), _185), 0.0f), _10.SampleLevel(_11, float3(_209, _208.y, _185), 0.0f), _202), lerp(_10.SampleLevel(_11, float3(_196, _195.y, _185), 0.0f), _10.SampleLevel(_11, float3(max(_12_m15, min(_12_m16, _173.xy)), _185), 0.0f), _202), _224), _166.z.xxxx) * float4(0.03125f, 0.03125f, 0.03125f, 3.0517578125e-05f);
        float _256 = _255.x;
        float4 _263;
        if (isinf(_256) || isnan(_256))
        {
            float4 _262 = _255;
            _262.x = 0.0f;
            _263 = _262;
        }
        else
        {
            _263 = _255;
        }
        float4 _271;
        if (isinf(_263.y) || isnan(_263.y))
        {
            float4 _270 = _263;
            _270.y = 0.0f;
            _271 = _270;
        }
        else
        {
            _271 = _263;
        }
        float4 _279;
        if (isinf(_271.z) || isnan(_271.z))
        {
            float4 _278 = _271;
            _278.z = 0.0f;
            _279 = _278;
        }
        else
        {
            _279 = _271;
        }
        float4 _287;
        if (isinf(_279.w) || isnan(_279.w))
        {
            float4 _286 = _279;
            _286.w = 0.0f;
            _287 = _286;
        }
        else
        {
            _287 = _279;
        }
        float4 _290 = _287;
        _290.w = 1.0f - _287.w;
        _291 = _290;
        break;
    } while(false);
    float3 _296 = (_104.xyz * _291.w) + _291.xyz;
    _5 = float4(_296.x, _296.y, _296.z, _104.w);
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    gl_FragCoord = stage_input.gl_FragCoord;
    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
    _4 = stage_input._4;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output._5 = _5;
    return stage_output;
}

