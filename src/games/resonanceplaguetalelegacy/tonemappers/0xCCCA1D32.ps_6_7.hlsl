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

SamplerState s2 : register(s2);

SamplerState s3 : register(s3);

SamplerState s4 : register(s4);

SamplerState s5 : register(s5);

SamplerState s7 : register(s7);

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
  float4 _36;
  float4 _42;
  float _46;
  float _56;
  float _57;
  float _58;
  float _59;
  float _61;
  float _65;
  float _66;
  float _71;
  float _72;
  float _81;
  float _87;
  float _88;
  float _98;
  float _100;
  float _105;
  float _106;
  float _109;
  float _118;
  float _119;
  float _120;
  float _122;
  float _124;
  float _127;
  float4 _134;
  float _137;
  float _138;
  float _139;
  float4 _141;
  float4 _147;
  bool _154;
  float _183;
  float _184;
  float _185;
  float _190;
  float _191;
  float _192;
  float _221;
  float _306;
  float _343;
  float _533;
  float _572;
  float _573;
  float _574;
  float _603;
  float _604;
  float _605;
  float _610;
  float _611;
  float _612;
  float _732;
  float _741;
  float _750;
  float _798;
  float _799;
  float _800;
  float _165;
  float _166;
  float _167;
  float _199;
  float _200;
  bool _207;
  float _226;
  float _228;
  float _232;
  float _240;
  float _257;
  float _259;
  float _260;
  float _268;
  float _270;
  float _273;
  float _278;
  float _279;
  float _281;
  float _283;
  float _286;
  float _287;
  float _288;
  float _289;
  float _290;
  float _308;
  float _309;
  float _313;
  float _318;
  float _345;
  float _346;
  float _350;
  float _355;
  float _388;
  float _389;
  float4 _392;
  float _403;
  float _409;
  float _410;
  float4 _444;
  float _448;
  float _449;
  float _485;
  float _486;
  float _487;
  float _488;
  float _494;
  float _503;
  float _507;
  float _514;
  float _526;
  float _536;
  float4 _539;
  float _548;
  float _549;
  float _560;
  float _585;
  float _586;
  float _587;
  float _622;
  float _624;
  float _626;
  float _628;
  float _635;
  float _639;
  float _652;
  float _677;
  float4 _686;
  float _706;
  float _707;
  float _708;
  float _721;
  float _722;
  float _723;
  float _727;
  float _736;
  float _745;
  float _751;
  float _752;
  float _758;
  float _766;
  float _772;
  float _780;
  float _786;
  float _822;
  float _823;
  float _824;
  int _845;
  int _848;
  int _849;
  float4 _854;
  _36 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _42 = t16.Sample(s0, float2(TEXCOORD.z, TEXCOORD.w));
  _46 = (_42.y * 0.10000000149011612f) + _36.y;
  _56 = _36.x + TEXCOORD.z;
  _57 = _46 + TEXCOORD.w;
  _58 = _36.x + TEXCOORD.x;
  _59 = _46 + TEXCOORD.y;
  _61 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_42.y * 0.5f) + _36.z) + -1.0f)) + 1.0f) + 1.0f);
  _65 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].x);
  _66 = 0.5f - (PostProcess_000.PostProcessConstant_Z_000[19].y);
  _71 = ((_65 + _56) * 2.0f) + -1.0f;
  _72 = ((_66 + _57) * 2.0f) + -1.0f;
  _81 = ((PostProcess_000.PostProcessConstant_Z_000[19].z) * 2.0f) + -1.0f;
  _87 = (saturate(abs(_71) - _81) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].x)) * _71;
  _88 = (_72 * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[51].y)) * saturate(abs(_72) - _81);
  _98 = ((_65 + _58) * 2.0f) + -1.0f;
  _100 = ((_66 + _59) * 1.125f) + -0.5625f;
  _105 = sqrt((_98 * _98) + (_100 * _100)) * 0.8715755343437195f;
  _106 = _105 * _105;
  _109 = saturate((_106 + -0.15000000596046448f) * 1.8181819915771484f);
  _118 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _87;
  _119 = (PostProcess_000.PostProcessConstant_Z_000[2].z) * _88;
  _120 = _119 + _57;
  _122 = _42.x * 0.010840999893844128f;
  _124 = (_56 + _122) + _118;
  _127 = max(((((_109 * _109) * ((PostProcess_000.PostProcessConstant_Z_000[2].w) * sqrt((_87 * _87) + (_88 * _88)))) * _106) * (3.0f - (_109 * 2.0f))), _61);
  _134 = t0.SampleLevel(s0, float2(_56, _57), _127);
  _137 = max((((float4)(t0.SampleLevel(s0, float2(_124, _120), _127))).x), 0.0f);
  _138 = max((((float4)(t0.SampleLevel(s0, float2((_56 - _118), ((_57 + _122) - _119)), _127))).y), 0.0f);
  _139 = max(_134.z, 0.0f);
  _141 = t12.SampleLevel(s0, float2(_56, _57), 0.0f);
  _147 = t8.Sample(s8, float2(_58, _59));
  _154 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_154) {
    _165 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _147.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _166 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _147.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _167 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _147.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _183 = (saturate(_165) * (_141.x - _137));
      _184 = (saturate(_166) * (_141.y - _138));
      _185 = (saturate(_167) * (_141.z - _139));
    } else {
      _183 = (_165 * _141.x);
      _184 = (_166 * _141.y);
      _185 = (_167 * _141.z);
    }
    _190 = (_183 + _137);
    _191 = (_184 + _138);
    _192 = (_185 + _139);
  } else {
    _190 = _137;
    _191 = _138;
    _192 = _139;
  }
  [branch]
  if (_154) {
    if ((PostProcess_000.PostProcessConstant_Z_000[7].x) > 0.0f) {
      _199 = _36.x + TEXCOORD.x;
      _200 = _46 + TEXCOORD.y;
      _207 = ((PostProcess_000.PostProcessConstant_Z_000[6].y) == 1.0f);
      if (_207) {
        _221 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _221 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _226 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_199, _200), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _228 = _221 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _232 = min(max(_226, (_221 - _228)), (_228 + _221));
      _240 = ((PostProcess_000.PostProcessConstant_Z_000[5].w) * (_226 - _232)) / ((_232 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _226);
      _257 = -0.0f - (PostProcess_000.PostProcessConstant_Z_000[6].x);
      _259 = _199 + -0.5f;
      _260 = _200 + -0.5f;
      _268 = exp2(log2(sqrt((_260 * _260) + (_259 * _259))) * (PostProcess_000.PostProcessConstant_Z_000[7].y)) * (PostProcess_000.PostProcessConstant_Z_000[7].x);
      _270 = rsqrt(dot(float2(_259, _260), float2(_259, _260)));
      _273 = abs(min(max(min(max(((((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _240)) + (min(_240, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_228 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _257);
      _278 = -0.0f - (_268 * _273);
      _279 = (User_000.UserConstant_Z_000[2].x) * (_270 * _259);
      _281 = (User_000.UserConstant_Z_000[2].y) * (_270 * _260);
      _283 = _273 * _268;
      _286 = (_279 * _283) + _199;
      _287 = (_281 * _283) + _200;
      _288 = (_279 * _278) + _124;
      _289 = (_281 * _278) + _120;
      _290 = max(_61, _127);
      if (_207) {
        _306 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _306 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _308 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_288, _289), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _309 = _306 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _313 = min(max(_308, (_306 - _309)), (_309 + _306));
      _318 = ((_308 - _313) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_313 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _308);
      if (_207) {
        _343 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _343 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _345 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_286, _287), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _346 = _343 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _350 = min(max(_345, (_343 - _346)), (_346 + _343));
      _355 = ((_345 - _350) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_350 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _345);
      _572 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _318) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_318, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_309 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _257) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_288, _289), _290))).x) - _190)) + _190);
      _573 = _191;
      _574 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _355) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_355, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_346 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _257) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s0, float2(_286, _287), _290))).z) - _192)) + _192);
    } else {
      _572 = _190;
      _573 = _191;
      _574 = _192;
    }
  } else {
    if ((int)asint((User_000.UserConstant_Z_000[3].y)) > (int)0) {
      _388 = _36.x + TEXCOORD.x;
      _389 = _46 + TEXCOORD.y;
      _392 = t4.Sample(s4, float2(_388, _389));
      _403 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * (((float4)(t5.Sample(s5, float2(_388, _389)))).x);
      _409 = (_403 * (PostProcess_000.PostProcessConstant_Z_000[7].x)) + _388;
      _410 = (_403 * (PostProcess_000.PostProcessConstant_Z_000[7].y)) + _389;
      _572 = (lerp(_190, _392.x, _392.w));
      _573 = (lerp(_191, _392.y, _392.w));
      _574 = ((((_392.z - _192) + ((abs((((float4)(t5.Sample(s5, float2(_409, _410)))).x) * (PostProcess_000.PostProcessConstant_Z_000[6].x)) / (PostProcess_000.PostProcessConstant_Z_000[7].w)) * ((((float4)(t4.Sample(s4, float2(_409, _410)))).z) - _392.z))) * _392.w) + _192);
    } else {
      [branch]
      if ((int)asint((User_000.UserConstant_Z_000[3].x)) > (int)0) {
        _533 = abs(((float4)(t7.Sample(s7, float2(TEXCOORD.x, TEXCOORD.y)))).x);
      } else {
        _444 = t2.SampleLevel(s2, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _448 = (TEXCOORD.x * 2.0f) + -1.0f;
        _449 = (TEXCOORD.y * 2.0f) + -1.0f;
        _485 = mad(_444.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].z), mad(_449, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].x) * _448))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].w);
        _486 = (mad(_444.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].z), mad(_449, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].x) * _448))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].w)) / _485;
        _487 = (mad(_444.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].z), mad(_449, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].x) * _448))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].w)) / _485;
        _488 = (mad(_444.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].z), mad(_449, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].x) * _448))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].w)) / _485;
        _494 = sqrt(((_487 * _487) + (_486 * _486)) + (_488 * _488));
        _503 = (PostProcess_000.PostProcessConstant_Z_000[6].w) * (PostProcess_000.PostProcessConstant_Z_000[5].x);
        _507 = min(max(_494, ((PostProcess_000.PostProcessConstant_Z_000[5].x) - _503)), (_503 + (PostProcess_000.PostProcessConstant_Z_000[5].x)));
        _514 = ((_494 - _507) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_507 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _494);
        _526 = (((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _514)) + ((PostProcess_000.PostProcessConstant_Z_000[7].z) * min(_514, 0.0f))) * (1.0f / (_503 + 1.0f));
        _533 = saturate(max(abs(min((((float4)(t5.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y)))).x), _526)), abs(_526)));
      }
      _536 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * _533;
      _539 = t4.Sample(s4, float2(TEXCOORD.x, TEXCOORD.y));
      _548 = ((PostProcess_000.PostProcessConstant_Z_000[7].x) * _536) + TEXCOORD.x;
      _549 = ((PostProcess_000.PostProcessConstant_Z_000[7].y) * _536) + TEXCOORD.y;
      _560 = saturate(_536 + -1.0f);
      _572 = ((_560 * (_539.x - _190)) + _190);
      _573 = ((_560 * (_539.y - _191)) + _191);
      _574 = ((((_539.z - _192) + (abs(((float4)(t5.Sample(s5, float2(_548, _549)))).x) * ((((float4)(t4.Sample(s4, float2(_548, _549)))).z) - _539.z))) * _560) + _192);
    }
  }
  if (_154) {
    _585 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _147.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _586 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _147.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _587 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _147.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _603 = (saturate(_585) * (_141.x - _572));
      _604 = (saturate(_586) * (_141.y - _573));
      _605 = (saturate(_587) * (_141.z - _574));
    } else {
      _603 = (_585 * _141.x);
      _604 = (_586 * _141.y);
      _605 = (_587 * _141.z);
    }
    _610 = (_603 + _572);
    _611 = (_604 + _573);
    _612 = (_605 + _574);
  } else {
    _610 = _572;
    _611 = _573;
    _612 = _574;
  }
  _622 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _624 = (_622 * _610) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _626 = (_622 * _611) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _628 = (_622 * _612) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _635 = (_56 * 2.0f) + -1.0f;
  _639 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_57 * 2.0f) + -1.0f);
  _652 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_639 * _639) + (_635 * _635))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _677 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _686 = t3.Sample(s3, float3(((_677 * log2((((_652 * ((_624 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _624)) + _624) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_677 * log2((((_652 * ((_626 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _626)) + _626) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_652 * ((_628 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _628)) + _628) * 335.718017578125f) + 1.0f) * _677) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _706 = ((exp2(_686.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _707 = ((exp2(_686.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _708 = ((exp2(_686.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  if (!((PostProcess_000.PostProcessConstant_Z_000[17].x) == 0.0f) &&
      RENODX_TONE_MAP_TYPE == 0.f) {
    _721 = (PostProcess_000.PostProcessConstant_Z_000[10].w) * _706;
    _722 = (PostProcess_000.PostProcessConstant_Z_000[10].w) * _707;
    _723 = (PostProcess_000.PostProcessConstant_Z_000[10].w) * _708;
    if (_721 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _727 = 1.0f - (_721 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _732 = (((_727 * _727) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _721);
    } else {
      _732 = _721;
    }
    if (_722 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _736 = 1.0f - (_722 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _741 = (((_736 * _736) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _722);
    } else {
      _741 = _722;
    }
    if (_723 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _745 = 1.0f - (_723 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _750 = (((_745 * _745) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _723);
    } else {
      _750 = _723;
    }
    _751 = _732 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _752 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
    _758 = ((pow(_751, _752)) + -1.0f) / (_751 + -1.0f);
    _766 = _741 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _772 = ((pow(_766, _752)) + -1.0f) / (_766 + -1.0f);
    _780 = _750 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _786 = ((pow(_780, _752)) + -1.0f) / (_780 + -1.0f);
    _798 = ((select((!(_751 == 1.0f)), ((_758 + -1.0f) / _758), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _752)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _799 = ((select((!(_766 == 1.0f)), ((_772 + -1.0f) / _772), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _752)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _800 = ((select((!(_780 == 1.0f)), ((_786 + -1.0f) / _786), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _752)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
  } else {
    _798 = _706;
    _799 = _707;
    _800 = _708;
  }

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_798, _799, _800);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _822 = select((_798 <= 0.0031308000907301903f), (_798 * 12.920000076293945f), (((pow(_798, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _823 = select((_799 <= 0.0031308000907301903f), (_799 * 12.920000076293945f), (((pow(_799, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _824 = select((_800 <= 0.0031308000907301903f), (_800 * 12.920000076293945f), (((pow(_800, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_822, _823, _824);

    _845 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
    _848 = (int)(uint(SV_Position.x)) & 63;
    _849 = (int)(uint(SV_Position.y)) & 63;
    _854 = t6.Load(int4(_848, _849, _845, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_848, _849, _845, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_854.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_854.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _824);
  }
  SV_Target.w = _134.w;
  return SV_Target;
}