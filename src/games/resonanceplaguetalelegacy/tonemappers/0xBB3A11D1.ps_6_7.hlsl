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

SamplerState s1 : register(s1);

SamplerState s2 : register(s2);

SamplerState s0 : register(s0);

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
  float4 _32;
  float4 _38;
  float _41;
  float _51;
  float _52;
  float _56;
  float4 _59;
  float _369;
  float _370;
  float _371;
  float _372;
  float _419;
  float _420;
  float _421;
  float _426;
  float _427;
  float _428;
  float _457;
  float _458;
  float _459;
  float _464;
  float _465;
  float _466;
  float _612;
  float _684;
  float _693;
  float _702;
  float _750;
  float _751;
  float _752;
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
  float4 _377;
  float4 _383;
  bool _390;
  float _401;
  float _402;
  float _403;
  float _439;
  float _440;
  float _441;
  float _476;
  float _478;
  float _480;
  float _482;
  float _489;
  float _493;
  float _506;
  float _531;
  float4 _540;
  float _560;
  float _561;
  float _562;
  float4 _578;
  float _582;
  bool _585;
  int _588;
  float _590;
  float _591;
  float4 _597;
  float4 _606;
  float _615;
  float _621;
  float _622;
  float _623;
  float _625;
  float _628;
  float _635;
  float _636;
  float _652;
  float _659;
  float _660;
  float _661;
  float _673;
  float _674;
  float _675;
  float _679;
  float _688;
  float _697;
  float _703;
  float _704;
  float _710;
  float _718;
  float _724;
  float _732;
  float _738;
  float _774;
  float _775;
  float _776;
  int _797;
  int _798;
  float4 _802;
  _32 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _38 = t16.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _41 = (_38.y * 0.10000000149011612f) + _32.y;
  _51 = _32.x + TEXCOORD.z;
  _52 = _41 + TEXCOORD.w;
  _56 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) * (exp2((_38.y * 0.5f) + _32.z) + -1.0f)) + 1.0f) + 1.0f);
  _59 = t0.SampleLevel(s1, float2(_51, _52), _56);
  [branch]
  if (_56 > 0.0f) {
    _67 = int(floor(_56));
    t0.GetDimensions(_68.x, _68.y);
    _71 = _67 & 31;
    _73 = (float)((uint)((uint)((uint)(_68.x) >> _71)));
    _75 = (float)((uint)((uint)((uint)(_68.y) >> _71)));
    _76 = 1.0f / _73;
    _77 = 1.0f / _75;
    _80 = (_73 * _51) + -0.5f;
    _81 = (_75 * _52) + -0.5f;
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
    _217 = (_210 * _51) + -0.5f;
    _218 = (_212 * _52) + -0.5f;
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
  _377 = t12.SampleLevel(s1, float2(_51, _52), 0.0f);
  _383 = t8.Sample(s8, float2((_32.x + TEXCOORD.x), (_41 + TEXCOORD.y)));
  _390 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_390) {
    _401 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _383.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _402 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _383.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _403 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _383.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _419 = (saturate(_401) * (_377.x - _373));
      _420 = (saturate(_402) * (_377.y - _374));
      _421 = (saturate(_403) * (_377.z - _375));
    } else {
      _419 = (_401 * _377.x);
      _420 = (_402 * _377.y);
      _421 = (_403 * _377.z);
    }
    _426 = (_419 + _373);
    _427 = (_420 + _374);
    _428 = (_421 + _375);
  } else {
    _426 = _373;
    _427 = _374;
    _428 = _375;
  }
  if (_390) {
    _439 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _383.x) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _440 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _383.y) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _441 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _383.z) + (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _457 = (saturate(_439) * (_377.x - _426));
      _458 = (saturate(_440) * (_377.y - _427));
      _459 = (saturate(_441) * (_377.z - _428));
    } else {
      _457 = (_439 * _377.x);
      _458 = (_440 * _377.y);
      _459 = (_441 * _377.z);
    }
    _464 = (_457 + _426);
    _465 = (_458 + _427);
    _466 = (_459 + _428);
  } else {
    _464 = _426;
    _465 = _427;
    _466 = _428;
  }
  _476 = (((float4)(t17.Load(int3(0, 0, 0)))).x) * (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _478 = (_476 * _464) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _480 = (_476 * _465) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _482 = (_476 * _466) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _489 = (_51 * 2.0f) + -1.0f;
  _493 = (PostProcess_000.PostProcessConstant_Z_000[13].w) * ((_52 * 2.0f) + -1.0f);
  _506 = exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) * sqrt((_493 * _493) + (_489 * _489))) + (PostProcess_000.PostProcessConstant_Z_000[13].y))) * (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _531 = (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;
  _540 = t3.Sample(s3, float3(((_531 * log2((((_506 * ((_478 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) - _478)) + _478) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((_531 * log2((((_506 * ((_480 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) - _480)) + _480) * 335.718017578125f) + 1.0f)) + (PostProcess_000.PostProcessConstant_Z_320[0].y)), ((log2((((_506 * ((_482 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) - _482)) + _482) * 335.718017578125f) + 1.0f) * _531) + (PostProcess_000.PostProcessConstant_Z_320[0].y))));
  _560 = ((exp2(_540.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].x);
  _561 = ((exp2(_540.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].y);
  _562 = ((exp2(_540.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) * (User_000.UserConstant_Z_000[4].z);
  _578 = t9.Sample(s9, float2(((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.x) * (PostProcess_000.PostProcessConstant_Z_000[9].x)) + (PostProcess_000.PostProcessConstant_Z_000[9].z)), ((((PostProcess_000.PostProcessConstant_Z_000[10].z) * TEXCOORD.y) * (PostProcess_000.PostProcessConstant_Z_000[9].y)) + (PostProcess_000.PostProcessConstant_Z_000[9].w))));
  _582 = dot(float3(_560, _561, _562), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _585 = ((PostProcess_000.PostProcessConstant_Z_000[10].x) > 0.0f);
  _588 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
  _590 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.x;
  _591 = (PostProcess_000.PostProcessConstant_Z_000[10].z) * SV_Position.y;
  _597 = t2.Load(int4(((int)(uint(_590)) & 63), ((int)(uint(_591)) & 63), select(_585, _588, 0), 0));
  if ((PostProcess_000.PostProcessConstant_Z_000[10].z) < 1.0f) {
    _606 = t2.SampleLevel(s2, float3((_590 * 0.015625f), (_591 * 0.015625f), select(_585, ((float)((uint)_588)), 0.0f)), 0.0f);
    _612 = (((_597.y - _606.y) * (PostProcess_000.PostProcessConstant_Z_000[10].z)) + _606.y);
  } else {
    _612 = _597.y;
  }
  _615 = _612 * 2.0f;
  _621 = (((_578.x * -2.0f) * _612) + _578.x) * _578.x;
  _622 = ((_615 * _578.y) - _578.y) * _578.y;
  _623 = ((_615 * _578.z) - _578.z) * _578.z;
  _625 = _582 / (_582 + 1.0f);
  _628 = saturate((_625 + -9.999999747378752e-05f) * 1111.111083984375f);
  _635 = (float)((bool)(uint)((PostProcess_000.PostProcessConstant_Z_000[10].y) > 0.0f));
  _636 = dot(float3(_621, _622, _623), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  _652 = ((_628 * _628) * (3.0f - (_628 * 2.0f))) * ((((PostProcess_000.PostProcessConstant_Z_000[2].y) - (PostProcess_000.PostProcessConstant_Z_000[2].x)) * _625) + (PostProcess_000.PostProcessConstant_Z_000[2].x));
  _659 = max(0.0f, ((_652 * (lerp(_621, _636, _635))) + _560));
  _660 = max(0.0f, ((_652 * (lerp(_622, _636, _635))) + _561));
  _661 = max(0.0f, ((_652 * (lerp(_623, _636, _635))) + _562));
  if (!((PostProcess_000.PostProcessConstant_Z_000[17].x) == 0.0f) &&
      RENODX_TONE_MAP_TYPE == 0.f) {
    _673 = _659 * (PostProcess_000.PostProcessConstant_Z_000[10].w);
    _674 = _660 * (PostProcess_000.PostProcessConstant_Z_000[10].w);
    _675 = _661 * (PostProcess_000.PostProcessConstant_Z_000[10].w);
    if (_673 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _679 = 1.0f - (_673 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _684 = (((_679 * _679) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _673);
    } else {
      _684 = _673;
    }
    if (_674 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _688 = 1.0f - (_674 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _693 = (((_688 * _688) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _674);
    } else {
      _693 = _674;
    }
    if (_675 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _697 = 1.0f - (_675 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _702 = (((_697 * _697) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) + _675);
    } else {
      _702 = _675;
    }
    _703 = _684 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _704 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
    _710 = ((pow(_703, _704)) + -1.0f) / (_703 + -1.0f);
    _718 = _693 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _724 = ((pow(_718, _704)) + -1.0f) / (_718 + -1.0f);
    _732 = _702 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _738 = ((pow(_732, _704)) + -1.0f) / (_732 + -1.0f);
    _750 = ((select((!(_703 == 1.0f)), ((_710 + -1.0f) / _710), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _704)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _751 = ((select((!(_718 == 1.0f)), ((_724 + -1.0f) / _724), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _704)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _752 = ((select((!(_732 == 1.0f)), ((_738 + -1.0f) / _738), (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) / _704)) * (PostProcess_000.PostProcessConstant_Z_000[16].x)) / (PostProcess_000.PostProcessConstant_Z_000[10].w));
  } else {
    _750 = _659;
    _751 = _660;
    _752 = _661;
  }

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_750, _751, _752);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _774 = select((_750 <= 0.0031308000907301903f), (_750 * 12.920000076293945f), (((pow(_750, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _775 = select((_751 <= 0.0031308000907301903f), (_751 * 12.920000076293945f), (((pow(_751, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));
    _776 = select((_752 <= 0.0031308000907301903f), (_752 * 12.920000076293945f), (((pow(_752, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f));

    output = float3(_774, _775, _776);

    _797 = (int)(uint(SV_Position.x)) & 63;
    _798 = (int)(uint(SV_Position.y)) & 63;
    _802 = t2.Load(int4(_797, _798, _588, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_797, _798, _588, 0)))).x) * select((output.r <= 0.0f), 0.0f, exp2(floor(log2(output.r)) + -6.0f))) + output.r);
    SV_Target.y = ((_802.x * select((output.g <= 0.0f), 0.0f, exp2(floor(log2(output.g)) + -6.0f))) + output.g);
    SV_Target.z = ((_802.y * select((output.b <= 0.0f), 0.0f, exp2(floor(log2(output.b)) + -5.0f))) + _776);
  }
  SV_Target.w = _372;
  return SV_Target;
}