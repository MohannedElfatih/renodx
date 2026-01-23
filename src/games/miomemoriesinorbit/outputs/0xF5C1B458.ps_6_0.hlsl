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
  float _385;
  float _386;
  float _387;
  float _428;
  float _429;
  float _430;
  float _579;
  float _580;
  float _581;
  float _589;
  float _846;
  float _847;
  float _848;
  float _893;
  float _894;
  float _895;
  float _904;
  float _905;
  float _906;
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
  float _316 = exp2(round(log2(max(5.0f, (-0.0f - (_302 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _318 = min((1.0f / _316), 0.20000000298023224f);
  float _319 = frame_consts.game_plane_blend.x - _316;
  float _326 = frame_consts.game_plane_blend.x + 10.0f;
  float _334 = exp2(round(log2(max(5.0f, (-0.0f - (_302 - _326)))) * 10.0f) * 0.10000000149011612f);
  float _336 = min((1.0f / _334), 0.20000000298023224f);
  float _337 = _326 - _334;
  float _344 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_319 * _303) + (frame_consts.paper_xf[3].x)) * _318), (((_319 * _304) + (frame_consts.paper_xf[3].y)) * _318)), 0.0f);
  float _347 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_337 * _303) + (frame_consts.paper_xf[3].x)) * _336), (((_337 * _304) + (frame_consts.paper_xf[3].y)) * _336)), 0.0f);
  float _354 = ((1.0f - (_344.x * (1.0f - frame_consts.game_plane_blend.y))) - (_347.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _358 = _258 - (_354 * _258);
  float _359 = _259 - (_354 * _259);
  float _360 = _260 - (_354 * _260);
  if (!(frame_consts.death_screen == 0)) {
    float _383 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _50), _50);
    _385 = _383;
    _386 = _383;
    _387 = _383;
  } else {
    _385 = (lerp(_358, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _386 = (lerp(_359, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _387 = (lerp(_360, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _395 = _14 * O_Uv.x;
    float _396 = _15 * O_Uv.y;
    float _397 = _395 * 0.06666667014360428f;
    float _398 = _396 * 0.038490019738674164f;
    float _400 = ceil(_397 - _398);
    float _402 = floor(_396 * 0.07698003947734833f);
    float _403 = _402 + 1.0f;
    float _406 = ceil((-0.0f - _397) - _398);
    float _408 = (_400 - _406) * 7.5f;
    float _409 = _400 * 0.28867512941360474f;
    float _410 = _403 * 0.5773502588272095f;
    float _411 = _410 - _409;
    float _412 = _406 * 0.28867512941360474f;
    float _415 = _408 / _14;
    float _416 = ((_411 - _412) * 15.0f) / _15;
    do {
      if (((_403 + _400) + _406) == 2.0f) {
        _428 = (_400 + 1.0f);
        _429 = (_402 + 2.0f);
        _430 = (_406 + 1.0f);
      } else {
        _428 = (_400 + -1.0f);
        _429 = _402;
        _430 = (_406 + -1.0f);
      }
      float _431 = _428 - _406;
      float _434 = _410 - (_428 * 0.28867512941360474f);
      float _435 = _434 - _412;
      float _438 = (_429 * 0.5773502588272095f) - _409;
      float _439 = _438 - _412;
      float _441 = _400 - _430;
      float _444 = _411 - (_430 * 0.28867512941360474f);
      float _448 = (_434 - _438) * 15.0f;
      float _449 = (_428 - _400) * -7.5f;
      float _451 = rsqrt(dot(float2(_448, _449), float2(_448, _449)));
      float _460 = (_439 - _444) * 15.0f;
      float _461 = (_430 - _406) * -7.5f;
      float _463 = rsqrt(dot(float2(_460, _461), float2(_460, _461)));
      float _472 = (_444 - _435) * 15.0f;
      float _473 = (_441 - _431) * -7.5f;
      float _475 = rsqrt(dot(float2(_472, _473), float2(_472, _473)));
      float _488 = _415 + -0.5f;
      float _489 = _416 + -0.5f;
      float _536 = O_Uv.x + -0.5f;
      float _537 = O_Uv.y + -0.5f;
      float _544 = ((frame_consts.time - sqrt((_537 * _537) + (_536 * _536))) + (frac(sin(dot(float2((_415 * 5.0f), (_416 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _548 = frac(abs(_544));
      float _552 = max((select((_544 >= (-0.0f - _544)), _548, (-0.0f - _548)) * 18.0f), 0.0f);
      float _568 = min(max((1.0f - (((((_552 * 1.600000023841858f) * exp2(1.4426950216293335f - (_552 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_489 * _489) + (_488 * _488)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_415 * 3.0f), (_416 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_415, _416), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_415 * 2.0f), (_416 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _574 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_431 * 7.5f) - _395), ((_435 * 15.0f) - _396)), float2((_448 * _451), (_451 * _449))))), abs(dot(float2((_408 - _395), ((_439 * 15.0f) - _396)), float2((_463 * _460), (_463 * _461))))), abs(dot(float2(((_441 * 7.5f) - _395), ((_444 * 15.0f) - _396)), float2((_475 * _472), (_475 * _473))))) * 0.2309400886297226f)) - _568) / ((_568 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _579 = (_574 * _385);
      _580 = (_574 * _386);
      _581 = (_574 * _387);
    } while (false);
  } else {
    _579 = _385;
    _580 = _386;
    _581 = _387;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _589 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _589 = 0.0f;
  }
  float _596 = frame_consts.params.vignette.intensity + _589;
  float _599 = _14 / _15;
  float _611 = exp2(log2(saturate((_596 * abs(O_Uv.x + -0.5f)) * (((_599 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _612 = exp2(log2(saturate(_596 * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _618 = exp2(log2(saturate(1.0f - dot(float2(_611, _612), float2(_611, _612)))) * 6.0f);
  float _623 = 1.0f - _618;
  float _625 = 1.0f - (_623 * 0.8500000238418579f);
  float _632 = (_625 * (_579 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _633 = (_625 * (_580 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _634 = (_625 * (_581 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _638 = ((_618 * 1.2000000476837158f) * _623) * frame_consts.params.vignette.golden_intensity;
  if (_638 > 0.0020000000949949026f) {
    float _643 = _14 * O_Uv.x;
    float _644 = _15 * O_Uv.y;
    float _645 = _643 + _644;
    float _651 = frac(_645 * 0.0033333334140479565f) + -0.5f;
    float _652 = frac((_644 - _643) * 0.0033333334140479565f) + -0.5f;
    float _658 = saturate(sqrt((_652 * _652) + (_651 * _651)) * 2.0f);
    float _669 = saturate((sin((_645 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _674 = ((_669 * _669) * 0.2199999988079071f) * (3.0f - (_669 * 2.0f));
    float _675 = _674 + 0.9777389168739319f;
    float _676 = ((_658 * 0.13274884223937988f) + 0.7175776362419128f) + _674;
    float _677 = ((_658 * 0.3335757553577423f) + 0.30871906876564026f) + _674;
    float _682 = (O_Uv.x * 1080.0f) * _599;
    float _683 = O_Uv.y * 1080.0f;
    float _684 = _682 * 0.04444444552063942f;
    float _685 = O_Uv.y * 27.712812423706055f;
    float _687 = ceil(_684 - _685);
    float _690 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _693 = ceil((-0.0f - _685) - _684);
    float _695 = (_690 + _687) + _693;
    float _697 = (_695 * 22.5f) + -33.75f;
    float _699 = (_687 - _693) * 11.25f;
    float _705 = (((_690 * 0.5773502588272095f) - (_687 * 0.28867512941360474f)) - (_693 * 0.28867512941360474f)) * 22.5f;
    float _708 = _697 + _699;
    float _709 = _705 + (19.485570907592773f - (_695 * 12.990381240844727f));
    float _712 = ((_695 * 25.980762481689453f) + -38.97114181518555f) + _705;
    float _713 = _699 - _697;
    float _714 = _708 - _682;
    float _715 = _709 - _683;
    float _718 = _699 - _682;
    float _719 = _712 - _683;
    float _724 = _715 * _715;
    float _731 = _713 - _682;
    float _735 = frame_consts.time * 0.30000001192092896f;
    float _736 = _709 * 0.4000000059604645f;
    float _745 = sin(((_709 * 0.04444444552063942f) + _735) * 2.0f);
    float _750 = saturate((sqrt(_745 * cos((((_736 + _708) * 0.04444444552063942f) + _735) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _754 = (_750 * _750) * (3.0f - (_750 * 2.0f));
    float _756 = (_754 * 0.6499999761581421f) + 0.3499999940395355f;
    float _771 = saturate((sqrt(sin(((_712 * 0.04444444552063942f) + _735) * 2.0f) * cos(((((_712 * 0.4000000059604645f) + _699) * 0.04444444552063942f) + _735) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _775 = (_771 * _771) * (3.0f - (_771 * 2.0f));
    float _777 = (_775 * 0.6499999761581421f) + 0.3499999940395355f;
    float _787 = saturate((sqrt(cos((((_736 + _713) * 0.04444444552063942f) + _735) * 2.0f) * _745) * 2.0f) + 0.20000004768371582f);
    float _791 = (_787 * _787) * (3.0f - (_787 * 2.0f));
    float _793 = (_791 * 0.6499999761581421f) + 0.3499999940395355f;
    float _815 = saturate(_756);
    float _816 = saturate(_777);
    float _835 = ((((saturate(11.0f - (sqrt((_719 * _719) + (_718 * _718)) / ((_775 * 0.039000000804662704f) + 0.08100000768899918f))) * _777) + (saturate(11.0f - (sqrt((_714 * _714) + _724) / ((_754 * 0.039000000804662704f) + 0.08100000768899918f))) * _756)) + (saturate(11.0f - (sqrt((_731 * _731) + _724) / ((_791 * 0.039000000804662704f) + 0.08100000768899918f))) * _793)) + (((((saturate(1.0f - (abs(_715) * 0.8333333134651184f)) * _815) + (saturate(1.0f - (abs(dot(float2(_718, _719), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _816)) * saturate(_793)) + ((_815 * saturate(1.0f - (abs(dot(float2(_714, _715), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _816)) * 0.5f)) * _638;
    _846 = ((_835 * ((_675 * _675) - _632)) + _632);
    _847 = ((_835 * ((_676 * _676) - _633)) + _633);
    _848 = ((_835 * ((_677 * _677) - _634)) + _634);
  } else {
    _846 = _632;
    _847 = _633;
    _848 = _634;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _857 = ((_847 * 0.7689999938011169f) + (_846 * 0.3930000066757202f)) + (_848 * 0.1889999955892563f);
    float _862 = ((_847 * 0.6859999895095825f) + (_846 * 0.3490000069141388f)) + (_848 * 0.1679999977350235f);
    float _867 = ((_847 * 0.5339999794960022f) + (_846 * 0.2720000147819519f)) + (_848 * 0.13099999725818634f);
    float _868 = frame_consts.flashback_lut * 0.800000011920929f;
    float _873 = ((_847 * 0.7152000069618225f) + (_846 * 0.2125999927520752f)) + (_848 * 0.0722000002861023f);
    _893 = ((((_857 - _846) + ((_873 - _857) * 0.6499999761581421f)) * _868) + _846);
    _894 = ((((_862 - _847) + ((_873 - _862) * 0.6499999761581421f)) * _868) + _847);
    _895 = ((((_867 - _848) + ((_873 - _867) * 0.6499999761581421f)) * _868) + _848);
  } else {
    _893 = _846;
    _894 = _847;
    _895 = _848;
  }
  if (!(frame_consts.invert == 0)) {
    _904 = (1.0f - _893);
    _905 = (1.0f - _894);
    _906 = (1.0f - _895);
  } else {
    _904 = _893;
    _905 = _894;
    _906 = _895;
  }
  SV_Target.x = _904;
  SV_Target.y = _905;
  SV_Target.z = _906;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
