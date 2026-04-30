

struct _41
{
    column_major float4x4 _m0;
    column_major float4x4 _m1;
    float3 _m2;
    float _m3;
    float3 _m4;
    float _m5;
};

struct _44
{
    float4 _m0;
    column_major float4x3 _m1;
    float _m2;
    uint _m3;
    float _m4;
    float _m5;
    column_major float4x3 _m6;
    float3 _m7;
    float _m8;
};

[[vk::binding(10, 1)]]
cbuffer _25_5 : register(b10, space1)
{
    column_major float4x4 _5_m0 : packoffset(c0);
    float2 _5_m1 : packoffset(c4);
    float2 _5_m2 : packoffset(c4.z);
    column_major float4x3 _5_m3 : packoffset(c5);
    float2 _5_m4 : packoffset(c8);
    float2 _5_m5 : packoffset(c8.z);
    float3 _5_m6 : packoffset(c9);
    float _5_m7 : packoffset(c9.w);
    float2 _5_m8 : packoffset(c10);
    float2 _5_m9 : packoffset(c10.z);
    float2 _5_m10 : packoffset(c11);
    float2 _5_m11 : packoffset(c11.z);
};

[[vk::binding(11, 1)]]
ByteAddressBuffer _6 : register(t11, space1);
[[vk::binding(26, 1)]]
ByteAddressBuffer _9 : register(t26, space1);
[[vk::binding(27, 1)]]
ByteAddressBuffer _10 : register(t27, space1);
[[vk::binding(42, 1)]]
cbuffer _34_12 : register(b42, space1)
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

[[vk::binding(0, 0)]]
cbuffer _35_13 : register(b0, space0)
{
    float _13_m0 : packoffset(c0);
    float _13_m1 : packoffset(c0.y);
    float _13_m2 : packoffset(c0.z);
    float _13_m3 : packoffset(c0.w);
    float _13_m4 : packoffset(c1);
    float _13_m5 : packoffset(c1.y);
    int _13_m6 : packoffset(c1.z);
    float _13_m7 : packoffset(c1.w);
};

[[vk::binding(1, 0)]]
cbuffer _37_14 : register(b1, space0)
{
    float3 _14_m0 : packoffset(c0);
    float _14_m1 : packoffset(c0.w);
    float3 _14_m2 : packoffset(c1);
    float _14_m3 : packoffset(c1.w);
    float3 _14_m4 : packoffset(c2);
    float _14_m5 : packoffset(c2.w);
    column_major float4x4 _14_m6 : packoffset(c3);
    float4 _14_m7[3] : packoffset(c7);
    float4 _14_m8 : packoffset(c10);
    float4 _14_m9 : packoffset(c11);
    float _14_m10 : packoffset(c12);
    float _14_m11 : packoffset(c12.y);
    float _14_m12 : packoffset(c12.z);
    float _14_m13 : packoffset(c12.w);
    float _14_m14 : packoffset(c13);
    float _14_m15 : packoffset(c13.y);
    float _14_m16 : packoffset(c13.z);
    float _14_m17 : packoffset(c13.w);
    float4 _14_m18 : packoffset(c14);
    float _14_m19 : packoffset(c15);
    float _14_m20 : packoffset(c15.y);
    float _14_m21 : packoffset(c15.z);
    float _14_m22 : packoffset(c15.w);
    float4 _14_m23 : packoffset(c16);
    float3 _14_m24 : packoffset(c17);
    float _14_m25 : packoffset(c17.w);
    float3 _14_m26 : packoffset(c18);
    float _14_m27 : packoffset(c18.w);
    float4 _14_m28 : packoffset(c19);
    float3 _14_m29 : packoffset(c20);
    float _14_m30 : packoffset(c20.w);
    float4 _14_m31 : packoffset(c21);
    float3 _14_m32 : packoffset(c22);
    float _14_m33 : packoffset(c22.w);
    float3 _14_m34 : packoffset(c23);
    float _14_m35 : packoffset(c23.w);
    float3 _14_m36 : packoffset(c24);
    float _14_m37 : packoffset(c24.w);
};

[[vk::binding(2, 0)]]
cbuffer _38_15 : register(b2, space0)
{
    column_major float4x4 _15_m0 : packoffset(c0);
    column_major float4x4 _15_m1 : packoffset(c4);
    column_major float4x4 _15_m2 : packoffset(c8);
    float _15_m3 : packoffset(c12);
    float _15_m4 : packoffset(c12.y);
    float2 _15_m5 : packoffset(c12.z);
    float3 _15_m6 : packoffset(c13);
    int _15_m7 : packoffset(c13.w);
};

[[vk::binding(4, 0)]]
cbuffer _39_16 : register(b4, space0)
{
    float2 _16_m0 : packoffset(c0);
    float2 _16_m1 : packoffset(c0.z);
    uint2 _16_m2 : packoffset(c1);
    uint2 _16_m3 : packoffset(c1.z);
    uint2 _16_m4 : packoffset(c2);
    uint _16_m5 : packoffset(c2.z);
    uint _16_m6 : packoffset(c2.w);
    float2 _16_m7 : packoffset(c3);
    float2 _16_m8 : packoffset(c3.z);
    float2 _16_m9 : packoffset(c4);
    float2 _16_m10 : packoffset(c4.z);
    float2 _16_m11 : packoffset(c5);
    float2 _16_m12 : packoffset(c5.z);
    float2 _16_m13 : packoffset(c6);
    float2 _16_m14 : packoffset(c6.z);
    float2 _16_m15 : packoffset(c7);
    float2 _16_m16 : packoffset(c7.z);
    uint2 _16_m17 : packoffset(c8);
    uint2 _16_m18 : packoffset(c8.z);
    uint2 _16_m19 : packoffset(c9);
    uint2 _16_m20 : packoffset(c9.z);
    float2 _16_m21 : packoffset(c10);
    float2 _16_m22 : packoffset(c10.z);
};

[[vk::binding(7, 1)]]
cbuffer _40_22 : register(b7, space1)
{
    float4 _22_m0 : packoffset(c0);
    uint4 _22_m1 : packoffset(c1);
    uint _22_m2 : packoffset(c2);
    uint3 _22_m3 : packoffset(c2.y);
};

[[vk::binding(8, 1)]]
ByteAddressBuffer _23 : register(t8, space1);
[[vk::binding(9, 1)]]
ByteAddressBuffer _24 : register(t9, space1);
[[vk::binding(12, 1)]]
Texture2D<float4> _7 : register(t12, space1);
[[vk::binding(13, 1)]]
Texture2D<float4> _8 : register(t13, space1);
[[vk::binding(35, 1)]]
SamplerState _11 : register(s35, space1);
[[vk::binding(0, 1)]]
RWTexture3D<float4> _17 : register(u0, space1);
[[vk::binding(1, 1)]]
Texture3D<float4> _18 : register(t1, space1);
[[vk::binding(2, 1)]]
Texture3D<float4> _19 : register(t2, space1);
[[vk::binding(3, 1)]]
Texture2D<float4> _20 : register(t3, space1);
[[vk::binding(4, 1)]]
SamplerState _21 : register(s4, space1);

static uint3 gl_WorkGroupID = (uint3)0;
static uint3 gl_GlobalInvocationID = (uint3)0;
struct SPIRV_Cross_Input
{
    uint3 gl_WorkGroupID : SV_GroupID;
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

void comp_main()
{
    do
    {
        uint2 _189 = _22_m2.xx;
        uint2 _193 = _16_m4 / _189;
        uint2 _195 = gl_GlobalInvocationID.xy + (_16_m3 / _189);
        uint3 _196 = uint3(_195.x, _195.y, gl_GlobalInvocationID.z);
        uint2 _197 = _195.xy;
        if (any(bool2(_197.x > _193.x, _197.y > _193.y)))
        {
            break;
        }
        if (gl_GlobalInvocationID.z > uint(mad(_7.Load(int3(_197 + uint2(_16_m5, 0u), 0u)).x, 255.0f, 0.5f)))
        {
            break;
        }
        float _220;
        float _215 = float(gl_GlobalInvocationID.z);
        float _236;
        do
        {
            _220 = _12_m19[1].x;
            if (_215 <= _220)
            {
                _236 = _12_m19[0].y * (_215 - _12_m19[3].x);
                break;
            }
            else
            {
                _236 = _12_m19[1].z * (exp2(_12_m19[0].z * _215) - _12_m19[3].y);
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _237 = _215 + 1.0f;
        float _255;
        do
        {
            if (_237 <= _220)
            {
                _255 = _12_m19[0].y * (_237 - _12_m19[3].x);
                break;
            }
            else
            {
                _255 = _12_m19[1].z * (exp2(_12_m19[0].z * _237) - _12_m19[3].y);
                break;
            }
            break; // unreachable workaround
        } while(false);
        float3 _257 = float3(_196);
        uint _415;
        float3 _416;
        bool _417;
        if (_13_m1 > 0.5f)
        {
            _415 = 16u;
            _416 = 0.0f.xxx;
            _417 = false;
        }
        else
        {
            float2 _278 = (clamp((_257 + 0.5f.xxx).xy * float2(_12_m32, _12_m18), 0.0f.xx, 1.0f.xx) - _16_m1) / _16_m0;
            float4 _293 = mul(_5_m0, float4(mad(_278.x, 2.0f, -1.0f), mad(-_278.y, 2.0f, 1.0f), (_5_m1.y / lerp(_236, _255, 0.5f)) + _5_m1.x, 1.0f));
            float _294 = _293.w;
            uint _412;
            float3 _413;
            bool _414;
            if (((_294 > 0.0f) && (_293.z <= _294)) && (_5_m7 == 0.0f))
            {
                float3 _307 = _293.xyz / _294.xxx;
                float _320 = _5_m2.y / (_307.z - _5_m2.x);
                float2 _335 = ((mad(float2(mad(_307.x, 0.5f, 0.5f), mad(-_307.y, 0.5f, 0.5f)), _5_m10, _5_m11) / _5_m4) + float2(float(_16_m5), 0.0f)) * _5_m6.xy;
                float2 _338 = _5_m6.xy * 0.5f;
                float2 _339 = _5_m8 - _338;
                float2 _344 = _5_m9 + _338;
                uint _409;
                float3 _410;
                bool _411;
                if (all(bool2(_335.x >= _339.x, _335.y >= _339.y)) && all(bool2(_335.x <= _344.x, _335.y <= _344.y)))
                {
                    float2 _351 = max(_5_m8, min(_5_m9, _335));
                    float2 _352 = _351 / _5_m6.xy;
                    float _371;
                    do
                    {
                        if (_320 <= _5_m3[0].x)
                        {
                            _371 = mad(_5_m3[2].x, _320, _5_m3[3].x);
                            break;
                        }
                        else
                        {
                            _371 = _5_m3[1].y * log2(mad(_5_m3[2].y, _320, _5_m3[3].y));
                            break;
                        }
                        break; // unreachable workaround
                    } while(false);
                    float _376 = mad(_8.Load(int3(uint2(_352), 0u)).x, 255.0f, 1.0f);
                    bool _378 = (_371 - 0.5099999904632568359375f) <= _376;
                    float3 _406;
                    if (_378)
                    {
                        float _382 = min(_371, _376 - 0.5f);
                        float4 _385 = _8.GatherRed(_11, _351);
                        float2 _388 = min(_385.xy, _385.zw);
                        float2 _399;
                        if (_382 >= mad(min(_388.x, _388.y), 255.0f, 1.0f))
                        {
                            _399 = (floor(_352) + 0.5f.xx) * _5_m6.xy;
                        }
                        else
                        {
                            _399 = _351;
                        }
                        _406 = float3(_399, _382 * _5_m6.z);
                    }
                    else
                    {
                        _406 = 0.0f.xxx;
                    }
                    _409 = _378 ? 1u : 8u;
                    _410 = _406;
                    _411 = _378 ? true : false;
                }
                else
                {
                    _409 = 8u;
                    _410 = 0.0f.xxx;
                    _411 = false;
                }
                _412 = _409;
                _413 = _410;
                _414 = _411;
            }
            else
            {
                _412 = 8u;
                _413 = 0.0f.xxx;
                _414 = false;
            }
            _415 = _412;
            _416 = _413;
            _417 = _414;
        }
        float4 _425;
        if (_417)
        {
            _425 = _18.SampleLevel(_11, _416, 0.0f) * 0.930000007152557373046875f;
        }
        else
        {
            _425 = 0.0f.xxxx;
        }
        float _435 = mad(_12_m19[0].z, _215, _12_m19[2].z) + 4.0f;
        int2 _440 = int2(_197 / _12_m14.xx);
        float2 _446 = frac((float2(gl_WorkGroupID.xy) * 0.31830990314483642578125f) + 0.100000001490116119384765625f.xx) * 17.0f;
        float _447 = _446.x;
        float _448 = _446.y;
        uint _460 = (uint(frac((_447 * _448) * (_447 + _448)) * 4.0f) + uint(_13_m2)) + gl_WorkGroupID.z;
        float4 _462;
        _462 = 0.0f.xxxx;
        float4 _463;
        [loop]
        for (uint _465 = 0u; _465 < _415; _462 = _463, _465++)
        {
            float3 _477 = frac((_257 * 0.31830990314483642578125f) + 0.100000001490116119384765625f.xxx) * 17.0f;
            float _478 = _477.x;
            float _479 = _477.y;
            float _481 = _477.z;
            uint _491 = (uint((frac(_13_m2 * 0.265625f) + frac(((_478 * _479) * _481) * ((_478 + _479) + _481))) * 64.0f) + ((_465 * 64u) / _415)) % 64u;
            float2 _510 = ((clamp((float2(_197) + asfloat(_6.Load4(_491 * 16 + 0)).xy) * float2(_12_m32, _12_m18), 0.0f.xx, 1.0f.xx) - _16_m1) / _16_m0) * 0.5f;
            float _514 = _510.x;
            float _516 = _510.y;
            float _530 = lerp(_236, _255, asfloat(_6.Load4(_491 * 16 + 0)).z);
            float3 _531 = (((_14_m7[0].xyz * ((1.0f - _514) - _516)) + (_14_m7[1].xyz * _514)) + (_14_m7[2].xyz * _516)) * _530;
            uint _533 = (_460 + _465) & 3u;
            float4x4 _539 = float4x4(asfloat(_23.Load(_22_m1[_533] * 160 + 0)), asfloat(_23.Load(_22_m1[_533] * 160 + 16)), asfloat(_23.Load(_22_m1[_533] * 160 + 32)), asfloat(_23.Load(_22_m1[_533] * 160 + 48)), asfloat(_23.Load(_22_m1[_533] * 160 + 4)), asfloat(_23.Load(_22_m1[_533] * 160 + 20)), asfloat(_23.Load(_22_m1[_533] * 160 + 36)), asfloat(_23.Load(_22_m1[_533] * 160 + 52)), asfloat(_23.Load(_22_m1[_533] * 160 + 8)), asfloat(_23.Load(_22_m1[_533] * 160 + 24)), asfloat(_23.Load(_22_m1[_533] * 160 + 40)), asfloat(_23.Load(_22_m1[_533] * 160 + 56)), asfloat(_23.Load(_22_m1[_533] * 160 + 12)), asfloat(_23.Load(_22_m1[_533] * 160 + 28)), asfloat(_23.Load(_22_m1[_533] * 160 + 44)), asfloat(_23.Load(_22_m1[_533] * 160 + 60)));
            float4x4 _541 = float4x4(asfloat(_23.Load(_22_m1[_533] * 160 + 64)), asfloat(_23.Load(_22_m1[_533] * 160 + 80)), asfloat(_23.Load(_22_m1[_533] * 160 + 96)), asfloat(_23.Load(_22_m1[_533] * 160 + 112)), asfloat(_23.Load(_22_m1[_533] * 160 + 68)), asfloat(_23.Load(_22_m1[_533] * 160 + 84)), asfloat(_23.Load(_22_m1[_533] * 160 + 100)), asfloat(_23.Load(_22_m1[_533] * 160 + 116)), asfloat(_23.Load(_22_m1[_533] * 160 + 72)), asfloat(_23.Load(_22_m1[_533] * 160 + 88)), asfloat(_23.Load(_22_m1[_533] * 160 + 104)), asfloat(_23.Load(_22_m1[_533] * 160 + 120)), asfloat(_23.Load(_22_m1[_533] * 160 + 76)), asfloat(_23.Load(_22_m1[_533] * 160 + 92)), asfloat(_23.Load(_22_m1[_533] * 160 + 108)), asfloat(_23.Load(_22_m1[_533] * 160 + 124)));
            float _551 = _531.y + _15_m6.y;
            float _556 = min(7.9345703125f, (_539[0].w * exp2(_539[1].w * _551)) * _22_m0[_22_m1[_533]]);
            float _611;
            [branch]
            if ((_556 > 9.9999997473787516355514526367188e-05f) && (_539[2].w > 0.0f))
            {
                float _564 = _539[3].w + _435;
                float4 _581 = _19.SampleLevel(_21, mul(float4(_531, 1.0f), float4x3(_539[0].xyz, _539[1].xyz, _539[2].xyz, _539[3].xyz)), _564);
                float _582 = dot(_581, float4(0.0f, 0.625f, 0.25f, 0.125f));
                float4 _603 = _20.SampleLevel(_11, mad(float2(sqrt(_539[2].w), round(_564) * 0.16666667163372039794921875f), float2(0.9921875f, 0.857142865657806396484375f), float2(0.00390625f, 0.071428574621677398681640625f)), 0.0f);
                _611 = _556 * max(0.0f, mad(clamp((((_581.x - (_582 - 1.0f)) / (2.0f - _582)) + mad(2.0f, _539[2].w, -1.0f)) / mad(-2.0f, max(0.0f, 0.5f - _539[2].w), 1.0f), 0.0f, 1.0f), mad(_603.x, 7.0f, 1.0f), mad(_603.y, 1.5f, -0.5f)));
            }
            else
            {
                _611 = _556;
            }
            float _623 = min(7.9345703125f, (_541[0].w * exp2(_541[1].w * _551)) * _22_m0[_22_m1[_533]]);
            float _678;
            [branch]
            if ((_623 > 9.9999997473787516355514526367188e-05f) && (_541[2].w > 0.0f))
            {
                float _631 = _541[3].w + _435;
                float4 _648 = _19.SampleLevel(_21, mul(float4(_531, 1.0f), float4x3(_541[0].xyz, _541[1].xyz, _541[2].xyz, _541[3].xyz)), _631);
                float _649 = dot(_648, float4(0.0f, 0.625f, 0.25f, 0.125f));
                float4 _670 = _20.SampleLevel(_11, mad(float2(sqrt(_541[2].w), round(_631) * 0.16666667163372039794921875f), float2(0.9921875f, 0.857142865657806396484375f), float2(0.00390625f, 0.071428574621677398681640625f)), 0.0f);
                _678 = _623 * max(0.0f, mad(clamp((((_648.x - (_649 - 1.0f)) / (2.0f - _649)) + mad(2.0f, _541[2].w, -1.0f)) / mad(-2.0f, max(0.0f, 0.5f - _541[2].w), 1.0f), 0.0f, 1.0f), mad(_670.x, 7.0f, 1.0f), mad(_670.y, 1.5f, -0.5f)));
            }
            else
            {
                _678 = _623;
            }
            float3 _712 = -normalize(_531);
            uint4 _716 = uint4(int4(_9.Load4(uint(int(mad(mad(float(int(clamp(mad(log2(_530 * _15_m4), _12_m21, _12_m22), 0.0f, float(_12_m26)))), _12_m24, float(_440.y)), _12_m23, float(_440.x)))) * 16 + 0)));
            uint _718 = _716.y;
            uint _725 = _716.z;
            uint _730 = (_718 >> 24u) + (((_725 >> 0u) & 1023u) + (((_718 >> 12u) & 4095u) + (((_718 >> 0u) & 4095u) + _716.x)));
            uint _732 = (_725 >> 10u) + _730;
            float4 _737;
            float _739;
            float4 _741;
            _737 = 0.0f.xxxx;
            _739 = 1.0f;
            _741 = float4(asfloat(_23.Load3(_22_m1[_533] * 160 + 128)) * _611, _611) + float4(asfloat(_23.Load3(_22_m1[_533] * 160 + 144)) * _678, _678);
            uint _735;
            float4 _738;
            float _740;
            float4 _742;
            for (uint _734 = 0u, _743 = _730; _743 < _732; _734 = _735, _737 = _738, _739 = _740, _741 = _742, _743++)
            {
                _44 _752;
                _752._m0 = asfloat(_24.Load4(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 0));
                _752._m1 = float4x3(asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 16)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 32)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 48)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 20)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 36)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 52)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 24)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 40)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 56)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 28)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 44)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 60)));
                _752._m2 = asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 64));
                _752._m3 = _24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 68);
                _752._m4 = asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 72));
                _752._m5 = asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 76));
                _752._m6 = float4x3(asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 80)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 96)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 112)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 84)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 100)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 116)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 88)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 104)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 120)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 92)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 108)), asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 124)));
                _752._m7 = asfloat(_24.Load3(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 128));
                _752._m8 = asfloat(_24.Load(uint(int(_10.Load(_743 * 4 + 0))) * 144 + 140));
                float3x3 _768 = float3x3(_752._m1[0], _752._m1[1], _752._m1[2]);
                float _771 = abs(_752._m2) - 1.0f;
                bool _774 = _752._m3 != _734;
                if (_774)
                {
                    _742 = (_741 * _739) + _737;
                }
                else
                {
                    _742 = _741;
                }
                _735 = _774 ? _752._m3 : _734;
                float _779 = _774 ? 1.0f : _739;
                bool4 _780 = _774.xxxx;
                float4 _781 = float4(_780.x ? 0.0f.xxxx.x : _737.x, _780.y ? 0.0f.xxxx.y : _737.y, _780.z ? 0.0f.xxxx.z : _737.z, _780.w ? 0.0f.xxxx.w : _737.w);
                float _893;
                bool _894;
                if (int(_752._m0.w) == 0)
                {
                    float3 _827 = _531 - _752._m1[3];
                    float _828 = dot(_827, _827);
                    if (_828 > _752._m0.y)
                    {
                        _738 = _781;
                        _740 = _779;
                        continue;
                    }
                    bool _885;
                    do
                    {
                        float _835 = dot(_712, _712);
                        float _836 = dot(_712, _827);
                        float _837 = 2.0f * _836;
                        float _838 = _828 - _752._m0.y;
                        float _874;
                        float _875;
                        bool _876;
                        do
                        {
                            float _844 = mad(_837, _837, -((4.0f * _835) * _838));
                            float _872;
                            float _873;
                            if (_844 < 0.0f)
                            {
                                _874 = 0.0f;
                                _875 = 0.0f;
                                _876 = false;
                                break;
                            }
                            else
                            {
                                if (_844 == 0.0f)
                                {
                                    float _871 = (_836 * (-1.0f)) * (1.0f / _835);
                                    _872 = _871;
                                    _873 = _871;
                                }
                                else
                                {
                                    float _864;
                                    if (_837 > 0.0f)
                                    {
                                        _864 = (-0.5f) * mad(2.0f, _836, sqrt(_844));
                                    }
                                    else
                                    {
                                        _864 = (-0.5f) * mad(2.0f, _836, -sqrt(_844));
                                    }
                                    _872 = _838 * (1.0f / _864);
                                    _873 = _864 * (1.0f / _835);
                                }
                            }
                            _874 = _872;
                            _875 = _873;
                            _876 = true;
                            break;
                        } while(false);
                        if (!_876)
                        {
                            _885 = false;
                            break;
                        }
                        if ((_875 < 0.0f) && (_874 < 0.0f))
                        {
                            _885 = false;
                            break;
                        }
                        _885 = true;
                        break;
                    } while(false);
                    _893 = clamp((_752._m0.x - sqrt(_828)) * (1.0f / max(_771, 9.9999997473787516355514526367188e-05f)), 0.0f, 1.0f);
                    _894 = _885;
                }
                else
                {
                    float3 _787 = mul(_531 - _752._m1[3], _768);
                    float3 _788 = abs(_787);
                    if (any(bool3(_788.x > _752._m0.xyz.x, _788.y > _752._m0.xyz.y, _788.z > _752._m0.xyz.z)))
                    {
                        _738 = _781;
                        _740 = _779;
                        continue;
                    }
                    float3 _793 = mul(_712, _768);
                    bool _816;
                    do
                    {
                        float3 _797 = (_752._m0.xyz - _787) / _793;
                        float3 _800 = ((-_752._m0.xyz) - _787) / _793;
                        float3 _801 = min(_797, _800);
                        float3 _802 = max(_797, _800);
                        if (max(_801.x, max(_801.y, _801.z)) > min(_802.x, min(_802.y, _802.z)))
                        {
                            _816 = false;
                            break;
                        }
                        _816 = true;
                        break;
                    } while(false);
                    _893 = 1.0f - clamp(length(max(_788 - (_752._m0.xyz - _771.xxx), 0.0f.xxx)) * (1.0f / max(_771, 9.9999997473787516355514526367188e-05f)), 0.0f, 1.0f);
                    _894 = _816;
                }
                float _896 = float(_894) * _893;
                float _897 = _752._m5 * _896;
                float _939;
                [branch]
                if (_752._m4 < 1.0f)
                {
                    float _901 = _752._m8 + _435;
                    float4 _909 = _19.SampleLevel(_21, mul(float4(_531, 1.0f), _752._m6), _901);
                    float _910 = dot(_909, float4(0.0f, 0.625f, 0.25f, 0.125f));
                    float4 _931 = _20.SampleLevel(_11, mad(float2(sqrt(_752._m4), round(_901) * 0.16666667163372039794921875f), float2(0.9921875f, 0.857142865657806396484375f), float2(0.00390625f, 0.071428574621677398681640625f)), 0.0f);
                    _939 = _897 * max(0.0f, mad(clamp((((_909.x - (_910 - 1.0f)) / (2.0f - _910)) + mad(2.0f, _752._m4, -1.0f)) / mad(-2.0f, max(0.0f, 0.5f - _752._m4), 1.0f), 0.0f, 1.0f), mad(_931.x, 7.0f, 1.0f), mad(_931.y, 1.5f, -0.5f)));
                }
                else
                {
                    _939 = _897;
                }
                _738 = max(_781, float4(_752._m7 * _939, _939));
                _740 = min(_779, lerp(1.0f, (_752._m2 < 0.0f) ? 0.0f : 1.0f, _896));
            }
            _463 = _462 + ((_741 * _739) + _737);
        }
        float4 _951 = _425 + (_462 * (((_417 ? 0.069999992847442626953125f : 1.0f) * 8192.0f) / float(_415)));
        if (any(isnan(_951)) || any(isinf(_951)))
        {
            _17[_196 + uint3(_16_m5, 0u, 0u)] = 0.0f.xxxx;
        }
        else
        {
            _17[_196 + uint3(_16_m5, 0u, 0u)] = _951;
        }
        break;
    } while(false);
}

[numthreads(4, 4, 4)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_WorkGroupID = stage_input.gl_WorkGroupID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}

