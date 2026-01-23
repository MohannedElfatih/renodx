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
  float _360;
  float _361;
  float _362;
  float _403;
  float _404;
  float _405;
  float _554;
  float _555;
  float _556;
  float _564;
  float _821;
  float _822;
  float _823;
  float _868;
  float _869;
  float _870;
  float _879;
  float _880;
  float _881;
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
  float _314 = exp2(round(log2(max(5.0f, (-0.0f - (_302 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _316 = min((1.0f / _314), 0.20000000298023224f);
  float _317 = frame_consts.game_plane_blend.x - _314;
  float _324 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_317 * (mad((frame_consts.paper_xf[2].x), _278, mad((frame_consts.paper_xf[1].x), _277, (_275 * (frame_consts.paper_xf[0].x)))) / _302)) + (frame_consts.paper_xf[3].x)) * _316), (((_317 * (mad((frame_consts.paper_xf[2].y), _278, mad((frame_consts.paper_xf[1].y), _277, (_275 * (frame_consts.paper_xf[0].y)))) / _302)) + (frame_consts.paper_xf[3].y)) * _316)), 0.0f);
  float _329 = (1.0f - _324.x) * frame_consts.paper_mult;
  float _333 = _258 - (_329 * _258);
  float _334 = _259 - (_329 * _259);
  float _335 = _260 - (_329 * _260);
  if (!(frame_consts.death_screen == 0)) {
    float _358 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _50), _50);
    _360 = _358;
    _361 = _358;
    _362 = _358;
  } else {
    _360 = (lerp(_333, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _361 = (lerp(_334, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _362 = (lerp(_335, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _370 = _14 * O_Uv.x;
    float _371 = _15 * O_Uv.y;
    float _372 = _370 * 0.06666667014360428f;
    float _373 = _371 * 0.038490019738674164f;
    float _375 = ceil(_372 - _373);
    float _377 = floor(_371 * 0.07698003947734833f);
    float _378 = _377 + 1.0f;
    float _381 = ceil((-0.0f - _372) - _373);
    float _383 = (_375 - _381) * 7.5f;
    float _384 = _375 * 0.28867512941360474f;
    float _385 = _378 * 0.5773502588272095f;
    float _386 = _385 - _384;
    float _387 = _381 * 0.28867512941360474f;
    float _390 = _383 / _14;
    float _391 = ((_386 - _387) * 15.0f) / _15;
    do {
      if (((_378 + _375) + _381) == 2.0f) {
        _403 = (_375 + 1.0f);
        _404 = (_377 + 2.0f);
        _405 = (_381 + 1.0f);
      } else {
        _403 = (_375 + -1.0f);
        _404 = _377;
        _405 = (_381 + -1.0f);
      }
      float _406 = _403 - _381;
      float _409 = _385 - (_403 * 0.28867512941360474f);
      float _410 = _409 - _387;
      float _413 = (_404 * 0.5773502588272095f) - _384;
      float _414 = _413 - _387;
      float _416 = _375 - _405;
      float _419 = _386 - (_405 * 0.28867512941360474f);
      float _423 = (_409 - _413) * 15.0f;
      float _424 = (_403 - _375) * -7.5f;
      float _426 = rsqrt(dot(float2(_423, _424), float2(_423, _424)));
      float _435 = (_414 - _419) * 15.0f;
      float _436 = (_405 - _381) * -7.5f;
      float _438 = rsqrt(dot(float2(_435, _436), float2(_435, _436)));
      float _447 = (_419 - _410) * 15.0f;
      float _448 = (_416 - _406) * -7.5f;
      float _450 = rsqrt(dot(float2(_447, _448), float2(_447, _448)));
      float _463 = _390 + -0.5f;
      float _464 = _391 + -0.5f;
      float _511 = O_Uv.x + -0.5f;
      float _512 = O_Uv.y + -0.5f;
      float _519 = ((frame_consts.time - sqrt((_512 * _512) + (_511 * _511))) + (frac(sin(dot(float2((_390 * 5.0f), (_391 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _523 = frac(abs(_519));
      float _527 = max((select((_519 >= (-0.0f - _519)), _523, (-0.0f - _523)) * 18.0f), 0.0f);
      float _543 = min(max((1.0f - (((((_527 * 1.600000023841858f) * exp2(1.4426950216293335f - (_527 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_464 * _464) + (_463 * _463)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_390 * 3.0f), (_391 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_390, _391), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_390 * 2.0f), (_391 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _549 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_406 * 7.5f) - _370), ((_410 * 15.0f) - _371)), float2((_423 * _426), (_426 * _424))))), abs(dot(float2((_383 - _370), ((_414 * 15.0f) - _371)), float2((_438 * _435), (_438 * _436))))), abs(dot(float2(((_416 * 7.5f) - _370), ((_419 * 15.0f) - _371)), float2((_450 * _447), (_450 * _448))))) * 0.2309400886297226f)) - _543) / ((_543 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _554 = (_549 * _360);
      _555 = (_549 * _361);
      _556 = (_549 * _362);
    } while (false);
  } else {
    _554 = _360;
    _555 = _361;
    _556 = _362;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _564 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _564 = 0.0f;
  }
  float _571 = frame_consts.params.vignette.intensity + _564;
  float _574 = _14 / _15;
  float _586 = exp2(log2(saturate((_571 * abs(O_Uv.x + -0.5f)) * (((_574 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _587 = exp2(log2(saturate(_571 * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _593 = exp2(log2(saturate(1.0f - dot(float2(_586, _587), float2(_586, _587)))) * 6.0f);
  float _598 = 1.0f - _593;
  float _600 = 1.0f - (_598 * 0.8500000238418579f);
  float _607 = (_600 * (_554 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _608 = (_600 * (_555 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _609 = (_600 * (_556 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _613 = ((_593 * 1.2000000476837158f) * _598) * frame_consts.params.vignette.golden_intensity;
  if (_613 > 0.0020000000949949026f) {
    float _618 = _14 * O_Uv.x;
    float _619 = _15 * O_Uv.y;
    float _620 = _618 + _619;
    float _626 = frac(_620 * 0.0033333334140479565f) + -0.5f;
    float _627 = frac((_619 - _618) * 0.0033333334140479565f) + -0.5f;
    float _633 = saturate(sqrt((_627 * _627) + (_626 * _626)) * 2.0f);
    float _644 = saturate((sin((_620 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _649 = ((_644 * _644) * 0.2199999988079071f) * (3.0f - (_644 * 2.0f));
    float _650 = _649 + 0.9777389168739319f;
    float _651 = ((_633 * 0.13274884223937988f) + 0.7175776362419128f) + _649;
    float _652 = ((_633 * 0.3335757553577423f) + 0.30871906876564026f) + _649;
    float _657 = (O_Uv.x * 1080.0f) * _574;
    float _658 = O_Uv.y * 1080.0f;
    float _659 = _657 * 0.04444444552063942f;
    float _660 = O_Uv.y * 27.712812423706055f;
    float _662 = ceil(_659 - _660);
    float _665 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _668 = ceil((-0.0f - _660) - _659);
    float _670 = (_665 + _662) + _668;
    float _672 = (_670 * 22.5f) + -33.75f;
    float _674 = (_662 - _668) * 11.25f;
    float _680 = (((_665 * 0.5773502588272095f) - (_662 * 0.28867512941360474f)) - (_668 * 0.28867512941360474f)) * 22.5f;
    float _683 = _672 + _674;
    float _684 = _680 + (19.485570907592773f - (_670 * 12.990381240844727f));
    float _687 = ((_670 * 25.980762481689453f) + -38.97114181518555f) + _680;
    float _688 = _674 - _672;
    float _689 = _683 - _657;
    float _690 = _684 - _658;
    float _693 = _674 - _657;
    float _694 = _687 - _658;
    float _699 = _690 * _690;
    float _706 = _688 - _657;
    float _710 = frame_consts.time * 0.30000001192092896f;
    float _711 = _684 * 0.4000000059604645f;
    float _720 = sin(((_684 * 0.04444444552063942f) + _710) * 2.0f);
    float _725 = saturate((sqrt(_720 * cos((((_711 + _683) * 0.04444444552063942f) + _710) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _729 = (_725 * _725) * (3.0f - (_725 * 2.0f));
    float _731 = (_729 * 0.6499999761581421f) + 0.3499999940395355f;
    float _746 = saturate((sqrt(sin(((_687 * 0.04444444552063942f) + _710) * 2.0f) * cos(((((_687 * 0.4000000059604645f) + _674) * 0.04444444552063942f) + _710) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _750 = (_746 * _746) * (3.0f - (_746 * 2.0f));
    float _752 = (_750 * 0.6499999761581421f) + 0.3499999940395355f;
    float _762 = saturate((sqrt(cos((((_711 + _688) * 0.04444444552063942f) + _710) * 2.0f) * _720) * 2.0f) + 0.20000004768371582f);
    float _766 = (_762 * _762) * (3.0f - (_762 * 2.0f));
    float _768 = (_766 * 0.6499999761581421f) + 0.3499999940395355f;
    float _790 = saturate(_731);
    float _791 = saturate(_752);
    float _810 = ((((saturate(11.0f - (sqrt((_694 * _694) + (_693 * _693)) / ((_750 * 0.039000000804662704f) + 0.08100000768899918f))) * _752) + (saturate(11.0f - (sqrt((_689 * _689) + _699) / ((_729 * 0.039000000804662704f) + 0.08100000768899918f))) * _731)) + (saturate(11.0f - (sqrt((_706 * _706) + _699) / ((_766 * 0.039000000804662704f) + 0.08100000768899918f))) * _768)) + (((((saturate(1.0f - (abs(_690) * 0.8333333134651184f)) * _790) + (saturate(1.0f - (abs(dot(float2(_693, _694), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _791)) * saturate(_768)) + ((_790 * saturate(1.0f - (abs(dot(float2(_689, _690), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _791)) * 0.5f)) * _613;
    _821 = ((_810 * ((_650 * _650) - _607)) + _607);
    _822 = ((_810 * ((_651 * _651) - _608)) + _608);
    _823 = ((_810 * ((_652 * _652) - _609)) + _609);
  } else {
    _821 = _607;
    _822 = _608;
    _823 = _609;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _832 = ((_822 * 0.7689999938011169f) + (_821 * 0.3930000066757202f)) + (_823 * 0.1889999955892563f);
    float _837 = ((_822 * 0.6859999895095825f) + (_821 * 0.3490000069141388f)) + (_823 * 0.1679999977350235f);
    float _842 = ((_822 * 0.5339999794960022f) + (_821 * 0.2720000147819519f)) + (_823 * 0.13099999725818634f);
    float _843 = frame_consts.flashback_lut * 0.800000011920929f;
    float _848 = ((_822 * 0.7152000069618225f) + (_821 * 0.2125999927520752f)) + (_823 * 0.0722000002861023f);
    _868 = ((((_832 - _821) + ((_848 - _832) * 0.6499999761581421f)) * _843) + _821);
    _869 = ((((_837 - _822) + ((_848 - _837) * 0.6499999761581421f)) * _843) + _822);
    _870 = ((((_842 - _823) + ((_848 - _842) * 0.6499999761581421f)) * _843) + _823);
  } else {
    _868 = _821;
    _869 = _822;
    _870 = _823;
  }
  if (!(frame_consts.invert == 0)) {
    _879 = (1.0f - _868);
    _880 = (1.0f - _869);
    _881 = (1.0f - _870);
  } else {
    _879 = _868;
    _880 = _869;
    _881 = _870;
  }
  SV_Target.x = _879;
  SV_Target.y = _880;
  SV_Target.z = _881;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
