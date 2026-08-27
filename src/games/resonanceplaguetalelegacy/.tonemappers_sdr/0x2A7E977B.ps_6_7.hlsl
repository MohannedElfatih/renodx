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

SamplerState s1 : register(s1);

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
  float4 _34;
  float4 _40;
  float _43;
  float _53;
  float _54;
  float _56;
  float4 _59;
  float _369;
  float _370;
  float _371;
  float _372;
  float _408;
  float _493;
  float _530;
  float _720;
  float _759;
  float _760;
  float _761;
  int _67;
  uint2 _68;
  int _71;
  float _73;
  float _75;
  float _76;
  float _77;
  float _80;
  float _81;
  float _82;
  float _83;
  float _84;
  float _85;
  float _86;
  float _87;
  float _88;
  float _92;
  float _93;
  float _96;
  float _100;
  float _106;
  float _107;
  float _108;
  float _112;
  float _113;
  float _116;
  float _120;
  float _131;
  float _134;
  float _144;
  float _145;
  float _146;
  float _147;
  float _148;
  float4 _150;
  float4 _155;
  float4 _160;
  float4 _165;
  float _190;
  float _191;
  float _192;
  float _193;
  float _202;
  float _203;
  float _204;
  float _205;
  int _207;
  int _208;
  float _210;
  float _212;
  float _213;
  float _214;
  float _217;
  float _218;
  float _219;
  float _220;
  float _221;
  float _222;
  float _223;
  float _224;
  float _225;
  float _229;
  float _230;
  float _233;
  float _237;
  float _243;
  float _244;
  float _245;
  float _249;
  float _250;
  float _253;
  float _257;
  float _268;
  float _271;
  float _281;
  float _282;
  float _283;
  float _284;
  float _285;
  float4 _286;
  float4 _291;
  float4 _296;
  float4 _301;
  float _326;
  float _327;
  float _328;
  float _329;
  float _338;
  float _351;
  float _373;
  float _374;
  float _375;
  float _386;
  float _387;
  bool _394;
  float _413;
  float _415;
  float _419;
  float _427;
  float _444;
  float _446;
  float _447;
  float _455;
  float _457;
  float _460;
  float _465;
  float _466;
  float _468;
  float _470;
  float _473;
  float _474;
  float _475;
  float _476;
  float _477;
  float _495;
  float _496;
  float _500;
  float _505;
  float _532;
  float _533;
  float _537;
  float _542;
  float _575;
  float _576;
  float4 _579;
  float _590;
  float _596;
  float _597;
  float4 _631;
  float _635;
  float _636;
  float _672;
  float _673;
  float _674;
  float _675;
  float _681;
  float _690;
  float _694;
  float _701;
  float _713;
  float _723;
  float4 _726;
  float _735;
  float _736;
  float _747;
  float _771;
  float _773;
  float _775;
  float _777;
  float _784;
  float _788;
  float _801;
  float _826;
  float4 _835;
  float _857;
  float _858;
  float _864;
  float _871;
  float _877;
  float _884;
  float _890;
  float _897;
  float _898;
  float _899;
  float _921;
  float _922;
  float _923;
  int _944;
  int _947;
  int _948;
  float4 _953;
  _34 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _40 = t16.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _43 = (_40.y * 0.10000000149011612f) + _34.y;
  _53 = _34.x + TEXCOORD.z;
  _54 = _43 + TEXCOORD.w;
  _56 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_40.y * 0.5f) + _34.z) + -1.0f)) + 1.0f) + 1.0f);
  _59 = t0.SampleLevel(s1, float2(_53, _54), _56);
  [branch]
  if (_56 > 0.0f) {
    _67 = int(floor(_56));
    t0.GetDimensions(_68.x, _68.y);
    _71 = _67 & 31;
    _73 = (float)((uint)((uint)((uint)(_68.x) >> _71)));
    _75 = (float)((uint)((uint)((uint)(_68.y) >> _71)));
    _76 = 1.0f / _73;
    _77 = 1.0f / _75;
    _80 = (_73 * _53) + -0.5f;
    _81 = (_75 * _54) + -0.5f;
    _82 = frac(_80);
    _83 = frac(_81);
    _84 = floor(_80);
    _85 = floor(_81);
    _86 = 1.0f - _82;
    _87 = 2.0f - _82;
    _88 = 3.0f - _82;
    _92 = (_86 * _86) * _86;
    _93 = (_87 * _87) * _87;
    _96 = _93 - (_92 * 4.0f);
    _100 = (6.0f - _92) - _96;
    _106 = 1.0f - _83;
    _107 = 2.0f - _83;
    _108 = 3.0f - _83;
    _112 = (_106 * _106) * _106;
    _113 = (_107 * _107) * _107;
    _116 = _113 - (_112 * 4.0f);
    _120 = (6.0f - _112) - _116;
    _131 = (_96 + _92) * 0.1666666716337204f;
    _134 = (_116 + _112) * 0.1666666716337204f;
    _144 = ((_84 + -0.5f) + ((_96 * 0.1666666716337204f) / _131)) * _76;
    _145 = ((_84 + 1.5f) + ((((((_93 * 4.0f) - ((_88 * _88) * _88)) - (_92 * 6.0f)) + _100) * 0.1666666716337204f) / (_100 * 0.1666666716337204f))) * _76;
    _146 = ((_85 + -0.5f) + ((_116 * 0.1666666716337204f) / _134)) * _77;
    _147 = ((_85 + 1.5f) + ((((((_113 * 4.0f) - ((_108 * _108) * _108)) - (_112 * 6.0f)) + _120) * 0.1666666716337204f) / (_120 * 0.1666666716337204f))) * _77;
    _148 = float((int)(_67));
    _150 = t0.SampleLevel(s0, float2(_144, _146), _148);
    _155 = t0.SampleLevel(s0, float2(_145, _146), _148);
    _160 = t0.SampleLevel(s0, float2(_144, _147), _148);
    _165 = t0.SampleLevel(s0, float2(_145, _147), _148);
    _190 = ((_160.x - _165.x) * _131) + _165.x;
    _191 = ((_160.y - _165.y) * _131) + _165.y;
    _192 = ((_160.z - _165.z) * _131) + _165.z;
    _193 = ((_160.w - _165.w) * _131) + _165.w;
    _202 = (((lerp(_155.x, _150.x, _131)) - _190) * _134) + _190;
    _203 = (((lerp(_155.y, _150.y, _131)) - _191) * _134) + _191;
    _204 = (((lerp(_155.z, _150.z, _131)) - _192) * _134) + _192;
    _205 = (((lerp(_155.w, _150.w, _131)) - _193) * _134) + _193;
    _207 = int(ceil(_56));
    _208 = _207 & 31;
    _210 = (float)((uint)((uint)((uint)(_68.x) >> _208)));
    _212 = (float)((uint)((uint)((uint)(_68.y) >> _208)));
    _213 = 1.0f / _210;
    _214 = 1.0f / _212;
    _217 = (_210 * _53) + -0.5f;
    _218 = (_212 * _54) + -0.5f;
    _219 = frac(_217);
    _220 = frac(_218);
    _221 = floor(_217);
    _222 = floor(_218);
    _223 = 1.0f - _219;
    _224 = 2.0f - _219;
    _225 = 3.0f - _219;
    _229 = (_223 * _223) * _223;
    _230 = (_224 * _224) * _224;
    _233 = _230 - (_229 * 4.0f);
    _237 = (6.0f - _229) - _233;
    _243 = 1.0f - _220;
    _244 = 2.0f - _220;
    _245 = 3.0f - _220;
    _249 = (_243 * _243) * _243;
    _250 = (_244 * _244) * _244;
    _253 = _250 - (_249 * 4.0f);
    _257 = (6.0f - _249) - _253;
    _268 = (_233 + _229) * 0.1666666716337204f;
    _271 = (_253 + _249) * 0.1666666716337204f;
    _281 = ((_221 + -0.5f) + ((_233 * 0.1666666716337204f) / _268)) * _213;
    _282 = ((_221 + 1.5f) + ((((((_230 * 4.0f) - ((_225 * _225) * _225)) - (_229 * 6.0f)) + _237) * 0.1666666716337204f) / (_237 * 0.1666666716337204f))) * _213;
    _283 = ((_222 + -0.5f) + ((_253 * 0.1666666716337204f) / _271)) * _214;
    _284 = ((_222 + 1.5f) + ((((((_250 * 4.0f) - ((_245 * _245) * _245)) - (_249 * 6.0f)) + _257) * 0.1666666716337204f) / (_257 * 0.1666666716337204f))) * _214;
    _285 = float((int)(_207));
    _286 = t0.SampleLevel(s0, float2(_281, _283), _285);
    _291 = t0.SampleLevel(s0, float2(_282, _283), _285);
    _296 = t0.SampleLevel(s0, float2(_281, _284), _285);
    _301 = t0.SampleLevel(s0, float2(_282, _284), _285);
    _326 = ((_296.x - _301.x) * _268) + _301.x;
    _327 = ((_296.y - _301.y) * _268) + _301.y;
    _328 = ((_296.z - _301.z) * _268) + _301.z;
    _329 = ((_296.w - _301.w) * _268) + _301.w;
    _338 = frac(_56);
    _351 = saturate(_56);
    _369 = ((((_202 - _59.x) + (((_326 - _202) + (((lerp(_291.x, _286.x, _268)) - _326) * _271)) * _338)) * _351) + _59.x);
    _370 = ((((_203 - _59.y) + (((_327 - _203) + (((lerp(_291.y, _286.y, _268)) - _327) * _271)) * _338)) * _351) + _59.y);
    _371 = ((((_204 - _59.z) + (((_328 - _204) + (((lerp(_291.z, _286.z, _268)) - _328) * _271)) * _338)) * _351) + _59.z);
    _372 = ((((_205 - _59.w) + (((_329 - _205) + (((lerp(_291.w, _286.w, _268)) - _329) * _271)) * _338)) * _351) + _59.w);
  } else {
    _369 = _59.x;
    _370 = _59.y;
    _371 = _59.z;
    _372 = _59.w;
  }
  _373 = max(_369, 0.0f);
  _374 = max(_370, 0.0f);
  _375 = max(_371, 0.0f);
  [branch]
  if ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0) {
    if ((PostProcess_000.PostProcessConstant_Z_000[7].x) > 0.0f) {
      _386 = _34.x + TEXCOORD.x;
      _387 = _43 + TEXCOORD.y;
      _394 = ((PostProcess_000.PostProcessConstant_Z_000[6].y) == 1.0f);
      if (_394) {
        _408 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _408 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _413 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_386, _387), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _415 = _408 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _419 = min(max(_413, (_408 - _415)), (_415 + _408));
      _427 = ((PostProcess_000.PostProcessConstant_Z_000[5].w) * (_413 - _419)) / ((_419 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _413);
      _444 = -0.0f - (PostProcess_000.PostProcessConstant_Z_000[6].x);
      _446 = _386 + -0.5f;
      _447 = _387 + -0.5f;
      _455 = exp2(log2(sqrt((_447 * _447) + (_446 * _446))) * (PostProcess_000.PostProcessConstant_Z_000[7].y)) * (PostProcess_000.PostProcessConstant_Z_000[7].x);
      _457 = rsqrt(dot(float2(_446, _447), float2(_446, _447)));
      _460 = abs(min(max(min(max(((((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _427)) + (min(_427, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_415 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _444);
      _465 = -0.0f - (_455 * _460);
      _466 = (User_000.UserConstant_Z_000[2].x) * (_457 * _446);
      _468 = (User_000.UserConstant_Z_000[2].y) * (_457 * _447);
      _470 = _460 * _455;
      _473 = (_466 * _465) + _386;
      _474 = (_468 * _465) + _387;
      _475 = (_466 * _470) + _386;
      _476 = (_468 * _470) + _387;
      _477 = max(_56, 0.0f);
      if (_394) {
        _493 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _493 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _495 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_473, _474), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _496 = _493 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _500 = min(max(_495, (_493 - _496)), (_496 + _493));
      _505 = ((_495 - _500) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_500 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _495);
      if (_394) {
        _530 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t7.Load(int3(0, 0, 0)))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _530 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _532 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) / ((((float4)(t2.SampleLevel(s2, float2(_475, _476), 0.0f))).x) - (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _533 = _530 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _537 = min(max(_532, (_530 - _533)), (_533 + _530));
      _542 = ((_532 - _537) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_537 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _532);
      _759 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _505) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_505, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_496 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _444) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s1, float2(_473, _474), _477))).x) - _373)) + _373);
      _760 = _374;
      _761 = ((saturate(ceil(abs(min(max(min(max((((max(0.0f, _542) * (PostProcess_000.PostProcessConstant_Z_000[18].x)) + (min(_542, 0.0f) * (PostProcess_000.PostProcessConstant_Z_000[7].z))) * (1.0f / (_533 + 1.0f))), -1.0f), 1.0f), -0.30000001192092896f), 1.0f) * _444) / (PostProcess_000.PostProcessConstant_Z_000[6].x))) * ((((float4)(t0.SampleLevel(s1, float2(_475, _476), _477))).z) - _375)) + _375);
    } else {
      _759 = _373;
      _760 = _374;
      _761 = _375;
    }
  } else {
    if ((int)asint((User_000.UserConstant_Z_000[3].y)) > (int)0) {
      _575 = _34.x + TEXCOORD.x;
      _576 = _43 + TEXCOORD.y;
      _579 = t4.Sample(s4, float2(_575, _576));
      _590 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * (((float4)(t5.Sample(s5, float2(_575, _576)))).x);
      _596 = (_590 * (PostProcess_000.PostProcessConstant_Z_000[7].x)) + _575;
      _597 = (_590 * (PostProcess_000.PostProcessConstant_Z_000[7].y)) + _576;
      _759 = (lerp(_373, _579.x, _579.w));
      _760 = (lerp(_374, _579.y, _579.w));
      _761 = ((((_579.z - _375) + ((abs((((float4)(t5.Sample(s5, float2(_596, _597)))).x) * (PostProcess_000.PostProcessConstant_Z_000[6].x)) / (PostProcess_000.PostProcessConstant_Z_000[7].w)) * ((((float4)(t4.Sample(s4, float2(_596, _597)))).z) - _579.z))) * _579.w) + _375);
    } else {
      [branch]
      if ((int)asint((User_000.UserConstant_Z_000[3].x)) > (int)0) {
        _720 = abs(((float4)(t7.Sample(s7, float2(TEXCOORD.x, TEXCOORD.y)))).x);
      } else {
        _631 = t2.SampleLevel(s2, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _635 = (TEXCOORD.x * 2.0f) + -1.0f;
        _636 = (TEXCOORD.y * 2.0f) + -1.0f;
        _672 = mad(_631.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].z), mad(_636, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].x) * _635))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].w);
        _673 = (mad(_631.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].z), mad(_636, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].x) * _635))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].w)) / _672;
        _674 = (mad(_631.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].z), mad(_636, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].x) * _635))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].w)) / _672;
        _675 = (mad(_631.x, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].z), mad(_636, (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].y), ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].x) * _635))) + (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].w)) / _672;
        _681 = sqrt(((_674 * _674) + (_673 * _673)) + (_675 * _675));
        _690 = (PostProcess_000.PostProcessConstant_Z_000[6].w) * (PostProcess_000.PostProcessConstant_Z_000[5].x);
        _694 = min(max(_681, ((PostProcess_000.PostProcessConstant_Z_000[5].x) - _690)), (_690 + (PostProcess_000.PostProcessConstant_Z_000[5].x)));
        _701 = ((_681 - _694) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) / ((_694 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _681);
        _713 = (((PostProcess_000.PostProcessConstant_Z_000[18].x) * max(0.0f, _701)) + ((PostProcess_000.PostProcessConstant_Z_000[7].z) * min(_701, 0.0f))) * (1.0f / (_690 + 1.0f));
        _720 = saturate(max(abs(min((((float4)(t5.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y)))).x), _713)), abs(_713)));
      }
      _723 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * _720;
      _726 = t4.Sample(s4, float2(TEXCOORD.x, TEXCOORD.y));
      _735 = ((PostProcess_000.PostProcessConstant_Z_000[7].x) * _723) + TEXCOORD.x;
      _736 = ((PostProcess_000.PostProcessConstant_Z_000[7].y) * _723) + TEXCOORD.y;
      _747 = saturate(_723 + -1.0f);
      _759 = ((_747 * (_726.x - _373)) + _373);
      _760 = ((_747 * (_726.y - _374)) + _374);
      _761 = ((((_726.z - _375) + (abs(((float4)(t5.Sample(s5, float2(_735, _736)))).x) * ((((float4)(t4.Sample(s4, float2(_735, _736)))).z) - _726.z))) * _747) + _375);
    }
  }
  _771 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _773 = (_771 * _759) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _775 = (_771 * _760) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _777 = (_771 * _761) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _784 = (_53 * 2.0f) + -1.0f;
  _788 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_54 * 2.0f) + -1.0f);
  _801 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_788 * _788) + (_784 * _784))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _826 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _835 = t3.Sample(s3, float3(((_826 * log2((((_801 * ((_773 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _773)) + _773) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_826 * log2((((_801 * ((_775 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _775)) + _775) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_801 * ((_777 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _777)) + _777) * 335.718017578125f) + 1.0f) * _826) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _857 = ((exp2(_835.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _858 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
  _864 = (exp2(_858 * log2(_857)) + -1.0f) / (_857 + -1.0f);
  _871 = ((exp2(_835.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _877 = ((pow(_871, _858)) + -1.0f) / (_871 + -1.0f);
  _884 = ((exp2(_835.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _890 = ((pow(_884, _858)) + -1.0f) / (_884 + -1.0f);
  _897 = saturate(select((!(_857 == 1.0f)), ((_864 + -1.0f) / _864), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _858)));
  _898 = saturate(select((!(_871 == 1.0f)), ((_877 + -1.0f) / _877), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _858)));
  _899 = saturate(select((!(_884 == 1.0f)), ((_890 + -1.0f) / _890), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _858)));

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_897, _898, _899);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _921 = select((_897 <= 0.0031308000907301903f), (_897 * 12.920000076293945f), (((pow(_897, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _922 = select((_898 <= 0.0031308000907301903f), (_898 * 12.920000076293945f), (((pow(_898, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _923 = select((_899 <= 0.0031308000907301903f), (_899 * 12.920000076293945f), (((pow(_899, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_921, _922, _923);

    _944 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
    _947 = (int)(uint(SV_Position.x)) & 63;
    _948 = (int)(uint(SV_Position.y)) & 63;
    _953 = t6.Load(int4(_947, _948, _944, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_947, _948, _944, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_953.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_953.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _923);
  }
  SV_Target.w = _372;
  return SV_Target;
}