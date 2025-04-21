#include "./shared.h"
Texture2D<float4> HDRImage : register(t0);

cbuffer TonemapParam : register(b0) {
  float TonemapParam_000x : packoffset(c000.x); // Contrast
  float TonemapParam_000y : packoffset(c000.y); // Linear Begin
  float TonemapParam_000w : packoffset(c000.w); // Toe
  float TonemapParam_001x : packoffset(c001.x); // MaxNit
  float TonemapParam_001y : packoffset(c001.y); // Linear Start
  float TonemapParam_001z : packoffset(c001.z); // Display MaxNit Subcontrast Factor
  float TonemapParam_001w : packoffset(c001.w); // Contrast Factor
  float TonemapParam_002x : packoffset(c002.x); // MulLinear Start Contrast Factor
  float TonemapParam_002y : packoffset(c002.y); // InvLinear Begin
  float TonemapParam_002z : packoffset(c002.z); // MadLinear Start Contrast Factor
};

cbuffer DynamicRangeConversionParam : register(b1) {
  float DynamicRangeConversionParam_000x : packoffset(c000.x); // Use Dynamic Range Conversion Param
  float DynamicRangeConversionParam_000y : packoffset(c000.y); // Exposure Scale
  float DynamicRangeConversionParam_000z : packoffset(c000.z); // Knee StartNit
  float DynamicRangeConversionParam_000w : packoffset(c000.w); // Knee
};

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float4 Kerare : Kerare,
  linear float Exposure : Exposure
) : SV_Target {
  float4 SV_Target;
  float4 _12 = HDRImage.Load(int3(((uint)(uint((SV_Position.x)))), ((uint)(uint((SV_Position.y)))), 0));
  float _16 = (_12.x) * (Exposure);
  float _17 = (_12.y) * (Exposure);
  float _18 = (_12.z) * (Exposure);
  float3 untonemapped = float3(_16, _17, _18);
  untonemapped = renodx::color::srgb::DecodeSafe(untonemapped);
  float _121 = 1.0f;
  float _122 = 1.0f;
  float _123 = 1.0f;
  float _171;
  float _196;
  float _197;
  float _198;
  if ((isnan((max((max(_16, _17)), _18))))) {
    float _27 = (TonemapParam_002y) * _16;
    float _33 = (TonemapParam_002y) * _17;
    float _39 = (TonemapParam_002y) * _18;
    float _46 = (((bool)((_16 >= (TonemapParam_000y)))) ? 0.0f : (1.0f - ((_27 * _27) * (3.0f - (_27 * 2.0f)))));
    float _48 = (((bool)((_17 >= (TonemapParam_000y)))) ? 0.0f : (1.0f - ((_33 * _33) * (3.0f - (_33 * 2.0f)))));
    float _50 = (((bool)((_18 >= (TonemapParam_000y)))) ? 0.0f : (1.0f - ((_39 * _39) * (3.0f - (_39 * 2.0f)))));
    float _56 = (((bool)((_16 < (TonemapParam_001y)))) ? 0.0f : 1.0f);
    float _57 = (((bool)((_17 < (TonemapParam_001y)))) ? 0.0f : 1.0f);
    float _58 = (((bool)((_18 < (TonemapParam_001y)))) ? 0.0f : 1.0f);
    _121 = ((((((TonemapParam_000x) * _16) + (TonemapParam_002z)) * ((1.0f - _56) - _46)) + (((exp2(((log2(_27)) * (TonemapParam_000w)))) * _46) * (TonemapParam_000y))) + (((TonemapParam_001x) - ((exp2((((TonemapParam_001w) * _16) + (TonemapParam_002x)))) * (TonemapParam_001z))) * _56));
    _122 = ((((((TonemapParam_000x) * _17) + (TonemapParam_002z)) * ((1.0f - _57) - _48)) + (((exp2(((log2(_33)) * (TonemapParam_000w)))) * _48) * (TonemapParam_000y))) + (((TonemapParam_001x) - ((exp2((((TonemapParam_001w) * _17) + (TonemapParam_002x)))) * (TonemapParam_001z))) * _57));
    _123 = ((((((TonemapParam_000x) * _18) + (TonemapParam_002z)) * ((1.0f - _58) - _50)) + (((exp2(((log2(_39)) * (TonemapParam_000w)))) * _50) * (TonemapParam_000y))) + (((TonemapParam_001x) - ((exp2((((TonemapParam_001w) * _18) + (TonemapParam_002x)))) * (TonemapParam_001z))) * _58));
  }
  _196 = _121;
  _197 = _122;
  _198 = _123;
  if ((!((DynamicRangeConversionParam_000x) == 0.0f))) {
    float _133 = mad(0.16500000655651093f, _123, (mad(0.16500000655651093f, _122, (_121 * 0.6699999570846558f))));
    float _134 = _121 * 0.16500000655651093f;
    float _136 = mad(0.16500000655651093f, _123, (mad(0.6699999570846558f, _122, _134)));
    float _138 = mad(0.6699999570846558f, _123, (mad(0.16500000655651093f, _122, _134)));
    float _141 = mad(0.1688999980688095f, _138, (mad(0.1446000039577484f, _136, (_133 * 0.6370000243186951f))));
    float _144 = mad(0.059300001710653305f, _138, (mad(0.6779999732971191f, _136, (_133 * 0.26269999146461487f))));
    float _148 = (_144 + _141) + (mad(1.0609999895095825f, _138, (mad(0.02810000069439411f, _136, 0.0f))));
    float _149 = _141 / _148;
    float _150 = _144 / _148;
    float _152 = ((DynamicRangeConversionParam_000z) / (DynamicRangeConversionParam_000y)) * 0.009999999776482582f;
    float _153 = 1.0f - (DynamicRangeConversionParam_000w);
    do {
      if (((_144 < _152))) {
        _171 = (_144 * (DynamicRangeConversionParam_000y));
      } else {
        float _162 = (((DynamicRangeConversionParam_000y) * _153) * _152) * 0.6931471824645996f;
        _171 = (((_152 * (DynamicRangeConversionParam_000y)) - (_162 * (log2(_153)))) + (_162 * (log2(((_144 / _152) - (DynamicRangeConversionParam_000w))))));
      }
      float _173 = (_149 / _150) * _171;
      float _177 = (((1.0f - _149) - _150) / _150) * _171;
      float _180 = mad(-0.2533999979496002f, _177, (mad(-0.35569998621940613f, _171, (_173 * 1.7166999578475952f))));
      float _183 = mad(0.015799999237060547f, _177, (mad(1.6165000200271606f, _171, (_173 * -0.666700005531311f))));
      float _186 = mad(0.9420999884605408f, _177, (mad(-0.04280000180006027f, _171, (_173 * 0.01759999990463257f))));
      float _190 = _180 * -0.32673269510269165f;
      _196 = (mad(-0.32673269510269165f, _186, (mad(-0.32673269510269165f, _183, (_180 * 1.6534652709960938f)))));
      _197 = (mad(-0.32673269510269165f, _186, (mad(1.6534652709960938f, _183, _190))));
      _198 = (mad(1.6534652709960938f, _186, (mad(-0.32673269510269165f, _183, _190))));
    } while (false);
  }

  SV_Target.x = (saturate(_196));
  SV_Target.y = (saturate(_197));
  SV_Target.z = (saturate(_198));
  SV_Target.w = 1.0f;

  float3 sdr = SV_Target.rgb;

  SV_Target.rgb = untonemapped;

  // SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped);
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(untonemapped);

  return SV_Target;
}
