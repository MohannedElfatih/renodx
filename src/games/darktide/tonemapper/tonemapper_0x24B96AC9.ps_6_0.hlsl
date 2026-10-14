/* Texture2D<float4> __tex_input_texture0 : register(t0);

Texture2D<float4> __tex_input_texture3 : register(t1);

Texture3D<float4> __tex_virtual_color_grading : register(t2);

Texture2D<float> current_exposure : register(t3);

cbuffer global_environment_settings : register(b0) {
  float minion_rimlight : packoffset(c000.x);
  float minion_glowing_eyes : packoffset(c000.y);
  float minion_environment_mask : packoffset(c000.z);
  float emissive_intensity : packoffset(c000.w);
  float global_roughness_multiplier : packoffset(c001.x);
  float metallic_roughness_multiplier : packoffset(c001.y);
  float non_metallic_roughness_multiplier : packoffset(c001.z);
  float global_reflectance_multiplier : packoffset(c001.w);
  float reflection_boost : packoffset(c002.x);
  float reflection_smooth_bias : packoffset(c002.y);
  float ambient_enabled : packoffset(c002.z);
  float3 global_ambient_tint : packoffset(c003.x);
  float3 local_ambient_tint : packoffset(c004.x);
  float ambient_depth_occlusion_enabled : packoffset(c004.w);
  float ambient_normal_weight_enabled : packoffset(c005.x);
  float2 specular_ao_intensity : packoffset(c005.y);
  float specular_ao_horizon_occlusion : packoffset(c005.w);
  float sun_enabled : packoffset(c006.x);
  float3 sun_direction : packoffset(c006.y);
  float3 sun_color : packoffset(c007.x);
  float sun_disk_enabled : packoffset(c007.w);
  float sun_disk_size : packoffset(c008.x);
  float3 local_shadow_map_bias : packoffset(c008.y);
  float3 sun_shadow_map_bias : packoffset(c009.x);
  float3 ssm_shadow_map_bias : packoffset(c010.x);
  float sun_shadows_enabled : packoffset(c010.w);
  float ssm_enabled : packoffset(c011.x);
  float skydome_u_offset : packoffset(c011.y);
  float skydome_intensity : packoffset(c011.z);
  float3 skydome_tint_color : packoffset(c012.x);
  float3 skydome_flow_direction : packoffset(c013.x);
  float skydome_flow_speed : packoffset(c013.w);
  float skydome_flow_tiling : packoffset(c014.x);
  float2 skydome_cloud_speed_scale : packoffset(c014.y);
  float3 wind_amount : packoffset(c015.x);
  float eye_intensity : packoffset(c015.w);
  float fog_enabled : packoffset(c016.x);
  float3 fog_color : packoffset(c016.y);
  float3 fog0_settings : packoffset(c017.x);
  float3 fog1_settings : packoffset(c018.x);
  float2 skydome_fog_height_falloff : packoffset(c019.x);
  float volumetric_lighting_enabled : packoffset(c019.z);
  float volumetric_global_light_multiplier : packoffset(c019.w);
  float volumetric_local_light_multiplier : packoffset(c020.x);
  float volumetric_distance : packoffset(c020.y);
  float volumetric_phase : packoffset(c020.z);
  float volumetric_extinction : packoffset(c020.w);
  float volumetric_ambient_multiplier : packoffset(c021.x);
  float world_interaction_window_size : packoffset(c021.y);
  float world_interaction_water_window_size : packoffset(c021.z);
  float tonemap_use_custom : packoffset(c021.w);
  float tonemap_slope : packoffset(c022.x);
  float tonemap_toe : packoffset(c022.y);
  float tonemap_shoulder : packoffset(c022.z);
  float tonemap_black_clip : packoffset(c022.w);
  float tonemap_white_clip : packoffset(c023.x);
  float pathtraced_accumulation_frames : packoffset(c023.y);
  float4 ies_atlas_size : packoffset(c024.x);
};

cbuffer c0 : register(b1) {
  float4 world_view_proj[4] : packoffset(c000.x);
  float3 bloom_threshold_offset_falloff : packoffset(c004.x);
  float3 vignette_scale_falloff_opacity : packoffset(c005.x);
  float3 vignette_color : packoffset(c006.x);
  float bloom_enabled : packoffset(c006.w);
  float bloom_glare_enabled : packoffset(c007.x);
  float2 bloom_glare_settings : packoffset(c007.y);
  float light_shafts_enabled : packoffset(c007.w);
  float sun_flare_enabled : packoffset(c008.x);
  float tone_mapping_enabled : packoffset(c008.y);
  float amd_lpm_tone_mapping_enabled : packoffset(c008.z);
  float vignette_enabled : packoffset(c008.w);
  float color_grading_enabled : packoffset(c009.x);
  float grey_scale_enabled : packoffset(c009.y);
  float grey_scale_amount : packoffset(c009.z);
  float3 grey_scale_weights : packoffset(c010.x);
  float mirror_uv : packoffset(c010.w);
  float color_filter_enabled : packoffset(c011.x);
  float4 color_filter_opacity : packoffset(c012.x);
  uint4 amd_lpm[24] : packoffset(c013.x);
};

SamplerState __samp_input_texture0 : register(s0);

SamplerState __samp_input_texture3 : register(s1);

SamplerState __samp_virtual_color_grading : register(s2);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target = 0;
  float4 _12 = __tex_input_texture0.Sample(__samp_input_texture0, float2(TEXCOORD.x, TEXCOORD.y));
  float _17 = current_exposure.Load(int3(0, 0, 0));
  float4 _22 = __tex_input_texture3.Sample(__samp_input_texture3, float2(TEXCOORD.x, TEXCOORD.y));
  float _26 = _22.x + (_17.x * _12.x);
  float _27 = _22.y + (_17.x * _12.y);
  float _28 = _22.z + (_17.x * _12.z);
  float _228;
  float _261;
  float _275;
  float _332;
  float _487;
  float _488;
  float _489;
  float _564;
  float _565;
  float _566;
  float _588;
  float _589;
  float _590;
  float _617;
  float _618;
  float _619;
  [branch]
  if (!(tone_mapping_enabled == 0.0f)) {
    if (!(amd_lpm_tone_mapping_enabled == 0.0f)) {
      float _36 = max(0.0f, _26);
      float _37 = max(0.0f, _27);
      float _38 = max(0.0f, _28);
      float _58 = asfloat((amd_lpm[2].y));
      float _59 = asfloat((amd_lpm[2].z));
      float _60 = asfloat((amd_lpm[2].w));
      float _70 = asfloat((amd_lpm[1].z));
      float _71 = asfloat((amd_lpm[1].w));
      float _72 = asfloat((amd_lpm[2].x));
      float _75 = 1.0f / max(_36, max(_37, _38));
      float _81 = exp2(log2(_75 * _36) * asfloat((amd_lpm[0].x)));
      float _84 = exp2(log2(_75 * _37) * asfloat((amd_lpm[0].y)));
      float _87 = exp2(log2(_75 * _38) * asfloat((amd_lpm[0].z)));
      float _95 = exp2(log2(((_71 * _37) + (_70 * _36)) + (_72 * _38)) * asfloat((amd_lpm[0].w)));
      float _99 = (1.0f / ((_95 * asfloat((amd_lpm[1].x))) + asfloat((amd_lpm[1].y)))) * _95;
      float _107 = saturate(_99 * (1.0f / (((_84 * _71) + (_81 * _70)) + (_87 * _72))));
      float _109 = saturate(_107 * _81);
      float _111 = saturate(_107 * _84);
      float _113 = saturate(_107 * _87);
      float _115 = _58 - (_109 * _58);
      float _117 = _59 - (_111 * _59);
      float _119 = _60 - (_113 * _60);
      float _133 = (1.0f / (((_117 * _71) + (_115 * _70)) + (_119 * _72))) * saturate(((_99 - (_109 * _70)) - (_111 * _71)) - (_113 * _72));
      float _136 = saturate((_133 * _115) + _109);
      float _139 = saturate((_133 * _117) + _111);
      float _142 = saturate((_133 * _119) + _113);
      float _149 = saturate(((_99 - (_136 * _70)) - (_139 * _71)) - (_142 * _72));
      _487 = saturate((_149 * asfloat((amd_lpm[3].x))) + _136);
      _488 = saturate((_149 * asfloat((amd_lpm[3].y))) + _139);
      _489 = saturate((_149 * asfloat((amd_lpm[3].z))) + _142);
    } else {
      if (!(tonemap_use_custom == 0.0f)) {
        float _173 = mad(0.16386905312538147f, _28, mad(0.14067868888378143f, _27, (_26 * 0.6954522132873535f)));
        float _176 = mad(0.0955343246459961f, _28, mad(0.8596711158752441f, _27, (_26 * 0.044794581830501556f)));
        float _179 = mad(1.0015007257461548f, _28, mad(0.004025210160762072f, _27, (_26 * -0.005525882821530104f)));
        float _183 = max(max(_173, _176), _179);
        float _188 = (max(_183, 1.000000013351432e-10f) - max(min(min(_173, _176), _179), 1.000000013351432e-10f)) / max(_183, 0.009999999776482582f);
        float _201 = ((_176 + _173) + _179) + (sqrt((((_179 - _176) * _179) + ((_176 - _173) * _176)) + ((_173 - _179) * _173)) * 1.75f);
        float _202 = _201 * 0.3333333432674408f;
        float _203 = _188 + -0.4000000059604645f;
        float _204 = _203 * 5.0f;
        float _208 = max((1.0f - abs(_203 * 2.5f)), 0.0f);
        float _219 = ((float((int)(((int)(uint)((int)(_204 > 0.0f))) - ((int)(uint)((int)(_204 < 0.0f))))) * (1.0f - (_208 * _208))) + 1.0f) * 0.02500000037252903f;
        do {
          if (!(_202 <= 0.0533333346247673f)) {
            if (!(_202 >= 0.1599999964237213f)) {
              _228 = (((0.23999999463558197f / _201) + -0.5f) * _219);
            } else {
              _228 = 0.0f;
            }
          } else {
            _228 = _219;
          }
          float _229 = _228 + 1.0f;
          float _230 = _229 * _173;
          float _231 = _229 * _176;
          float _232 = _229 * _179;
          do {
            if (!((int)(_230 == _231) && (int)(_231 == _232))) {
              float _239 = ((_230 * 2.0f) - _231) - _232;
              float _242 = ((_176 - _179) * 1.7320507764816284f) * _229;
              float _244 = atan(_242 / _239);
              bool _247 = (_239 < 0.0f);
              bool _248 = (_239 == 0.0f);
              bool _249 = (_242 >= 0.0f);
              bool _250 = (_242 < 0.0f);
              _261 = select((_249 && _248), 90.0f, select((_250 && _248), -90.0f, (select((_250 && _247), (_244 + -3.1415927410125732f), select((_249 && _247), (_244 + 3.1415927410125732f), _244)) * 57.295780181884766f)));
            } else {
              _261 = 0.0f;
            }
            float _266 = min(max(select((_261 < 0.0f), (_261 + 360.0f), _261), 0.0f), 360.0f);
            do {
              if (_266 < -180.0f) {
                _275 = (_266 + 360.0f);
              } else {
                if (_266 > 180.0f) {
                  _275 = (_266 + -360.0f);
                } else {
                  _275 = _266;
                }
              }
              float _279 = saturate(1.0f - abs(_275 * 0.014814814552664757f));
              float _283 = (_279 * _279) * (3.0f - (_279 * 2.0f));
              float _289 = ((_283 * _283) * ((_188 * 0.18000000715255737f) * (0.029999999329447746f - _230))) + _230;
              float _299 = max(0.0f, mad(-0.21492856740951538f, _232, mad(-0.2365107536315918f, _231, (_289 * 1.4514392614364624f))));
              float _300 = max(0.0f, mad(-0.09967592358589172f, _232, mad(1.17622971534729f, _231, (_289 * -0.07655377686023712f))));
              float _301 = max(0.0f, mad(0.9977163076400757f, _232, mad(-0.006032449658960104f, _231, (_289 * 0.008316148072481155f))));
              float _302 = dot(float3(_299, _300, _301), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));
              float _312 = 1.0f - tonemap_toe;
              float _313 = _312 + tonemap_black_clip;
              float _315 = (1.0f - tonemap_shoulder) + tonemap_white_clip;
              do {
                if (tonemap_toe > 0.800000011920929f) {
                  _332 = (((0.8199999928474426f - tonemap_toe) / tonemap_slope) + -0.7447274923324585f);
                } else {
                  float _323 = (tonemap_black_clip + 0.18000000715255737f) / _313;
                  _332 = (-0.7447274923324585f - ((log2(_323 / (2.0f - _323)) * 0.3465735912322998f) * (_313 / tonemap_slope)));
                }
                float _334 = (_312 / tonemap_slope) - _332;
                float _336 = (tonemap_shoulder / tonemap_slope) - _334;
                float _340 = log2(lerp(_302, _299, 0.9599999785423279f)) * 0.3010300099849701f;
                float _341 = log2(lerp(_302, _300, 0.9599999785423279f)) * 0.3010300099849701f;
                float _342 = log2(lerp(_302, _301, 0.9599999785423279f)) * 0.3010300099849701f;
                float _346 = (_340 + _334) * tonemap_slope;
                float _347 = (_341 + _334) * tonemap_slope;
                float _348 = (_342 + _334) * tonemap_slope;
                float _349 = _313 * 2.0f;
                float _351 = (tonemap_slope * -2.0f) / _313;
                float _352 = _340 - _332;
                float _353 = _341 - _332;
                float _354 = _342 - _332;
                float _373 = tonemap_white_clip + 1.0f;
                float _374 = _315 * 2.0f;
                float _376 = (tonemap_slope * 2.0f) / _315;
                float _401 = select((_340 < _332), ((_349 / (exp2((_352 * 1.4426950216293335f) * _351) + 1.0f)) - tonemap_black_clip), _346);
                float _402 = select((_341 < _332), ((_349 / (exp2((_353 * 1.4426950216293335f) * _351) + 1.0f)) - tonemap_black_clip), _347);
                float _403 = select((_342 < _332), ((_349 / (exp2((_351 * 1.4426950216293335f) * _354) + 1.0f)) - tonemap_black_clip), _348);
                float _410 = _336 - _332;
                float _414 = saturate(_352 / _410);
                float _415 = saturate(_353 / _410);
                float _416 = saturate(_354 / _410);
                bool _417 = (_336 < _332);
                float _421 = select(_417, (1.0f - _414), _414);
                float _422 = select(_417, (1.0f - _415), _415);
                float _423 = select(_417, (1.0f - _416), _416);
                float _442 = (((_421 * _421) * (select((_340 > _336), (_373 - (_374 / (exp2(((_340 - _336) * 1.4426950216293335f) * _376) + 1.0f))), _346) - _401)) * (3.0f - (_421 * 2.0f))) + _401;
                float _443 = (((_422 * _422) * (select((_341 > _336), (_373 - (_374 / (exp2(((_341 - _336) * 1.4426950216293335f) * _376) + 1.0f))), _347) - _402)) * (3.0f - (_422 * 2.0f))) + _402;
                float _444 = (((_423 * _423) * (select((_342 > _336), (_373 - (_374 / (exp2(((_342 - _336) * 1.4426950216293335f) * _376) + 1.0f))), _348) - _403)) * (3.0f - (_423 * 2.0f))) + _403;
                float _445 = dot(float3(_442, _443, _444), float3(0.2722287178039551f, 0.6740817427635193f, 0.053689517080783844f));
                _487 = max(0.0f, (lerp(_445, _442, 0.9300000071525574f)));
                _488 = max(0.0f, (lerp(_445, _443, 0.9300000071525574f)));
                _489 = max(0.0f, (lerp(_445, _444, 0.9300000071525574f)));
              } while (false);
            } while (false);
          } while (false);
        } while (false);
      } else {
        _487 = saturate((((_26 * 2.509999990463257f) + 0.029999999329447746f) * _26) / ((((_26 * 2.430000066757202f) + 0.5899999737739563f) * _26) + 0.14000000059604645f));
        _488 = saturate((((_27 * 2.509999990463257f) + 0.029999999329447746f) * _27) / ((((_27 * 2.430000066757202f) + 0.5899999737739563f) * _27) + 0.14000000059604645f));
        _489 = saturate((((_28 * 2.509999990463257f) + 0.029999999329447746f) * _28) / ((((_28 * 2.430000066757202f) + 0.5899999737739563f) * _28) + 0.14000000059604645f));
      }
    }
  } else {
    _487 = _26;
    _488 = _27;
    _489 = _28;
  }
  float _496 = (pow(_487, 0.4545454680919647f));
  float _497 = (pow(_488, 0.4545454680919647f));
  float _498 = (pow(_489, 0.4545454680919647f));
  float _499 = TEXCOORD.x + -0.5f;
  float _500 = TEXCOORD.y + -0.5f;
  float _507 = (vignette_scale_falloff_opacity.y * 1.4427000284194946f) + 1.4427000284194946f;
  float _520 = 1.0f - saturate(exp2((_507 * (1.0f - dot(float2(_499, _500), float2(_499, _500)))) - _507) * vignette_scale_falloff_opacity.x);
  float _529 = vignette_enabled * vignette_scale_falloff_opacity.z;
  float _539 = ((((1.0f - ((1.0f - vignette_color.x) * _520)) * _496) - _496) * _529) + _496;
  float _540 = ((((1.0f - ((1.0f - vignette_color.y) * _520)) * _497) - _497) * _529) + _497;
  float _541 = ((((1.0f - ((1.0f - vignette_color.z) * _520)) * _498) - _498) * _529) + _498;
  [branch]
  if (!(color_filter_enabled == 0.0f)) {
    _564 = ((((color_filter_opacity.y * _539) - _539) * color_filter_opacity.x) + _539);
    _565 = ((((color_filter_opacity.z * _540) - _540) * color_filter_opacity.x) + _540);
    _566 = ((((color_filter_opacity.w * _541) - _541) * color_filter_opacity.x) + _541);
  } else {
    _564 = _539;
    _565 = _540;
    _566 = _541;
  }
  [branch]
  if (!(grey_scale_enabled == 0.0f)) {
    float _577 = max(dot(float3(_564, _565, _566), float3(grey_scale_weights.x, grey_scale_weights.y, grey_scale_weights.z)), 0.0f);
    _588 = (lerp(_564, _577, grey_scale_amount));
    _589 = (lerp(_565, _577, grey_scale_amount));
    _590 = (lerp(_566, _577, grey_scale_amount));
  } else {
    _588 = _564;
    _589 = _565;
    _590 = _566;
  }
  [branch]
  if (!(color_grading_enabled == 0.0f)) {
    float4 _603 = __tex_virtual_color_grading.SampleLevel(__samp_virtual_color_grading, float3(((saturate(_588) * 0.9375f) + 0.03125f), ((saturate(_589) * 0.9375f) + 0.03125f), ((saturate(_590) * 0.9375f) + 0.03125f)), 0.0f);
    _617 = (lerp(_588, _603.x, color_grading_enabled));
    _618 = (lerp(_589, _603.y, color_grading_enabled));
    _619 = (lerp(_590, _603.z, color_grading_enabled));
  } else {
    _617 = _588;
    _618 = _589;
    _619 = _590;
  }
  SV_Target.x = _617;
  SV_Target.y = _618;
  SV_Target.z = _619;
  SV_Target.w = _12.w;
  return SV_Target;
}
*/

#define TONEMAPPER_LAYOUT_MINIMAL_EXTRA1_COLOR_FILTER
#define TONEMAPPER_EXTRA_TEXTURE_COUNT 1
#define TONEMAPPER_USE_COLOR_FILTER 1
#define TONEMAPPER_ENVIRONMENT_REGISTER b0
#define TONEMAPPER_CONSTANTS_REGISTER b1

#include "tonemapper.hlsl"
