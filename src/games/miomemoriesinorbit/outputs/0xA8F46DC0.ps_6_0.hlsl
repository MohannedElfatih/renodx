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
  float _388;
  float _389;
  float _390;
  float _431;
  float _432;
  float _433;
  float _582;
  float _583;
  float _584;
  float _592;
  float _849;
  float _850;
  float _851;
  float _896;
  float _897;
  float _898;
  float _907;
  float _908;
  float _909;
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
  float _322 = log2(max(5.0f, (-0.0f - (_313 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _323 = floor(_322);
  float _324 = _322 - _323;
  float _326 = exp2(_323 * 0.10000000149011612f);
  float _327 = 1.0f / _326;
  float _328 = min(_327, 0.20000000298023224f);
  float _330 = min((_327 * 0.9330329895019531f), 0.20000000298023224f);
  float _331 = frame_consts.game_plane_blend.x - _326;
  float _337 = frame_consts.game_plane_blend.x - (_326 * 1.0717734098434448f);
  float _347 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_331 * _314) + (frame_consts.paper_xf[3].x)) * _328), (((_331 * _315) + (frame_consts.paper_xf[3].y)) * _328)), 0.0f);
  float _350 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_337 * _314) + (frame_consts.paper_xf[3].x)) * _330), (((_337 * _315) + (frame_consts.paper_xf[3].y)) * _330)), 0.0f);
  float _357 = ((1.0f - (_347.x * (1.0f - _324))) - (_350.x * _324)) * frame_consts.paper_mult;
  float _361 = _269 - (_357 * _269);
  float _362 = _270 - (_357 * _270);
  float _363 = _271 - (_357 * _271);
  if (!(frame_consts.death_screen == 0)) {
    float _386 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _61), _61);
    _388 = _386;
    _389 = _386;
    _390 = _386;
  } else {
    _388 = (lerp(_361, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _389 = (lerp(_362, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _390 = (lerp(_363, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _398 = _25 * _15;
    float _399 = _26 * _16;
    float _400 = _398 * 0.06666667014360428f;
    float _401 = _399 * 0.038490019738674164f;
    float _403 = ceil(_400 - _401);
    float _405 = floor(_399 * 0.07698003947734833f);
    float _406 = _405 + 1.0f;
    float _409 = ceil((-0.0f - _400) - _401);
    float _411 = (_403 - _409) * 7.5f;
    float _412 = _403 * 0.28867512941360474f;
    float _413 = _406 * 0.5773502588272095f;
    float _414 = _413 - _412;
    float _415 = _409 * 0.28867512941360474f;
    float _418 = _411 / _15;
    float _419 = ((_414 - _415) * 15.0f) / _16;
    do {
      if (((_406 + _403) + _409) == 2.0f) {
        _431 = (_403 + 1.0f);
        _432 = (_405 + 2.0f);
        _433 = (_409 + 1.0f);
      } else {
        _431 = (_403 + -1.0f);
        _432 = _405;
        _433 = (_409 + -1.0f);
      }
      float _434 = _431 - _409;
      float _437 = _413 - (_431 * 0.28867512941360474f);
      float _438 = _437 - _415;
      float _441 = (_432 * 0.5773502588272095f) - _412;
      float _442 = _441 - _415;
      float _444 = _403 - _433;
      float _447 = _414 - (_433 * 0.28867512941360474f);
      float _451 = (_437 - _441) * 15.0f;
      float _452 = (_431 - _403) * -7.5f;
      float _454 = rsqrt(dot(float2(_451, _452), float2(_451, _452)));
      float _463 = (_442 - _447) * 15.0f;
      float _464 = (_433 - _409) * -7.5f;
      float _466 = rsqrt(dot(float2(_463, _464), float2(_463, _464)));
      float _475 = (_447 - _438) * 15.0f;
      float _476 = (_444 - _434) * -7.5f;
      float _478 = rsqrt(dot(float2(_475, _476), float2(_475, _476)));
      float _491 = _418 + -0.5f;
      float _492 = _419 + -0.5f;
      float _539 = _25 + -0.5f;
      float _540 = _26 + -0.5f;
      float _547 = ((frame_consts.time - sqrt((_540 * _540) + (_539 * _539))) + (frac(sin(dot(float2((_418 * 5.0f), (_419 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _551 = frac(abs(_547));
      float _555 = max((select((_547 >= (-0.0f - _547)), _551, (-0.0f - _551)) * 18.0f), 0.0f);
      float _571 = min(max((1.0f - (((((_555 * 1.600000023841858f) * exp2(1.4426950216293335f - (_555 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_492 * _492) + (_491 * _491)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_418 * 3.0f), (_419 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_418, _419), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_418 * 2.0f), (_419 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _577 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_434 * 7.5f) - _398), ((_438 * 15.0f) - _399)), float2((_451 * _454), (_454 * _452))))), abs(dot(float2((_411 - _398), ((_442 * 15.0f) - _399)), float2((_466 * _463), (_466 * _464))))), abs(dot(float2(((_444 * 7.5f) - _398), ((_447 * 15.0f) - _399)), float2((_478 * _475), (_478 * _476))))) * 0.2309400886297226f)) - _571) / ((_571 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _582 = (_577 * _388);
      _583 = (_577 * _389);
      _584 = (_577 * _390);
    } while (false);
  } else {
    _582 = _388;
    _583 = _389;
    _584 = _390;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _592 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _592 = 0.0f;
  }
  float _599 = frame_consts.params.vignette.intensity + _592;
  float _602 = _15 / _16;
  float _614 = exp2(log2(saturate((_599 * abs(_25 + -0.5f)) * (((_602 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _615 = exp2(log2(saturate(_599 * abs(_26 + -0.5f))) * 5.0f);
  float _621 = exp2(log2(saturate(1.0f - dot(float2(_614, _615), float2(_614, _615)))) * 6.0f);
  float _626 = 1.0f - _621;
  float _628 = 1.0f - (_626 * 0.8500000238418579f);
  float _635 = (_628 * (_582 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _636 = (_628 * (_583 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _637 = (_628 * (_584 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _641 = ((_621 * 1.2000000476837158f) * _626) * frame_consts.params.vignette.golden_intensity;
  if (_641 > 0.0020000000949949026f) {
    float _646 = _25 * _15;
    float _647 = _26 * _16;
    float _648 = _647 + _646;
    float _654 = frac(_648 * 0.0033333334140479565f) + -0.5f;
    float _655 = frac((_647 - _646) * 0.0033333334140479565f) + -0.5f;
    float _661 = saturate(sqrt((_655 * _655) + (_654 * _654)) * 2.0f);
    float _672 = saturate((sin((_648 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _677 = ((_672 * _672) * 0.2199999988079071f) * (3.0f - (_672 * 2.0f));
    float _678 = _677 + 0.9777389168739319f;
    float _679 = ((_661 * 0.13274884223937988f) + 0.7175776362419128f) + _677;
    float _680 = ((_661 * 0.3335757553577423f) + 0.30871906876564026f) + _677;
    float _685 = (_25 * 1080.0f) * _602;
    float _686 = _26 * 1080.0f;
    float _687 = _685 * 0.04444444552063942f;
    float _688 = _26 * 27.712812423706055f;
    float _690 = ceil(_687 - _688);
    float _693 = floor(_26 * 55.42562484741211f) + 1.0f;
    float _696 = ceil((-0.0f - _688) - _687);
    float _698 = (_693 + _690) + _696;
    float _700 = (_698 * 22.5f) + -33.75f;
    float _702 = (_690 - _696) * 11.25f;
    float _708 = (((_693 * 0.5773502588272095f) - (_690 * 0.28867512941360474f)) - (_696 * 0.28867512941360474f)) * 22.5f;
    float _711 = _700 + _702;
    float _712 = _708 + (19.485570907592773f - (_698 * 12.990381240844727f));
    float _715 = ((_698 * 25.980762481689453f) + -38.97114181518555f) + _708;
    float _716 = _702 - _700;
    float _717 = _711 - _685;
    float _718 = _712 - _686;
    float _721 = _702 - _685;
    float _722 = _715 - _686;
    float _727 = _718 * _718;
    float _734 = _716 - _685;
    float _738 = frame_consts.time * 0.30000001192092896f;
    float _739 = _712 * 0.4000000059604645f;
    float _748 = sin(((_712 * 0.04444444552063942f) + _738) * 2.0f);
    float _753 = saturate((sqrt(_748 * cos((((_739 + _711) * 0.04444444552063942f) + _738) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _757 = (_753 * _753) * (3.0f - (_753 * 2.0f));
    float _759 = (_757 * 0.6499999761581421f) + 0.3499999940395355f;
    float _774 = saturate((sqrt(sin(((_715 * 0.04444444552063942f) + _738) * 2.0f) * cos(((((_715 * 0.4000000059604645f) + _702) * 0.04444444552063942f) + _738) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _778 = (_774 * _774) * (3.0f - (_774 * 2.0f));
    float _780 = (_778 * 0.6499999761581421f) + 0.3499999940395355f;
    float _790 = saturate((sqrt(cos((((_739 + _716) * 0.04444444552063942f) + _738) * 2.0f) * _748) * 2.0f) + 0.20000004768371582f);
    float _794 = (_790 * _790) * (3.0f - (_790 * 2.0f));
    float _796 = (_794 * 0.6499999761581421f) + 0.3499999940395355f;
    float _818 = saturate(_759);
    float _819 = saturate(_780);
    float _838 = ((((saturate(11.0f - (sqrt((_722 * _722) + (_721 * _721)) / ((_778 * 0.039000000804662704f) + 0.08100000768899918f))) * _780) + (saturate(11.0f - (sqrt((_717 * _717) + _727) / ((_757 * 0.039000000804662704f) + 0.08100000768899918f))) * _759)) + (saturate(11.0f - (sqrt((_734 * _734) + _727) / ((_794 * 0.039000000804662704f) + 0.08100000768899918f))) * _796)) + (((((saturate(1.0f - (abs(_718) * 0.8333333134651184f)) * _818) + (saturate(1.0f - (abs(dot(float2(_721, _722), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _819)) * saturate(_796)) + ((_818 * saturate(1.0f - (abs(dot(float2(_717, _718), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _819)) * 0.5f)) * _641;
    _849 = ((_838 * ((_678 * _678) - _635)) + _635);
    _850 = ((_838 * ((_679 * _679) - _636)) + _636);
    _851 = ((_838 * ((_680 * _680) - _637)) + _637);
  } else {
    _849 = _635;
    _850 = _636;
    _851 = _637;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _860 = ((_850 * 0.7689999938011169f) + (_849 * 0.3930000066757202f)) + (_851 * 0.1889999955892563f);
    float _865 = ((_850 * 0.6859999895095825f) + (_849 * 0.3490000069141388f)) + (_851 * 0.1679999977350235f);
    float _870 = ((_850 * 0.5339999794960022f) + (_849 * 0.2720000147819519f)) + (_851 * 0.13099999725818634f);
    float _871 = frame_consts.flashback_lut * 0.800000011920929f;
    float _876 = ((_850 * 0.7152000069618225f) + (_849 * 0.2125999927520752f)) + (_851 * 0.0722000002861023f);
    _896 = ((((_860 - _849) + ((_876 - _860) * 0.6499999761581421f)) * _871) + _849);
    _897 = ((((_865 - _850) + ((_876 - _865) * 0.6499999761581421f)) * _871) + _850);
    _898 = ((((_870 - _851) + ((_876 - _870) * 0.6499999761581421f)) * _871) + _851);
  } else {
    _896 = _849;
    _897 = _850;
    _898 = _851;
  }
  if (!(frame_consts.invert == 0)) {
    _907 = (1.0f - _896);
    _908 = (1.0f - _897);
    _909 = (1.0f - _898);
  } else {
    _907 = _896;
    _908 = _897;
    _909 = _898;
  }
  SV_Target.x = _907;
  SV_Target.y = _908;
  SV_Target.z = _909;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
