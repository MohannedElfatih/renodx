

struct _19
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

struct _22
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

struct _26
{
    float4 _m0;
    column_major float4x3 _m1;
    float4 _m2[4];
    float _m3;
    float _m4;
    uint _m5;
    uint _m6;
};

struct _40
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

struct _103
{
    float4 _m0;
    float4 _m1;
    float4 _m2;
    float4 _m3;
};

[[vk::binding(28, 1)]]
ByteAddressBuffer _5 : register(t28, space1);
[[vk::binding(32, 1)]]
ByteAddressBuffer _6 : register(t32, space1);
[[vk::binding(36, 1)]]
ByteAddressBuffer _7 : register(t36, space1);
[[vk::binding(42, 1)]]
cbuffer _30_8 : register(b42, space1)
{
    float _8_m0 : packoffset(c0);
    float _8_m1 : packoffset(c0.y);
    float _8_m2 : packoffset(c0.z);
    float _8_m3 : packoffset(c0.w);
    float _8_m4 : packoffset(c1);
    float _8_m5 : packoffset(c1.y);
    float _8_m6 : packoffset(c1.z);
    float _8_m7 : packoffset(c1.w);
    float4 _8_m8 : packoffset(c2);
    float4 _8_m9 : packoffset(c3);
    column_major float4x4 _8_m10[4] : packoffset(c4);
    float _8_m11 : packoffset(c20);
    float _8_m12 : packoffset(c20.y);
    float _8_m13 : packoffset(c20.z);
    uint _8_m14 : packoffset(c20.w);
    float2 _8_m15 : packoffset(c21);
    float2 _8_m16 : packoffset(c21.z);
    float3 _8_m17 : packoffset(c22);
    float _8_m18 : packoffset(c22.w);
    column_major float4x3 _8_m19 : packoffset(c23);
    float4 _8_m20[4] : packoffset(c26);
    float _8_m21 : packoffset(c30);
    float _8_m22 : packoffset(c30.y);
    float _8_m23 : packoffset(c30.z);
    float _8_m24 : packoffset(c30.w);
    uint _8_m25 : packoffset(c31);
    uint _8_m26 : packoffset(c31.y);
    float _8_m27 : packoffset(c31.z);
    float _8_m28 : packoffset(c31.w);
    float _8_m29 : packoffset(c32);
    float _8_m30 : packoffset(c32.y);
    float _8_m31 : packoffset(c32.z);
    float _8_m32 : packoffset(c32.w);
    float2 _8_m33 : packoffset(c33);
    float2 _8_m34 : packoffset(c33.z);
};

[[vk::binding(1, 0)]]
cbuffer _32_9 : register(b1, space0)
{
    float3 _9_m0 : packoffset(c0);
    float _9_m1 : packoffset(c0.w);
    float3 _9_m2 : packoffset(c1);
    float _9_m3 : packoffset(c1.w);
    float3 _9_m4 : packoffset(c2);
    float _9_m5 : packoffset(c2.w);
    column_major float4x4 _9_m6 : packoffset(c3);
    float4 _9_m7[3] : packoffset(c7);
    float4 _9_m8 : packoffset(c10);
    float4 _9_m9 : packoffset(c11);
    float _9_m10 : packoffset(c12);
    float _9_m11 : packoffset(c12.y);
    float _9_m12 : packoffset(c12.z);
    float _9_m13 : packoffset(c12.w);
    float _9_m14 : packoffset(c13);
    float _9_m15 : packoffset(c13.y);
    float _9_m16 : packoffset(c13.z);
    float _9_m17 : packoffset(c13.w);
    float4 _9_m18 : packoffset(c14);
    float _9_m19 : packoffset(c15);
    float _9_m20 : packoffset(c15.y);
    float _9_m21 : packoffset(c15.z);
    float _9_m22 : packoffset(c15.w);
    float4 _9_m23 : packoffset(c16);
    float3 _9_m24 : packoffset(c17);
    float _9_m25 : packoffset(c17.w);
    float3 _9_m26 : packoffset(c18);
    float _9_m27 : packoffset(c18.w);
    float4 _9_m28 : packoffset(c19);
    float3 _9_m29 : packoffset(c20);
    float _9_m30 : packoffset(c20.w);
    float4 _9_m31 : packoffset(c21);
    float3 _9_m32 : packoffset(c22);
    float _9_m33 : packoffset(c22.w);
    float3 _9_m34 : packoffset(c23);
    float _9_m35 : packoffset(c23.w);
    float3 _9_m36 : packoffset(c24);
    float _9_m37 : packoffset(c24.w);
};

[[vk::binding(2, 0)]]
cbuffer _33_10 : register(b2, space0)
{
    column_major float4x4 _10_m0 : packoffset(c0);
    column_major float4x4 _10_m1 : packoffset(c4);
    column_major float4x4 _10_m2 : packoffset(c8);
    float _10_m3 : packoffset(c12);
    float _10_m4 : packoffset(c12.y);
    float2 _10_m5 : packoffset(c12.z);
    float3 _10_m6 : packoffset(c13);
    int _10_m7 : packoffset(c13.w);
};

[[vk::binding(4, 0)]]
cbuffer _34_11 : register(b4, space0)
{
    float2 _11_m0 : packoffset(c0);
    float2 _11_m1 : packoffset(c0.z);
    uint2 _11_m2 : packoffset(c1);
    uint2 _11_m3 : packoffset(c1.z);
    uint2 _11_m4 : packoffset(c2);
    uint _11_m5 : packoffset(c2.z);
    uint _11_m6 : packoffset(c2.w);
    float2 _11_m7 : packoffset(c3);
    float2 _11_m8 : packoffset(c3.z);
    float2 _11_m9 : packoffset(c4);
    float2 _11_m10 : packoffset(c4.z);
    float2 _11_m11 : packoffset(c5);
    float2 _11_m12 : packoffset(c5.z);
    float2 _11_m13 : packoffset(c6);
    float2 _11_m14 : packoffset(c6.z);
    float2 _11_m15 : packoffset(c7);
    float2 _11_m16 : packoffset(c7.z);
    uint2 _11_m17 : packoffset(c8);
    uint2 _11_m18 : packoffset(c8.z);
    uint2 _11_m19 : packoffset(c9);
    uint2 _11_m20 : packoffset(c9.z);
    float2 _11_m21 : packoffset(c10);
    float2 _11_m22 : packoffset(c10.z);
};

[[vk::binding(0, 1)]]
RWByteAddressBuffer _12 : register(u0, space1);
[[vk::binding(1, 1)]]
RWByteAddressBuffer _13 : register(u1, space1);
[[vk::binding(2, 1)]]
RWByteAddressBuffer _14 : register(u2, space1);
[[vk::binding(3, 1)]]
cbuffer _39_15 : register(b3, space1)
{
    float2 _15_m0 : packoffset(c0);
    uint _15_m1 : packoffset(c0.z);
    uint _15_m2 : packoffset(c0.w);
    uint _15_m3 : packoffset(c1);
    uint _15_m4 : packoffset(c1.y);
    uint _15_m5 : packoffset(c1.z);
    uint _15_m6 : packoffset(c1.w);
};

[[vk::binding(4, 1)]]
ByteAddressBuffer _16 : register(t4, space1);

static uint3 gl_GlobalInvocationID = (uint3)0;
static uint gl_LocalInvocationIndex = (uint)0;
struct SPIRV_Cross_Input
{
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
    uint gl_LocalInvocationIndex : SV_GroupIndex;
};

groupshared _103 _125[64];

void comp_main()
{
    uint _139 = (63u + _15_m1) / 64u;
    uint _143 = (63u + _15_m2) / 64u;
    uint _147 = (63u + _15_m3) / 64u;
    uint _151 = (63u + _15_m4) / 64u;
    uint _155 = (63u + _15_m5) / 64u;
    uint2 _160 = _8_m25.xx;
    uint2 _164 = _11_m4 / _160;
    uint3 _168 = gl_GlobalInvocationID + uint3(_11_m3 / _160, 0u);
    uint _169 = _168.z;
    uint2 _182 = _168.xy;
    float2 _183 = float2(_182);
    float2 _186 = _183 * _15_m0;
    float2 _188 = min(mad(_183, _15_m0, _15_m0), 1.0f.xx);
    float _197 = exp2((float(_169 + 1u) - _8_m22) / _8_m21);
    float _204 = (_169 == 0u) ? _10_m3 : (_197 * exp2((-1.0f) / _8_m21));
    float _207 = 1.0f / _10_m4;
    float _208 = _197 * _207;
    float _209 = _204 * _207;
    float2 _217 = (mad(_183, _15_m0, -_11_m1) / _11_m0) * 0.5f;
    float _221 = _217.x;
    float _223 = _217.y;
    float3 _235 = ((_9_m7[0].xyz * ((1.0f - _221) - _223)) + (_9_m7[1].xyz * _221)) + (_9_m7[2].xyz * _223);
    float _237 = _188.x;
    float _238 = _186.x;
    float3 _245 = _235 + ((_9_m7[1].xyz - _9_m7[0].xyz) * (((_237 - _238) / _11_m0.x) * 0.5f));
    float _247 = _188.y;
    float _248 = _186.y;
    float3 _255 = _235 + ((_9_m7[2].xyz - _9_m7[0].xyz) * (((_247 - _248) / _11_m0.y) * 0.5f));
    float3 _257 = (_245 + _255) - _235;
    float3 _258 = _235 * _209;
    float3 _259 = _245 * _209;
    float3 _260 = _257 * _209;
    float3 _261 = _255 * _209;
    float3 _262 = _235 * _208;
    float3 _263 = _245 * _208;
    float3 _264 = _257 * _208;
    float3 _265 = _255 * _208;
    float3 _268 = ((_258 + _259) + _260) + _261;
    float3 _271 = ((_262 + _263) + _264) + _265;
    float3 _278 = ((_268 * _209) + (_271 * _208)) / (4.0f * mad(_204, _207, _208)).xxx;
    float3 _280 = (_268 + _271) * 0.125f;
    float3 _281 = _258 - _278;
    float3 _283 = _262 - _278;
    float3 _285 = _261 - _278;
    float3 _287 = _265 - _278;
    float3 _290 = _259 - _278;
    float3 _292 = _263 - _278;
    float3 _294 = _260 - _278;
    float3 _296 = _264 - _278;
    float3 _299 = _258 - _280;
    float3 _301 = _262 - _280;
    float3 _303 = _261 - _280;
    float3 _305 = _265 - _280;
    float3 _308 = _259 - _280;
    float3 _310 = _263 - _280;
    float3 _312 = _260 - _280;
    float3 _314 = _264 - _280;
    float4 _317 = max(float4(dot(_281, _281), dot(_283, _283), dot(_285, _285), dot(_287, _287)), float4(dot(_290, _290), dot(_292, _292), dot(_294, _294), dot(_296, _296)));
    float4 _318 = max(float4(dot(_299, _299), dot(_301, _301), dot(_303, _303), dot(_305, _305)), float4(dot(_308, _308), dot(_310, _310), dot(_312, _312), dot(_314, _314)));
    float2 _321 = max(_317.xy, _317.zw);
    float2 _324 = max(_318.xy, _318.zw);
    float2 _328 = max(float4(_321.x, _321.y, _324.x, _324.y).xz, float4(_321.x, _321.y, _324.x, _324.y).yw);
    float _329 = _328.x;
    float _330 = _328.y;
    bool _331 = _329 < _330;
    bool3 _332 = _331.xxx;
    float3 _333 = float3(_332.x ? _278.x : _280.x, _332.y ? _278.y : _280.y, _332.z ? _278.z : _280.z);
    float _334 = _331 ? _329 : _330;
    float _335 = sqrt(_334);
    float _343 = -mad((_238 - _11_m1.x) / _11_m0.x, 2.0f, -1.0f);
    float _349 = -mad((_248 - _11_m1.y) / _11_m0.y, 2.0f, -1.0f);
    float _352 = mad((_237 - _11_m1.x) / _11_m0.x, 2.0f, -1.0f);
    float _355 = mad((_247 - _11_m1.y) / _11_m0.y, 2.0f, -1.0f);
    float4 _359 = (_10_m2[3] * _343) + _10_m2[0];
    float4 _361 = (_10_m2[3] * _352) - _10_m2[0];
    float4 _364 = (_10_m2[3] * _349) - _10_m2[1];
    float4 _366 = (_10_m2[3] * _355) + _10_m2[1];
    float4 _367 = _10_m2[2];
    float4 _371 = _367;
    _371.w = -dot(_367.xyz, _262);
    float4 _372 = _10_m2[3] - _367;
    _372.w = -dot(_372.xyz, _258);
    float3 _377 = _359.xyz;
    float4 _380 = _359 * rsqrt(dot(_377, _377));
    float3 _381 = _361.xyz;
    float4 _384 = _361 * rsqrt(dot(_381, _381));
    float3 _385 = _364.xyz;
    float4 _388 = _364 * rsqrt(dot(_385, _385));
    float3 _389 = _366.xyz;
    float4 _392 = _366 * rsqrt(dot(_389, _389));
    float4 _396 = _371 * rsqrt(dot(_371.xyz, _371.xyz));
    float4 _400 = _372 * rsqrt(dot(_372.xyz, _372.xyz));
    float3 _407 = float3(_9_m6[0].x, _9_m6[1].x, _9_m6[2].x);
    float3 _414 = float3(_9_m6[0].y, _9_m6[1].y, _9_m6[2].y);
    bool3 _416 = (_343 <= 0.0f).xxx;
    float4 _420 = float4(_9_m6[0].x, _9_m6[1].x, _9_m6[2].x, -dot(_407, float3(_416.x ? _258.x : _262.x, _416.y ? _258.y : _262.y, _416.z ? _258.z : _262.z)));
    bool3 _423 = (_352 <= 0.0f).xxx;
    float4 _429 = float4(-_407, dot(_407, float3(_423.x ? _260.x : _264.x, _423.y ? _260.y : _264.y, _423.z ? _260.z : _264.z)));
    bool3 _431 = (_355 <= 0.0f).xxx;
    float4 _435 = float4(_9_m6[0].y, _9_m6[1].y, _9_m6[2].y, -dot(_414, float3(_431.x ? _260.x : _264.x, _431.y ? _260.y : _264.y, _431.z ? _260.z : _264.z)));
    bool3 _438 = (_349 <= 0.0f).xxx;
    float4 _444 = float4(-_414, dot(_414, float3(_438.x ? _258.x : _262.x, _438.y ? _258.y : _262.y, _438.z ? _258.z : _262.z)));
    bool _450 = all(bool2(_182.x <= _164.x, _182.y <= _164.y)) && (_169 <= _8_m26);
    uint _452;
    _452 = 0u;
    uint _453;
    for (uint _455 = 0u; _455 < _139; _452 = _453, _455++)
    {
        uint _460 = _455 * 64u;
        uint _462 = min((_15_m1 - _460), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _462)
        {
            uint _466 = _460 + gl_LocalInvocationIndex;
            _125[gl_LocalInvocationIndex]._m0 = float4(asfloat(_5.Load4(_466 * 80 + 0)).xyz, 1.0f / asfloat(_5.Load4(_466 * 80 + 0)).w);
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _479;
            _479 = _452;
            for (uint _482 = 0u; _482 < _462; )
            {
                float3 _490 = _333 - _125[_482]._m0.xyz;
                float _492 = _335 + _125[_482]._m0.w;
                float4 _499 = float4(_125[_482]._m0.xyz, 1.0f);
                float _501 = -_125[_482]._m0.w;
                _479 += uint(((((((((((dot(_490, _490) < (_492 * _492)) && (dot(_499, _380) > _501)) && (dot(_499, _384) > _501)) && (dot(_499, _388) > _501)) && (dot(_499, _392) > _501)) && (dot(_499, _396) > _501)) && (dot(_499, _400) > _501)) && (dot(_499, _420) > _501)) && (dot(_499, _429) > _501)) && (dot(_499, _435) > _501)) && (dot(_499, _444) > _501));
                _482++;
                continue;
            }
            _453 = _479;
        }
        else
        {
            _453 = _452;
        }
    }
    uint _533;
    _533 = _452;
    uint _534;
    for (uint _536 = 0u; _536 < _143; _533 = _534, _536++)
    {
        uint _541 = _536 * 64u;
        uint _543 = min((_15_m2 - _541), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _543)
        {
            uint _548 = (_15_m1 + _541) + gl_LocalInvocationIndex;
            float _557 = 1.0f / asfloat(_5.Load4(_548 * 80 + 0)).w;
            float _560 = sqrt(mad(-asfloat(_5.Load4(_548 * 80 + 16)).w, asfloat(_5.Load4(_548 * 80 + 16)).w, 1.0f));
            float _561 = 1.0f / asfloat(_5.Load4(_548 * 80 + 16)).w;
            float _570;
            float _571;
            if (asfloat(_5.Load4(_548 * 80 + 16)).w < 0.707106769084930419921875f)
            {
                _570 = _557 * _560;
                _571 = _557 * asfloat(_5.Load4(_548 * 80 + 16)).w;
            }
            else
            {
                float _567 = (0.5f / asfloat(_5.Load4(_548 * 80 + 0)).w) * _561;
                _570 = _567;
                _571 = _567;
            }
            _125[gl_LocalInvocationIndex]._m0 = float4(asfloat(_5.Load4(_548 * 80 + 0)).xyz, _557);
            _125[gl_LocalInvocationIndex]._m1 = float4(asfloat(_5.Load4(_548 * 80 + 32)).xyz, 0.0f);
            _125[gl_LocalInvocationIndex]._m2 = float4(_571, _570, asfloat(_5.Load4(_548 * 80 + 16)).w, _560 * _561);
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _588;
            _588 = _533;
            uint _589;
            for (uint _591 = 0u; _591 < _543; _588 = _589, _591++)
            {
                bool _642;
                do
                {
                    float3 _604 = _333 - _125[_591]._m0.xyz;
                    float3 _608 = _604 - (_125[_591]._m1.xyz * _125[_591]._m2.x);
                    float _611 = _335 + _125[_591]._m2.y;
                    if (dot(_608, _608) > (_611 * _611))
                    {
                        _642 = false;
                        break;
                    }
                    float _616 = dot(_125[_591]._m1.xyz, _604);
                    float _617 = length(_604);
                    if (_616 >= (_125[_591]._m2.z * _617))
                    {
                        _642 = _617 <= (_125[_591]._m0.w + _335);
                        break;
                    }
                    else
                    {
                        float3 _630 = normalize(_125[_591]._m1.xyz + (normalize(_604 - (_125[_591]._m1.xyz * _616)) * _125[_591]._m2.w));
                        float3 _636 = _604 - (_630 * max(0.0f, min(dot(_630, _604), _125[_591]._m0.w)));
                        _642 = dot(_636, _636) < _334;
                        break;
                    }
                    break; // unreachable workaround
                } while(false);
                _589 = _588 + uint(_642);
            }
            _534 = _588;
        }
        else
        {
            _534 = _533;
        }
    }
    uint _645;
    _645 = _533;
    uint _646;
    for (uint _648 = 0u; _648 < _147; _645 = _646, _648++)
    {
        uint _653 = _648 * 64u;
        uint _655 = min((_15_m3 - _653), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _655)
        {
            uint _659 = _653 + gl_LocalInvocationIndex;
            float4x3 _661 = float4x3(asfloat(_6.Load(_659 * 128 + 48)), asfloat(_6.Load(_659 * 128 + 64)), asfloat(_6.Load(_659 * 128 + 80)), asfloat(_6.Load(_659 * 128 + 52)), asfloat(_6.Load(_659 * 128 + 68)), asfloat(_6.Load(_659 * 128 + 84)), asfloat(_6.Load(_659 * 128 + 56)), asfloat(_6.Load(_659 * 128 + 72)), asfloat(_6.Load(_659 * 128 + 88)), asfloat(_6.Load(_659 * 128 + 60)), asfloat(_6.Load(_659 * 128 + 76)), asfloat(_6.Load(_659 * 128 + 92)));
            _125[gl_LocalInvocationIndex]._m0 = float4(_661[0].x, _661[1].x, _661[2].x, _661[3].x);
            _125[gl_LocalInvocationIndex]._m1 = float4(_661[0].y, _661[1].y, _661[2].y, _661[3].y);
            _125[gl_LocalInvocationIndex]._m2 = float4(_661[0].z, _661[1].z, _661[2].z, _661[3].z);
            _125[gl_LocalInvocationIndex]._m3 = float4(asfloat(_6.Load3(_659 * 128 + 96)).x, asfloat(_6.Load3(_659 * 128 + 96)).y, asfloat(_6.Load3(_659 * 128 + 96)).z, _125[gl_LocalInvocationIndex]._m3.w);
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _688;
            _688 = _645;
            for (uint _691 = 0u; _691 < _655; )
            {
                float3 _722 = mul(float4(_333, 1.0f), float4x3(float3(_125[_691]._m0.x, _125[_691]._m1.x, _125[_691]._m2.x), float3(_125[_691]._m0.y, _125[_691]._m1.y, _125[_691]._m2.y), float3(_125[_691]._m0.z, _125[_691]._m1.z, _125[_691]._m2.z), float3(_125[_691]._m0.w, _125[_691]._m1.w, _125[_691]._m2.w)));
                float3 _726 = (_722 - clamp(_722, 0.0f.xxx, 1.0f.xxx)) * _125[_691]._m3.xyz;
                _688 += uint(dot(_726, _726) < _334);
                _691++;
                continue;
            }
            _646 = _688;
        }
        else
        {
            _646 = _645;
        }
    }
    uint _731;
    _731 = _645;
    uint _732;
    for (uint _734 = 0u; _734 < _151; _731 = _732, _734++)
    {
        uint _739 = _734 * 64u;
        uint _741 = min((_15_m4 - _739), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _741)
        {
            uint _745 = _739 + gl_LocalInvocationIndex;
            float4x3 _749 = float4x3(asfloat(_7.Load(_745 * 144 + 16)), asfloat(_7.Load(_745 * 144 + 32)), asfloat(_7.Load(_745 * 144 + 48)), asfloat(_7.Load(_745 * 144 + 20)), asfloat(_7.Load(_745 * 144 + 36)), asfloat(_7.Load(_745 * 144 + 52)), asfloat(_7.Load(_745 * 144 + 24)), asfloat(_7.Load(_745 * 144 + 40)), asfloat(_7.Load(_745 * 144 + 56)), asfloat(_7.Load(_745 * 144 + 28)), asfloat(_7.Load(_745 * 144 + 44)), asfloat(_7.Load(_745 * 144 + 60)));
            _125[gl_LocalInvocationIndex]._m0 = float4(_749[0].x, _749[1].x, _749[2].x, _749[3].x);
            _125[gl_LocalInvocationIndex]._m1 = float4(_749[0].y, _749[1].y, _749[2].y, _749[3].y);
            _125[gl_LocalInvocationIndex]._m2 = float4(_749[0].z, _749[1].z, _749[2].z, _749[3].z);
            _125[gl_LocalInvocationIndex]._m3 = float4(asfloat(_7.Load4(_745 * 144 + 0)).xyz, float(int(_7.Load(_745 * 144 + 136) & 1u)));
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _785;
            _785 = _731;
            uint _786;
            for (uint _788 = 0u; _788 < _741; _785 = _786, _788++)
            {
                float3 _802 = float3(_125[_788]._m0.w, _125[_788]._m1.w, _125[_788]._m2.w);
                bool _867;
                [branch]
                if (_125[_788]._m3.w == 0.0f)
                {
                    float3 _829 = _333 - _802;
                    float _831 = _335 + _125[_788]._m3.x;
                    float4 _835 = float4(_125[_788]._m0.w, _125[_788]._m1.w, _125[_788]._m2.w, 1.0f);
                    float _837 = -_125[_788]._m3.x;
                    _867 = ((((((((((dot(_829, _829) < (_831 * _831)) && (dot(_835, _380) > _837)) && (dot(_835, _384) > _837)) && (dot(_835, _388) > _837)) && (dot(_835, _392) > _837)) && (dot(_835, _396) > _837)) && (dot(_835, _400) > _837)) && (dot(_835, _420) > _837)) && (dot(_835, _429) > _837)) && (dot(_835, _435) > _837)) && (dot(_835, _444) > _837);
                }
                else
                {
                    float3 _823 = abs(mul(_333 - _802, float3x3(float3(_125[_788]._m0.x, _125[_788]._m1.x, _125[_788]._m2.x), float3(_125[_788]._m0.y, _125[_788]._m1.y, _125[_788]._m2.y), float3(_125[_788]._m0.z, _125[_788]._m1.z, _125[_788]._m2.z))));
                    float3 _826 = _823 - min(_823, _125[_788]._m3.xyz);
                    _867 = dot(_826, _826) < _334;
                }
                _786 = _785 + uint(_867);
            }
            _732 = _785;
        }
        else
        {
            _732 = _731;
        }
    }
    uint _870;
    _870 = _731;
    uint _871;
    for (uint _873 = 0u; _873 < _155; _870 = _871, _873++)
    {
        uint _878 = _873 * 64u;
        uint _880 = min((_15_m5 - _878), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _880)
        {
            uint _884 = _878 + gl_LocalInvocationIndex;
            float4x3 _888 = float4x3(asfloat(_16.Load(_884 * 144 + 16)), asfloat(_16.Load(_884 * 144 + 32)), asfloat(_16.Load(_884 * 144 + 48)), asfloat(_16.Load(_884 * 144 + 20)), asfloat(_16.Load(_884 * 144 + 36)), asfloat(_16.Load(_884 * 144 + 52)), asfloat(_16.Load(_884 * 144 + 24)), asfloat(_16.Load(_884 * 144 + 40)), asfloat(_16.Load(_884 * 144 + 56)), asfloat(_16.Load(_884 * 144 + 28)), asfloat(_16.Load(_884 * 144 + 44)), asfloat(_16.Load(_884 * 144 + 60)));
            _125[gl_LocalInvocationIndex]._m0 = float4(_888[0].x, _888[1].x, _888[2].x, _888[3].x);
            _125[gl_LocalInvocationIndex]._m1 = float4(_888[0].y, _888[1].y, _888[2].y, _888[3].y);
            _125[gl_LocalInvocationIndex]._m2 = float4(_888[0].z, _888[1].z, _888[2].z, _888[3].z);
            _125[gl_LocalInvocationIndex]._m3 = float4(asfloat(_16.Load4(_884 * 144 + 0)).xyz, float(int(asfloat(_16.Load4(_884 * 144 + 0)).w)));
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _922;
            _922 = _870;
            uint _923;
            for (uint _925 = 0u; _925 < _880; _922 = _923, _925++)
            {
                float3 _939 = float3(_125[_925]._m0.w, _125[_925]._m1.w, _125[_925]._m2.w);
                bool _1004;
                [branch]
                if (_125[_925]._m3.w == 0.0f)
                {
                    float3 _966 = _333 - _939;
                    float _968 = _335 + _125[_925]._m3.x;
                    float4 _972 = float4(_125[_925]._m0.w, _125[_925]._m1.w, _125[_925]._m2.w, 1.0f);
                    float _974 = -_125[_925]._m3.x;
                    _1004 = ((((((((((dot(_966, _966) < (_968 * _968)) && (dot(_972, _380) > _974)) && (dot(_972, _384) > _974)) && (dot(_972, _388) > _974)) && (dot(_972, _392) > _974)) && (dot(_972, _396) > _974)) && (dot(_972, _400) > _974)) && (dot(_972, _420) > _974)) && (dot(_972, _429) > _974)) && (dot(_972, _435) > _974)) && (dot(_972, _444) > _974);
                }
                else
                {
                    float3 _960 = abs(mul(_333 - _939, float3x3(float3(_125[_925]._m0.x, _125[_925]._m1.x, _125[_925]._m2.x), float3(_125[_925]._m0.y, _125[_925]._m1.y, _125[_925]._m2.y), float3(_125[_925]._m0.z, _125[_925]._m1.z, _125[_925]._m2.z))));
                    float3 _963 = _960 - min(_960, _125[_925]._m3.xyz);
                    _1004 = dot(_963, _963) < _334;
                }
                _923 = _922 + uint(_1004);
            }
            _871 = _922;
        }
        else
        {
            _871 = _870;
        }
    }
    uint _1043;
    uint _1044;
    if (_450)
    {
        uint _1009;
        _14.InterlockedAdd(0, _870, _1009);
        uint _1012 = min(_15_m6, _1009);
        uint _1014 = min(_870, (_15_m6 - _1012));
        uint _1016 = _1012 + min(_1014, _452);
        uint _1018 = _1012 + min(_1014, _533);
        uint _1020 = _1012 + min(_1014, _645);
        uint _1022 = _1012 + min(_1014, _731);
        uint4 _1025 = uint4(0u, 0u, 0u, 0u);
        _1025.x = _1012;
        _1025.y = ((0u | (_1016 - _1012)) | ((_1018 - _1016) << 12u)) | ((_1022 - _1020) << 24u);
        _1025.z = (0u | (_1020 - _1018)) | (((_1012 + min(_1014, _870)) - _1022) << 10u);
        _12.Store4(((((_169 * uint(_8_m24)) + _168.y) * uint(_8_m23)) + _168.x) * 16 + 0, uint4(int4(_1025)));
        _1043 = _1009;
        _1044 = _1014;
    }
    else
    {
        _1043 = 0u;
        _1044 = _870;
    }
    uint _1046;
    uint _1049;
    _1046 = _1043;
    _1049 = _1044;
    uint _1047;
    uint _1050;
    for (uint _1051 = 0u; _1051 < _139; _1046 = _1047, _1049 = _1050, _1051++)
    {
        uint _1056 = _1051 * 64u;
        uint _1058 = min((_15_m1 - _1056), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _1058)
        {
            uint _1062 = _1056 + gl_LocalInvocationIndex;
            _125[gl_LocalInvocationIndex]._m0 = float4(asfloat(_5.Load4(_1062 * 80 + 0)).xyz, 1.0f / asfloat(_5.Load4(_1062 * 80 + 0)).w);
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _1075;
            uint _1078;
            _1075 = _1046;
            _1078 = _1049;
            uint _1076;
            uint _1079;
            for (uint _1080 = 0u; (_1080 < _1058) && (_1078 > 0u); _1075 = _1076, _1078 = _1079, _1080++)
            {
                float3 _1091 = _333 - _125[_1080]._m0.xyz;
                float _1093 = _335 + _125[_1080]._m0.w;
                float4 _1100 = float4(_125[_1080]._m0.xyz, 1.0f);
                float _1102 = -_125[_1080]._m0.w;
                if (((((((((((dot(_1091, _1091) < (_1093 * _1093)) && (dot(_1100, _380) > _1102)) && (dot(_1100, _384) > _1102)) && (dot(_1100, _388) > _1102)) && (dot(_1100, _392) > _1102)) && (dot(_1100, _396) > _1102)) && (dot(_1100, _400) > _1102)) && (dot(_1100, _420) > _1102)) && (dot(_1100, _429) > _1102)) && (dot(_1100, _435) > _1102)) && (dot(_1100, _444) > _1102))
                {
                    _13.Store(_1075 * 4 + 0, uint(int(_1056 + _1080)));
                    _1076 = _1075 + 1u;
                    _1079 = _1078 - 1u;
                }
                else
                {
                    _1076 = _1075;
                    _1079 = _1078;
                }
            }
            _1047 = _1075;
            _1050 = _1078;
        }
        else
        {
            _1047 = _1046;
            _1050 = _1049;
        }
    }
    uint _1140;
    uint _1143;
    _1140 = _1046;
    _1143 = _1049;
    uint _1141;
    uint _1144;
    for (uint _1145 = 0u; _1145 < _143; _1140 = _1141, _1143 = _1144, _1145++)
    {
        uint _1150 = _1145 * 64u;
        uint _1152 = min((_15_m2 - _1150), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _1152)
        {
            uint _1157 = (_15_m1 + _1150) + gl_LocalInvocationIndex;
            float _1166 = 1.0f / asfloat(_5.Load4(_1157 * 80 + 0)).w;
            float _1169 = sqrt(mad(-asfloat(_5.Load4(_1157 * 80 + 16)).w, asfloat(_5.Load4(_1157 * 80 + 16)).w, 1.0f));
            float _1170 = 1.0f / asfloat(_5.Load4(_1157 * 80 + 16)).w;
            float _1179;
            float _1180;
            if (asfloat(_5.Load4(_1157 * 80 + 16)).w < 0.707106769084930419921875f)
            {
                _1179 = _1166 * _1169;
                _1180 = _1166 * asfloat(_5.Load4(_1157 * 80 + 16)).w;
            }
            else
            {
                float _1176 = (0.5f / asfloat(_5.Load4(_1157 * 80 + 0)).w) * _1170;
                _1179 = _1176;
                _1180 = _1176;
            }
            _125[gl_LocalInvocationIndex]._m0 = float4(asfloat(_5.Load4(_1157 * 80 + 0)).xyz, _1166);
            _125[gl_LocalInvocationIndex]._m1 = float4(asfloat(_5.Load4(_1157 * 80 + 32)).xyz, 0.0f);
            _125[gl_LocalInvocationIndex]._m2 = float4(_1180, _1179, asfloat(_5.Load4(_1157 * 80 + 16)).w, _1169 * _1170);
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _1197;
            uint _1200;
            _1197 = _1140;
            _1200 = _1143;
            uint _1198;
            uint _1201;
            for (uint _1202 = 0u; (_1202 < _1152) && (_1200 > 0u); _1197 = _1198, _1200 = _1201, _1202++)
            {
                bool _1255;
                do
                {
                    float3 _1217 = _333 - _125[_1202]._m0.xyz;
                    float3 _1221 = _1217 - (_125[_1202]._m1.xyz * _125[_1202]._m2.x);
                    float _1224 = _335 + _125[_1202]._m2.y;
                    if (dot(_1221, _1221) > (_1224 * _1224))
                    {
                        _1255 = false;
                        break;
                    }
                    float _1229 = dot(_125[_1202]._m1.xyz, _1217);
                    float _1230 = length(_1217);
                    if (_1229 >= (_125[_1202]._m2.z * _1230))
                    {
                        _1255 = _1230 <= (_125[_1202]._m0.w + _335);
                        break;
                    }
                    else
                    {
                        float3 _1243 = normalize(_125[_1202]._m1.xyz + (normalize(_1217 - (_125[_1202]._m1.xyz * _1229)) * _125[_1202]._m2.w));
                        float3 _1249 = _1217 - (_1243 * max(0.0f, min(dot(_1243, _1217), _125[_1202]._m0.w)));
                        _1255 = dot(_1249, _1249) < _334;
                        break;
                    }
                    break; // unreachable workaround
                } while(false);
                if (_1255)
                {
                    _13.Store(_1197 * 4 + 0, uint(int((_15_m1 + _1150) + _1202)));
                    _1198 = _1197 + 1u;
                    _1201 = _1200 - 1u;
                }
                else
                {
                    _1198 = _1197;
                    _1201 = _1200;
                }
            }
            _1141 = _1197;
            _1144 = _1200;
        }
        else
        {
            _1141 = _1140;
            _1144 = _1143;
        }
    }
    uint _1265;
    uint _1268;
    _1265 = _1140;
    _1268 = _1143;
    uint _1266;
    uint _1269;
    for (uint _1270 = 0u; _1270 < _147; _1265 = _1266, _1268 = _1269, _1270++)
    {
        uint _1275 = _1270 * 64u;
        uint _1277 = min((_15_m3 - _1275), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _1277)
        {
            uint _1281 = _1275 + gl_LocalInvocationIndex;
            float4x3 _1283 = float4x3(asfloat(_6.Load(_1281 * 128 + 48)), asfloat(_6.Load(_1281 * 128 + 64)), asfloat(_6.Load(_1281 * 128 + 80)), asfloat(_6.Load(_1281 * 128 + 52)), asfloat(_6.Load(_1281 * 128 + 68)), asfloat(_6.Load(_1281 * 128 + 84)), asfloat(_6.Load(_1281 * 128 + 56)), asfloat(_6.Load(_1281 * 128 + 72)), asfloat(_6.Load(_1281 * 128 + 88)), asfloat(_6.Load(_1281 * 128 + 60)), asfloat(_6.Load(_1281 * 128 + 76)), asfloat(_6.Load(_1281 * 128 + 92)));
            _125[gl_LocalInvocationIndex]._m0 = float4(_1283[0].x, _1283[1].x, _1283[2].x, _1283[3].x);
            _125[gl_LocalInvocationIndex]._m1 = float4(_1283[0].y, _1283[1].y, _1283[2].y, _1283[3].y);
            _125[gl_LocalInvocationIndex]._m2 = float4(_1283[0].z, _1283[1].z, _1283[2].z, _1283[3].z);
            _125[gl_LocalInvocationIndex]._m3 = float4(asfloat(_6.Load3(_1281 * 128 + 96)).x, asfloat(_6.Load3(_1281 * 128 + 96)).y, asfloat(_6.Load3(_1281 * 128 + 96)).z, _125[gl_LocalInvocationIndex]._m3.w);
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _1310;
            uint _1313;
            _1310 = _1265;
            _1313 = _1268;
            uint _1311;
            uint _1314;
            for (uint _1315 = 0u; (_1315 < _1277) && (_1313 > 0u); _1310 = _1311, _1313 = _1314, _1315++)
            {
                float3 _1349 = mul(float4(_333, 1.0f), float4x3(float3(_125[_1315]._m0.x, _125[_1315]._m1.x, _125[_1315]._m2.x), float3(_125[_1315]._m0.y, _125[_1315]._m1.y, _125[_1315]._m2.y), float3(_125[_1315]._m0.z, _125[_1315]._m1.z, _125[_1315]._m2.z), float3(_125[_1315]._m0.w, _125[_1315]._m1.w, _125[_1315]._m2.w)));
                float3 _1353 = (_1349 - clamp(_1349, 0.0f.xxx, 1.0f.xxx)) * _125[_1315]._m3.xyz;
                if (dot(_1353, _1353) < _334)
                {
                    _13.Store(_1310 * 4 + 0, uint(int(_1275 + _1315)));
                    _1311 = _1310 + 1u;
                    _1314 = _1313 - 1u;
                }
                else
                {
                    _1311 = _1310;
                    _1314 = _1313;
                }
            }
            _1266 = _1310;
            _1269 = _1313;
        }
        else
        {
            _1266 = _1265;
            _1269 = _1268;
        }
    }
    uint _1364;
    uint _1367;
    _1364 = _1265;
    _1367 = _1268;
    uint _1365;
    uint _1368;
    for (uint _1369 = 0u; _1369 < _151; _1364 = _1365, _1367 = _1368, _1369++)
    {
        uint _1374 = _1369 * 64u;
        uint _1376 = min((_15_m4 - _1374), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _1376)
        {
            uint _1380 = _1374 + gl_LocalInvocationIndex;
            float4x3 _1384 = float4x3(asfloat(_7.Load(_1380 * 144 + 16)), asfloat(_7.Load(_1380 * 144 + 32)), asfloat(_7.Load(_1380 * 144 + 48)), asfloat(_7.Load(_1380 * 144 + 20)), asfloat(_7.Load(_1380 * 144 + 36)), asfloat(_7.Load(_1380 * 144 + 52)), asfloat(_7.Load(_1380 * 144 + 24)), asfloat(_7.Load(_1380 * 144 + 40)), asfloat(_7.Load(_1380 * 144 + 56)), asfloat(_7.Load(_1380 * 144 + 28)), asfloat(_7.Load(_1380 * 144 + 44)), asfloat(_7.Load(_1380 * 144 + 60)));
            _125[gl_LocalInvocationIndex]._m0 = float4(_1384[0].x, _1384[1].x, _1384[2].x, _1384[3].x);
            _125[gl_LocalInvocationIndex]._m1 = float4(_1384[0].y, _1384[1].y, _1384[2].y, _1384[3].y);
            _125[gl_LocalInvocationIndex]._m2 = float4(_1384[0].z, _1384[1].z, _1384[2].z, _1384[3].z);
            _125[gl_LocalInvocationIndex]._m3 = float4(asfloat(_7.Load4(_1380 * 144 + 0)).xyz, float(int(_7.Load(_1380 * 144 + 136) & 1u)));
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _1420;
            uint _1423;
            _1420 = _1364;
            _1423 = _1367;
            uint _1421;
            uint _1424;
            for (uint _1425 = 0u; (_1425 < _1376) && (_1423 > 0u); _1420 = _1421, _1423 = _1424, _1425++)
            {
                float3 _1441 = float3(_125[_1425]._m0.w, _125[_1425]._m1.w, _125[_1425]._m2.w);
                bool _1506;
                [branch]
                if (_125[_1425]._m3.w == 0.0f)
                {
                    float3 _1468 = _333 - _1441;
                    float _1470 = _335 + _125[_1425]._m3.x;
                    float4 _1474 = float4(_125[_1425]._m0.w, _125[_1425]._m1.w, _125[_1425]._m2.w, 1.0f);
                    float _1476 = -_125[_1425]._m3.x;
                    _1506 = ((((((((((dot(_1468, _1468) < (_1470 * _1470)) && (dot(_1474, _380) > _1476)) && (dot(_1474, _384) > _1476)) && (dot(_1474, _388) > _1476)) && (dot(_1474, _392) > _1476)) && (dot(_1474, _396) > _1476)) && (dot(_1474, _400) > _1476)) && (dot(_1474, _420) > _1476)) && (dot(_1474, _429) > _1476)) && (dot(_1474, _435) > _1476)) && (dot(_1474, _444) > _1476);
                }
                else
                {
                    float3 _1462 = abs(mul(_333 - _1441, float3x3(float3(_125[_1425]._m0.x, _125[_1425]._m1.x, _125[_1425]._m2.x), float3(_125[_1425]._m0.y, _125[_1425]._m1.y, _125[_1425]._m2.y), float3(_125[_1425]._m0.z, _125[_1425]._m1.z, _125[_1425]._m2.z))));
                    float3 _1465 = _1462 - min(_1462, _125[_1425]._m3.xyz);
                    _1506 = dot(_1465, _1465) < _334;
                }
                if (_1506)
                {
                    _13.Store(_1420 * 4 + 0, uint(int(_1374 + _1425)));
                    _1421 = _1420 + 1u;
                    _1424 = _1423 - 1u;
                }
                else
                {
                    _1421 = _1420;
                    _1424 = _1423;
                }
            }
            _1365 = _1420;
            _1368 = _1423;
        }
        else
        {
            _1365 = _1364;
            _1368 = _1367;
        }
    }
    uint _1516;
    uint _1521;
    for (uint _1515 = _1367, _1518 = 0u, _1520 = _1364; _1518 < _155; _1515 = _1516, _1518++, _1520 = _1521)
    {
        uint _1525 = _1518 * 64u;
        uint _1527 = min((_15_m5 - _1525), 64u);
        GroupMemoryBarrierWithGroupSync();
        if (gl_LocalInvocationIndex < _1527)
        {
            uint _1531 = _1525 + gl_LocalInvocationIndex;
            float4x3 _1535 = float4x3(asfloat(_16.Load(_1531 * 144 + 16)), asfloat(_16.Load(_1531 * 144 + 32)), asfloat(_16.Load(_1531 * 144 + 48)), asfloat(_16.Load(_1531 * 144 + 20)), asfloat(_16.Load(_1531 * 144 + 36)), asfloat(_16.Load(_1531 * 144 + 52)), asfloat(_16.Load(_1531 * 144 + 24)), asfloat(_16.Load(_1531 * 144 + 40)), asfloat(_16.Load(_1531 * 144 + 56)), asfloat(_16.Load(_1531 * 144 + 28)), asfloat(_16.Load(_1531 * 144 + 44)), asfloat(_16.Load(_1531 * 144 + 60)));
            _125[gl_LocalInvocationIndex]._m0 = float4(_1535[0].x, _1535[1].x, _1535[2].x, _1535[3].x);
            _125[gl_LocalInvocationIndex]._m1 = float4(_1535[0].y, _1535[1].y, _1535[2].y, _1535[3].y);
            _125[gl_LocalInvocationIndex]._m2 = float4(_1535[0].z, _1535[1].z, _1535[2].z, _1535[3].z);
            _125[gl_LocalInvocationIndex]._m3 = float4(asfloat(_16.Load4(_1531 * 144 + 0)).xyz, float(int(asfloat(_16.Load4(_1531 * 144 + 0)).w)));
        }
        GroupMemoryBarrierWithGroupSync();
        if (_450)
        {
            uint _1569;
            uint _1572;
            _1569 = _1520;
            _1572 = _1515;
            uint _1570;
            uint _1573;
            for (uint _1574 = 0u; (_1574 < _1527) && (_1572 > 0u); _1569 = _1570, _1572 = _1573, _1574++)
            {
                float3 _1590 = float3(_125[_1574]._m0.w, _125[_1574]._m1.w, _125[_1574]._m2.w);
                bool _1655;
                [branch]
                if (_125[_1574]._m3.w == 0.0f)
                {
                    float3 _1617 = _333 - _1590;
                    float _1619 = _335 + _125[_1574]._m3.x;
                    float4 _1623 = float4(_125[_1574]._m0.w, _125[_1574]._m1.w, _125[_1574]._m2.w, 1.0f);
                    float _1625 = -_125[_1574]._m3.x;
                    _1655 = ((((((((((dot(_1617, _1617) < (_1619 * _1619)) && (dot(_1623, _380) > _1625)) && (dot(_1623, _384) > _1625)) && (dot(_1623, _388) > _1625)) && (dot(_1623, _392) > _1625)) && (dot(_1623, _396) > _1625)) && (dot(_1623, _400) > _1625)) && (dot(_1623, _420) > _1625)) && (dot(_1623, _429) > _1625)) && (dot(_1623, _435) > _1625)) && (dot(_1623, _444) > _1625);
                }
                else
                {
                    float3 _1611 = abs(mul(_333 - _1590, float3x3(float3(_125[_1574]._m0.x, _125[_1574]._m1.x, _125[_1574]._m2.x), float3(_125[_1574]._m0.y, _125[_1574]._m1.y, _125[_1574]._m2.y), float3(_125[_1574]._m0.z, _125[_1574]._m1.z, _125[_1574]._m2.z))));
                    float3 _1614 = _1611 - min(_1611, _125[_1574]._m3.xyz);
                    _1655 = dot(_1614, _1614) < _334;
                }
                if (_1655)
                {
                    _13.Store(_1569 * 4 + 0, uint(int(_1525 + _1574)));
                    _1570 = _1569 + 1u;
                    _1573 = _1572 - 1u;
                }
                else
                {
                    _1570 = _1569;
                    _1573 = _1572;
                }
            }
            _1516 = _1572;
            _1521 = _1569;
        }
        else
        {
            _1516 = _1515;
            _1521 = _1520;
        }
    }
}

[numthreads(4, 4, 4)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    gl_LocalInvocationIndex = stage_input.gl_LocalInvocationIndex;
    comp_main();
}

