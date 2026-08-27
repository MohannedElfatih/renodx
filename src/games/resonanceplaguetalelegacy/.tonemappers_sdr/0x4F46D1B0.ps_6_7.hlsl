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

SamplerState s1 : register(s1);

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
  float4 _29;
  float4 _35;
  float _38;
  float _48;
  float _49;
  float _53;
  float4 _56;
  float _366;
  float _367;
  float _368;
  float _369;
  float _416;
  float _417;
  float _418;
  float _423;
  float _424;
  float _425;
  float _454;
  float _455;
  float _456;
  float _461;
  float _462;
  float _463;
  int _64;
  uint2 _65;
  int _68;
  float _70;
  float _72;
  float _73;
  float _74;
  float _77;
  float _78;
  float _79;
  float _80;
  float _81;
  float _82;
  float _83;
  float _84;
  float _85;
  float _89;
  float _90;
  float _93;
  float _97;
  float _103;
  float _104;
  float _105;
  float _109;
  float _110;
  float _113;
  float _117;
  float _128;
  float _131;
  float _141;
  float _142;
  float _143;
  float _144;
  float _145;
  float4 _147;
  float4 _152;
  float4 _157;
  float4 _162;
  float _187;
  float _188;
  float _189;
  float _190;
  float _199;
  float _200;
  float _201;
  float _202;
  int _204;
  int _205;
  float _207;
  float _209;
  float _210;
  float _211;
  float _214;
  float _215;
  float _216;
  float _217;
  float _218;
  float _219;
  float _220;
  float _221;
  float _222;
  float _226;
  float _227;
  float _230;
  float _234;
  float _240;
  float _241;
  float _242;
  float _246;
  float _247;
  float _250;
  float _254;
  float _265;
  float _268;
  float _278;
  float _279;
  float _280;
  float _281;
  float _282;
  float4 _283;
  float4 _288;
  float4 _293;
  float4 _298;
  float _323;
  float _324;
  float _325;
  float _326;
  float _335;
  float _348;
  float _370;
  float _371;
  float _372;
  float4 _374;
  float4 _380;
  bool _387;
  float _398;
  float _399;
  float _400;
  float _436;
  float _437;
  float _438;
  float _473;
  float _475;
  float _477;
  float _479;
  float _486;
  float _490;
  float _503;
  float _528;
  float4 _537;
  float _559;
  float _560;
  float _566;
  float _573;
  float _579;
  float _586;
  float _592;
  float _599;
  float _600;
  float _601;
  float _623;
  float _624;
  float _625;
  int _646;
  int _649;
  int _650;
  float4 _655;
  _29 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _35 = t16.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _38 = (_35.y * 0.10000000149011612f) + _29.y;
  _48 = _29.x + TEXCOORD.z;
  _49 = _38 + TEXCOORD.w;
  _53 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_35.y * 0.5f) + _29.z) + -1.0f)) + 1.0f) + 1.0f);
  _56 = t0.SampleLevel(s1, float2(_48, _49), _53);
  [branch]
  if (_53 > 0.0f) {
    _64 = int(floor(_53));
    t0.GetDimensions(_65.x, _65.y);
    _68 = _64 & 31;
    _70 = (float)((uint)((uint)((uint)(_65.x) >> _68)));
    _72 = (float)((uint)((uint)((uint)(_65.y) >> _68)));
    _73 = 1.0f / _70;
    _74 = 1.0f / _72;
    _77 = (_70 * _48) + -0.5f;
    _78 = (_72 * _49) + -0.5f;
    _79 = frac(_77);
    _80 = frac(_78);
    _81 = floor(_77);
    _82 = floor(_78);
    _83 = 1.0f - _79;
    _84 = 2.0f - _79;
    _85 = 3.0f - _79;
    _89 = (_83 * _83) * _83;
    _90 = (_84 * _84) * _84;
    _93 = _90 - (_89 * 4.0f);
    _97 = (6.0f - _89) - _93;
    _103 = 1.0f - _80;
    _104 = 2.0f - _80;
    _105 = 3.0f - _80;
    _109 = (_103 * _103) * _103;
    _110 = (_104 * _104) * _104;
    _113 = _110 - (_109 * 4.0f);
    _117 = (6.0f - _109) - _113;
    _128 = (_93 + _89) * 0.1666666716337204f;
    _131 = (_113 + _109) * 0.1666666716337204f;
    _141 = ((_81 + -0.5f) + ((_93 * 0.1666666716337204f) / _128)) * _73;
    _142 = ((_81 + 1.5f) + ((((((_90 * 4.0f) - ((_85 * _85) * _85)) - (_89 * 6.0f)) + _97) * 0.1666666716337204f) / (_97 * 0.1666666716337204f))) * _73;
    _143 = ((_82 + -0.5f) + ((_113 * 0.1666666716337204f) / _131)) * _74;
    _144 = ((_82 + 1.5f) + ((((((_110 * 4.0f) - ((_105 * _105) * _105)) - (_109 * 6.0f)) + _117) * 0.1666666716337204f) / (_117 * 0.1666666716337204f))) * _74;
    _145 = float((int)(_64));
    _147 = t0.SampleLevel(s0, float2(_141, _143), _145);
    _152 = t0.SampleLevel(s0, float2(_142, _143), _145);
    _157 = t0.SampleLevel(s0, float2(_141, _144), _145);
    _162 = t0.SampleLevel(s0, float2(_142, _144), _145);
    _187 = ((_157.x - _162.x) * _128) + _162.x;
    _188 = ((_157.y - _162.y) * _128) + _162.y;
    _189 = ((_157.z - _162.z) * _128) + _162.z;
    _190 = ((_157.w - _162.w) * _128) + _162.w;
    _199 = (((lerp(_152.x, _147.x, _128)) - _187) * _131) + _187;
    _200 = (((lerp(_152.y, _147.y, _128)) - _188) * _131) + _188;
    _201 = (((lerp(_152.z, _147.z, _128)) - _189) * _131) + _189;
    _202 = (((lerp(_152.w, _147.w, _128)) - _190) * _131) + _190;
    _204 = int(ceil(_53));
    _205 = _204 & 31;
    _207 = (float)((uint)((uint)((uint)(_65.x) >> _205)));
    _209 = (float)((uint)((uint)((uint)(_65.y) >> _205)));
    _210 = 1.0f / _207;
    _211 = 1.0f / _209;
    _214 = (_207 * _48) + -0.5f;
    _215 = (_209 * _49) + -0.5f;
    _216 = frac(_214);
    _217 = frac(_215);
    _218 = floor(_214);
    _219 = floor(_215);
    _220 = 1.0f - _216;
    _221 = 2.0f - _216;
    _222 = 3.0f - _216;
    _226 = (_220 * _220) * _220;
    _227 = (_221 * _221) * _221;
    _230 = _227 - (_226 * 4.0f);
    _234 = (6.0f - _226) - _230;
    _240 = 1.0f - _217;
    _241 = 2.0f - _217;
    _242 = 3.0f - _217;
    _246 = (_240 * _240) * _240;
    _247 = (_241 * _241) * _241;
    _250 = _247 - (_246 * 4.0f);
    _254 = (6.0f - _246) - _250;
    _265 = (_230 + _226) * 0.1666666716337204f;
    _268 = (_250 + _246) * 0.1666666716337204f;
    _278 = ((_218 + -0.5f) + ((_230 * 0.1666666716337204f) / _265)) * _210;
    _279 = ((_218 + 1.5f) + ((((((_227 * 4.0f) - ((_222 * _222) * _222)) - (_226 * 6.0f)) + _234) * 0.1666666716337204f) / (_234 * 0.1666666716337204f))) * _210;
    _280 = ((_219 + -0.5f) + ((_250 * 0.1666666716337204f) / _268)) * _211;
    _281 = ((_219 + 1.5f) + ((((((_247 * 4.0f) - ((_242 * _242) * _242)) - (_246 * 6.0f)) + _254) * 0.1666666716337204f) / (_254 * 0.1666666716337204f))) * _211;
    _282 = float((int)(_204));
    _283 = t0.SampleLevel(s0, float2(_278, _280), _282);
    _288 = t0.SampleLevel(s0, float2(_279, _280), _282);
    _293 = t0.SampleLevel(s0, float2(_278, _281), _282);
    _298 = t0.SampleLevel(s0, float2(_279, _281), _282);
    _323 = ((_293.x - _298.x) * _265) + _298.x;
    _324 = ((_293.y - _298.y) * _265) + _298.y;
    _325 = ((_293.z - _298.z) * _265) + _298.z;
    _326 = ((_293.w - _298.w) * _265) + _298.w;
    _335 = frac(_53);
    _348 = saturate(_53);
    _366 = ((((_199 - _56.x) + (((_323 - _199) + (((lerp(_288.x, _283.x, _265)) - _323) * _268)) * _335)) * _348) + _56.x);
    _367 = ((((_200 - _56.y) + (((_324 - _200) + (((lerp(_288.y, _283.y, _265)) - _324) * _268)) * _335)) * _348) + _56.y);
    _368 = ((((_201 - _56.z) + (((_325 - _201) + (((lerp(_288.z, _283.z, _265)) - _325) * _268)) * _335)) * _348) + _56.z);
    _369 = ((((_202 - _56.w) + (((_326 - _202) + (((lerp(_288.w, _283.w, _265)) - _326) * _268)) * _335)) * _348) + _56.w);
  } else {
    _366 = _56.x;
    _367 = _56.y;
    _368 = _56.z;
    _369 = _56.w;
  }
  _370 = max(_366, 0.0f);
  _371 = max(_367, 0.0f);
  _372 = max(_368, 0.0f);
  _374 = t12.SampleLevel(s1, float2(_48, _49), 0.0f);
  _380 = t8.Sample(s8, float2((_29.x + TEXCOORD.x), (_38 + TEXCOORD.y)));
  _387 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_387) {
    _398 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _380.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _399 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _380.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _400 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _380.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _416 = (saturate(_398) * (_374.x - _370));
      _417 = (saturate(_399) * (_374.y - _371));
      _418 = (saturate(_400) * (_374.z - _372));
    } else {
      _416 = (_398 * _374.x);
      _417 = (_399 * _374.y);
      _418 = (_400 * _374.z);
    }
    _423 = (_416 + _370);
    _424 = (_417 + _371);
    _425 = (_418 + _372);
  } else {
    _423 = _370;
    _424 = _371;
    _425 = _372;
  }
  if (_387) {
    _436 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _380.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _437 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _380.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _438 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _380.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _454 = (saturate(_436) * (_374.x - _423));
      _455 = (saturate(_437) * (_374.y - _424));
      _456 = (saturate(_438) * (_374.z - _425));
    } else {
      _454 = (_436 * _374.x);
      _455 = (_437 * _374.y);
      _456 = (_438 * _374.z);
    }
    _461 = (_454 + _423);
    _462 = (_455 + _424);
    _463 = (_456 + _425);
  } else {
    _461 = _423;
    _462 = _424;
    _463 = _425;
  }
  _473 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _475 = (_473 * _461) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _477 = (_473 * _462) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _479 = (_473 * _463) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _486 = (_48 * 2.0f) + -1.0f;
  _490 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_49 * 2.0f) + -1.0f);
  _503 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_490 * _490) + (_486 * _486))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _528 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _537 = t3.Sample(s3, float3(((_528 * log2((((_503 * ((_475 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _475)) + _475) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_528 * log2((((_503 * ((_477 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _477)) + _477) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_503 * ((_479 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _479)) + _479) * 335.718017578125f) + 1.0f) * _528) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _559 = ((exp2(_537.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _560 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
  _566 = (exp2(_560 * log2(_559)) + -1.0f) / (_559 + -1.0f);
  _573 = ((exp2(_537.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _579 = ((pow(_573, _560)) + -1.0f) / (_573 + -1.0f);
  _586 = ((exp2(_537.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _592 = ((pow(_586, _560)) + -1.0f) / (_586 + -1.0f);
  _599 = saturate(select((!(_559 == 1.0f)), ((_566 + -1.0f) / _566), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _560)));
  _600 = saturate(select((!(_573 == 1.0f)), ((_579 + -1.0f) / _579), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _560)));
  _601 = saturate(select((!(_586 == 1.0f)), ((_592 + -1.0f) / _592), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _560)));

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_599, _600, _601);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _623 = select((_599 <= 0.0031308000907301903f), (_599 * 12.920000076293945f), (((pow(_599, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _624 = select((_600 <= 0.0031308000907301903f), (_600 * 12.920000076293945f), (((pow(_600, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _625 = select((_601 <= 0.0031308000907301903f), (_601 * 12.920000076293945f), (((pow(_601, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_623, _624, _625);

    _646 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
    _649 = (int)(uint(SV_Position.x)) & 63;
    _650 = (int)(uint(SV_Position.y)) & 63;
    _655 = t2.Load(int4(_649, _650, _646, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_649, _650, _646, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_655.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_655.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _625);
  }
  SV_Target.w = _369;
  return SV_Target;
}