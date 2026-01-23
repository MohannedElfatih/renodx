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
  float _396;
  float _397;
  float _398;
  float _439;
  float _440;
  float _441;
  float _590;
  float _591;
  float _592;
  float _600;
  float _690;
  float _691;
  float _692;
  float _701;
  float _702;
  float _703;
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
  float _327 = exp2(round(log2(max(5.0f, (-0.0f - (_313 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _329 = min((1.0f / _327), 0.20000000298023224f);
  float _330 = frame_consts.game_plane_blend.x - _327;
  float _337 = frame_consts.game_plane_blend.x + 10.0f;
  float _345 = exp2(round(log2(max(5.0f, (-0.0f - (_313 - _337)))) * 10.0f) * 0.10000000149011612f);
  float _347 = min((1.0f / _345), 0.20000000298023224f);
  float _348 = _337 - _345;
  float _355 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_330 * _314) + (frame_consts.paper_xf[3].x)) * _329), (((_330 * _315) + (frame_consts.paper_xf[3].y)) * _329)), 0.0f);
  float _358 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_348 * _314) + (frame_consts.paper_xf[3].x)) * _347), (((_348 * _315) + (frame_consts.paper_xf[3].y)) * _347)), 0.0f);
  float _365 = ((1.0f - (_355.x * (1.0f - frame_consts.game_plane_blend.y))) - (_358.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _369 = _269 - (_365 * _269);
  float _370 = _270 - (_365 * _270);
  float _371 = _271 - (_365 * _271);
  if (!(frame_consts.death_screen == 0)) {
    float _394 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _61), _61);
    _396 = _394;
    _397 = _394;
    _398 = _394;
  } else {
    _396 = (lerp(_369, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _397 = (lerp(_370, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _398 = (lerp(_371, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _406 = _25 * _15;
    float _407 = _26 * _16;
    float _408 = _406 * 0.06666667014360428f;
    float _409 = _407 * 0.038490019738674164f;
    float _411 = ceil(_408 - _409);
    float _413 = floor(_407 * 0.07698003947734833f);
    float _414 = _413 + 1.0f;
    float _417 = ceil((-0.0f - _408) - _409);
    float _419 = (_411 - _417) * 7.5f;
    float _420 = _411 * 0.28867512941360474f;
    float _421 = _414 * 0.5773502588272095f;
    float _422 = _421 - _420;
    float _423 = _417 * 0.28867512941360474f;
    float _426 = _419 / _15;
    float _427 = ((_422 - _423) * 15.0f) / _16;
    do {
      if (((_414 + _411) + _417) == 2.0f) {
        _439 = (_411 + 1.0f);
        _440 = (_413 + 2.0f);
        _441 = (_417 + 1.0f);
      } else {
        _439 = (_411 + -1.0f);
        _440 = _413;
        _441 = (_417 + -1.0f);
      }
      float _442 = _439 - _417;
      float _445 = _421 - (_439 * 0.28867512941360474f);
      float _446 = _445 - _423;
      float _449 = (_440 * 0.5773502588272095f) - _420;
      float _450 = _449 - _423;
      float _452 = _411 - _441;
      float _455 = _422 - (_441 * 0.28867512941360474f);
      float _459 = (_445 - _449) * 15.0f;
      float _460 = (_439 - _411) * -7.5f;
      float _462 = rsqrt(dot(float2(_459, _460), float2(_459, _460)));
      float _471 = (_450 - _455) * 15.0f;
      float _472 = (_441 - _417) * -7.5f;
      float _474 = rsqrt(dot(float2(_471, _472), float2(_471, _472)));
      float _483 = (_455 - _446) * 15.0f;
      float _484 = (_452 - _442) * -7.5f;
      float _486 = rsqrt(dot(float2(_483, _484), float2(_483, _484)));
      float _499 = _426 + -0.5f;
      float _500 = _427 + -0.5f;
      float _547 = _25 + -0.5f;
      float _548 = _26 + -0.5f;
      float _555 = ((frame_consts.time - sqrt((_548 * _548) + (_547 * _547))) + (frac(sin(dot(float2((_426 * 5.0f), (_427 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _559 = frac(abs(_555));
      float _563 = max((select((_555 >= (-0.0f - _555)), _559, (-0.0f - _559)) * 18.0f), 0.0f);
      float _579 = min(max((1.0f - (((((_563 * 1.600000023841858f) * exp2(1.4426950216293335f - (_563 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_500 * _500) + (_499 * _499)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_426 * 3.0f), (_427 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_426, _427), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_426 * 2.0f), (_427 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _585 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_442 * 7.5f) - _406), ((_446 * 15.0f) - _407)), float2((_459 * _462), (_462 * _460))))), abs(dot(float2((_419 - _406), ((_450 * 15.0f) - _407)), float2((_474 * _471), (_474 * _472))))), abs(dot(float2(((_452 * 7.5f) - _406), ((_455 * 15.0f) - _407)), float2((_486 * _483), (_486 * _484))))) * 0.2309400886297226f)) - _579) / ((_579 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _590 = (_585 * _396);
      _591 = (_585 * _397);
      _592 = (_585 * _398);
    } while (false);
  } else {
    _590 = _396;
    _591 = _397;
    _592 = _398;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _600 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _600 = 0.0f;
  }
  float _607 = frame_consts.params.vignette.intensity + _600;
  float _622 = exp2(log2(saturate((_607 * abs(_25 + -0.5f)) * ((((_15 / _16) + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _623 = exp2(log2(saturate(_607 * abs(_26 + -0.5f))) * 5.0f);
  float _636 = 1.0f - ((1.0f - exp2(log2(saturate(1.0f - dot(float2(_622, _623), float2(_622, _623)))) * 6.0f)) * 0.8500000238418579f);
  float _643 = (_636 * (_590 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _644 = (_636 * (_591 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _645 = (_636 * (_592 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  if (frame_consts.flashback_lut > 0.0f) {
    float _654 = ((_643 * 0.3930000066757202f) + (_644 * 0.7689999938011169f)) + (_645 * 0.1889999955892563f);
    float _659 = ((_643 * 0.3490000069141388f) + (_644 * 0.6859999895095825f)) + (_645 * 0.1679999977350235f);
    float _664 = ((_643 * 0.2720000147819519f) + (_644 * 0.5339999794960022f)) + (_645 * 0.13099999725818634f);
    float _665 = frame_consts.flashback_lut * 0.800000011920929f;
    float _670 = ((_643 * 0.2125999927520752f) + (_644 * 0.7152000069618225f)) + (_645 * 0.0722000002861023f);
    _690 = ((((_654 - _643) + ((_670 - _654) * 0.6499999761581421f)) * _665) + _643);
    _691 = ((((_659 - _644) + ((_670 - _659) * 0.6499999761581421f)) * _665) + _644);
    _692 = ((((_664 - _645) + ((_670 - _664) * 0.6499999761581421f)) * _665) + _645);
  } else {
    _690 = _643;
    _691 = _644;
    _692 = _645;
  }
  if (!(frame_consts.invert == 0)) {
    _701 = (1.0f - _690);
    _702 = (1.0f - _691);
    _703 = (1.0f - _692);
  } else {
    _701 = _690;
    _702 = _691;
    _703 = _692;
  }
  SV_Target.x = _701;
  SV_Target.y = _702;
  SV_Target.z = _703;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
