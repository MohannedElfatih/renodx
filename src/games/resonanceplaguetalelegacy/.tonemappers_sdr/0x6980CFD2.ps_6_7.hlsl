#include "../shared.h"

struct GlobalConstant_Z {
  float4 GlobalConstant_Z_000[104];
  int GlobalConstant_Z_1664;
  int3 GlobalConstant_Z_1668;
  float3 GlobalConstant_Z_1680;
  int GlobalConstant_Z_1692;
  float GlobalConstant_Z_1696;
  float GlobalConstant_Z_1700;
  float GlobalConstant_Z_1704;
  float GlobalConstant_Z_1708;
  float GlobalConstant_Z_1712;
  float GlobalConstant_Z_1716;
  float GlobalConstant_Z_1720;
  float GlobalConstant_Z_1724;
};

struct ViewportConstant_Z {
  float2 ViewportConstant_Z_000;
  float2 ViewportConstant_Z_008;
  float2 ViewportConstant_Z_016;
  float2 ViewportConstant_Z_024;
  float2 ViewportConstant_Z_032;
  int2 ViewportConstant_Z_040;
  float ViewportConstant_Z_048;
  int ViewportConstant_Z_052;
  float ViewportConstant_Z_056;
  int ViewportConstant_Z_060;
  float4 ViewportConstant_Z_064;
  float3 ViewportConstant_Z_080;
  float ViewportConstant_Z_092;
};

struct AnchorConstant_Z {
  float4 AnchorConstant_Z_000[7];
  float4 AnchorConstant_Z_112;
  float4 AnchorConstant_Z_128;
  float4 AnchorConstant_Z_144;
  float4 AnchorConstant_Z_160;
  float4 AnchorConstant_Z_176;
  float4 AnchorConstant_Z_192;
  float4 AnchorConstant_Z_208;
  float4 AnchorConstant_Z_224;
  float4 AnchorConstant_Z_240;
  float4 AnchorConstant_Z_256[4];
  float4 AnchorConstant_Z_320;
  float4 AnchorConstant_Z_336;
};

struct ViewConstant_Z {
  float4 ViewConstant_Z_000;
  float4 ViewConstant_Z_016;
  float4 ViewConstant_Z_032[32];
};

struct ProjConstant_Z {
  float4 ProjConstant_Z_000[4][32];
  float2 ProjConstant_Z_2048;
  float2 ProjConstant_Z_2056;
  int4 ProjConstant_Z_2064;
  float4 ProjConstant_Z_2080[4];
};

struct GlobalCB_Z {
  GlobalConstant_Z GlobalCB_Z_000;
  ViewportConstant_Z GlobalCB_Z_1728;
  AnchorConstant_Z GlobalCB_Z_1824;
  ViewConstant_Z GlobalCB_Z_2176;
  ProjConstant_Z GlobalCB_Z_2720;
};

struct PostProcessConstant_Z {
  float4 PostProcessConstant_Z_000[20];
  float4 PostProcessConstant_Z_320[32];
};

struct UserConstant_Z {
  float4 UserConstant_Z_000[84];
};


Texture2DArray<float4> t1 : register(t1);

Texture2DArray<float4> t2 : register(t2);

Texture2D<float4> t0 : register(t0);

Texture3D<float4> t3 : register(t3);

Texture2D<float4> t8 : register(t8);

Texture2D<float4> t12 : register(t12);

Texture2D<float4> t14 : register(t14);

Texture2D<float4> t16 : register(t16);

Texture2D<float4> t17 : register(t17);

cbuffer cb1 : register(b1) { GlobalCB_Z Global_000 : packoffset(c000.x); };

cbuffer cb0 : register(b0) { UserConstant_Z User_000 : packoffset(c000.x); };

cbuffer cb2 : register(b2) {
  PostProcessConstant_Z PostProcess_000 : packoffset(c000.x);
};

SamplerState s0 : register(s0);

SamplerState s3 : register(s3);

SamplerState s8 : register(s8);

SamplerState s14 : register(s14);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  linear float4 TEXCOORD : TEXCOORD,
  precise noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float4 SV_Target;
  float4 _28;
  float4 _34;
  float _38;
  float _48;
  float _49;
  float _50;
  float _51;
  float _57;
  float _58;
  float _63;
  float _64;
  float _73;
  float _79;
  float _80;
  float _90;
  float _92;
  float _97;
  float _98;
  float _101;
  float _110;
  float _111;
  float _114;
  float _119;
  float4 _126;
  float _129;
  float _130;
  float _131;
  float4 _133;
  float4 _139;
  bool _146;
  float _175;
  float _176;
  float _177;
  float _182;
  float _183;
  float _184;
  float _213;
  float _214;
  float _215;
  float _220;
  float _221;
  float _222;
  float _157;
  float _158;
  float _159;
  float _195;
  float _196;
  float _197;
  float _232;
  float _234;
  float _236;
  float _238;
  float _245;
  float _249;
  float _262;
  float _287;
  float4 _296;
  float _318;
  float _319;
  float _325;
  float _332;
  float _338;
  float _345;
  float _351;
  float _358;
  float _359;
  float _360;
  float _382;
  float _383;
  float _384;
  int _405;
  int _408;
  int _409;
  float4 _414;
  _28 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _34 = t16.Sample(s0, float2(TEXCOORD.z, TEXCOORD.w));
  _38 = (_34.y * 0.10000000149011612f) + _28.y;
  _48 = _28.x + TEXCOORD.z;
  _49 = _38 + TEXCOORD.w;
  _50 = _28.x + TEXCOORD.x;
  _51 = _38 + TEXCOORD.y;
  _57 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].x);
  _58 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].y);
  _63 = ((_57 + _48) * 2.0f) + -1.0f;
  _64 = ((_58 + _49) * 2.0f) + -1.0f;
  _73 = ((PostProcess_000.PostProcessConstant_Z_000[19].z) * 2.0f) + -1.0f;
  _79 = (saturate(abs(_63) - _73) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].x)) * _63;
  _80 = (_64 * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].y)) * saturate(abs(_64) - _73);
  _90 = ((_57 + _50) * 2.0f) + -1.0f;
  _92 = ((_58 + _51) * 1.125f) + -0.5625f;
  _97 = sqrt((_90 * _90) + (_92 * _92)) * 0.8715755343437195f;
  _98 = _97 * _97;
  _101 = saturate((_98 + -0.15000000596046448f) * 1.8181819915771484f);
  _110 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _79;
  _111 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _80;
  _114 = _34.x * 0.010840999893844128f;
  _119 = max(((((_101 * _101) * ((PostProcess_000.PostProcessConstant_Z_000[2].w) * sqrt((_79 * _79) + (_80 * _80)))) * _98) * (3.0f - (_101 * 2.0f))), log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_34.y * 0.5f) + _28.z) + -1.0f)) + 1.0f) + 1.0f));
  _126 = t0.SampleLevel(s0, float2(_48, _49), _119);
  _129 = max((((float4)(t0.SampleLevel(s0, float2(((_114 + _48) + _110), (_111 + _49)), _119))).x), 0.0f);
  _130 = max((((float4)(t0.SampleLevel(s0, float2((_48 - _110), ((_49 + _114) - _111)), _119))).y), 0.0f);
  _131 = max(_126.z, 0.0f);
  _133 = t12.SampleLevel(s0, float2(_48, _49), 0.0f);
  _139 = t8.Sample(s8, float2(_50, _51));
  _146 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_146) {
    _157 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _139.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _158 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _139.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _159 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _139.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _175 = (saturate(_157) * (_133.x - _129));
      _176 = (saturate(_158) * (_133.y - _130));
      _177 = (saturate(_159) * (_133.z - _131));
    } else {
      _175 = (_157 * _133.x);
      _176 = (_158 * _133.y);
      _177 = (_159 * _133.z);
    }
    _182 = (_175 + _129);
    _183 = (_176 + _130);
    _184 = (_177 + _131);
  } else {
    _182 = _129;
    _183 = _130;
    _184 = _131;
  }
  if (_146) {
    _195 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _139.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _196 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _139.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _197 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _139.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _213 = (saturate(_195) * (_133.x - _182));
      _214 = (saturate(_196) * (_133.y - _183));
      _215 = (saturate(_197) * (_133.z - _184));
    } else {
      _213 = (_195 * _133.x);
      _214 = (_196 * _133.y);
      _215 = (_197 * _133.z);
    }
    _220 = (_213 + _182);
    _221 = (_214 + _183);
    _222 = (_215 + _184);
  } else {
    _220 = _182;
    _221 = _183;
    _222 = _184;
  }
  _232 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _234 = (_232 * _220) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _236 = (_232 * _221) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _238 = (_232 * _222) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _245 = (_48 * 2.0f) + -1.0f;
  _249 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_49 * 2.0f) + -1.0f);
  _262 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_249 * _249) + (_245 * _245))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _287 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _296 = t3.Sample(s3, float3(((_287 * log2((((_262 * ((_234 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _234)) + _234) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_287 * log2((((_262 * ((_236 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _236)) + _236) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_262 * ((_238 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _238)) + _238) * 335.718017578125f) + 1.0f) * _287) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _318 = ((exp2(_296.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _319 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
  _325 = (exp2(_319 * log2(_318)) + -1.0f) / (_318 + -1.0f);
  _332 = ((exp2(_296.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _338 = ((pow(_332, _319)) + -1.0f) / (_332 + -1.0f);
  _345 = ((exp2(_296.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _351 = ((pow(_345, _319)) + -1.0f) / (_345 + -1.0f);
  _358 = saturate(select((!(_318 == 1.0f)), ((_325 + -1.0f) / _325), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _319)));
  _359 = saturate(select((!(_332 == 1.0f)), ((_338 + -1.0f) / _338), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _319)));
  _360 = saturate(select((!(_345 == 1.0f)), ((_351 + -1.0f) / _351), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _319)));

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_358, _359, _360);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _382 = select((_358 <= 0.0031308000907301903f), (_358 * 12.920000076293945f), (((pow(_358, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _383 = select((_359 <= 0.0031308000907301903f), (_359 * 12.920000076293945f), (((pow(_359, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _384 = select((_360 <= 0.0031308000907301903f), (_360 * 12.920000076293945f), (((pow(_360, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_382, _383, _384);

    _405 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
    _408 = (int)(uint(SV_Position.x)) & 63;
    _409 = (int)(uint(SV_Position.y)) & 63;
    _414 = t2.Load(int4(_408, _409, _405, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_408, _409, _405, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_414.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_414.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _384);
  }
  SV_Target.w = _126.w;
  return SV_Target;
}