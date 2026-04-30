

struct _47
{
    float4 _m0;
    float4 _m1;
    float4 _m2;
    float _m3;
    float _m4;
    float _m5;
    uint _m6;
    uint _m7;
    float _m8;
    int2 _m9;
};

struct _50
{
    float3 _m0;
    uint _m1;
    float4 _m2;
    float2 _m3;
    uint _m4;
    float _m5;
    column_major float4x3 _m6;
    float3 _m7;
    uint _m8;
    float3 _m9;
    float _m10;
};

struct _54
{
    float4 _m0;
    column_major float4x3 _m1;
    float4 _m2[4];
    float _m3;
    float _m4;
    uint _m5;
    uint _m6;
};

struct _59
{
    column_major float4x4 _m0;
    float2 _m1;
    float _m2;
    float _m3;
    float _m4;
    float2 _m5;
    float _m6;
};

static float4 _261 = (float4)0;
static float3 _262 = (float3)0;

static const float4 _247[4] = { float4(1.0f, 0.0f, 0.0f, 0.0f), float4(0.0f, 1.0f, 0.0f, 0.0f), float4(0.0f, 0.0f, 1.0f, 0.0f), float4(0.0f, 0.0f, 0.0f, 1.0f) };

[[vk::binding(10, 1)]]
cbuffer _38_4 : register(b10, space1)
{
    column_major float4x4 _4_m0 : packoffset(c0);
    float2 _4_m1 : packoffset(c4);
    float2 _4_m2 : packoffset(c4.z);
    column_major float4x3 _4_m3 : packoffset(c5);
    float2 _4_m4 : packoffset(c8);
    float2 _4_m5 : packoffset(c8.z);
    float3 _4_m6 : packoffset(c9);
    float _4_m7 : packoffset(c9.w);
    float2 _4_m8 : packoffset(c10);
    float2 _4_m9 : packoffset(c10.z);
    float2 _4_m10 : packoffset(c11);
    float2 _4_m11 : packoffset(c11.z);
};

[[vk::binding(11, 1)]]
ByteAddressBuffer _5 : register(t11, space1);
[[vk::binding(16, 1)]]
ByteAddressBuffer _8 : register(t16, space1);
[[vk::binding(26, 1)]]
ByteAddressBuffer _12 : register(t26, space1);
[[vk::binding(27, 1)]]
ByteAddressBuffer _13 : register(t27, space1);
[[vk::binding(28, 1)]]
ByteAddressBuffer _14 : register(t28, space1);
[[vk::binding(32, 1)]]
ByteAddressBuffer _15 : register(t32, space1);
[[vk::binding(36, 1)]]
ByteAddressBuffer _17 : register(t36, space1);
[[vk::binding(42, 1)]]
cbuffer _58_18 : register(b42, space1)
{
    float _18_m0 : packoffset(c0);
    float _18_m1 : packoffset(c0.y);
    float _18_m2 : packoffset(c0.z);
    float _18_m3 : packoffset(c0.w);
    float _18_m4 : packoffset(c1);
    float _18_m5 : packoffset(c1.y);
    float _18_m6 : packoffset(c1.z);
    float _18_m7 : packoffset(c1.w);
    float4 _18_m8 : packoffset(c2);
    float4 _18_m9 : packoffset(c3);
    column_major float4x4 _18_m10[4] : packoffset(c4);
    float _18_m11 : packoffset(c20);
    float _18_m12 : packoffset(c20.y);
    float _18_m13 : packoffset(c20.z);
    uint _18_m14 : packoffset(c20.w);
    float2 _18_m15 : packoffset(c21);
    float2 _18_m16 : packoffset(c21.z);
    float3 _18_m17 : packoffset(c22);
    float _18_m18 : packoffset(c22.w);
    column_major float4x3 _18_m19 : packoffset(c23);
    float4 _18_m20[4] : packoffset(c26);
    float _18_m21 : packoffset(c30);
    float _18_m22 : packoffset(c30.y);
    float _18_m23 : packoffset(c30.z);
    float _18_m24 : packoffset(c30.w);
    uint _18_m25 : packoffset(c31);
    uint _18_m26 : packoffset(c31.y);
    float _18_m27 : packoffset(c31.z);
    float _18_m28 : packoffset(c31.w);
    float _18_m29 : packoffset(c32);
    float _18_m30 : packoffset(c32.y);
    float _18_m31 : packoffset(c32.z);
    float _18_m32 : packoffset(c32.w);
    float2 _18_m33 : packoffset(c33);
    float2 _18_m34 : packoffset(c33.z);
};

[[vk::binding(43, 1)]]
ByteAddressBuffer _19 : register(t43, space1);
[[vk::binding(0, 0)]]
cbuffer _62_24 : register(b0, space0)
{
    float _24_m0 : packoffset(c0);
    float _24_m1 : packoffset(c0.y);
    float _24_m2 : packoffset(c0.z);
    float _24_m3 : packoffset(c0.w);
    float _24_m4 : packoffset(c1);
    float _24_m5 : packoffset(c1.y);
    int _24_m6 : packoffset(c1.z);
    float _24_m7 : packoffset(c1.w);
};

[[vk::binding(1, 0)]]
cbuffer _64_25 : register(b1, space0)
{
    float3 _25_m0 : packoffset(c0);
    float _25_m1 : packoffset(c0.w);
    float3 _25_m2 : packoffset(c1);
    float _25_m3 : packoffset(c1.w);
    float3 _25_m4 : packoffset(c2);
    float _25_m5 : packoffset(c2.w);
    column_major float4x4 _25_m6 : packoffset(c3);
    float4 _25_m7[3] : packoffset(c7);
    float4 _25_m8 : packoffset(c10);
    float4 _25_m9 : packoffset(c11);
    float _25_m10 : packoffset(c12);
    float _25_m11 : packoffset(c12.y);
    float _25_m12 : packoffset(c12.z);
    float _25_m13 : packoffset(c12.w);
    float _25_m14 : packoffset(c13);
    float _25_m15 : packoffset(c13.y);
    float _25_m16 : packoffset(c13.z);
    float _25_m17 : packoffset(c13.w);
    float4 _25_m18 : packoffset(c14);
    float _25_m19 : packoffset(c15);
    float _25_m20 : packoffset(c15.y);
    float _25_m21 : packoffset(c15.z);
    float _25_m22 : packoffset(c15.w);
    float4 _25_m23 : packoffset(c16);
    float3 _25_m24 : packoffset(c17);
    float _25_m25 : packoffset(c17.w);
    float3 _25_m26 : packoffset(c18);
    float _25_m27 : packoffset(c18.w);
    float4 _25_m28 : packoffset(c19);
    float3 _25_m29 : packoffset(c20);
    float _25_m30 : packoffset(c20.w);
    float4 _25_m31 : packoffset(c21);
    float3 _25_m32 : packoffset(c22);
    float _25_m33 : packoffset(c22.w);
    float3 _25_m34 : packoffset(c23);
    float _25_m35 : packoffset(c23.w);
    float3 _25_m36 : packoffset(c24);
    float _25_m37 : packoffset(c24.w);
};

[[vk::binding(2, 0)]]
cbuffer _65_26 : register(b2, space0)
{
    column_major float4x4 _26_m0 : packoffset(c0);
    column_major float4x4 _26_m1 : packoffset(c4);
    column_major float4x4 _26_m2 : packoffset(c8);
    float _26_m3 : packoffset(c12);
    float _26_m4 : packoffset(c12.y);
    float2 _26_m5 : packoffset(c12.z);
    float3 _26_m6 : packoffset(c13);
    int _26_m7 : packoffset(c13.w);
};

[[vk::binding(4, 0)]]
cbuffer _66_27 : register(b4, space0)
{
    float2 _27_m0 : packoffset(c0);
    float2 _27_m1 : packoffset(c0.z);
    uint2 _27_m2 : packoffset(c1);
    uint2 _27_m3 : packoffset(c1.z);
    uint2 _27_m4 : packoffset(c2);
    uint _27_m5 : packoffset(c2.z);
    uint _27_m6 : packoffset(c2.w);
    float2 _27_m7 : packoffset(c3);
    float2 _27_m8 : packoffset(c3.z);
    float2 _27_m9 : packoffset(c4);
    float2 _27_m10 : packoffset(c4.z);
    float2 _27_m11 : packoffset(c5);
    float2 _27_m12 : packoffset(c5.z);
    float2 _27_m13 : packoffset(c6);
    float2 _27_m14 : packoffset(c6.z);
    float2 _27_m15 : packoffset(c7);
    float2 _27_m16 : packoffset(c7.z);
    uint2 _27_m17 : packoffset(c8);
    uint2 _27_m18 : packoffset(c8.z);
    uint2 _27_m19 : packoffset(c9);
    uint2 _27_m20 : packoffset(c9.z);
    float2 _27_m21 : packoffset(c10);
    float2 _27_m22 : packoffset(c10.z);
};

[[vk::binding(0, 5)]]
cbuffer _67_28 : register(b0, space5)
{
    float _28_m0 : packoffset(c0);
    float _28_m1 : packoffset(c0.y);
    float _28_m2 : packoffset(c0.z);
    float _28_m3 : packoffset(c0.w);
    float _28_m4 : packoffset(c1);
    float3 _28_m5 : packoffset(c1.y);
    float _28_m6 : packoffset(c2);
    float3 _28_m7 : packoffset(c2.y);
    float3 _28_m8 : packoffset(c3);
    float _28_m9 : packoffset(c3.w);
};

[[vk::binding(2, 1)]]
ByteAddressBuffer _34 : register(t2, space1);
[[vk::binding(3, 1)]]
cbuffer _68_35 : register(b3, space1)
{
    uint _35_m0 : packoffset(c0);
    uint _35_m1 : packoffset(c0.y);
    uint _35_m2 : packoffset(c0.z);
    float _35_m3 : packoffset(c0.w);
    column_major float4x4 _35_m4 : packoffset(c1);
    column_major float4x4 _35_m5 : packoffset(c5);
    uint _35_m6 : packoffset(c9);
    uint3 _35_m7 : packoffset(c9.y);
};

[[vk::binding(12, 1)]]
Texture2D<float4> _6 : register(t12, space1);
[[vk::binding(13, 1)]]
Texture2D<float4> _7 : register(t13, space1);
[[vk::binding(19, 1)]]
SamplerState _9 : register(s19, space1);
[[vk::binding(24, 1)]]
Texture2DArray<float4> _10 : register(t24, space1);
[[vk::binding(25, 1)]]
SamplerComparisonState _11 : register(s25, space1);
[[vk::binding(35, 1)]]
SamplerState _16 : register(s35, space1);
[[vk::binding(44, 1)]]
Texture2D<float4> _20 : register(t44, space1);
[[vk::binding(45, 1)]]
Texture2D<float4> _21 : register(t45, space1);
[[vk::binding(46, 1)]]
Texture2D<float4> _22 : register(t46, space1);
Texture2D<float4> _23[] : register(t48, space1);
[[vk::binding(1, 5)]]
Texture2D<float4> _29 : register(t1, space5);
[[vk::binding(4, 5)]]
Texture2D<float4> _30 : register(t4, space5);
[[vk::binding(5, 5)]]
Texture2D<float4> _31 : register(t5, space5);
[[vk::binding(0, 1)]]
RWTexture3D<float4> _32 : register(u0, space1);
[[vk::binding(1, 1)]]
Texture3D<float4> _33 : register(t1, space1);
[[vk::binding(49, 1)]]
Texture2DArray<float4> _36 : register(t49, space1);
[[vk::binding(50, 1)]]
Texture2DArray<float4> _37 : register(t50, space1);

static uint3 gl_GlobalInvocationID = (uint3)0;
struct SPIRV_Cross_Input
{
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

void comp_main()
{
    do
    {
        uint2 _275 = _35_m0.xx;
        uint2 _279 = _27_m4 / _275;
        uint2 _281 = gl_GlobalInvocationID.xy + (_27_m3 / _275);
        uint3 _282 = uint3(_281.x, _281.y, gl_GlobalInvocationID.z);
        uint2 _283 = _281.xy;
        if (any(bool2(_283.x > _279.x, _283.y > _279.y)))
        {
            break;
        }
        if (gl_GlobalInvocationID.z > uint(mad(_6.Load(int3(_283 + uint2(_27_m5, 0u), 0u)).x, 255.0f, 0.5f)))
        {
            break;
        }
        float _310;
        float _305 = float(gl_GlobalInvocationID.z);
        float _326;
        do
        {
            _310 = _18_m19[1].x;
            if (_305 <= _310)
            {
                _326 = _18_m19[0].y * (_305 - _18_m19[3].x);
                break;
            }
            else
            {
                _326 = _18_m19[1].z * (exp2(_18_m19[0].z * _305) - _18_m19[3].y);
                break;
            }
            break; // unreachable workaround
        } while(false);
        float _327 = _305 + 1.0f;
        float _345;
        do
        {
            if (_327 <= _310)
            {
                _345 = _18_m19[0].y * (_327 - _18_m19[3].x);
                break;
            }
            else
            {
                _345 = _18_m19[1].z * (exp2(_18_m19[0].z * _327) - _18_m19[3].y);
                break;
            }
            break; // unreachable workaround
        } while(false);
        float3 _347 = float3(_282);
        uint _505;
        float3 _506;
        bool _507;
        if (_24_m1 > 0.5f)
        {
            _505 = 16u;
            _506 = 0.0f.xxx;
            _507 = false;
        }
        else
        {
            float2 _368 = (clamp((_347 + 0.5f.xxx).xy * float2(_18_m32, _18_m18), 0.0f.xx, 1.0f.xx) - _27_m1) / _27_m0;
            float4 _383 = mul(_4_m0, float4(mad(_368.x, 2.0f, -1.0f), mad(-_368.y, 2.0f, 1.0f), (_4_m1.y / lerp(_326, _345, 0.5f)) + _4_m1.x, 1.0f));
            float _384 = _383.w;
            uint _502;
            float3 _503;
            bool _504;
            if (((_384 > 0.0f) && (_383.z <= _384)) && (_4_m7 == 0.0f))
            {
                float3 _397 = _383.xyz / _384.xxx;
                float _410 = _4_m2.y / (_397.z - _4_m2.x);
                float2 _425 = ((mad(float2(mad(_397.x, 0.5f, 0.5f), mad(-_397.y, 0.5f, 0.5f)), _4_m10, _4_m11) / _4_m4) + float2(float(_27_m5), 0.0f)) * _4_m6.xy;
                float2 _428 = _4_m6.xy * 0.5f;
                float2 _429 = _4_m8 - _428;
                float2 _434 = _4_m9 + _428;
                uint _499;
                float3 _500;
                bool _501;
                if (all(bool2(_425.x >= _429.x, _425.y >= _429.y)) && all(bool2(_425.x <= _434.x, _425.y <= _434.y)))
                {
                    float2 _441 = max(_4_m8, min(_4_m9, _425));
                    float2 _442 = _441 / _4_m6.xy;
                    float _461;
                    do
                    {
                        if (_410 <= _4_m3[0].x)
                        {
                            _461 = mad(_4_m3[2].x, _410, _4_m3[3].x);
                            break;
                        }
                        else
                        {
                            _461 = _4_m3[1].y * log2(mad(_4_m3[2].y, _410, _4_m3[3].y));
                            break;
                        }
                        break; // unreachable workaround
                    } while(false);
                    float _466 = mad(_7.Load(int3(uint2(_442), 0u)).x, 255.0f, 1.0f);
                    bool _468 = (_461 - 0.5099999904632568359375f) <= _466;
                    float3 _496;
                    if (_468)
                    {
                        float _472 = min(_461, _466 - 0.5f);
                        float4 _475 = _7.GatherRed(_16, _441);
                        float2 _478 = min(_475.xy, _475.zw);
                        float2 _489;
                        if (_472 >= mad(min(_478.x, _478.y), 255.0f, 1.0f))
                        {
                            _489 = (floor(_442) + 0.5f.xx) * _4_m6.xy;
                        }
                        else
                        {
                            _489 = _441;
                        }
                        _496 = float3(_489, _472 * _4_m6.z);
                    }
                    else
                    {
                        _496 = 0.0f.xxx;
                    }
                    _499 = _468 ? 1u : 8u;
                    _500 = _496;
                    _501 = _468 ? true : false;
                }
                else
                {
                    _499 = 8u;
                    _500 = 0.0f.xxx;
                    _501 = false;
                }
                _502 = _499;
                _503 = _500;
                _504 = _501;
            }
            else
            {
                _502 = 8u;
                _503 = 0.0f.xxx;
                _504 = false;
            }
            _505 = _502;
            _506 = _503;
            _507 = _504;
        }
        float3 _522;
        if (_507)
        {
            _522 = (_33.SampleLevel(_16, _506, 0.0f).xyz * ((asfloat(_34.Load(0)) == 0.0f) ? 1.0f : (asfloat(_8.Load(0)) / asfloat(_34.Load(0))))) * 0.930000007152557373046875f;
        }
        else
        {
            _522 = 0.0f.xxx;
        }
        float _526 = ((_507 ? 0.069999992847442626953125f : 1.0f) * 32.0f) / float(_505);
        float _532 = exp2(mad(_18_m19[0].z, _305, _18_m19[2].z));
        int2 _537 = int2(_283 / _18_m14.xx);
        float3 _539;
        _539 = _522;
        float3 _540;
        [loop]
        for (uint _542 = 0u; _542 < _505; _539 = _540, _542++)
        {
            float3 _556 = frac((_347 * 0.31830990314483642578125f) + 0.100000001490116119384765625f.xxx) * 17.0f;
            float _557 = _556.x;
            float _558 = _556.y;
            float _560 = _556.z;
            uint _570 = (uint((frac(_24_m2 * 0.265625f) + frac(((_557 * _558) * _560) * ((_557 + _558) + _560))) * 64.0f) + ((_542 * 64u) / _505)) % 64u;
            float2 _589 = ((clamp((float2(_283) + asfloat(_5.Load4(_570 * 16 + 0)).xy) * float2(_18_m32, _18_m18), 0.0f.xx, 1.0f.xx) - _27_m1) / _27_m0) * 0.5f;
            float _593 = _589.x;
            float _595 = _589.y;
            float3 _607 = ((_25_m7[0].xyz * ((1.0f - _593) - _595)) + (_25_m7[1].xyz * _593)) + (_25_m7[2].xyz * _595);
            float3 _608 = normalize(_607);
            float _610 = lerp(_326, _345, asfloat(_5.Load4(_570 * 16 + 0)).z);
            float3 _611 = _607 * _610;
            float _618 = clamp(mad(_18_m34.y, length(_611), _18_m34.x), 0.0f, 1.0f);
            float _632 = 0.48860251903533935546875f * _18_m13;
            float3 _633 = _608.yzx * _632;
            uint _671 = uint(int(mad(mad(float(int(clamp(mad(log2(_610 * _26_m4), _18_m21, _18_m22), 0.0f, float(_18_m26)))), _18_m24, float(_537.y)), _18_m23, float(_537.x))));
            uint4 _674 = uint4(int4(_12.Load4(_671 * 16 + 0)));
            uint _676 = _674.y;
            uint _686 = ((_674.z >> 0u) & 1023u) + (((_676 >> 12u) & 4095u) + (((_676 >> 0u) & 4095u) + _674.x));
            uint _688 = (_676 >> 24u) + _686;
            float3 _690;
            _690 = max(0.0f.xxx, (((_18_m20[0].xyz * 0.2820948064327239990234375f) + (_18_m20[1].xyz * _633.x)) + (_18_m20[2].xyz * _633.y)) + (_18_m20[3].xyz * _633.z));
            float3 _691;
            for (uint _693 = _686; _693 < _688; _690 = _691, _693++)
            {
                uint _700 = uint(int(_13.Load(_693 * 4 + 0)));
                float4x3 _704 = float4x3(asfloat(_17.Load(_700 * 144 + 16)), asfloat(_17.Load(_700 * 144 + 32)), asfloat(_17.Load(_700 * 144 + 48)), asfloat(_17.Load(_700 * 144 + 20)), asfloat(_17.Load(_700 * 144 + 36)), asfloat(_17.Load(_700 * 144 + 52)), asfloat(_17.Load(_700 * 144 + 24)), asfloat(_17.Load(_700 * 144 + 40)), asfloat(_17.Load(_700 * 144 + 56)), asfloat(_17.Load(_700 * 144 + 28)), asfloat(_17.Load(_700 * 144 + 44)), asfloat(_17.Load(_700 * 144 + 60)));
                float4 _706[4];
                [unroll]
                for (int _4ident = 0; _4ident < 4; _4ident++)
                {
                    [unroll]
                    for (int _5ident = 0; _5ident < 4; _5ident++)
                    {
                        _706[_4ident][_5ident] = asfloat(_17.Load(_5ident * 4 + _4ident * 16 + _700 * 144 + 64));
                    }
                }
                int _716 = int(_17.Load(_700 * 144 + 136) & 1u);
                float3x3 _720 = float3x3(_704[0], _704[1], _704[2]);
                float3 _723 = mul(_611 - _704[3], _720);
                float3 _724 = mul(_608, _720);
                float _725 = dot(_723, _723);
                float3 _727 = abs(_723);
                if ((_716 == 1) ? any(bool3(_727.x > asfloat(_17.Load4(_700 * 144 + 0)).xyz.x, _727.y > asfloat(_17.Load4(_700 * 144 + 0)).xyz.y, _727.z > asfloat(_17.Load4(_700 * 144 + 0)).xyz.z)) : (_725 > asfloat(_17.Load4(_700 * 144 + 0)).y))
                {
                    _691 = _690;
                    continue;
                }
                float _832;
                bool _833;
                if (_716 == 0)
                {
                    bool _824;
                    do
                    {
                        float _774 = dot(_724, _724);
                        float _775 = dot(_724, _723);
                        float _776 = 2.0f * _775;
                        float _777 = _725 - asfloat(_17.Load4(_700 * 144 + 0)).y;
                        float _813;
                        float _814;
                        bool _815;
                        do
                        {
                            float _783 = mad(_776, _776, -((4.0f * _774) * _777));
                            float _811;
                            float _812;
                            if (_783 < 0.0f)
                            {
                                _813 = 0.0f;
                                _814 = 0.0f;
                                _815 = false;
                                break;
                            }
                            else
                            {
                                if (_783 == 0.0f)
                                {
                                    float _810 = (_775 * (-1.0f)) * (1.0f / _774);
                                    _811 = _810;
                                    _812 = _810;
                                }
                                else
                                {
                                    float _803;
                                    if (_776 > 0.0f)
                                    {
                                        _803 = (-0.5f) * mad(2.0f, _775, sqrt(_783));
                                    }
                                    else
                                    {
                                        _803 = (-0.5f) * mad(2.0f, _775, -sqrt(_783));
                                    }
                                    _811 = _777 * (1.0f / _803);
                                    _812 = _803 * (1.0f / _774);
                                }
                            }
                            _813 = _811;
                            _814 = _812;
                            _815 = true;
                            break;
                        } while(false);
                        if (!_815)
                        {
                            _824 = false;
                            break;
                        }
                        if ((_814 < 0.0f) && (_813 < 0.0f))
                        {
                            _824 = false;
                            break;
                        }
                        _824 = true;
                        break;
                    } while(false);
                    _832 = clamp((asfloat(_17.Load4(_700 * 144 + 0)).x - sqrt(_725)) * (1.0f / max(asfloat(_17.Load4(_700 * 144 + 0)).w, 9.9999997473787516355514526367188e-05f)), 0.0f, 1.0f);
                    _833 = _824;
                }
                else
                {
                    bool _761;
                    do
                    {
                        float3 _742 = (asfloat(_17.Load4(_700 * 144 + 0)).xyz - _723) / _724;
                        float3 _745 = ((-asfloat(_17.Load4(_700 * 144 + 0)).xyz) - _723) / _724;
                        float3 _746 = min(_742, _745);
                        float3 _747 = max(_742, _745);
                        if (max(_746.x, max(_746.y, _746.z)) > min(_747.x, min(_747.y, _747.z)))
                        {
                            _761 = false;
                            break;
                        }
                        _761 = true;
                        break;
                    } while(false);
                    _832 = 1.0f - clamp(length(max(_727 - (asfloat(_17.Load4(_700 * 144 + 0)).xyz - asfloat(_17.Load4(_700 * 144 + 0)).w.xxx), 0.0f.xxx)) * (1.0f / max(asfloat(_17.Load4(_700 * 144 + 0)).w, 9.9999997473787516355514526367188e-05f)), 0.0f, 1.0f);
                    _833 = _761;
                }
                float3 _838 = _724.yzx * _632;
                float4 _848 = (((_706[0] * 0.2820948064327239990234375f) + (_706[1] * _838.x)) + (_706[2] * _838.y)) + (_706[3] * _838.z);
                _691 = lerp(_690, max(0.0f.xxx, _848.xyz).xyz, (clamp(_848.w, 0.0f, 1.0f) * (float(_833) * smoothstep(0.0f, 1.0f, _832))).xxx);
            }
            float3 _858 = _607 * _326;
            float3 _859 = _607 * _345;
            float _1115;
            [branch]
            if (_18_m3 != 0.0f)
            {
                float4 _872;
                float _1013;
                do
                {
                    _872 = float4((_858 + _859) * 0.5f, 1.0f);
                    float _890;
                    if (0.0f < _18_m11)
                    {
                        float4 _880 = mul(_18_m10[0], _872);
                        float2 _883 = abs(_880.xy - 0.5f.xx);
                        _890 = float(all(bool2(_883.x < 0.5f.xx.x, _883.y < 0.5f.xx.y)) && (_880.z >= 0.0f));
                    }
                    else
                    {
                        _890 = 0.0f;
                    }
                    float _910;
                    float _911;
                    if (1.0f < _18_m11)
                    {
                        float4 _896 = mul(_18_m10[1], _872);
                        float2 _899 = abs(_896.xy - 0.5f.xx);
                        bool _904 = all(bool2(_899.x < 0.5f.xx.x, _899.y < 0.5f.xx.y)) && (_896.z >= 0.0f);
                        float _908;
                        if (_904)
                        {
                            _908 = _890 + 1.0f;
                        }
                        else
                        {
                            _908 = _890;
                        }
                        _910 = float(_904);
                        _911 = _908;
                    }
                    else
                    {
                        _910 = 0.0f;
                        _911 = _890;
                    }
                    float _932;
                    float _933;
                    if (2.0f < _18_m11)
                    {
                        float4 _917 = mul(_18_m10[2], _872);
                        float2 _920 = abs(_917.xy - 0.5f.xx);
                        float _930;
                        float _931;
                        if (all(bool2(_920.x < 0.5f.xx.x, _920.y < 0.5f.xx.y)) && (_917.z >= 0.0f))
                        {
                            _930 = _910 + 2.0f;
                            _931 = _911 + 1.0f;
                        }
                        else
                        {
                            _930 = _910;
                            _931 = _911;
                        }
                        _932 = _930;
                        _933 = _931;
                    }
                    else
                    {
                        _932 = _910;
                        _933 = _911;
                    }
                    float _954;
                    float _955;
                    if (3.0f < _18_m11)
                    {
                        float4 _939 = mul(_18_m10[3], _872);
                        float2 _942 = abs(_939.xy - 0.5f.xx);
                        float _952;
                        float _953;
                        if (all(bool2(_942.x < 0.5f.xx.x, _942.y < 0.5f.xx.y)) && (_939.z >= 0.0f))
                        {
                            _952 = _932 + 3.0f;
                            _953 = _933 + 1.0f;
                        }
                        else
                        {
                            _952 = _932;
                            _953 = _933;
                        }
                        _954 = _952;
                        _955 = _953;
                    }
                    else
                    {
                        _954 = _932;
                        _955 = _933;
                    }
                    if (_955 == 0.0f)
                    {
                        _1013 = 1.0f;
                        break;
                    }
                    int _960 = int(_954 / _955);
                    float3 _968 = mul(_18_m10[_960], float4(_858, 1.0f)).xyz;
                    float3 _976 = (mul(_18_m10[_960], float4(_859, 1.0f)).xyz - _968) * 0.25f;
                    float3 _978 = _968 + (_976 * asfloat(_5.Load4(_570 * 16 + 0)).z);
                    float _981 = float(_960);
                    float3 _988 = _978 + _976;
                    float3 _996 = _988 + _976;
                    float3 _1004 = _996 + _976;
                    _1013 = (((_10.SampleCmpLevelZero(_11, float3(_978.xy, _981), _978.z) + _10.SampleCmpLevelZero(_11, float3(_988.xy, _981), _988.z)) + _10.SampleCmpLevelZero(_11, float3(_996.xy, _981), _996.z)) + _10.SampleCmpLevelZero(_11, float3(_1004.xy, _981), _1004.z)) * 0.25f;
                    break;
                } while(false);
                float _1114;
                if (_35_m1 != 0u)
                {
                    float _1113;
                    if ((_26_m4 * _610) > _35_m3)
                    {
                        float4 _1035 = mul(_35_m5, _872);
                        float2 _1038 = abs(_1035.xy - 0.5f.xx);
                        float _1041 = _1035.z;
                        float _1112;
                        if (all(bool2(_1038.x < 0.5f.xx.x, _1038.y < 0.5f.xx.y)) && (_1041 >= 0.0f))
                        {
                            uint _1067 = _35_m6 - 1u;
                            float4 _1070 = mul(_18_m10[_1067], _872);
                            uint _1074 = uint(int(_1067));
                            float2 _1087 = clamp((1.0f.xx - abs((clamp(_1070.xy, 0.0f.xx, 1.0f.xx) * 2.0f) - 1.0f.xx)) / _18_m6.xx, 0.0f.xx, 1.0f.xx);
                            float _1111;
                            if (((_1087.x * _1087.y) * clamp((clamp(_1070.z, 0.0f, 1.0f) * _18_m8[_1074]) / (_18_m9[_1074] * (0.5f * _18_m6)), 0.0f, 1.0f)) < 1.0f)
                            {
                                _1111 = min(_1013, _37.SampleCmpLevelZero(_11, float3(_1035.xy, float(_35_m2)), _1041 + 4.9999998736893758177757263183594e-05f));
                            }
                            else
                            {
                                _1111 = _1013;
                            }
                            _1112 = _1111;
                        }
                        else
                        {
                            float4 _1047 = mul(_35_m4, _872);
                            float2 _1050 = abs(_1047.xy - 0.5f.xx);
                            float _1053 = _1047.z;
                            float _1066;
                            if (all(bool2(_1050.x < 0.5f.xx.x, _1050.y < 0.5f.xx.y)) && (_1053 >= 0.0f))
                            {
                                _1066 = _36.SampleCmpLevelZero(_11, float3(_1047.xy, float(_35_m2)), _1053 + 0.00069999997504055500030517578125f);
                            }
                            else
                            {
                                _1066 = _1013;
                            }
                            _1112 = _1066;
                        }
                        _1113 = _1112;
                    }
                    else
                    {
                        _1113 = _1013;
                    }
                    _1114 = _1113;
                }
                else
                {
                    _1114 = _1013;
                }
                _1115 = _1114;
            }
            else
            {
                _1115 = 1.0f;
            }
            float3 _1180;
            [branch]
            if ((_25_m19 > 0.0f) && (_25_m35 == 0.0f))
            {
                float3 _1130 = float3(0.0f, 636500.0f, 0.0f) + _26_m6;
                float _1134 = length(_1130);
                float3 _1145;
                float _1146;
                if (_1134 < (0.89999997615814208984375f * _28_m0))
                {
                    float3 _1143 = _1130;
                    _1143.z = _1130.z + _28_m0;
                    _1145 = _1143;
                    _1146 = length(_1143);
                }
                else
                {
                    _1145 = _1130;
                    _1146 = _1134;
                }
                float _1149 = dot(_1145 / _1146.xxx, _25_m0);
                float _1150 = _28_m0 / _1146;
                bool3 _1156 = (_1149 < (-sqrt(mad(-_1150, _1150, 1.0f)))).xxx;
                float3 _1171 = _29.SampleLevel(_16, float2(atan((_1149 + 0.1500000059604644775390625f) * 12.26210498809814453125f) * 0.666666686534881591796875f, sqrt((_1146 - _28_m0) / (_28_m1 - _28_m0))), 0.0f).xyz;
                _1180 = (float3(_1156.x ? 0.0f.xxx.x : _1171.x, _1156.y ? 0.0f.xxx.y : _1171.y, _1156.z ? 0.0f.xxx.z : _1171.z) * 1.0f) * (_25_m34 * _25_m20);
            }
            else
            {
                _1180 = _25_m2;
            }
            float _1266;
            [branch]
            if (_25_m21 > 0.0f)
            {
                float3 _1205 = _26_m6 + _611;
                float3 _1212 = float3(0.0f, _25_m18.z, 0.0f) + (_1205 - float3(0.0f, _25_m25, 0.0f));
                float _1216 = dot(_1212, _25_m24);
                float2 _1226 = ((((_1212 + (_25_m24 * (sqrt(mad(_1216, _1216, mad(_25_m18.z, _25_m18.z, -dot(_1212, _1212)))) - _1216))).xz * _25_m18.w) * 0.5f) + 0.5f.xx) + _25_m18.xy;
                _1226.x = 1.0f - _1226.x;
                float3 _1239 = float3(0.0f, _25_m23.z, 0.0f) + (_1205 - float3(0.0f, _25_m27, 0.0f));
                float _1243 = dot(_1239, _25_m26);
                float2 _1253 = ((((_1239 + (_25_m26 * (sqrt(mad(_1243, _1243, mad(_25_m23.z, _25_m23.z, -dot(_1239, _1239)))) - _1243))).xz * _25_m23.w) * 0.5f) + 0.5f.xx) + _25_m23.xy;
                _1253.x = 1.0f - _1253.x;
                _1266 = _1115 * (1.0f - clamp(smoothstep(0.0500000007450580596923828125f, 0.550000011920928955078125f, lerp(_30.SampleLevel(_9, _1226, 0.0f).x, _31.SampleLevel(_9, _1253, 0.0f).x, _25_m16)) * _25_m21, 0.0f, 1.0f));
            }
            else
            {
                _1266 = _1115;
            }
            float _1357;
            [branch]
            if (_25_m17 > 0.0f)
            {
                float3 _1295 = _26_m6 + _611;
                float3 _1303 = float3(0.0f, _25_m28.z, 0.0f) + ((_25_m29 + _1295) - float3(0.0f, _25_m30, 0.0f));
                float _1307 = dot(_1303, _25_m24);
                float2 _1317 = ((((_1303 + (_25_m24 * (sqrt(mad(_1307, _1307, mad(_25_m28.z, _25_m28.z, -dot(_1303, _1303)))) - _1307))).xz * _25_m28.w) * 0.5f) + 0.5f.xx) + _25_m28.xy;
                _1317.x = 1.0f - _1317.x;
                float3 _1331 = float3(0.0f, _25_m31.z, 0.0f) + ((_25_m32 + _1295) - float3(0.0f, _25_m33, 0.0f));
                float _1335 = dot(_1331, _25_m26);
                float2 _1345 = ((((_1331 + (_25_m26 * (sqrt(mad(_1335, _1335, mad(_25_m31.z, _25_m31.z, -dot(_1331, _1331)))) - _1335))).xz * _25_m31.w) * 0.5f) + 0.5f.xx) + _25_m31.xy;
                _1345.x = 1.0f - _1345.x;
                _1357 = _1266 * (1.0f - clamp(lerp(_21.SampleLevel(_9, _1317, 0.0f).x, _22.SampleLevel(_9, _1345, 0.0f).x, _25_m16) * _25_m17, 0.0f, 1.0f));
            }
            else
            {
                _1357 = _1266;
            }
            uint4 _1380 = uint4(int4(_12.Load4(_671 * 16 + 0)));
            uint _1381 = _1380.x;
            uint _1382 = _1380.y;
            uint _1385 = ((_1382 >> 0u) & 4095u) + _1381;
            uint _1388 = ((_1382 >> 12u) & 4095u) + _1385;
            uint _1392 = ((_1380.z >> 0u) & 1023u) + _1388;
            float _1395 = max(0.100000001490116119384765625f, min(2.0f, _532 * _532));
            float3 _1397;
            uint _1400;
            _1397 = 0.0f.xxx;
            _1400 = _1381;
            float3 _1398;
            for (; _1400 < _1385; _1397 = _1398, _1400++)
            {
                uint _1407 = uint(int(_13.Load(_1400 * 4 + 0)));
                float _1423 = abs(asfloat(_14.Load(_1407 * 80 + 56)));
                bool _1427 = asfloat(_14.Load(_1407 * 80 + 56)) < 0.0f;
                float _1429 = abs(asfloat(_14.Load(_1407 * 80 + 48))) - 1.0f;
                if (_1429 == 0.0f)
                {
                    _1398 = _1397;
                    continue;
                }
                float3 _1438 = asfloat(_14.Load4(_1407 * 80 + 0)).xyz - _611;
                float _1439 = dot(_1438, _1438);
                float3 _1442 = _1438 * rsqrt(max(_1439, 1.0000000133514319600180897396058e-10f));
                float _1443 = asfloat(_14.Load4(_1407 * 80 + 0)).w * asfloat(_14.Load4(_1407 * 80 + 0)).w;
                float3 _1650;
                if (_1439 < (1.0f / _1443))
                {
                    float _1448 = _1427 ? 0.0f : _18_m13;
                    float _1461 = max(_1395, _1439);
                    float _1462 = _1461 * _1443;
                    float _1468 = pow(max(abs(clamp(mad(-_1462, _1462, 1.0f), 0.0f, 1.0f)), 9.9999997473787516355514526367188e-05f), asfloat(_14.Load(_1407 * 80 + 52)));
                    float _1478;
                    if (_1427)
                    {
                        _1478 = _1468 * mad(4.0f, _1443, _1423);
                    }
                    else
                    {
                        _1478 = _1468 * ((1.0f / max(_1461, 9.9999997473787516355514526367188e-05f)) + _1423);
                    }
                    float _1480 = (0.079577468335628509521484375f * _1478) * _1429;
                    float _1644;
                    if (((_14.Load(_1407 * 80 + 64) >> 1u) & 1u) != 0u)
                    {
                        uint _1505;
                        do
                        {
                            float3 _1485 = -_1442;
                            float _1486 = dot(_1485, float3(0.0f, -0.57735025882720947265625f, 0.8164966106414794921875f));
                            float _1487 = dot(_1485, float3(0.0f, -0.57735025882720947265625f, -0.8164966106414794921875f));
                            float _1488 = dot(_1485, float3(-0.8164966106414794921875f, 0.57735025882720947265625f, 0.0f));
                            float _1492 = max(max(_1486, _1487), max(_1488, dot(_1485, float3(0.8164966106414794921875f, 0.57735025882720947265625f, 0.0f))));
                            if (_1492 == _1486)
                            {
                                _1505 = 0u;
                                break;
                            }
                            else
                            {
                                if (_1492 == _1487)
                                {
                                    _1505 = 1u;
                                    break;
                                }
                                else
                                {
                                    if (_1492 == _1488)
                                    {
                                        _1505 = 2u;
                                        break;
                                    }
                                    else
                                    {
                                        _1505 = 3u;
                                        break;
                                    }
                                    break; // unreachable workaround
                                }
                                break; // unreachable workaround
                            }
                            break; // unreachable workaround
                        } while(false);
                        uint _1507 = uint(int(_14.Load(_1407 * 80 + 64) >> 2u)) + _1505;
                        float4x4 _1509 = float4x4(asfloat(_19.Load(_1507 * 96 + 0)), asfloat(_19.Load(_1507 * 96 + 16)), asfloat(_19.Load(_1507 * 96 + 32)), asfloat(_19.Load(_1507 * 96 + 48)), asfloat(_19.Load(_1507 * 96 + 4)), asfloat(_19.Load(_1507 * 96 + 20)), asfloat(_19.Load(_1507 * 96 + 36)), asfloat(_19.Load(_1507 * 96 + 52)), asfloat(_19.Load(_1507 * 96 + 8)), asfloat(_19.Load(_1507 * 96 + 24)), asfloat(_19.Load(_1507 * 96 + 40)), asfloat(_19.Load(_1507 * 96 + 56)), asfloat(_19.Load(_1507 * 96 + 12)), asfloat(_19.Load(_1507 * 96 + 28)), asfloat(_19.Load(_1507 * 96 + 44)), asfloat(_19.Load(_1507 * 96 + 60)));
                        float4 _1518 = mul(float4(_858, 1.0f), _1509);
                        float4 _1523 = mul(float4(_859, 1.0f), _1509);
                        float3 _1527 = _1518.xyz / _1518.w.xxx;
                        float3 _1531 = _1523.xyz / _1523.w.xxx;
                        float2 _1533 = mad(_1527.xy, float2(0.5f, -0.5f), 0.5f.xx);
                        float4 _1534 = float4(_1533.x, _1533.y, _261.z, _261.w);
                        float2 _1536 = mad(_1531.xy, float2(0.5f, -0.5f), 0.5f.xx);
                        float4 _1537 = float4(_1536.x, _1536.y, _261.z, _261.w);
                        float _1540 = asfloat(_19.Load2(_1507 * 96 + 84)).y / asfloat(_19.Load(_1507 * 96 + 92));
                        _1534.z = _1540 / (_1527.z - asfloat(_19.Load2(_1507 * 96 + 84)).x);
                        _1537.z = _1540 / (_1531.z - asfloat(_19.Load2(_1507 * 96 + 84)).x);
                        float4 _1550 = (_1537 - _1534) * 0.25f;
                        float4 _1552 = _1534 + (_1550 * asfloat(_5.Load4(_570 * 16 + 0)).z);
                        float2 _1554 = _1552.xy;
                        float2 _1558 = 1.0f.xx / _18_m33;
                        float2 _1560 = frac(mad(_1558, _1554, 0.5f.xx));
                        float4 _1563 = _20.GatherRed(_16, _1554);
                        float4 _1564 = _1552.z.xxxx;
                        float4 _1566 = float4(bool4(_1564.x < _1563.x, _1564.y < _1563.y, _1564.z < _1563.z, _1564.w < _1563.w));
                        float _1569 = _1560.x;
                        float4 _1577 = _1552 + _1550;
                        float2 _1578 = _1577.xy;
                        float2 _1581 = frac(mad(_1558, _1578, 0.5f.xx));
                        float4 _1583 = _20.GatherRed(_16, _1578);
                        float4 _1584 = _1577.z.xxxx;
                        float4 _1586 = float4(bool4(_1584.x < _1583.x, _1584.y < _1583.y, _1584.z < _1583.z, _1584.w < _1583.w));
                        float _1589 = _1581.x;
                        float4 _1598 = _1577 + _1550;
                        float2 _1599 = _1598.xy;
                        float2 _1602 = frac(mad(_1558, _1599, 0.5f.xx));
                        float4 _1604 = _20.GatherRed(_16, _1599);
                        float4 _1605 = _1598.z.xxxx;
                        float4 _1607 = float4(bool4(_1605.x < _1604.x, _1605.y < _1604.y, _1605.z < _1604.z, _1605.w < _1604.w));
                        float _1610 = _1602.x;
                        float4 _1619 = _1598 + _1550;
                        float2 _1620 = _1619.xy;
                        float2 _1623 = frac(mad(_1558, _1620, 0.5f.xx));
                        float4 _1625 = _20.GatherRed(_16, _1620);
                        float4 _1626 = _1619.z.xxxx;
                        float4 _1628 = float4(bool4(_1626.x < _1625.x, _1626.y < _1625.y, _1626.z < _1625.z, _1626.w < _1625.w));
                        float _1631 = _1623.x;
                        _1644 = _1480 * lerp(1.0f, (((clamp(lerp(lerp(_1566.w, _1566.z, _1569), lerp(_1566.x, _1566.y, _1569), _1560.y), 0.0f, 1.0f) + clamp(lerp(lerp(_1586.w, _1586.z, _1589), lerp(_1586.x, _1586.y, _1589), _1581.y), 0.0f, 1.0f)) + clamp(lerp(lerp(_1607.w, _1607.z, _1610), lerp(_1607.x, _1607.y, _1610), _1602.y), 0.0f, 1.0f)) + clamp(lerp(lerp(_1628.w, _1628.z, _1631), lerp(_1628.x, _1628.y, _1631), _1623.y), 0.0f, 1.0f)) * 0.25f, min(_618, asfloat(_14.Load(_1407 * 80 + 68))));
                    }
                    else
                    {
                        _1644 = _1480;
                    }
                    _1650 = _1397 + (asfloat(_14.Load4(_1407 * 80 + 16)).xyz * ((_1644 * (mad(-_1448, _1448, 1.0f) / (12.56637096405029296875f * pow(max(abs(mad(2.0f * _1448, -dot(_608, _1442), mad(_1448, _1448, 1.0f))), 9.9999997473787516355514526367188e-05f), 1.5f)))) * ((asfloat(_14.Load(_1407 * 80 + 48)) < 0.0f) ? asfloat(_8.Load(0)) : 1.0f)));
                }
                else
                {
                    _1650 = _1397;
                }
                _1398 = _1650;
            }
            float3 _1652;
            uint _1655;
            _1652 = _1397;
            _1655 = _1400;
            float3 _1653;
            for (; _1655 < _1388; _1652 = _1653, _1655++)
            {
                uint _1662 = uint(int(_13.Load(_1655 * 4 + 0)));
                float _1680 = abs(asfloat(_14.Load(_1662 * 80 + 56)));
                bool _1687 = asfloat(_14.Load(_1662 * 80 + 56)) < 0.0f;
                float _1689 = abs(asfloat(_14.Load(_1662 * 80 + 48))) - 1.0f;
                if (_1689 == 0.0f)
                {
                    _1653 = _1652;
                    continue;
                }
                float3 _1698 = asfloat(_14.Load4(_1662 * 80 + 0)).xyz - _611;
                float _1699 = dot(_1698, _1698);
                float3 _1702 = _1698 * rsqrt(max(_1699, 1.0000000133514319600180897396058e-10f));
                float _1703 = asfloat(_14.Load4(_1662 * 80 + 0)).w * asfloat(_14.Load4(_1662 * 80 + 0)).w;
                float3 _1900;
                if (_1699 < (1.0f / _1703))
                {
                    float _1708 = _1687 ? 0.0f : _18_m13;
                    float _1721 = max(_1395, _1699);
                    float _1724 = dot(-_1702, normalize(asfloat(_14.Load4(_1662 * 80 + 32)).xyz));
                    float _1752;
                    if (_1724 > asfloat(_14.Load4(_1662 * 80 + 16)).w)
                    {
                        float _1728 = _1721 * _1703;
                        float _1734 = pow(max(abs(clamp(mad(-_1728, _1728, 1.0f), 0.0f, 1.0f)), 9.9999997473787516355514526367188e-05f), asfloat(_14.Load(_1662 * 80 + 52)));
                        float _1744;
                        if (_1687)
                        {
                            _1744 = _1734 * mad(4.0f, _1703, _1680);
                        }
                        else
                        {
                            _1744 = _1734 * ((1.0f / max(_1721, 9.9999997473787516355514526367188e-05f)) + _1680);
                        }
                        float _1749 = clamp((_1724 - asfloat(_14.Load4(_1662 * 80 + 16)).w) / max(asfloat(_14.Load4(_1662 * 80 + 32)).w - asfloat(_14.Load4(_1662 * 80 + 16)).w, 9.9999997473787516355514526367188e-05f), 0.0f, 1.0f);
                        _1752 = _1744 * (_1749 * _1749);
                    }
                    else
                    {
                        _1752 = 0.0f;
                    }
                    float _1754 = (0.3183098733425140380859375f * _1752) * _1689;
                    float _1894;
                    if (((_14.Load(_1662 * 80 + 64) >> 1u) & 1u) != 0u)
                    {
                        uint _1757 = uint(int(_14.Load(_1662 * 80 + 64) >> 2u));
                        float4x4 _1759 = float4x4(asfloat(_19.Load(_1757 * 96 + 0)), asfloat(_19.Load(_1757 * 96 + 16)), asfloat(_19.Load(_1757 * 96 + 32)), asfloat(_19.Load(_1757 * 96 + 48)), asfloat(_19.Load(_1757 * 96 + 4)), asfloat(_19.Load(_1757 * 96 + 20)), asfloat(_19.Load(_1757 * 96 + 36)), asfloat(_19.Load(_1757 * 96 + 52)), asfloat(_19.Load(_1757 * 96 + 8)), asfloat(_19.Load(_1757 * 96 + 24)), asfloat(_19.Load(_1757 * 96 + 40)), asfloat(_19.Load(_1757 * 96 + 56)), asfloat(_19.Load(_1757 * 96 + 12)), asfloat(_19.Load(_1757 * 96 + 28)), asfloat(_19.Load(_1757 * 96 + 44)), asfloat(_19.Load(_1757 * 96 + 60)));
                        float4 _1768 = mul(float4(_858, 1.0f), _1759);
                        float4 _1773 = mul(float4(_859, 1.0f), _1759);
                        float3 _1777 = _1768.xyz / _1768.w.xxx;
                        float3 _1781 = _1773.xyz / _1773.w.xxx;
                        float2 _1783 = mad(_1777.xy, float2(0.5f, -0.5f), 0.5f.xx);
                        float4 _1784 = float4(_1783.x, _1783.y, _261.z, _261.w);
                        float2 _1786 = mad(_1781.xy, float2(0.5f, -0.5f), 0.5f.xx);
                        float4 _1787 = float4(_1786.x, _1786.y, _261.z, _261.w);
                        float _1790 = asfloat(_19.Load2(_1757 * 96 + 84)).y / asfloat(_19.Load(_1757 * 96 + 92));
                        _1784.z = _1790 / (_1777.z - asfloat(_19.Load2(_1757 * 96 + 84)).x);
                        _1787.z = _1790 / (_1781.z - asfloat(_19.Load2(_1757 * 96 + 84)).x);
                        float4 _1800 = (_1787 - _1784) * 0.25f;
                        float4 _1802 = _1784 + (_1800 * asfloat(_5.Load4(_570 * 16 + 0)).z);
                        float2 _1804 = _1802.xy;
                        float2 _1808 = 1.0f.xx / _18_m33;
                        float2 _1810 = frac(mad(_1808, _1804, 0.5f.xx));
                        float4 _1813 = _20.GatherRed(_16, _1804);
                        float4 _1814 = _1802.z.xxxx;
                        float4 _1816 = float4(bool4(_1814.x < _1813.x, _1814.y < _1813.y, _1814.z < _1813.z, _1814.w < _1813.w));
                        float _1819 = _1810.x;
                        float4 _1827 = _1802 + _1800;
                        float2 _1828 = _1827.xy;
                        float2 _1831 = frac(mad(_1808, _1828, 0.5f.xx));
                        float4 _1833 = _20.GatherRed(_16, _1828);
                        float4 _1834 = _1827.z.xxxx;
                        float4 _1836 = float4(bool4(_1834.x < _1833.x, _1834.y < _1833.y, _1834.z < _1833.z, _1834.w < _1833.w));
                        float _1839 = _1831.x;
                        float4 _1848 = _1827 + _1800;
                        float2 _1849 = _1848.xy;
                        float2 _1852 = frac(mad(_1808, _1849, 0.5f.xx));
                        float4 _1854 = _20.GatherRed(_16, _1849);
                        float4 _1855 = _1848.z.xxxx;
                        float4 _1857 = float4(bool4(_1855.x < _1854.x, _1855.y < _1854.y, _1855.z < _1854.z, _1855.w < _1854.w));
                        float _1860 = _1852.x;
                        float4 _1869 = _1848 + _1800;
                        float2 _1870 = _1869.xy;
                        float2 _1873 = frac(mad(_1808, _1870, 0.5f.xx));
                        float4 _1875 = _20.GatherRed(_16, _1870);
                        float4 _1876 = _1869.z.xxxx;
                        float4 _1878 = float4(bool4(_1876.x < _1875.x, _1876.y < _1875.y, _1876.z < _1875.z, _1876.w < _1875.w));
                        float _1881 = _1873.x;
                        _1894 = _1754 * lerp(1.0f, (((clamp(lerp(lerp(_1816.w, _1816.z, _1819), lerp(_1816.x, _1816.y, _1819), _1810.y), 0.0f, 1.0f) + clamp(lerp(lerp(_1836.w, _1836.z, _1839), lerp(_1836.x, _1836.y, _1839), _1831.y), 0.0f, 1.0f)) + clamp(lerp(lerp(_1857.w, _1857.z, _1860), lerp(_1857.x, _1857.y, _1860), _1852.y), 0.0f, 1.0f)) + clamp(lerp(lerp(_1878.w, _1878.z, _1881), lerp(_1878.x, _1878.y, _1881), _1873.y), 0.0f, 1.0f)) * 0.25f, min(_618, asfloat(_14.Load(_1662 * 80 + 68))));
                    }
                    else
                    {
                        _1894 = _1754;
                    }
                    _1900 = _1652 + (asfloat(_14.Load4(_1662 * 80 + 16)).xyz * ((_1894 * (mad(-_1708, _1708, 1.0f) / (12.56637096405029296875f * pow(max(abs(mad(2.0f * _1708, -dot(_608, _1702), mad(_1708, _1708, 1.0f))), 9.9999997473787516355514526367188e-05f), 1.5f)))) * ((asfloat(_14.Load(_1662 * 80 + 48)) < 0.0f) ? asfloat(_8.Load(0)) : 1.0f)));
                }
                else
                {
                    _1900 = _1652;
                }
                _1653 = _1900;
            }
            float3 _1902;
            _1902 = _1652;
            float3 _1903;
            for (uint _1905 = _1655; _1905 < _1392; _1902 = _1903, _1905++)
            {
                _50 _1914;
                _1914._m0 = asfloat(_15.Load3(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 0));
                _1914._m1 = _15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 12);
                _1914._m2 = asfloat(_15.Load4(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 16));
                _1914._m3 = asfloat(_15.Load2(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 32));
                _1914._m4 = _15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 40);
                _1914._m5 = asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 44));
                _1914._m6 = float4x3(asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 48)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 64)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 80)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 52)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 68)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 84)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 56)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 72)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 88)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 60)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 76)), asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 92)));
                _1914._m7 = asfloat(_15.Load3(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 96));
                _1914._m8 = _15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 108);
                _1914._m9 = asfloat(_15.Load3(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 112));
                _1914._m10 = asfloat(_15.Load(uint(int(_13.Load(_1905 * 4 + 0))) * 128 + 124));
                float _1929 = abs(_1914._m10) - 1.0f;
                int _1938 = int(_1914._m1 >> 1u) - 1;
                if (_1929 == 0.0f)
                {
                    _1903 = _1902;
                    continue;
                }
                float3 _1946 = mul(float4(_611, 1.0f), _1914._m6);
                float3 _1948 = abs(_1946 - 0.5f.xxx);
                float3 _2234;
                if (all(bool3(_1948.x < 0.5f.xxx.x, _1948.y < 0.5f.xxx.y, _1948.z < 0.5f.xxx.z)))
                {
                    float _1953 = (_1914._m10 < 0.0f) ? 0.0f : _18_m13;
                    int _1966 = int(_1914._m4 >> 24u);
                    float _1967 = _1946.z;
                    float3 _2006;
                    if (_1967 < _1914._m2.x)
                    {
                        float _1994 = _1967 * _1914._m2.z;
                        float _1997 = _1994 * _1994;
                        float3 _2005;
                        _2005.z = dot(_247[_1966], float4(_1994, _1997, smoothstep(0.0f, 1.0f, _1994), (_1997 * _1994) * mad(_1994, mad(_1994, 6.0f, -15.0f), 10.0f)));
                        _2006 = _2005;
                    }
                    else
                    {
                        float3 _1992;
                        if (_1967 > _1914._m2.y)
                        {
                            float _1980 = (1.0f - _1967) * _1914._m2.w;
                            float _1983 = _1980 * _1980;
                            float3 _1991;
                            _1991.z = dot(_247[_1966], float4(_1980, _1983, smoothstep(0.0f, 1.0f, _1980), (_1983 * _1980) * mad(_1980, mad(_1980, 6.0f, -15.0f), 10.0f)));
                            _1992 = _1991;
                        }
                        else
                        {
                            _1992 = float3(0.0f, 0.0f, 1.0f);
                        }
                        _2006 = _1992;
                    }
                    float2 _2011 = (0.5f.xx - abs(_1946.xy - 0.5f.xx)) * _1914._m3;
                    float _2012 = _2011.x;
                    float3 _2029;
                    if (_2012 < 1.0f)
                    {
                        float _2020 = _2012 * _2012;
                        float3 _2028 = _2006;
                        _2028.x = dot(_247[_1966], float4(_2012, _2020, smoothstep(0.0f, 1.0f, _2012), (_2020 * _2012) * mad(_2012, mad(_2012, 6.0f, -15.0f), 10.0f)));
                        _2029 = _2028;
                    }
                    else
                    {
                        float3 _2017 = _2006;
                        _2017.x = 1.0f;
                        _2029 = _2017;
                    }
                    float _2030 = _2011.y;
                    float3 _2047;
                    if (_2030 < 1.0f)
                    {
                        float _2038 = _2030 * _2030;
                        float3 _2046 = _2029;
                        _2046.y = dot(_247[_1966], float4(_2030, _2038, smoothstep(0.0f, 1.0f, _2030), (_2038 * _2030) * mad(_2030, mad(_2030, 6.0f, -15.0f), 10.0f)));
                        _2047 = _2046;
                    }
                    else
                    {
                        float3 _2035 = _2029;
                        _2035.y = 1.0f;
                        _2047 = _2035;
                    }
                    float _2053 = ((_2047.x * _2047.y) * _2047.z) * _1929;
                    float _2186;
                    if (((_1914._m8 >> 1u) & 1u) != 0u)
                    {
                        uint _2056 = uint(int(_1914._m8 >> 2u));
                        float4x4 _2058 = float4x4(asfloat(_19.Load(_2056 * 96 + 0)), asfloat(_19.Load(_2056 * 96 + 16)), asfloat(_19.Load(_2056 * 96 + 32)), asfloat(_19.Load(_2056 * 96 + 48)), asfloat(_19.Load(_2056 * 96 + 4)), asfloat(_19.Load(_2056 * 96 + 20)), asfloat(_19.Load(_2056 * 96 + 36)), asfloat(_19.Load(_2056 * 96 + 52)), asfloat(_19.Load(_2056 * 96 + 8)), asfloat(_19.Load(_2056 * 96 + 24)), asfloat(_19.Load(_2056 * 96 + 40)), asfloat(_19.Load(_2056 * 96 + 56)), asfloat(_19.Load(_2056 * 96 + 12)), asfloat(_19.Load(_2056 * 96 + 28)), asfloat(_19.Load(_2056 * 96 + 44)), asfloat(_19.Load(_2056 * 96 + 60)));
                        float4 _2067 = mul(float4(_858, 1.0f), _2058);
                        float4 _2072 = mul(float4(_859, 1.0f), _2058);
                        float2 _2074 = mad(_2067.xy, float2(0.5f, -0.5f), 0.5f.xx);
                        float4 _2075 = float4(_2074.x, _2074.y, _2067.z, _2067.w);
                        float2 _2077 = mad(_2072.xy, float2(0.5f, -0.5f), 0.5f.xx);
                        float4 _2078 = float4(_2077.x, _2077.y, _2072.z, _2072.w);
                        _2075.z = ((_2067.z - asfloat(_19.Load2(_2056 * 96 + 84)).y) / asfloat(_19.Load2(_2056 * 96 + 84)).x) / asfloat(_19.Load(_2056 * 96 + 92));
                        _2078.z = ((_2072.z - asfloat(_19.Load2(_2056 * 96 + 84)).y) / asfloat(_19.Load2(_2056 * 96 + 84)).x) / asfloat(_19.Load(_2056 * 96 + 92));
                        float4 _2092 = (_2078 - _2075) * 0.25f;
                        float4 _2094 = _2075 + (_2092 * asfloat(_5.Load4(_570 * 16 + 0)).z);
                        float2 _2096 = _2094.xy;
                        float2 _2100 = 1.0f.xx / _18_m33;
                        float2 _2102 = frac(mad(_2100, _2096, 0.5f.xx));
                        float4 _2105 = _20.GatherRed(_16, _2096);
                        float4 _2106 = _2094.z.xxxx;
                        float4 _2108 = float4(bool4(_2106.x < _2105.x, _2106.y < _2105.y, _2106.z < _2105.z, _2106.w < _2105.w));
                        float _2111 = _2102.x;
                        float4 _2119 = _2094 + _2092;
                        float2 _2120 = _2119.xy;
                        float2 _2123 = frac(mad(_2100, _2120, 0.5f.xx));
                        float4 _2125 = _20.GatherRed(_16, _2120);
                        float4 _2126 = _2119.z.xxxx;
                        float4 _2128 = float4(bool4(_2126.x < _2125.x, _2126.y < _2125.y, _2126.z < _2125.z, _2126.w < _2125.w));
                        float _2131 = _2123.x;
                        float4 _2140 = _2119 + _2092;
                        float2 _2141 = _2140.xy;
                        float2 _2144 = frac(mad(_2100, _2141, 0.5f.xx));
                        float4 _2146 = _20.GatherRed(_16, _2141);
                        float4 _2147 = _2140.z.xxxx;
                        float4 _2149 = float4(bool4(_2147.x < _2146.x, _2147.y < _2146.y, _2147.z < _2146.z, _2147.w < _2146.w));
                        float _2152 = _2144.x;
                        float4 _2161 = _2140 + _2092;
                        float2 _2162 = _2161.xy;
                        float2 _2165 = frac(mad(_2100, _2162, 0.5f.xx));
                        float4 _2167 = _20.GatherRed(_16, _2162);
                        float4 _2168 = _2161.z.xxxx;
                        float4 _2170 = float4(bool4(_2168.x < _2167.x, _2168.y < _2167.y, _2168.z < _2167.z, _2168.w < _2167.w));
                        float _2173 = _2165.x;
                        _2186 = _2053 * lerp(1.0f, (((clamp(lerp(lerp(_2108.w, _2108.z, _2111), lerp(_2108.x, _2108.y, _2111), _2102.y), 0.0f, 1.0f) + clamp(lerp(lerp(_2128.w, _2128.z, _2131), lerp(_2128.x, _2128.y, _2131), _2123.y), 0.0f, 1.0f)) + clamp(lerp(lerp(_2149.w, _2149.z, _2152), lerp(_2149.x, _2149.y, _2152), _2144.y), 0.0f, 1.0f)) + clamp(lerp(lerp(_2170.w, _2170.z, _2173), lerp(_2170.x, _2170.y, _2173), _2165.y), 0.0f, 1.0f)) * 0.25f, min(_618, _1914._m5));
                    }
                    else
                    {
                        _2186 = _2053;
                    }
                    float3 _2228;
                    if (_1938 >= 0)
                    {
                        float2 _2200 = mul(float4(_858, 1.0f), _1914._m6).xy;
                        float2 _2203 = (mul(float4(_859, 1.0f), _1914._m6).xy - _2200) * 0.25f;
                        float2 _2205 = _2200 + (_2203 * asfloat(_5.Load4(_570 * 16 + 0)).z);
                        int _69 = _1938;
                        float2 _2209 = _2205 + _2203;
                        float2 _2216 = _2209 + _2203;
                        _2228 = _1914._m0 * ((((_23[NonUniformResourceIndex(_69)].SampleLevel(_9, _2205, 4.0f).xyz + _23[_1938].SampleLevel(_9, _2209, 4.0f).xyz) + _23[_1938].SampleLevel(_9, _2216, 4.0f).xyz) + _23[_1938].SampleLevel(_9, _2216 + _2203, 4.0f).xyz) * 0.25f);
                    }
                    else
                    {
                        _2228 = _1914._m0;
                    }
                    _2234 = _1902 + (_2228 * ((_2186 * (mad(-_1953, _1953, 1.0f) / (12.56637096405029296875f * pow(max(abs(mad(2.0f * _1953, -dot(_608, _1914._m9), mad(_1953, _1953, 1.0f))), 9.9999997473787516355514526367188e-05f), 1.5f)))) * (((_1914._m1 & 1u) != 0u) ? asfloat(_8.Load(0)) : 1.0f)));
                }
                else
                {
                    _2234 = _1902;
                }
                _1903 = _2234;
            }
            _540 = _539 + (((((_690 * 100.0f) + (((_1180 * _25_m22) * (mad(-_18_m13, _18_m13, 1.0f) / (12.56637096405029296875f * pow(max(abs(mad(2.0f * _18_m13, -dot(_25_m0, _608), mad(_18_m13, _18_m13, 1.0f))), 9.9999997473787516355514526367188e-05f), 1.5f)))) * _1357)) * asfloat(_8.Load(0))) + _1902) * _526);
        }
        _32[_282 + uint3(_27_m5, 0u, 0u)] = float4(min(_539, float3(65024.0f, 65024.0f, 64512.0f)), 0.0f);
        break;
    } while(false);
}

[numthreads(4, 4, 4)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}

