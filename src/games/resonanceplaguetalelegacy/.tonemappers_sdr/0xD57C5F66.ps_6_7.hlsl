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

Texture2D<float4> t9 : register(t9);

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

SamplerState s1 : register(s1);

SamplerState s3 : register(s3);

SamplerState s8 : register(s8);

SamplerState s9 : register(s9);

SamplerState s14 : register(s14);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  linear float4 TEXCOORD : TEXCOORD,
  precise noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float4 SV_Target;
  float4 _31;
  float4 _37;
  float _41;
  float _51;
  float _52;
  float _53;
  float _54;
  float _60;
  float _61;
  float _66;
  float _67;
  float _76;
  float _82;
  float _83;
  float _93;
  float _95;
  float _100;
  float _101;
  float _104;
  float _113;
  float _114;
  float _117;
  float _122;
  float4 _129;
  float _132;
  float _133;
  float _134;
  float4 _136;
  float4 _142;
  bool _149;
  float _178;
  float _179;
  float _180;
  float _185;
  float _186;
  float _187;
  float _216;
  float _217;
  float _218;
  float _223;
  float _224;
  float _225;
  float _371;
  float _160;
  float _161;
  float _162;
  float _198;
  float _199;
  float _200;
  float _235;
  float _237;
  float _239;
  float _241;
  float _248;
  float _252;
  float _265;
  float _290;
  float4 _299;
  float _319;
  float _320;
  float _321;
  float4 _337;
  float _341;
  bool _344;
  int _347;
  float _349;
  float _350;
  float4 _356;
  float4 _365;
  float _374;
  float _380;
  float _381;
  float _382;
  float _384;
  float _387;
  float _394;
  float _395;
  float _411;
  float _418;
  float _419;
  float _420;
  float _423;
  float _429;
  float _441;
  float _453;
  float _460;
  float _461;
  float _462;
  float _484;
  float _485;
  float _486;
  int _507;
  int _508;
  float4 _512;
  _31 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _37 = t16.Sample(s0, float2(TEXCOORD.z, TEXCOORD.w));
  _41 = (_37.y * 0.10000000149011612f) + _31.y;
  _51 = _31.x + TEXCOORD.z;
  _52 = _41 + TEXCOORD.w;
  _53 = _31.x + TEXCOORD.x;
  _54 = _41 + TEXCOORD.y;
  _60 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].x);
  _61 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].y);
  _66 = ((_60 + _51) * 2.0f) + -1.0f;
  _67 = ((_61 + _52) * 2.0f) + -1.0f;
  _76 = ((PostProcess_000.PostProcessConstant_Z_000[19].z) * 2.0f) + -1.0f;
  _82 = (saturate(abs(_66) - _76) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].x)) * _66;
  _83 = (_67 * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].y)) * saturate(abs(_67) - _76);
  _93 = ((_60 + _53) * 2.0f) + -1.0f;
  _95 = ((_61 + _54) * 1.125f) + -0.5625f;
  _100 = sqrt((_93 * _93) + (_95 * _95)) * 0.8715755343437195f;
  _101 = _100 * _100;
  _104 = saturate((_101 + -0.15000000596046448f) * 1.8181819915771484f);
  _113 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _82;
  _114 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _83;
  _117 = _37.x * 0.010840999893844128f;
  _122 = max(((((_104 * _104) * ((PostProcess_000.PostProcessConstant_Z_000[2].w) * sqrt((_82 * _82) + (_83 * _83)))) * _101) * (3.0f - (_104 * 2.0f))), log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_37.y * 0.5f) + _31.z) + -1.0f)) + 1.0f) + 1.0f));
  _129 = t0.SampleLevel(s0, float2(_51, _52), _122);
  _132 = max((((float4)(t0.SampleLevel(s0, float2(((_117 + _51) + _113), (_114 + _52)), _122))).x), 0.0f);
  _133 = max((((float4)(t0.SampleLevel(s0, float2((_51 - _113), ((_52 + _117) - _114)), _122))).y), 0.0f);
  _134 = max(_129.z, 0.0f);
  _136 = t12.SampleLevel(s0, float2(_51, _52), 0.0f);
  _142 = t8.Sample(s8, float2(_53, _54));
  _149 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_149) {
    _160 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _142.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _161 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _142.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _162 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _142.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _178 = (saturate(_160) * (_136.x - _132));
      _179 = (saturate(_161) * (_136.y - _133));
      _180 = (saturate(_162) * (_136.z - _134));
    } else {
      _178 = (_160 * _136.x);
      _179 = (_161 * _136.y);
      _180 = (_162 * _136.z);
    }
    _185 = (_178 + _132);
    _186 = (_179 + _133);
    _187 = (_180 + _134);
  } else {
    _185 = _132;
    _186 = _133;
    _187 = _134;
  }
  if (_149) {
    _198 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _142.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _199 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _142.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _200 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _142.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _216 = (saturate(_198) * (_136.x - _185));
      _217 = (saturate(_199) * (_136.y - _186));
      _218 = (saturate(_200) * (_136.z - _187));
    } else {
      _216 = (_198 * _136.x);
      _217 = (_199 * _136.y);
      _218 = (_200 * _136.z);
    }
    _223 = (_216 + _185);
    _224 = (_217 + _186);
    _225 = (_218 + _187);
  } else {
    _223 = _185;
    _224 = _186;
    _225 = _187;
  }
  _235 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _237 = (_235 * _223) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _239 = (_235 * _224) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _241 = (_235 * _225) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _248 = (_51 * 2.0f) + -1.0f;
  _252 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_52 * 2.0f) + -1.0f);
  _265 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_252 * _252) + (_248 * _248))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _290 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _299 = t3.Sample(s3, float3(((_290 * log2((((_265 * ((_237 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _237)) + _237) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_290 * log2((((_265 * ((_239 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _239)) + _239) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_265 * ((_241 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _241)) + _241) * 335.718017578125f) + 1.0f) * _290) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _319 = ((exp2(_299.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _320 = ((exp2(_299.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _321 = ((exp2(_299.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _337 = t9.Sample(s9, float2(((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.x) * (PostProcess_000.PostProcessConstant_Z_000[9].x)) + (PostProcess_000.PostProcessConstant_Z_000[9].z)), ((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.y) * (PostProcess_000.PostProcessConstant_Z_000[9].y)) + (PostProcess_000.PostProcessConstant_Z_000[9].w))));
  _341 = dot(float3(_319, _320, _321), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _344 = ((PostProcess_000.PostProcessConstant_Z_000[10].x) > 0.0f);
  _347 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
  _349 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.x;
  _350 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.y;
  _356 = t2.Load(int4(((int)(uint(_349)) & 63), ((int)(uint(_350)) & 63), select(_344, _347, 0), 0));
  if ((PostProcess_000.PostProcessConstant_Z_000[10].z) < 1.0f) {
    _365 = t2.SampleLevel(s1, float3((_349 * 0.015625f), (_350 * 0.015625f), select(_344, ((float)((uint)_347)), 0.0f)), 0.0f);
    _371 = (((_356.y - _365.y) * (PostProcess_000.PostProcessConstant_Z_000[10].z)) + _365.y);
  } else {
    _371 = _356.y;
  }
  _374 = _371 * 2.0f;
  _380 = (((_337.x * -2.0f) * _371) + _337.x) * _337.x;
  _381 = ((_374 * _337.y) - _337.y) * _337.y;
  _382 = ((_374 * _337.z) - _337.z) * _337.z;
  _384 = _341 / (_341 + 1.0f);
  _387 = saturate((_384 + -9.999999747378752e-05f) * 1111.111083984375f);
  _394 = (float)((bool)(uint)((PostProcess_000.PostProcessConstant_Z_000[10].y) > 0.0f));
  _395 = dot(float3(_380, _381, _382), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _411 = ((_387 * _387) * (3.0f - (_387 * 2.0f))) * ((((PostProcess_000.PostProcessConstant_Z_000[2].y) - (PostProcess_000.PostProcessConstant_Z_000[2].x)) * _384) + (PostProcess_000.PostProcessConstant_Z_000[2].x));
  _418 = max(0.0f, ((_411 * (lerp(_380, _395, _394))) + _319));
  _419 = max(0.0f, ((_411 * (lerp(_381, _395, _394))) + _320));
  _420 = max(0.0f, ((_411 * (lerp(_382, _395, _394))) + _321));
  _423 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
  _429 = (exp2(_423 * log2(_418)) + -1.0f) / (_418 + -1.0f);
  _441 = ((pow(_419, _423)) + -1.0f) / (_419 + -1.0f);
  _453 = ((pow(_420, _423)) + -1.0f) / (_420 + -1.0f);
  _460 = saturate(select((!(_418 == 1.0f)), ((_429 + -1.0f) / _429), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _423)));
  _461 = saturate(select((!(_419 == 1.0f)), ((_441 + -1.0f) / _441), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _423)));
  _462 = saturate(select((!(_420 == 1.0f)), ((_453 + -1.0f) / _453), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _423)));

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_460, _461, _462);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _484 = select((_460 <= 0.0031308000907301903f), (_460 * 12.920000076293945f), (((pow(_460, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _485 = select((_461 <= 0.0031308000907301903f), (_461 * 12.920000076293945f), (((pow(_461, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _486 = select((_462 <= 0.0031308000907301903f), (_462 * 12.920000076293945f), (((pow(_462, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_484, _485, _486);

    _507 = (int)(uint(SV_Position.x)) & 63;
    _508 = (int)(uint(SV_Position.y)) & 63;
    _512 = t2.Load(int4(_507, _508, _347, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_507, _508, _347, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_512.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_512.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _486);
  }
  SV_Target.w = _129.w;
  return SV_Target;
}