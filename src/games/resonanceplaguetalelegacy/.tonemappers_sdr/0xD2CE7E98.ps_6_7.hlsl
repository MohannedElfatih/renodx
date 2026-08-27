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

SamplerState s0 : register(s0);

SamplerState s1 : register(s1);

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
  float4 _39;
  float4 _45;
  float _49;
  float _59;
  float _60;
  float _61;
  float _62;
  float _64;
  float _68;
  float _69;
  float _74;
  float _75;
  float _84;
  float _90;
  float _91;
  float _101;
  float _103;
  float _108;
  float _109;
  float _112;
  float _121;
  float _122;
  float _123;
  float _125;
  float _127;
  float _130;
  float4 _137;
  float _140;
  float _141;
  float _142;
  float4 _144;
  float4 _150;
  bool _157;
  float _186;
  float _187;
  float _188;
  float _193;
  float _194;
  float _195;
  float _224;
  float _309;
  float _346;
  float _542;
  float _581;
  float _582;
  float _583;
  float _612;
  float _613;
  float _614;
  float _619;
  float _620;
  float _621;
  float _767;
  float _168;
  float _169;
  float _170;
  float _202;
  float _203;
  bool _210;
  float _229;
  float _231;
  float _235;
  float _243;
  float _260;
  float _262;
  float _263;
  float _271;
  float _273;
  float _276;
  float _281;
  float _282;
  float _284;
  float _286;
  float _289;
  float _290;
  float _291;
  float _292;
  float _293;
  float _311;
  float _312;
  float _316;
  float _321;
  float _348;
  float _349;
  float _353;
  float _358;
  float _391;
  float _392;
  float4 _395;
  float _406;
  float _412;
  float _413;
  float4 _447;
  float _451;
  float _452;
  float _488;
  float _489;
  float _490;
  float _491;
  float _497;
  float _508;
  float _511;
  float _515;
  float _523;
  float _535;
  float _545;
  float4 _548;
  float _557;
  float _558;
  float _569;
  float _594;
  float _595;
  float _596;
  float _631;
  float _633;
  float _635;
  float _637;
  float _644;
  float _648;
  float _661;
  float _686;
  float4 _695;
  float _715;
  float _716;
  float _717;
  float4 _733;
  float _737;
  bool _740;
  int _743;
  float _745;
  float _746;
  float4 _752;
  float4 _761;
  float _770;
  float _776;
  float _777;
  float _778;
  float _780;
  float _783;
  float _790;
  float _791;
  float _807;
  float _814;
  float _815;
  float _816;
  float _819;
  float _825;
  float _837;
  float _849;
  float _856;
  float _857;
  float _858;
  float _880;
  float _881;
  float _882;
  int _903;
  int _904;
  float4 _908;
  _39 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _45 = t16.Sample(s0, float2(TEXCOORD.z, TEXCOORD.w));
  _49 = (_45.y * 0.10000000149011612f) + _39.y;
  _59 = _39.x + TEXCOORD.z;
  _60 = _49 + TEXCOORD.w;
  _61 = _39.x + TEXCOORD.x;
  _62 = _49 + TEXCOORD.y;
  _64 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_45.y * 0.5f) + _39.z) + -1.0f)) + 1.0f) + 1.0f);
  _68 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].x);
  _69 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].y);
  _74 = ((_68 + _59) * 2.0f) + -1.0f;
  _75 = ((_69 + _60) * 2.0f) + -1.0f;
  _84 = ((PostProcess_000.PostProcessConstant_Z_000[19].z) * 2.0f) + -1.0f;
  _90 = (saturate(abs(_74) - _84) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].x)) * _74;
  _91 = (_75 * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].y)) * saturate(abs(_75) - _84);
  _101 = ((_68 + _61) * 2.0f) + -1.0f;
  _103 = ((_69 + _62) * 1.125f) + -0.5625f;
  _108 = sqrt((_101 * _101) + (_103 * _103)) * 0.8715755343437195f;
  _109 = _108 * _108;
  _112 = saturate((_109 + -0.15000000596046448f) * 1.8181819915771484f);
  _121 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _90;
  _122 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _91;
  _123 = _122 + _60;
  _125 = _45.x * 0.010840999893844128f;
  _127 = (_59 + _125) + _121;
  _130 = max(((((_112 * _112) * ((PostProcess_000.PostProcessConstant_Z_000[2].w) * sqrt((_90 * _90) + (_91 * _91)))) * _109) * (3.0f - (_112 * 2.0f))), _64);
  _137 = t0.SampleLevel(s0, float2(_59, _60), _130);
  _140 = max((((float4)(t0.SampleLevel(s0, float2(_127, _123), _130))).x), 0.0f);
  _141 = max((((float4)(t0.SampleLevel(s0, float2((_59 - _121), ((_60 + _125) - _122)), _130))).y), 0.0f);
  _142 = max(_137.z, 0.0f);
  _144 = t12.SampleLevel(s0, float2(_59, _60), 0.0f);
  _150 = t8.Sample(s8, float2(_61, _62));
  _157 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_157) {
    _168 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _169 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _170 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _186 = (saturate(_168) * (_144.x - _140));
      _187 = (saturate(_169) * (_144.y - _141));
      _188 = (saturate(_170) * (_144.z - _142));
    } else {
      _186 = (_168 * _144.x);
      _187 = (_169 * _144.y);
      _188 = (_170 * _144.z);
    }
    _193 = (_186 + _140);
    _194 = (_187 + _141);
    _195 = (_188 + _142);
  } else {
    _193 = _140;
    _194 = _141;
    _195 = _142;
  }
  [branch]
  if (_157) {
    if ((PostProcess_000.PostProcessConstant_Z_000[7].x) > 0.0f) {
      _202 = _39.x + TEXCOORD.x;
      _203 = _49 + TEXCOORD.y;
      _210 = ((PostProcess_000.PostProcessConstant_Z_000[6].y) == 1.0f);
      if (_210) {
        _224 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _224 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _229 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_202, _203), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _231 = _224 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _235 = min(max(_229, (_224 - _231)), (_231 + _224));
      _243 = ((PostProcess_000.PostProcessConstant_Z_000[5].w) * (_229 - _235)) / ((_235 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _229);
      _260 = -0.0f - (PostProcess_000.PostProcessConstant_Z_000[6].x);
      _262 = _202 + -0.5f;
      _263 = _203 + -0.5f;
      _271 = exp2(log2(sqrt((_263 * _263) + (_262 * _262))) * (PostProcess_000.PostProcessConstant_Z_000[7].y)) * (PostProcess_000.PostProcessConstant_Z_000[7].x);
      _273 = rsqrt(dot(float2(_262, _263), float2(_262, _263)));
      _276 = abs(min(max(min(max(((((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _243)) + (min(_243, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_231 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _260);
      _281 = -0.0f - (_271 * _276);
      _282 = (User_000.UserConstant_Z_000[2].x) * (_273 * _262);
      _284 = (User_000.UserConstant_Z_000[2].y) * (_273 * _263);
      _286 = _276 * _271;
      _289 = (_282 * _286) + _202;
      _290 = (_284 * _286) + _203;
      _291 = (_282 * _281) + _127;
      _292 = (_284 * _281) + _123;
      _293 = max(_64, _130);
      if (_210) {
        _309 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _309 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _311 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_291, _292), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _312 = _309 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _316 = min(max(_311, (_309 - _312)), (_312 + _309));
      _321 = ((_311 - _316) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_316 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _311);
      if (_210) {
        _346 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _346 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _348 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_289, _290), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _349 = _346 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _353 = min(max(_348, (_346 - _349)), (_349 + _346));
      _358 = ((_348 - _353) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_353 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _348);
      _581 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _321) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_321, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_312 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _260) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_291, _292), _293))).x) - _193)) + _193);
      _582 = _194;
      _583 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _358) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_358, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_349 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _260) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_289, _290), _293))).z) - _195)) + _195);
    } else {
      _581 = _193;
      _582 = _194;
      _583 = _195;
    }
  } else {
    if ((int)asint((User_000.UserConstant_Z_000[3].y)) > (int)0) {
      _391 = _39.x + TEXCOORD.x;
      _392 = _49 + TEXCOORD.y;
      _395 = t4.Sample(s4, float2(_391, _392));
      _406 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * (((float4)(t5.Sample(s5, float2(_391, _392)))).x);
      _412 = (_406 * (PostProcess_000.PostProcessConstant_Z_000[7].x)) + _391;
      _413 = (_406 * (PostProcess_000.PostProcessConstant_Z_000[7].y)) + _392;
      _581 = (lerp(_193, _395.x, _395.w));
      _582 = (lerp(_194, _395.y, _395.w));
      _583 = ((((_395.z - _195) + ((abs((((float4)(t5.Sample(s5, float2(_412, _413)))).x) * (PostProcess_000.PostProcessConstant_Z_000[6].x)) / (PostProcess_000.PostProcessConstant_Z_000[7].w)) * ((((float4)(t4.Sample(s4, float2(_412, _413)))).z) - _395.z))) * _395.w) + _195);
    } else {
      [branch]
      if ((int)asint((User_000.UserConstant_Z_000[3].x)) > (int)0) {
        _542 = abs(((float4)(t7.Sample(s7, float2(TEXCOORD.x, TEXCOORD.y)))).x);
      } else {
        _447 = t2.SampleLevel(s2, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _451 = (TEXCOORD.x * 2.0f) + -1.0f;
        _452 = (TEXCOORD.y * 2.0f) + -1.0f;
        _488 = mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].w);
        _489 = (mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].w)) / _488;
        _490 = (mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].w)) / _488;
        _491 = (mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].w)) / _488;
        _497 = sqrt(((_490 * _490) + (_489 * _489)) + (_491 * _491));
        _508 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
        _511 = (PostProcess_000.PostProcessConstant_Z_000[6].w) * _508;
        _515 = min(max(_497, (_508 - _511)), (_511 + _508));
        _523 = ((PostProcess_000.PostProcessConstant_Z_000[5].w) * (_497 - _515)) / ((_515 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _497);
        _535 = (((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _523)) + ((PostProcess_000.PostProcessConstant_Z_000[7].z) * min(_523, 0.0f))) * (1.0f / (_511 + 1.0f));
        _542 = saturate(max(abs(min((((float4)(t5.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y)))).x), _535)), abs(_535)));
      }
      _545 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * _542;
      _548 = t4.Sample(s4, float2(TEXCOORD.x, TEXCOORD.y));
      _557 = ((PostProcess_000.PostProcessConstant_Z_000[7].x) * _545) + TEXCOORD.x;
      _558 = ((PostProcess_000.PostProcessConstant_Z_000[7].y) * _545) + TEXCOORD.y;
      _569 = saturate(_545 + -1.0f);
      _581 = ((_569 * (_548.x - _193)) + _193);
      _582 = ((_569 * (_548.y - _194)) + _194);
      _583 = ((((_548.z - _195) + (abs(((float4)(t5.Sample(s5, float2(_557, _558)))).x) * ((((float4)(t4.Sample(s4, float2(_557, _558)))).z) - _548.z))) * _569) + _195);
    }
  }
  if (_157) {
    _594 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _595 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _596 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _612 = (saturate(_594) * (_144.x - _581));
      _613 = (saturate(_595) * (_144.y - _582));
      _614 = (saturate(_596) * (_144.z - _583));
    } else {
      _612 = (_594 * _144.x);
      _613 = (_595 * _144.y);
      _614 = (_596 * _144.z);
    }
    _619 = (_612 + _581);
    _620 = (_613 + _582);
    _621 = (_614 + _583);
  } else {
    _619 = _581;
    _620 = _582;
    _621 = _583;
  }
  _631 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _633 = (_631 * _619) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _635 = (_631 * _620) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _637 = (_631 * _621) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _644 = (_59 * 2.0f) + -1.0f;
  _648 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_60 * 2.0f) + -1.0f);
  _661 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_648 * _648) + (_644 * _644))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _686 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _695 = t3.Sample(s3, float3(((_686 * log2((((_661 * ((_633 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _633)) + _633) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_686 * log2((((_661 * ((_635 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _635)) + _635) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_661 * ((_637 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _637)) + _637) * 335.718017578125f) + 1.0f) * _686) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _715 = ((exp2(_695.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _716 = ((exp2(_695.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _717 = ((exp2(_695.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _733 = t9.Sample(s9, float2(((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.x) * (PostProcess_000.PostProcessConstant_Z_000[9].x)) + (PostProcess_000.PostProcessConstant_Z_000[9].z)), ((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.y) * (PostProcess_000.PostProcessConstant_Z_000[9].y)) + (PostProcess_000.PostProcessConstant_Z_000[9].w))));
  _737 = dot(float3(_715, _716, _717), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _740 = ((PostProcess_000.PostProcessConstant_Z_000[10].x) > 0.0f);
  _743 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
  _745 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.x;
  _746 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.y;
  _752 = t6.Load(int4(((int)(uint(_745)) & 63), ((int)(uint(_746)) & 63), select(_740, _743, 0), 0));
  if ((PostProcess_000.PostProcessConstant_Z_000[10].z) < 1.0f) {
    _761 = t6.SampleLevel(s1, float3((_745 * 0.015625f), (_746 * 0.015625f), select(_740, ((float)((uint)_743)), 0.0f)), 0.0f);
    _767 = (((_752.y - _761.y) * (PostProcess_000.PostProcessConstant_Z_000[10].z)) + _761.y);
  } else {
    _767 = _752.y;
  }
  _770 = _767 * 2.0f;
  _776 = (((_733.x * -2.0f) * _767) + _733.x) * _733.x;
  _777 = ((_770 * _733.y) - _733.y) * _733.y;
  _778 = ((_770 * _733.z) - _733.z) * _733.z;
  _780 = _737 / (_737 + 1.0f);
  _783 = saturate((_780 + -9.999999747378752e-05f) * 1111.111083984375f);
  _790 = (float)((bool)(uint)((PostProcess_000.PostProcessConstant_Z_000[10].y) > 0.0f));
  _791 = dot(float3(_776, _777, _778), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _807 = ((_783 * _783) * (3.0f - (_783 * 2.0f))) * ((((PostProcess_000.PostProcessConstant_Z_000[2].y) - (PostProcess_000.PostProcessConstant_Z_000[2].x)) * _780) + (PostProcess_000.PostProcessConstant_Z_000[2].x));
  _814 = max(0.0f, ((_807 * (lerp(_776, _791, _790))) + _715));
  _815 = max(0.0f, ((_807 * (lerp(_777, _791, _790))) + _716));
  _816 = max(0.0f, ((_807 * (lerp(_778, _791, _790))) + _717));
  _819 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
  _825 = (exp2(_819 * log2(_814)) + -1.0f) / (_814 + -1.0f);
  _837 = ((pow(_815, _819)) + -1.0f) / (_815 + -1.0f);
  _849 = ((pow(_816, _819)) + -1.0f) / (_816 + -1.0f);
  _856 = saturate(select((!(_814 == 1.0f)), ((_825 + -1.0f) / _825), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _819)));
  _857 = saturate(select((!(_815 == 1.0f)), ((_837 + -1.0f) / _837), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _819)));
  _858 = saturate(select((!(_816 == 1.0f)), ((_849 + -1.0f) / _849), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _819)));

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_856, _857, _858);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _880 = select((_856 <= 0.0031308000907301903f), (_856 * 12.920000076293945f), (((pow(_856, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _881 = select((_857 <= 0.0031308000907301903f), (_857 * 12.920000076293945f), (((pow(_857, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _882 = select((_858 <= 0.0031308000907301903f), (_858 * 12.920000076293945f), (((pow(_858, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_880, _881, _882);

    _903 = (int)(uint(SV_Position.x)) & 63;
    _904 = (int)(uint(SV_Position.y)) & 63;
    _908 = t6.Load(int4(_903, _904, _743, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_903, _904, _743, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_908.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_908.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _882);
  }
  SV_Target.w = _137.w;
  return SV_Target;
}