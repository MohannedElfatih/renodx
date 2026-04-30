

struct _28
{
    column_major float4x4 _m0[2];
};

static float4 _154 = (float4)0;

[[vk::binding(2, 0)]]
cbuffer _26_14 : register(b2, space0)
{
    column_major float4x4 _14_m0 : packoffset(c0);
    column_major float4x4 _14_m1 : packoffset(c4);
    column_major float4x4 _14_m2 : packoffset(c8);
    float _14_m3 : packoffset(c12);
    float _14_m4 : packoffset(c12.y);
    float2 _14_m5 : packoffset(c12.z);
    float3 _14_m6 : packoffset(c13);
    int _14_m7 : packoffset(c13.w);
};

[[vk::binding(12, 0)]]
ByteAddressBuffer _16 : register(t12, space0);
[[vk::binding(0, 1)]]
cbuffer _32_17 : register(b0, space1)
{
    column_major float4x4 _17_m0 : packoffset(c0);
    float4 _17_m1[2] : packoffset(c4);
    uint _17_m2 : packoffset(c6);
    uint _17_m3 : packoffset(c6.y);
    uint _17_m4 : packoffset(c6.z);
    uint _17_m5 : packoffset(c6.w);
};

[[vk::binding(1, 1)]]
cbuffer _33_18 : register(b1, space1)
{
    float3 _18_m0 : packoffset(c0);
    float _18_m1 : packoffset(c0.w);
    float3 _18_m2 : packoffset(c1);
    float _18_m3 : packoffset(c1.w);
    float3 _18_m4 : packoffset(c2);
    float _18_m5 : packoffset(c2.w);
    float3 _18_m6 : packoffset(c3);
    float _18_m7 : packoffset(c3.w);
    float3 _18_m8 : packoffset(c4);
    float _18_m9 : packoffset(c4.w);
    float3 _18_m10 : packoffset(c5);
    float _18_m11 : packoffset(c5.w);
    float3 _18_m12 : packoffset(c6);
    float _18_m13 : packoffset(c6.w);
    float3 _18_m14 : packoffset(c7);
    float _18_m15 : packoffset(c7.w);
    float3 _18_m16 : packoffset(c8);
    float _18_m17 : packoffset(c8.w);
    float3 _18_m18 : packoffset(c9);
    float _18_m19 : packoffset(c9.w);
    float3 _18_m20 : packoffset(c10);
    float _18_m21 : packoffset(c10.w);
    float3 _18_m22 : packoffset(c11);
    float _18_m23 : packoffset(c11.w);
    float3 _18_m24 : packoffset(c12);
    float _18_m25 : packoffset(c12.w);
    float3 _18_m26 : packoffset(c13);
    float _18_m27 : packoffset(c13.w);
};

[[vk::binding(7, 0)]]
SamplerState _15 : register(s7, space0);
[[vk::binding(2, 1)]]
SamplerState _19 : register(s2, space1);
[[vk::binding(3, 1)]]
Texture2D<float4> _20 : register(t3, space1);
[[vk::binding(4, 1)]]
Texture2DArray<float4> _21 : register(t4, space1);
[[vk::binding(5, 1)]]
Texture2DArray<float4> _22 : register(t5, space1);
[[vk::binding(6, 1)]]
Texture2DArray<float4> _23 : register(t6, space1);
[[vk::binding(7, 1)]]
Texture2D<float4> _24 : register(t7, space1);
[[vk::binding(8, 1)]]
Texture2D<float4> _25 : register(t8, space1);

static float2 _3 = (float2)0;
static float3 _4 = (float3)0;
static float3 _5 = (float3)0;
static float3 _6 = (float3)0;
static float3 _7 = (float3)0;
static float3 _8 = (float3)0;
static float4 _9 = (float4)0;
static float4 _10 = (float4)0;
static float4 _11 = (float4)0;
static float4 _12 = (float4)0;
static float4 _13 = (float4)0;

struct SPIRV_Cross_Input
{
    float2 _3 : TEXCOORD0;
    float3 _4 : TEXCOORD1;
    float3 _5 : TEXCOORD2;
    float3 _6 : TEXCOORD3;
    float3 _7 : TEXCOORD4;
    float3 _8 : TEXCOORD5;
};

struct SPIRV_Cross_Output
{
    float4 _9 : SV_Target0;
    float4 _10 : SV_Target1;
    float4 _11 : SV_Target2;
    float4 _12 : SV_Target3;
    float4 _13 : SV_Target4;
};

void frag_main()
{
    _28 _173;
    [unroll]
    for (int _16ident = 0; _16ident < 2; _16ident++)
    {
        _173._m0[_16ident] = float4x4(asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_16ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _179 = _17_m1[0].zw * ddx(_3);
    float2 _181 = _17_m1[0].zw * ddy(_3);
    float2 _184 = mad(frac(_3), _17_m1[0].zw, _17_m1[0].xy);
    float2 _187 = float2(_173._m0[0][2].x, _173._m0[0][3].x);
    float2 _188 = _179 * _187;
    float2 _189 = _181 * _187;
    float _190 = dot(_188, _188);
    float _191 = dot(_189, _189);
    float _194 = log2(max(_190, _191));
    float _207 = floor(min(max(mad(0.5f, _194, -min(mad(0.5f, _194, log2(min(_190, _191)) * (-0.5f)), _173._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float _214 = max(abs(0.5f), 9.9999997473787516355514526367188e-05f);
    float2 _217 = floor((_184 * float2(_173._m0[0][0].w, _173._m0[0][0].w * _173._m0[0][1].w)) * pow(_214, _207));
    int _218 = int(_207);
    uint _227 = asuint(_20.Load(int3(int3(int(_217.x), int(_217.y), _218).xy, _218)).y);
    float _237 = max(abs(2.0f), 9.9999997473787516355514526367188e-05f);
    float _238 = pow(_237, float(_227 & 15u));
    float2 _240 = float2(_238, _238 * _173._m0[0][1].w);
    float2 _245 = float2(_173._m0[0][0].z, _173._m0[0][1].z);
    float2 _252 = float2(_173._m0[1][0].y, _173._m0[1][1].y);
    float2 _264 = ((_240 * _245) * _252) * _173._m0[0][0].y;
    float4 _268 = _21.SampleGrad(_19, float3(mad(mad(frac(_184 * _240), _245, float2(float((_227 >> 14u) & 1023u), float((_227 >> 4u) & 1023u))), _252, float2(_173._m0[1][2].y, _173._m0[1][3].y)), float((_227 >> 24u) & 127u)), _179 * _264, _181 * _264);
    bool4 _271 = (_173._m0[0][2].w != 2202.0f).xxxx;
    float4 _272 = float4(_271.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _268.x, _271.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _268.y, _271.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _268.z, _271.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _268.w);
    float3 _275 = (_272.wzy * 2.0f) - 1.0f.xxx;
    float4 _276 = float4(_275.x, _275.y, _275.z, _272.x);
    _276.z = -_275.z;
    float3 _295 = mul(float3x3(_14_m0[0].xyz, _14_m0[1].xyz, _14_m0[2].xyz), normalize(mul(normalize(_276.xyz).xyz, float3x3(_6, _4, _5))));
    float3 _296 = normalize(_7);
    _28 _298;
    [unroll]
    for (int _17ident = 0; _17ident < 2; _17ident++)
    {
        _298._m0[_17ident] = float4x4(asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_17ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _303 = _17_m1[0].zw * ddx(_3);
    float2 _305 = _17_m1[0].zw * ddy(_3);
    float2 _308 = float2(_298._m0[0][2].x, _298._m0[0][3].x);
    float2 _309 = _303 * _308;
    float2 _310 = _305 * _308;
    float _311 = dot(_309, _309);
    float _312 = dot(_310, _310);
    float _315 = log2(max(_311, _312));
    float _327 = floor(min(max(mad(0.5f, _315, -min(mad(0.5f, _315, log2(min(_311, _312)) * (-0.5f)), _298._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float2 _335 = floor((_184 * float2(_298._m0[0][0].w, _298._m0[0][0].w * _298._m0[0][1].w)) * pow(_214, _327));
    int _336 = int(_327);
    uint _345 = asuint(_20.Load(int3(int3(int(_335.x), int(_335.y), _336).xy, _336)).x);
    float _354 = pow(_237, float(_345 & 15u));
    float2 _356 = float2(_354, _354 * _298._m0[0][1].w);
    float2 _361 = float2(_298._m0[0][0].z, _298._m0[0][1].z);
    float2 _368 = float2(_298._m0[1][0].x, _298._m0[1][1].x);
    float2 _380 = ((_356 * _361) * _368) * _298._m0[0][0].y;
    float4 _384 = _22.SampleGrad(_19, float3(mad(mad(frac(_184 * _356), _361, float2(float((_345 >> 14u) & 1023u), float((_345 >> 4u) & 1023u))), _368, float2(_298._m0[1][2].x, _298._m0[1][3].x)), float((_345 >> 24u) & 127u)), _303 * _380, _305 * _380);
    bool4 _387 = (_298._m0[0][2].w != 2202.0f).xxxx;
    _28 _389;
    [unroll]
    for (int _18ident = 0; _18ident < 2; _18ident++)
    {
        _389._m0[_18ident] = float4x4(asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_18ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _394 = _17_m1[0].zw * ddx(_3);
    float2 _396 = _17_m1[0].zw * ddy(_3);
    float2 _399 = float2(_389._m0[0][2].x, _389._m0[0][3].x);
    float2 _400 = _394 * _399;
    float2 _401 = _396 * _399;
    float _402 = dot(_400, _400);
    float _403 = dot(_401, _401);
    float _406 = log2(max(_402, _403));
    float _418 = floor(min(max(mad(0.5f, _406, -min(mad(0.5f, _406, log2(min(_402, _403)) * (-0.5f)), _389._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float2 _426 = floor((_184 * float2(_389._m0[0][0].w, _389._m0[0][0].w * _389._m0[0][1].w)) * pow(_214, _418));
    int _427 = int(_418);
    uint _436 = asuint(_20.Load(int3(int3(int(_426.x), int(_426.y), _427).xy, _427)).y);
    float _445 = pow(_237, float(_436 & 15u));
    float2 _447 = float2(_445, _445 * _389._m0[0][1].w);
    float2 _452 = float2(_389._m0[0][0].z, _389._m0[0][1].z);
    float2 _459 = float2(_389._m0[1][0].y, _389._m0[1][1].y);
    float2 _471 = ((_447 * _452) * _459) * _389._m0[0][0].y;
    float4 _475 = _21.SampleGrad(_19, float3(mad(mad(frac(_184 * _447), _452, float2(float((_436 >> 14u) & 1023u), float((_436 >> 4u) & 1023u))), _459, float2(_389._m0[1][2].y, _389._m0[1][3].y)), float((_436 >> 24u) & 127u)), _394 * _471, _396 * _471);
    bool4 _478 = (_389._m0[0][2].w != 2202.0f).xxxx;
    float4 _479 = float4(_478.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _475.x, _478.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _475.y, _478.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _475.z, _478.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _475.w);
    float3 _482 = (_479.wzy * 2.0f) - 1.0f.xxx;
    float4 _483 = float4(_482.x, _482.y, _482.z, _479.x);
    _483.z = -_482.z;
    _28 _490;
    [unroll]
    for (int _19ident = 0; _19ident < 2; _19ident++)
    {
        _490._m0[_19ident] = float4x4(asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_19ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _495 = _17_m1[0].zw * ddx(_3);
    float2 _497 = _17_m1[0].zw * ddy(_3);
    float2 _500 = float2(_490._m0[0][2].x, _490._m0[0][3].x);
    float2 _501 = _495 * _500;
    float2 _502 = _497 * _500;
    float _503 = dot(_501, _501);
    float _504 = dot(_502, _502);
    float _507 = log2(max(_503, _504));
    float _519 = floor(min(max(mad(0.5f, _507, -min(mad(0.5f, _507, log2(min(_503, _504)) * (-0.5f)), _490._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float2 _527 = floor((_184 * float2(_490._m0[0][0].w, _490._m0[0][0].w * _490._m0[0][1].w)) * pow(_214, _519));
    int _528 = int(_519);
    uint _537 = asuint(_20.Load(int3(int3(int(_527.x), int(_527.y), _528).xy, _528)).z);
    float _546 = pow(_237, float(_537 & 15u));
    float2 _548 = float2(_546, _546 * _490._m0[0][1].w);
    float2 _553 = float2(_490._m0[0][0].z, _490._m0[0][1].z);
    float2 _560 = float2(_490._m0[1][0].z, _490._m0[1][1].z);
    float2 _572 = ((_548 * _553) * _560) * _490._m0[0][0].y;
    float4 _576 = _23.SampleGrad(_19, float3(mad(mad(frac(_184 * _548), _553, float2(float((_537 >> 14u) & 1023u), float((_537 >> 4u) & 1023u))), _560, float2(_490._m0[1][2].z, _490._m0[1][3].z)), float((_537 >> 24u) & 127u)), _495 * _572, _497 * _572);
    bool4 _579 = (_490._m0[0][2].w != 2202.0f).xxxx;
    float3 _587 = _24.Sample(_15, _3).xyz;
    float4 _601 = clamp(mad(-float4(length(_587 - float3(1.0f, 0.5f, 0.0f)), length(_587 - float3(1.0f, 0.0f, 0.0f)), length(_587 - float3(1.0f, 0.5f, 0.5f)), length(_587 - float3(1.0f, 0.0f, 0.5f))), 0.57735025882720947265625f.xxxx, 1.0f.xxxx) - 0.75f.xxxx, 0.0f.xxxx, 1.0f.xxxx) * 4.0f.xxxx;
    float4 _633 = clamp(mad(-float4(length(_587 - float3(0.5f, 0.0f, 1.0f)), length(_587 - float3(0.0f, 0.0f, 1.0f)), length(_587 - float3(0.5f, 0.5f, 1.0f)), length(_587 - float3(0.0f, 0.5f, 1.0f))), 0.57735025882720947265625f.xxxx, 1.0f.xxxx) - 0.75f.xxxx, 0.0f.xxxx, 1.0f.xxxx) * 4.0f.xxxx;
    float4 _666 = clamp(mad(-float4(length(_587 - float3(0.0f, 1.0f, 0.5f)), length(_587 - float3(0.0f, 1.0f, 0.0f)), length(_587 - float3(0.5f, 1.0f, 0.5f)), length(_587 - float3(0.5f, 1.0f, 0.0f))), 0.57735025882720947265625f.xxxx, 1.0f.xxxx) - 0.75f.xxxx, 0.0f.xxxx, 1.0f.xxxx) * 4.0f.xxxx;
    float3 _695 = float3(1.0f, -1.0f, 1.0f) * (_8 * 2.7999999523162841796875f);
    float2 _696 = _695.zy;
    float3 _704 = pow(max(abs(abs((float3(0.0f, 0.5f, 1.0f) * ((_25.Sample(_15, _3).z + (-0.5f)) * 0.60000002384185791015625f)) + _296)), 9.9999997473787516355514526367188e-05f.xxx), 160.0f.xxx);
    float3 _708 = step(0.5f.xxx, _704 / dot(_704, 1.0f.xxx).xxx);
    float2 _711 = _695.xy;
    float2 _715 = _695.xz;
    float4 _720 = _25.Sample(_15, ((_696 * _708.x) + (_711 * _708.z)) + (_715 * _708.y));
    float2 _727 = float2(_18_m1, _18_m3);
    float2 _737 = float2(_18_m5, _18_m7);
    float2 _755 = float2(_18_m9, _18_m11);
    float2 _757 = pow(max(abs(_720.yx), 9.9999997473787516355514526367188e-05f.xx), _727) * step((1.0f.xx - clamp(clamp(normalize(_483.xyz).z, 0.0f, 1.0f).xx + (1.0f.xx - pow(max(abs(float4(_579.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _576.x, _579.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _576.y, _579.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _576.z, _579.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _576.w).z.xx), 9.9999997473787516355514526367188e-05f.xx), _737)), 0.0f.xx, 1.0f.xx)) + max(9.9999997473787516355514526367188e-06f, _720.z - 0.699999988079071044921875f).xx, _755);
    float3 _762 = lerp(float4(_387.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _384.x, _387.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _384.y, _387.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _384.z, _387.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _384.w).xyz * (((_18_m0 * _601.x) + (_18_m2 * _601.y)) + ((((_18_m4 * _601.z) + (_18_m6 * _601.w)) + ((_18_m8 * _633.x) + (_18_m10 * _633.y))) + (((_18_m12 * _633.z) + (_18_m14 * _633.w)) + (((_18_m16 * _666.x) + (_18_m18 * _666.y)) + ((_18_m20 * _666.z) + (_18_m22 * _666.w)))))), _18_m24, _757.x.xxx);
    _28 _768;
    [unroll]
    for (int _20ident = 0; _20ident < 2; _20ident++)
    {
        _768._m0[_20ident] = float4x4(asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_20ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _773 = _17_m1[0].zw * ddx(_3);
    float2 _775 = _17_m1[0].zw * ddy(_3);
    float2 _778 = float2(_768._m0[0][2].x, _768._m0[0][3].x);
    float2 _779 = _773 * _778;
    float2 _780 = _775 * _778;
    float _781 = dot(_779, _779);
    float _782 = dot(_780, _780);
    float _785 = log2(max(_781, _782));
    float _797 = floor(min(max(mad(0.5f, _785, -min(mad(0.5f, _785, log2(min(_781, _782)) * (-0.5f)), _768._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float2 _805 = floor((_184 * float2(_768._m0[0][0].w, _768._m0[0][0].w * _768._m0[0][1].w)) * pow(_214, _797));
    int _806 = int(_797);
    uint _815 = asuint(_20.Load(int3(int3(int(_805.x), int(_805.y), _806).xy, _806)).z);
    float _824 = pow(_237, float(_815 & 15u));
    float2 _826 = float2(_824, _824 * _768._m0[0][1].w);
    float2 _831 = float2(_768._m0[0][0].z, _768._m0[0][1].z);
    float2 _838 = float2(_768._m0[1][0].z, _768._m0[1][1].z);
    float2 _850 = ((_826 * _831) * _838) * _768._m0[0][0].y;
    float4 _854 = _23.SampleGrad(_19, float3(mad(mad(frac(_184 * _826), _831, float2(float((_815 >> 14u) & 1023u), float((_815 >> 4u) & 1023u))), _838, float2(_768._m0[1][2].z, _768._m0[1][3].z)), float((_815 >> 24u) & 127u)), _773 * _850, _775 * _850);
    bool4 _857 = (_768._m0[0][2].w != 2202.0f).xxxx;
    _28 _862;
    [unroll]
    for (int _21ident = 0; _21ident < 2; _21ident++)
    {
        _862._m0[_21ident] = float4x4(asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_21ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _867 = _17_m1[0].zw * ddx(_3);
    float2 _869 = _17_m1[0].zw * ddy(_3);
    float2 _872 = float2(_862._m0[0][2].x, _862._m0[0][3].x);
    float2 _873 = _867 * _872;
    float2 _874 = _869 * _872;
    float _875 = dot(_873, _873);
    float _876 = dot(_874, _874);
    float _879 = log2(max(_875, _876));
    float _891 = floor(min(max(mad(0.5f, _879, -min(mad(0.5f, _879, log2(min(_875, _876)) * (-0.5f)), _862._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float2 _899 = floor((_184 * float2(_862._m0[0][0].w, _862._m0[0][0].w * _862._m0[0][1].w)) * pow(_214, _891));
    int _900 = int(_891);
    uint _909 = asuint(_20.Load(int3(int3(int(_899.x), int(_899.y), _900).xy, _900)).z);
    float _918 = pow(_237, float(_909 & 15u));
    float2 _920 = float2(_918, _918 * _862._m0[0][1].w);
    float2 _925 = float2(_862._m0[0][0].z, _862._m0[0][1].z);
    float2 _932 = float2(_862._m0[1][0].z, _862._m0[1][1].z);
    float2 _944 = ((_920 * _925) * _932) * _862._m0[0][0].y;
    float4 _948 = _23.SampleGrad(_19, float3(mad(mad(frac(_184 * _920), _925, float2(float((_909 >> 14u) & 1023u), float((_909 >> 4u) & 1023u))), _932, float2(_862._m0[1][2].z, _862._m0[1][3].z)), float((_909 >> 24u) & 127u)), _867 * _944, _869 * _944);
    bool4 _951 = (_862._m0[0][2].w != 2202.0f).xxxx;
    float3 _964 = pow(max(abs(abs((float3(0.0f, 0.5f, 1.0f) * ((_25.Sample(_15, _3).z + (-0.5f)) * 0.60000002384185791015625f)) + _296)), 9.9999997473787516355514526367188e-05f.xxx), 160.0f.xxx);
    float3 _968 = step(0.5f.xxx, _964 / dot(_964, 1.0f.xxx).xxx);
    float4 _978 = _25.Sample(_15, ((_696 * _968.x) + (_711 * _968.z)) + (_715 * _968.y));
    _28 _984;
    [unroll]
    for (int _22ident = 0; _22ident < 2; _22ident++)
    {
        _984._m0[_22ident] = float4x4(asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_22ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _989 = _17_m1[0].zw * ddx(_3);
    float2 _991 = _17_m1[0].zw * ddy(_3);
    float2 _994 = float2(_984._m0[0][2].x, _984._m0[0][3].x);
    float2 _995 = _989 * _994;
    float2 _996 = _991 * _994;
    float _997 = dot(_995, _995);
    float _998 = dot(_996, _996);
    float _1001 = log2(max(_997, _998));
    float _1013 = floor(min(max(mad(0.5f, _1001, -min(mad(0.5f, _1001, log2(min(_997, _998)) * (-0.5f)), _984._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float2 _1021 = floor((_184 * float2(_984._m0[0][0].w, _984._m0[0][0].w * _984._m0[0][1].w)) * pow(_214, _1013));
    int _1022 = int(_1013);
    uint _1031 = asuint(_20.Load(int3(int3(int(_1021.x), int(_1021.y), _1022).xy, _1022)).y);
    float _1040 = pow(_237, float(_1031 & 15u));
    float2 _1042 = float2(_1040, _1040 * _984._m0[0][1].w);
    float2 _1047 = float2(_984._m0[0][0].z, _984._m0[0][1].z);
    float2 _1054 = float2(_984._m0[1][0].y, _984._m0[1][1].y);
    float2 _1066 = ((_1042 * _1047) * _1054) * _984._m0[0][0].y;
    float4 _1070 = _21.SampleGrad(_19, float3(mad(mad(frac(_184 * _1042), _1047, float2(float((_1031 >> 14u) & 1023u), float((_1031 >> 4u) & 1023u))), _1054, float2(_984._m0[1][2].y, _984._m0[1][3].y)), float((_1031 >> 24u) & 127u)), _989 * _1066, _991 * _1066);
    bool4 _1073 = (_984._m0[0][2].w != 2202.0f).xxxx;
    float4 _1074 = float4(_1073.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _1070.x, _1073.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _1070.y, _1073.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _1070.z, _1073.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _1070.w);
    float3 _1077 = (_1074.wzy * 2.0f) - 1.0f.xxx;
    float4 _1078 = float4(_1077.x, _1077.y, _1077.z, _1074.x);
    _1078.z = -_1077.z;
    _28 _1084;
    [unroll]
    for (int _23ident = 0; _23ident < 2; _23ident++)
    {
        _1084._m0[_23ident] = float4x4(asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 0)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 16)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 32)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 48)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 4)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 20)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 36)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 52)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 8)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 24)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 40)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 56)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 12)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 28)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 44)), asfloat(_16.Load(_23ident * 64 + _17_m3 * 128 + 60)));
    }
    float2 _1089 = _17_m1[0].zw * ddx(_3);
    float2 _1091 = _17_m1[0].zw * ddy(_3);
    float2 _1094 = float2(_1084._m0[0][2].x, _1084._m0[0][3].x);
    float2 _1095 = _1089 * _1094;
    float2 _1096 = _1091 * _1094;
    float _1097 = dot(_1095, _1095);
    float _1098 = dot(_1096, _1096);
    float _1101 = log2(max(_1097, _1098));
    float _1113 = floor(min(max(mad(0.5f, _1101, -min(mad(0.5f, _1101, log2(min(_1097, _1098)) * (-0.5f)), _1084._m0[0][1].x)) - 0.5f, 0.0f), _17_m1[1].x) + 0.5f);
    float2 _1121 = floor((_184 * float2(_1084._m0[0][0].w, _1084._m0[0][0].w * _1084._m0[0][1].w)) * pow(_214, _1113));
    float _1123 = _1121.x;
    float _1127 = _1121.y;
    int _1139 = int(_1113);
    uint _1146 = asuint(_20.Load(int3(int3(int(_1123), int(_1127), _1139).xy, _1139)).z);
    float _1155 = pow(_237, float(_1146 & 15u));
    float2 _1157 = float2(_1155, _1155 * _1084._m0[0][1].w);
    float2 _1162 = float2(_1084._m0[0][0].z, _1084._m0[0][1].z);
    float2 _1169 = float2(_1084._m0[1][0].z, _1084._m0[1][1].z);
    float2 _1181 = ((_1157 * _1162) * _1169) * _1084._m0[0][0].y;
    float4 _1185 = _23.SampleGrad(_19, float3(mad(mad(frac(_184 * _1157), _1162, float2(float((_1146 >> 14u) & 1023u), float((_1146 >> 4u) & 1023u))), _1169, float2(_1084._m0[1][2].z, _1084._m0[1][3].z)), float((_1146 >> 24u) & 127u)), _1089 * _1181, _1091 * _1181);
    bool4 _1188 = (_1084._m0[0][2].w != 2202.0f).xxxx;
    float4 _1189 = float4(_1188.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _1185.x, _1188.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _1185.y, _1188.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _1185.z, _1188.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _1185.w);
    float2 _1208 = pow(max(abs(_978.yx), 9.9999997473787516355514526367188e-05f.xx), _727) * step((1.0f.xx - clamp(clamp(normalize(_1078.xyz).z, 0.0f, 1.0f).xx + (1.0f.xx - pow(max(abs(_1189.z.xx), 9.9999997473787516355514526367188e-05f.xx), _737)), 0.0f.xx, 1.0f.xx)) + max(9.9999997473787516355514526367188e-06f, _978.z - 0.699999988079071044921875f).xx, _755);
    float2 _1222 = (((_295.xy / (1.0f - _295.z).xx) * 0.562524616718292236328125f.xx) * 0.5f) + 0.5f.xx;
    float3 _1224 = clamp(lerp(_762, _18_m26, _757.y.xxx), 0.0f.xxx, 1.0f.xxx);
    float4 _1225 = float4(_1224.x, _1224.y, _1224.z, _154.w);
    _1225.w = float4(_951.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _948.x, _951.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _948.y, _951.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _948.z, _951.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _948.w).z;
    _9 = float4(_1222.x, _1222.y, 0.0f.xxxx.z, 0.0f.xxxx.w);
    _10 = _1225;
    _11 = float4(clamp((_1208.x + _1189.y) - _1208.y, 0.0f, 1.0f), clamp(_18_m13, 0.0f, 1.0f), clamp(float4(_857.x ? float4(1.0f, 0.0f, 0.0f, 1.0f).x : _854.x, _857.y ? float4(1.0f, 0.0f, 0.0f, 1.0f).y : _854.y, _857.z ? float4(1.0f, 0.0f, 0.0f, 1.0f).z : _854.z, _857.w ? float4(1.0f, 0.0f, 0.0f, 1.0f).w : _854.w).x, 0.0f, 1.0f), float((0u | ((_17_m4 & 7u) << 4u)) | 0u) * 0.0039215688593685626983642578125f);
    _12 = 0.0f.xxxx;
    _13 = float4(fmod(_1123, 256.0f), mad(fmod(_1127, 32.0f), 8.0f, floor(_1123 * 0.00390625f)), mad(fmod(_1113, 4.0f), 64.0f, floor(_1127 * 0.03125f)), mad(_1084._m0[0][3].w, 4.0f, floor(_1113 * 0.25f))) * 0.0039215688593685626983642578125f;
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    _3 = stage_input._3;
    _4 = stage_input._4;
    _5 = stage_input._5;
    _6 = stage_input._6;
    _7 = stage_input._7;
    _8 = stage_input._8;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output._9 = _9;
    stage_output._10 = _10;
    stage_output._11 = _11;
    stage_output._12 = _12;
    stage_output._13 = _13;
    return stage_output;
}

