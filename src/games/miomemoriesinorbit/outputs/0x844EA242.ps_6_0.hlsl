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
  float _451;
  float _452;
  float _453;
  float _494;
  float _495;
  float _496;
  float _645;
  float _646;
  float _647;
  float _655;
  float _912;
  float _913;
  float _914;
  float _959;
  float _960;
  float _961;
  float _970;
  float _971;
  float _972;
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
  float _385 = log2(max(5.0f, (-0.0f - (_376 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _386 = floor(_385);
  float _387 = _385 - _386;
  float _389 = exp2(_386 * 0.10000000149011612f);
  float _390 = 1.0f / _389;
  float _391 = min(_390, 0.20000000298023224f);
  float _393 = min((_390 * 0.9330329895019531f), 0.20000000298023224f);
  float _394 = frame_consts.game_plane_blend.x - _389;
  float _400 = frame_consts.game_plane_blend.x - (_389 * 1.0717734098434448f);
  float _410 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_394 * _377) + (frame_consts.paper_xf[3].x)) * _391), (((_394 * _378) + (frame_consts.paper_xf[3].y)) * _391)), 0.0f);
  float _413 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_400 * _377) + (frame_consts.paper_xf[3].x)) * _393), (((_400 * _378) + (frame_consts.paper_xf[3].y)) * _393)), 0.0f);
  float _420 = ((1.0f - (_410.x * (1.0f - _387))) - (_413.x * _387)) * frame_consts.paper_mult;
  float _424 = _332 - (_420 * _332);
  float _425 = _333 - (_420 * _333);
  float _426 = _334 - (_420 * _334);
  if (!(frame_consts.death_screen == 0)) {
    float _449 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _51), _51);
    _451 = _449;
    _452 = _449;
    _453 = _449;
  } else {
    _451 = (lerp(_424, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _452 = (lerp(_425, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _453 = (lerp(_426, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _461 = _15 * O_Uv.x;
    float _462 = _16 * O_Uv.y;
    float _463 = _461 * 0.06666667014360428f;
    float _464 = _462 * 0.038490019738674164f;
    float _466 = ceil(_463 - _464);
    float _468 = floor(_462 * 0.07698003947734833f);
    float _469 = _468 + 1.0f;
    float _472 = ceil((-0.0f - _463) - _464);
    float _474 = (_466 - _472) * 7.5f;
    float _475 = _466 * 0.28867512941360474f;
    float _476 = _469 * 0.5773502588272095f;
    float _477 = _476 - _475;
    float _478 = _472 * 0.28867512941360474f;
    float _481 = _474 / _15;
    float _482 = ((_477 - _478) * 15.0f) / _16;
    do {
      if (((_469 + _466) + _472) == 2.0f) {
        _494 = (_466 + 1.0f);
        _495 = (_468 + 2.0f);
        _496 = (_472 + 1.0f);
      } else {
        _494 = (_466 + -1.0f);
        _495 = _468;
        _496 = (_472 + -1.0f);
      }
      float _497 = _494 - _472;
      float _500 = _476 - (_494 * 0.28867512941360474f);
      float _501 = _500 - _478;
      float _504 = (_495 * 0.5773502588272095f) - _475;
      float _505 = _504 - _478;
      float _507 = _466 - _496;
      float _510 = _477 - (_496 * 0.28867512941360474f);
      float _514 = (_500 - _504) * 15.0f;
      float _515 = (_494 - _466) * -7.5f;
      float _517 = rsqrt(dot(float2(_514, _515), float2(_514, _515)));
      float _526 = (_505 - _510) * 15.0f;
      float _527 = (_496 - _472) * -7.5f;
      float _529 = rsqrt(dot(float2(_526, _527), float2(_526, _527)));
      float _538 = (_510 - _501) * 15.0f;
      float _539 = (_507 - _497) * -7.5f;
      float _541 = rsqrt(dot(float2(_538, _539), float2(_538, _539)));
      float _554 = _481 + -0.5f;
      float _555 = _482 + -0.5f;
      float _602 = O_Uv.x + -0.5f;
      float _603 = O_Uv.y + -0.5f;
      float _610 = ((frame_consts.time - sqrt((_603 * _603) + (_602 * _602))) + (frac(sin(dot(float2((_481 * 5.0f), (_482 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _614 = frac(abs(_610));
      float _618 = max((select((_610 >= (-0.0f - _610)), _614, (-0.0f - _614)) * 18.0f), 0.0f);
      float _634 = min(max((1.0f - (((((_618 * 1.600000023841858f) * exp2(1.4426950216293335f - (_618 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_555 * _555) + (_554 * _554)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_481 * 3.0f), (_482 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_481, _482), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_481 * 2.0f), (_482 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _640 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_497 * 7.5f) - _461), ((_501 * 15.0f) - _462)), float2((_514 * _517), (_517 * _515))))), abs(dot(float2((_474 - _461), ((_505 * 15.0f) - _462)), float2((_529 * _526), (_529 * _527))))), abs(dot(float2(((_507 * 7.5f) - _461), ((_510 * 15.0f) - _462)), float2((_541 * _538), (_541 * _539))))) * 0.2309400886297226f)) - _634) / ((_634 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _645 = (_640 * _451);
      _646 = (_640 * _452);
      _647 = (_640 * _453);
    } while (false);
  } else {
    _645 = _451;
    _646 = _452;
    _647 = _453;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _655 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _655 = 0.0f;
  }
  float _662 = frame_consts.params.vignette.intensity + _655;
  float _665 = _15 / _16;
  float _677 = exp2(log2(saturate((_662 * abs(O_Uv.x + -0.5f)) * (((_665 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _678 = exp2(log2(saturate(_662 * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _684 = exp2(log2(saturate(1.0f - dot(float2(_677, _678), float2(_677, _678)))) * 6.0f);
  float _689 = 1.0f - _684;
  float _691 = 1.0f - (_689 * 0.8500000238418579f);
  float _698 = (_691 * (_645 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _699 = (_691 * (_646 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _700 = (_691 * (_647 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _704 = ((_684 * 1.2000000476837158f) * _689) * frame_consts.params.vignette.golden_intensity;
  if (_704 > 0.0020000000949949026f) {
    float _709 = _15 * O_Uv.x;
    float _710 = _16 * O_Uv.y;
    float _711 = _709 + _710;
    float _717 = frac(_711 * 0.0033333334140479565f) + -0.5f;
    float _718 = frac((_710 - _709) * 0.0033333334140479565f) + -0.5f;
    float _724 = saturate(sqrt((_718 * _718) + (_717 * _717)) * 2.0f);
    float _735 = saturate((sin((_711 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _740 = ((_735 * _735) * 0.2199999988079071f) * (3.0f - (_735 * 2.0f));
    float _741 = _740 + 0.9777389168739319f;
    float _742 = ((_724 * 0.13274884223937988f) + 0.7175776362419128f) + _740;
    float _743 = ((_724 * 0.3335757553577423f) + 0.30871906876564026f) + _740;
    float _748 = (O_Uv.x * 1080.0f) * _665;
    float _749 = O_Uv.y * 1080.0f;
    float _750 = _748 * 0.04444444552063942f;
    float _751 = O_Uv.y * 27.712812423706055f;
    float _753 = ceil(_750 - _751);
    float _756 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _759 = ceil((-0.0f - _751) - _750);
    float _761 = (_756 + _753) + _759;
    float _763 = (_761 * 22.5f) + -33.75f;
    float _765 = (_753 - _759) * 11.25f;
    float _771 = (((_756 * 0.5773502588272095f) - (_753 * 0.28867512941360474f)) - (_759 * 0.28867512941360474f)) * 22.5f;
    float _774 = _763 + _765;
    float _775 = _771 + (19.485570907592773f - (_761 * 12.990381240844727f));
    float _778 = ((_761 * 25.980762481689453f) + -38.97114181518555f) + _771;
    float _779 = _765 - _763;
    float _780 = _774 - _748;
    float _781 = _775 - _749;
    float _784 = _765 - _748;
    float _785 = _778 - _749;
    float _790 = _781 * _781;
    float _797 = _779 - _748;
    float _801 = frame_consts.time * 0.30000001192092896f;
    float _802 = _775 * 0.4000000059604645f;
    float _811 = sin(((_775 * 0.04444444552063942f) + _801) * 2.0f);
    float _816 = saturate((sqrt(_811 * cos((((_802 + _774) * 0.04444444552063942f) + _801) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _820 = (_816 * _816) * (3.0f - (_816 * 2.0f));
    float _822 = (_820 * 0.6499999761581421f) + 0.3499999940395355f;
    float _837 = saturate((sqrt(sin(((_778 * 0.04444444552063942f) + _801) * 2.0f) * cos(((((_778 * 0.4000000059604645f) + _765) * 0.04444444552063942f) + _801) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _841 = (_837 * _837) * (3.0f - (_837 * 2.0f));
    float _843 = (_841 * 0.6499999761581421f) + 0.3499999940395355f;
    float _853 = saturate((sqrt(cos((((_802 + _779) * 0.04444444552063942f) + _801) * 2.0f) * _811) * 2.0f) + 0.20000004768371582f);
    float _857 = (_853 * _853) * (3.0f - (_853 * 2.0f));
    float _859 = (_857 * 0.6499999761581421f) + 0.3499999940395355f;
    float _881 = saturate(_822);
    float _882 = saturate(_843);
    float _901 = ((((saturate(11.0f - (sqrt((_785 * _785) + (_784 * _784)) / ((_841 * 0.039000000804662704f) + 0.08100000768899918f))) * _843) + (saturate(11.0f - (sqrt((_780 * _780) + _790) / ((_820 * 0.039000000804662704f) + 0.08100000768899918f))) * _822)) + (saturate(11.0f - (sqrt((_797 * _797) + _790) / ((_857 * 0.039000000804662704f) + 0.08100000768899918f))) * _859)) + (((((saturate(1.0f - (abs(_781) * 0.8333333134651184f)) * _881) + (saturate(1.0f - (abs(dot(float2(_784, _785), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _882)) * saturate(_859)) + ((_881 * saturate(1.0f - (abs(dot(float2(_780, _781), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _882)) * 0.5f)) * _704;
    _912 = ((_901 * ((_741 * _741) - _698)) + _698);
    _913 = ((_901 * ((_742 * _742) - _699)) + _699);
    _914 = ((_901 * ((_743 * _743) - _700)) + _700);
  } else {
    _912 = _698;
    _913 = _699;
    _914 = _700;
  }
  if (frame_consts.flashback_lut > 0.0f) {
    float _923 = ((_913 * 0.7689999938011169f) + (_912 * 0.3930000066757202f)) + (_914 * 0.1889999955892563f);
    float _928 = ((_913 * 0.6859999895095825f) + (_912 * 0.3490000069141388f)) + (_914 * 0.1679999977350235f);
    float _933 = ((_913 * 0.5339999794960022f) + (_912 * 0.2720000147819519f)) + (_914 * 0.13099999725818634f);
    float _934 = frame_consts.flashback_lut * 0.800000011920929f;
    float _939 = ((_913 * 0.7152000069618225f) + (_912 * 0.2125999927520752f)) + (_914 * 0.0722000002861023f);
    _959 = ((((_923 - _912) + ((_939 - _923) * 0.6499999761581421f)) * _934) + _912);
    _960 = ((((_928 - _913) + ((_939 - _928) * 0.6499999761581421f)) * _934) + _913);
    _961 = ((((_933 - _914) + ((_939 - _933) * 0.6499999761581421f)) * _934) + _914);
  } else {
    _959 = _912;
    _960 = _913;
    _961 = _914;
  }
  if (!(frame_consts.invert == 0)) {
    _970 = (1.0f - _959);
    _971 = (1.0f - _960);
    _972 = (1.0f - _961);
  } else {
    _970 = _959;
    _971 = _960;
    _972 = _961;
  }
  SV_Target.x = _970;
  SV_Target.y = _971;
  SV_Target.z = _972;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
