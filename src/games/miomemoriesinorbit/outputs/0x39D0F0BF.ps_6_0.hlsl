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
  float _462;
  float _463;
  float _464;
  float _505;
  float _506;
  float _507;
  float _656;
  float _657;
  float _658;
  float _666;
  float _756;
  float _757;
  float _758;
  float _767;
  float _768;
  float _769;
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
  float _396 = log2(max(5.0f, (-0.0f - (_387 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _397 = floor(_396);
  float _398 = _396 - _397;
  float _400 = exp2(_397 * 0.10000000149011612f);
  float _401 = 1.0f / _400;
  float _402 = min(_401, 0.20000000298023224f);
  float _404 = min((_401 * 0.9330329895019531f), 0.20000000298023224f);
  float _405 = frame_consts.game_plane_blend.x - _400;
  float _411 = frame_consts.game_plane_blend.x - (_400 * 1.0717734098434448f);
  float _421 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_405 * _388) + (frame_consts.paper_xf[3].x)) * _402), (((_405 * _389) + (frame_consts.paper_xf[3].y)) * _402)), 0.0f);
  float _424 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_411 * _388) + (frame_consts.paper_xf[3].x)) * _404), (((_411 * _389) + (frame_consts.paper_xf[3].y)) * _404)), 0.0f);
  float _431 = ((1.0f - (_421.x * (1.0f - _398))) - (_424.x * _398)) * frame_consts.paper_mult;
  float _435 = _343 - (_431 * _343);
  float _436 = _344 - (_431 * _344);
  float _437 = _345 - (_431 * _345);
  if (!(frame_consts.death_screen == 0)) {
    float _460 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _62), _62);
    _462 = _460;
    _463 = _460;
    _464 = _460;
  } else {
    _462 = (lerp(_435, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _463 = (lerp(_436, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _464 = (lerp(_437, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _472 = _26 * _16;
    float _473 = _27 * _17;
    float _474 = _472 * 0.06666667014360428f;
    float _475 = _473 * 0.038490019738674164f;
    float _477 = ceil(_474 - _475);
    float _479 = floor(_473 * 0.07698003947734833f);
    float _480 = _479 + 1.0f;
    float _483 = ceil((-0.0f - _474) - _475);
    float _485 = (_477 - _483) * 7.5f;
    float _486 = _477 * 0.28867512941360474f;
    float _487 = _480 * 0.5773502588272095f;
    float _488 = _487 - _486;
    float _489 = _483 * 0.28867512941360474f;
    float _492 = _485 / _16;
    float _493 = ((_488 - _489) * 15.0f) / _17;
    do {
      if (((_480 + _477) + _483) == 2.0f) {
        _505 = (_477 + 1.0f);
        _506 = (_479 + 2.0f);
        _507 = (_483 + 1.0f);
      } else {
        _505 = (_477 + -1.0f);
        _506 = _479;
        _507 = (_483 + -1.0f);
      }
      float _508 = _505 - _483;
      float _511 = _487 - (_505 * 0.28867512941360474f);
      float _512 = _511 - _489;
      float _515 = (_506 * 0.5773502588272095f) - _486;
      float _516 = _515 - _489;
      float _518 = _477 - _507;
      float _521 = _488 - (_507 * 0.28867512941360474f);
      float _525 = (_511 - _515) * 15.0f;
      float _526 = (_505 - _477) * -7.5f;
      float _528 = rsqrt(dot(float2(_525, _526), float2(_525, _526)));
      float _537 = (_516 - _521) * 15.0f;
      float _538 = (_507 - _483) * -7.5f;
      float _540 = rsqrt(dot(float2(_537, _538), float2(_537, _538)));
      float _549 = (_521 - _512) * 15.0f;
      float _550 = (_518 - _508) * -7.5f;
      float _552 = rsqrt(dot(float2(_549, _550), float2(_549, _550)));
      float _565 = _492 + -0.5f;
      float _566 = _493 + -0.5f;
      float _613 = _26 + -0.5f;
      float _614 = _27 + -0.5f;
      float _621 = ((frame_consts.time - sqrt((_614 * _614) + (_613 * _613))) + (frac(sin(dot(float2((_492 * 5.0f), (_493 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _625 = frac(abs(_621));
      float _629 = max((select((_621 >= (-0.0f - _621)), _625, (-0.0f - _625)) * 18.0f), 0.0f);
      float _645 = min(max((1.0f - (((((_629 * 1.600000023841858f) * exp2(1.4426950216293335f - (_629 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_566 * _566) + (_565 * _565)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_492 * 3.0f), (_493 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_492, _493), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_492 * 2.0f), (_493 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _651 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_508 * 7.5f) - _472), ((_512 * 15.0f) - _473)), float2((_525 * _528), (_528 * _526))))), abs(dot(float2((_485 - _472), ((_516 * 15.0f) - _473)), float2((_540 * _537), (_540 * _538))))), abs(dot(float2(((_518 * 7.5f) - _472), ((_521 * 15.0f) - _473)), float2((_552 * _549), (_552 * _550))))) * 0.2309400886297226f)) - _645) / ((_645 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _656 = (_651 * _462);
      _657 = (_651 * _463);
      _658 = (_651 * _464);
    } while (false);
  } else {
    _656 = _462;
    _657 = _463;
    _658 = _464;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _666 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _666 = 0.0f;
  }
  float _673 = frame_consts.params.vignette.intensity + _666;
  float _688 = exp2(log2(saturate((_673 * abs(_26 + -0.5f)) * ((((_16 / _17) + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _689 = exp2(log2(saturate(_673 * abs(_27 + -0.5f))) * 5.0f);
  float _702 = 1.0f - ((1.0f - exp2(log2(saturate(1.0f - dot(float2(_688, _689), float2(_688, _689)))) * 6.0f)) * 0.8500000238418579f);
  float _709 = (_702 * (_656 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _710 = (_702 * (_657 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _711 = (_702 * (_658 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  if (frame_consts.flashback_lut > 0.0f) {
    float _720 = ((_709 * 0.3930000066757202f) + (_710 * 0.7689999938011169f)) + (_711 * 0.1889999955892563f);
    float _725 = ((_709 * 0.3490000069141388f) + (_710 * 0.6859999895095825f)) + (_711 * 0.1679999977350235f);
    float _730 = ((_709 * 0.2720000147819519f) + (_710 * 0.5339999794960022f)) + (_711 * 0.13099999725818634f);
    float _731 = frame_consts.flashback_lut * 0.800000011920929f;
    float _736 = ((_709 * 0.2125999927520752f) + (_710 * 0.7152000069618225f)) + (_711 * 0.0722000002861023f);
    _756 = ((((_720 - _709) + ((_736 - _720) * 0.6499999761581421f)) * _731) + _709);
    _757 = ((((_725 - _710) + ((_736 - _725) * 0.6499999761581421f)) * _731) + _710);
    _758 = ((((_730 - _711) + ((_736 - _730) * 0.6499999761581421f)) * _731) + _711);
  } else {
    _756 = _709;
    _757 = _710;
    _758 = _711;
  }
  if (!(frame_consts.invert == 0)) {
    _767 = (1.0f - _756);
    _768 = (1.0f - _757);
    _769 = (1.0f - _758);
  } else {
    _767 = _756;
    _768 = _757;
    _769 = _758;
  }
  SV_Target.x = _767;
  SV_Target.y = _768;
  SV_Target.z = _769;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
