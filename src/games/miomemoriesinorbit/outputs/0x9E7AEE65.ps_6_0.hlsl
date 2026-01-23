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
  float4 _17 = tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float3 _21 = bloom_tex.SampleLevel(sampler_bilinear, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _36 = max((((1.0f - (_17.y * 0.7152000069618225f)) - (_17.x * 0.2125999927520752f)) - (_17.z * 0.0722000002861023f)), 0.0010000000474974513f);
  float _40 = (_17.x / _36) + (frame_consts.params.bloom.intensity * _21.x);
  float _41 = (_17.y / _36) + (frame_consts.params.bloom.intensity * _21.y);
  float _42 = (_17.z / _36) + (frame_consts.params.bloom.intensity * _21.z);
  float _48 = (((_40 * 0.2125999927520752f) + 1.0f) + (_41 * 0.7152000069618225f)) + (_42 * 0.0722000002861023f);
  float _52 = saturate(_40 / _48);
  float _53 = saturate(_41 / _48);
  float _54 = saturate(_42 / _48);
  uint2 _55; color_correct_lut.GetDimensions(_55.x, _55.y);
  float _68;
  float _79;
  float _90;
  float _483;
  float _484;
  float _485;
  if (!(!(_52 <= 0.0031308000907301903f))) {
    _68 = (_52 * 12.920000076293945f);
  } else {
    _68 = (((pow(_52, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_53 <= 0.0031308000907301903f))) {
    _79 = (_53 * 12.920000076293945f);
  } else {
    _79 = (((pow(_53, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_54 <= 0.0031308000907301903f))) {
    _90 = (_54 * 12.920000076293945f);
  } else {
    _90 = (((pow(_54, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  float _93 = float((uint)(_55.y + -1u));
  float _96 = _90 * _93;
  float _97 = frac(_96);
  float _99 = float((uint)_55.y);
  float _101 = (_68 * _93) + 0.5f;
  float _104 = float((uint)_55.x);
  float _106 = (lerp(_79, 1.0f, _93)) / _99;
  float3 _107 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((ceil(_96) * _99) + _101) / _104), _106), 0.0f);
  float3 _115 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((floor(_96) * _99) + _101) / _104), _106), 0.0f);
  float _125 = ((_107.x - _115.x) * _97) + _115.x;
  float _126 = ((_107.y - _115.y) * _97) + _115.y;
  float _127 = ((_107.z - _115.z) * _97) + _115.z;
  float _133 = depth_tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _137 = 10000.0f / ((_133.x * 19999.5f) + 0.5f);
  float _142 = (_137 * ((O_Uv.x * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _144 = (_137 * (((1.0f - O_Uv.y) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _145 = -0.0f - _137;
  float _169 = mad((frame_consts.paper_xf[2].z), _145, mad((frame_consts.paper_xf[1].z), _144, (_142 * (frame_consts.paper_xf[0].z))));
  float _170 = mad((frame_consts.paper_xf[2].x), _145, mad((frame_consts.paper_xf[1].x), _144, (_142 * (frame_consts.paper_xf[0].x)))) / _169;
  float _171 = mad((frame_consts.paper_xf[2].y), _145, mad((frame_consts.paper_xf[1].y), _144, (_142 * (frame_consts.paper_xf[0].y)))) / _169;
  float _183 = exp2(round(log2(max(5.0f, (-0.0f - (_169 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _185 = min((1.0f / _183), 0.20000000298023224f);
  float _186 = frame_consts.game_plane_blend.x - _183;
  float _193 = frame_consts.game_plane_blend.x + 10.0f;
  float _201 = exp2(round(log2(max(5.0f, (-0.0f - (_169 - _193)))) * 10.0f) * 0.10000000149011612f);
  float _203 = min((1.0f / _201), 0.20000000298023224f);
  float _204 = _193 - _201;
  float _211 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_186 * _170) + (frame_consts.paper_xf[3].x)) * _185), (((_186 * _171) + (frame_consts.paper_xf[3].y)) * _185)), 0.0f);
  float _214 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_204 * _170) + (frame_consts.paper_xf[3].x)) * _203), (((_204 * _171) + (frame_consts.paper_xf[3].y)) * _203)), 0.0f);
  float _221 = ((1.0f - (_211.x * (1.0f - frame_consts.game_plane_blend.y))) - (_214.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _236 = _15 / _16;
  float _248 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(O_Uv.x + -0.5f)) * (((_236 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _249 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _255 = exp2(log2(saturate(1.0f - dot(float2(_248, _249), float2(_248, _249)))) * 6.0f);
  float _260 = 1.0f - _255;
  float _262 = 1.0f - (_260 * 0.8500000238418579f);
  float _269 = (_262 * ((_125 - (_221 * _125)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _270 = (_262 * ((_126 - (_221 * _126)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _271 = (_262 * ((_127 - (_221 * _127)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _275 = ((_255 * 1.2000000476837158f) * _260) * frame_consts.params.vignette.golden_intensity;
  if (_275 > 0.0020000000949949026f) {
    float _280 = _15 * O_Uv.x;
    float _281 = _16 * O_Uv.y;
    float _282 = _280 + _281;
    float _288 = frac(_282 * 0.0033333334140479565f) + -0.5f;
    float _289 = frac((_281 - _280) * 0.0033333334140479565f) + -0.5f;
    float _295 = saturate(sqrt((_289 * _289) + (_288 * _288)) * 2.0f);
    float _306 = saturate((sin((_282 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _311 = ((_306 * _306) * 0.2199999988079071f) * (3.0f - (_306 * 2.0f));
    float _312 = _311 + 0.9777389168739319f;
    float _313 = ((_295 * 0.13274884223937988f) + 0.7175776362419128f) + _311;
    float _314 = ((_295 * 0.3335757553577423f) + 0.30871906876564026f) + _311;
    float _319 = (O_Uv.x * 1080.0f) * _236;
    float _320 = O_Uv.y * 1080.0f;
    float _321 = _319 * 0.04444444552063942f;
    float _322 = O_Uv.y * 27.712812423706055f;
    float _324 = ceil(_321 - _322);
    float _327 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _330 = ceil((-0.0f - _322) - _321);
    float _332 = (_327 + _324) + _330;
    float _334 = (_332 * 22.5f) + -33.75f;
    float _336 = (_324 - _330) * 11.25f;
    float _342 = (((_327 * 0.5773502588272095f) - (_324 * 0.28867512941360474f)) - (_330 * 0.28867512941360474f)) * 22.5f;
    float _345 = _334 + _336;
    float _346 = _342 + (19.485570907592773f - (_332 * 12.990381240844727f));
    float _349 = ((_332 * 25.980762481689453f) + -38.97114181518555f) + _342;
    float _350 = _336 - _334;
    float _351 = _345 - _319;
    float _352 = _346 - _320;
    float _355 = _336 - _319;
    float _356 = _349 - _320;
    float _361 = _352 * _352;
    float _368 = _350 - _319;
    float _372 = frame_consts.time * 0.30000001192092896f;
    float _373 = _346 * 0.4000000059604645f;
    float _382 = sin(((_346 * 0.04444444552063942f) + _372) * 2.0f);
    float _387 = saturate((sqrt(_382 * cos((((_373 + _345) * 0.04444444552063942f) + _372) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _391 = (_387 * _387) * (3.0f - (_387 * 2.0f));
    float _393 = (_391 * 0.6499999761581421f) + 0.3499999940395355f;
    float _408 = saturate((sqrt(sin(((_349 * 0.04444444552063942f) + _372) * 2.0f) * cos(((((_349 * 0.4000000059604645f) + _336) * 0.04444444552063942f) + _372) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _412 = (_408 * _408) * (3.0f - (_408 * 2.0f));
    float _414 = (_412 * 0.6499999761581421f) + 0.3499999940395355f;
    float _424 = saturate((sqrt(cos((((_373 + _350) * 0.04444444552063942f) + _372) * 2.0f) * _382) * 2.0f) + 0.20000004768371582f);
    float _428 = (_424 * _424) * (3.0f - (_424 * 2.0f));
    float _430 = (_428 * 0.6499999761581421f) + 0.3499999940395355f;
    float _452 = saturate(_393);
    float _453 = saturate(_414);
    float _472 = ((((saturate(11.0f - (sqrt((_356 * _356) + (_355 * _355)) / ((_412 * 0.039000000804662704f) + 0.08100000768899918f))) * _414) + (saturate(11.0f - (sqrt((_351 * _351) + _361) / ((_391 * 0.039000000804662704f) + 0.08100000768899918f))) * _393)) + (saturate(11.0f - (sqrt((_368 * _368) + _361) / ((_428 * 0.039000000804662704f) + 0.08100000768899918f))) * _430)) + (((((saturate(1.0f - (abs(_352) * 0.8333333134651184f)) * _452) + (saturate(1.0f - (abs(dot(float2(_355, _356), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _453)) * saturate(_430)) + ((_452 * saturate(1.0f - (abs(dot(float2(_351, _352), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _453)) * 0.5f)) * _275;
    _483 = ((_472 * ((_312 * _312) - _269)) + _269);
    _484 = ((_472 * ((_313 * _313) - _270)) + _270);
    _485 = ((_472 * ((_314 * _314) - _271)) + _271);
  } else {
    _483 = _269;
    _484 = _270;
    _485 = _271;
  }
  SV_Target.x = _483;
  SV_Target.y = _484;
  SV_Target.z = _485;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_17.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
