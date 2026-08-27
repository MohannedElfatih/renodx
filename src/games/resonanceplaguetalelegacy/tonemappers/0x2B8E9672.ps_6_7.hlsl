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

SamplerState s1 : register(s1);

SamplerState s0 : register(s0);

SamplerState s2 : register(s2);

SamplerState s3 : register(s3);

SamplerState s4 : register(s4);

SamplerState s5 : register(s5);

SamplerState s7 : register(s7);

SamplerState s8 : register(s8);

SamplerState s14 : register(s14);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}
uint firstbithigh_msb(uint value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}

void DrawNamedDebugFloat(inout renodx::canvas::Context context, float value,
                         int a, int b = 0, int c = 0, int d = 0, int e = 0,
                         int f = 0, int g = 0, int h = 0, int i = 0, int j = 0,
                         int k = 0, int l = 0, int m = 0, int n = 0, int o = 0,
                         int p = 0) {
  renodx::canvas::DrawDynamicText(context, a, b, c, d, e, f, g, h, i, j, k, l,
                                  m, n, o, p);
  renodx::canvas::DrawFloat(context, value, 0.0f, 6.0f);
  renodx::canvas::NewLine(context);
}

void DrawNamedDebugInteger(inout renodx::canvas::Context context, int value,
                           int a, int b = 0, int c = 0, int d = 0, int e = 0,
                           int f = 0, int g = 0, int h = 0, int i = 0,
                           int j = 0, int k = 0, int l = 0, int m = 0,
                           int n = 0, int o = 0, int p = 0) {
  renodx::canvas::DrawDynamicText(context, a, b, c, d, e, f, g, h, i, j, k, l,
                                  m, n, o, p);
  renodx::canvas::DrawInteger(context, value);
  renodx::canvas::NewLine(context);
}

float4 main(linear float4 TEXCOORD : TEXCOORD,
            precise noperspective float4 SV_Position : SV_Position)
    : SV_Target {
  float4 SV_Target;
  float4 _37;
  float4 _43;
  float _46;
  float _56;
  float _57;
  float _61;
  float4 _64;
  float _374;
  float _375;
  float _376;
  float _377;
  float _424;
  float _425;
  float _426;
  float _431;
  float _432;
  float _433;
  float _462;
  float _547;
  float _584;
  float _774;
  float _813;
  float _814;
  float _815;
  float _844;
  float _845;
  float _846;
  float _851;
  float _852;
  float _853;
  float _973;
  float _982;
  float _991;
  float _1039;
  float _1040;
  float _1041;
  int _72;
  uint2 _73;
  int _76;
  float _78;
  float _80;
  float _81;
  float _82;
  float _85;
  float _86;
  float _87;
  float _88;
  float _89;
  float _90;
  float _91;
  float _92;
  float _93;
  float _97;
  float _98;
  float _101;
  float _105;
  float _111;
  float _112;
  float _113;
  float _117;
  float _118;
  float _121;
  float _125;
  float _136;
  float _139;
  float _149;
  float _150;
  float _151;
  float _152;
  float _153;
  float4 _155;
  float4 _160;
  float4 _165;
  float4 _170;
  float _195;
  float _196;
  float _197;
  float _198;
  float _207;
  float _208;
  float _209;
  float _210;
  int _212;
  int _213;
  float _215;
  float _217;
  float _218;
  float _219;
  float _222;
  float _223;
  float _224;
  float _225;
  float _226;
  float _227;
  float _228;
  float _229;
  float _230;
  float _234;
  float _235;
  float _238;
  float _242;
  float _248;
  float _249;
  float _250;
  float _254;
  float _255;
  float _258;
  float _262;
  float _273;
  float _276;
  float _286;
  float _287;
  float _288;
  float _289;
  float _290;
  float4 _291;
  float4 _296;
  float4 _301;
  float4 _306;
  float _331;
  float _332;
  float _333;
  float _334;
  float _343;
  float _356;
  float _378;
  float _379;
  float _380;
  float4 _382;
  float4 _388;
  bool _395;
  float _406;
  float _407;
  float _408;
  float _440;
  float _441;
  bool _448;
  float _467;
  float _469;
  float _473;
  float _481;
  float _498;
  float _500;
  float _501;
  float _509;
  float _511;
  float _514;
  float _519;
  float _520;
  float _522;
  float _524;
  float _527;
  float _528;
  float _529;
  float _530;
  float _531;
  float _549;
  float _550;
  float _554;
  float _559;
  float _586;
  float _587;
  float _591;
  float _596;
  float _629;
  float _630;
  float4 _633;
  float _644;
  float _650;
  float _651;
  float4 _685;
  float _689;
  float _690;
  float _726;
  float _727;
  float _728;
  float _729;
  float _735;
  float _744;
  float _748;
  float _755;
  float _767;
  float _777;
  float4 _780;
  float _789;
  float _790;
  float _801;
  float _826;
  float _827;
  float _828;
  float _863;
  float _865;
  float _867;
  float _869;
  float _876;
  float _880;
  float _893;
  float _918;
  float4 _927;
  float _947;
  float _948;
  float _949;
  float _962;
  float _963;
  float _964;
  float _968;
  float _977;
  float _986;
  float _992;
  float _993;
  float _999;
  float _1007;
  float _1013;
  float _1021;
  float _1027;
  float _1063;
  float _1064;
  float _1065;
  int _1086;
  int _1089;
  int _1090;
  float4 _1095;
  _37 = t14.Sample(s14, float2(TEXCOORD.x, TEXCOORD.y));
  _43 = t16.Sample(s1, float2(TEXCOORD.z, TEXCOORD.w));
  _46 = (_43.y * 0.10000000149011612f) + _37.y;
  _56 = _37.x + TEXCOORD.z;
  _57 = _46 + TEXCOORD.w;
  _61 = log2(log2(((PostProcess_000.PostProcessConstant_Z_000[11].y) *
                   (exp2((_43.y * 0.5f) + _37.z) + -1.0f)) +
                  1.0f) +
             1.0f);
  _64 = t0.SampleLevel(s1, float2(_56, _57), _61);
  [branch] if (_61 > 0.0f) {
    _72 = int(floor(_61));
    t0.GetDimensions(_73.x, _73.y);
    _76 = _72 & 31;
    _78 = (float)((uint)((uint)((uint)(_73.x) >> _76)));
    _80 = (float)((uint)((uint)((uint)(_73.y) >> _76)));
    _81 = 1.0f / _78;
    _82 = 1.0f / _80;
    _85 = (_78 * _56) + -0.5f;
    _86 = (_80 * _57) + -0.5f;
    _87 = frac(_85);
    _88 = frac(_86);
    _89 = floor(_85);
    _90 = floor(_86);
    _91 = 1.0f - _87;
    _92 = 2.0f - _87;
    _93 = 3.0f - _87;
    _97 = (_91 * _91) * _91;
    _98 = (_92 * _92) * _92;
    _101 = _98 - (_97 * 4.0f);
    _105 = (6.0f - _97) - _101;
    _111 = 1.0f - _88;
    _112 = 2.0f - _88;
    _113 = 3.0f - _88;
    _117 = (_111 * _111) * _111;
    _118 = (_112 * _112) * _112;
    _121 = _118 - (_117 * 4.0f);
    _125 = (6.0f - _117) - _121;
    _136 = (_101 + _97) * 0.1666666716337204f;
    _139 = (_121 + _117) * 0.1666666716337204f;
    _149 = ((_89 + -0.5f) + ((_101 * 0.1666666716337204f) / _136)) * _81;
    _150 = ((_89 + 1.5f) +
            ((((((_98 * 4.0f) - ((_93 * _93) * _93)) - (_97 * 6.0f)) + _105) *
              0.1666666716337204f) /
             (_105 * 0.1666666716337204f))) *
           _81;
    _151 = ((_90 + -0.5f) + ((_121 * 0.1666666716337204f) / _139)) * _82;
    _152 =
        ((_90 + 1.5f) +
         ((((((_118 * 4.0f) - ((_113 * _113) * _113)) - (_117 * 6.0f)) + _125) *
           0.1666666716337204f) /
          (_125 * 0.1666666716337204f))) *
        _82;
    _153 = float((int)(_72));
    _155 = t0.SampleLevel(s0, float2(_149, _151), _153);
    _160 = t0.SampleLevel(s0, float2(_150, _151), _153);
    _165 = t0.SampleLevel(s0, float2(_149, _152), _153);
    _170 = t0.SampleLevel(s0, float2(_150, _152), _153);
    _195 = ((_165.x - _170.x) * _136) + _170.x;
    _196 = ((_165.y - _170.y) * _136) + _170.y;
    _197 = ((_165.z - _170.z) * _136) + _170.z;
    _198 = ((_165.w - _170.w) * _136) + _170.w;
    _207 = (((lerp(_160.x, _155.x, _136)) - _195) * _139) + _195;
    _208 = (((lerp(_160.y, _155.y, _136)) - _196) * _139) + _196;
    _209 = (((lerp(_160.z, _155.z, _136)) - _197) * _139) + _197;
    _210 = (((lerp(_160.w, _155.w, _136)) - _198) * _139) + _198;
    _212 = int(ceil(_61));
    _213 = _212 & 31;
    _215 = (float)((uint)((uint)((uint)(_73.x) >> _213)));
    _217 = (float)((uint)((uint)((uint)(_73.y) >> _213)));
    _218 = 1.0f / _215;
    _219 = 1.0f / _217;
    _222 = (_215 * _56) + -0.5f;
    _223 = (_217 * _57) + -0.5f;
    _224 = frac(_222);
    _225 = frac(_223);
    _226 = floor(_222);
    _227 = floor(_223);
    _228 = 1.0f - _224;
    _229 = 2.0f - _224;
    _230 = 3.0f - _224;
    _234 = (_228 * _228) * _228;
    _235 = (_229 * _229) * _229;
    _238 = _235 - (_234 * 4.0f);
    _242 = (6.0f - _234) - _238;
    _248 = 1.0f - _225;
    _249 = 2.0f - _225;
    _250 = 3.0f - _225;
    _254 = (_248 * _248) * _248;
    _255 = (_249 * _249) * _249;
    _258 = _255 - (_254 * 4.0f);
    _262 = (6.0f - _254) - _258;
    _273 = (_238 + _234) * 0.1666666716337204f;
    _276 = (_258 + _254) * 0.1666666716337204f;
    _286 = ((_226 + -0.5f) + ((_238 * 0.1666666716337204f) / _273)) * _218;
    _287 =
        ((_226 + 1.5f) +
         ((((((_235 * 4.0f) - ((_230 * _230) * _230)) - (_234 * 6.0f)) + _242) *
           0.1666666716337204f) /
          (_242 * 0.1666666716337204f))) *
        _218;
    _288 = ((_227 + -0.5f) + ((_258 * 0.1666666716337204f) / _276)) * _219;
    _289 =
        ((_227 + 1.5f) +
         ((((((_255 * 4.0f) - ((_250 * _250) * _250)) - (_254 * 6.0f)) + _262) *
           0.1666666716337204f) /
          (_262 * 0.1666666716337204f))) *
        _219;
    _290 = float((int)(_212));
    _291 = t0.SampleLevel(s0, float2(_286, _288), _290);
    _296 = t0.SampleLevel(s0, float2(_287, _288), _290);
    _301 = t0.SampleLevel(s0, float2(_286, _289), _290);
    _306 = t0.SampleLevel(s0, float2(_287, _289), _290);
    _331 = ((_301.x - _306.x) * _273) + _306.x;
    _332 = ((_301.y - _306.y) * _273) + _306.y;
    _333 = ((_301.z - _306.z) * _273) + _306.z;
    _334 = ((_301.w - _306.w) * _273) + _306.w;
    _343 = frac(_61);
    _356 = saturate(_61);
    _374 =
        ((((_207 - _64.x) +
           (((_331 - _207) + (((lerp(_296.x, _291.x, _273)) - _331) * _276)) *
            _343)) *
          _356) +
         _64.x);
    _375 =
        ((((_208 - _64.y) +
           (((_332 - _208) + (((lerp(_296.y, _291.y, _273)) - _332) * _276)) *
            _343)) *
          _356) +
         _64.y);
    _376 =
        ((((_209 - _64.z) +
           (((_333 - _209) + (((lerp(_296.z, _291.z, _273)) - _333) * _276)) *
            _343)) *
          _356) +
         _64.z);
    _377 =
        ((((_210 - _64.w) +
           (((_334 - _210) + (((lerp(_296.w, _291.w, _273)) - _334) * _276)) *
            _343)) *
          _356) +
         _64.w);
  }
  else {
    _374 = _64.x;
    _375 = _64.y;
    _376 = _64.z;
    _377 = _64.w;
  }
  _378 = max(_374, 0.0f);
  _379 = max(_375, 0.0f);
  _380 = max(_376, 0.0f);
  _382 = t12.SampleLevel(s1, float2(_56, _57), 0.0f);
  _388 = t8.Sample(s8, float2((_37.x + TEXCOORD.x), (_46 + TEXCOORD.y)));
  _395 = ((int)asint((User_000.UserConstant_Z_000[3].z)) > (int)0);
  if (!_395) {
    _406 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _388.x) +
           (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _407 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _388.y) +
           (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _408 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _388.z) +
           (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _424 = (saturate(_406) * (_382.x - _378));
      _425 = (saturate(_407) * (_382.y - _379));
      _426 = (saturate(_408) * (_382.z - _380));
    } else {
      _424 = (_406 * _382.x);
      _425 = (_407 * _382.y);
      _426 = (_408 * _382.z);
    }
    _431 = (_424 + _378);
    _432 = (_425 + _379);
    _433 = (_426 + _380);
  } else {
    _431 = _378;
    _432 = _379;
    _433 = _380;
  }
  [branch] if (_395) {
    if ((PostProcess_000.PostProcessConstant_Z_000[7].x) > 0.0f) {
      _440 = _37.x + TEXCOORD.x;
      _441 = _46 + TEXCOORD.y;
      _448 = ((PostProcess_000.PostProcessConstant_Z_000[6].y) == 1.0f);
      if (_448) {
        _462 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) /
                ((((float4)(t7.Load(int3(0, 0, 0)))).x) -
                 (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _462 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _467 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) /
             ((((float4)(t2.SampleLevel(s2, float2(_440, _441), 0.0f))).x) -
              (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _469 = _462 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _473 = min(max(_467, (_462 - _469)), (_469 + _462));
      _481 =
          ((PostProcess_000.PostProcessConstant_Z_000[5].w) * (_467 - _473)) /
          ((_473 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _467);
      _498 = -0.0f - (PostProcess_000.PostProcessConstant_Z_000[6].x);
      _500 = _440 + -0.5f;
      _501 = _441 + -0.5f;
      _509 = exp2(log2(sqrt((_501 * _501) + (_500 * _500))) *
                  (PostProcess_000.PostProcessConstant_Z_000[7].y)) *
             (PostProcess_000.PostProcessConstant_Z_000[7].x);
      _511 = rsqrt(dot(float2(_500, _501), float2(_500, _501)));
      _514 = abs(
          min(max(min(max(((((PostProcess_000.PostProcessConstant_Z_000[18].x) *
                             max(0.0f, _481)) +
                            (min(_481, 0.0f) *
                             (PostProcess_000.PostProcessConstant_Z_000[7]
                                  .z))) *
                           (1.0f / (_469 + 1.0f))),
                          -1.0f),
                      1.0f),
                  -0.30000001192092896f),
              1.0f) *
          _498);
      _519 = -0.0f - (_509 * _514);
      _520 = (User_000.UserConstant_Z_000[2].x) * (_511 * _500);
      _522 = (User_000.UserConstant_Z_000[2].y) * (_511 * _501);
      _524 = _514 * _509;
      _527 = (_520 * _519) + _440;
      _528 = (_522 * _519) + _441;
      _529 = (_520 * _524) + _440;
      _530 = (_522 * _524) + _441;
      _531 = max(_61, 0.0f);
      if (_448) {
        _547 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) /
                ((((float4)(t7.Load(int3(0, 0, 0)))).x) -
                 (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _547 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _549 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) /
             ((((float4)(t2.SampleLevel(s2, float2(_527, _528), 0.0f))).x) -
              (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _550 = _547 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _554 = min(max(_549, (_547 - _550)), (_550 + _547));
      _559 =
          ((_549 - _554) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) /
          ((_554 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _549);
      if (_448) {
        _584 = ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) /
                ((((float4)(t7.Load(int3(0, 0, 0)))).x) -
                 (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z)));
      } else {
        _584 = (PostProcess_000.PostProcessConstant_Z_000[5].x);
      }
      _586 = (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].w) /
             ((((float4)(t2.SampleLevel(s2, float2(_529, _530), 0.0f))).x) -
              (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][2].z));
      _587 = _584 * (PostProcess_000.PostProcessConstant_Z_000[6].w);
      _591 = min(max(_586, (_584 - _587)), (_587 + _584));
      _596 =
          ((_586 - _591) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) /
          ((_591 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _586);
      _813 = ((saturate(ceil(
                   abs(min(max(min(max((((max(0.0f, _559) *
                                          (PostProcess_000
                                               .PostProcessConstant_Z_000[18]
                                               .x)) +
                                         (min(_559, 0.0f) *
                                          (PostProcess_000
                                               .PostProcessConstant_Z_000[7]
                                               .z))) *
                                        (1.0f / (_550 + 1.0f))),
                                       -1.0f),
                                   1.0f),
                               -0.30000001192092896f),
                           1.0f) *
                       _498) /
                   (PostProcess_000.PostProcessConstant_Z_000[6].x))) *
               ((((float4)(t0.SampleLevel(s1, float2(_527, _528), _531))).x) -
                _431)) +
              _431);
      _814 = _432;
      _815 = ((saturate(ceil(
                   abs(min(max(min(max((((max(0.0f, _596) *
                                          (PostProcess_000
                                               .PostProcessConstant_Z_000[18]
                                               .x)) +
                                         (min(_596, 0.0f) *
                                          (PostProcess_000
                                               .PostProcessConstant_Z_000[7]
                                               .z))) *
                                        (1.0f / (_587 + 1.0f))),
                                       -1.0f),
                                   1.0f),
                               -0.30000001192092896f),
                           1.0f) *
                       _498) /
                   (PostProcess_000.PostProcessConstant_Z_000[6].x))) *
               ((((float4)(t0.SampleLevel(s1, float2(_529, _530), _531))).z) -
                _433)) +
              _433);
    } else {
      _813 = _431;
      _814 = _432;
      _815 = _433;
    }
  }
  else {
    if ((int)asint((User_000.UserConstant_Z_000[3].y)) > (int)0) {
      _629 = _37.x + TEXCOORD.x;
      _630 = _46 + TEXCOORD.y;
      _633 = t4.Sample(s4, float2(_629, _630));
      _644 = (PostProcess_000.PostProcessConstant_Z_000[6].x) *
             (((float4)(t5.Sample(s5, float2(_629, _630)))).x);
      _650 = (_644 * (PostProcess_000.PostProcessConstant_Z_000[7].x)) + _629;
      _651 = (_644 * (PostProcess_000.PostProcessConstant_Z_000[7].y)) + _630;
      _813 = (lerp(_431, _633.x, _633.w));
      _814 = (lerp(_432, _633.y, _633.w));
      _815 =
          ((((_633.z - _433) +
             ((abs((((float4)(t5.Sample(s5, float2(_650, _651)))).x) *
                   (PostProcess_000.PostProcessConstant_Z_000[6].x)) /
               (PostProcess_000.PostProcessConstant_Z_000[7].w)) *
              ((((float4)(t4.Sample(s4, float2(_650, _651)))).z) - _633.z))) *
            _633.w) +
           _433);
    } else {
      [branch] if ((int)asint((User_000.UserConstant_Z_000[3].x)) > (int)0) {
        _774 = abs(((float4)(t7.Sample(s7, float2(TEXCOORD.x, TEXCOORD.y)))).x);
      }
      else {
        _685 = t2.SampleLevel(s2, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
        _689 = (TEXCOORD.x * 2.0f) + -1.0f;
        _690 = (TEXCOORD.y * 2.0f) + -1.0f;
        _726 =
            mad(_685.x,
                (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].z),
                mad(_690,
                    (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].y),
                    ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].x) *
                     _689))) +
            (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][11].w);
        _727 =
            (mad(_685.x,
                 (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].z),
                 mad(_690,
                     (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].y),
                     ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].x) *
                      _689))) +
             (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][8].w)) /
            _726;
        _728 =
            (mad(_685.x,
                 (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].z),
                 mad(_690,
                     (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].y),
                     ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].x) *
                      _689))) +
             (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][9].w)) /
            _726;
        _729 =
            (mad(_685.x,
                 (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].z),
                 mad(_690,
                     (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].y),
                     ((Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].x) *
                      _689))) +
             (Global_000.GlobalCB_Z_2720.ProjConstant_Z_000[0][10].w)) /
            _726;
        _735 = sqrt(((_728 * _728) + (_727 * _727)) + (_729 * _729));
        _744 = (PostProcess_000.PostProcessConstant_Z_000[6].w) *
               (PostProcess_000.PostProcessConstant_Z_000[5].x);
        _748 = min(max(_735, ((PostProcess_000.PostProcessConstant_Z_000[5].x) -
                              _744)),
                   (_744 + (PostProcess_000.PostProcessConstant_Z_000[5].x)));
        _755 =
            ((_735 - _748) * (PostProcess_000.PostProcessConstant_Z_000[5].w)) /
            ((_748 - (PostProcess_000.PostProcessConstant_Z_000[5].y)) * _735);
        _767 = (((PostProcess_000.PostProcessConstant_Z_000[18].x) *
                 max(0.0f, _755)) +
                ((PostProcess_000.PostProcessConstant_Z_000[7].z) *
                 min(_755, 0.0f))) *
               (1.0f / (_744 + 1.0f));
        _774 = saturate(max(
            abs(min(
                (((float4)(t5.Sample(s5, float2(TEXCOORD.x, TEXCOORD.y)))).x),
                _767)),
            abs(_767)));
      }
      _777 = (PostProcess_000.PostProcessConstant_Z_000[6].x) * _774;
      _780 = t4.Sample(s4, float2(TEXCOORD.x, TEXCOORD.y));
      _789 = ((PostProcess_000.PostProcessConstant_Z_000[7].x) * _777) +
             TEXCOORD.x;
      _790 = ((PostProcess_000.PostProcessConstant_Z_000[7].y) * _777) +
             TEXCOORD.y;
      _801 = saturate(_777 + -1.0f);
      _813 = ((_801 * (_780.x - _431)) + _431);
      _814 = ((_801 * (_780.y - _432)) + _432);
      _815 =
          ((((_780.z - _433) +
             (abs(((float4)(t5.Sample(s5, float2(_789, _790)))).x) *
              ((((float4)(t4.Sample(s4, float2(_789, _790)))).z) - _780.z))) *
            _801) +
           _433);
    }
  }
  if (_395) {
    _826 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _388.x) +
           (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _827 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _388.y) +
           (PostProcess_000.PostProcessConstant_Z_000[4].z);
    _828 = ((PostProcess_000.PostProcessConstant_Z_000[4].w) * _388.z) +
           (PostProcess_000.PostProcessConstant_Z_000[4].z);
    if (!((PostProcess_000.PostProcessConstant_Z_000[17].z) >= -1.0f)) {
      _844 = (saturate(_826) * (_382.x - _813));
      _845 = (saturate(_827) * (_382.y - _814));
      _846 = (saturate(_828) * (_382.z - _815));
    } else {
      _844 = (_826 * _382.x);
      _845 = (_827 * _382.y);
      _846 = (_828 * _382.z);
    }
    _851 = (_844 + _813);
    _852 = (_845 + _814);
    _853 = (_846 + _815);
  } else {
    _851 = _813;
    _852 = _814;
    _853 = _815;
  }
  _863 = (((float4)(t17.Load(int3(0, 0, 0)))).x) *
         (Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[87].y);
  _865 = (_863 * _851) * (PostProcess_000.PostProcessConstant_Z_000[14].x);
  _867 = (_863 * _852) * (PostProcess_000.PostProcessConstant_Z_000[14].y);
  _869 = (_863 * _853) * (PostProcess_000.PostProcessConstant_Z_000[14].z);
  _876 = (_56 * 2.0f) + -1.0f;
  _880 = (PostProcess_000.PostProcessConstant_Z_000[13].w) *
         ((_57 * 2.0f) + -1.0f);
  _893 =
      exp2(log2(saturate(((PostProcess_000.PostProcessConstant_Z_000[13].x) *
                          sqrt((_880 * _880) + (_876 * _876))) +
                         (PostProcess_000.PostProcessConstant_Z_000[13].y))) *
           (PostProcess_000.PostProcessConstant_Z_000[13].z));
  _918 =
      (PostProcess_000.PostProcessConstant_Z_320[0].x) * 0.07434873282909393f;

  // Sample the generated color-grading LUT in its normalized log domain.
  _927 = t3.Sample(
      s3,
      float3(
          ((_918 *
            log2(
                (((_893 *
                   ((_865 * (PostProcess_000.PostProcessConstant_Z_000[12].x)) -
                    _865)) +
                  _865) *
                 335.718017578125f) +
                1.0f)) +
           (PostProcess_000.PostProcessConstant_Z_320[0].y)),
          ((_918 *
            log2(
                (((_893 *
                   ((_867 * (PostProcess_000.PostProcessConstant_Z_000[12].y)) -
                    _867)) +
                  _867) *
                 335.718017578125f) +
                1.0f)) +
           (PostProcess_000.PostProcessConstant_Z_320[0].y)),
          ((log2(
                (((_893 *
                   ((_869 * (PostProcess_000.PostProcessConstant_Z_000[12].z)) -
                    _869)) +
                  _869) *
                 335.718017578125f) +
                1.0f) *
            _918) +
           (PostProcess_000.PostProcessConstant_Z_320[0].y))));

  _947 =
      ((exp2(_927.x * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) *
      (User_000.UserConstant_Z_000[4].x);
  _948 =
      ((exp2(_927.y * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) *
      (User_000.UserConstant_Z_000[4].y);
  _949 =
      ((exp2(_927.z * 13.450128555297852f) + -1.0f) * 0.0029786902014166117f) *
      (User_000.UserConstant_Z_000[4].z);

  // Tonemap to peak using Reinhard, with optional toe adjustments
  if (!((PostProcess_000.PostProcessConstant_Z_000[17].x) == 0.0f) &&
      RENODX_TONE_MAP_TYPE == 0.f) {
    _962 = (PostProcess_000.PostProcessConstant_Z_000[10].w) * _947;
    _963 = (PostProcess_000.PostProcessConstant_Z_000[10].w) * _948;
    _964 = (PostProcess_000.PostProcessConstant_Z_000[10].w) * _949;
    if (_962 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _968 = 1.0f - (_962 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _973 =
          (((_968 * _968) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) +
           _962);
    } else {
      _973 = _962;
    }
    if (_963 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _977 = 1.0f - (_963 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _982 =
          (((_977 * _977) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) +
           _963);
    } else {
      _982 = _963;
    }
    if (_964 < (PostProcess_000.PostProcessConstant_Z_000[16].z)) {
      _986 = 1.0f - (_964 / (PostProcess_000.PostProcessConstant_Z_000[16].z));
      _991 =
          (((_986 * _986) * (PostProcess_000.PostProcessConstant_Z_000[15].w)) +
           _964);
    } else {
      _991 = _964;
    }
    _992 = _973 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _993 = (PostProcess_000.PostProcessConstant_Z_000[17].y) + 2.0f;
    _999 = ((pow(_992, _993)) + -1.0f) / (_992 + -1.0f);
    _1007 = _982 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _1013 = ((pow(_1007, _993)) + -1.0f) / (_1007 + -1.0f);
    _1021 = _991 / (PostProcess_000.PostProcessConstant_Z_000[16].x);
    _1027 = ((pow(_1021, _993)) + -1.0f) / (_1021 + -1.0f);
    _1039 =
        ((select((!(_992 == 1.0f)), ((_999 + -1.0f) / _999),
                 (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) /
                  _993)) *
          (PostProcess_000.PostProcessConstant_Z_000[16].x)) /
         (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _1040 =
        ((select((!(_1007 == 1.0f)), ((_1013 + -1.0f) / _1013),
                 (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) /
                  _993)) *
          (PostProcess_000.PostProcessConstant_Z_000[16].x)) /
         (PostProcess_000.PostProcessConstant_Z_000[10].w));
    _1041 =
        ((select((!(_1021 == 1.0f)), ((_1027 + -1.0f) / _1027),
                 (((PostProcess_000.PostProcessConstant_Z_000[17].y) + 1.0f) /
                  _993)) *
          (PostProcess_000.PostProcessConstant_Z_000[16].x)) /
         (PostProcess_000.PostProcessConstant_Z_000[10].w));
  } else {
    _1039 = _947;
    _1040 = _948;
    _1041 = _949;
  }

  float3 output;
  if (RENODX_TONE_MAP_TYPE) {
    output = float3(_1039, _1040, _1041);
    output = renodx::draw::RenderIntermediatePass(output);
    SV_Target.rgb = output;
  } else {
    _1063 =
        select((_1039 <= 0.0031308000907301903f), (_1039 * 12.920000076293945f),
               (((pow(_1039, 0.4166666567325592f)) * 1.0549999475479126f) +
                -0.054999999701976776f));
    _1064 =
        select((_1040 <= 0.0031308000907301903f), (_1040 * 12.920000076293945f),
               (((pow(_1040, 0.4166666567325592f)) * 1.0549999475479126f) +
                -0.054999999701976776f));
    _1065 =
        select((_1041 <= 0.0031308000907301903f), (_1041 * 12.920000076293945f),
               (((pow(_1041, 0.4166666567325592f)) * 1.0549999475479126f) +
                -0.054999999701976776f));

    output = float3(_1063, _1064, _1065);

    _1086 = asint((Global_000.GlobalCB_Z_000.GlobalConstant_Z_000[1].w));
    _1089 = (int)(uint(SV_Position.x)) & 63;
    _1090 = (int)(uint(SV_Position.y)) & 63;
    _1095 = t6.Load(int4(_1089, _1090, _1086, 0));
    SV_Target.x = (((((float4)(t1.Load(int4(_1089, _1090, _1086, 0)))).x) *
                    select((output.r <= 0.0f), 0.0f,
                           exp2(floor(log2(output.r)) + -6.0f))) +
                   output.r);
    SV_Target.y = ((_1095.x * select((output.g <= 0.0f), 0.0f,
                                     exp2(floor(log2(output.g)) + -6.0f))) +
                   output.g);
    SV_Target.z = ((_1095.y * select((output.b <= 0.0f), 0.0f,
                                     exp2(floor(log2(output.b)) + -5.0f))) +
                   _1065);
  }

  SV_Target.w = _377;
  return SV_Target;
}