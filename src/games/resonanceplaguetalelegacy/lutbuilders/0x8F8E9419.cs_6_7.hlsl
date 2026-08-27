#include "../shared.h"
#include "../test30.hlsl"

static const float RESONANCE_LUT_LINEAR_SCALE = 335.718017578125f;
static const float RESONANCE_LUT_LOG_SCALE = 0.07434873282909393f;

struct UserConstant_Z {
  float4 UserConstant_Z_000[84];
};


Texture2D<float2> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

Texture2D<float3> t2 : register(t2);

RWTexture3D<float4> u0 : register(u0);

cbuffer cb0 : register(b0) {
  UserConstant_Z User_000 : packoffset(c000.x);
};

SamplerState s0 : register(s0);

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }
uint firstbithigh_msb(uint value) { return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value)); }

[numthreads(4, 4, 4)]
void main(
  uint3 SV_DispatchThreadID : SV_DispatchThreadID,
  uint3 SV_GroupID : SV_GroupID,
  uint3 SV_GroupThreadID : SV_GroupThreadID,
  uint SV_GroupIndex : SV_GroupIndex
) {
  float _18;
  float _19;
  float _20;
  float _21;
  float _24;
  float _27;
  float _30;
  float _31;
  uint _32;
  uint _33;
  float4 _37;
  float _47;
  float4 _50;
  float _69;
  float _70;
  float _72;
  float _73;
  float _83;
  float _87;
  float _88;
  float _89;
  float _98;
  float _104;
  float _107;
  float _112;
  float _122;
  float _126;
  float _127;
  float _128;
  float _137;
  float _143;
  float _146;
  float _151;
  float _161;
  float _165;
  float _166;
  float _167;
  float _176;
  float _182;
  float _185;
  float _190;
  float _198;
  float _200;
  bool _205;
  float _208;
  float _209;
  float _210;
  float _211;
  float _298;
  float _299;
  float _300;
  float _301;
  float _379;
  float _380;
  float _381;
  float _382;
  float _535;
  float _536;
  float _537;
  float _575;
  float _586;
  float _758;
  float _862;
  float _966;
  float _969;
  float _970;
  float _971;
  float _982;
  float _1099;
  float _1100;
  float _1101;
  bool _212;
  float _213;
  float _215;
  float _217;
  float _225;
  float _226;
  float _257;
  float _258;
  float _259;
  float _262;
  float _274;
  float _277;
  float _279;
  float _280;
  float _281;
  float _286;
  float _287;
  float _293;
  bool _302;
  float _303;
  float _305;
  float _307;
  float _315;
  float _316;
  float _347;
  float _348;
  float _349;
  float _352;
  float _360;
  float _361;
  float _362;
  float _367;
  float _368;
  float _374;
  bool _383;
  float _384;
  float _386;
  float _388;
  float _396;
  float _397;
  float _428;
  float _429;
  float _430;
  float _433;
  float _441;
  float _442;
  float _443;
  float _448;
  float _449;
  float _452;
  float _460;
  float _461;
  float _462;
  float _467;
  float _468;
  float _469;
  float _471;
  float _472;
  float _473;
  float _474;
  float _475;
  float _476;
  float _478;
  float _479;
  float _480;
  float _482;
  float _547;
  float _548;
  float _549;
  float _552;
  float _555;
  float _558;
  float _565;
  bool _567;
  float _578;
  float _579;
  float _592;
  float _628;
  float _629;
  float _630;
  int _637;
  float _658;
  float _659;
  float _673;
  float _675;
  float _676;
  float _697;
  float _699;
  float _700;
  float _721;
  float _723;
  float _724;
  float _742;
  float _745;
  float _746;
  float _762;
  float _763;
  float _777;
  float _779;
  float _780;
  float _801;
  float _803;
  float _804;
  float _825;
  float _827;
  float _828;
  float _846;
  float _849;
  float _850;
  float _866;
  float _867;
  float _881;
  float _883;
  float _884;
  float _905;
  float _907;
  float _908;
  float _929;
  float _931;
  float _932;
  float _950;
  float _953;
  float _954;
  bool _999;
  float _1000;
  bool _1002;
  float _1003;
  float _1020;
  float _1021;
  uint2 _1048;
  float _1051;
  float _1052;
  float _1053;
  float _1057;
  float _1061;
  float _1062;
  float _1063;
  float _1064;
  float3 _1071;
  float3 _1075;
  float _1085;
  float _7[4];
  float _8[4];
  _18 = (User_000.UserConstant_Z_000[2].w) + -1.0f;
  _19 = ((float)((uint)SV_DispatchThreadID.x)) / _18;
  _20 = ((float)((uint)SV_DispatchThreadID.y)) / _18;
  _21 = ((float)((uint)SV_DispatchThreadID.z)) / _18;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    // The generated 3D LUT is addressed and stored in the game's normalized
    // log domain. Decode the grid point before feeding linear BT.709 to
    // PsychoV.
    float3 untonemapped =
        (exp2(float3(_19, _20, _21) / RESONANCE_LUT_LOG_SCALE) - 1.f.xxx) /
        RESONANCE_LUT_LINEAR_SCALE;
    float3 psychov_hdr = renodx::tonemap::psychov::psychotm_test30(
        untonemapped, RENODX_PEAK_WHITE_NITS / RENODX_DIFFUSE_WHITE_NITS,
        RENODX_TONE_MAP_EXPOSURE, RENODX_TONE_MAP_HIGHLIGHTS,
        RENODX_TONE_MAP_SHADOWS, RENODX_TONE_MAP_CONTRAST,
        RENODX_TONE_MAP_SATURATION, RENODX_TONE_MAP_BLOWOUT);

  // psychov_hdr = untonemapped;
    float3 adaptive_state_lms = renodx::color::lms::from::BT709(0.18f.xxx);
    float gamut_compression_scale =
        renodx::color::gamut::ComputeGamutCompressionScaleBT709AdaptiveD65(
            psychov_hdr, adaptive_state_lms, 1.f);
    float3 psychov_hdr_compressed =
        renodx::color::gamut::GamutCompressBT709AdaptiveD65(
            psychov_hdr, adaptive_state_lms, gamut_compression_scale);
    float n2_scale =
        renodx::tonemap::neutwo::ComputeMaxChannelScale(psychov_hdr_compressed);
    float3 psychov_sdr = psychov_hdr_compressed * n2_scale.xxx;
    float3 graded_hdr = psychov_hdr;

    // PsychoV replaces the vanilla primary curve, but the packed SDR LUT still
    // follows the game's master enable, mode selection, mask, and strength.
    int lut_mode_flags = asint(User_000.UserConstant_Z_000[11].y);
    if (asint(User_000.UserConstant_Z_000[11].x) != 0 &&
      (lut_mode_flags & 8) == 0 &&
      (lut_mode_flags & 4) != 0 &&
      (lut_mode_flags & 16) == 0) {
      float3 lut_input =
        log2(max(psychov_sdr, 0.f.xxx) * RESONANCE_LUT_LINEAR_SCALE +
           1.f.xxx) *
        RESONANCE_LUT_LOG_SCALE;
      float lut_mask = 1.f;
      if ((lut_mode_flags & 2) != 0) {
      lut_mask = saturate(
        1.f - dot(sqrt(lut_input),
              float3(0.2125999927520752f, 0.7152000069618225f,
                 0.0722000002861023f)));
      }

      if (lut_mask != 0.f) {
      // Preserve the packed 2D LUT's original normalized-log addressing.
      uint2 lut_dimensions;
      t2.GetDimensions(lut_dimensions.x, lut_dimensions.y);
      float lut_width = (float)lut_dimensions.x;
      float lut_height = (float)lut_dimensions.y;
      float lut_size = lut_height - 1.f;
      float2 lut_uv =
        float2((lut_size / lut_width) * lut_input.x + (0.5f / lut_width),
             (lut_size / lut_height) * lut_input.y +
               (0.5f / lut_height));
      float lut_slice = lut_size * lut_input.z;
      float lut_slice_floor = floor(lut_slice);
      float3 lut_lower = t2.Sample(
        s0, float2((lut_slice_floor / lut_height) + lut_uv.x, lut_uv.y));
      float3 lut_upper = t2.Sample(
        s0,
        float2(((lut_slice_floor + 1.f) / lut_height) + lut_uv.x,
             lut_uv.y));
      float3 sampled_sdr_log =
        lerp(lut_lower, lut_upper, frac(lut_slice));
      float lut_strength =
        saturate(abs(User_000.UserConstant_Z_000[13].x)) * lut_mask;
      float3 graded_sdr_log =
        lerp(lut_input, sampled_sdr_log, lut_strength);
      float3 graded_sdr =
        (exp2(graded_sdr_log / RESONANCE_LUT_LOG_SCALE) - 1.f.xxx) /
        RESONANCE_LUT_LINEAR_SCALE;
      float3 graded_hdr_compressed =
        renodx::math::DivideSafe(graded_sdr, n2_scale.xxx, graded_sdr);
      graded_hdr = renodx::color::gamut::GamutDecompressBT709AdaptiveD65(
        graded_hdr_compressed, adaptive_state_lms,
        gamut_compression_scale);
      }
    }

    float3 output_log =
        log2(max(graded_hdr, 0.f.xxx) * RESONANCE_LUT_LINEAR_SCALE + 1.f.xxx) *
        RESONANCE_LUT_LOG_SCALE;

    u0[int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y),
            (int)(SV_DispatchThreadID.z))] = float4(output_log, 1.f);
    return;
  }

  _24 = mad(0.0722000002861023f, _21, mad(0.7152000069618225f, _20, (_19 * 0.2125999927520752f)));
  _27 = mad(0.4359999895095825f, _21, mad(-0.33608999848365784f, _20, (_19 * -0.09990999847650528f)));
  _30 = mad(-0.05638999864459038f, _21, mad(-0.5586100220680237f, _20, (_19 * 0.6150000095367432f)));
  _31 = _24 * 63.0f;
  _32 = uint(_31);
  _33 = _32 + 1u;
  _37 = t1.Load(int3(((uint)(_32) >> 2), 0, 0));
  _7[0] = _37.x;
  _7[1] = _37.y;
  _7[2] = _37.z;
  _7[3] = _37.w;
  _47 = _7[min((uint)((_32 & 3)), 3u)];
  _50 = t1.Load(int3(((uint)(_33) >> 2), 0, 0));
  _8[0] = _50.x;
  _8[1] = _50.y;
  _8[2] = _50.z;
  _8[3] = _50.w;
  _69 = ((User_000.UserConstant_Z_000[0].w) * ((_47 - _24) + (frac(_31) * ((_8[min((uint)((_33 & 3)), 3u)]) - _47)))) + _24;
  _70 = mad(1.280329942703247f, _30, _69);
  _72 = mad(-0.3805899918079376f, _30, mad(-0.214819997549057f, _27, _69));
  _73 = mad(2.1279799938201904f, _27, _69);
  _83 = (pow(User_000.UserConstant_Z_000[6].x, 2.4094207286834717f));
  _87 = (User_000.UserConstant_Z_000[5].x) - _70;
  _88 = (User_000.UserConstant_Z_000[5].y) - _72;
  _89 = (User_000.UserConstant_Z_000[5].z) - _73;
  _98 = saturate(1.0f - _83);
  _104 = saturate(max((_83 + 9.999999747378752e-06f), (((_98 * _98) * (pow(User_000.UserConstant_Z_000[6].y, 2.4094207286834717f))) + _83)));
  _107 = saturate(min((_104 + -9.999999747378752e-06f), _83));
  _112 = 1.0f - saturate(((sqrt(((_87 * _87) + (_88 * _88)) + (_89 * _89)) * 0.5773502588272095f) - _107) / (_104 - _107));
  _122 = (pow(User_000.UserConstant_Z_000[8].x, 2.4094207286834717f));
  _126 = (User_000.UserConstant_Z_000[7].x) - _70;
  _127 = (User_000.UserConstant_Z_000[7].y) - _72;
  _128 = (User_000.UserConstant_Z_000[7].z) - _73;
  _137 = saturate(1.0f - _122);
  _143 = saturate(max((_122 + 9.999999747378752e-06f), (((_137 * _137) * (pow(User_000.UserConstant_Z_000[8].y, 2.4094207286834717f))) + _122)));
  _146 = saturate(min((_143 + -9.999999747378752e-06f), _122));
  _151 = 1.0f - saturate(((sqrt(((_126 * _126) + (_127 * _127)) + (_128 * _128)) * 0.5773502588272095f) - _146) / (_143 - _146));
  _161 = (pow(User_000.UserConstant_Z_000[10].x, 2.4094207286834717f));
  _165 = (User_000.UserConstant_Z_000[9].x) - _70;
  _166 = (User_000.UserConstant_Z_000[9].y) - _72;
  _167 = (User_000.UserConstant_Z_000[9].z) - _73;
  _176 = saturate(1.0f - _161);
  _182 = saturate(max((_161 + 9.999999747378752e-06f), (((_176 * _176) * (pow(User_000.UserConstant_Z_000[10].y, 2.4094207286834717f))) + _161)));
  _185 = saturate(min((_182 + -9.999999747378752e-06f), _161));
  _190 = 1.0f - saturate(((sqrt(((_165 * _165) + (_166 * _166)) + (_167 * _167)) * 0.5773502588272095f) - _185) / (_182 - _185));
  _198 = 1.0f - (User_000.UserConstant_Z_000[0].y);
  _200 = (_112 * _198) + (User_000.UserConstant_Z_000[0].y);
  _205 = (_72 < _73);
  if (_205) {
    _208 = _73;
    _209 = _72;
    _210 = -1.0f;
    _211 = 0.6666666865348816f;
  } else {
    _208 = _72;
    _209 = _73;
    _210 = 0.0f;
    _211 = -0.3333333432674408f;
  }
  _212 = (_70 < _208);
  _213 = select(_212, _208, _70);
  _215 = select(_212, _70, _208);
  _217 = _213 - min(_215, _209);
  _225 = _217 / (_213 + 1.000000013351432e-10f);
  _226 = abs(((_215 - _209) / ((_217 * 6.0f) + 1.000000013351432e-10f)) + select(_212, _211, _210)) + (User_000.UserConstant_Z_000[6].z);
  _257 = (((saturate(abs((frac(_226 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _225) + 1.0f) * _213;
  _258 = (((saturate(abs((frac(_226 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _225) + 1.0f) * _213;
  _259 = (((saturate(abs((frac(_226 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _225) + 1.0f) * _213;
  _262 = mad(0.0722000002861023f, _259, mad(0.7152000069618225f, _258, (_257 * 0.2125999927520752f)));
  _274 = mad(0.4359999895095825f, (User_000.UserConstant_Z_000[1].z), mad(-0.33608999848365784f, (User_000.UserConstant_Z_000[1].y), ((User_000.UserConstant_Z_000[1].x) * -0.09990999847650528f)));
  _277 = mad(-0.05638999864459038f, (User_000.UserConstant_Z_000[1].z), mad(-0.5586100220680237f, (User_000.UserConstant_Z_000[1].y), ((User_000.UserConstant_Z_000[1].x) * 0.6150000095367432f)));
  _279 = saturate(_262 * ((User_000.UserConstant_Z_000[1].w) - ((User_000.UserConstant_Z_000[1].w) * _112)));
  _280 = mad(0.4359999895095825f, _259, mad(-0.33608999848365784f, _258, (_257 * -0.09990999847650528f))) * _200;
  _281 = mad(-0.05638999864459038f, _259, mad(-0.5586100220680237f, _258, (_257 * 0.6150000095367432f))) * _200;
  _286 = (_279 * (_274 - _280)) + _280;
  _287 = (_279 * (_277 - _281)) + _281;
  _293 = (_151 * _198) + (User_000.UserConstant_Z_000[0].y);
  if (_205) {
    _298 = _73;
    _299 = _72;
    _300 = -1.0f;
    _301 = 0.6666666865348816f;
  } else {
    _298 = _72;
    _299 = _73;
    _300 = 0.0f;
    _301 = -0.3333333432674408f;
  }
  _302 = (_70 < _298);
  _303 = select(_302, _298, _70);
  _305 = select(_302, _70, _298);
  _307 = _303 - min(_305, _299);
  _315 = _307 / (_303 + 1.000000013351432e-10f);
  _316 = abs(((_305 - _299) / ((_307 * 6.0f) + 1.000000013351432e-10f)) + select(_302, _301, _300)) + (User_000.UserConstant_Z_000[8].z);
  _347 = (((saturate(abs((frac(_316 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _315) + 1.0f) * _303;
  _348 = (((saturate(abs((frac(_316 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _315) + 1.0f) * _303;
  _349 = (((saturate(abs((frac(_316 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _315) + 1.0f) * _303;
  _352 = mad(0.0722000002861023f, _349, mad(0.7152000069618225f, _348, (_347 * 0.2125999927520752f)));
  _360 = saturate(_352 * ((User_000.UserConstant_Z_000[1].w) - ((User_000.UserConstant_Z_000[1].w) * _151)));
  _361 = mad(0.4359999895095825f, _349, mad(-0.33608999848365784f, _348, (_347 * -0.09990999847650528f))) * _293;
  _362 = mad(-0.05638999864459038f, _349, mad(-0.5586100220680237f, _348, (_347 * 0.6150000095367432f))) * _293;
  _367 = (_360 * (_274 - _361)) + _361;
  _368 = ((_277 - _362) * _360) + _362;
  _374 = (_190 * _198) + (User_000.UserConstant_Z_000[0].y);
  if (_205) {
    _379 = _73;
    _380 = _72;
    _381 = -1.0f;
    _382 = 0.6666666865348816f;
  } else {
    _379 = _72;
    _380 = _73;
    _381 = 0.0f;
    _382 = -0.3333333432674408f;
  }
  _383 = (_70 < _379);
  _384 = select(_383, _379, _70);
  _386 = select(_383, _70, _379);
  _388 = _384 - min(_386, _380);
  _396 = _388 / (_384 + 1.000000013351432e-10f);
  _397 = abs(((_386 - _380) / ((_388 * 6.0f) + 1.000000013351432e-10f)) + select(_383, _382, _381)) + (User_000.UserConstant_Z_000[10].z);
  _428 = (((saturate(abs((frac(_397 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _396) + 1.0f) * _384;
  _429 = (((saturate(abs((frac(_397 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _396) + 1.0f) * _384;
  _430 = (((saturate(abs((frac(_397 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _396) + 1.0f) * _384;
  _433 = mad(0.0722000002861023f, _430, mad(0.7152000069618225f, _429, (_428 * 0.2125999927520752f)));
  _441 = saturate(_433 * ((User_000.UserConstant_Z_000[1].w) - ((User_000.UserConstant_Z_000[1].w) * _190)));
  _442 = mad(0.4359999895095825f, _430, mad(-0.33608999848365784f, _429, (_428 * -0.09990999847650528f))) * _374;
  _443 = mad(-0.05638999864459038f, _430, mad(-0.5586100220680237f, _429, (_428 * 0.6150000095367432f))) * _374;
  _448 = (_441 * (_274 - _442)) + _442;
  _449 = ((_277 - _443) * _441) + _443;
  _452 = mad(0.0722000002861023f, _73, mad(0.7152000069618225f, _72, (_70 * 0.2125999927520752f)));
  _460 = saturate(_452 * (User_000.UserConstant_Z_000[1].w));
  _461 = mad(0.4359999895095825f, _73, mad(-0.33608999848365784f, _72, (_70 * -0.09990999847650528f))) * (User_000.UserConstant_Z_000[0].y);
  _462 = mad(-0.05638999864459038f, _73, mad(-0.5586100220680237f, _72, (_70 * 0.6150000095367432f))) * (User_000.UserConstant_Z_000[0].y);
  _467 = (_460 * (_274 - _461)) + _461;
  _468 = ((_277 - _462) * _460) + _462;
  _469 = mad(1.280329942703247f, _468, _452);
  _471 = mad(-0.3805899918079376f, _468, mad(-0.214819997549057f, _467, _452));
  _472 = mad(2.1279799938201904f, _467, _452);
  _473 = saturate(User_000.UserConstant_Z_000[6].w);
  _474 = _473 * _112;
  _475 = saturate(User_000.UserConstant_Z_000[8].w);
  _476 = _475 * _151;
  _478 = saturate(User_000.UserConstant_Z_000[10].w);
  _479 = _478 * _190;
  _480 = (_476 + _474) + _479;
  _482 = saturate(_480 * 4.0f);
  if (_480 > 0.0f) {
    _535 = ((((((_475 * (mad(1.280329942703247f, _368, _352) - _469)) + _469) * _476) + (((_473 * (mad(1.280329942703247f, _287, _262) - _469)) + _469) * _474)) + ((((mad(1.280329942703247f, _449, _433) - _469) * _478) + _469) * _479)) / _480);
    _536 = ((((((_475 * (mad(-0.3805899918079376f, _368, mad(-0.214819997549057f, _367, _352)) - _471)) + _471) * _476) + (((_473 * (mad(-0.3805899918079376f, _287, mad(-0.214819997549057f, _286, _262)) - _471)) + _471) * _474)) + ((((mad(-0.3805899918079376f, _449, mad(-0.214819997549057f, _448, _433)) - _471) * _478) + _471) * _479)) / _480);
    _537 = ((((((_475 * (mad(2.1279799938201904f, _367, _352) - _472)) + _472) * _476) + (((_473 * (mad(2.1279799938201904f, _286, _262) - _472)) + _472) * _474)) + ((((mad(2.1279799938201904f, _448, _433) - _472) * _478) + _472) * _479)) / _480);
  } else {
    _535 = 0.0f;
    _536 = 0.0f;
    _537 = 0.0f;
  }
  _547 = saturate(lerp(_469, _535, _482));
  _548 = saturate(lerp(_471, _536, _482));
  _549 = saturate(lerp(_472, _537, _482));
  _552 = mad(0.0722000002861023f, _549, mad(0.7152000069618225f, _548, (_547 * 0.2125999927520752f)));
  _555 = mad(0.4359999895095825f, _549, mad(-0.33608999848365784f, _548, (_547 * -0.09990999847650528f)));
  _558 = mad(-0.05638999864459038f, _549, mad(-0.5586100220680237f, _548, (_547 * 0.6150000095367432f)));
  _565 = log2(((((float2)(t0.Load(int3(0, 0, 0)))).y) * 335.718017578125f) + 1.0f) * 0.07434873282909393f;
  _567 = (_552 < _565);
  if (_567) {
    _575 = (_552 / _565);
  } else {
    _575 = ((1.0f - _552) / (1.0f - _565));
  }
  _578 = exp2(log2(_575) * (User_000.UserConstant_Z_000[0].z));
  _579 = _578 * _565;
  if (!_567) {
    _586 = ((((_579 - _578) * _565) / _565) + 1.0f);
  } else {
    _586 = _579;
  }
  _592 = 1.0f / (User_000.UserConstant_Z_000[0].x);
  _628 = exp2(log2(max((exp2(log2(mad(1.280329942703247f, _558, _586)) * _592) - (User_000.UserConstant_Z_000[2].x)), 0.0f)) * (User_000.UserConstant_Z_000[4].x)) * (User_000.UserConstant_Z_000[3].x);
  _629 = exp2(log2(max((exp2(log2(mad(-0.3805899918079376f, _558, mad(-0.214819997549057f, _555, _586))) * _592) - (User_000.UserConstant_Z_000[2].y)), 0.0f)) * (User_000.UserConstant_Z_000[4].y)) * (User_000.UserConstant_Z_000[3].y);
  _630 = exp2(log2(max((exp2(log2(mad(2.1279799938201904f, _555, _586)) * _592) - (User_000.UserConstant_Z_000[2].z)), 0.0f)) * (User_000.UserConstant_Z_000[4].z)) * (User_000.UserConstant_Z_000[3].z);
  if (!(asint((User_000.UserConstant_Z_000[11].x)) == 0)) {
    _637 = asint((User_000.UserConstant_Z_000[11].y));
    if (!((_637 & 1) == 0)) {
      if (!(!(_628 <= (User_000.UserConstant_Z_000[12].x)))) {
        _658 = max(9.999999974752427e-07f, (User_000.UserConstant_Z_000[12].x));
        _659 = _628 / _658;
        _758 = ((((_658 * _658) * ((User_000.UserConstant_Z_000[15].x) * 0.1666666716337204f)) * (((_659 * _659) * _659) - _659)) + (_659 * (User_000.UserConstant_Z_000[12].y)));
      } else {
        if (!(_628 <= (User_000.UserConstant_Z_000[12].z))) {
          if (!(_628 <= (User_000.UserConstant_Z_000[14].x))) {
            if (!(_628 <= (User_000.UserConstant_Z_000[14].z))) {
              _742 = 1.0f - (User_000.UserConstant_Z_000[14].z);
              _745 = (_628 - (User_000.UserConstant_Z_000[14].z)) / max(9.999999974752427e-07f, _742);
              _746 = 1.0f - _745;
              _758 = (((_746 * (User_000.UserConstant_Z_000[14].w)) + _745) + (((_742 * _742) * ((User_000.UserConstant_Z_000[15].w) * 0.1666666716337204f)) * (((_746 * _746) * _746) - _746)));
            } else {
              _721 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[14].z) - (User_000.UserConstant_Z_000[14].x)));
              _723 = (_628 - (User_000.UserConstant_Z_000[14].x)) / _721;
              _724 = 1.0f - _723;
              _758 = (((_724 * (User_000.UserConstant_Z_000[14].y)) + (_723 * (User_000.UserConstant_Z_000[14].w))) + (((_721 * _721) * 0.1666666716337204f) * (((((_724 * _724) * _724) - _724) * (User_000.UserConstant_Z_000[15].z)) + ((((_723 * _723) * _723) - _723) * (User_000.UserConstant_Z_000[15].w)))));
            }
          } else {
            _697 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[14].x) - (User_000.UserConstant_Z_000[12].z)));
            _699 = (_628 - (User_000.UserConstant_Z_000[12].z)) / _697;
            _700 = 1.0f - _699;
            _758 = (((_700 * (User_000.UserConstant_Z_000[12].w)) + (_699 * (User_000.UserConstant_Z_000[14].y))) + (((_697 * _697) * 0.1666666716337204f) * (((((_700 * _700) * _700) - _700) * (User_000.UserConstant_Z_000[15].y)) + ((((_699 * _699) * _699) - _699) * (User_000.UserConstant_Z_000[15].z)))));
          }
        } else {
          _673 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[12].z) - (User_000.UserConstant_Z_000[12].x)));
          _675 = (_628 - (User_000.UserConstant_Z_000[12].x)) / _673;
          _676 = 1.0f - _675;
          _758 = (((_676 * (User_000.UserConstant_Z_000[12].y)) + (_675 * (User_000.UserConstant_Z_000[12].w))) + (((_673 * _673) * 0.1666666716337204f) * (((((_676 * _676) * _676) - _676) * (User_000.UserConstant_Z_000[15].x)) + ((((_675 * _675) * _675) - _675) * (User_000.UserConstant_Z_000[15].y)))));
        }
      }
      if (!(!(_629 <= (User_000.UserConstant_Z_000[12].x)))) {
        _762 = max(9.999999974752427e-07f, (User_000.UserConstant_Z_000[12].x));
        _763 = _629 / _762;
        _862 = ((((_762 * _762) * ((User_000.UserConstant_Z_000[15].x) * 0.1666666716337204f)) * (((_763 * _763) * _763) - _763)) + (_763 * (User_000.UserConstant_Z_000[12].y)));
      } else {
        if (!(_629 <= (User_000.UserConstant_Z_000[12].z))) {
          if (!(_629 <= (User_000.UserConstant_Z_000[14].x))) {
            if (!(_629 <= (User_000.UserConstant_Z_000[14].z))) {
              _846 = 1.0f - (User_000.UserConstant_Z_000[14].z);
              _849 = (_629 - (User_000.UserConstant_Z_000[14].z)) / max(9.999999974752427e-07f, _846);
              _850 = 1.0f - _849;
              _862 = (((_850 * (User_000.UserConstant_Z_000[14].w)) + _849) + (((_846 * _846) * ((User_000.UserConstant_Z_000[15].w) * 0.1666666716337204f)) * (((_850 * _850) * _850) - _850)));
            } else {
              _825 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[14].z) - (User_000.UserConstant_Z_000[14].x)));
              _827 = (_629 - (User_000.UserConstant_Z_000[14].x)) / _825;
              _828 = 1.0f - _827;
              _862 = (((_828 * (User_000.UserConstant_Z_000[14].y)) + (_827 * (User_000.UserConstant_Z_000[14].w))) + (((_825 * _825) * 0.1666666716337204f) * (((((_828 * _828) * _828) - _828) * (User_000.UserConstant_Z_000[15].z)) + ((((_827 * _827) * _827) - _827) * (User_000.UserConstant_Z_000[15].w)))));
            }
          } else {
            _801 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[14].x) - (User_000.UserConstant_Z_000[12].z)));
            _803 = (_629 - (User_000.UserConstant_Z_000[12].z)) / _801;
            _804 = 1.0f - _803;
            _862 = (((_804 * (User_000.UserConstant_Z_000[12].w)) + (_803 * (User_000.UserConstant_Z_000[14].y))) + (((_801 * _801) * 0.1666666716337204f) * (((((_804 * _804) * _804) - _804) * (User_000.UserConstant_Z_000[15].y)) + ((((_803 * _803) * _803) - _803) * (User_000.UserConstant_Z_000[15].z)))));
          }
        } else {
          _777 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[12].z) - (User_000.UserConstant_Z_000[12].x)));
          _779 = (_629 - (User_000.UserConstant_Z_000[12].x)) / _777;
          _780 = 1.0f - _779;
          _862 = (((_780 * (User_000.UserConstant_Z_000[12].y)) + (_779 * (User_000.UserConstant_Z_000[12].w))) + (((_777 * _777) * 0.1666666716337204f) * (((((_780 * _780) * _780) - _780) * (User_000.UserConstant_Z_000[15].x)) + ((((_779 * _779) * _779) - _779) * (User_000.UserConstant_Z_000[15].y)))));
        }
      }
      if (!(!(_630 <= (User_000.UserConstant_Z_000[12].x)))) {
        _866 = max(9.999999974752427e-07f, (User_000.UserConstant_Z_000[12].x));
        _867 = _630 / _866;
        _966 = ((((_866 * _866) * ((User_000.UserConstant_Z_000[15].x) * 0.1666666716337204f)) * (((_867 * _867) * _867) - _867)) + (_867 * (User_000.UserConstant_Z_000[12].y)));
      } else {
        if (!(_630 <= (User_000.UserConstant_Z_000[12].z))) {
          if (!(_630 <= (User_000.UserConstant_Z_000[14].x))) {
            if (!(_630 <= (User_000.UserConstant_Z_000[14].z))) {
              _950 = 1.0f - (User_000.UserConstant_Z_000[14].z);
              _953 = (_630 - (User_000.UserConstant_Z_000[14].z)) / max(9.999999974752427e-07f, _950);
              _954 = 1.0f - _953;
              _966 = (((_954 * (User_000.UserConstant_Z_000[14].w)) + _953) + (((_950 * _950) * ((User_000.UserConstant_Z_000[15].w) * 0.1666666716337204f)) * (((_954 * _954) * _954) - _954)));
            } else {
              _929 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[14].z) - (User_000.UserConstant_Z_000[14].x)));
              _931 = (_630 - (User_000.UserConstant_Z_000[14].x)) / _929;
              _932 = 1.0f - _931;
              _966 = (((_932 * (User_000.UserConstant_Z_000[14].y)) + (_931 * (User_000.UserConstant_Z_000[14].w))) + (((_929 * _929) * 0.1666666716337204f) * (((((_932 * _932) * _932) - _932) * (User_000.UserConstant_Z_000[15].z)) + ((((_931 * _931) * _931) - _931) * (User_000.UserConstant_Z_000[15].w)))));
            }
          } else {
            _905 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[14].x) - (User_000.UserConstant_Z_000[12].z)));
            _907 = (_630 - (User_000.UserConstant_Z_000[12].z)) / _905;
            _908 = 1.0f - _907;
            _966 = (((_908 * (User_000.UserConstant_Z_000[12].w)) + (_907 * (User_000.UserConstant_Z_000[14].y))) + (((_905 * _905) * 0.1666666716337204f) * (((((_908 * _908) * _908) - _908) * (User_000.UserConstant_Z_000[15].y)) + ((((_907 * _907) * _907) - _907) * (User_000.UserConstant_Z_000[15].z)))));
          }
        } else {
          _881 = max(9.999999974752427e-07f, ((User_000.UserConstant_Z_000[12].z) - (User_000.UserConstant_Z_000[12].x)));
          _883 = (_630 - (User_000.UserConstant_Z_000[12].x)) / _881;
          _884 = 1.0f - _883;
          _966 = (((_884 * (User_000.UserConstant_Z_000[12].y)) + (_883 * (User_000.UserConstant_Z_000[12].w))) + (((_881 * _881) * 0.1666666716337204f) * (((((_884 * _884) * _884) - _884) * (User_000.UserConstant_Z_000[15].x)) + ((((_883 * _883) * _883) - _883) * (User_000.UserConstant_Z_000[15].y)))));
        }
      }
      _969 = saturate(_758);
      _970 = saturate(_862);
      _971 = saturate(_966);
    } else {
      _969 = _628;
      _970 = _629;
      _971 = _630;
    }
    if (!((_637 & 2) == 0)) {
      _982 = saturate(1.0f - dot(float3(sqrt(_969), sqrt(_970), sqrt(_971)), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f)));
    } else {
      _982 = 1.0f;
    }
    if ((_637 & 8) == 0) {
      if (!((_637 & 4) == 0)) {
        if ((_637 & 16) == 0) {
          if (!(_982 == 0.0f)) {
            t2.GetDimensions(_1048.x, _1048.y);
            _1051 = (float)((uint)_1048.y);
            _1052 = _1051 + -1.0f;
            _1053 = (float)((uint)_1048.x);
            _1057 = ((_1052 / _1053) * _969) + (0.5f / _1053);
            _1061 = ((_1052 / _1051) * _970) + (0.5f / _1051);
            _1062 = _1052 * _971;
            _1063 = floor(_1062);
            _1064 = frac(_1062);
            _1071 = t2.Sample(s0, float2(((_1063 / _1051) + _1057), _1061));
            _1075 = t2.Sample(s0, float2((((_1063 + 1.0f) / _1051) + _1057), _1061));
            _1085 = saturate(abs(User_000.UserConstant_Z_000[13].x)) * _982;
            _1099 = ((((_1071.x - _969) + ((_1075.x - _1071.x) * _1064)) * _1085) + _969);
            _1100 = ((((_1071.y - _970) + ((_1075.y - _1071.y) * _1064)) * _1085) + _970);
            _1101 = ((((_1071.z - _971) + ((_1075.z - _1071.z) * _1064)) * _1085) + _971);
          } else {
            _1099 = _969;
            _1100 = _970;
            _1101 = _971;
          }
        } else {
          _999 = (_970 < _971);
          _1000 = select(_999, _971, _970);
          _1002 = (_969 < _1000);
          _1003 = select(_1002, _1000, _969);
          _1020 = max(saturate(1.0f - (User_000.UserConstant_Z_000[13].z)), (2.0f - exp2(log2(max(saturate(((_1003 - min(select(_1002, _969, _1000), select(_999, _970, _971))) / (_1003 + 1.000000013351432e-10f)) - (User_000.UserConstant_Z_000[13].y)), 9.999999974752427e-07f)) * select(((((User_000.UserConstant_Z_000[13].x) * 0.5f) + 0.5f) < 0.5f), (User_000.UserConstant_Z_000[13].x), ((User_000.UserConstant_Z_000[13].x) * 5.0f)))));
          _1021 = dot(float3(_969, _970, _971), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
          _1099 = ((((_1021 - _969) + ((_969 - _1021) * _1020)) * _982) + _969);
          _1100 = ((((_1021 - _970) + ((_970 - _1021) * _1020)) * _982) + _970);
          _1101 = ((((_1021 - _971) + ((_971 - _1021) * _1020)) * _982) + _971);
        }
      } else {
        _1099 = _969;
        _1100 = _970;
        _1101 = _971;
      }
    } else {
      _1099 = _982;
      _1100 = _982;
      _1101 = _982;
    }
  } else {
    _1099 = _628;
    _1100 = _629;
    _1101 = _630;
  }
  u0[int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y), (int)(SV_DispatchThreadID.z))] = float4(_1099, _1100, _1101, 1.0f);
}