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

Texture2D<float3> color_correct_lut : register(t8);

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
  float _16 = float((int)(frame_consts.vp_dim.x));
  float _17 = float((int)(frame_consts.vp_dim.y));
  float2 _18 = distortion.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _21 = _17 / _16;
  float _26 = saturate((_18.x * _21) + O_Uv.x);
  float _27 = saturate((_18.y * _21) + O_Uv.y);
  float _59;
  float _60;
  float _61;
  float _62;
  float _110;
  float _121;
  float _132;
  float _298;
  float _309;
  float _320;
  float _343;
  float _344;
  float _345;
  float _470;
  float _471;
  float _472;
  float _513;
  float _514;
  float _515;
  float _664;
  float _665;
  float _666;
  float _674;
  float _931;
  float _932;
  float _933;
  float _978;
  float _979;
  float _980;
  float _989;
  float _990;
  float _991;
  if (frame_consts.params.chroma_aberration.intensity > 0.0f) {
    float _34 = abs(_26 + -0.5f);
    float _35 = abs(_27 + -0.5f);
    float _39 = (rsqrt(dot(float2(_34, _35), float2(_34, _35))) * 0.009999999776482582f) * frame_consts.params.chroma_aberration.intensity;
    float _40 = _39 * _34;
    float _41 = _39 * _35;
    float4 _44 = tex.SampleLevel(sampler_nearest, float2((_40 + _26), (_41 + _27)), 0.0f);
    float4 _46 = tex.SampleLevel(sampler_nearest, float2(_26, _27), 0.0f);
    float4 _50 = tex.SampleLevel(sampler_nearest, float2((_26 - _40), (_27 - _41)), 0.0f);
    _59 = _44.x;
    _60 = _46.y;
    _61 = _50.z;
    _62 = 0.5f;
  } else {
    float4 _53 = tex.SampleLevel(sampler_nearest, float2(_26, _27), 0.0f);
    _59 = _53.x;
    _60 = _53.y;
    _61 = _53.z;
    _62 = _53.w;
  }
  float3 untonemapped = float3(_59, _60, _61);

  float3 _63 = bloom_tex.SampleLevel(sampler_bilinear, float2(_26, _27), 0.0f);
  float _78 = max((((1.0f - (_59 * 0.2125999927520752f)) - (_60 * 0.7152000069618225f)) - (_61 * 0.0722000002861023f)), 0.0010000000474974513f);
  float _82 = (_59 / _78) + (frame_consts.params.bloom.intensity * _63.x);
  float _83 = (_60 / _78) + (frame_consts.params.bloom.intensity * _63.y);
  float _84 = (_61 / _78) + (frame_consts.params.bloom.intensity * _63.z);
  float _90 = (((_82 * 0.2125999927520752f) + 1.0f) + (_83 * 0.7152000069618225f)) + (_84 * 0.0722000002861023f);
  float _94 = saturate(_82 / _90);
  float _95 = saturate(_83 / _90);
  float _96 = saturate(_84 / _90);
  uint2 _97; color_correct_lut.GetDimensions(_97.x, _97.y);
  if (!(!(_94 <= 0.0031308000907301903f))) {
    _110 = (_94 * 12.920000076293945f);
  } else {
    _110 = (((pow(_94, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_95 <= 0.0031308000907301903f))) {
    _121 = (_95 * 12.920000076293945f);
  } else {
    _121 = (((pow(_95, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_96 <= 0.0031308000907301903f))) {
    _132 = (_96 * 12.920000076293945f);
  } else {
    _132 = (((pow(_96, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  float _135 = float((uint)(_97.y + -1u));
  float _138 = _132 * _135;
  float _139 = frac(_138);
  float _141 = float((uint)_97.y);
  float _143 = (_110 * _135) + 0.5f;
  float _146 = float((uint)_97.x);
  float _148 = (lerp(_121, 1.0f, _135)) / _141;
  float3 _149 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((ceil(_138) * _141) + _143) / _146), _148), 0.0f);
  float3 _157 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((floor(_138) * _141) + _143) / _146), _148), 0.0f);
  float _167 = ((_149.x - _157.x) * _139) + _157.x;
  float _168 = ((_149.y - _157.y) * _139) + _157.y;
  float _169 = ((_149.z - _157.z) * _139) + _157.z;
  if (!(frame_consts.glitch == 0)) {
    float _177 = float((int)(int((_16 / _17) * 1080.0f)));
    float _178 = _177 * _26;
    float _179 = _27 * 1080.0f;
    float _180 = _177 * 0.5f;
    float _183 = max(frame_consts.khlia_pulse_t, 0.0f);
    float _190 = max((frame_consts.khlia_pulse_t + -0.30000001192092896f), 0.0f);
    float _196 = ((_190 * 3.0f) * exp2(1.4426950216293335f - (_190 * 4.328084945678711f))) + ((_183 * 5.0f) * exp2(1.4426950216293335f - (_183 * 7.213475227355957f)));
    float _197 = _196 * 15.0f;
    float _198 = _197 + 30.0f;
    float _200 = (_196 * 20.0f) + 80.0f;
    float _204 = abs(_177 * (_26 + -0.5f));
    float _205 = abs(_179 + -540.0f);
    float _208 = ((_204 - _180) + _198) + _200;
    float _211 = ((_205 + -510.0f) + _197) + _200;
    float _214 = max(_208, 0.0f);
    float _215 = max(_211, 0.0f);
    float _229 = _204 - (_180 - _198);
    float _230 = _205 - (510.0f - _197);
    float _231 = max(_229, 0.0f);
    float _232 = max(_230, 0.0f);
    float _248 = max(max(0.0f, (1.0f - saturate(abs((min(max(_208, _211), 0.0f) - _200) + sqrt((_215 * _215) + (_214 * _214))) + -0.5f))), ((1.0f - saturate(abs(min(max(_229, _230), 0.0f) + sqrt((_232 * _232) + (_231 * _231))) + -0.5f)) * (1.0f - saturate(_196 * 1.6666666269302368f))));
    float _259 = frac((_178 + _179) * 0.0012499999720603228f) + -0.5f;
    float _260 = frac((_179 - _178) * 0.0012499999720603228f) + -0.5f;
    float _272 = saturate((sin((((_178 * 0.0003124999930150807f) + (_27 * 0.3375000059604645f)) * 20.0f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _276 = (_272 * _272) * (3.0f - (_272 * 2.0f));
    float _278 = saturate(sqrt((_260 * _260) + (_259 * _259)) * 2.0f);
    float _283 = _276 * 0.20000000298023224f;
    float _285 = ((_278 * 0.12156862020492554f) + 0.7450979948043823f) + _283;
    float _286 = ((_278 * 0.3333333134651184f) + 0.34117645025253296f) + _283;
    do {
      if (!(!((_283 + 0.9803921580314636f) <= 0.040449999272823334f))) {
        _298 = ((_276 * 0.015479876659810543f) + 0.07588174939155579f);
      } else {
        _298 = exp2(log2((_276 * 0.18957345187664032f) + 0.9814143776893616f) * 2.4000000953674316f);
      }
      do {
        if (!(!(_285 <= 0.040449999272823334f))) {
          _309 = (_285 * 0.07739938050508499f);
        } else {
          _309 = exp2(log2((_285 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
        }
        do {
          if (!(!(_286 <= 0.040449999272823334f))) {
            _320 = (_286 * 0.07739938050508499f);
          } else {
            _320 = exp2(log2((_286 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
          }
          float _326 = (((_298 * 0.2125999927520752f) + 1.0f) + (_309 * 0.7152000069618225f)) + (_320 * 0.0722000002861023f);
          _343 = (((saturate(_298 / _326) - _167) * _248) + _167);
          _344 = (((saturate(_309 / _326) - _168) * _248) + _168);
          _345 = (((saturate(_320 / _326) - _169) * _248) + _169);
        } while (false);
      } while (false);
    } while (false);
  } else {
    _343 = _167;
    _344 = _168;
    _345 = _169;
  }
  float _351 = depth_tex.SampleLevel(sampler_nearest, float2(_26, _27), 0.0f);
  float _355 = 10000.0f / ((_351.x * 19999.5f) + 0.5f);
  float _360 = (_355 * ((_26 * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _362 = (_355 * (((1.0f - _27) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _363 = -0.0f - _355;
  float _387 = mad((frame_consts.paper_xf[2].z), _363, mad((frame_consts.paper_xf[1].z), _362, (_360 * (frame_consts.paper_xf[0].z))));
  float _388 = mad((frame_consts.paper_xf[2].x), _363, mad((frame_consts.paper_xf[1].x), _362, (_360 * (frame_consts.paper_xf[0].x)))) / _387;
  float _389 = mad((frame_consts.paper_xf[2].y), _363, mad((frame_consts.paper_xf[1].y), _362, (_360 * (frame_consts.paper_xf[0].y)))) / _387;
  float _401 = exp2(round(log2(max(5.0f, (-0.0f - (_387 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _403 = min((1.0f / _401), 0.20000000298023224f);
  float _404 = frame_consts.game_plane_blend.x - _401;
  float _411 = frame_consts.game_plane_blend.x + 10.0f;
  float _419 = exp2(round(log2(max(5.0f, (-0.0f - (_387 - _411)))) * 10.0f) * 0.10000000149011612f);
  float _421 = min((1.0f / _419), 0.20000000298023224f);
  float _422 = _411 - _419;
  float _429 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_404 * _388) + (frame_consts.paper_xf[3].x)) * _403), (((_404 * _389) + (frame_consts.paper_xf[3].y)) * _403)), 0.0f);
  float _432 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_422 * _388) + (frame_consts.paper_xf[3].x)) * _421), (((_422 * _389) + (frame_consts.paper_xf[3].y)) * _421)), 0.0f);
  float _439 = ((1.0f - (_429.x * (1.0f - frame_consts.game_plane_blend.y))) - (_432.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _443 = _343 - (_439 * _343);
  float _444 = _344 - (_439 * _344);
  float _445 = _345 - (_439 * _345);
  if (!(frame_consts.death_screen == 0)) {
    float _468 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _62), _62);
    _470 = _468;
    _471 = _468;
    _472 = _468;
  } else {
    _470 = (lerp(_443, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _471 = (lerp(_444, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _472 = (lerp(_445, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _480 = _26 * _16;
    float _481 = _27 * _17;
    float _482 = _480 * 0.06666667014360428f;
    float _483 = _481 * 0.038490019738674164f;
    float _485 = ceil(_482 - _483);
    float _487 = floor(_481 * 0.07698003947734833f);
    float _488 = _487 + 1.0f;
    float _491 = ceil((-0.0f - _482) - _483);
    float _493 = (_485 - _491) * 7.5f;
    float _494 = _485 * 0.28867512941360474f;
    float _495 = _488 * 0.5773502588272095f;
    float _496 = _495 - _494;
    float _497 = _491 * 0.28867512941360474f;
    float _500 = _493 / _16;
    float _501 = ((_496 - _497) * 15.0f) / _17;
    do {
      if (((_488 + _485) + _491) == 2.0f) {
        _513 = (_485 + 1.0f);
        _514 = (_487 + 2.0f);
        _515 = (_491 + 1.0f);
      } else {
        _513 = (_485 + -1.0f);
        _514 = _487;
        _515 = (_491 + -1.0f);
      }
      float _516 = _513 - _491;
      float _519 = _495 - (_513 * 0.28867512941360474f);
      float _520 = _519 - _497;
      float _523 = (_514 * 0.5773502588272095f) - _494;
      float _524 = _523 - _497;
      float _526 = _485 - _515;
      float _529 = _496 - (_515 * 0.28867512941360474f);
      float _533 = (_519 - _523) * 15.0f;
      float _534 = (_513 - _485) * -7.5f;
      float _536 = rsqrt(dot(float2(_533, _534), float2(_533, _534)));
      float _545 = (_524 - _529) * 15.0f;
      float _546 = (_515 - _491) * -7.5f;
      float _548 = rsqrt(dot(float2(_545, _546), float2(_545, _546)));
      float _557 = (_529 - _520) * 15.0f;
      float _558 = (_526 - _516) * -7.5f;
      float _560 = rsqrt(dot(float2(_557, _558), float2(_557, _558)));
      float _573 = _500 + -0.5f;
      float _574 = _501 + -0.5f;
      float _621 = _26 + -0.5f;
      float _622 = _27 + -0.5f;
      float _629 = ((frame_consts.time - sqrt((_622 * _622) + (_621 * _621))) + (frac(sin(dot(float2((_500 * 5.0f), (_501 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _633 = frac(abs(_629));
      float _637 = max((select((_629 >= (-0.0f - _629)), _633, (-0.0f - _633)) * 18.0f), 0.0f);
      float _653 = min(max((1.0f - (((((_637 * 1.600000023841858f) * exp2(1.4426950216293335f - (_637 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_574 * _574) + (_573 * _573)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_500 * 3.0f), (_501 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_500, _501), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_500 * 2.0f), (_501 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _659 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_516 * 7.5f) - _480), ((_520 * 15.0f) - _481)), float2((_533 * _536), (_536 * _534))))), abs(dot(float2((_493 - _480), ((_524 * 15.0f) - _481)), float2((_548 * _545), (_548 * _546))))), abs(dot(float2(((_526 * 7.5f) - _480), ((_529 * 15.0f) - _481)), float2((_560 * _557), (_560 * _558))))) * 0.2309400886297226f)) - _653) / ((_653 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _664 = (_659 * _470);
      _665 = (_659 * _471);
      _666 = (_659 * _472);
    } while (false);
  } else {
    _664 = _470;
    _665 = _471;
    _666 = _472;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _674 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _674 = 0.0f;
  }
  float _681 = frame_consts.params.vignette.intensity + _674;
  float _684 = _16 / _17;
  float _696 = exp2(log2(saturate((_681 * abs(_26 + -0.5f)) * (((_684 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _697 = exp2(log2(saturate(_681 * abs(_27 + -0.5f))) * 5.0f);
  float _703 = exp2(log2(saturate(1.0f - dot(float2(_696, _697), float2(_696, _697)))) * 6.0f);
  float _708 = 1.0f - _703;
  float _710 = 1.0f - (_708 * 0.8500000238418579f);
  float _717 = (_710 * (_664 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _718 = (_710 * (_665 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _719 = (_710 * (_666 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _723 = ((_703 * 1.2000000476837158f) * _708) * frame_consts.params.vignette.golden_intensity;
  if (_723 > 0.0020000000949949026f) {
    float _728 = _26 * _16;
    float _729 = _27 * _17;
    float _730 = _729 + _728;
    float _736 = frac(_730 * 0.0033333334140479565f) + -0.5f;
    float _737 = frac((_729 - _728) * 0.0033333334140479565f) + -0.5f;
    float _743 = saturate(sqrt((_737 * _737) + (_736 * _736)) * 2.0f);
    float _754 = saturate((sin((_730 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _759 = ((_754 * _754) * 0.2199999988079071f) * (3.0f - (_754 * 2.0f));
    float _760 = _759 + 0.9777389168739319f;
    float _761 = ((_743 * 0.13274884223937988f) + 0.7175776362419128f) + _759;
    float _762 = ((_743 * 0.3335757553577423f) + 0.30871906876564026f) + _759;
    float _767 = (_26 * 1080.0f) * _684;
    float _768 = _27 * 1080.0f;
    float _769 = _767 * 0.04444444552063942f;
    float _770 = _27 * 27.712812423706055f;
    float _772 = ceil(_769 - _770);
    float _775 = floor(_27 * 55.42562484741211f) + 1.0f;
    float _778 = ceil((-0.0f - _770) - _769);
    float _780 = (_775 + _772) + _778;
    float _782 = (_780 * 22.5f) + -33.75f;
    float _784 = (_772 - _778) * 11.25f;
    float _790 = (((_775 * 0.5773502588272095f) - (_772 * 0.28867512941360474f)) - (_778 * 0.28867512941360474f)) * 22.5f;
    float _793 = _782 + _784;
    float _794 = _790 + (19.485570907592773f - (_780 * 12.990381240844727f));
    float _797 = ((_780 * 25.980762481689453f) + -38.97114181518555f) + _790;
    float _798 = _784 - _782;
    float _799 = _793 - _767;
    float _800 = _794 - _768;
    float _803 = _784 - _767;
    float _804 = _797 - _768;
    float _809 = _800 * _800;
    float _816 = _798 - _767;
    float _820 = frame_consts.time * 0.30000001192092896f;
    float _821 = _794 * 0.4000000059604645f;
    float _830 = sin(((_794 * 0.04444444552063942f) + _820) * 2.0f);
    float _835 = saturate((sqrt(_830 * cos((((_821 + _793) * 0.04444444552063942f) + _820) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _839 = (_835 * _835) * (3.0f - (_835 * 2.0f));
    float _841 = (_839 * 0.6499999761581421f) + 0.3499999940395355f;
    float _856 = saturate((sqrt(sin(((_797 * 0.04444444552063942f) + _820) * 2.0f) * cos(((((_797 * 0.4000000059604645f) + _784) * 0.04444444552063942f) + _820) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _860 = (_856 * _856) * (3.0f - (_856 * 2.0f));
    float _862 = (_860 * 0.6499999761581421f) + 0.3499999940395355f;
    float _872 = saturate((sqrt(cos((((_821 + _798) * 0.04444444552063942f) + _820) * 2.0f) * _830) * 2.0f) + 0.20000004768371582f);
    float _876 = (_872 * _872) * (3.0f - (_872 * 2.0f));
    float _878 = (_876 * 0.6499999761581421f) + 0.3499999940395355f;
    float _900 = saturate(_841);
    float _901 = saturate(_862);
    float _920 = ((((saturate(11.0f - (sqrt((_804 * _804) + (_803 * _803)) / ((_860 * 0.039000000804662704f) + 0.08100000768899918f))) * _862) + (saturate(11.0f - (sqrt((_799 * _799) + _809) / ((_839 * 0.039000000804662704f) + 0.08100000768899918f))) * _841)) + (saturate(11.0f - (sqrt((_816 * _816) + _809) / ((_876 * 0.039000000804662704f) + 0.08100000768899918f))) * _878)) + (((((saturate(1.0f - (abs(_800) * 0.8333333134651184f)) * _900) + (saturate(1.0f - (abs(dot(float2(_803, _804), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _901)) * saturate(_878)) + ((_900 * saturate(1.0f - (abs(dot(float2(_799, _800), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _901)) * 0.5f)) * _723;
    _931 = ((_920 * ((_760 * _760) - _717)) + _717);
    _932 = ((_920 * ((_761 * _761) - _718)) + _718);
    _933 = ((_920 * ((_762 * _762) - _719)) + _719);
  } else {
    _931 = _717;
    _932 = _718;
    _933 = _719;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _942 = ((_932 * 0.7689999938011169f) + (_931 * 0.3930000066757202f)) + (_933 * 0.1889999955892563f);
    float _947 = ((_932 * 0.6859999895095825f) + (_931 * 0.3490000069141388f)) + (_933 * 0.1679999977350235f);
    float _952 = ((_932 * 0.5339999794960022f) + (_931 * 0.2720000147819519f)) + (_933 * 0.13099999725818634f);
    float _953 = frame_consts.flashback_lut * 0.800000011920929f;
    float _958 = ((_932 * 0.7152000069618225f) + (_931 * 0.2125999927520752f)) + (_933 * 0.0722000002861023f);
    _978 = ((((_942 - _931) + ((_958 - _942) * 0.6499999761581421f)) * _953) + _931);
    _979 = ((((_947 - _932) + ((_958 - _947) * 0.6499999761581421f)) * _953) + _932);
    _980 = ((((_952 - _933) + ((_958 - _952) * 0.6499999761581421f)) * _953) + _933);
  } else {
    _978 = _931;
    _979 = _932;
    _980 = _933;
  }
  if (!(frame_consts.invert == 0)) {
    _989 = (1.0f - _978);
    _990 = (1.0f - _979);
    _991 = (1.0f - _980);
  } else {
    _989 = _978;
    _990 = _979;
    _991 = _980;
  }
  SV_Target.x = _989;
  SV_Target.y = _990;
  SV_Target.z = _991;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
