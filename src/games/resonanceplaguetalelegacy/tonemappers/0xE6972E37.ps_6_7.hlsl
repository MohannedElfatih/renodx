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

Texture2DArray<float4> t6 : register(t6);

Texture2D<float4> t0 : register(t0);

Texture2D<float4> t2 : register(t2);

Texture3D<float4> t3 : register(t3);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t7 : register(t7);

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

SamplerState s1 : register(s1);

SamplerState s6 : register(s6);

SamplerState s0 : register(s0);

SamplerState s2 : register(s2);

SamplerState s3 : register(s3);

SamplerState s4 : register(s4);

SamplerState s5 : register(s5);

SamplerState s7 : register(s7);

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
  float4 _40;
  float4 _46;
  float _49;
  float _59;
  float _60;
  float _64;
  float4 _67;
  float _377;
  float _378;
  float _379;
  float _380;
  float _427;
  float _428;
  float _429;
  float _434;
  float _435;
  float _436;
  float _465;
  float _550;
  float _587;
  float _777;
  float _816;
  float _817;
  float _818;
  float _847;
  float _848;
  float _849;
  float _854;
  float _855;
  float _856;
  float _1002;
  float _1074;
  float _1083;
  float _1092;
  float _1140;
  float _1141;
  float _1142;
  int _75;
  uint2 _76;
  int _79;
  float _81;
  float _83;
  float _84;
  float _85;
  float _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _94;
  float _95;
  float _96;
  float _100;
  float _101;
  float _104;
  float _108;
  float _114;
  float _115;
  float _116;
  float _120;
  float _121;
  float _124;
  float _128;
  float _139;
  float _142;
  float _152;
  float _153;
  float _154;
  float _155;
  float _156;
  float4 _158;
  float4 _163;
  float4 _168;
  float4 _173;
  float _198;
  float _199;
  float _200;
  float _201;
  float _210;
  float _211;
  float _212;
  float _213;
  int _215;
  int _216;
  float _218;
  float _220;
  float _221;
  float _222;
  float _225;
  float _226;
  float _227;
  float _228;
  float _229;
  float _230;
  float _231;
  float _232;
  float _233;
  float _237;
  float _238;
  float _241;
  float _245;
  float _251;
  float _252;
  float _253;
  float _257;
  float _258;
  float _261;
  float _265;
  float _276;
  float _279;
  float _289;
  float _290;
  float _291;
  float _292;
  float _293;
  float4 _294;
  float4 _299;
  float4 _304;
  float4 _309;
  float _334;
  float _335;
  float _336;
  float _337;
  float _346;
  float _359;
  float _381;
  float _382;
  float _383;
  float4 _385;
  float4 _391;
  bool _398;
  float _409;
  float _410;
  float _411;
  float _443;
  float _444;
  bool _451;
  float _470;
  float _472;
  float _476;
  float _484;
  float _501;
  float _503;
  float _504;
  float _512;
  float _514;
  float _517;
  float _522;
  float _523;
  float _525;
  float _527;
  float _530;
  float _531;
  float _532;
  float _533;
  float _534;
  float _552;
  float _553;
  float _557;
  float _562;
  float _589;
  float _590;
  float _594;
  float _599;
  float _632;
  float _633;
  float4 _636;
  float _647;
  float _653;
  float _654;
  float4 _688;
  float _692;
  float _693;
  float _729;
  float _730;
  float _731;
  float _732;
  float _738;
  float _747;
  float _751;
  float _758;
  float _770;
  float _780;
  float4 _783;
  float _792;
  float _793;
  float _804;
  float _829;
  float _830;
  float _831;
  float _866;
  float _868;
  float _870;
  float _872;
  float _879;
  float _883;
  float _896;
  float _921;
  float4 _930;
  float _950;
  float _951;
  float _952;
  float4 _968;
  float _972;
  bool _975;
  int _978;
  float _980;
  float _981;
  float4 _987;
  float4 _996;
  float _1005;
  float _1011;
  float _1012;
  float _1013;
  float _1015;
  float _1018;
  float _1025;
  float _1026;
  float _1042;
  float _1049;
  float _1050;
  float _1051;
  float _1063;
  float _1064;
  float _1065;
  float _1069;
  float _1078;
  float _1087;
  float _1093;
  float _1094;
  float _1100;
  float _1108;
  float _1114;
  float _1122;
  float _1128;
  float _1164;
  float _1165;
  float _1166;
  int _1187;
  int _1188;
  float4 _1192;
  _40 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _46 = t16.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _49 = (_46.y * 0.10000000149011612f) + _40.y;
  _59 = _40.x + TEXCOORD.z;
  _60 = _49 + TEXCOORD.w;
  _64 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_46.y * 0.5f) + _40.z) + -1.0f)) + 1.0f) + 1.0f);
  _67 = t0.SampleLevel(s1, float2(_59, _60), _64);
  [branch]
  if (_64 > 0.0f) {
    _75 = int(floor(_64));
    t0.GetDimensions(_76.x, _76.y);
    _79 = _75 & 31;
    _81 = (float)((uint)((uint)((uint)(_76.x) >> _79)));
    _83 = (float)((uint)((uint)((uint)(_76.y) >> _79)));
    _84 = 1.0f / _81;
    _85 = 1.0f / _83;
    _88 = (_81 * _59) + -0.5f;
    _89 = (_83 * _60) + -0.5f;
    _90 = frac(_88);
    _91 = frac(_89);
    _92 = floor(_88);
    _93 = floor(_89);
    _94 = 1.0f - _90;
    _95 = 2.0f - _90;
    _96 = 3.0f - _90;
    _100 = (_94 * _94) * _94;
    _101 = (_95 * _95) * _95;
    _104 = _101 - (_100 * 4.0f);
    _108 = (6.0f - _100) - _104;
    _114 = 1.0f - _91;
    _115 = 2.0f - _91;
    _116 = 3.0f - _91;
    _120 = (_114 * _114) * _114;
    _121 = (_115 * _115) * _115;
    _124 = _121 - (_120 * 4.0f);
    _128 = (6.0f - _120) - _124;
    _139 = (_104 + _100) * 0.1666666716337204f;
    _142 = (_124 + _120) * 0.1666666716337204f;
    _152 = ((_92 + -0.5f) + ((_104 * 0.1666666716337204f) / _139)) * _84;
    _153 = ((_92 + 1.5f) + ((((((_101 * 4.0f) - ((_96 * _96) * _96)) - (_100 * 6.0f)) + _108) * 0.1666666716337204f) / (_108 * 0.1666666716337204f))) * _84;
    _154 = ((_93 + -0.5f) + ((_124 * 0.1666666716337204f) / _142)) * _85;
    _155 = ((_93 + 1.5f) + ((((((_121 * 4.0f) - ((_116 * _116) * _116)) - (_120 * 6.0f)) + _128) * 0.1666666716337204f) / (_128 * 0.1666666716337204f))) * _85;
    _156 = float((int)(_75));
    _158 = t0.SampleLevel(s0, float2(_152, _154), _156);
    _163 = t0.SampleLevel(s0, float2(_153, _154), _156);
    _168 = t0.SampleLevel(s0, float2(_152, _155), _156);
    _173 = t0.SampleLevel(s0, float2(_153, _155), _156);
    _198 = ((_168.x - _173.x) * _139) + _173.x;
    _199 = ((_168.y - _173.y) * _139) + _173.y;
    _200 = ((_168.z - _173.z) * _139) + _173.z;
    _201 = ((_168.w - _173.w) * _139) + _173.w;
    _210 = (((lerp(_163.x, _158.x, _139)) - _198) * _142) + _198;
    _211 = (((lerp(_163.y, _158.y, _139)) - _199) * _142) + _199;
    _212 = (((lerp(_163.z, _158.z, _139)) - _200) * _142) + _200;
    _213 = (((lerp(_163.w, _158.w, _139)) - _201) * _142) + _201;
    _215 = int(ceil(_64));
    _216 = _215 & 31;
    _218 = (float)((uint)((uint)((uint)(_76.x) >> _216)));
    _220 = (float)((uint)((uint)((uint)(_76.y) >> _216)));
    _221 = 1.0f / _218;
    _222 = 1.0f / _220;
    _225 = (_218 * _59) + -0.5f;
    _226 = (_220 * _60) + -0.5f;
    _227 = frac(_225);
    _228 = frac(_226);
    _229 = floor(_225);
    _230 = floor(_226);
    _231 = 1.0f - _227;
    _232 = 2.0f - _227;
    _233 = 3.0f - _227;
    _237 = (_231 * _231) * _231;
    _238 = (_232 * _232) * _232;
    _241 = _238 - (_237 * 4.0f);
    _245 = (6.0f - _237) - _241;
    _251 = 1.0f - _228;
    _252 = 2.0f - _228;
    _253 = 3.0f - _228;
    _257 = (_251 * _251) * _251;
    _258 = (_252 * _252) * _252;
    _261 = _258 - (_257 * 4.0f);
    _265 = (6.0f - _257) - _261;
    _276 = (_241 + _237) * 0.1666666716337204f;
    _279 = (_261 + _257) * 0.1666666716337204f;
    _289 = ((_229 + -0.5f) + ((_241 * 0.1666666716337204f) / _276)) * _221;
    _290 = ((_229 + 1.5f) + ((((((_238 * 4.0f) - ((_233 * _233) * _233)) - (_237 * 6.0f)) + _245) * 0.1666666716337204f) / (_245 * 0.1666666716337204f))) * _221;
    _291 = ((_230 + -0.5f) + ((_261 * 0.1666666716337204f) / _279)) * _222;
    _292 = ((_230 + 1.5f) + ((((((_258 * 4.0f) - ((_253 * _253) * _253)) - (_257 * 6.0f)) + _265) * 0.1666666716337204f) / (_265 * 0.1666666716337204f))) * _222;
    _293 = float((int)(_215));
    _294 = t0.SampleLevel(s0, float2(_289, _291), _293);
    _299 = t0.SampleLevel(s0, float2(_290, _291), _293);
    _304 = t0.SampleLevel(s0, float2(_289, _292), _293);
    _309 = t0.SampleLevel(s0, float2(_290, _292), _293);
    _334 = ((_304.x - _309.x) * _276) + _309.x;
    _335 = ((_304.y - _309.y) * _276) + _309.y;
    _336 = ((_304.z - _309.z) * _276) + _309.z;
    _337 = ((_304.w - _309.w) * _276) + _309.w;
    _346 = frac(_64);
    _359 = saturate(_64);
    _377 = ((((_210 - _67.x) + (((_334 - _210) + (((lerp(_299.x, _294.x, _276)) - _334) * _279)) * _346)) * _359) + _67.x);
    _378 = ((((_211 - _67.y) + (((_335 - _211) + (((lerp(_299.y, _294.y, _276)) - _335) * _279)) * _346)) * _359) + _67.y);
    _379 = ((((_212 - _67.z) + (((_336 - _212) + (((lerp(_299.z, _294.z, _276)) - _336) * _279)) * _346)) * _359) + _67.z);
    _380 = ((((_213 - _67.w) + (((_337 - _213) + (((lerp(_299.w, _294.w, _276)) - _337) * _279)) * _346)) * _359) + _67.w);
  } else {
    _377 = _67.x;
    _378 = _67.y;
    _379 = _67.z;
    _380 = _67.w;
  }
  _381 = max(_377, 0.0f);
  _382 = max(_378, 0.0f);
  _383 = max(_379, 0.0f);
  _385 = t12.SampleLevel(s1, float2(_59, _60), 0.0f);
  _391 = t8.Sample(s8, float2((_40.x + TEXCOORD.x), (_49 + TEXCOORD.y)));
  _398 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_398) {
    _409 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _391.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _410 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _391.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _411 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _391.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _427 = (saturate(_409) * (_385.x - _381));
      _428 = (saturate(_410) * (_385.y - _382));
      _429 = (saturate(_411) * (_385.z - _383));
    } else {
      _427 = (_409 * _385.x);
      _428 = (_410 * _385.y);
      _429 = (_411 * _385.z);
    }
    _434 = (_427 + _381);
    _435 = (_428 + _382);
    _436 = (_429 + _383);
  } else {
    _434 = _381;
    _435 = _382;
    _436 = _383;
  }
  [branch]
  if (_398) {
    if ((PostProcess_000.PostProcessConstant_Z_000[7].x) > 0.0f) {
      _443 = _40.x + TEXCOORD.x;
      _444 = _49 + TEXCOORD.y;
      _451 = ((PostProcess_000.PostProcessConstant_Z_000[6].y) == 1.0f);
      if (_451) {
        _465 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _465 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _470 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_443, _444), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _472 = _465 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _476 = min(max(_470, (_465 - _472)), (_472 + _465));
      _484 = ((PostProcess_000.PostProcessConstant_Z_000[5].w) * (_470 - _476)) / ((_476 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _470);
      _501 = -0.0f - (PostProcess_000.PostProcessConstant_Z_000[6].x);
      _503 = _443 + -0.5f;
      _504 = _444 + -0.5f;
      _512 = exp2(log2(sqrt((_504 * _504) + (_503 * _503))) * (PostProcess_000.PostProcessConstant_Z_000[7].y)) * (PostProcess_000.PostProcessConstant_Z_000[7].x);
      _514 = rsqrt(dot(float2(_503, _504), float2(_503, _504)));
      _517 = abs(min(max(min(max(((((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _484)) + (min(_484, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_472 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _501);
      _522 = -0.0f - (_512 * _517);
      _523 = (User_000.UserConstant_Z_000[2].x) * (_514 * _503);
      _525 = (User_000.UserConstant_Z_000[2].y) * (_514 * _504);
      _527 = _517 * _512;
      _530 = (_523 * _522) + _443;
      _531 = (_525 * _522) + _444;
      _532 = (_523 * _527) + _443;
      _533 = (_525 * _527) + _444;
      _534 = max(_64, 0.0f);
      if (_451) {
        _550 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _550 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _552 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_530, _531), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _553 = _550 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _557 = min(max(_552, (_550 - _553)), (_553 + _550));
      _562 = ((_552 - _557) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_557 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _552);
      if (_451) {
        _587 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _587 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _589 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_532, _533), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _590 = _587 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _594 = min(max(_589, (_587 - _590)), (_590 + _587));
      _599 = ((_589 - _594) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_594 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _589);
      _816 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _562) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_562, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_553 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _501) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s1, float2(_530, _531), _534))).x) - _434)) + _434);
      _817 = _435;
      _818 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _599) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_599, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_590 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _501) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s1, float2(_532, _533), _534))).z) - _436)) + _436);
    } else {
      _816 = _434;
      _817 = _435;
      _818 = _436;
    }
  } else {
    if ((int)asint((User_000.UserConstant_Z_000[3].y)) > (int)0) {
      _632 = _40.x + TEXCOORD.x;
      _633 = _49 + TEXCOORD.y;
      _636 = t4.Sample(s4, float2(_632, _633));
      _647 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * (((float4)(t5.Sample(s5, float2(_632, _633)))).x);
      _653 = (_647 * (PostProcess_000.PostProcessConstant_Z_000[7].x)) + _632;
      _654 = (_647 * (PostProcess_000.PostProcessConstant_Z_000[7].y)) + _633;
      _816 = (lerp(_434, _636.x, _636.w));
      _817 = (lerp(_435, _636.y, _636.w));
      _818 = ((((_636.z - _436) + ((abs((((float4)(t5.Sample(s5, float2(_653, _654)))).x) * (PostProcess_000.PostProcessConstant_Z_000[6].x)) / (PostProcess_000.PostProcessConstant_Z_000[7].w)) * ((((float4)(t4.Sample(s4, float2(_653, _654)))).z) - _636.z))) * _636.w) + _436);
    } else {
      [branch]
      if ((int)asint((User_000.UserConstant_Z_000[3].x)) > (int)0) {
        _777 = abs(((float4)(t7.Sample(s7, float2(TEXCOORD.x, TEXCOORD.y)))).x);
      } else {
        _688 = t2.SampleLevel(s2, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _692 = (TEXCOORD.x * 2.0f) + -1.0f;
        _693 = (TEXCOORD.y * 2.0f) + -1.0f;
        _729 = mad(_688.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].z), mad(_693, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].x) * _692))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].w);
        _730 = (mad(_688.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].z), mad(_693, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].x) * _692))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].w)) / _729;
        _731 = (mad(_688.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].z), mad(_693, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].x) * _692))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].w)) / _729;
        _732 = (mad(_688.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].z), mad(_693, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].x) * _692))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].w)) / _729;
        _738 = sqrt(((_731 * _731) + (_730 * _730)) + (_732 * _732));
        _747 = (PostProcess_000.PostProcessConstant_Z_000[6].w) * (PostProcess_000.PostProcessConstant_Z_000[5].x);
        _751 = min(max(_738, ((PostProcess_000.PostProcessConstant_Z_000[5].x) - _747)), (_747 + (PostProcess_000.PostProcessConstant_Z_000[5].x)));
        _758 = ((_738 - _751) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_751 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _738);
        _770 = (((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _758)) + ((PostProcess_000.PostProcessConstant_Z_000[7].z) * min(_758, 0.0f))) * (1.0f / (_747 + 1.0f));
        _777 = saturate(max(abs(min((((float4)(t5.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y)))).x), _770)), abs(_770)));
      }
      _780 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * _777;
      _783 = t4.Sample(s4, float2(TEXCOORD.x, TEXCOORD.y));
      _792 = ((PostProcess_000.PostProcessConstant_Z_000[7].x) * _780) + TEXCOORD.x;
      _793 = ((PostProcess_000.PostProcessConstant_Z_000[7].y) * _780) + TEXCOORD.y;
      _804 = saturate(_780 + -1.0f);
      _816 = ((_804 * (_783.x - _434)) + _434);
      _817 = ((_804 * (_783.y - _435)) + _435);
      _818 = ((((_783.z - _436) + (abs(((float4)(t5.Sample(s5, float2(_792, _793)))).x) * ((((float4)(t4.Sample(s4, float2(_792, _793)))).z) - _783.z))) * _804) + _436);
    }
  }
  if (_398) {
    _829 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _391.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _830 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _391.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _831 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _391.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _847 = (saturate(_829) * (_385.x - _816));
      _848 = (saturate(_830) * (_385.y - _817));
      _849 = (saturate(_831) * (_385.z - _818));
    } else {
      _847 = (_829 * _385.x);
      _848 = (_830 * _385.y);
      _849 = (_831 * _385.z);
    }
    _854 = (_847 + _816);
    _855 = (_848 + _817);
    _856 = (_849 + _818);
  } else {
    _854 = _816;
    _855 = _817;
    _856 = _818;
  }
  _866 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _868 = (_866 * _854) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _870 = (_866 * _855) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _872 = (_866 * _856) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _879 = (_59 * 2.0f) + -1.0f;
  _883 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_60 * 2.0f) + -1.0f);
  _896 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_883 * _883) + (_879 * _879))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _921 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _930 = t3.Sample(s3, float3(((_921 * log2((((_896 * ((_868 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _868)) + _868) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_921 * log2((((_896 * ((_870 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _870)) + _870) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_896 * ((_872 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _872)) + _872) * 335.718017578125f) + 1.0f) * _921) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _950 = ((exp2(_930.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _951 = ((exp2(_930.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _952 = ((exp2(_930.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _968 = t9.Sample(s9, float2(((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.x) * (PostProcess_000.PostProcessConstant_Z_000[9].x)) + (PostProcess_000.PostProcessConstant_Z_000[9].z)), ((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.y) * (PostProcess_000.PostProcessConstant_Z_000[9].y)) + (PostProcess_000.PostProcessConstant_Z_000[9].w))));
  _972 = dot(float3(_950, _951, _952), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _975 = ((PostProcess_000.PostProcessConstant_Z_000[10].x) > 0.0f);
  _978 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
  _980 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.x;
  _981 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.y;
  _987 = t6.Load(int4(((int)(uint(_980)) & 63), ((int)(uint(_981)) & 63), select(_975, _978, 0), 0));
  if ((PostProcess_000.PostProcessConstant_Z_000[10].z) < 1.0f) {
    _996 = t6.SampleLevel(s6, float3((_980 * 0.015625f), (_981 * 0.015625f), select(_975, ((float)((uint)_978)), 0.0f)), 0.0f);
    _1002 = (((_987.y - _996.y) * (PostProcess_000.PostProcessConstant_Z_000[10].z)) + _996.y);
  } else {
    _1002 = _987.y;
  }
  _1005 = _1002 * 2.0f;
  _1011 = (((_968.x * -2.0f) * _1002) + _968.x) * _968.x;
  _1012 = ((_1005 * _968.y) - _968.y) * _968.y;
  _1013 = ((_1005 * _968.z) - _968.z) * _968.z;
  _1015 = _972 / (_972 + 1.0f);
  _1018 = saturate((_1015 + -9.999999747378752e-05f) * 1111.111083984375f);
  _1025 = (float)((bool)(uint)((PostProcess_000.PostProcessConstant_Z_000[10].y) > 0.0f));
  _1026 = dot(float3(_1011, _1012, _1013), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _1042 = ((_1018 * _1018) * (3.0f - (_1018 * 2.0f))) * ((((PostProcess_000.PostProcessConstant_Z_000[2].y) - (PostProcess_000.PostProcessConstant_Z_000[2].x)) * _1015) + (PostProcess_000.PostProcessConstant_Z_000[2].x));
  _1049 = max(0.0f, ((_1042 * (lerp(_1011, _1026, _1025))) + _950));
  _1050 = max(0.0f, ((_1042 * (lerp(_1012, _1026, _1025))) + _951));
  _1051 = max(0.0f, ((_1042 * (lerp(_1013, _1026, _1025))) + _952));
  if (!((PostProcess_000.PostProcessConstant_Z_000[17].x) == 0.0f) &&
      RENODX_TONE_MAP_TYPE == 0.f) {
    _1063 = _1049 * (PostProcess_000.PostProcessConstant_Z_000[10].w);
    _1064 = _1050 * (PostProcess_000.PostProcessConstant_Z_000[10].w);
    _1065 = _1051 * (PostProcess_000.PostProcessConstant_Z_000[10].w);
    if (_1063 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _1069 = 1.0f - (_1063 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _1074 = (((_1069 * _1069) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _1063);
    } else {
      _1074 = _1063;
    }
    if (_1064 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _1078 = 1.0f - (_1064 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _1083 = (((_1078 * _1078) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _1064);
    } else {
      _1083 = _1064;
    }
    if (_1065 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _1087 = 1.0f - (_1065 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _1092 = (((_1087 * _1087) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _1065);
    } else {
      _1092 = _1065;
    }
    _1093 = _1074 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _1094 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
    _1100 = ((pow(_1093, _1094)) + -1.0f) / (_1093 + -1.0f);
    _1108 = _1083 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _1114 = ((pow(_1108, _1094)) + -1.0f) / (_1108 + -1.0f);
    _1122 = _1092 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _1128 = ((pow(_1122, _1094)) + -1.0f) / (_1122 + -1.0f);
    _1140 = ((select((!(_1093 == 1.0f)), ((_1100 + -1.0f) / _1100), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _1094)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _1141 = ((select((!(_1108 == 1.0f)), ((_1114 + -1.0f) / _1114), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _1094)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _1142 = ((select((!(_1122 == 1.0f)), ((_1128 + -1.0f) / _1128), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _1094)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
  } else {
    _1140 = _1049;
    _1141 = _1050;
    _1142 = _1051;
  }

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_1140, _1141, _1142);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _1164 = select((_1140 <= 0.0031308000907301903f), (_1140 * 12.920000076293945f), (((pow(_1140, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1165 = select((_1141 <= 0.0031308000907301903f), (_1141 * 12.920000076293945f), (((pow(_1141, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _1166 = select((_1142 <= 0.0031308000907301903f), (_1142 * 12.920000076293945f), (((pow(_1142, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_1164, _1165, _1166);

    _1187 = (int)(uint(SV_Position.x)) & 63;
    _1188 = (int)(uint(SV_Position.y)) & 63;
    _1192 = t6.Load(int4(_1187, _1188, _978, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_1187, _1188, _978, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_1192.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_1192.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _1166);
  }
  SV_Target.w = _380;
  return SV_Target;
}