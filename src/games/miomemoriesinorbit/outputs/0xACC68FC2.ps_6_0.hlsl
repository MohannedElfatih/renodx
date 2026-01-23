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
  float _14 = float((int)(frame_consts.vp_dim.x));
  float _15 = float((int)(frame_consts.vp_dim.y));
  float _47;
  float _48;
  float _49;
  float _50;
  float _213;
  float _224;
  float _235;
  float _258;
  float _259;
  float _260;
  float _421;
  float _422;
  float _423;
  float _464;
  float _465;
  float _466;
  float _615;
  float _616;
  float _617;
  float _625;
  float _715;
  float _716;
  float _717;
  float _726;
  float _727;
  float _728;
  if (frame_consts.params.chroma_aberration.intensity > 0.0f) {
    float _22 = abs(O_Uv.x + -0.5f);
    float _23 = abs(O_Uv.y + -0.5f);
    float _27 = (rsqrt(dot(float2(_22, _23), float2(_22, _23))) * 0.009999999776482582f) * frame_consts.params.chroma_aberration.intensity;
    float _28 = _27 * _22;
    float _29 = _27 * _23;
    float4 _32 = tex.SampleLevel(sampler_nearest, float2((_28 + O_Uv.x), (_29 + O_Uv.y)), 0.0f);
    float4 _34 = tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
    float4 _38 = tex.SampleLevel(sampler_nearest, float2((O_Uv.x - _28), (O_Uv.y - _29)), 0.0f);
    _47 = _32.x;
    _48 = _34.y;
    _49 = _38.z;
    _50 = 0.5f;
  } else {
    float4 _41 = tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
    _47 = _41.x;
    _48 = _41.y;
    _49 = _41.z;
    _50 = _41.w;
  }
  float3 untonemapped = float3(_47, _48, _49);

  float3 _51 = bloom_tex.SampleLevel(sampler_bilinear, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _66 = max((((1.0f - (_47 * 0.2125999927520752f)) - (_48 * 0.7152000069618225f)) - (_49 * 0.0722000002861023f)), 0.0010000000474974513f);
  float _70 = (_47 / _66) + (frame_consts.params.bloom.intensity * _51.x);
  float _71 = (_48 / _66) + (frame_consts.params.bloom.intensity * _51.y);
  float _72 = (_49 / _66) + (frame_consts.params.bloom.intensity * _51.z);
  float _78 = (((_70 * 0.2125999927520752f) + 1.0f) + (_71 * 0.7152000069618225f)) + (_72 * 0.0722000002861023f);
  float _82 = saturate(_70 / _78);
  float _83 = saturate(_71 / _78);
  float _84 = saturate(_72 / _78);
  if (!(frame_consts.glitch == 0)) {
    float _92 = float((int)(int((_14 / _15) * 1080.0f)));
    float _93 = _92 * O_Uv.x;
    float _94 = O_Uv.y * 1080.0f;
    float _95 = _92 * 0.5f;
    float _98 = max(frame_consts.khlia_pulse_t, 0.0f);
    float _105 = max((frame_consts.khlia_pulse_t + -0.30000001192092896f), 0.0f);
    float _111 = ((_105 * 3.0f) * exp2(1.4426950216293335f - (_105 * 4.328084945678711f))) + ((_98 * 5.0f) * exp2(1.4426950216293335f - (_98 * 7.213475227355957f)));
    float _112 = _111 * 15.0f;
    float _113 = _112 + 30.0f;
    float _115 = (_111 * 20.0f) + 80.0f;
    float _119 = abs(_92 * (O_Uv.x + -0.5f));
    float _120 = abs(_94 + -540.0f);
    float _123 = ((_119 - _95) + _113) + _115;
    float _126 = ((_120 + -510.0f) + _112) + _115;
    float _129 = max(_123, 0.0f);
    float _130 = max(_126, 0.0f);
    float _144 = _119 - (_95 - _113);
    float _145 = _120 - (510.0f - _112);
    float _146 = max(_144, 0.0f);
    float _147 = max(_145, 0.0f);
    float _163 = max(max(0.0f, (1.0f - saturate(abs((min(max(_123, _126), 0.0f) - _115) + sqrt((_130 * _130) + (_129 * _129))) + -0.5f))), ((1.0f - saturate(abs(min(max(_144, _145), 0.0f) + sqrt((_147 * _147) + (_146 * _146))) + -0.5f)) * (1.0f - saturate(_111 * 1.6666666269302368f))));
    float _174 = frac((_93 + _94) * 0.0012499999720603228f) + -0.5f;
    float _175 = frac((_94 - _93) * 0.0012499999720603228f) + -0.5f;
    float _187 = saturate((sin((((_93 * 0.0003124999930150807f) + (O_Uv.y * 0.3375000059604645f)) * 20.0f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _191 = (_187 * _187) * (3.0f - (_187 * 2.0f));
    float _193 = saturate(sqrt((_175 * _175) + (_174 * _174)) * 2.0f);
    float _198 = _191 * 0.20000000298023224f;
    float _200 = ((_193 * 0.12156862020492554f) + 0.7450979948043823f) + _198;
    float _201 = ((_193 * 0.3333333134651184f) + 0.34117645025253296f) + _198;
    do {
      if (!(!((_198 + 0.9803921580314636f) <= 0.040449999272823334f))) {
        _213 = ((_191 * 0.015479876659810543f) + 0.07588174939155579f);
      } else {
        _213 = exp2(log2((_191 * 0.18957345187664032f) + 0.9814143776893616f) * 2.4000000953674316f);
      }
      do {
        if (!(!(_200 <= 0.040449999272823334f))) {
          _224 = (_200 * 0.07739938050508499f);
        } else {
          _224 = exp2(log2((_200 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
        }
        do {
          if (!(!(_201 <= 0.040449999272823334f))) {
            _235 = (_201 * 0.07739938050508499f);
          } else {
            _235 = exp2(log2((_201 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
          }
          float _241 = (((_213 * 0.2125999927520752f) + 1.0f) + (_224 * 0.7152000069618225f)) + (_235 * 0.0722000002861023f);
          _258 = (((saturate(_213 / _241) - _82) * _163) + _82);
          _259 = (((saturate(_224 / _241) - _83) * _163) + _83);
          _260 = (((saturate(_235 / _241) - _84) * _163) + _84);
        } while (false);
      } while (false);
    } while (false);
  } else {
    _258 = _82;
    _259 = _83;
    _260 = _84;
  }
  float _266 = depth_tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _270 = 10000.0f / ((_266.x * 19999.5f) + 0.5f);
  float _275 = (_270 * ((O_Uv.x * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _277 = (_270 * (((1.0f - O_Uv.y) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _278 = -0.0f - _270;
  float _302 = mad((frame_consts.paper_xf[2].z), _278, mad((frame_consts.paper_xf[1].z), _277, (_275 * (frame_consts.paper_xf[0].z))));
  float _303 = mad((frame_consts.paper_xf[2].x), _278, mad((frame_consts.paper_xf[1].x), _277, (_275 * (frame_consts.paper_xf[0].x)))) / _302;
  float _304 = mad((frame_consts.paper_xf[2].y), _278, mad((frame_consts.paper_xf[1].y), _277, (_275 * (frame_consts.paper_xf[0].y)))) / _302;
  float _308 = 1.0f - frame_consts.game_plane_blend.y;
  float _313 = log2(max(5.0f, (-0.0f - (_302 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _314 = floor(_313);
  float _315 = _313 - _314;
  float _317 = exp2(_314 * 0.10000000149011612f);
  float _318 = 1.0f / _317;
  float _319 = min(_318, 0.20000000298023224f);
  float _321 = min((_318 * 0.9330329895019531f), 0.20000000298023224f);
  float _322 = frame_consts.game_plane_blend.x - _317;
  float _328 = frame_consts.game_plane_blend.x - (_317 * 1.0717734098434448f);
  float _340 = frame_consts.game_plane_blend.x + 10.0f;
  float _345 = log2(max(5.0f, (-0.0f - (_302 - _340)))) * 10.0f;
  float _346 = floor(_345);
  float _347 = _345 - _346;
  float _349 = exp2(_346 * 0.10000000149011612f);
  float _350 = 1.0f / _349;
  float _351 = min(_350, 0.20000000298023224f);
  float _353 = min((_350 * 0.9330329895019531f), 0.20000000298023224f);
  float _354 = _340 - _349;
  float _360 = _340 - (_349 * 1.0717734098434448f);
  float _372 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_322 * _303) + (frame_consts.paper_xf[3].x)) * _319), (((_322 * _304) + (frame_consts.paper_xf[3].y)) * _319)), 0.0f);
  float _375 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_328 * _303) + (frame_consts.paper_xf[3].x)) * _321), (((_328 * _304) + (frame_consts.paper_xf[3].y)) * _321)), 0.0f);
  float _378 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_354 * _303) + (frame_consts.paper_xf[3].x)) * _351), (((_354 * _304) + (frame_consts.paper_xf[3].y)) * _351)), 0.0f);
  float _381 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_360 * _303) + (frame_consts.paper_xf[3].x)) * _353), (((_360 * _304) + (frame_consts.paper_xf[3].y)) * _353)), 0.0f);
  float _390 = ((((1.0f - (((1.0f - _315) * _308) * _372.x)) - ((_315 * _308) * _375.x)) - (((1.0f - _347) * frame_consts.game_plane_blend.y) * _378.x)) - ((_347 * frame_consts.game_plane_blend.y) * _381.x)) * frame_consts.paper_mult;
  float _394 = _258 - (_390 * _258);
  float _395 = _259 - (_390 * _259);
  float _396 = _260 - (_390 * _260);
  if (!(frame_consts.death_screen == 0)) {
    float _419 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _50), _50);
    _421 = _419;
    _422 = _419;
    _423 = _419;
  } else {
    _421 = (lerp(_394, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _422 = (lerp(_395, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _423 = (lerp(_396, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _431 = _14 * O_Uv.x;
    float _432 = _15 * O_Uv.y;
    float _433 = _431 * 0.06666667014360428f;
    float _434 = _432 * 0.038490019738674164f;
    float _436 = ceil(_433 - _434);
    float _438 = floor(_432 * 0.07698003947734833f);
    float _439 = _438 + 1.0f;
    float _442 = ceil((-0.0f - _433) - _434);
    float _444 = (_436 - _442) * 7.5f;
    float _445 = _436 * 0.28867512941360474f;
    float _446 = _439 * 0.5773502588272095f;
    float _447 = _446 - _445;
    float _448 = _442 * 0.28867512941360474f;
    float _451 = _444 / _14;
    float _452 = ((_447 - _448) * 15.0f) / _15;
    do {
      if (((_439 + _436) + _442) == 2.0f) {
        _464 = (_436 + 1.0f);
        _465 = (_438 + 2.0f);
        _466 = (_442 + 1.0f);
      } else {
        _464 = (_436 + -1.0f);
        _465 = _438;
        _466 = (_442 + -1.0f);
      }
      float _467 = _464 - _442;
      float _470 = _446 - (_464 * 0.28867512941360474f);
      float _471 = _470 - _448;
      float _474 = (_465 * 0.5773502588272095f) - _445;
      float _475 = _474 - _448;
      float _477 = _436 - _466;
      float _480 = _447 - (_466 * 0.28867512941360474f);
      float _484 = (_470 - _474) * 15.0f;
      float _485 = (_464 - _436) * -7.5f;
      float _487 = rsqrt(dot(float2(_484, _485), float2(_484, _485)));
      float _496 = (_475 - _480) * 15.0f;
      float _497 = (_466 - _442) * -7.5f;
      float _499 = rsqrt(dot(float2(_496, _497), float2(_496, _497)));
      float _508 = (_480 - _471) * 15.0f;
      float _509 = (_477 - _467) * -7.5f;
      float _511 = rsqrt(dot(float2(_508, _509), float2(_508, _509)));
      float _524 = _451 + -0.5f;
      float _525 = _452 + -0.5f;
      float _572 = O_Uv.x + -0.5f;
      float _573 = O_Uv.y + -0.5f;
      float _580 = ((frame_consts.time - sqrt((_573 * _573) + (_572 * _572))) + (frac(sin(dot(float2((_451 * 5.0f), (_452 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _584 = frac(abs(_580));
      float _588 = max((select((_580 >= (-0.0f - _580)), _584, (-0.0f - _584)) * 18.0f), 0.0f);
      float _604 = min(max((1.0f - (((((_588 * 1.600000023841858f) * exp2(1.4426950216293335f - (_588 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_525 * _525) + (_524 * _524)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_451 * 3.0f), (_452 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_451, _452), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_451 * 2.0f), (_452 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _610 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_467 * 7.5f) - _431), ((_471 * 15.0f) - _432)), float2((_484 * _487), (_487 * _485))))), abs(dot(float2((_444 - _431), ((_475 * 15.0f) - _432)), float2((_499 * _496), (_499 * _497))))), abs(dot(float2(((_477 * 7.5f) - _431), ((_480 * 15.0f) - _432)), float2((_511 * _508), (_511 * _509))))) * 0.2309400886297226f)) - _604) / ((_604 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _615 = (_610 * _421);
      _616 = (_610 * _422);
      _617 = (_610 * _423);
    } while (false);
  } else {
    _615 = _421;
    _616 = _422;
    _617 = _423;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _625 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _625 = 0.0f;
  }
  float _632 = frame_consts.params.vignette.intensity + _625;
  float _647 = exp2(log2(saturate((_632 * abs(O_Uv.x + -0.5f)) * ((((_14 / _15) + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _648 = exp2(log2(saturate(_632 * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _661 = 1.0f - ((1.0f - exp2(log2(saturate(1.0f - dot(float2(_647, _648), float2(_647, _648)))) * 6.0f)) * 0.8500000238418579f);
  float _668 = (_661 * (_615 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _669 = (_661 * (_616 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _670 = (_661 * (_617 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  if (frame_consts.flashback_lut > 0.0f) {
    float _679 = ((_668 * 0.3930000066757202f) + (_669 * 0.7689999938011169f)) + (_670 * 0.1889999955892563f);
    float _684 = ((_668 * 0.3490000069141388f) + (_669 * 0.6859999895095825f)) + (_670 * 0.1679999977350235f);
    float _689 = ((_668 * 0.2720000147819519f) + (_669 * 0.5339999794960022f)) + (_670 * 0.13099999725818634f);
    float _690 = frame_consts.flashback_lut * 0.800000011920929f;
    float _695 = ((_668 * 0.2125999927520752f) + (_669 * 0.7152000069618225f)) + (_670 * 0.0722000002861023f);
    _715 = ((((_679 - _668) + ((_695 - _679) * 0.6499999761581421f)) * _690) + _668);
    _716 = ((((_684 - _669) + ((_695 - _684) * 0.6499999761581421f)) * _690) + _669);
    _717 = ((((_689 - _670) + ((_695 - _689) * 0.6499999761581421f)) * _690) + _670);
  } else {
    _715 = _668;
    _716 = _669;
    _717 = _670;
  }
  if (!(frame_consts.invert == 0)) {
    _726 = (1.0f - _715);
    _727 = (1.0f - _716);
    _728 = (1.0f - _717);
  } else {
    _726 = _715;
    _727 = _716;
    _728 = _717;
  }
  SV_Target.x = _726;
  SV_Target.y = _727;
  SV_Target.z = _728;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
