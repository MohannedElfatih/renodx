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

Texture2D<float4> t14 : register(t14);

Texture2D<float4> t16 : register(t16);

Texture2D<float4> t17 : register(t17);

cbuffer cb1 : register(b1) { GlobalCB_Z Global_000 : packoffset(c000.x); };

cbuffer cb0 : register(b0) { UserConstant_Z User_000 : packoffset(c000.x); };

cbuffer cb2 : register(b2) {
  PostProcessConstant_Z PostProcess_000 : packoffset(c000.x);
};

SamplerState s0 : register(s0);

SamplerState s2 : register(s2);

SamplerState s3 : register(s3);

SamplerState s4 : register(s4);

SamplerState s5 : register(s5);

SamplerState s7 : register(s7);

SamplerState s14 : register(s14);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

float4 main(
  linear float4 TEXCOORD : TEXCOORD,
  precise noperspective float4 SV_Position : SV_Position
) : SV_Target {
  float4 SV_Target;
  float4 _33;
  float4 _39;
  float _43;
  float _53;
  float _54;
  float _58;
  float _62;
  float _63;
  float _68;
  float _69;
  float _78;
  float _84;
  float _85;
  float _95;
  float _97;
  float _102;
  float _103;
  float _106;
  float _115;
  float _116;
  float _117;
  float _119;
  float _121;
  float _124;
  float4 _131;
  float _134;
  float _135;
  float _136;
  float _169;
  float _254;
  float _291;
  float _481;
  float _520;
  float _521;
  float _522;
  float _147;
  float _148;
  bool _155;
  float _174;
  float _176;
  float _180;
  float _188;
  float _205;
  float _207;
  float _208;
  float _216;
  float _218;
  float _221;
  float _226;
  float _227;
  float _229;
  float _231;
  float _234;
  float _235;
  float _236;
  float _237;
  float _238;
  float _256;
  float _257;
  float _261;
  float _266;
  float _293;
  float _294;
  float _298;
  float _303;
  float _336;
  float _337;
  float4 _340;
  float _351;
  float _357;
  float _358;
  float4 _392;
  float _396;
  float _397;
  float _433;
  float _434;
  float _435;
  float _436;
  float _442;
  float _451;
  float _455;
  float _462;
  float _474;
  float _484;
  float4 _487;
  float _496;
  float _497;
  float _508;
  float _532;
  float _534;
  float _536;
  float _538;
  float _545;
  float _549;
  float _562;
  float _587;
  float4 _596;
  float _618;
  float _619;
  float _625;
  float _632;
  float _638;
  float _645;
  float _651;
  float _658;
  float _659;
  float _660;
  float _682;
  float _683;
  float _684;
  int _705;
  int _708;
  int _709;
  float4 _714;
  _33 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _39 = t16.Sample(s0, float2(TEXCOORD.z, TEXCOORD.w));
  _43 = (_39.y * 0.10000000149011612f) + _33.y;
  _53 = _33.x + TEXCOORD.z;
  _54 = _43 + TEXCOORD.w;
  _58 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_39.y * 0.5f) + _33.z) + -1.0f)) + 1.0f) + 1.0f);
  _62 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].x);
  _63 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].y);
  _68 = ((_62 + _53) * 2.0f) + -1.0f;
  _69 = ((_63 + _54) * 2.0f) + -1.0f;
  _78 = ((PostProcess_000.PostProcessConstant_Z_000[19].z) * 2.0f) + -1.0f;
  _84 = (saturate(abs(_68) - _78) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].x)) * _68;
  _85 = (_69 * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].y)) * saturate(abs(_69) - _78);
  _95 = (((_33.x + TEXCOORD.x) + _62) * 2.0f) + -1.0f;
  _97 = (((_43 + TEXCOORD.y) + _63) * 1.125f) + -0.5625f;
  _102 = sqrt((_95 * _95) + (_97 * _97)) * 0.8715755343437195f;
  _103 = _102 * _102;
  _106 = saturate((_103 + -0.15000000596046448f) * 1.8181819915771484f);
  _115 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _84;
  _116 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _85;
  _117 = _116 + _54;
  _119 = _39.x * 0.010840999893844128f;
  _121 = (_53 + _119) + _115;
  _124 = max(((((_106 * _106) * ((PostProcess_000.PostProcessConstant_Z_000[2].w) * sqrt((_84 * _84) + (_85 * _85)))) * _103) * (3.0f - (_106 * 2.0f))), _58);
  _131 = t0.SampleLevel(s0, float2(_53, _54), _124);
  _134 = max((((float4)(t0.SampleLevel(s0, float2(_121, _117), _124))).x), 0.0f);
  _135 = max((((float4)(t0.SampleLevel(s0, float2((_53 - _115), ((_54 + _119) - _116)), _124))).y), 0.0f);
  _136 = max(_131.z, 0.0f);
  [branch]
  if ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0) {
    if ((PostProcess_000.PostProcessConstant_Z_000[7].x) > 0.0f) {
      _147 = _33.x + TEXCOORD.x;
      _148 = _43 + TEXCOORD.y;
      _155 = ((PostProcess_000.PostProcessConstant_Z_000[6].y) == 1.0f);
      if (_155) {
        _169 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _169 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _174 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_147, _148), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _176 = _169 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _180 = min(max(_174, (_169 - _176)), (_176 + _169));
      _188 = ((PostProcess_000.PostProcessConstant_Z_000[5].w) * (_174 - _180)) / ((_180 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _174);
      _205 = -0.0f - (PostProcess_000.PostProcessConstant_Z_000[6].x);
      _207 = _147 + -0.5f;
      _208 = _148 + -0.5f;
      _216 = exp2(log2(sqrt((_208 * _208) + (_207 * _207))) * (PostProcess_000.PostProcessConstant_Z_000[7].y)) * (PostProcess_000.PostProcessConstant_Z_000[7].x);
      _218 = rsqrt(dot(float2(_207, _208), float2(_207, _208)));
      _221 = abs(min(max(min(max(((((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _188)) + (min(_188, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_176 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _205);
      _226 = -0.0f - (_216 * _221);
      _227 = (User_000.UserConstant_Z_000[2].x) * (_218 * _207);
      _229 = (User_000.UserConstant_Z_000[2].y) * (_218 * _208);
      _231 = _221 * _216;
      _234 = (_227 * _231) + _147;
      _235 = (_229 * _231) + _148;
      _236 = (_227 * _226) + _121;
      _237 = (_229 * _226) + _117;
      _238 = max(_58, _124);
      if (_155) {
        _254 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _254 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _256 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_236, _237), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _257 = _254 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _261 = min(max(_256, (_254 - _257)), (_257 + _254));
      _266 = ((_256 - _261) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_261 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _256);
      if (_155) {
        _291 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _291 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _293 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_234, _235), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _294 = _291 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _298 = min(max(_293, (_291 - _294)), (_294 + _291));
      _303 = ((_293 - _298) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_298 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _293);
      _520 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _266) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_266, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_257 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _205) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_236, _237), _238))).x) - _134)) + _134);
      _521 = _135;
      _522 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _303) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_303, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_294 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _205) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_234, _235), _238))).z) - _136)) + _136);
    } else {
      _520 = _134;
      _521 = _135;
      _522 = _136;
    }
  } else {
    if ((int)asint((User_000.UserConstant_Z_000[3].y)) > (int)0) {
      _336 = _33.x + TEXCOORD.x;
      _337 = _43 + TEXCOORD.y;
      _340 = t4.Sample(s4, float2(_336, _337));
      _351 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * (((float4)(t5.Sample(s5, float2(_336, _337)))).x);
      _357 = (_351 * (PostProcess_000.PostProcessConstant_Z_000[7].x)) + _336;
      _358 = (_351 * (PostProcess_000.PostProcessConstant_Z_000[7].y)) + _337;
      _520 = (lerp(_134, _340.x, _340.w));
      _521 = (lerp(_135, _340.y, _340.w));
      _522 = ((((_340.z - _136) + ((abs((((float4)(t5.Sample(s5, float2(_357, _358)))).x) * (PostProcess_000.PostProcessConstant_Z_000[6].x)) / (PostProcess_000.PostProcessConstant_Z_000[7].w)) * ((((float4)(t4.Sample(s4, float2(_357, _358)))).z) - _340.z))) * _340.w) + _136);
    } else {
      [branch]
      if ((int)asint((User_000.UserConstant_Z_000[3].x)) > (int)0) {
        _481 = abs(((float4)(t7.Sample(s7, float2(TEXCOORD.x, TEXCOORD.y)))).x);
      } else {
        _392 = t2.SampleLevel(s2, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _396 = (TEXCOORD.x * 2.0f) + -1.0f;
        _397 = (TEXCOORD.y * 2.0f) + -1.0f;
        _433 = mad(_392.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].z), mad(_397, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].x) * _396))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].w);
        _434 = (mad(_392.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].z), mad(_397, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].x) * _396))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].w)) / _433;
        _435 = (mad(_392.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].z), mad(_397, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].x) * _396))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].w)) / _433;
        _436 = (mad(_392.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].z), mad(_397, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].x) * _396))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].w)) / _433;
        _442 = sqrt(((_435 * _435) + (_434 * _434)) + (_436 * _436));
        _451 = (PostProcess_000.PostProcessConstant_Z_000[6].w) * (PostProcess_000.PostProcessConstant_Z_000[5].x);
        _455 = min(max(_442, ((PostProcess_000.PostProcessConstant_Z_000[5].x) - _451)), (_451 + (PostProcess_000.PostProcessConstant_Z_000[5].x)));
        _462 = ((_442 - _455) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_455 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _442);
        _474 = (((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _462)) + ((PostProcess_000.PostProcessConstant_Z_000[7].z) * min(_462, 0.0f))) * (1.0f / (_451 + 1.0f));
        _481 = saturate(max(abs(min((((float4)(t5.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y)))).x), _474)), abs(_474)));
      }
      _484 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * _481;
      _487 = t4.Sample(s4, float2(TEXCOORD.x, TEXCOORD.y));
      _496 = ((PostProcess_000.PostProcessConstant_Z_000[7].x) * _484) + TEXCOORD.x;
      _497 = ((PostProcess_000.PostProcessConstant_Z_000[7].y) * _484) + TEXCOORD.y;
      _508 = saturate(_484 + -1.0f);
      _520 = ((_508 * (_487.x - _134)) + _134);
      _521 = ((_508 * (_487.y - _135)) + _135);
      _522 = ((((_487.z - _136) + (abs(((float4)(t5.Sample(s5, float2(_496, _497)))).x) * ((((float4)(t4.Sample(s4, float2(_496, _497)))).z) - _487.z))) * _508) + _136);
    }
  }
  _532 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _534 = (_532 * _520) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _536 = (_532 * _521) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _538 = (_532 * _522) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _545 = (_53 * 2.0f) + -1.0f;
  _549 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_54 * 2.0f) + -1.0f);
  _562 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_549 * _549) + (_545 * _545))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _587 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _596 = t3.Sample(s3, float3(((_587 * log2((((_562 * ((_534 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _534)) + _534) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_587 * log2((((_562 * ((_536 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _536)) + _536) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_562 * ((_538 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _538)) + _538) * 335.718017578125f) + 1.0f) * _587) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _618 = ((exp2(_596.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _619 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
  _625 = (exp2(_619 * log2(_618)) + -1.0f) / (_618 + -1.0f);
  _632 = ((exp2(_596.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _638 = ((pow(_632, _619)) + -1.0f) / (_632 + -1.0f);
  _645 = ((exp2(_596.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _651 = ((pow(_645, _619)) + -1.0f) / (_645 + -1.0f);
  _658 = saturate(select((!(_618 == 1.0f)), ((_625 + -1.0f) / _625), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _619)));
  _659 = saturate(select((!(_632 == 1.0f)), ((_638 + -1.0f) / _638), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _619)));
  _660 = saturate(select((!(_645 == 1.0f)), ((_651 + -1.0f) / _651), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _619)));

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_658, _659, _660);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _682 = select((_658 <= 0.0031308000907301903f), (_658 * 12.920000076293945f), (((pow(_658, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _683 = select((_659 <= 0.0031308000907301903f), (_659 * 12.920000076293945f), (((pow(_659, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _684 = select((_660 <= 0.0031308000907301903f), (_660 * 12.920000076293945f), (((pow(_660, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_682, _683, _684);

    _705 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
    _708 = (int)(uint(SV_Position.x)) & 63;
    _709 = (int)(uint(SV_Position.y)) & 63;
    _714 = t6.Load(int4(_708, _709, _705, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_708, _709, _705, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_714.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_714.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _684);
  }
  SV_Target.w = _131.w;
  return SV_Target;
}