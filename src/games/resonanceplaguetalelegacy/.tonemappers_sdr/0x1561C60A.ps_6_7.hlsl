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
  float _536;
  float _575;
  float _576;
  float _577;
  float _606;
  float _607;
  float _608;
  float _613;
  float _614;
  float _615;
  float _761;
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
  float _506;
  float _510;
  float _517;
  float _529;
  float _539;
  float4 _542;
  float _551;
  float _552;
  float _563;
  float _588;
  float _589;
  float _590;
  float _625;
  float _627;
  float _629;
  float _631;
  float _638;
  float _642;
  float _655;
  float _680;
  float4 _689;
  float _709;
  float _710;
  float _711;
  float4 _727;
  float _731;
  bool _734;
  int _737;
  float _739;
  float _740;
  float4 _746;
  float4 _755;
  float _764;
  float _770;
  float _771;
  float _772;
  float _774;
  float _777;
  float _784;
  float _785;
  float _801;
  float _808;
  float _809;
  float _810;
  float _813;
  float _819;
  float _831;
  float _843;
  float _850;
  float _851;
  float _852;
  float _874;
  float _875;
  float _876;
  int _897;
  int _898;
  float4 _902;
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
      _575 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _321) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_321, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_312 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _260) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_291, _292), _293))).x) - _193)) + _193);
      _576 = _194;
      _577 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _358) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_358, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_349 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _260) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_289, _290), _293))).z) - _195)) + _195);
    } else {
      _575 = _193;
      _576 = _194;
      _577 = _195;
    }
  } else {
    if ((int)asint((User_000.UserConstant_Z_000[3].y)) > (int)0) {
      _391 = _39.x + TEXCOORD.x;
      _392 = _49 + TEXCOORD.y;
      _395 = t4.Sample(s4, float2(_391, _392));
      _406 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * (((float4)(t5.Sample(s5, float2(_391, _392)))).x);
      _412 = (_406 * (PostProcess_000.PostProcessConstant_Z_000[7].x)) + _391;
      _413 = (_406 * (PostProcess_000.PostProcessConstant_Z_000[7].y)) + _392;
      _575 = (lerp(_193, _395.x, _395.w));
      _576 = (lerp(_194, _395.y, _395.w));
      _577 = ((((_395.z - _195) + ((abs((((float4)(t5.Sample(s5, float2(_412, _413)))).x) * (PostProcess_000.PostProcessConstant_Z_000[6].x)) / (PostProcess_000.PostProcessConstant_Z_000[7].w)) * ((((float4)(t4.Sample(s4, float2(_412, _413)))).z) - _395.z))) * _395.w) + _195);
    } else {
      [branch]
      if ((int)asint((User_000.UserConstant_Z_000[3].x)) > (int)0) {
        _536 = abs(((float4)(t7.Sample(s7, float2(TEXCOORD.x, TEXCOORD.y)))).x);
      } else {
        _447 = t2.SampleLevel(s2, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _451 = (TEXCOORD.x * 2.0f) + -1.0f;
        _452 = (TEXCOORD.y * 2.0f) + -1.0f;
        _488 = mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].w);
        _489 = (mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].w)) / _488;
        _490 = (mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].w)) / _488;
        _491 = (mad(_447.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].z), mad(_452, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].x) * _451))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].w)) / _488;
        _497 = sqrt(((_490 * _490) + (_489 * _489)) + (_491 * _491));
        _506 = (PostProcess_000.PostProcessConstant_Z_000[6].w) * (PostProcess_000.PostProcessConstant_Z_000[5].x);
        _510 = min(max(_497, ((PostProcess_000.PostProcessConstant_Z_000[5].x) - _506)), (_506 + (PostProcess_000.PostProcessConstant_Z_000[5].x)));
        _517 = ((_497 - _510) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_510 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _497);
        _529 = (((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _517)) + ((PostProcess_000.PostProcessConstant_Z_000[7].z) * min(_517, 0.0f))) * (1.0f / (_506 + 1.0f));
        _536 = saturate(max(abs(min((((float4)(t5.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y)))).x), _529)), abs(_529)));
      }
      _539 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * _536;
      _542 = t4.Sample(s4, float2(TEXCOORD.x, TEXCOORD.y));
      _551 = ((PostProcess_000.PostProcessConstant_Z_000[7].x) * _539) + TEXCOORD.x;
      _552 = ((PostProcess_000.PostProcessConstant_Z_000[7].y) * _539) + TEXCOORD.y;
      _563 = saturate(_539 + -1.0f);
      _575 = ((_563 * (_542.x - _193)) + _193);
      _576 = ((_563 * (_542.y - _194)) + _194);
      _577 = ((((_542.z - _195) + (abs(((float4)(t5.Sample(s5, float2(_551, _552)))).x) * ((((float4)(t4.Sample(s4, float2(_551, _552)))).z) - _542.z))) * _563) + _195);
    }
  }
  if (_157) {
    _588 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _589 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _590 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _150.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _606 = (saturate(_588) * (_144.x - _575));
      _607 = (saturate(_589) * (_144.y - _576));
      _608 = (saturate(_590) * (_144.z - _577));
    } else {
      _606 = (_588 * _144.x);
      _607 = (_589 * _144.y);
      _608 = (_590 * _144.z);
    }
    _613 = (_606 + _575);
    _614 = (_607 + _576);
    _615 = (_608 + _577);
  } else {
    _613 = _575;
    _614 = _576;
    _615 = _577;
  }
  _625 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _627 = (_625 * _613) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _629 = (_625 * _614) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _631 = (_625 * _615) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _638 = (_59 * 2.0f) + -1.0f;
  _642 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_60 * 2.0f) + -1.0f);
  _655 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_642 * _642) + (_638 * _638))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _680 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _689 = t3.Sample(s3, float3(((_680 * log2((((_655 * ((_627 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _627)) + _627) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_680 * log2((((_655 * ((_629 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _629)) + _629) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_655 * ((_631 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _631)) + _631) * 335.718017578125f) + 1.0f) * _680) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _709 = ((exp2(_689.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _710 = ((exp2(_689.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _711 = ((exp2(_689.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _727 = t9.Sample(s9, float2(((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.x) * (PostProcess_000.PostProcessConstant_Z_000[9].x)) + (PostProcess_000.PostProcessConstant_Z_000[9].z)), ((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.y) * (PostProcess_000.PostProcessConstant_Z_000[9].y)) + (PostProcess_000.PostProcessConstant_Z_000[9].w))));
  _731 = dot(float3(_709, _710, _711), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _734 = ((PostProcess_000.PostProcessConstant_Z_000[10].x) > 0.0f);
  _737 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
  _739 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.x;
  _740 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.y;
  _746 = t6.Load(int4(((int)(uint(_739)) & 63), ((int)(uint(_740)) & 63), select(_734, _737, 0), 0));
  if ((PostProcess_000.PostProcessConstant_Z_000[10].z) < 1.0f) {
    _755 = t6.SampleLevel(s1, float3((_739 * 0.015625f), (_740 * 0.015625f), select(_734, ((float)((uint)_737)), 0.0f)), 0.0f);
    _761 = (((_746.y - _755.y) * (PostProcess_000.PostProcessConstant_Z_000[10].z)) + _755.y);
  } else {
    _761 = _746.y;
  }
  _764 = _761 * 2.0f;
  _770 = (((_727.x * -2.0f) * _761) + _727.x) * _727.x;
  _771 = ((_764 * _727.y) - _727.y) * _727.y;
  _772 = ((_764 * _727.z) - _727.z) * _727.z;
  _774 = _731 / (_731 + 1.0f);
  _777 = saturate((_774 + -9.999999747378752e-05f) * 1111.111083984375f);
  _784 = (float)((bool)(uint)((PostProcess_000.PostProcessConstant_Z_000[10].y) > 0.0f));
  _785 = dot(float3(_770, _771, _772), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _801 = ((_777 * _777) * (3.0f - (_777 * 2.0f))) * ((((PostProcess_000.PostProcessConstant_Z_000[2].y) - (PostProcess_000.PostProcessConstant_Z_000[2].x)) * _774) + (PostProcess_000.PostProcessConstant_Z_000[2].x));
  _808 = max(0.0f, ((_801 * (lerp(_770, _785, _784))) + _709));
  _809 = max(0.0f, ((_801 * (lerp(_771, _785, _784))) + _710));
  _810 = max(0.0f, ((_801 * (lerp(_772, _785, _784))) + _711));
  _813 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
  _819 = (exp2(_813 * log2(_808)) + -1.0f) / (_808 + -1.0f);
  _831 = ((pow(_809, _813)) + -1.0f) / (_809 + -1.0f);
  _843 = ((pow(_810, _813)) + -1.0f) / (_810 + -1.0f);
  _850 = saturate(select((!(_808 == 1.0f)), ((_819 + -1.0f) / _819), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _813)));
  _851 = saturate(select((!(_809 == 1.0f)), ((_831 + -1.0f) / _831), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _813)));
  _852 = saturate(select((!(_810 == 1.0f)), ((_843 + -1.0f) / _843), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _813)));

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_850, _851, _852);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _874 = select((_850 <= 0.0031308000907301903f), (_850 * 12.920000076293945f), (((pow(_850, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _875 = select((_851 <= 0.0031308000907301903f), (_851 * 12.920000076293945f), (((pow(_851, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _876 = select((_852 <= 0.0031308000907301903f), (_852 * 12.920000076293945f), (((pow(_852, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_874, _875, _876);

    _897 = (int)(uint(SV_Position.x)) & 63;
    _898 = (int)(uint(SV_Position.y)) & 63;
    _902 = t6.Load(int4(_897, _898, _737, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_897, _898, _737, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_902.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_902.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _876);
  }
  SV_Target.w = _137.w;
  return SV_Target;
}