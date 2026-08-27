#include "../shared.h"
#include "../test30.hlsl"

struct UserConstant_Z {
  float4 UserConstant_Z_000[84];
};

Texture2D<float2> t0 : register(t0);

Texture2D<float3> t2 : register(t2);

RWTexture3D<float4> u0 : register(u0);

cbuffer cb0 : register(b0) { UserConstant_Z User_000 : packoffset(c000.x); };

SamplerState s0 : register(s0);

static const float RESONANCE_LUT_LINEAR_SCALE = 335.718017578125f;
static const float RESONANCE_LUT_LOG_SCALE = 0.07434873282909393f;

// DXIL FirstbitHi: returns bit position counting from MSB (leading zeros count)
uint firstbithigh_msb(int value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}
uint firstbithigh_msb(uint value) {
  return (value == 0) ? 0xFFFFFFFF : (31u - firstbithigh(value));
}

[numthreads(4, 4, 4)] void main(uint3 SV_DispatchThreadID : SV_DispatchThreadID,
                                uint3 SV_GroupID : SV_GroupID,
                                uint3 SV_GroupThreadID : SV_GroupThreadID,
                                uint SV_GroupIndex : SV_GroupIndex) {
  float _15;
  float _16;
  float _17;
  float _18;
  float _28;
  float _32;
  float _33;
  float _34;
  float _43;
  float _49;
  float _52;
  float _57;
  float _67;
  float _71;
  float _72;
  float _73;
  float _82;
  float _88;
  float _91;
  float _96;
  float _106;
  float _110;
  float _111;
  float _112;
  float _121;
  float _127;
  float _130;
  float _135;
  float _144;
  float _146;
  bool _151;
  float _154;
  float _155;
  float _156;
  float _157;
  float _244;
  float _245;
  float _246;
  float _247;
  float _325;
  float _326;
  float _327;
  float _328;
  float _481;
  float _482;
  float _483;
  float _521;
  float _532;
  float _704;
  float _808;
  float _912;
  float _915;
  float _916;
  float _917;
  float _928;
  float _1045;
  float _1046;
  float _1047;
  bool _158;
  float _159;
  float _161;
  float _163;
  float _171;
  float _172;
  float _203;
  float _204;
  float _205;
  float _208;
  float _220;
  float _223;
  float _225;
  float _226;
  float _227;
  float _232;
  float _233;
  float _239;
  bool _248;
  float _249;
  float _251;
  float _253;
  float _261;
  float _262;
  float _293;
  float _294;
  float _295;
  float _298;
  float _306;
  float _307;
  float _308;
  float _313;
  float _314;
  float _320;
  bool _329;
  float _330;
  float _332;
  float _334;
  float _342;
  float _343;
  float _374;
  float _375;
  float _376;
  float _379;
  float _387;
  float _388;
  float _389;
  float _394;
  float _395;
  float _398;
  float _406;
  float _407;
  float _408;
  float _413;
  float _414;
  float _415;
  float _417;
  float _418;
  float _419;
  float _420;
  float _421;
  float _422;
  float _424;
  float _425;
  float _426;
  float _428;
  float _493;
  float _494;
  float _495;
  float _498;
  float _501;
  float _504;
  float _511;
  bool _513;
  float _524;
  float _525;
  float _538;
  float _574;
  float _575;
  float _576;
  int _583;
  float _604;
  float _605;
  float _619;
  float _621;
  float _622;
  float _643;
  float _645;
  float _646;
  float _667;
  float _669;
  float _670;
  float _688;
  float _691;
  float _692;
  float _708;
  float _709;
  float _723;
  float _725;
  float _726;
  float _747;
  float _749;
  float _750;
  float _771;
  float _773;
  float _774;
  float _792;
  float _795;
  float _796;
  float _812;
  float _813;
  float _827;
  float _829;
  float _830;
  float _851;
  float _853;
  float _854;
  float _875;
  float _877;
  float _878;
  float _896;
  float _899;
  float _900;
  bool _945;
  float _946;
  bool _948;
  float _949;
  float _966;
  float _967;
  uint2 _994;
  float _997;
  float _998;
  float _999;
  float _1003;
  float _1007;
  float _1008;
  float _1009;
  float _1010;
  float3 _1017;
  float3 _1021;
  float _1031;
  _15 = (User_000.UserConstant_Z_000[2].w) + -1.0f;
  _16 = ((float)((uint)SV_DispatchThreadID.x)) / _15;
  _17 = ((float)((uint)SV_DispatchThreadID.y)) / _15;
  _18 = ((float)((uint)SV_DispatchThreadID.z)) / _15;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    // The generated 3D LUT is addressed and stored in the game's normalized
    // log domain. Decode the grid point before feeding linear BT.709 to
    // PsychoV.
    float3 untonemapped =
        (exp2(float3(_16, _17, _18) / RESONANCE_LUT_LOG_SCALE) - 1.f.xxx) /
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

  _28 = (pow(User_000.UserConstant_Z_000[6].x, 2.4094207286834717f));
  _32 = (User_000.UserConstant_Z_000[5].x) - _16;
  _33 = (User_000.UserConstant_Z_000[5].y) - _17;
  _34 = (User_000.UserConstant_Z_000[5].z) - _18;
  _43 = saturate(1.0f - _28);
  _49 = saturate(max((_28 + 9.999999747378752e-06f),
                     (((_43 * _43) * (pow(User_000.UserConstant_Z_000[6].y,
                                          2.4094207286834717f))) +
                      _28)));
  _52 = saturate(min((_49 + -9.999999747378752e-06f), _28));
  _57 = 1.0f - saturate(((sqrt(((_32 * _32) + (_33 * _33)) + (_34 * _34)) *
                          0.5773502588272095f) -
                         _52) /
                        (_49 - _52));
  _67 = (pow(User_000.UserConstant_Z_000[8].x, 2.4094207286834717f));
  _71 = (User_000.UserConstant_Z_000[7].x) - _16;
  _72 = (User_000.UserConstant_Z_000[7].y) - _17;
  _73 = (User_000.UserConstant_Z_000[7].z) - _18;
  _82 = saturate(1.0f - _67);
  _88 = saturate(max((_67 + 9.999999747378752e-06f),
                     (((_82 * _82) * (pow(User_000.UserConstant_Z_000[8].y,
                                          2.4094207286834717f))) +
                      _67)));
  _91 = saturate(min((_88 + -9.999999747378752e-06f), _67));
  _96 = 1.0f - saturate(((sqrt(((_71 * _71) + (_72 * _72)) + (_73 * _73)) *
                          0.5773502588272095f) -
                         _91) /
                        (_88 - _91));
  _106 = (pow(User_000.UserConstant_Z_000[10].x, 2.4094207286834717f));
  _110 = (User_000.UserConstant_Z_000[9].x) - _16;
  _111 = (User_000.UserConstant_Z_000[9].y) - _17;
  _112 = (User_000.UserConstant_Z_000[9].z) - _18;
  _121 = saturate(1.0f - _106);
  _127 = saturate(max((_106 + 9.999999747378752e-06f),
                      (((_121 * _121) * (pow(User_000.UserConstant_Z_000[10].y,
                                             2.4094207286834717f))) +
                       _106)));
  _130 = saturate(min((_127 + -9.999999747378752e-06f), _106));
  _135 =
      1.0f - saturate(((sqrt(((_110 * _110) + (_111 * _111)) + (_112 * _112)) *
                        0.5773502588272095f) -
                       _130) /
                      (_127 - _130));
  _144 = 1.0f - (User_000.UserConstant_Z_000[0].y);
  _146 = (_144 * _57) + (User_000.UserConstant_Z_000[0].y);
  _151 = (_17 < _18);
  if (_151) {
    _154 = _18;
    _155 = _17;
    _156 = -1.0f;
    _157 = 0.6666666865348816f;
  } else {
    _154 = _17;
    _155 = _18;
    _156 = 0.0f;
    _157 = -0.3333333432674408f;
  }
  _158 = (_16 < _154);
  _159 = select(_158, _154, _16);
  _161 = select(_158, _16, _154);
  _163 = _159 - min(_161, _155);
  _171 = _163 / (_159 + 1.000000013351432e-10f);
  _172 = abs(((_161 - _155) / ((_163 * 6.0f) + 1.000000013351432e-10f)) +
             select(_158, _157, _156)) +
         (User_000.UserConstant_Z_000[6].z);
  _203 = (((saturate(abs((frac(_172 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) *
           _171) +
          1.0f) *
         _159;
  _204 = (((saturate(abs((frac(_172 + 0.6666666865348816f) * 6.0f) + -3.0f) +
                     -1.0f) +
            -1.0f) *
           _171) +
          1.0f) *
         _159;
  _205 = (((saturate(abs((frac(_172 + 0.3333333432674408f) * 6.0f) + -3.0f) +
                     -1.0f) +
            -1.0f) *
           _171) +
          1.0f) *
         _159;
  _208 = mad(0.0722000002861023f, _205,
             mad(0.7152000069618225f, _204, (_203 * 0.2125999927520752f)));
  _220 = mad(0.4359999895095825f, (User_000.UserConstant_Z_000[1].z),
             mad(-0.33608999848365784f, (User_000.UserConstant_Z_000[1].y),
                 ((User_000.UserConstant_Z_000[1].x) * -0.09990999847650528f)));
  _223 = mad(-0.05638999864459038f, (User_000.UserConstant_Z_000[1].z),
             mad(-0.5586100220680237f, (User_000.UserConstant_Z_000[1].y),
                 ((User_000.UserConstant_Z_000[1].x) * 0.6150000095367432f)));
  _225 = saturate(_208 * ((User_000.UserConstant_Z_000[1].w) -
                          ((User_000.UserConstant_Z_000[1].w) * _57)));
  _226 = mad(0.4359999895095825f, _205,
             mad(-0.33608999848365784f, _204, (_203 * -0.09990999847650528f))) *
         _146;
  _227 = mad(-0.05638999864459038f, _205,
             mad(-0.5586100220680237f, _204, (_203 * 0.6150000095367432f))) *
         _146;
  _232 = (_225 * (_220 - _226)) + _226;
  _233 = (_225 * (_223 - _227)) + _227;
  _239 = (_144 * _96) + (User_000.UserConstant_Z_000[0].y);
  if (_151) {
    _244 = _18;
    _245 = _17;
    _246 = -1.0f;
    _247 = 0.6666666865348816f;
  } else {
    _244 = _17;
    _245 = _18;
    _246 = 0.0f;
    _247 = -0.3333333432674408f;
  }
  _248 = (_16 < _244);
  _249 = select(_248, _244, _16);
  _251 = select(_248, _16, _244);
  _253 = _249 - min(_251, _245);
  _261 = _253 / (_249 + 1.000000013351432e-10f);
  _262 = abs(((_251 - _245) / ((_253 * 6.0f) + 1.000000013351432e-10f)) +
             select(_248, _247, _246)) +
         (User_000.UserConstant_Z_000[8].z);
  _293 = (((saturate(abs((frac(_262 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) *
           _261) +
          1.0f) *
         _249;
  _294 = (((saturate(abs((frac(_262 + 0.6666666865348816f) * 6.0f) + -3.0f) +
                     -1.0f) +
            -1.0f) *
           _261) +
          1.0f) *
         _249;
  _295 = (((saturate(abs((frac(_262 + 0.3333333432674408f) * 6.0f) + -3.0f) +
                     -1.0f) +
            -1.0f) *
           _261) +
          1.0f) *
         _249;
  _298 = mad(0.0722000002861023f, _295,
             mad(0.7152000069618225f, _294, (_293 * 0.2125999927520752f)));
  _306 = saturate(_298 * ((User_000.UserConstant_Z_000[1].w) -
                          ((User_000.UserConstant_Z_000[1].w) * _96)));
  _307 = mad(0.4359999895095825f, _295,
             mad(-0.33608999848365784f, _294, (_293 * -0.09990999847650528f))) *
         _239;
  _308 = mad(-0.05638999864459038f, _295,
             mad(-0.5586100220680237f, _294, (_293 * 0.6150000095367432f))) *
         _239;
  _313 = (_306 * (_220 - _307)) + _307;
  _314 = ((_223 - _308) * _306) + _308;
  _320 = (_144 * _135) + (User_000.UserConstant_Z_000[0].y);
  if (_151) {
    _325 = _18;
    _326 = _17;
    _327 = -1.0f;
    _328 = 0.6666666865348816f;
  } else {
    _325 = _17;
    _326 = _18;
    _327 = 0.0f;
    _328 = -0.3333333432674408f;
  }
  _329 = (_16 < _325);
  _330 = select(_329, _325, _16);
  _332 = select(_329, _16, _325);
  _334 = _330 - min(_332, _326);
  _342 = _334 / (_330 + 1.000000013351432e-10f);
  _343 = abs(((_332 - _326) / ((_334 * 6.0f) + 1.000000013351432e-10f)) +
             select(_329, _328, _327)) +
         (User_000.UserConstant_Z_000[10].z);
  _374 = (((saturate(abs((frac(_343 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) *
           _342) +
          1.0f) *
         _330;
  _375 = (((saturate(abs((frac(_343 + 0.6666666865348816f) * 6.0f) + -3.0f) +
                     -1.0f) +
            -1.0f) *
           _342) +
          1.0f) *
         _330;
  _376 = (((saturate(abs((frac(_343 + 0.3333333432674408f) * 6.0f) + -3.0f) +
                     -1.0f) +
            -1.0f) *
           _342) +
          1.0f) *
         _330;
  _379 = mad(0.0722000002861023f, _376,
             mad(0.7152000069618225f, _375, (_374 * 0.2125999927520752f)));
  _387 = saturate(_379 * ((User_000.UserConstant_Z_000[1].w) -
                          ((User_000.UserConstant_Z_000[1].w) * _135)));
  _388 = mad(0.4359999895095825f, _376,
             mad(-0.33608999848365784f, _375, (_374 * -0.09990999847650528f))) *
         _320;
  _389 = mad(-0.05638999864459038f, _376,
             mad(-0.5586100220680237f, _375, (_374 * 0.6150000095367432f))) *
         _320;
  _394 = (_387 * (_220 - _388)) + _388;
  _395 = ((_223 - _389) * _387) + _389;
  _398 = mad(0.0722000002861023f, _18,
             mad(0.7152000069618225f, _17, (_16 * 0.2125999927520752f)));
  _406 = saturate(_398 * (User_000.UserConstant_Z_000[1].w));
  _407 = mad(0.4359999895095825f, _18,
             mad(-0.33608999848365784f, _17, (_16 * -0.09990999847650528f))) *
         (User_000.UserConstant_Z_000[0].y);
  _408 = mad(-0.05638999864459038f, _18,
             mad(-0.5586100220680237f, _17, (_16 * 0.6150000095367432f))) *
         (User_000.UserConstant_Z_000[0].y);
  _413 = (_406 * (_220 - _407)) + _407;
  _414 = ((_223 - _408) * _406) + _408;
  _415 = mad(1.280329942703247f, _414, _398);
  _417 = mad(-0.3805899918079376f, _414, mad(-0.214819997549057f, _413, _398));
  _418 = mad(2.1279799938201904f, _413, _398);
  _419 = saturate(User_000.UserConstant_Z_000[6].w);
  _420 = _419 * _57;
  _421 = saturate(User_000.UserConstant_Z_000[8].w);
  _422 = _421 * _96;
  _424 = saturate(User_000.UserConstant_Z_000[10].w);
  _425 = _424 * _135;
  _426 = (_422 + _420) + _425;
  _428 = saturate(_426 * 4.0f);
  if (_426 > 0.0f) {
    _481 = ((((((_421 * (mad(1.280329942703247f, _314, _298) - _415)) + _415) *
               _422) +
              (((_419 * (mad(1.280329942703247f, _233, _208) - _415)) + _415) *
               _420)) +
             ((((mad(1.280329942703247f, _395, _379) - _415) * _424) + _415) *
              _425)) /
            _426);
    _482 = ((((((_421 * (mad(-0.3805899918079376f, _314,
                             mad(-0.214819997549057f, _313, _298)) -
                         _417)) +
                _417) *
               _422) +
              (((_419 * (mad(-0.3805899918079376f, _233,
                             mad(-0.214819997549057f, _232, _208)) -
                         _417)) +
                _417) *
               _420)) +
             ((((mad(-0.3805899918079376f, _395,
                     mad(-0.214819997549057f, _394, _379)) -
                 _417) *
                _424) +
               _417) *
              _425)) /
            _426);
    _483 = ((((((_421 * (mad(2.1279799938201904f, _313, _298) - _418)) + _418) *
               _422) +
              (((_419 * (mad(2.1279799938201904f, _232, _208) - _418)) + _418) *
               _420)) +
             ((((mad(2.1279799938201904f, _394, _379) - _418) * _424) + _418) *
              _425)) /
            _426);
  } else {
    _481 = 0.0f;
    _482 = 0.0f;
    _483 = 0.0f;
  }
  _493 = saturate(lerp(_415, _481, _428));
  _494 = saturate(lerp(_417, _482, _428));
  _495 = saturate(lerp(_418, _483, _428));
  _498 = mad(0.0722000002861023f, _495,
             mad(0.7152000069618225f, _494, (_493 * 0.2125999927520752f)));
  _501 = mad(0.4359999895095825f, _495,
             mad(-0.33608999848365784f, _494, (_493 * -0.09990999847650528f)));
  _504 = mad(-0.05638999864459038f, _495,
             mad(-0.5586100220680237f, _494, (_493 * 0.6150000095367432f)));
  _511 = log2(((((float2)(t0.Load(int3(0, 0, 0)))).y) * 335.718017578125f) +
              1.0f) *
         0.07434873282909393f;
  _513 = (_498 < _511);
  if (_513) {
    _521 = (_498 / _511);
  } else {
    _521 = ((1.0f - _498) / (1.0f - _511));
  }
  _524 = exp2(log2(_521) * (User_000.UserConstant_Z_000[0].z));
  _525 = _524 * _511;
  if (!_513) {
    _532 = ((((_525 - _524) * _511) / _511) + 1.0f);
  } else {
    _532 = _525;
  }
  _538 = 1.0f / (User_000.UserConstant_Z_000[0].x);
  _574 = exp2(log2(max((exp2(log2(mad(1.280329942703247f, _504, _532)) * _538) -
                        (User_000.UserConstant_Z_000[2].x)),
                       0.0f)) *
              (User_000.UserConstant_Z_000[4].x)) *
         (User_000.UserConstant_Z_000[3].x);
  _575 = exp2(log2(max((exp2(log2(mad(-0.3805899918079376f, _504,
                                      mad(-0.214819997549057f, _501, _532))) *
                             _538) -
                        (User_000.UserConstant_Z_000[2].y)),
                       0.0f)) *
              (User_000.UserConstant_Z_000[4].y)) *
         (User_000.UserConstant_Z_000[3].y);
  _576 =
      exp2(log2(max((exp2(log2(mad(2.1279799938201904f, _501, _532)) * _538) -
                     (User_000.UserConstant_Z_000[2].z)),
                    0.0f)) *
           (User_000.UserConstant_Z_000[4].z)) *
      (User_000.UserConstant_Z_000[3].z);
  if (!(asint((User_000.UserConstant_Z_000[11].x)) == 0)) {
    _583 = asint((User_000.UserConstant_Z_000[11].y));
    if (!((_583 & 1) == 0)) {
      if (!(!(_574 <= (User_000.UserConstant_Z_000[12].x)))) {
        _604 = max(9.999999974752427e-07f, (User_000.UserConstant_Z_000[12].x));
        _605 = _574 / _604;
        _704 = ((((_604 * _604) *
                  ((User_000.UserConstant_Z_000[15].x) * 0.1666666716337204f)) *
                 (((_605 * _605) * _605) - _605)) +
                (_605 * (User_000.UserConstant_Z_000[12].y)));
      } else {
        if (!(_574 <= (User_000.UserConstant_Z_000[12].z))) {
          if (!(_574 <= (User_000.UserConstant_Z_000[14].x))) {
            if (!(_574 <= (User_000.UserConstant_Z_000[14].z))) {
              _688 = 1.0f - (User_000.UserConstant_Z_000[14].z);
              _691 = (_574 - (User_000.UserConstant_Z_000[14].z)) /
                     max(9.999999974752427e-07f, _688);
              _692 = 1.0f - _691;
              _704 = (((_692 * (User_000.UserConstant_Z_000[14].w)) + _691) +
                      (((_688 * _688) * ((User_000.UserConstant_Z_000[15].w) *
                                         0.1666666716337204f)) *
                       (((_692 * _692) * _692) - _692)));
            } else {
              _667 = max(9.999999974752427e-07f,
                         ((User_000.UserConstant_Z_000[14].z) -
                          (User_000.UserConstant_Z_000[14].x)));
              _669 = (_574 - (User_000.UserConstant_Z_000[14].x)) / _667;
              _670 = 1.0f - _669;
              _704 = (((_670 * (User_000.UserConstant_Z_000[14].y)) +
                       (_669 * (User_000.UserConstant_Z_000[14].w))) +
                      (((_667 * _667) * 0.1666666716337204f) *
                       (((((_670 * _670) * _670) - _670) *
                         (User_000.UserConstant_Z_000[15].z)) +
                        ((((_669 * _669) * _669) - _669) *
                         (User_000.UserConstant_Z_000[15].w)))));
            }
          } else {
            _643 = max(9.999999974752427e-07f,
                       ((User_000.UserConstant_Z_000[14].x) -
                        (User_000.UserConstant_Z_000[12].z)));
            _645 = (_574 - (User_000.UserConstant_Z_000[12].z)) / _643;
            _646 = 1.0f - _645;
            _704 = (((_646 * (User_000.UserConstant_Z_000[12].w)) +
                     (_645 * (User_000.UserConstant_Z_000[14].y))) +
                    (((_643 * _643) * 0.1666666716337204f) *
                     (((((_646 * _646) * _646) - _646) *
                       (User_000.UserConstant_Z_000[15].y)) +
                      ((((_645 * _645) * _645) - _645) *
                       (User_000.UserConstant_Z_000[15].z)))));
          }
        } else {
          _619 = max(9.999999974752427e-07f,
                     ((User_000.UserConstant_Z_000[12].z) -
                      (User_000.UserConstant_Z_000[12].x)));
          _621 = (_574 - (User_000.UserConstant_Z_000[12].x)) / _619;
          _622 = 1.0f - _621;
          _704 = (((_622 * (User_000.UserConstant_Z_000[12].y)) +
                   (_621 * (User_000.UserConstant_Z_000[12].w))) +
                  (((_619 * _619) * 0.1666666716337204f) *
                   (((((_622 * _622) * _622) - _622) *
                     (User_000.UserConstant_Z_000[15].x)) +
                    ((((_621 * _621) * _621) - _621) *
                     (User_000.UserConstant_Z_000[15].y)))));
        }
      }
      if (!(!(_575 <= (User_000.UserConstant_Z_000[12].x)))) {
        _708 = max(9.999999974752427e-07f, (User_000.UserConstant_Z_000[12].x));
        _709 = _575 / _708;
        _808 = ((((_708 * _708) *
                  ((User_000.UserConstant_Z_000[15].x) * 0.1666666716337204f)) *
                 (((_709 * _709) * _709) - _709)) +
                (_709 * (User_000.UserConstant_Z_000[12].y)));
      } else {
        if (!(_575 <= (User_000.UserConstant_Z_000[12].z))) {
          if (!(_575 <= (User_000.UserConstant_Z_000[14].x))) {
            if (!(_575 <= (User_000.UserConstant_Z_000[14].z))) {
              _792 = 1.0f - (User_000.UserConstant_Z_000[14].z);
              _795 = (_575 - (User_000.UserConstant_Z_000[14].z)) /
                     max(9.999999974752427e-07f, _792);
              _796 = 1.0f - _795;
              _808 = (((_796 * (User_000.UserConstant_Z_000[14].w)) + _795) +
                      (((_792 * _792) * ((User_000.UserConstant_Z_000[15].w) *
                                         0.1666666716337204f)) *
                       (((_796 * _796) * _796) - _796)));
            } else {
              _771 = max(9.999999974752427e-07f,
                         ((User_000.UserConstant_Z_000[14].z) -
                          (User_000.UserConstant_Z_000[14].x)));
              _773 = (_575 - (User_000.UserConstant_Z_000[14].x)) / _771;
              _774 = 1.0f - _773;
              _808 = (((_774 * (User_000.UserConstant_Z_000[14].y)) +
                       (_773 * (User_000.UserConstant_Z_000[14].w))) +
                      (((_771 * _771) * 0.1666666716337204f) *
                       (((((_774 * _774) * _774) - _774) *
                         (User_000.UserConstant_Z_000[15].z)) +
                        ((((_773 * _773) * _773) - _773) *
                         (User_000.UserConstant_Z_000[15].w)))));
            }
          } else {
            _747 = max(9.999999974752427e-07f,
                       ((User_000.UserConstant_Z_000[14].x) -
                        (User_000.UserConstant_Z_000[12].z)));
            _749 = (_575 - (User_000.UserConstant_Z_000[12].z)) / _747;
            _750 = 1.0f - _749;
            _808 = (((_750 * (User_000.UserConstant_Z_000[12].w)) +
                     (_749 * (User_000.UserConstant_Z_000[14].y))) +
                    (((_747 * _747) * 0.1666666716337204f) *
                     (((((_750 * _750) * _750) - _750) *
                       (User_000.UserConstant_Z_000[15].y)) +
                      ((((_749 * _749) * _749) - _749) *
                       (User_000.UserConstant_Z_000[15].z)))));
          }
        } else {
          _723 = max(9.999999974752427e-07f,
                     ((User_000.UserConstant_Z_000[12].z) -
                      (User_000.UserConstant_Z_000[12].x)));
          _725 = (_575 - (User_000.UserConstant_Z_000[12].x)) / _723;
          _726 = 1.0f - _725;
          _808 = (((_726 * (User_000.UserConstant_Z_000[12].y)) +
                   (_725 * (User_000.UserConstant_Z_000[12].w))) +
                  (((_723 * _723) * 0.1666666716337204f) *
                   (((((_726 * _726) * _726) - _726) *
                     (User_000.UserConstant_Z_000[15].x)) +
                    ((((_725 * _725) * _725) - _725) *
                     (User_000.UserConstant_Z_000[15].y)))));
        }
      }
      if (!(!(_576 <= (User_000.UserConstant_Z_000[12].x)))) {
        _812 = max(9.999999974752427e-07f, (User_000.UserConstant_Z_000[12].x));
        _813 = _576 / _812;
        _912 = ((((_812 * _812) *
                  ((User_000.UserConstant_Z_000[15].x) * 0.1666666716337204f)) *
                 (((_813 * _813) * _813) - _813)) +
                (_813 * (User_000.UserConstant_Z_000[12].y)));
      } else {
        if (!(_576 <= (User_000.UserConstant_Z_000[12].z))) {
          if (!(_576 <= (User_000.UserConstant_Z_000[14].x))) {
            if (!(_576 <= (User_000.UserConstant_Z_000[14].z))) {
              _896 = 1.0f - (User_000.UserConstant_Z_000[14].z);
              _899 = (_576 - (User_000.UserConstant_Z_000[14].z)) /
                     max(9.999999974752427e-07f, _896);
              _900 = 1.0f - _899;
              _912 = (((_900 * (User_000.UserConstant_Z_000[14].w)) + _899) +
                      (((_896 * _896) * ((User_000.UserConstant_Z_000[15].w) *
                                         0.1666666716337204f)) *
                       (((_900 * _900) * _900) - _900)));
            } else {
              _875 = max(9.999999974752427e-07f,
                         ((User_000.UserConstant_Z_000[14].z) -
                          (User_000.UserConstant_Z_000[14].x)));
              _877 = (_576 - (User_000.UserConstant_Z_000[14].x)) / _875;
              _878 = 1.0f - _877;
              _912 = (((_878 * (User_000.UserConstant_Z_000[14].y)) +
                       (_877 * (User_000.UserConstant_Z_000[14].w))) +
                      (((_875 * _875) * 0.1666666716337204f) *
                       (((((_878 * _878) * _878) - _878) *
                         (User_000.UserConstant_Z_000[15].z)) +
                        ((((_877 * _877) * _877) - _877) *
                         (User_000.UserConstant_Z_000[15].w)))));
            }
          } else {
            _851 = max(9.999999974752427e-07f,
                       ((User_000.UserConstant_Z_000[14].x) -
                        (User_000.UserConstant_Z_000[12].z)));
            _853 = (_576 - (User_000.UserConstant_Z_000[12].z)) / _851;
            _854 = 1.0f - _853;
            _912 = (((_854 * (User_000.UserConstant_Z_000[12].w)) +
                     (_853 * (User_000.UserConstant_Z_000[14].y))) +
                    (((_851 * _851) * 0.1666666716337204f) *
                     (((((_854 * _854) * _854) - _854) *
                       (User_000.UserConstant_Z_000[15].y)) +
                      ((((_853 * _853) * _853) - _853) *
                       (User_000.UserConstant_Z_000[15].z)))));
          }
        } else {
          _827 = max(9.999999974752427e-07f,
                     ((User_000.UserConstant_Z_000[12].z) -
                      (User_000.UserConstant_Z_000[12].x)));
          _829 = (_576 - (User_000.UserConstant_Z_000[12].x)) / _827;
          _830 = 1.0f - _829;
          _912 = (((_830 * (User_000.UserConstant_Z_000[12].y)) +
                   (_829 * (User_000.UserConstant_Z_000[12].w))) +
                  (((_827 * _827) * 0.1666666716337204f) *
                   (((((_830 * _830) * _830) - _830) *
                     (User_000.UserConstant_Z_000[15].x)) +
                    ((((_829 * _829) * _829) - _829) *
                     (User_000.UserConstant_Z_000[15].y)))));
        }
      }
      _915 = saturate(_704);
      _916 = saturate(_808);
      _917 = saturate(_912);
    } else {
      _915 = _574;
      _916 = _575;
      _917 = _576;
    }
    if (!((_583 & 2) == 0)) {
      _928 =
          saturate(1.0f - dot(float3(sqrt(_915), sqrt(_916), sqrt(_917)),
                              float3(0.2125999927520752f, 0.7152000069618225f,
                                     0.0722000002861023f)));
    } else {
      _928 = 1.0f;
    }
    if ((_583 & 8) == 0) {
      if (!((_583 & 4) == 0)) {
        if ((_583 & 16) == 0) {
          if (!(_928 == 0.0f)) {
            t2.GetDimensions(_994.x, _994.y);
            _997 = (float)((uint)_994.y);
            _998 = _997 + -1.0f;
            _999 = (float)((uint)_994.x);
            _1003 = ((_998 / _999) * _915) + (0.5f / _999);
            _1007 = ((_998 / _997) * _916) + (0.5f / _997);
            _1008 = _998 * _917;
            _1009 = floor(_1008);
            _1010 = frac(_1008);
            _1017 = t2.Sample(s0, float2(((_1009 / _997) + _1003), _1007));
            _1021 =
                t2.Sample(s0, float2((((_1009 + 1.0f) / _997) + _1003), _1007));
            _1031 = saturate(abs(User_000.UserConstant_Z_000[13].x)) * _928;
            _1045 =
                ((((_1017.x - _915) + ((_1021.x - _1017.x) * _1010)) * _1031) +
                 _915);
            _1046 =
                ((((_1017.y - _916) + ((_1021.y - _1017.y) * _1010)) * _1031) +
                 _916);
            _1047 =
                ((((_1017.z - _917) + ((_1021.z - _1017.z) * _1010)) * _1031) +
                 _917);
          } else {
            _1045 = _915;
            _1046 = _916;
            _1047 = _917;
          }
        } else {
          _945 = (_916 < _917);
          _946 = select(_945, _917, _916);
          _948 = (_915 < _946);
          _949 = select(_948, _946, _915);
          _966 = max(
              saturate(1.0f - (User_000.UserConstant_Z_000[13].z)),
              (2.0f -
               exp2(log2(max(saturate(((_949 - min(select(_948, _915, _946),
                                                   select(_945, _916, _917))) /
                                       (_949 + 1.000000013351432e-10f)) -
                                      (User_000.UserConstant_Z_000[13].y)),
                             9.999999974752427e-07f)) *
                    select(((((User_000.UserConstant_Z_000[13].x) * 0.5f) +
                             0.5f) < 0.5f),
                           (User_000.UserConstant_Z_000[13].x),
                           ((User_000.UserConstant_Z_000[13].x) * 5.0f)))));
          _967 = dot(float3(_915, _916, _917),
                     float3(0.2125999927520752f, 0.7152000069618225f,
                            0.0722000002861023f));
          _1045 = ((((_967 - _915) + ((_915 - _967) * _966)) * _928) + _915);
          _1046 = ((((_967 - _916) + ((_916 - _967) * _966)) * _928) + _916);
          _1047 = ((((_967 - _917) + ((_917 - _967) * _966)) * _928) + _917);
        }
      } else {
        _1045 = _915;
        _1046 = _916;
        _1047 = _917;
      }
    } else {
      _1045 = _928;
      _1046 = _928;
      _1047 = _928;
    }
  } else {
    _1045 = _574;
    _1046 = _575;
    _1047 = _576;
  }
  u0[int3((int)(SV_DispatchThreadID.x), (int)(SV_DispatchThreadID.y),
          (int)(SV_DispatchThreadID.z))] = float4(_1045, _1046, _1047, 1.0f);
}


