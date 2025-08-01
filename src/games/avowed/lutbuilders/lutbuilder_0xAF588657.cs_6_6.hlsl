#include "../common.hlsl"

RWTexture3D<float4> RWOutputTexture : register(u0);

cbuffer _RootShaderParameters : register(b0) {
  float4 LUTWeights[2] : packoffset(c005.x);
  float4 ACESMinMaxData : packoffset(c008.x);
  float4 ACESMidData : packoffset(c009.x);
  float4 ACESCoefsLow_0 : packoffset(c010.x);
  float4 ACESCoefsHigh_0 : packoffset(c011.x);
  float ACESCoefsLow_4 : packoffset(c012.x);
  float ACESCoefsHigh_4 : packoffset(c012.y);
  float ACESSceneColorMultiplier : packoffset(c012.z);
  float4 OverlayColor : packoffset(c013.x);
  float3 ColorScale : packoffset(c014.x);
  float4 ColorSaturation : packoffset(c015.x);
  float4 ColorContrast : packoffset(c016.x);
  float4 ColorGamma : packoffset(c017.x);
  float4 ColorGain : packoffset(c018.x);
  float4 ColorOffset : packoffset(c019.x);
  float4 ColorSaturationShadows : packoffset(c020.x);
  float4 ColorContrastShadows : packoffset(c021.x);
  float4 ColorGammaShadows : packoffset(c022.x);
  float4 ColorGainShadows : packoffset(c023.x);
  float4 ColorOffsetShadows : packoffset(c024.x);
  float4 ColorSaturationMidtones : packoffset(c025.x);
  float4 ColorContrastMidtones : packoffset(c026.x);
  float4 ColorGammaMidtones : packoffset(c027.x);
  float4 ColorGainMidtones : packoffset(c028.x);
  float4 ColorOffsetMidtones : packoffset(c029.x);
  float4 ColorSaturationHighlights : packoffset(c030.x);
  float4 ColorContrastHighlights : packoffset(c031.x);
  float4 ColorGammaHighlights : packoffset(c032.x);
  float4 ColorGainHighlights : packoffset(c033.x);
  float4 ColorOffsetHighlights : packoffset(c034.x);
  float LUTSize : packoffset(c035.x);
  float WhiteTemp : packoffset(c035.y);
  float WhiteTint : packoffset(c035.z);
  float ColorCorrectionShadowsMax : packoffset(c035.w);
  float ColorCorrectionHighlightsMin : packoffset(c036.x);
  float ColorCorrectionHighlightsMax : packoffset(c036.y);
  float BlueCorrection : packoffset(c036.z);
  float ExpandGamut : packoffset(c036.w);
  float ToneCurveAmount : packoffset(c037.x);
  float FilmSlope : packoffset(c037.y);
  float FilmToe : packoffset(c037.z);
  float FilmShoulder : packoffset(c037.w);
  float FilmBlackClip : packoffset(c038.x);
  float FilmWhiteClip : packoffset(c038.y);
  uint bUseMobileTonemapper : packoffset(c038.z);
  uint bIsTemperatureWhiteBalance : packoffset(c038.w);
  float3 MappingPolynomial : packoffset(c039.x);
  float3 InverseGamma : packoffset(c040.x);
  uint OutputDevice : packoffset(c040.w);
  uint OutputGamut : packoffset(c041.x);
  float OutputMaxLuminance : packoffset(c041.y);
  float2 OutputExtentInverse : packoffset(c042.x);
};

cbuffer UniformBufferConstants_WorkingColorSpace : register(b1) {
  float4 WorkingColorSpace_ToXYZ[4] : packoffset(c000.x);
  float4 WorkingColorSpace_FromXYZ[4] : packoffset(c004.x);
  float4 WorkingColorSpace_ToAP1[4] : packoffset(c008.x);
  float4 WorkingColorSpace_FromAP1[4] : packoffset(c012.x);
  float4 WorkingColorSpace_ToAP0[4] : packoffset(c016.x);
  uint WorkingColorSpace_bIsSRGB : packoffset(c020.x);
};

[numthreads(8, 8, 8)]
void main(
    uint3 SV_DispatchThreadID: SV_DispatchThreadID,
    uint3 SV_GroupID: SV_GroupID,
    uint3 SV_GroupThreadID: SV_GroupThreadID,
    uint SV_GroupIndex: SV_GroupIndex) {
  float _9[6];
  float _10[6];
  float _11[6];
  float _12[6];
  float _24 = 0.5f / LUTSize;
  float _29 = LUTSize + -1.0f;
  float _30 = (LUTSize * ((OutputExtentInverse.x * (float((uint)SV_DispatchThreadID.x) + 0.5f)) - _24)) / _29;
  float _31 = (LUTSize * ((OutputExtentInverse.y * (float((uint)SV_DispatchThreadID.y) + 0.5f)) - _24)) / _29;
  float _33 = float((uint)SV_DispatchThreadID.z) / _29;
  float _53;
  float _54;
  float _55;
  float _56;
  float _57;
  float _58;
  float _59;
  float _60;
  float _61;
  float _119;
  float _120;
  float _121;
  float _169;
  float _897;
  float _930;
  float _944;
  float _1008;
  float _1276;
  float _1277;
  float _1278;
  float _1289;
  float _1300;
  float _1480;
  float _1513;
  float _1527;
  float _1566;
  float _1676;
  float _1750;
  float _1824;
  float _1903;
  float _1904;
  float _1905;
  float _2054;
  float _2087;
  float _2101;
  float _2140;
  float _2250;
  float _2324;
  float _2398;
  float _2477;
  float _2478;
  float _2479;
  float _2656;
  float _2657;
  float _2658;
  if (!((uint)(OutputGamut) == 1)) {
    if (!((uint)(OutputGamut) == 2)) {
      if (!((uint)(OutputGamut) == 3)) {
        bool _42 = ((uint)(OutputGamut) == 4);
        _53 = select(_42, 1.0f, 1.705051064491272f);
        _54 = select(_42, 0.0f, -0.6217921376228333f);
        _55 = select(_42, 0.0f, -0.0832589864730835f);
        _56 = select(_42, 0.0f, -0.13025647401809692f);
        _57 = select(_42, 1.0f, 1.140804648399353f);
        _58 = select(_42, 0.0f, -0.010548308491706848f);
        _59 = select(_42, 0.0f, -0.024003351107239723f);
        _60 = select(_42, 0.0f, -0.1289689838886261f);
        _61 = select(_42, 1.0f, 1.1529725790023804f);
      } else {
        _53 = 0.6954522132873535f;
        _54 = 0.14067870378494263f;
        _55 = 0.16386906802654266f;
        _56 = 0.044794563204050064f;
        _57 = 0.8596711158752441f;
        _58 = 0.0955343171954155f;
        _59 = -0.005525882821530104f;
        _60 = 0.004025210160762072f;
        _61 = 1.0015007257461548f;
      }
    } else {
      _53 = 1.0258246660232544f;
      _54 = -0.020053181797266006f;
      _55 = -0.005771636962890625f;
      _56 = -0.002234415616840124f;
      _57 = 1.0045864582061768f;
      _58 = -0.002352118492126465f;
      _59 = -0.005013350863009691f;
      _60 = -0.025290070101618767f;
      _61 = 1.0303035974502563f;
    }
  } else {
    _53 = 1.3792141675949097f;
    _54 = -0.30886411666870117f;
    _55 = -0.0703500509262085f;
    _56 = -0.06933490186929703f;
    _57 = 1.08229660987854f;
    _58 = -0.012961871922016144f;
    _59 = -0.0021590073592960835f;
    _60 = -0.0454593189060688f;
    _61 = 1.0476183891296387f;
  }
  if ((uint)(uint)(OutputDevice) > (uint)2) {
    float _72 = (pow(_30, 0.012683313339948654f));
    float _73 = (pow(_31, 0.012683313339948654f));
    float _74 = (pow(_33, 0.012683313339948654f));
    _119 = (exp2(log2(max(0.0f, (_72 + -0.8359375f)) / (18.8515625f - (_72 * 18.6875f))) * 6.277394771575928f) * 100.0f);
    _120 = (exp2(log2(max(0.0f, (_73 + -0.8359375f)) / (18.8515625f - (_73 * 18.6875f))) * 6.277394771575928f) * 100.0f);
    _121 = (exp2(log2(max(0.0f, (_74 + -0.8359375f)) / (18.8515625f - (_74 * 18.6875f))) * 6.277394771575928f) * 100.0f);
  } else {
    _119 = ((exp2((_30 + -0.4340175986289978f) * 14.0f) * 0.18000000715255737f) + -0.002667719265446067f);
    _120 = ((exp2((_31 + -0.4340175986289978f) * 14.0f) * 0.18000000715255737f) + -0.002667719265446067f);
    _121 = ((exp2((_33 + -0.4340175986289978f) * 14.0f) * 0.18000000715255737f) + -0.002667719265446067f);
  }
  bool _148 = ((uint)(bIsTemperatureWhiteBalance) != 0);
  float _152 = 0.9994439482688904f / WhiteTemp;
  if (!(!((WhiteTemp * 1.0005563497543335f) <= 7000.0f))) {
    _169 = (((((2967800.0f - (_152 * 4607000064.0f)) * _152) + 99.11000061035156f) * _152) + 0.24406300485134125f);
  } else {
    _169 = (((((1901800.0f - (_152 * 2006400000.0f)) * _152) + 247.47999572753906f) * _152) + 0.23703999817371368f);
  }
  float _183 = ((((WhiteTemp * 1.2864121856637212e-07f) + 0.00015411825734190643f) * WhiteTemp) + 0.8601177334785461f) / ((((WhiteTemp * 7.081451371959702e-07f) + 0.0008424202096648514f) * WhiteTemp) + 1.0f);
  float _190 = WhiteTemp * WhiteTemp;
  float _193 = ((((WhiteTemp * 4.204816761443908e-08f) + 4.228062607580796e-05f) * WhiteTemp) + 0.31739872694015503f) / ((1.0f - (WhiteTemp * 2.8974181986995973e-05f)) + (_190 * 1.6145605741257896e-07f));
  float _198 = ((_183 * 2.0f) + 4.0f) - (_193 * 8.0f);
  float _199 = (_183 * 3.0f) / _198;
  float _201 = (_193 * 2.0f) / _198;
  bool _202 = (WhiteTemp < 4000.0f);
  float _211 = ((WhiteTemp + 1189.6199951171875f) * WhiteTemp) + 1412139.875f;
  float _213 = ((-1137581184.0f - (WhiteTemp * 1916156.25f)) - (_190 * 1.5317699909210205f)) / (_211 * _211);
  float _220 = (6193636.0f - (WhiteTemp * 179.45599365234375f)) + _190;
  float _222 = ((1974715392.0f - (WhiteTemp * 705674.0f)) - (_190 * 308.60699462890625f)) / (_220 * _220);
  float _224 = rsqrt(dot(float2(_213, _222), float2(_213, _222)));
  float _225 = WhiteTint * 0.05000000074505806f;
  float _228 = ((_225 * _222) * _224) + _183;
  float _231 = _193 - ((_225 * _213) * _224);
  float _236 = (4.0f - (_231 * 8.0f)) + (_228 * 2.0f);
  float _242 = (((_228 * 3.0f) / _236) - _199) + select(_202, _199, _169);
  float _243 = (((_231 * 2.0f) / _236) - _201) + select(_202, _201, (((_169 * 2.869999885559082f) + -0.2750000059604645f) - ((_169 * _169) * 3.0f)));
  float _244 = select(_148, _242, 0.3127000033855438f);
  float _245 = select(_148, _243, 0.32899999618530273f);
  float _246 = select(_148, 0.3127000033855438f, _242);
  float _247 = select(_148, 0.32899999618530273f, _243);
  float _248 = max(_245, 1.000000013351432e-10f);
  float _249 = _244 / _248;
  float _252 = ((1.0f - _244) - _245) / _248;
  float _253 = max(_247, 1.000000013351432e-10f);
  float _254 = _246 / _253;
  float _257 = ((1.0f - _246) - _247) / _253;
  float _276 = mad(-0.16140000522136688f, _257, ((_254 * 0.8950999975204468f) + 0.266400009393692f)) / mad(-0.16140000522136688f, _252, ((_249 * 0.8950999975204468f) + 0.266400009393692f));
  float _277 = mad(0.03669999912381172f, _257, (1.7135000228881836f - (_254 * 0.7501999735832214f))) / mad(0.03669999912381172f, _252, (1.7135000228881836f - (_249 * 0.7501999735832214f)));
  float _278 = mad(1.0296000242233276f, _257, ((_254 * 0.03889999911189079f) + -0.06849999725818634f)) / mad(1.0296000242233276f, _252, ((_249 * 0.03889999911189079f) + -0.06849999725818634f));
  float _279 = mad(_277, -0.7501999735832214f, 0.0f);
  float _280 = mad(_277, 1.7135000228881836f, 0.0f);
  float _281 = mad(_277, 0.03669999912381172f, -0.0f);
  float _282 = mad(_278, 0.03889999911189079f, 0.0f);
  float _283 = mad(_278, -0.06849999725818634f, 0.0f);
  float _284 = mad(_278, 1.0296000242233276f, 0.0f);
  float _287 = mad(0.1599626988172531f, _282, mad(-0.1470542997121811f, _279, (_276 * 0.883457362651825f)));
  float _290 = mad(0.1599626988172531f, _283, mad(-0.1470542997121811f, _280, (_276 * 0.26293492317199707f)));
  float _293 = mad(0.1599626988172531f, _284, mad(-0.1470542997121811f, _281, (_276 * -0.15930065512657166f)));
  float _296 = mad(0.04929120093584061f, _282, mad(0.5183603167533875f, _279, (_276 * 0.38695648312568665f)));
  float _299 = mad(0.04929120093584061f, _283, mad(0.5183603167533875f, _280, (_276 * 0.11516613513231277f)));
  float _302 = mad(0.04929120093584061f, _284, mad(0.5183603167533875f, _281, (_276 * -0.0697740763425827f)));
  float _305 = mad(0.9684867262840271f, _282, mad(0.04004279896616936f, _279, (_276 * -0.007634039502590895f)));
  float _308 = mad(0.9684867262840271f, _283, mad(0.04004279896616936f, _280, (_276 * -0.0022720457054674625f)));
  float _311 = mad(0.9684867262840271f, _284, mad(0.04004279896616936f, _281, (_276 * 0.0013765322510153055f)));
  float _314 = mad(_293, (WorkingColorSpace_ToXYZ[2].x), mad(_290, (WorkingColorSpace_ToXYZ[1].x), (_287 * (WorkingColorSpace_ToXYZ[0].x))));
  float _317 = mad(_293, (WorkingColorSpace_ToXYZ[2].y), mad(_290, (WorkingColorSpace_ToXYZ[1].y), (_287 * (WorkingColorSpace_ToXYZ[0].y))));
  float _320 = mad(_293, (WorkingColorSpace_ToXYZ[2].z), mad(_290, (WorkingColorSpace_ToXYZ[1].z), (_287 * (WorkingColorSpace_ToXYZ[0].z))));
  float _323 = mad(_302, (WorkingColorSpace_ToXYZ[2].x), mad(_299, (WorkingColorSpace_ToXYZ[1].x), (_296 * (WorkingColorSpace_ToXYZ[0].x))));
  float _326 = mad(_302, (WorkingColorSpace_ToXYZ[2].y), mad(_299, (WorkingColorSpace_ToXYZ[1].y), (_296 * (WorkingColorSpace_ToXYZ[0].y))));
  float _329 = mad(_302, (WorkingColorSpace_ToXYZ[2].z), mad(_299, (WorkingColorSpace_ToXYZ[1].z), (_296 * (WorkingColorSpace_ToXYZ[0].z))));
  float _332 = mad(_311, (WorkingColorSpace_ToXYZ[2].x), mad(_308, (WorkingColorSpace_ToXYZ[1].x), (_305 * (WorkingColorSpace_ToXYZ[0].x))));
  float _335 = mad(_311, (WorkingColorSpace_ToXYZ[2].y), mad(_308, (WorkingColorSpace_ToXYZ[1].y), (_305 * (WorkingColorSpace_ToXYZ[0].y))));
  float _338 = mad(_311, (WorkingColorSpace_ToXYZ[2].z), mad(_308, (WorkingColorSpace_ToXYZ[1].z), (_305 * (WorkingColorSpace_ToXYZ[0].z))));
  float _368 = mad(mad((WorkingColorSpace_FromXYZ[0].z), _338, mad((WorkingColorSpace_FromXYZ[0].y), _329, (_320 * (WorkingColorSpace_FromXYZ[0].x)))), _121, mad(mad((WorkingColorSpace_FromXYZ[0].z), _335, mad((WorkingColorSpace_FromXYZ[0].y), _326, (_317 * (WorkingColorSpace_FromXYZ[0].x)))), _120, (mad((WorkingColorSpace_FromXYZ[0].z), _332, mad((WorkingColorSpace_FromXYZ[0].y), _323, (_314 * (WorkingColorSpace_FromXYZ[0].x)))) * _119)));
  float _371 = mad(mad((WorkingColorSpace_FromXYZ[1].z), _338, mad((WorkingColorSpace_FromXYZ[1].y), _329, (_320 * (WorkingColorSpace_FromXYZ[1].x)))), _121, mad(mad((WorkingColorSpace_FromXYZ[1].z), _335, mad((WorkingColorSpace_FromXYZ[1].y), _326, (_317 * (WorkingColorSpace_FromXYZ[1].x)))), _120, (mad((WorkingColorSpace_FromXYZ[1].z), _332, mad((WorkingColorSpace_FromXYZ[1].y), _323, (_314 * (WorkingColorSpace_FromXYZ[1].x)))) * _119)));
  float _374 = mad(mad((WorkingColorSpace_FromXYZ[2].z), _338, mad((WorkingColorSpace_FromXYZ[2].y), _329, (_320 * (WorkingColorSpace_FromXYZ[2].x)))), _121, mad(mad((WorkingColorSpace_FromXYZ[2].z), _335, mad((WorkingColorSpace_FromXYZ[2].y), _326, (_317 * (WorkingColorSpace_FromXYZ[2].x)))), _120, (mad((WorkingColorSpace_FromXYZ[2].z), _332, mad((WorkingColorSpace_FromXYZ[2].y), _323, (_314 * (WorkingColorSpace_FromXYZ[2].x)))) * _119)));
  float _389 = mad((WorkingColorSpace_ToAP1[0].z), _374, mad((WorkingColorSpace_ToAP1[0].y), _371, ((WorkingColorSpace_ToAP1[0].x) * _368)));
  float _392 = mad((WorkingColorSpace_ToAP1[1].z), _374, mad((WorkingColorSpace_ToAP1[1].y), _371, ((WorkingColorSpace_ToAP1[1].x) * _368)));
  float _395 = mad((WorkingColorSpace_ToAP1[2].z), _374, mad((WorkingColorSpace_ToAP1[2].y), _371, ((WorkingColorSpace_ToAP1[2].x) * _368)));
  float _396 = dot(float3(_389, _392, _395), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));

  SetUngradedAP1(float3(_389, _392, _395));

  float _400 = (_389 / _396) + -1.0f;
  float _401 = (_392 / _396) + -1.0f;
  float _402 = (_395 / _396) + -1.0f;
  float _414 = (1.0f - exp2(((_396 * _396) * -4.0f) * ExpandGamut)) * (1.0f - exp2(dot(float3(_400, _401, _402), float3(_400, _401, _402)) * -4.0f));
  float _430 = ((mad(-0.06368321925401688f, _395, mad(-0.3292922377586365f, _392, (_389 * 1.3704125881195068f))) - _389) * _414) + _389;
  float _431 = ((mad(-0.010861365124583244f, _395, mad(1.0970927476882935f, _392, (_389 * -0.08343357592821121f))) - _392) * _414) + _392;
  float _432 = ((mad(1.2036951780319214f, _395, mad(-0.09862580895423889f, _392, (_389 * -0.02579331398010254f))) - _395) * _414) + _395;
  float _433 = dot(float3(_430, _431, _432), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));
  float _447 = ColorOffset.w + ColorOffsetShadows.w;
  float _461 = ColorGain.w * ColorGainShadows.w;
  float _475 = ColorGamma.w * ColorGammaShadows.w;
  float _489 = ColorContrast.w * ColorContrastShadows.w;
  float _503 = ColorSaturation.w * ColorSaturationShadows.w;
  float _507 = _430 - _433;
  float _508 = _431 - _433;
  float _509 = _432 - _433;
  float _566 = saturate(_433 / ColorCorrectionShadowsMax);
  float _570 = (_566 * _566) * (3.0f - (_566 * 2.0f));
  float _571 = 1.0f - _570;
  float _580 = ColorOffset.w + ColorOffsetHighlights.w;
  float _589 = ColorGain.w * ColorGainHighlights.w;
  float _598 = ColorGamma.w * ColorGammaHighlights.w;
  float _607 = ColorContrast.w * ColorContrastHighlights.w;
  float _616 = ColorSaturation.w * ColorSaturationHighlights.w;
  float _679 = saturate((_433 - ColorCorrectionHighlightsMin) / (ColorCorrectionHighlightsMax - ColorCorrectionHighlightsMin));
  float _683 = (_679 * _679) * (3.0f - (_679 * 2.0f));
  float _692 = ColorOffset.w + ColorOffsetMidtones.w;
  float _701 = ColorGain.w * ColorGainMidtones.w;
  float _710 = ColorGamma.w * ColorGammaMidtones.w;
  float _719 = ColorContrast.w * ColorContrastMidtones.w;
  float _728 = ColorSaturation.w * ColorSaturationMidtones.w;
  float _786 = _570 - _683;
  float _797 = ((_683 * (((ColorOffset.x + ColorOffsetHighlights.x) + _580) + (((ColorGain.x * ColorGainHighlights.x) * _589) * exp2(log2(exp2(((ColorContrast.x * ColorContrastHighlights.x) * _607) * log2(max(0.0f, ((((ColorSaturation.x * ColorSaturationHighlights.x) * _616) * _507) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.x * ColorGammaHighlights.x) * _598)))))) + (_571 * (((ColorOffset.x + ColorOffsetShadows.x) + _447) + (((ColorGain.x * ColorGainShadows.x) * _461) * exp2(log2(exp2(((ColorContrast.x * ColorContrastShadows.x) * _489) * log2(max(0.0f, ((((ColorSaturation.x * ColorSaturationShadows.x) * _503) * _507) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.x * ColorGammaShadows.x) * _475))))))) + ((((ColorOffset.x + ColorOffsetMidtones.x) + _692) + (((ColorGain.x * ColorGainMidtones.x) * _701) * exp2(log2(exp2(((ColorContrast.x * ColorContrastMidtones.x) * _719) * log2(max(0.0f, ((((ColorSaturation.x * ColorSaturationMidtones.x) * _728) * _507) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.x * ColorGammaMidtones.x) * _710))))) * _786);
  float _799 = ((_683 * (((ColorOffset.y + ColorOffsetHighlights.y) + _580) + (((ColorGain.y * ColorGainHighlights.y) * _589) * exp2(log2(exp2(((ColorContrast.y * ColorContrastHighlights.y) * _607) * log2(max(0.0f, ((((ColorSaturation.y * ColorSaturationHighlights.y) * _616) * _508) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.y * ColorGammaHighlights.y) * _598)))))) + (_571 * (((ColorOffset.y + ColorOffsetShadows.y) + _447) + (((ColorGain.y * ColorGainShadows.y) * _461) * exp2(log2(exp2(((ColorContrast.y * ColorContrastShadows.y) * _489) * log2(max(0.0f, ((((ColorSaturation.y * ColorSaturationShadows.y) * _503) * _508) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.y * ColorGammaShadows.y) * _475))))))) + ((((ColorOffset.y + ColorOffsetMidtones.y) + _692) + (((ColorGain.y * ColorGainMidtones.y) * _701) * exp2(log2(exp2(((ColorContrast.y * ColorContrastMidtones.y) * _719) * log2(max(0.0f, ((((ColorSaturation.y * ColorSaturationMidtones.y) * _728) * _508) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.y * ColorGammaMidtones.y) * _710))))) * _786);
  float _801 = ((_683 * (((ColorOffset.z + ColorOffsetHighlights.z) + _580) + (((ColorGain.z * ColorGainHighlights.z) * _589) * exp2(log2(exp2(((ColorContrast.z * ColorContrastHighlights.z) * _607) * log2(max(0.0f, ((((ColorSaturation.z * ColorSaturationHighlights.z) * _616) * _509) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.z * ColorGammaHighlights.z) * _598)))))) + (_571 * (((ColorOffset.z + ColorOffsetShadows.z) + _447) + (((ColorGain.z * ColorGainShadows.z) * _461) * exp2(log2(exp2(((ColorContrast.z * ColorContrastShadows.z) * _489) * log2(max(0.0f, ((((ColorSaturation.z * ColorSaturationShadows.z) * _503) * _509) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.z * ColorGammaShadows.z) * _475))))))) + ((((ColorOffset.z + ColorOffsetMidtones.z) + _692) + (((ColorGain.z * ColorGainMidtones.z) * _701) * exp2(log2(exp2(((ColorContrast.z * ColorContrastMidtones.z) * _719) * log2(max(0.0f, ((((ColorSaturation.z * ColorSaturationMidtones.z) * _728) * _509) + _433)) * 5.55555534362793f)) * 0.18000000715255737f) * (1.0f / ((ColorGamma.z * ColorGammaMidtones.z) * _710))))) * _786);

  SetUntonemappedAP1(float3(_797, _799, _801));

  float _837 = ((mad(0.061360642313957214f, _801, mad(-4.540197551250458e-09f, _799, (_797 * 0.9386394023895264f))) - _797) * BlueCorrection) + _797;
  float _838 = ((mad(0.169205904006958f, _801, mad(0.8307942152023315f, _799, (_797 * 6.775371730327606e-08f))) - _799) * BlueCorrection) + _799;
  float _839 = (mad(-2.3283064365386963e-10f, _799, (_797 * -9.313225746154785e-10f)) * BlueCorrection) + _801;
  float _842 = mad(0.16386905312538147f, _839, mad(0.14067868888378143f, _838, (_837 * 0.6954522132873535f)));
  float _845 = mad(0.0955343246459961f, _839, mad(0.8596711158752441f, _838, (_837 * 0.044794581830501556f)));
  float _848 = mad(1.0015007257461548f, _839, mad(0.004025210160762072f, _838, (_837 * -0.005525882821530104f)));
  float _852 = max(max(_842, _845), _848);
  float _857 = (max(_852, 1.000000013351432e-10f) - max(min(min(_842, _845), _848), 1.000000013351432e-10f)) / max(_852, 0.009999999776482582f);
  float _870 = ((_845 + _842) + _848) + (sqrt((((_848 - _845) * _848) + ((_845 - _842) * _845)) + ((_842 - _848) * _842)) * 1.75f);
  float _871 = _870 * 0.3333333432674408f;
  float _872 = _857 + -0.4000000059604645f;
  float _873 = _872 * 5.0f;
  float _877 = max((1.0f - abs(_872 * 2.5f)), 0.0f);
  float _888 = ((float(((int)(uint)((bool)(_873 > 0.0f))) - ((int)(uint)((bool)(_873 < 0.0f)))) * (1.0f - (_877 * _877))) + 1.0f) * 0.02500000037252903f;
  if (!(_871 <= 0.0533333346247673f)) {
    if (!(_871 >= 0.1599999964237213f)) {
      _897 = (((0.23999999463558197f / _870) + -0.5f) * _888);
    } else {
      _897 = 0.0f;
    }
  } else {
    _897 = _888;
  }
  float _898 = _897 + 1.0f;
  float _899 = _898 * _842;
  float _900 = _898 * _845;
  float _901 = _898 * _848;
  if (!((bool)(_899 == _900) && (bool)(_900 == _901))) {
    float _908 = ((_899 * 2.0f) - _900) - _901;
    float _911 = ((_845 - _848) * 1.7320507764816284f) * _898;
    float _913 = atan(_911 / _908);
    bool _916 = (_908 < 0.0f);
    bool _917 = (_908 == 0.0f);
    bool _918 = (_911 >= 0.0f);
    bool _919 = (_911 < 0.0f);
    _930 = select((_918 && _917), 90.0f, select((_919 && _917), -90.0f, (select((_919 && _916), (_913 + -3.1415927410125732f), select((_918 && _916), (_913 + 3.1415927410125732f), _913)) * 57.2957763671875f)));
  } else {
    _930 = 0.0f;
  }
  float _935 = min(max(select((_930 < 0.0f), (_930 + 360.0f), _930), 0.0f), 360.0f);
  if (_935 < -180.0f) {
    _944 = (_935 + 360.0f);
  } else {
    if (_935 > 180.0f) {
      _944 = (_935 + -360.0f);
    } else {
      _944 = _935;
    }
  }
  float _948 = saturate(1.0f - abs(_944 * 0.014814814552664757f));
  float _952 = (_948 * _948) * (3.0f - (_948 * 2.0f));
  float _958 = ((_952 * _952) * ((_857 * 0.18000000715255737f) * (0.029999999329447746f - _899))) + _899;
  float _968 = max(0.0f, mad(-0.21492856740951538f, _901, mad(-0.2365107536315918f, _900, (_958 * 1.4514392614364624f))));
  float _969 = max(0.0f, mad(-0.09967592358589172f, _901, mad(1.17622971534729f, _900, (_958 * -0.07655377686023712f))));
  float _970 = max(0.0f, mad(0.9977163076400757f, _901, mad(-0.006032449658960104f, _900, (_958 * 0.008316148072481155f))));
  float _971 = dot(float3(_968, _969, _970), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));
  float _986 = (FilmBlackClip + 1.0f) - FilmToe;
  float _988 = FilmWhiteClip + 1.0f;
  float _990 = _988 - FilmShoulder;
  if (FilmToe > 0.800000011920929f) {
    _1008 = (((0.8199999928474426f - FilmToe) / FilmSlope) + -0.7447274923324585f);
  } else {
    float _999 = (FilmBlackClip + 0.18000000715255737f) / _986;
    _1008 = (-0.7447274923324585f - ((log2(_999 / (2.0f - _999)) * 0.3465735912322998f) * (_986 / FilmSlope)));
  }
  float _1011 = ((1.0f - FilmToe) / FilmSlope) - _1008;
  float _1013 = (FilmShoulder / FilmSlope) - _1011;
  float _1017 = log2(lerp(_971, _968, 0.9599999785423279f)) * 0.3010300099849701f;
  float _1018 = log2(lerp(_971, _969, 0.9599999785423279f)) * 0.3010300099849701f;
  float _1019 = log2(lerp(_971, _970, 0.9599999785423279f)) * 0.3010300099849701f;
  float _1023 = FilmSlope * (_1017 + _1011);
  float _1024 = FilmSlope * (_1018 + _1011);
  float _1025 = FilmSlope * (_1019 + _1011);
  float _1026 = _986 * 2.0f;
  float _1028 = (FilmSlope * -2.0f) / _986;
  float _1029 = _1017 - _1008;
  float _1030 = _1018 - _1008;
  float _1031 = _1019 - _1008;
  float _1050 = _990 * 2.0f;
  float _1052 = (FilmSlope * 2.0f) / _990;
  float _1077 = select((_1017 < _1008), ((_1026 / (exp2((_1029 * 1.4426950216293335f) * _1028) + 1.0f)) - FilmBlackClip), _1023);
  float _1078 = select((_1018 < _1008), ((_1026 / (exp2((_1030 * 1.4426950216293335f) * _1028) + 1.0f)) - FilmBlackClip), _1024);
  float _1079 = select((_1019 < _1008), ((_1026 / (exp2((_1031 * 1.4426950216293335f) * _1028) + 1.0f)) - FilmBlackClip), _1025);
  float _1086 = _1013 - _1008;
  float _1090 = saturate(_1029 / _1086);
  float _1091 = saturate(_1030 / _1086);
  float _1092 = saturate(_1031 / _1086);
  bool _1093 = (_1013 < _1008);
  float _1097 = select(_1093, (1.0f - _1090), _1090);
  float _1098 = select(_1093, (1.0f - _1091), _1091);
  float _1099 = select(_1093, (1.0f - _1092), _1092);
  float _1118 = (((_1097 * _1097) * (select((_1017 > _1013), (_988 - (_1050 / (exp2(((_1017 - _1013) * 1.4426950216293335f) * _1052) + 1.0f))), _1023) - _1077)) * (3.0f - (_1097 * 2.0f))) + _1077;
  float _1119 = (((_1098 * _1098) * (select((_1018 > _1013), (_988 - (_1050 / (exp2(((_1018 - _1013) * 1.4426950216293335f) * _1052) + 1.0f))), _1024) - _1078)) * (3.0f - (_1098 * 2.0f))) + _1078;
  float _1120 = (((_1099 * _1099) * (select((_1019 > _1013), (_988 - (_1050 / (exp2(((_1019 - _1013) * 1.4426950216293335f) * _1052) + 1.0f))), _1025) - _1079)) * (3.0f - (_1099 * 2.0f))) + _1079;
  float _1121 = dot(float3(_1118, _1119, _1120), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));
  float tonemapCurveAmount = ToneCurveAmount;
  if (RENODX_TONE_MAP_TYPE) {
    tonemapCurveAmount = tonemapCurveAmount - CUSTOM_TONE_MAP_CURVE;
  }
  float _1141 = (tonemapCurveAmount * (max(0.0f, (lerp(_1121, _1118, 0.9300000071525574f))) - _837)) + _837;
  float _1142 = (tonemapCurveAmount * (max(0.0f, (lerp(_1121, _1119, 0.9300000071525574f))) - _838)) + _838;
  float _1143 = (tonemapCurveAmount * (max(0.0f, (lerp(_1121, _1120, 0.9300000071525574f))) - _839)) + _839;
  float _1159 = ((mad(-0.06537103652954102f, _1143, mad(1.451815478503704e-06f, _1142, (_1141 * 1.065374732017517f))) - _1141) * BlueCorrection) + _1141;
  float _1160 = ((mad(-0.20366770029067993f, _1143, mad(1.2036634683609009f, _1142, (_1141 * -2.57161445915699e-07f))) - _1142) * BlueCorrection) + _1142;
  float _1161 = ((mad(0.9999996423721313f, _1143, mad(2.0954757928848267e-08f, _1142, (_1141 * 1.862645149230957e-08f))) - _1143) * BlueCorrection) + _1143;

  SetTonemappedAP1(_1159, _1160, _1161);

  float _1171 = max(0.0f, mad((WorkingColorSpace_FromAP1[0].z), _1161, mad((WorkingColorSpace_FromAP1[0].y), _1160, ((WorkingColorSpace_FromAP1[0].x) * _1159))));
  float _1172 = max(0.0f, mad((WorkingColorSpace_FromAP1[1].z), _1161, mad((WorkingColorSpace_FromAP1[1].y), _1160, ((WorkingColorSpace_FromAP1[1].x) * _1159))));
  float _1173 = max(0.0f, mad((WorkingColorSpace_FromAP1[2].z), _1161, mad((WorkingColorSpace_FromAP1[2].y), _1160, ((WorkingColorSpace_FromAP1[2].x) * _1159))));
  float _1199 = ColorScale.x * (((MappingPolynomial.y + (MappingPolynomial.x * _1171)) * _1171) + MappingPolynomial.z);
  float _1200 = ColorScale.y * (((MappingPolynomial.y + (MappingPolynomial.x * _1172)) * _1172) + MappingPolynomial.z);
  float _1201 = ColorScale.z * (((MappingPolynomial.y + (MappingPolynomial.x * _1173)) * _1173) + MappingPolynomial.z);
  float _1208 = ((OverlayColor.x - _1199) * OverlayColor.w) + _1199;
  float _1209 = ((OverlayColor.y - _1200) * OverlayColor.w) + _1200;
  float _1210 = ((OverlayColor.z - _1201) * OverlayColor.w) + _1201;
  float _1211 = ColorScale.x * mad((WorkingColorSpace_FromAP1[0].z), _801, mad((WorkingColorSpace_FromAP1[0].y), _799, (_797 * (WorkingColorSpace_FromAP1[0].x))));
  float _1212 = ColorScale.y * mad((WorkingColorSpace_FromAP1[1].z), _801, mad((WorkingColorSpace_FromAP1[1].y), _799, ((WorkingColorSpace_FromAP1[1].x) * _797)));
  float _1213 = ColorScale.z * mad((WorkingColorSpace_FromAP1[2].z), _801, mad((WorkingColorSpace_FromAP1[2].y), _799, ((WorkingColorSpace_FromAP1[2].x) * _797)));
  float _1220 = ((OverlayColor.x - _1211) * OverlayColor.w) + _1211;
  float _1221 = ((OverlayColor.y - _1212) * OverlayColor.w) + _1212;
  float _1222 = ((OverlayColor.z - _1213) * OverlayColor.w) + _1213;
  float _1234 = exp2(log2(max(0.0f, _1208)) * InverseGamma.y);
  float _1235 = exp2(log2(max(0.0f, _1209)) * InverseGamma.y);
  float _1236 = exp2(log2(max(0.0f, _1210)) * InverseGamma.y);

  if (true) {
    RWOutputTexture[int3((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y), (uint)(SV_DispatchThreadID.z))] =
        GenerateOutput(float3(_1234, _1235, _1236), OutputDevice);
    return;
  }

  [branch]
  if ((uint)(OutputDevice) == 0) {
    do {
      if ((uint)(WorkingColorSpace_bIsSRGB) == 0) {
        float _1259 = mad((WorkingColorSpace_ToAP1[0].z), _1236, mad((WorkingColorSpace_ToAP1[0].y), _1235, ((WorkingColorSpace_ToAP1[0].x) * _1234)));
        float _1262 = mad((WorkingColorSpace_ToAP1[1].z), _1236, mad((WorkingColorSpace_ToAP1[1].y), _1235, ((WorkingColorSpace_ToAP1[1].x) * _1234)));
        float _1265 = mad((WorkingColorSpace_ToAP1[2].z), _1236, mad((WorkingColorSpace_ToAP1[2].y), _1235, ((WorkingColorSpace_ToAP1[2].x) * _1234)));
        _1276 = mad(_55, _1265, mad(_54, _1262, (_1259 * _53)));
        _1277 = mad(_58, _1265, mad(_57, _1262, (_1259 * _56)));
        _1278 = mad(_61, _1265, mad(_60, _1262, (_1259 * _59)));
      } else {
        _1276 = _1234;
        _1277 = _1235;
        _1278 = _1236;
      }
      do {
        if (_1276 < 0.0031306699384003878f) {
          _1289 = (_1276 * 12.920000076293945f);
        } else {
          _1289 = (((pow(_1276, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
        }
        do {
          if (_1277 < 0.0031306699384003878f) {
            _1300 = (_1277 * 12.920000076293945f);
          } else {
            _1300 = (((pow(_1277, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
          }
          if (_1278 < 0.0031306699384003878f) {
            _2656 = _1289;
            _2657 = _1300;
            _2658 = (_1278 * 12.920000076293945f);
          } else {
            _2656 = _1289;
            _2657 = _1300;
            _2658 = (((pow(_1278, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
          }
        } while (false);
      } while (false);
    } while (false);
  } else {
    if ((uint)(OutputDevice) == 1) {
      float _1327 = mad((WorkingColorSpace_ToAP1[0].z), _1236, mad((WorkingColorSpace_ToAP1[0].y), _1235, ((WorkingColorSpace_ToAP1[0].x) * _1234)));
      float _1330 = mad((WorkingColorSpace_ToAP1[1].z), _1236, mad((WorkingColorSpace_ToAP1[1].y), _1235, ((WorkingColorSpace_ToAP1[1].x) * _1234)));
      float _1333 = mad((WorkingColorSpace_ToAP1[2].z), _1236, mad((WorkingColorSpace_ToAP1[2].y), _1235, ((WorkingColorSpace_ToAP1[2].x) * _1234)));
      float _1343 = max(6.103519990574569e-05f, mad(_55, _1333, mad(_54, _1330, (_1327 * _53))));
      float _1344 = max(6.103519990574569e-05f, mad(_58, _1333, mad(_57, _1330, (_1327 * _56))));
      float _1345 = max(6.103519990574569e-05f, mad(_61, _1333, mad(_60, _1330, (_1327 * _59))));
      _2656 = min((_1343 * 4.5f), ((exp2(log2(max(_1343, 0.017999999225139618f)) * 0.44999998807907104f) * 1.0989999771118164f) + -0.0989999994635582f));
      _2657 = min((_1344 * 4.5f), ((exp2(log2(max(_1344, 0.017999999225139618f)) * 0.44999998807907104f) * 1.0989999771118164f) + -0.0989999994635582f));
      _2658 = min((_1345 * 4.5f), ((exp2(log2(max(_1345, 0.017999999225139618f)) * 0.44999998807907104f) * 1.0989999771118164f) + -0.0989999994635582f));
    } else {
      if ((bool)((uint)(OutputDevice) == 3) || (bool)((uint)(OutputDevice) == 5)) {
        _11[0] = ACESCoefsLow_0.x;
        _11[1] = ACESCoefsLow_0.y;
        _11[2] = ACESCoefsLow_0.z;
        _11[3] = ACESCoefsLow_0.w;
        _11[4] = ACESCoefsLow_4;
        _11[5] = ACESCoefsLow_4;
        _12[0] = ACESCoefsHigh_0.x;
        _12[1] = ACESCoefsHigh_0.y;
        _12[2] = ACESCoefsHigh_0.z;
        _12[3] = ACESCoefsHigh_0.w;
        _12[4] = ACESCoefsHigh_4;
        _12[5] = ACESCoefsHigh_4;
        float _1420 = ACESSceneColorMultiplier * _1220;
        float _1421 = ACESSceneColorMultiplier * _1221;
        float _1422 = ACESSceneColorMultiplier * _1222;
        float _1425 = mad((WorkingColorSpace_ToAP0[0].z), _1422, mad((WorkingColorSpace_ToAP0[0].y), _1421, ((WorkingColorSpace_ToAP0[0].x) * _1420)));
        float _1428 = mad((WorkingColorSpace_ToAP0[1].z), _1422, mad((WorkingColorSpace_ToAP0[1].y), _1421, ((WorkingColorSpace_ToAP0[1].x) * _1420)));
        float _1431 = mad((WorkingColorSpace_ToAP0[2].z), _1422, mad((WorkingColorSpace_ToAP0[2].y), _1421, ((WorkingColorSpace_ToAP0[2].x) * _1420)));
        float _1435 = max(max(_1425, _1428), _1431);
        float _1440 = (max(_1435, 1.000000013351432e-10f) - max(min(min(_1425, _1428), _1431), 1.000000013351432e-10f)) / max(_1435, 0.009999999776482582f);
        float _1453 = ((_1428 + _1425) + _1431) + (sqrt((((_1431 - _1428) * _1431) + ((_1428 - _1425) * _1428)) + ((_1425 - _1431) * _1425)) * 1.75f);
        float _1454 = _1453 * 0.3333333432674408f;
        float _1455 = _1440 + -0.4000000059604645f;
        float _1456 = _1455 * 5.0f;
        float _1460 = max((1.0f - abs(_1455 * 2.5f)), 0.0f);
        float _1471 = ((float(((int)(uint)((bool)(_1456 > 0.0f))) - ((int)(uint)((bool)(_1456 < 0.0f)))) * (1.0f - (_1460 * _1460))) + 1.0f) * 0.02500000037252903f;
        do {
          if (!(_1454 <= 0.0533333346247673f)) {
            if (!(_1454 >= 0.1599999964237213f)) {
              _1480 = (((0.23999999463558197f / _1453) + -0.5f) * _1471);
            } else {
              _1480 = 0.0f;
            }
          } else {
            _1480 = _1471;
          }
          float _1481 = _1480 + 1.0f;
          float _1482 = _1481 * _1425;
          float _1483 = _1481 * _1428;
          float _1484 = _1481 * _1431;
          do {
            if (!((bool)(_1482 == _1483) && (bool)(_1483 == _1484))) {
              float _1491 = ((_1482 * 2.0f) - _1483) - _1484;
              float _1494 = ((_1428 - _1431) * 1.7320507764816284f) * _1481;
              float _1496 = atan(_1494 / _1491);
              bool _1499 = (_1491 < 0.0f);
              bool _1500 = (_1491 == 0.0f);
              bool _1501 = (_1494 >= 0.0f);
              bool _1502 = (_1494 < 0.0f);
              _1513 = select((_1501 && _1500), 90.0f, select((_1502 && _1500), -90.0f, (select((_1502 && _1499), (_1496 + -3.1415927410125732f), select((_1501 && _1499), (_1496 + 3.1415927410125732f), _1496)) * 57.2957763671875f)));
            } else {
              _1513 = 0.0f;
            }
            float _1518 = min(max(select((_1513 < 0.0f), (_1513 + 360.0f), _1513), 0.0f), 360.0f);
            do {
              if (_1518 < -180.0f) {
                _1527 = (_1518 + 360.0f);
              } else {
                if (_1518 > 180.0f) {
                  _1527 = (_1518 + -360.0f);
                } else {
                  _1527 = _1518;
                }
              }
              do {
                if ((bool)(_1527 > -67.5f) && (bool)(_1527 < 67.5f)) {
                  float _1533 = (_1527 + 67.5f) * 0.029629629105329514f;
                  int _1534 = int(_1533);
                  float _1536 = _1533 - float(_1534);
                  float _1537 = _1536 * _1536;
                  float _1538 = _1537 * _1536;
                  if (_1534 == 3) {
                    _1566 = (((0.1666666716337204f - (_1536 * 0.5f)) + (_1537 * 0.5f)) - (_1538 * 0.1666666716337204f));
                  } else {
                    if (_1534 == 2) {
                      _1566 = ((0.6666666865348816f - _1537) + (_1538 * 0.5f));
                    } else {
                      if (_1534 == 1) {
                        _1566 = (((_1538 * -0.5f) + 0.1666666716337204f) + ((_1537 + _1536) * 0.5f));
                      } else {
                        _1566 = select((_1534 == 0), (_1538 * 0.1666666716337204f), 0.0f);
                      }
                    }
                  }
                } else {
                  _1566 = 0.0f;
                }
                float _1575 = min(max(((((_1440 * 0.27000001072883606f) * (0.029999999329447746f - _1482)) * _1566) + _1482), 0.0f), 65535.0f);
                float _1576 = min(max(_1483, 0.0f), 65535.0f);
                float _1577 = min(max(_1484, 0.0f), 65535.0f);
                float _1590 = min(max(mad(-0.21492856740951538f, _1577, mad(-0.2365107536315918f, _1576, (_1575 * 1.4514392614364624f))), 0.0f), 65504.0f);
                float _1591 = min(max(mad(-0.09967592358589172f, _1577, mad(1.17622971534729f, _1576, (_1575 * -0.07655377686023712f))), 0.0f), 65504.0f);
                float _1592 = min(max(mad(0.9977163076400757f, _1577, mad(-0.006032449658960104f, _1576, (_1575 * 0.008316148072481155f))), 0.0f), 65504.0f);
                float _1593 = dot(float3(_1590, _1591, _1592), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));
                float _1604 = log2(max((lerp(_1593, _1590, 0.9599999785423279f)), 1.000000013351432e-10f));
                float _1605 = _1604 * 0.3010300099849701f;
                float _1606 = log2(ACESMinMaxData.x);
                float _1607 = _1606 * 0.3010300099849701f;
                do {
                  if (!(!(_1605 <= _1607))) {
                    _1676 = (log2(ACESMinMaxData.y) * 0.3010300099849701f);
                  } else {
                    float _1614 = log2(ACESMidData.x);
                    float _1615 = _1614 * 0.3010300099849701f;
                    if ((bool)(_1605 > _1607) && (bool)(_1605 < _1615)) {
                      float _1623 = ((_1604 - _1606) * 0.9030900001525879f) / ((_1614 - _1606) * 0.3010300099849701f);
                      int _1624 = int(_1623);
                      float _1626 = _1623 - float(_1624);
                      float _1628 = _11[_1624];
                      float _1631 = _11[(_1624 + 1)];
                      float _1636 = _1628 * 0.5f;
                      _1676 = dot(float3((_1626 * _1626), _1626, 1.0f), float3(mad((_11[(_1624 + 2)]), 0.5f, mad(_1631, -1.0f, _1636)), (_1631 - _1628), mad(_1631, 0.5f, _1636)));
                    } else {
                      do {
                        if (!(!(_1605 >= _1615))) {
                          float _1645 = log2(ACESMinMaxData.z);
                          if (_1605 < (_1645 * 0.3010300099849701f)) {
                            float _1653 = ((_1604 - _1614) * 0.9030900001525879f) / ((_1645 - _1614) * 0.3010300099849701f);
                            int _1654 = int(_1653);
                            float _1656 = _1653 - float(_1654);
                            float _1658 = _12[_1654];
                            float _1661 = _12[(_1654 + 1)];
                            float _1666 = _1658 * 0.5f;
                            _1676 = dot(float3((_1656 * _1656), _1656, 1.0f), float3(mad((_12[(_1654 + 2)]), 0.5f, mad(_1661, -1.0f, _1666)), (_1661 - _1658), mad(_1661, 0.5f, _1666)));
                            break;
                          }
                        }
                        _1676 = (log2(ACESMinMaxData.w) * 0.3010300099849701f);
                      } while (false);
                    }
                  }
                  float _1680 = log2(max((lerp(_1593, _1591, 0.9599999785423279f)), 1.000000013351432e-10f));
                  float _1681 = _1680 * 0.3010300099849701f;
                  do {
                    if (!(!(_1681 <= _1607))) {
                      _1750 = (log2(ACESMinMaxData.y) * 0.3010300099849701f);
                    } else {
                      float _1688 = log2(ACESMidData.x);
                      float _1689 = _1688 * 0.3010300099849701f;
                      if ((bool)(_1681 > _1607) && (bool)(_1681 < _1689)) {
                        float _1697 = ((_1680 - _1606) * 0.9030900001525879f) / ((_1688 - _1606) * 0.3010300099849701f);
                        int _1698 = int(_1697);
                        float _1700 = _1697 - float(_1698);
                        float _1702 = _11[_1698];
                        float _1705 = _11[(_1698 + 1)];
                        float _1710 = _1702 * 0.5f;
                        _1750 = dot(float3((_1700 * _1700), _1700, 1.0f), float3(mad((_11[(_1698 + 2)]), 0.5f, mad(_1705, -1.0f, _1710)), (_1705 - _1702), mad(_1705, 0.5f, _1710)));
                      } else {
                        do {
                          if (!(!(_1681 >= _1689))) {
                            float _1719 = log2(ACESMinMaxData.z);
                            if (_1681 < (_1719 * 0.3010300099849701f)) {
                              float _1727 = ((_1680 - _1688) * 0.9030900001525879f) / ((_1719 - _1688) * 0.3010300099849701f);
                              int _1728 = int(_1727);
                              float _1730 = _1727 - float(_1728);
                              float _1732 = _12[_1728];
                              float _1735 = _12[(_1728 + 1)];
                              float _1740 = _1732 * 0.5f;
                              _1750 = dot(float3((_1730 * _1730), _1730, 1.0f), float3(mad((_12[(_1728 + 2)]), 0.5f, mad(_1735, -1.0f, _1740)), (_1735 - _1732), mad(_1735, 0.5f, _1740)));
                              break;
                            }
                          }
                          _1750 = (log2(ACESMinMaxData.w) * 0.3010300099849701f);
                        } while (false);
                      }
                    }
                    float _1754 = log2(max((lerp(_1593, _1592, 0.9599999785423279f)), 1.000000013351432e-10f));
                    float _1755 = _1754 * 0.3010300099849701f;
                    do {
                      if (!(!(_1755 <= _1607))) {
                        _1824 = (log2(ACESMinMaxData.y) * 0.3010300099849701f);
                      } else {
                        float _1762 = log2(ACESMidData.x);
                        float _1763 = _1762 * 0.3010300099849701f;
                        if ((bool)(_1755 > _1607) && (bool)(_1755 < _1763)) {
                          float _1771 = ((_1754 - _1606) * 0.9030900001525879f) / ((_1762 - _1606) * 0.3010300099849701f);
                          int _1772 = int(_1771);
                          float _1774 = _1771 - float(_1772);
                          float _1776 = _11[_1772];
                          float _1779 = _11[(_1772 + 1)];
                          float _1784 = _1776 * 0.5f;
                          _1824 = dot(float3((_1774 * _1774), _1774, 1.0f), float3(mad((_11[(_1772 + 2)]), 0.5f, mad(_1779, -1.0f, _1784)), (_1779 - _1776), mad(_1779, 0.5f, _1784)));
                        } else {
                          do {
                            if (!(!(_1755 >= _1763))) {
                              float _1793 = log2(ACESMinMaxData.z);
                              if (_1755 < (_1793 * 0.3010300099849701f)) {
                                float _1801 = ((_1754 - _1762) * 0.9030900001525879f) / ((_1793 - _1762) * 0.3010300099849701f);
                                int _1802 = int(_1801);
                                float _1804 = _1801 - float(_1802);
                                float _1806 = _12[_1802];
                                float _1809 = _12[(_1802 + 1)];
                                float _1814 = _1806 * 0.5f;
                                _1824 = dot(float3((_1804 * _1804), _1804, 1.0f), float3(mad((_12[(_1802 + 2)]), 0.5f, mad(_1809, -1.0f, _1814)), (_1809 - _1806), mad(_1809, 0.5f, _1814)));
                                break;
                              }
                            }
                            _1824 = (log2(ACESMinMaxData.w) * 0.3010300099849701f);
                          } while (false);
                        }
                      }
                      float _1828 = ACESMinMaxData.w - ACESMinMaxData.y;
                      float _1829 = (exp2(_1676 * 3.321928024291992f) - ACESMinMaxData.y) / _1828;
                      float _1831 = (exp2(_1750 * 3.321928024291992f) - ACESMinMaxData.y) / _1828;
                      float _1833 = (exp2(_1824 * 3.321928024291992f) - ACESMinMaxData.y) / _1828;
                      float _1836 = mad(0.15618768334388733f, _1833, mad(0.13400420546531677f, _1831, (_1829 * 0.6624541878700256f)));
                      float _1839 = mad(0.053689517080783844f, _1833, mad(0.6740817427635193f, _1831, (_1829 * 0.2722287178039551f)));
                      float _1842 = mad(1.0103391408920288f, _1833, mad(0.00406073359772563f, _1831, (_1829 * -0.005574649665504694f)));
                      float _1855 = min(max(mad(-0.23642469942569733f, _1842, mad(-0.32480329275131226f, _1839, (_1836 * 1.6410233974456787f))), 0.0f), 1.0f);
                      float _1856 = min(max(mad(0.016756348311901093f, _1842, mad(1.6153316497802734f, _1839, (_1836 * -0.663662850856781f))), 0.0f), 1.0f);
                      float _1857 = min(max(mad(0.9883948564529419f, _1842, mad(-0.008284442126750946f, _1839, (_1836 * 0.011721894145011902f))), 0.0f), 1.0f);
                      float _1860 = mad(0.15618768334388733f, _1857, mad(0.13400420546531677f, _1856, (_1855 * 0.6624541878700256f)));
                      float _1863 = mad(0.053689517080783844f, _1857, mad(0.6740817427635193f, _1856, (_1855 * 0.2722287178039551f)));
                      float _1866 = mad(1.0103391408920288f, _1857, mad(0.00406073359772563f, _1856, (_1855 * -0.005574649665504694f)));
                      float _1888 = min(max((min(max(mad(-0.23642469942569733f, _1866, mad(-0.32480329275131226f, _1863, (_1860 * 1.6410233974456787f))), 0.0f), 65535.0f) * ACESMinMaxData.w), 0.0f), 65535.0f);
                      float _1889 = min(max((min(max(mad(0.016756348311901093f, _1866, mad(1.6153316497802734f, _1863, (_1860 * -0.663662850856781f))), 0.0f), 65535.0f) * ACESMinMaxData.w), 0.0f), 65535.0f);
                      float _1890 = min(max((min(max(mad(0.9883948564529419f, _1866, mad(-0.008284442126750946f, _1863, (_1860 * 0.011721894145011902f))), 0.0f), 65535.0f) * ACESMinMaxData.w), 0.0f), 65535.0f);
                      do {
                        if (!((uint)(OutputDevice) == 5)) {
                          _1903 = mad(_55, _1890, mad(_54, _1889, (_1888 * _53)));
                          _1904 = mad(_58, _1890, mad(_57, _1889, (_1888 * _56)));
                          _1905 = mad(_61, _1890, mad(_60, _1889, (_1888 * _59)));
                        } else {
                          _1903 = _1888;
                          _1904 = _1889;
                          _1905 = _1890;
                        }
                        float _1915 = exp2(log2(_1903 * 9.999999747378752e-05f) * 0.1593017578125f);
                        float _1916 = exp2(log2(_1904 * 9.999999747378752e-05f) * 0.1593017578125f);
                        float _1917 = exp2(log2(_1905 * 9.999999747378752e-05f) * 0.1593017578125f);
                        _2656 = exp2(log2((1.0f / ((_1915 * 18.6875f) + 1.0f)) * ((_1915 * 18.8515625f) + 0.8359375f)) * 78.84375f);
                        _2657 = exp2(log2((1.0f / ((_1916 * 18.6875f) + 1.0f)) * ((_1916 * 18.8515625f) + 0.8359375f)) * 78.84375f);
                        _2658 = exp2(log2((1.0f / ((_1917 * 18.6875f) + 1.0f)) * ((_1917 * 18.8515625f) + 0.8359375f)) * 78.84375f);
                      } while (false);
                    } while (false);
                  } while (false);
                } while (false);
              } while (false);
            } while (false);
          } while (false);
        } while (false);
      } else {
        if (((uint)(OutputDevice) & -3) == 4) {
          _9[0] = ACESCoefsLow_0.x;
          _9[1] = ACESCoefsLow_0.y;
          _9[2] = ACESCoefsLow_0.z;
          _9[3] = ACESCoefsLow_0.w;
          _9[4] = ACESCoefsLow_4;
          _9[5] = ACESCoefsLow_4;
          _10[0] = ACESCoefsHigh_0.x;
          _10[1] = ACESCoefsHigh_0.y;
          _10[2] = ACESCoefsHigh_0.z;
          _10[3] = ACESCoefsHigh_0.w;
          _10[4] = ACESCoefsHigh_4;
          _10[5] = ACESCoefsHigh_4;
          float _1994 = ACESSceneColorMultiplier * _1220;
          float _1995 = ACESSceneColorMultiplier * _1221;
          float _1996 = ACESSceneColorMultiplier * _1222;
          float _1999 = mad((WorkingColorSpace_ToAP0[0].z), _1996, mad((WorkingColorSpace_ToAP0[0].y), _1995, ((WorkingColorSpace_ToAP0[0].x) * _1994)));
          float _2002 = mad((WorkingColorSpace_ToAP0[1].z), _1996, mad((WorkingColorSpace_ToAP0[1].y), _1995, ((WorkingColorSpace_ToAP0[1].x) * _1994)));
          float _2005 = mad((WorkingColorSpace_ToAP0[2].z), _1996, mad((WorkingColorSpace_ToAP0[2].y), _1995, ((WorkingColorSpace_ToAP0[2].x) * _1994)));
          float _2009 = max(max(_1999, _2002), _2005);
          float _2014 = (max(_2009, 1.000000013351432e-10f) - max(min(min(_1999, _2002), _2005), 1.000000013351432e-10f)) / max(_2009, 0.009999999776482582f);
          float _2027 = ((_2002 + _1999) + _2005) + (sqrt((((_2005 - _2002) * _2005) + ((_2002 - _1999) * _2002)) + ((_1999 - _2005) * _1999)) * 1.75f);
          float _2028 = _2027 * 0.3333333432674408f;
          float _2029 = _2014 + -0.4000000059604645f;
          float _2030 = _2029 * 5.0f;
          float _2034 = max((1.0f - abs(_2029 * 2.5f)), 0.0f);
          float _2045 = ((float(((int)(uint)((bool)(_2030 > 0.0f))) - ((int)(uint)((bool)(_2030 < 0.0f)))) * (1.0f - (_2034 * _2034))) + 1.0f) * 0.02500000037252903f;
          do {
            if (!(_2028 <= 0.0533333346247673f)) {
              if (!(_2028 >= 0.1599999964237213f)) {
                _2054 = (((0.23999999463558197f / _2027) + -0.5f) * _2045);
              } else {
                _2054 = 0.0f;
              }
            } else {
              _2054 = _2045;
            }
            float _2055 = _2054 + 1.0f;
            float _2056 = _2055 * _1999;
            float _2057 = _2055 * _2002;
            float _2058 = _2055 * _2005;
            do {
              if (!((bool)(_2056 == _2057) && (bool)(_2057 == _2058))) {
                float _2065 = ((_2056 * 2.0f) - _2057) - _2058;
                float _2068 = ((_2002 - _2005) * 1.7320507764816284f) * _2055;
                float _2070 = atan(_2068 / _2065);
                bool _2073 = (_2065 < 0.0f);
                bool _2074 = (_2065 == 0.0f);
                bool _2075 = (_2068 >= 0.0f);
                bool _2076 = (_2068 < 0.0f);
                _2087 = select((_2075 && _2074), 90.0f, select((_2076 && _2074), -90.0f, (select((_2076 && _2073), (_2070 + -3.1415927410125732f), select((_2075 && _2073), (_2070 + 3.1415927410125732f), _2070)) * 57.2957763671875f)));
              } else {
                _2087 = 0.0f;
              }
              float _2092 = min(max(select((_2087 < 0.0f), (_2087 + 360.0f), _2087), 0.0f), 360.0f);
              do {
                if (_2092 < -180.0f) {
                  _2101 = (_2092 + 360.0f);
                } else {
                  if (_2092 > 180.0f) {
                    _2101 = (_2092 + -360.0f);
                  } else {
                    _2101 = _2092;
                  }
                }
                do {
                  if ((bool)(_2101 > -67.5f) && (bool)(_2101 < 67.5f)) {
                    float _2107 = (_2101 + 67.5f) * 0.029629629105329514f;
                    int _2108 = int(_2107);
                    float _2110 = _2107 - float(_2108);
                    float _2111 = _2110 * _2110;
                    float _2112 = _2111 * _2110;
                    if (_2108 == 3) {
                      _2140 = (((0.1666666716337204f - (_2110 * 0.5f)) + (_2111 * 0.5f)) - (_2112 * 0.1666666716337204f));
                    } else {
                      if (_2108 == 2) {
                        _2140 = ((0.6666666865348816f - _2111) + (_2112 * 0.5f));
                      } else {
                        if (_2108 == 1) {
                          _2140 = (((_2112 * -0.5f) + 0.1666666716337204f) + ((_2111 + _2110) * 0.5f));
                        } else {
                          _2140 = select((_2108 == 0), (_2112 * 0.1666666716337204f), 0.0f);
                        }
                      }
                    }
                  } else {
                    _2140 = 0.0f;
                  }
                  float _2149 = min(max(((((_2014 * 0.27000001072883606f) * (0.029999999329447746f - _2056)) * _2140) + _2056), 0.0f), 65535.0f);
                  float _2150 = min(max(_2057, 0.0f), 65535.0f);
                  float _2151 = min(max(_2058, 0.0f), 65535.0f);
                  float _2164 = min(max(mad(-0.21492856740951538f, _2151, mad(-0.2365107536315918f, _2150, (_2149 * 1.4514392614364624f))), 0.0f), 65504.0f);
                  float _2165 = min(max(mad(-0.09967592358589172f, _2151, mad(1.17622971534729f, _2150, (_2149 * -0.07655377686023712f))), 0.0f), 65504.0f);
                  float _2166 = min(max(mad(0.9977163076400757f, _2151, mad(-0.006032449658960104f, _2150, (_2149 * 0.008316148072481155f))), 0.0f), 65504.0f);
                  float _2167 = dot(float3(_2164, _2165, _2166), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));
                  float _2178 = log2(max((lerp(_2167, _2164, 0.9599999785423279f)), 1.000000013351432e-10f));
                  float _2179 = _2178 * 0.3010300099849701f;
                  float _2180 = log2(ACESMinMaxData.x);
                  float _2181 = _2180 * 0.3010300099849701f;
                  do {
                    if (!(!(_2179 <= _2181))) {
                      _2250 = (log2(ACESMinMaxData.y) * 0.3010300099849701f);
                    } else {
                      float _2188 = log2(ACESMidData.x);
                      float _2189 = _2188 * 0.3010300099849701f;
                      if ((bool)(_2179 > _2181) && (bool)(_2179 < _2189)) {
                        float _2197 = ((_2178 - _2180) * 0.9030900001525879f) / ((_2188 - _2180) * 0.3010300099849701f);
                        int _2198 = int(_2197);
                        float _2200 = _2197 - float(_2198);
                        float _2202 = _9[_2198];
                        float _2205 = _9[(_2198 + 1)];
                        float _2210 = _2202 * 0.5f;
                        _2250 = dot(float3((_2200 * _2200), _2200, 1.0f), float3(mad((_9[(_2198 + 2)]), 0.5f, mad(_2205, -1.0f, _2210)), (_2205 - _2202), mad(_2205, 0.5f, _2210)));
                      } else {
                        do {
                          if (!(!(_2179 >= _2189))) {
                            float _2219 = log2(ACESMinMaxData.z);
                            if (_2179 < (_2219 * 0.3010300099849701f)) {
                              float _2227 = ((_2178 - _2188) * 0.9030900001525879f) / ((_2219 - _2188) * 0.3010300099849701f);
                              int _2228 = int(_2227);
                              float _2230 = _2227 - float(_2228);
                              float _2232 = _10[_2228];
                              float _2235 = _10[(_2228 + 1)];
                              float _2240 = _2232 * 0.5f;
                              _2250 = dot(float3((_2230 * _2230), _2230, 1.0f), float3(mad((_10[(_2228 + 2)]), 0.5f, mad(_2235, -1.0f, _2240)), (_2235 - _2232), mad(_2235, 0.5f, _2240)));
                              break;
                            }
                          }
                          _2250 = (log2(ACESMinMaxData.w) * 0.3010300099849701f);
                        } while (false);
                      }
                    }
                    float _2254 = log2(max((lerp(_2167, _2165, 0.9599999785423279f)), 1.000000013351432e-10f));
                    float _2255 = _2254 * 0.3010300099849701f;
                    do {
                      if (!(!(_2255 <= _2181))) {
                        _2324 = (log2(ACESMinMaxData.y) * 0.3010300099849701f);
                      } else {
                        float _2262 = log2(ACESMidData.x);
                        float _2263 = _2262 * 0.3010300099849701f;
                        if ((bool)(_2255 > _2181) && (bool)(_2255 < _2263)) {
                          float _2271 = ((_2254 - _2180) * 0.9030900001525879f) / ((_2262 - _2180) * 0.3010300099849701f);
                          int _2272 = int(_2271);
                          float _2274 = _2271 - float(_2272);
                          float _2276 = _9[_2272];
                          float _2279 = _9[(_2272 + 1)];
                          float _2284 = _2276 * 0.5f;
                          _2324 = dot(float3((_2274 * _2274), _2274, 1.0f), float3(mad((_9[(_2272 + 2)]), 0.5f, mad(_2279, -1.0f, _2284)), (_2279 - _2276), mad(_2279, 0.5f, _2284)));
                        } else {
                          do {
                            if (!(!(_2255 >= _2263))) {
                              float _2293 = log2(ACESMinMaxData.z);
                              if (_2255 < (_2293 * 0.3010300099849701f)) {
                                float _2301 = ((_2254 - _2262) * 0.9030900001525879f) / ((_2293 - _2262) * 0.3010300099849701f);
                                int _2302 = int(_2301);
                                float _2304 = _2301 - float(_2302);
                                float _2306 = _10[_2302];
                                float _2309 = _10[(_2302 + 1)];
                                float _2314 = _2306 * 0.5f;
                                _2324 = dot(float3((_2304 * _2304), _2304, 1.0f), float3(mad((_10[(_2302 + 2)]), 0.5f, mad(_2309, -1.0f, _2314)), (_2309 - _2306), mad(_2309, 0.5f, _2314)));
                                break;
                              }
                            }
                            _2324 = (log2(ACESMinMaxData.w) * 0.3010300099849701f);
                          } while (false);
                        }
                      }
                      float _2328 = log2(max((lerp(_2167, _2166, 0.9599999785423279f)), 1.000000013351432e-10f));
                      float _2329 = _2328 * 0.3010300099849701f;
                      do {
                        if (!(!(_2329 <= _2181))) {
                          _2398 = (log2(ACESMinMaxData.y) * 0.3010300099849701f);
                        } else {
                          float _2336 = log2(ACESMidData.x);
                          float _2337 = _2336 * 0.3010300099849701f;
                          if ((bool)(_2329 > _2181) && (bool)(_2329 < _2337)) {
                            float _2345 = ((_2328 - _2180) * 0.9030900001525879f) / ((_2336 - _2180) * 0.3010300099849701f);
                            int _2346 = int(_2345);
                            float _2348 = _2345 - float(_2346);
                            float _2350 = _9[_2346];
                            float _2353 = _9[(_2346 + 1)];
                            float _2358 = _2350 * 0.5f;
                            _2398 = dot(float3((_2348 * _2348), _2348, 1.0f), float3(mad((_9[(_2346 + 2)]), 0.5f, mad(_2353, -1.0f, _2358)), (_2353 - _2350), mad(_2353, 0.5f, _2358)));
                          } else {
                            do {
                              if (!(!(_2329 >= _2337))) {
                                float _2367 = log2(ACESMinMaxData.z);
                                if (_2329 < (_2367 * 0.3010300099849701f)) {
                                  float _2375 = ((_2328 - _2336) * 0.9030900001525879f) / ((_2367 - _2336) * 0.3010300099849701f);
                                  int _2376 = int(_2375);
                                  float _2378 = _2375 - float(_2376);
                                  float _2380 = _10[_2376];
                                  float _2383 = _10[(_2376 + 1)];
                                  float _2388 = _2380 * 0.5f;
                                  _2398 = dot(float3((_2378 * _2378), _2378, 1.0f), float3(mad((_10[(_2376 + 2)]), 0.5f, mad(_2383, -1.0f, _2388)), (_2383 - _2380), mad(_2383, 0.5f, _2388)));
                                  break;
                                }
                              }
                              _2398 = (log2(ACESMinMaxData.w) * 0.3010300099849701f);
                            } while (false);
                          }
                        }
                        float _2402 = ACESMinMaxData.w - ACESMinMaxData.y;
                        float _2403 = (exp2(_2250 * 3.321928024291992f) - ACESMinMaxData.y) / _2402;
                        float _2405 = (exp2(_2324 * 3.321928024291992f) - ACESMinMaxData.y) / _2402;
                        float _2407 = (exp2(_2398 * 3.321928024291992f) - ACESMinMaxData.y) / _2402;
                        float _2410 = mad(0.15618768334388733f, _2407, mad(0.13400420546531677f, _2405, (_2403 * 0.6624541878700256f)));
                        float _2413 = mad(0.053689517080783844f, _2407, mad(0.6740817427635193f, _2405, (_2403 * 0.2722287178039551f)));
                        float _2416 = mad(1.0103391408920288f, _2407, mad(0.00406073359772563f, _2405, (_2403 * -0.005574649665504694f)));
                        float _2429 = min(max(mad(-0.23642469942569733f, _2416, mad(-0.32480329275131226f, _2413, (_2410 * 1.6410233974456787f))), 0.0f), 1.0f);
                        float _2430 = min(max(mad(0.016756348311901093f, _2416, mad(1.6153316497802734f, _2413, (_2410 * -0.663662850856781f))), 0.0f), 1.0f);
                        float _2431 = min(max(mad(0.9883948564529419f, _2416, mad(-0.008284442126750946f, _2413, (_2410 * 0.011721894145011902f))), 0.0f), 1.0f);
                        float _2434 = mad(0.15618768334388733f, _2431, mad(0.13400420546531677f, _2430, (_2429 * 0.6624541878700256f)));
                        float _2437 = mad(0.053689517080783844f, _2431, mad(0.6740817427635193f, _2430, (_2429 * 0.2722287178039551f)));
                        float _2440 = mad(1.0103391408920288f, _2431, mad(0.00406073359772563f, _2430, (_2429 * -0.005574649665504694f)));
                        float _2462 = min(max((min(max(mad(-0.23642469942569733f, _2440, mad(-0.32480329275131226f, _2437, (_2434 * 1.6410233974456787f))), 0.0f), 65535.0f) * ACESMinMaxData.w), 0.0f), 65535.0f);
                        float _2463 = min(max((min(max(mad(0.016756348311901093f, _2440, mad(1.6153316497802734f, _2437, (_2434 * -0.663662850856781f))), 0.0f), 65535.0f) * ACESMinMaxData.w), 0.0f), 65535.0f);
                        float _2464 = min(max((min(max(mad(0.9883948564529419f, _2440, mad(-0.008284442126750946f, _2437, (_2434 * 0.011721894145011902f))), 0.0f), 65535.0f) * ACESMinMaxData.w), 0.0f), 65535.0f);
                        do {
                          if (!((uint)(OutputDevice) == 6)) {
                            _2477 = mad(_55, _2464, mad(_54, _2463, (_2462 * _53)));
                            _2478 = mad(_58, _2464, mad(_57, _2463, (_2462 * _56)));
                            _2479 = mad(_61, _2464, mad(_60, _2463, (_2462 * _59)));
                          } else {
                            _2477 = _2462;
                            _2478 = _2463;
                            _2479 = _2464;
                          }
                          float _2489 = exp2(log2(_2477 * 9.999999747378752e-05f) * 0.1593017578125f);
                          float _2490 = exp2(log2(_2478 * 9.999999747378752e-05f) * 0.1593017578125f);
                          float _2491 = exp2(log2(_2479 * 9.999999747378752e-05f) * 0.1593017578125f);
                          _2656 = exp2(log2((1.0f / ((_2489 * 18.6875f) + 1.0f)) * ((_2489 * 18.8515625f) + 0.8359375f)) * 78.84375f);
                          _2657 = exp2(log2((1.0f / ((_2490 * 18.6875f) + 1.0f)) * ((_2490 * 18.8515625f) + 0.8359375f)) * 78.84375f);
                          _2658 = exp2(log2((1.0f / ((_2491 * 18.6875f) + 1.0f)) * ((_2491 * 18.8515625f) + 0.8359375f)) * 78.84375f);
                        } while (false);
                      } while (false);
                    } while (false);
                  } while (false);
                } while (false);
              } while (false);
            } while (false);
          } while (false);
        } else {
          if ((uint)(OutputDevice) == 7) {
            float _2536 = mad((WorkingColorSpace_ToAP1[0].z), _1222, mad((WorkingColorSpace_ToAP1[0].y), _1221, ((WorkingColorSpace_ToAP1[0].x) * _1220)));
            float _2539 = mad((WorkingColorSpace_ToAP1[1].z), _1222, mad((WorkingColorSpace_ToAP1[1].y), _1221, ((WorkingColorSpace_ToAP1[1].x) * _1220)));
            float _2542 = mad((WorkingColorSpace_ToAP1[2].z), _1222, mad((WorkingColorSpace_ToAP1[2].y), _1221, ((WorkingColorSpace_ToAP1[2].x) * _1220)));
            float _2561 = exp2(log2(mad(_55, _2542, mad(_54, _2539, (_2536 * _53))) * 9.999999747378752e-05f) * 0.1593017578125f);
            float _2562 = exp2(log2(mad(_58, _2542, mad(_57, _2539, (_2536 * _56))) * 9.999999747378752e-05f) * 0.1593017578125f);
            float _2563 = exp2(log2(mad(_61, _2542, mad(_60, _2539, (_2536 * _59))) * 9.999999747378752e-05f) * 0.1593017578125f);
            _2656 = exp2(log2((1.0f / ((_2561 * 18.6875f) + 1.0f)) * ((_2561 * 18.8515625f) + 0.8359375f)) * 78.84375f);
            _2657 = exp2(log2((1.0f / ((_2562 * 18.6875f) + 1.0f)) * ((_2562 * 18.8515625f) + 0.8359375f)) * 78.84375f);
            _2658 = exp2(log2((1.0f / ((_2563 * 18.6875f) + 1.0f)) * ((_2563 * 18.8515625f) + 0.8359375f)) * 78.84375f);
          } else {
            if (!((uint)(OutputDevice) == 8)) {
              if ((uint)(OutputDevice) == 9) {
                float _2610 = mad((WorkingColorSpace_ToAP1[0].z), _1210, mad((WorkingColorSpace_ToAP1[0].y), _1209, ((WorkingColorSpace_ToAP1[0].x) * _1208)));
                float _2613 = mad((WorkingColorSpace_ToAP1[1].z), _1210, mad((WorkingColorSpace_ToAP1[1].y), _1209, ((WorkingColorSpace_ToAP1[1].x) * _1208)));
                float _2616 = mad((WorkingColorSpace_ToAP1[2].z), _1210, mad((WorkingColorSpace_ToAP1[2].y), _1209, ((WorkingColorSpace_ToAP1[2].x) * _1208)));
                _2656 = mad(_55, _2616, mad(_54, _2613, (_2610 * _53)));
                _2657 = mad(_58, _2616, mad(_57, _2613, (_2610 * _56)));
                _2658 = mad(_61, _2616, mad(_60, _2613, (_2610 * _59)));
              } else {
                float _2629 = mad((WorkingColorSpace_ToAP1[0].z), _1236, mad((WorkingColorSpace_ToAP1[0].y), _1235, ((WorkingColorSpace_ToAP1[0].x) * _1234)));
                float _2632 = mad((WorkingColorSpace_ToAP1[1].z), _1236, mad((WorkingColorSpace_ToAP1[1].y), _1235, ((WorkingColorSpace_ToAP1[1].x) * _1234)));
                float _2635 = mad((WorkingColorSpace_ToAP1[2].z), _1236, mad((WorkingColorSpace_ToAP1[2].y), _1235, ((WorkingColorSpace_ToAP1[2].x) * _1234)));
                _2656 = exp2(log2(mad(_55, _2635, mad(_54, _2632, (_2629 * _53)))) * InverseGamma.z);
                _2657 = exp2(log2(mad(_58, _2635, mad(_57, _2632, (_2629 * _56)))) * InverseGamma.z);
                _2658 = exp2(log2(mad(_61, _2635, mad(_60, _2632, (_2629 * _59)))) * InverseGamma.z);
              }
            } else {
              _2656 = _1220;
              _2657 = _1221;
              _2658 = _1222;
            }
          }
        }
      }
    }
  }
  RWOutputTexture[int3((uint)(SV_DispatchThreadID.x), (uint)(SV_DispatchThreadID.y), (uint)(SV_DispatchThreadID.z))] = float4((_2656 * 0.9523810148239136f), (_2657 * 0.9523810148239136f), (_2658 * 0.9523810148239136f), 0.0f);
}
