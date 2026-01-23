#include "../shared.h"

struct Lod_params {
  struct Lod_brush_params {
    float4 brush_uv[4];
    float base_radius;
    float radius_variation;
    float radius_random;
    float blur;
    float alpha;
    float stretch;
  } brushes;
  struct Lod_noise_params {
    float chaos;
    float freq;
    float brightness;
    float saturation;
    float hue;
  } noise;
  struct Lod_outlines_params {
    float2 thickness;
    float2 softness;
    float2 displacement;
    float2 attenuation;
    float lighting_threshold;
    float lighting_threshold_softness;
    float2 lighting_dark;
    float2 lighting_bright;
    float2 discretion;
    float2 alpha;
  } outlines;
};

struct Frame_constants {
  float3 cam_world_pos;
  float time;
  float2 inv_near_dim;
  float proj_scale;
  uint flags;
  float2 half_vp_dim;
  int2 vp_dim;
  float2 vp_texel_size;
  int2 mouse_pos;
  int2 inspected_pix;
  int2 hi_z_0_dim;
  int supersampling;
  int debug_patches;
  int use_patches;
  int emissive;
  float3 target;
  uint frame_number;
  uint shot_frame_number;
  float dt;
  float4 view_to_world[4];
  float4 world_to_view[4];
  float4 view_ndc[4];
  float4 world_ndc[4];
  float4 prev_world_ndc[4];
  float4 ndc_world[4];
  float4 ndc_to_prev_ndc[4];
  float4 prev_ndc_to_ndc[4];
  float4 view_world_z0;
  float4 pix_to_fog_eq;
  float3 mio_view;
  float3 mio_hair_outline_color;
  float mio_foliage_velocity;
  int show_wireframe;
  int ao;
  int glitch;
  int no_vertex_color;
  float paper_mult;
  int hatching;
  int mio_halo;
  int vol_temporal;
  int heart_attack_active;
  int heart_attack_secondary_target;
  int triangular_dissolve_enabled;
  int color_correct;
  float starfield_effect_amount;
  float starfield_fade_amount;
  float3 starfield_center_view;
  float starfield_glow_amount;
  float starfield_pulse_t;
  float death_anim_t;
  float3 game_plane_world_origin;
  float3 game_plane_world_normal;
  float3 game_plane_world_u;
  float3 game_plane_world_v;
  float4 game_plane_transform[4];
  float4 hatching_xf[4];
  float4 paper_xf[4];
  float2 game_plane_blend;
  float heart_attack_t;
  float heart_attack_duration;
  float heart_attack_pulse;
  float heart_attack_outline_distance;
  float heart_attack_dissolve_distance;
  float3 heart_attack_dissolve_color;
  float heart_attack_dissolve_base;
  float heart_attack_dissolve_mult;
  float3 heart_attack_dissolve_world_center;
  float heart_attack_vertical_dissolve;
  float triangular_dissolve_base_amount;
  float triangular_dissolve_amount;
  float flashback_lut;
  float evil_mio;
  float dead_mio;
  float godlike_mio;
  float khlia_pulse_t;
  float khlia__pulse_t;
  float khlia_pulse_period;
  float3 khlia_world_pos;
  float skydome_rotation_offset;
  float hatch_ambiant_mul;
  float hatch_ambiant_add;
  float glitch_scale;
  uint max_contours;
  uint max_contour_loops;
  int death_screen;
  float death_screen_t;
  int poetic_death_screen;
  float poetic_death_screen_t;
  float tremor_pulse_t;
  int invert;
  float surface_fade;
  struct Postprocess_params {
    struct AO_params {
      float3 color;
      float intensity;
    } ao;
    struct Fog_params {
      float bloom_factor;
      float space;
      float outline_density;
      float outline_attenuation;
    } fog;
    struct Ambient_light_params {
      int undercoat_grad;
      float3 color;
      float intensity;
      float gameplay_intensity;
      float gameplay_width;
      float directional_intensity;
      float directional_shadows;
      float undercoat_noise_freq;
      float undercoat_noise_amplitude;
      float undercoat_noise_threshold;
      float undercoating;
    } ambient_light;
    struct Vignette_params {
      float intensity;
      float rounded;
      float3 color;
      float golden_intensity;
      float golden_color;
    } vignette;
    struct Bloom_params {
      float intensity;
      float threshold_low;
      float threshold_high;
    } bloom;
    struct Mio_params {
      float light_intensity;
      float light_radius;
      float3 light_color;
      float spec_intensity;
      float3 halo_color;
      float halo_intensity;
    } mio;
    struct Particles_params {
      uint count;
      float cam_near;
      float cam_far;
      float fadeoff_near;
      float2 lifetime;
      float fadein_duration;
      float fadeoff_duration;
      float2 alpha;
      float2 scale;
      float2 speed;
      int gradient;
      float circle_attenuation;
    } particles;
    struct Chroma_aberration_params {
      float intensity;
    } chroma_aberration;
    struct Fade_params {
      float intensity;
      float3 color;
    } fade;
    struct Dof_params {
      float plane_01;
      float plane_01_softness;
      float plane_12;
      float plane_12_softness;
      float foreground;
      float foreground_softness;
    } dof;
    Lod_params lod_foreground;
    Lod_params lod_game;
    Lod_params lod_midground;
    Lod_params lod_background;
  } params;
};


Texture2D<float4> tex : register(t0);

Texture2D<float> depth_tex : register(t1);

Texture2D<float2> distortion : register(t4);

Texture2D<float> paper_tex : register(t5);

Texture2D<float3> bloom_tex : register(t7);

cbuffer frame_consts : register(b0) {
  Frame_constants frame_consts : packoffset(c000.x);
};

SamplerState sampler_nearest : register(s0);

SamplerState sampler_bilinear : register(s1);

SamplerState sampler_bilinear_wrap : register(s2);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 O_Uv : O_Uv
) : SV_Target {
  float4 SV_Target;
  float _15 = float((int)(frame_consts.vp_dim.x));
  float _16 = float((int)(frame_consts.vp_dim.y));
  float2 _17 = distortion.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _20 = _16 / _15;
  float _25 = saturate((_17.x * _20) + O_Uv.x);
  float _26 = saturate((_17.y * _20) + O_Uv.y);
  float _58;
  float _59;
  float _60;
  float _61;
  float _224;
  float _235;
  float _246;
  float _269;
  float _270;
  float _271;
  float _432;
  float _433;
  float _434;
  float _475;
  float _476;
  float _477;
  float _626;
  float _627;
  float _628;
  float _636;
  float _893;
  float _894;
  float _895;
  float _940;
  float _941;
  float _942;
  float _951;
  float _952;
  float _953;
  if (frame_consts.params.chroma_aberration.intensity > 0.0f) {
    float _33 = abs(_25 + -0.5f);
    float _34 = abs(_26 + -0.5f);
    float _38 = (rsqrt(dot(float2(_33, _34), float2(_33, _34))) * 0.009999999776482582f) * frame_consts.params.chroma_aberration.intensity;
    float _39 = _38 * _33;
    float _40 = _38 * _34;
    float4 _43 = tex.SampleLevel(sampler_nearest, float2((_39 + _25), (_40 + _26)), 0.0f);
    float4 _45 = tex.SampleLevel(sampler_nearest, float2(_25, _26), 0.0f);
    float4 _49 = tex.SampleLevel(sampler_nearest, float2((_25 - _39), (_26 - _40)), 0.0f);
    _58 = _43.x;
    _59 = _45.y;
    _60 = _49.z;
    _61 = 0.5f;
  } else {
    float4 _52 = tex.SampleLevel(sampler_nearest, float2(_25, _26), 0.0f);
    _58 = _52.x;
    _59 = _52.y;
    _60 = _52.z;
    _61 = _52.w;
  }
  float3 untonemapped = float3(_58, _59, _60);

  float3 _62 = bloom_tex.SampleLevel(sampler_bilinear, float2(_25, _26), 0.0f);
  float _77 = max((((1.0f - (_58 * 0.2125999927520752f)) - (_59 * 0.7152000069618225f)) - (_60 * 0.0722000002861023f)), 0.0010000000474974513f);
  float _81 = (_58 / _77) + (frame_consts.params.bloom.intensity * _62.x);
  float _82 = (_59 / _77) + (frame_consts.params.bloom.intensity * _62.y);
  float _83 = (_60 / _77) + (frame_consts.params.bloom.intensity * _62.z);
  float _89 = (((_81 * 0.2125999927520752f) + 1.0f) + (_82 * 0.7152000069618225f)) + (_83 * 0.0722000002861023f);
  float _93 = saturate(_81 / _89);
  float _94 = saturate(_82 / _89);
  float _95 = saturate(_83 / _89);
  if (!(frame_consts.glitch == 0)) {
    float _103 = float((int)(int((_15 / _16) * 1080.0f)));
    float _104 = _103 * _25;
    float _105 = _26 * 1080.0f;
    float _106 = _103 * 0.5f;
    float _109 = max(frame_consts.khlia_pulse_t, 0.0f);
    float _116 = max((frame_consts.khlia_pulse_t + -0.30000001192092896f), 0.0f);
    float _122 = ((_116 * 3.0f) * exp2(1.4426950216293335f - (_116 * 4.328084945678711f))) + ((_109 * 5.0f) * exp2(1.4426950216293335f - (_109 * 7.213475227355957f)));
    float _123 = _122 * 15.0f;
    float _124 = _123 + 30.0f;
    float _126 = (_122 * 20.0f) + 80.0f;
    float _130 = abs(_103 * (_25 + -0.5f));
    float _131 = abs(_105 + -540.0f);
    float _134 = ((_130 - _106) + _124) + _126;
    float _137 = ((_131 + -510.0f) + _123) + _126;
    float _140 = max(_134, 0.0f);
    float _141 = max(_137, 0.0f);
    float _155 = _130 - (_106 - _124);
    float _156 = _131 - (510.0f - _123);
    float _157 = max(_155, 0.0f);
    float _158 = max(_156, 0.0f);
    float _174 = max(max(0.0f, (1.0f - saturate(abs((min(max(_134, _137), 0.0f) - _126) + sqrt((_141 * _141) + (_140 * _140))) + -0.5f))), ((1.0f - saturate(abs(min(max(_155, _156), 0.0f) + sqrt((_158 * _158) + (_157 * _157))) + -0.5f)) * (1.0f - saturate(_122 * 1.6666666269302368f))));
    float _185 = frac((_104 + _105) * 0.0012499999720603228f) + -0.5f;
    float _186 = frac((_105 - _104) * 0.0012499999720603228f) + -0.5f;
    float _198 = saturate((sin((((_104 * 0.0003124999930150807f) + (_26 * 0.3375000059604645f)) * 20.0f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _202 = (_198 * _198) * (3.0f - (_198 * 2.0f));
    float _204 = saturate(sqrt((_186 * _186) + (_185 * _185)) * 2.0f);
    float _209 = _202 * 0.20000000298023224f;
    float _211 = ((_204 * 0.12156862020492554f) + 0.7450979948043823f) + _209;
    float _212 = ((_204 * 0.3333333134651184f) + 0.34117645025253296f) + _209;
    do {
      if (!(!((_209 + 0.9803921580314636f) <= 0.040449999272823334f))) {
        _224 = ((_202 * 0.015479876659810543f) + 0.07588174939155579f);
      } else {
        _224 = exp2(log2((_202 * 0.18957345187664032f) + 0.9814143776893616f) * 2.4000000953674316f);
      }
      do {
        if (!(!(_211 <= 0.040449999272823334f))) {
          _235 = (_211 * 0.07739938050508499f);
        } else {
          _235 = exp2(log2((_211 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
        }
        do {
          if (!(!(_212 <= 0.040449999272823334f))) {
            _246 = (_212 * 0.07739938050508499f);
          } else {
            _246 = exp2(log2((_212 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
          }
          float _252 = (((_224 * 0.2125999927520752f) + 1.0f) + (_235 * 0.7152000069618225f)) + (_246 * 0.0722000002861023f);
          _269 = (((saturate(_224 / _252) - _93) * _174) + _93);
          _270 = (((saturate(_235 / _252) - _94) * _174) + _94);
          _271 = (((saturate(_246 / _252) - _95) * _174) + _95);
        } while (false);
      } while (false);
    } while (false);
  } else {
    _269 = _93;
    _270 = _94;
    _271 = _95;
  }
  float _277 = depth_tex.SampleLevel(sampler_nearest, float2(_25, _26), 0.0f);
  float _281 = 10000.0f / ((_277.x * 19999.5f) + 0.5f);
  float _286 = (_281 * ((_25 * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _288 = (_281 * (((1.0f - _26) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _289 = -0.0f - _281;
  float _313 = mad((frame_consts.paper_xf[2].z), _289, mad((frame_consts.paper_xf[1].z), _288, (_286 * (frame_consts.paper_xf[0].z))));
  float _314 = mad((frame_consts.paper_xf[2].x), _289, mad((frame_consts.paper_xf[1].x), _288, (_286 * (frame_consts.paper_xf[0].x)))) / _313;
  float _315 = mad((frame_consts.paper_xf[2].y), _289, mad((frame_consts.paper_xf[1].y), _288, (_286 * (frame_consts.paper_xf[0].y)))) / _313;
  float _319 = 1.0f - frame_consts.game_plane_blend.y;
  float _324 = log2(max(5.0f, (-0.0f - (_313 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _325 = floor(_324);
  float _326 = _324 - _325;
  float _328 = exp2(_325 * 0.10000000149011612f);
  float _329 = 1.0f / _328;
  float _330 = min(_329, 0.20000000298023224f);
  float _332 = min((_329 * 0.9330329895019531f), 0.20000000298023224f);
  float _333 = frame_consts.game_plane_blend.x - _328;
  float _339 = frame_consts.game_plane_blend.x - (_328 * 1.0717734098434448f);
  float _351 = frame_consts.game_plane_blend.x + 10.0f;
  float _356 = log2(max(5.0f, (-0.0f - (_313 - _351)))) * 10.0f;
  float _357 = floor(_356);
  float _358 = _356 - _357;
  float _360 = exp2(_357 * 0.10000000149011612f);
  float _361 = 1.0f / _360;
  float _362 = min(_361, 0.20000000298023224f);
  float _364 = min((_361 * 0.9330329895019531f), 0.20000000298023224f);
  float _365 = _351 - _360;
  float _371 = _351 - (_360 * 1.0717734098434448f);
  float _383 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_333 * _314) + (frame_consts.paper_xf[3].x)) * _330), (((_333 * _315) + (frame_consts.paper_xf[3].y)) * _330)), 0.0f);
  float _386 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_339 * _314) + (frame_consts.paper_xf[3].x)) * _332), (((_339 * _315) + (frame_consts.paper_xf[3].y)) * _332)), 0.0f);
  float _389 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_365 * _314) + (frame_consts.paper_xf[3].x)) * _362), (((_365 * _315) + (frame_consts.paper_xf[3].y)) * _362)), 0.0f);
  float _392 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_371 * _314) + (frame_consts.paper_xf[3].x)) * _364), (((_371 * _315) + (frame_consts.paper_xf[3].y)) * _364)), 0.0f);
  float _401 = ((((1.0f - (((1.0f - _326) * _319) * _383.x)) - ((_326 * _319) * _386.x)) - (((1.0f - _358) * frame_consts.game_plane_blend.y) * _389.x)) - ((_358 * frame_consts.game_plane_blend.y) * _392.x)) * frame_consts.paper_mult;
  float _405 = _269 - (_401 * _269);
  float _406 = _270 - (_401 * _270);
  float _407 = _271 - (_401 * _271);
  if (!(frame_consts.death_screen == 0)) {
    float _430 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _61), _61);
    _432 = _430;
    _433 = _430;
    _434 = _430;
  } else {
    _432 = (lerp(_405, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _433 = (lerp(_406, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _434 = (lerp(_407, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _442 = _25 * _15;
    float _443 = _26 * _16;
    float _444 = _442 * 0.06666667014360428f;
    float _445 = _443 * 0.038490019738674164f;
    float _447 = ceil(_444 - _445);
    float _449 = floor(_443 * 0.07698003947734833f);
    float _450 = _449 + 1.0f;
    float _453 = ceil((-0.0f - _444) - _445);
    float _455 = (_447 - _453) * 7.5f;
    float _456 = _447 * 0.28867512941360474f;
    float _457 = _450 * 0.5773502588272095f;
    float _458 = _457 - _456;
    float _459 = _453 * 0.28867512941360474f;
    float _462 = _455 / _15;
    float _463 = ((_458 - _459) * 15.0f) / _16;
    do {
      if (((_450 + _447) + _453) == 2.0f) {
        _475 = (_447 + 1.0f);
        _476 = (_449 + 2.0f);
        _477 = (_453 + 1.0f);
      } else {
        _475 = (_447 + -1.0f);
        _476 = _449;
        _477 = (_453 + -1.0f);
      }
      float _478 = _475 - _453;
      float _481 = _457 - (_475 * 0.28867512941360474f);
      float _482 = _481 - _459;
      float _485 = (_476 * 0.5773502588272095f) - _456;
      float _486 = _485 - _459;
      float _488 = _447 - _477;
      float _491 = _458 - (_477 * 0.28867512941360474f);
      float _495 = (_481 - _485) * 15.0f;
      float _496 = (_475 - _447) * -7.5f;
      float _498 = rsqrt(dot(float2(_495, _496), float2(_495, _496)));
      float _507 = (_486 - _491) * 15.0f;
      float _508 = (_477 - _453) * -7.5f;
      float _510 = rsqrt(dot(float2(_507, _508), float2(_507, _508)));
      float _519 = (_491 - _482) * 15.0f;
      float _520 = (_488 - _478) * -7.5f;
      float _522 = rsqrt(dot(float2(_519, _520), float2(_519, _520)));
      float _535 = _462 + -0.5f;
      float _536 = _463 + -0.5f;
      float _583 = _25 + -0.5f;
      float _584 = _26 + -0.5f;
      float _591 = ((frame_consts.time - sqrt((_584 * _584) + (_583 * _583))) + (frac(sin(dot(float2((_462 * 5.0f), (_463 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _595 = frac(abs(_591));
      float _599 = max((select((_591 >= (-0.0f - _591)), _595, (-0.0f - _595)) * 18.0f), 0.0f);
      float _615 = min(max((1.0f - (((((_599 * 1.600000023841858f) * exp2(1.4426950216293335f - (_599 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_536 * _536) + (_535 * _535)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_462 * 3.0f), (_463 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_462, _463), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_462 * 2.0f), (_463 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _621 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_478 * 7.5f) - _442), ((_482 * 15.0f) - _443)), float2((_495 * _498), (_498 * _496))))), abs(dot(float2((_455 - _442), ((_486 * 15.0f) - _443)), float2((_510 * _507), (_510 * _508))))), abs(dot(float2(((_488 * 7.5f) - _442), ((_491 * 15.0f) - _443)), float2((_522 * _519), (_522 * _520))))) * 0.2309400886297226f)) - _615) / ((_615 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _626 = (_621 * _432);
      _627 = (_621 * _433);
      _628 = (_621 * _434);
    } while (false);
  } else {
    _626 = _432;
    _627 = _433;
    _628 = _434;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _636 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _636 = 0.0f;
  }
  float _643 = frame_consts.params.vignette.intensity + _636;
  float _646 = _15 / _16;
  float _658 = exp2(log2(saturate((_643 * abs(_25 + -0.5f)) * (((_646 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _659 = exp2(log2(saturate(_643 * abs(_26 + -0.5f))) * 5.0f);
  float _665 = exp2(log2(saturate(1.0f - dot(float2(_658, _659), float2(_658, _659)))) * 6.0f);
  float _670 = 1.0f - _665;
  float _672 = 1.0f - (_670 * 0.8500000238418579f);
  float _679 = (_672 * (_626 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _680 = (_672 * (_627 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _681 = (_672 * (_628 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _685 = ((_665 * 1.2000000476837158f) * _670) * frame_consts.params.vignette.golden_intensity;
  if (_685 > 0.0020000000949949026f) {
    float _690 = _25 * _15;
    float _691 = _26 * _16;
    float _692 = _691 + _690;
    float _698 = frac(_692 * 0.0033333334140479565f) + -0.5f;
    float _699 = frac((_691 - _690) * 0.0033333334140479565f) + -0.5f;
    float _705 = saturate(sqrt((_699 * _699) + (_698 * _698)) * 2.0f);
    float _716 = saturate((sin((_692 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _721 = ((_716 * _716) * 0.2199999988079071f) * (3.0f - (_716 * 2.0f));
    float _722 = _721 + 0.9777389168739319f;
    float _723 = ((_705 * 0.13274884223937988f) + 0.7175776362419128f) + _721;
    float _724 = ((_705 * 0.3335757553577423f) + 0.30871906876564026f) + _721;
    float _729 = (_25 * 1080.0f) * _646;
    float _730 = _26 * 1080.0f;
    float _731 = _729 * 0.04444444552063942f;
    float _732 = _26 * 27.712812423706055f;
    float _734 = ceil(_731 - _732);
    float _737 = floor(_26 * 55.42562484741211f) + 1.0f;
    float _740 = ceil((-0.0f - _732) - _731);
    float _742 = (_737 + _734) + _740;
    float _744 = (_742 * 22.5f) + -33.75f;
    float _746 = (_734 - _740) * 11.25f;
    float _752 = (((_737 * 0.5773502588272095f) - (_734 * 0.28867512941360474f)) - (_740 * 0.28867512941360474f)) * 22.5f;
    float _755 = _744 + _746;
    float _756 = _752 + (19.485570907592773f - (_742 * 12.990381240844727f));
    float _759 = ((_742 * 25.980762481689453f) + -38.97114181518555f) + _752;
    float _760 = _746 - _744;
    float _761 = _755 - _729;
    float _762 = _756 - _730;
    float _765 = _746 - _729;
    float _766 = _759 - _730;
    float _771 = _762 * _762;
    float _778 = _760 - _729;
    float _782 = frame_consts.time * 0.30000001192092896f;
    float _783 = _756 * 0.4000000059604645f;
    float _792 = sin(((_756 * 0.04444444552063942f) + _782) * 2.0f);
    float _797 = saturate((sqrt(_792 * cos((((_783 + _755) * 0.04444444552063942f) + _782) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _801 = (_797 * _797) * (3.0f - (_797 * 2.0f));
    float _803 = (_801 * 0.6499999761581421f) + 0.3499999940395355f;
    float _818 = saturate((sqrt(sin(((_759 * 0.04444444552063942f) + _782) * 2.0f) * cos(((((_759 * 0.4000000059604645f) + _746) * 0.04444444552063942f) + _782) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _822 = (_818 * _818) * (3.0f - (_818 * 2.0f));
    float _824 = (_822 * 0.6499999761581421f) + 0.3499999940395355f;
    float _834 = saturate((sqrt(cos((((_783 + _760) * 0.04444444552063942f) + _782) * 2.0f) * _792) * 2.0f) + 0.20000004768371582f);
    float _838 = (_834 * _834) * (3.0f - (_834 * 2.0f));
    float _840 = (_838 * 0.6499999761581421f) + 0.3499999940395355f;
    float _862 = saturate(_803);
    float _863 = saturate(_824);
    float _882 = ((((saturate(11.0f - (sqrt((_766 * _766) + (_765 * _765)) / ((_822 * 0.039000000804662704f) + 0.08100000768899918f))) * _824) + (saturate(11.0f - (sqrt((_761 * _761) + _771) / ((_801 * 0.039000000804662704f) + 0.08100000768899918f))) * _803)) + (saturate(11.0f - (sqrt((_778 * _778) + _771) / ((_838 * 0.039000000804662704f) + 0.08100000768899918f))) * _840)) + (((((saturate(1.0f - (abs(_762) * 0.8333333134651184f)) * _862) + (saturate(1.0f - (abs(dot(float2(_765, _766), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _863)) * saturate(_840)) + ((_862 * saturate(1.0f - (abs(dot(float2(_761, _762), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _863)) * 0.5f)) * _685;
    _893 = ((_882 * ((_722 * _722) - _679)) + _679);
    _894 = ((_882 * ((_723 * _723) - _680)) + _680);
    _895 = ((_882 * ((_724 * _724) - _681)) + _681);
  } else {
    _893 = _679;
    _894 = _680;
    _895 = _681;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _904 = ((_894 * 0.7689999938011169f) + (_893 * 0.3930000066757202f)) + (_895 * 0.1889999955892563f);
    float _909 = ((_894 * 0.6859999895095825f) + (_893 * 0.3490000069141388f)) + (_895 * 0.1679999977350235f);
    float _914 = ((_894 * 0.5339999794960022f) + (_893 * 0.2720000147819519f)) + (_895 * 0.13099999725818634f);
    float _915 = frame_consts.flashback_lut * 0.800000011920929f;
    float _920 = ((_894 * 0.7152000069618225f) + (_893 * 0.2125999927520752f)) + (_895 * 0.0722000002861023f);
    _940 = ((((_904 - _893) + ((_920 - _904) * 0.6499999761581421f)) * _915) + _893);
    _941 = ((((_909 - _894) + ((_920 - _909) * 0.6499999761581421f)) * _915) + _894);
    _942 = ((((_914 - _895) + ((_920 - _914) * 0.6499999761581421f)) * _915) + _895);
  } else {
    _940 = _893;
    _941 = _894;
    _942 = _895;
  }
  if (!(frame_consts.invert == 0)) {
    _951 = (1.0f - _940);
    _952 = (1.0f - _941);
    _953 = (1.0f - _942);
  } else {
    _951 = _940;
    _952 = _941;
    _953 = _942;
  }
  SV_Target.x = _951;
  SV_Target.y = _952;
  SV_Target.z = _953;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
