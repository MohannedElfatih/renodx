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
  float _495;
  float _496;
  float _497;
  float _538;
  float _539;
  float _540;
  float _689;
  float _690;
  float _691;
  float _699;
  float _789;
  float _790;
  float _791;
  float _800;
  float _801;
  float _802;
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
  float _382 = 1.0f - frame_consts.game_plane_blend.y;
  float _387 = log2(max(5.0f, (-0.0f - (_376 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _388 = floor(_387);
  float _389 = _387 - _388;
  float _391 = exp2(_388 * 0.10000000149011612f);
  float _392 = 1.0f / _391;
  float _393 = min(_392, 0.20000000298023224f);
  float _395 = min((_392 * 0.9330329895019531f), 0.20000000298023224f);
  float _396 = frame_consts.game_plane_blend.x - _391;
  float _402 = frame_consts.game_plane_blend.x - (_391 * 1.0717734098434448f);
  float _414 = frame_consts.game_plane_blend.x + 10.0f;
  float _419 = log2(max(5.0f, (-0.0f - (_376 - _414)))) * 10.0f;
  float _420 = floor(_419);
  float _421 = _419 - _420;
  float _423 = exp2(_420 * 0.10000000149011612f);
  float _424 = 1.0f / _423;
  float _425 = min(_424, 0.20000000298023224f);
  float _427 = min((_424 * 0.9330329895019531f), 0.20000000298023224f);
  float _428 = _414 - _423;
  float _434 = _414 - (_423 * 1.0717734098434448f);
  float _446 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_396 * _377) + (frame_consts.paper_xf[3].x)) * _393), (((_396 * _378) + (frame_consts.paper_xf[3].y)) * _393)), 0.0f);
  float _449 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_402 * _377) + (frame_consts.paper_xf[3].x)) * _395), (((_402 * _378) + (frame_consts.paper_xf[3].y)) * _395)), 0.0f);
  float _452 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_428 * _377) + (frame_consts.paper_xf[3].x)) * _425), (((_428 * _378) + (frame_consts.paper_xf[3].y)) * _425)), 0.0f);
  float _455 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_434 * _377) + (frame_consts.paper_xf[3].x)) * _427), (((_434 * _378) + (frame_consts.paper_xf[3].y)) * _427)), 0.0f);
  float _464 = ((((1.0f - (((1.0f - _389) * _382) * _446.x)) - ((_389 * _382) * _449.x)) - (((1.0f - _421) * frame_consts.game_plane_blend.y) * _452.x)) - ((_421 * frame_consts.game_plane_blend.y) * _455.x)) * frame_consts.paper_mult;
  float _468 = _332 - (_464 * _332);
  float _469 = _333 - (_464 * _333);
  float _470 = _334 - (_464 * _334);
  if (!(frame_consts.death_screen == 0)) {
    float _493 = select((frame_consts.death_screen_t <= 0.019999999552965164f), (1.0f - _51), _51);
    _495 = _493;
    _496 = _493;
    _497 = _493;
  } else {
    _495 = (lerp(_468, frame_consts.params.fade.color.x, frame_consts.params.fade.intensity));
    _496 = (lerp(_469, frame_consts.params.fade.color.y, frame_consts.params.fade.intensity));
    _497 = (lerp(_470, frame_consts.params.fade.color.z, frame_consts.params.fade.intensity));
  }
  if (!(frame_consts.triangular_dissolve_enabled == 0)) {
    float _505 = _15 * O_Uv.x;
    float _506 = _16 * O_Uv.y;
    float _507 = _505 * 0.06666667014360428f;
    float _508 = _506 * 0.038490019738674164f;
    float _510 = ceil(_507 - _508);
    float _512 = floor(_506 * 0.07698003947734833f);
    float _513 = _512 + 1.0f;
    float _516 = ceil((-0.0f - _507) - _508);
    float _518 = (_510 - _516) * 7.5f;
    float _519 = _510 * 0.28867512941360474f;
    float _520 = _513 * 0.5773502588272095f;
    float _521 = _520 - _519;
    float _522 = _516 * 0.28867512941360474f;
    float _525 = _518 / _15;
    float _526 = ((_521 - _522) * 15.0f) / _16;
    do {
      if (((_513 + _510) + _516) == 2.0f) {
        _538 = (_510 + 1.0f);
        _539 = (_512 + 2.0f);
        _540 = (_516 + 1.0f);
      } else {
        _538 = (_510 + -1.0f);
        _539 = _512;
        _540 = (_516 + -1.0f);
      }
      float _541 = _538 - _516;
      float _544 = _520 - (_538 * 0.28867512941360474f);
      float _545 = _544 - _522;
      float _548 = (_539 * 0.5773502588272095f) - _519;
      float _549 = _548 - _522;
      float _551 = _510 - _540;
      float _554 = _521 - (_540 * 0.28867512941360474f);
      float _558 = (_544 - _548) * 15.0f;
      float _559 = (_538 - _510) * -7.5f;
      float _561 = rsqrt(dot(float2(_558, _559), float2(_558, _559)));
      float _570 = (_549 - _554) * 15.0f;
      float _571 = (_540 - _516) * -7.5f;
      float _573 = rsqrt(dot(float2(_570, _571), float2(_570, _571)));
      float _582 = (_554 - _545) * 15.0f;
      float _583 = (_551 - _541) * -7.5f;
      float _585 = rsqrt(dot(float2(_582, _583), float2(_582, _583)));
      float _598 = _525 + -0.5f;
      float _599 = _526 + -0.5f;
      float _646 = O_Uv.x + -0.5f;
      float _647 = O_Uv.y + -0.5f;
      float _654 = ((frame_consts.time - sqrt((_647 * _647) + (_646 * _646))) + (frac(sin(dot(float2((_525 * 5.0f), (_526 * 5.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.20000000298023224f)) * 0.0555555559694767f;
      float _658 = frac(abs(_654));
      float _662 = max((select((_654 >= (-0.0f - _654)), _658, (-0.0f - _658)) * 18.0f), 0.0f);
      float _678 = min(max((1.0f - (((((_662 * 1.600000023841858f) * exp2(1.4426950216293335f - (_662 * 11.541560173034668f))) + (saturate((((frame_consts.triangular_dissolve_amount + -0.6499999761581421f) + (sqrt((_599 * _599) + (_598 * _598)) * 1.4142135381698608f)) + (frac(sin(dot(float2((_525 * 3.0f), (_526 * 3.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f)) * 4.0f) * ((frame_consts.triangular_dissolve_amount * 4.0f) + 1.0f))) * frame_consts.triangular_dissolve_base_amount) * ((saturate((sin((frac(sin(dot(float2(_525, _526), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 5.0f) + ((frame_consts.time * 1.7999999523162842f) * ((frac(sin(dot(float2((_525 * 2.0f), (_526 * 2.0f)), float2(12.989800453186035f, 78.23300170898438f))) * 43758.5f) * 0.10000000149011612f) + 1.0f))) + 1.0f) * 0.5f) * 0.75f) + 0.25f))), 0.0f), 1.0f);
      float _684 = 1.0f - saturate(((1.0f - saturate(min(min(min(1000.0f, abs(dot(float2(((_541 * 7.5f) - _505), ((_545 * 15.0f) - _506)), float2((_558 * _561), (_561 * _559))))), abs(dot(float2((_518 - _505), ((_549 * 15.0f) - _506)), float2((_573 * _570), (_573 * _571))))), abs(dot(float2(((_551 * 7.5f) - _505), ((_554 * 15.0f) - _506)), float2((_585 * _582), (_585 * _583))))) * 0.2309400886297226f)) - _678) / ((_678 * 0.10000002384185791f) + 9.999999974752427e-07f));
      _689 = (_684 * _495);
      _690 = (_684 * _496);
      _691 = (_684 * _497);
    } while (false);
  } else {
    _689 = _495;
    _690 = _496;
    _691 = _497;
  }
  if (!(frame_consts.heart_attack_active == 0)) {
    _699 = (frame_consts.heart_attack_pulse * 0.10000000149011612f);
  } else {
    _699 = 0.0f;
  }
  float _706 = frame_consts.params.vignette.intensity + _699;
  float _721 = exp2(log2(saturate((_706 * abs(O_Uv.x + -0.5f)) * ((((_15 / _16) + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _722 = exp2(log2(saturate(_706 * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _735 = 1.0f - ((1.0f - exp2(log2(saturate(1.0f - dot(float2(_721, _722), float2(_721, _722)))) * 6.0f)) * 0.8500000238418579f);
  float _742 = (_735 * (_689 - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _743 = (_735 * (_690 - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _744 = (_735 * (_691 - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  if (frame_consts.flashback_lut > 0.0f) {
    float _753 = ((_742 * 0.3930000066757202f) + (_743 * 0.7689999938011169f)) + (_744 * 0.1889999955892563f);
    float _758 = ((_742 * 0.3490000069141388f) + (_743 * 0.6859999895095825f)) + (_744 * 0.1679999977350235f);
    float _763 = ((_742 * 0.2720000147819519f) + (_743 * 0.5339999794960022f)) + (_744 * 0.13099999725818634f);
    float _764 = frame_consts.flashback_lut * 0.800000011920929f;
    float _769 = ((_742 * 0.2125999927520752f) + (_743 * 0.7152000069618225f)) + (_744 * 0.0722000002861023f);
    _789 = ((((_753 - _742) + ((_769 - _753) * 0.6499999761581421f)) * _764) + _742);
    _790 = ((((_758 - _743) + ((_769 - _758) * 0.6499999761581421f)) * _764) + _743);
    _791 = ((((_763 - _744) + ((_769 - _763) * 0.6499999761581421f)) * _764) + _744);
  } else {
    _789 = _742;
    _790 = _743;
    _791 = _744;
  }
  if (!(frame_consts.invert == 0)) {
    _800 = (1.0f - _789);
    _801 = (1.0f - _790);
    _802 = (1.0f - _791);
  } else {
    _800 = _789;
    _801 = _790;
    _802 = _791;
  }
  SV_Target.x = _800;
  SV_Target.y = _801;
  SV_Target.z = _802;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
