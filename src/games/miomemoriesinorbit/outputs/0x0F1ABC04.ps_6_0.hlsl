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
  float _15 = float((int)(frame_consts.vp_dim.x));
  float _16 = float((int)(frame_consts.vp_dim.y));
  float _48;
  float _49;
  float _50;
  float _51;
  float _99;
  float _110;
  float _121;
  float _287;
  float _298;
  float _309;
  float _332;
  float _333;
  float _334;
  float _459;
  float _460;
  float _461;
  float _502;
  float _503;
  float _504;
  float _653;
  float _654;
  float _655;
  float _663;
  float _920;
  float _921;
  float _922;
  float _967;
  float _968;
  float _969;
  float _978;
  float _979;
  float _980;
  if (frame_consts.params.chroma_aberration.intensity > 0.0f) {
    float _23 = abs(O_Uv.x + -0.5f);
    float _24 = abs(O_Uv.y + -0.5f);
    float _28 = (rsqrt(dot(float2(_23, _24), float2(_23, _24))) * 0.009999999776482582f) * frame_consts.params.chroma_aberration.intensity;
    float _29 = _28 * _23;
    float _30 = _28 * _24;
    float4 _33 = tex.SampleLevel(sampler_nearest, float2((_29 + O_Uv.x), (_30 + O_Uv.y)), 0.0f);
    float4 _35 = tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
    float4 _39 = tex.SampleLevel(sampler_nearest, float2((O_Uv.x - _29), (O_Uv.y - _30)), 0.0f);
    _48 = _33.x;
    _49 = _35.y;
    _50 = _39.z;
    _51 = 0.5f;
  } else {
    float4 _42 = tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
    _48 = _42.x;
    _49 = _42.y;
    _50 = _42.z;
    _51 = _42.w;
  }
  float3 untonemapped = float3(_48, _49, _50);

  float3 _52 = bloom_tex.SampleLevel(sampler_bilinear, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _67 = max((((1.0f - (_48 * 0.2125999927520752f)) - (_49 * 0.7152000069618225f)) - (_50 * 0.0722000002861023f)), 0.0010000000474974513f);
  float _71 = (_48 / _67) + (frame_consts.params.bloom.intensity * _52.x);
  float _72 = (_49 / _67) + (frame_consts.params.bloom.intensity * _52.y);
  float _73 = (_50 / _67) + (frame_consts.params.bloom.intensity * _52.z);
  float _79 = (((_71 * 0.2125999927520752f) + 1.0f) + (_72 * 0.7152000069618225f)) + (_73 * 0.0722000002861023f);
  float _83 = saturate(_71 / _79);
  float _84 = saturate(_72 / _79);
  float _85 = saturate(_73 / _79);
  uint2 _86; color_correct_lut.GetDimensions(_86.x, _86.y);
  if (!(!(_83 <= 0.0031308000907301903f))) {
    _99 = (_83 * 12.920000076293945f);
  } else {
    _99 = (((pow(_83, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_84 <= 0.0031308000907301903f))) {
    _110 = (_84 * 12.920000076293945f);
  } else {
    _110 = (((pow(_84, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_85 <= 0.0031308000907301903f))) {
    _121 = (_85 * 12.920000076293945f);
  } else {
    _121 = (((pow(_85, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  float _124 = float((uint)(_86.y + -1u));
  float _127 = _121 * _124;
  float _128 = frac(_127);
  float _130 = float((uint)_86.y);
  float _132 = (_99 * _124) + 0.5f;
  float _135 = float((uint)_86.x);
  float _137 = (lerp(_110, 1.0f, _124)) / _130;
  float3 _138 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((ceil(_127) * _130) + _132) / _135), _137), 0.0f);
  float3 _146 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((floor(_127) * _130) + _132) / _135), _137), 0.0f);
  float _156 = ((_138.x - _146.x) * _128) + _146.x;
  float _157 = ((_138.y - _146.y) * _128) + _146.y;
  float _158 = ((_138.z - _146.z) * _128) + _146.z;
  if (!(frame_consts.glitch == 0)) {
    float _166 = float((int)(int((_15 / _16) * 1080.0f)));
    float _167 = _166 * O_Uv.x;
    float _168 = O_Uv.y * 1080.0f;
    float _169 = _166 * 0.5f;
    float _172 = max(frame_consts.khlia_pulse_t, 0.0f);
    float _179 = max((frame_consts.khlia_pulse_t + -0.30000001192092896f), 0.0f);
    float _185 = ((_179 * 3.0f) * exp2(1.4426950216293335f - (_179 * 4.328084945678711f))) + ((_172 * 5.0f) * exp2(1.4426950216293335f - (_172 * 7.213475227355957f)));
    float _186 = _185 * 15.0f;
    float _187 = _186 + 30.0f;
    float _189 = (_185 * 20.0f) + 80.0f;
    float _193 = abs(_166 * (O_Uv.x + -0.5f));
    float _194 = abs(_168 + -540.0f);
    float _197 = ((_193 - _169) + _187) + _189;
    float _200 = ((_194 + -510.0f) + _186) + _189;
    float _203 = max(_197, 0.0f);
    float _204 = max(_200, 0.0f);
    float _218 = _193 - (_169 - _187);
    float _219 = _194 - (510.0f - _186);
    float _220 = max(_218, 0.0f);
    float _221 = max(_219, 0.0f);
    float _237 = max(max(0.0f, (1.0f - saturate(abs((min(max(_197, _200), 0.0f) - _189) + sqrt((_204 * _204) + (_203 * _203))) + -0.5f))), ((1.0f - saturate(abs(min(max(_218, _219), 0.0f) + sqrt((_221 * _221) + (_220 * _220))) + -0.5f)) * (1.0f - saturate(_185 * 1.6666666269302368f))));
    float _248 = frac((_167 + _168) * 0.0012499999720603228f) + -0.5f;
    float _249 = frac((_168 - _167) * 0.0012499999720603228f) + -0.5f;
    float _261 = saturate((sin((((_167 * 0.0003124999930150807f) + (O_Uv.y * 0.3375000059604645f)) * 20.0f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _265 = (_261 * _261) * (3.0f - (_261 * 2.0f));
    float _267 = saturate(sqrt((_249 * _249) + (_248 * _248)) * 2.0f);
    float _272 = _265 * 0.20000000298023224f;
    float _274 = ((_267 * 0.12156862020492554f) + 0.7450979948043823f) + _272;
    float _275 = ((_267 * 0.3333333134651184f) + 0.34117645025253296f) + _272;
    do {
      if (!(!((_272 + 0.9803921580314636f) <= 0.040449999272823334f))) {
        _287 = ((_265 * 0.015479876659810543f) + 0.07588174939155579f);
      } else {
        _287 = exp2(log2((_265 * 0.18957345187664032f) + 0.9814143776893616f) * 2.4000000953674316f);
      }
      do {
        if (!(!(_274 <= 0.040449999272823334f))) {
          _298 = (_274 * 0.07739938050508499f);
        } else {
          _298 = exp2(log2((_274 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
        }
        do {
          if (!(!(_275 <= 0.040449999272823334f))) {
            _309 = (_275 * 0.07739938050508499f);
          } else {
            _309 = exp2(log2((_275 + 0.054999999701976776f) * 0.9478672742843628f) * 2.4000000953674316f);
          }
          float _315 = (((_287 * 0.2125999927520752f) + 1.0f) + (_298 * 0.7152000069618225f)) + (_309 * 0.0722000002861023f);
          _332 = (((saturate(_287 / _315) - _156) * _237) + _156);
          _333 = (((saturate(_298 / _315) - _157) * _237) + _157);
          _334 = (((saturate(_309 / _315) - _158) * _237) + _158);
        } while (false);
      } while (false);
    } while (false);
  } else {
    _332 = _156;
    _333 = _157;
    _334 = _158;
  }
  float _340 = depth_tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _344 = 10000.0f / ((_340.x * 19999.5f) + 0.5f);
  float _349 = (_344 * ((O_Uv.x * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _351 = (_344 * (((1.0f - O_Uv.y) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _352 = -0.0f - _344;
  float _376 = mad((frame_consts.paper_xf[2].z), _352, mad((frame_consts.paper_xf[1].z), _351, (_349 * (frame_consts.paper_xf[0].z))));
  float _377 = mad((frame_consts.paper_xf[2].x), _352, mad((frame_consts.paper_xf[1].x), _351, (_349 * (frame_consts.paper_xf[0].x)))) / _376;
  float _378 = mad((frame_consts.paper_xf[2].y), _352, mad((frame_consts.paper_xf[1].y), _351, (_349 * (frame_consts.paper_xf[0].y)))) / _376;
  float _390 = exp2(round(log2(max(5.0f, (-0.0f - (_376 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _392 = min((1.0f / _390), 0.20000000298023224f);
  float _393 = frame_consts.game_plane_blend.x - _390;
  float _400 = frame_consts.game_plane_blend.x + 10.0f;
  float _408 = exp2(round(log2(max(5.0f, (-0.0f - (_376 - _400)))) * 10.0f) * 0.10000000149011612f);
  float _410 = min((1.0f / _408), 0.20000000298023224f);
  float _411 = _400 - _408;
  float _418 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_393 * _377) + (frame_consts.paper_xf[3].x)) * _392), (((_393 * _378) + (frame_consts.paper_xf[3].y)) * _392)), 0.0f);
  float _421 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_411 * _377) + (frame_consts.paper_xf[3].x)) * _410), (((_411 * _378) + (frame_consts.paper_xf[3].y)) * _410)), 0.0f);
  float _428 = ((1.0f - (_418.x * (1.0f - frame_consts.game_plane_blend.y))) - (_421.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _432 = _332 - (_428 * _332);
  float _433 = _333 - (_428 * _333);
  float _434 = _334 - (_428 * _334);
  if (!(frame_consts.death_screen == 0)) {
    float _457 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _51), _51);
    _459 = _457;
    _460 = _457;
    _461 = _457;
  } else {
    _459 = (lerp(_432, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _460 = (lerp(_433, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _461 = (lerp(_434, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _469 = _15 * O_Uv.x;
    float _470 = _16 * O_Uv.y;
    float _471 = _469 * 0.06666667014360428f;
    float _472 = _470 * 0.038490019738674164f;
    float _474 = ceil(_471 - _472);
    float _476 = floor(_470 * 0.07698003947734833f);
    float _477 = _476 + 1.0f;
    float _480 = ceil((-0.0f - _471) - _472);
    float _482 = (_474 - _480) * 7.5f;
    float _483 = _474 * 0.28867512941360474f;
    float _484 = _477 * 0.5773502588272095f;
    float _485 = _484 - _483;
    float _486 = _480 * 0.28867512941360474f;
    float _489 = _482 / _15;
    float _490 = ((_485 - _486) * 15.0f) / _16;
    do {
      if (((_477 + _474) + _480) == 2.0f) {
        _502 = (_474 + 1.0f);
        _503 = (_476 + 2.0f);
        _504 = (_480 + 1.0f);
      } else {
        _502 = (_474 + -1.0f);
        _503 = _476;
        _504 = (_480 + -1.0f);
      }
      float _505 = _502 - _480;
      float _508 = _484 - (_502 * 0.28867512941360474f);
      float _509 = _508 - _486;
      float _512 = (_503 * 0.5773502588272095f) - _483;
      float _513 = _512 - _486;
      float _515 = _474 - _504;
      float _518 = _485 - (_504 * 0.28867512941360474f);
      float _522 = (_508 - _512) * 15.0f;
      float _523 = (_502 - _474) * -7.5f;
      float _525 = rsqrt(dot(float2(_522, _523), float2(_522, _523)));
      float _534 = (_513 - _518) * 15.0f;
      float _535 = (_504 - _480) * -7.5f;
      float _537 = rsqrt(dot(float2(_534, _535), float2(_534, _535)));
      float _546 = (_518 - _509) * 15.0f;
      float _547 = (_515 - _505) * -7.5f;
      float _549 = rsqrt(dot(float2(_546, _547), float2(_546, _547)));
      float _562 = _489 + -0.5f;
      float _563 = _490 + -0.5f;
      float _610 = O_Uv.x + -0.5f;
      float _611 = O_Uv.y + -0.5f;
      float _618 = ((frame_consts.time - sqrt((_611 * _611) + (_610 * _610))) + (frac(sin(dot(float2((_489 * 5.0f), (_490 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _622 = frac(abs(_618));
      float _626 = max((select((_618 >= (-0.0f - _618)), _622, (-0.0f - _622)) * 18.0f), 0.0f);
      float _642 = min(max((1.0f - (((((_626 * 1.600000023841858f) * exp2(1.4426950216293335f - (_626 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_563 * _563) + (_562 * _562)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_489 * 3.0f), (_490 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_489, _490), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_489 * 2.0f), (_490 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _648 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_505 * 7.5f) - _469), ((_509 * 15.0f) - _470)), float2((_522 * _525), (_525 * _523))))), abs(dot(float2((_482 - _469), ((_513 * 15.0f) - _470)), float2((_537 * _534), (_537 * _535))))), abs(dot(float2(((_515 * 7.5f) - _469), ((_518 * 15.0f) - _470)), float2((_549 * _546), (_549 * _547))))) * 0.2309400886297226f)) - _642) / ((_642 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _653 = (_648 * _459);
      _654 = (_648 * _460);
      _655 = (_648 * _461);
    } while (false);
  } else {
    _653 = _459;
    _654 = _460;
    _655 = _461;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _663 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _663 = 0.0f;
  }
  float _670 = frame_consts.params.vignette.intensity + _663;
  float _673 = _15 / _16;
  float _685 = exp2(log2(saturate((_670 * abs(O_Uv.x + -0.5f)) * (((_673 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _686 = exp2(log2(saturate(_670 * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _692 = exp2(log2(saturate(1.0f - dot(float2(_685, _686), float2(_685, _686)))) * 6.0f);
  float _697 = 1.0f - _692;
  float _699 = 1.0f - (_697 * 0.8500000238418579f);
  float _706 = (_699 * (_653 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _707 = (_699 * (_654 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _708 = (_699 * (_655 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _712 = ((_692 * 1.2000000476837158f) * _697) * frame_consts.params.vignette.golden_intensity;
  if (_712 > 0.0020000000949949026f) {
    float _717 = _15 * O_Uv.x;
    float _718 = _16 * O_Uv.y;
    float _719 = _717 + _718;
    float _725 = frac(_719 * 0.0033333334140479565f) + -0.5f;
    float _726 = frac((_718 - _717) * 0.0033333334140479565f) + -0.5f;
    float _732 = saturate(sqrt((_726 * _726) + (_725 * _725)) * 2.0f);
    float _743 = saturate((sin((_719 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _748 = ((_743 * _743) * 0.2199999988079071f) * (3.0f - (_743 * 2.0f));
    float _749 = _748 + 0.9777389168739319f;
    float _750 = ((_732 * 0.13274884223937988f) + 0.7175776362419128f) + _748;
    float _751 = ((_732 * 0.3335757553577423f) + 0.30871906876564026f) + _748;
    float _756 = (O_Uv.x * 1080.0f) * _673;
    float _757 = O_Uv.y * 1080.0f;
    float _758 = _756 * 0.04444444552063942f;
    float _759 = O_Uv.y * 27.712812423706055f;
    float _761 = ceil(_758 - _759);
    float _764 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _767 = ceil((-0.0f - _759) - _758);
    float _769 = (_764 + _761) + _767;
    float _771 = (_769 * 22.5f) + -33.75f;
    float _773 = (_761 - _767) * 11.25f;
    float _779 = (((_764 * 0.5773502588272095f) - (_761 * 0.28867512941360474f)) - (_767 * 0.28867512941360474f)) * 22.5f;
    float _782 = _771 + _773;
    float _783 = _779 + (19.485570907592773f - (_769 * 12.990381240844727f));
    float _786 = ((_769 * 25.980762481689453f) + -38.97114181518555f) + _779;
    float _787 = _773 - _771;
    float _788 = _782 - _756;
    float _789 = _783 - _757;
    float _792 = _773 - _756;
    float _793 = _786 - _757;
    float _798 = _789 * _789;
    float _805 = _787 - _756;
    float _809 = frame_consts.time * 0.30000001192092896f;
    float _810 = _783 * 0.4000000059604645f;
    float _819 = sin(((_783 * 0.04444444552063942f) + _809) * 2.0f);
    float _824 = saturate((sqrt(_819 * cos((((_810 + _782) * 0.04444444552063942f) + _809) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _828 = (_824 * _824) * (3.0f - (_824 * 2.0f));
    float _830 = (_828 * 0.6499999761581421f) + 0.3499999940395355f;
    float _845 = saturate((sqrt(sin(((_786 * 0.04444444552063942f) + _809) * 2.0f) * cos(((((_786 * 0.4000000059604645f) + _773) * 0.04444444552063942f) + _809) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _849 = (_845 * _845) * (3.0f - (_845 * 2.0f));
    float _851 = (_849 * 0.6499999761581421f) + 0.3499999940395355f;
    float _861 = saturate((sqrt(cos((((_810 + _787) * 0.04444444552063942f) + _809) * 2.0f) * _819) * 2.0f) + 0.20000004768371582f);
    float _865 = (_861 * _861) * (3.0f - (_861 * 2.0f));
    float _867 = (_865 * 0.6499999761581421f) + 0.3499999940395355f;
    float _889 = saturate(_830);
    float _890 = saturate(_851);
    float _909 = ((((saturate(11.0f - (sqrt((_793 * _793) + (_792 * _792)) / ((_849 * 0.039000000804662704f) + 0.08100000768899918f))) * _851) + (saturate(11.0f - (sqrt((_788 * _788) + _798) / ((_828 * 0.039000000804662704f) + 0.08100000768899918f))) * _830)) + (saturate(11.0f - (sqrt((_805 * _805) + _798) / ((_865 * 0.039000000804662704f) + 0.08100000768899918f))) * _867)) + (((((saturate(1.0f - (abs(_789) * 0.8333333134651184f)) * _889) + (saturate(1.0f - (abs(dot(float2(_792, _793), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _890)) * saturate(_867)) + ((_889 * saturate(1.0f - (abs(dot(float2(_788, _789), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _890)) * 0.5f)) * _712;
    _920 = ((_909 * ((_749 * _749) - _706)) + _706);
    _921 = ((_909 * ((_750 * _750) - _707)) + _707);
    _922 = ((_909 * ((_751 * _751) - _708)) + _708);
  } else {
    _920 = _706;
    _921 = _707;
    _922 = _708;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _931 = ((_921 * 0.7689999938011169f) + (_920 * 0.3930000066757202f)) + (_922 * 0.1889999955892563f);
    float _936 = ((_921 * 0.6859999895095825f) + (_920 * 0.3490000069141388f)) + (_922 * 0.1679999977350235f);
    float _941 = ((_921 * 0.5339999794960022f) + (_920 * 0.2720000147819519f)) + (_922 * 0.13099999725818634f);
    float _942 = frame_consts.flashback_lut * 0.800000011920929f;
    float _947 = ((_921 * 0.7152000069618225f) + (_920 * 0.2125999927520752f)) + (_922 * 0.0722000002861023f);
    _967 = ((((_931 - _920) + ((_947 - _931) * 0.6499999761581421f)) * _942) + _920);
    _968 = ((((_936 - _921) + ((_947 - _936) * 0.6499999761581421f)) * _942) + _921);
    _969 = ((((_941 - _922) + ((_947 - _941) * 0.6499999761581421f)) * _942) + _922);
  } else {
    _967 = _920;
    _968 = _921;
    _969 = _922;
  }
  if (!(frame_consts.invert == 0)) {
    _978 = (1.0f - _967);
    _979 = (1.0f - _968);
    _980 = (1.0f - _969);
  } else {
    _978 = _967;
    _979 = _968;
    _980 = _969;
  }
  SV_Target.x = _978;
  SV_Target.y = _979;
  SV_Target.z = _980;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
