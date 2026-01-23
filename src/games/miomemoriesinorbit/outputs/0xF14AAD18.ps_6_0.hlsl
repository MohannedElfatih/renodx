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
  float _377;
  float _378;
  float _379;
  float _420;
  float _421;
  float _422;
  float _571;
  float _572;
  float _573;
  float _581;
  float _838;
  float _839;
  float _840;
  float _885;
  float _886;
  float _887;
  float _896;
  float _897;
  float _898;
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
  float _311 = log2(max(5.0f, (-0.0f - (_302 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _312 = floor(_311);
  float _313 = _311 - _312;
  float _315 = exp2(_312 * 0.10000000149011612f);
  float _316 = 1.0f / _315;
  float _317 = min(_316, 0.20000000298023224f);
  float _319 = min((_316 * 0.9330329895019531f), 0.20000000298023224f);
  float _320 = frame_consts.game_plane_blend.x - _315;
  float _326 = frame_consts.game_plane_blend.x - (_315 * 1.0717734098434448f);
  float _336 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_320 * _303) + (frame_consts.paper_xf[3].x)) * _317), (((_320 * _304) + (frame_consts.paper_xf[3].y)) * _317)), 0.0f);
  float _339 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_326 * _303) + (frame_consts.paper_xf[3].x)) * _319), (((_326 * _304) + (frame_consts.paper_xf[3].y)) * _319)), 0.0f);
  float _346 = ((1.0f - (_336.x * (1.0f - _313))) - (_339.x * _313)) * frame_consts.paper_mult;
  float _350 = _258 - (_346 * _258);
  float _351 = _259 - (_346 * _259);
  float _352 = _260 - (_346 * _260);
  if (!(frame_consts.death_screen == 0)) {
    float _375 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _50), _50);
    _377 = _375;
    _378 = _375;
    _379 = _375;
  } else {
    _377 = (lerp(_350, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _378 = (lerp(_351, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _379 = (lerp(_352, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _387 = _14 * O_Uv.x;
    float _388 = _15 * O_Uv.y;
    float _389 = _387 * 0.06666667014360428f;
    float _390 = _388 * 0.038490019738674164f;
    float _392 = ceil(_389 - _390);
    float _394 = floor(_388 * 0.07698003947734833f);
    float _395 = _394 + 1.0f;
    float _398 = ceil((-0.0f - _389) - _390);
    float _400 = (_392 - _398) * 7.5f;
    float _401 = _392 * 0.28867512941360474f;
    float _402 = _395 * 0.5773502588272095f;
    float _403 = _402 - _401;
    float _404 = _398 * 0.28867512941360474f;
    float _407 = _400 / _14;
    float _408 = ((_403 - _404) * 15.0f) / _15;
    do {
      if (((_395 + _392) + _398) == 2.0f) {
        _420 = (_392 + 1.0f);
        _421 = (_394 + 2.0f);
        _422 = (_398 + 1.0f);
      } else {
        _420 = (_392 + -1.0f);
        _421 = _394;
        _422 = (_398 + -1.0f);
      }
      float _423 = _420 - _398;
      float _426 = _402 - (_420 * 0.28867512941360474f);
      float _427 = _426 - _404;
      float _430 = (_421 * 0.5773502588272095f) - _401;
      float _431 = _430 - _404;
      float _433 = _392 - _422;
      float _436 = _403 - (_422 * 0.28867512941360474f);
      float _440 = (_426 - _430) * 15.0f;
      float _441 = (_420 - _392) * -7.5f;
      float _443 = rsqrt(dot(float2(_440, _441), float2(_440, _441)));
      float _452 = (_431 - _436) * 15.0f;
      float _453 = (_422 - _398) * -7.5f;
      float _455 = rsqrt(dot(float2(_452, _453), float2(_452, _453)));
      float _464 = (_436 - _427) * 15.0f;
      float _465 = (_433 - _423) * -7.5f;
      float _467 = rsqrt(dot(float2(_464, _465), float2(_464, _465)));
      float _480 = _407 + -0.5f;
      float _481 = _408 + -0.5f;
      float _528 = O_Uv.x + -0.5f;
      float _529 = O_Uv.y + -0.5f;
      float _536 = ((frame_consts.time - sqrt((_529 * _529) + (_528 * _528))) + (frac(sin(dot(float2((_407 * 5.0f), (_408 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _540 = frac(abs(_536));
      float _544 = max((select((_536 >= (-0.0f - _536)), _540, (-0.0f - _540)) * 18.0f), 0.0f);
      float _560 = min(max((1.0f - (((((_544 * 1.600000023841858f) * exp2(1.4426950216293335f - (_544 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_481 * _481) + (_480 * _480)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_407 * 3.0f), (_408 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_407, _408), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_407 * 2.0f), (_408 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _566 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_423 * 7.5f) - _387), ((_427 * 15.0f) - _388)), float2((_440 * _443), (_443 * _441))))), abs(dot(float2((_400 - _387), ((_431 * 15.0f) - _388)), float2((_455 * _452), (_455 * _453))))), abs(dot(float2(((_433 * 7.5f) - _387), ((_436 * 15.0f) - _388)), float2((_467 * _464), (_467 * _465))))) * 0.2309400886297226f)) - _560) / ((_560 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _571 = (_566 * _377);
      _572 = (_566 * _378);
      _573 = (_566 * _379);
    } while (false);
  } else {
    _571 = _377;
    _572 = _378;
    _573 = _379;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _581 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _581 = 0.0f;
  }
  float _588 = frame_consts.params.vignette.intensity + _581;
  float _591 = _14 / _15;
  float _603 = exp2(log2(saturate((_588 * abs(O_Uv.x + -0.5f)) * (((_591 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _604 = exp2(log2(saturate(_588 * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _610 = exp2(log2(saturate(1.0f - dot(float2(_603, _604), float2(_603, _604)))) * 6.0f);
  float _615 = 1.0f - _610;
  float _617 = 1.0f - (_615 * 0.8500000238418579f);
  float _624 = (_617 * (_571 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _625 = (_617 * (_572 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _626 = (_617 * (_573 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _630 = ((_610 * 1.2000000476837158f) * _615) * frame_consts.params.vignette.golden_intensity;
  if (_630 > 0.0020000000949949026f) {
    float _635 = _14 * O_Uv.x;
    float _636 = _15 * O_Uv.y;
    float _637 = _635 + _636;
    float _643 = frac(_637 * 0.0033333334140479565f) + -0.5f;
    float _644 = frac((_636 - _635) * 0.0033333334140479565f) + -0.5f;
    float _650 = saturate(sqrt((_644 * _644) + (_643 * _643)) * 2.0f);
    float _661 = saturate((sin((_637 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _666 = ((_661 * _661) * 0.2199999988079071f) * (3.0f - (_661 * 2.0f));
    float _667 = _666 + 0.9777389168739319f;
    float _668 = ((_650 * 0.13274884223937988f) + 0.7175776362419128f) + _666;
    float _669 = ((_650 * 0.3335757553577423f) + 0.30871906876564026f) + _666;
    float _674 = (O_Uv.x * 1080.0f) * _591;
    float _675 = O_Uv.y * 1080.0f;
    float _676 = _674 * 0.04444444552063942f;
    float _677 = O_Uv.y * 27.712812423706055f;
    float _679 = ceil(_676 - _677);
    float _682 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _685 = ceil((-0.0f - _677) - _676);
    float _687 = (_682 + _679) + _685;
    float _689 = (_687 * 22.5f) + -33.75f;
    float _691 = (_679 - _685) * 11.25f;
    float _697 = (((_682 * 0.5773502588272095f) - (_679 * 0.28867512941360474f)) - (_685 * 0.28867512941360474f)) * 22.5f;
    float _700 = _689 + _691;
    float _701 = _697 + (19.485570907592773f - (_687 * 12.990381240844727f));
    float _704 = ((_687 * 25.980762481689453f) + -38.97114181518555f) + _697;
    float _705 = _691 - _689;
    float _706 = _700 - _674;
    float _707 = _701 - _675;
    float _710 = _691 - _674;
    float _711 = _704 - _675;
    float _716 = _707 * _707;
    float _723 = _705 - _674;
    float _727 = frame_consts.time * 0.30000001192092896f;
    float _728 = _701 * 0.4000000059604645f;
    float _737 = sin(((_701 * 0.04444444552063942f) + _727) * 2.0f);
    float _742 = saturate((sqrt(_737 * cos((((_728 + _700) * 0.04444444552063942f) + _727) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _746 = (_742 * _742) * (3.0f - (_742 * 2.0f));
    float _748 = (_746 * 0.6499999761581421f) + 0.3499999940395355f;
    float _763 = saturate((sqrt(sin(((_704 * 0.04444444552063942f) + _727) * 2.0f) * cos(((((_704 * 0.4000000059604645f) + _691) * 0.04444444552063942f) + _727) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _767 = (_763 * _763) * (3.0f - (_763 * 2.0f));
    float _769 = (_767 * 0.6499999761581421f) + 0.3499999940395355f;
    float _779 = saturate((sqrt(cos((((_728 + _705) * 0.04444444552063942f) + _727) * 2.0f) * _737) * 2.0f) + 0.20000004768371582f);
    float _783 = (_779 * _779) * (3.0f - (_779 * 2.0f));
    float _785 = (_783 * 0.6499999761581421f) + 0.3499999940395355f;
    float _807 = saturate(_748);
    float _808 = saturate(_769);
    float _827 = ((((saturate(11.0f - (sqrt((_711 * _711) + (_710 * _710)) / ((_767 * 0.039000000804662704f) + 0.08100000768899918f))) * _769) + (saturate(11.0f - (sqrt((_706 * _706) + _716) / ((_746 * 0.039000000804662704f) + 0.08100000768899918f))) * _748)) + (saturate(11.0f - (sqrt((_723 * _723) + _716) / ((_783 * 0.039000000804662704f) + 0.08100000768899918f))) * _785)) + (((((saturate(1.0f - (abs(_707) * 0.8333333134651184f)) * _807) + (saturate(1.0f - (abs(dot(float2(_710, _711), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _808)) * saturate(_785)) + ((_807 * saturate(1.0f - (abs(dot(float2(_706, _707), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _808)) * 0.5f)) * _630;
    _838 = ((_827 * ((_667 * _667) - _624)) + _624);
    _839 = ((_827 * ((_668 * _668) - _625)) + _625);
    _840 = ((_827 * ((_669 * _669) - _626)) + _626);
  } else {
    _838 = _624;
    _839 = _625;
    _840 = _626;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _849 = ((_839 * 0.7689999938011169f) + (_838 * 0.3930000066757202f)) + (_840 * 0.1889999955892563f);
    float _854 = ((_839 * 0.6859999895095825f) + (_838 * 0.3490000069141388f)) + (_840 * 0.1679999977350235f);
    float _859 = ((_839 * 0.5339999794960022f) + (_838 * 0.2720000147819519f)) + (_840 * 0.13099999725818634f);
    float _860 = frame_consts.flashback_lut * 0.800000011920929f;
    float _865 = ((_839 * 0.7152000069618225f) + (_838 * 0.2125999927520752f)) + (_840 * 0.0722000002861023f);
    _885 = ((((_849 - _838) + ((_865 - _849) * 0.6499999761581421f)) * _860) + _838);
    _886 = ((((_854 - _839) + ((_865 - _854) * 0.6499999761581421f)) * _860) + _839);
    _887 = ((((_859 - _840) + ((_865 - _859) * 0.6499999761581421f)) * _860) + _840);
  } else {
    _885 = _838;
    _886 = _839;
    _887 = _840;
  }
  if (!(frame_consts.invert == 0)) {
    _896 = (1.0f - _885);
    _897 = (1.0f - _886);
    _898 = (1.0f - _887);
  } else {
    _896 = _885;
    _897 = _886;
    _898 = _887;
  }
  SV_Target.x = _896;
  SV_Target.y = _897;
  SV_Target.z = _898;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
