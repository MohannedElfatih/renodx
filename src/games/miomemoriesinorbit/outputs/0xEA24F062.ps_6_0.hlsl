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
  float4 _28 = tex.SampleLevel(sampler_nearest, float2(_26, _27), 0.0f);
  float3 _32 = bloom_tex.SampleLevel(sampler_bilinear, float2(_26, _27), 0.0f);
  float _47 = max((((1.0f - (_28.y * 0.7152000069618225f)) - (_28.x * 0.2125999927520752f)) - (_28.z * 0.0722000002861023f)), 0.0010000000474974513f);
  float _51 = (_28.x / _47) + (frame_consts.params.bloom.intensity * _32.x);
  float _52 = (_28.y / _47) + (frame_consts.params.bloom.intensity * _32.y);
  float _53 = (_28.z / _47) + (frame_consts.params.bloom.intensity * _32.z);
  float _59 = (((_51 * 0.2125999927520752f) + 1.0f) + (_52 * 0.7152000069618225f)) + (_53 * 0.0722000002861023f);
  float _63 = saturate(_51 / _59);
  float _64 = saturate(_52 / _59);
  float _65 = saturate(_53 / _59);
  uint2 _66; color_correct_lut.GetDimensions(_66.x, _66.y);
  float _79;
  float _90;
  float _101;
  float _494;
  float _495;
  float _496;
  if (!(!(_63 <= 0.0031308000907301903f))) {
    _79 = (_63 * 12.920000076293945f);
  } else {
    _79 = (((pow(_63, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_64 <= 0.0031308000907301903f))) {
    _90 = (_64 * 12.920000076293945f);
  } else {
    _90 = (((pow(_64, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_65 <= 0.0031308000907301903f))) {
    _101 = (_65 * 12.920000076293945f);
  } else {
    _101 = (((pow(_65, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  float _104 = float((uint)(_66.y + -1u));
  float _107 = _101 * _104;
  float _108 = frac(_107);
  float _110 = float((uint)_66.y);
  float _112 = (_79 * _104) + 0.5f;
  float _115 = float((uint)_66.x);
  float _117 = (lerp(_90, 1.0f, _104)) / _110;
  float3 _118 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((ceil(_107) * _110) + _112) / _115), _117), 0.0f);
  float3 _126 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((floor(_107) * _110) + _112) / _115), _117), 0.0f);
  float _136 = ((_118.x - _126.x) * _108) + _126.x;
  float _137 = ((_118.y - _126.y) * _108) + _126.y;
  float _138 = ((_118.z - _126.z) * _108) + _126.z;
  float _144 = depth_tex.SampleLevel(sampler_nearest, float2(_26, _27), 0.0f);
  float _148 = 10000.0f / ((_144.x * 19999.5f) + 0.5f);
  float _153 = (_148 * ((_26 * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _155 = (_148 * (((1.0f - _27) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _156 = -0.0f - _148;
  float _180 = mad((frame_consts.paper_xf[2].z), _156, mad((frame_consts.paper_xf[1].z), _155, (_153 * (frame_consts.paper_xf[0].z))));
  float _181 = mad((frame_consts.paper_xf[2].x), _156, mad((frame_consts.paper_xf[1].x), _155, (_153 * (frame_consts.paper_xf[0].x)))) / _180;
  float _182 = mad((frame_consts.paper_xf[2].y), _156, mad((frame_consts.paper_xf[1].y), _155, (_153 * (frame_consts.paper_xf[0].y)))) / _180;
  float _194 = exp2(round(log2(max(5.0f, (-0.0f - (_180 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _196 = min((1.0f / _194), 0.20000000298023224f);
  float _197 = frame_consts.game_plane_blend.x - _194;
  float _204 = frame_consts.game_plane_blend.x + 10.0f;
  float _212 = exp2(round(log2(max(5.0f, (-0.0f - (_180 - _204)))) * 10.0f) * 0.10000000149011612f);
  float _214 = min((1.0f / _212), 0.20000000298023224f);
  float _215 = _204 - _212;
  float _222 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_197 * _181) + (frame_consts.paper_xf[3].x)) * _196), (((_197 * _182) + (frame_consts.paper_xf[3].y)) * _196)), 0.0f);
  float _225 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_215 * _181) + (frame_consts.paper_xf[3].x)) * _214), (((_215 * _182) + (frame_consts.paper_xf[3].y)) * _214)), 0.0f);
  float _232 = ((1.0f - (_222.x * (1.0f - frame_consts.game_plane_blend.y))) - (_225.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _247 = _16 / _17;
  float _259 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_26 + -0.5f)) * (((_247 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _260 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_27 + -0.5f))) * 5.0f);
  float _266 = exp2(log2(saturate(1.0f - dot(float2(_259, _260), float2(_259, _260)))) * 6.0f);
  float _271 = 1.0f - _266;
  float _273 = 1.0f - (_271 * 0.8500000238418579f);
  float _280 = (_273 * ((_136 - (_232 * _136)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _281 = (_273 * ((_137 - (_232 * _137)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _282 = (_273 * ((_138 - (_232 * _138)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _286 = ((_266 * 1.2000000476837158f) * _271) * frame_consts.params.vignette.golden_intensity;
  if (_286 > 0.0020000000949949026f) {
    float _291 = _26 * _16;
    float _292 = _27 * _17;
    float _293 = _292 + _291;
    float _299 = frac(_293 * 0.0033333334140479565f) + -0.5f;
    float _300 = frac((_292 - _291) * 0.0033333334140479565f) + -0.5f;
    float _306 = saturate(sqrt((_300 * _300) + (_299 * _299)) * 2.0f);
    float _317 = saturate((sin((_293 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _322 = ((_317 * _317) * 0.2199999988079071f) * (3.0f - (_317 * 2.0f));
    float _323 = _322 + 0.9777389168739319f;
    float _324 = ((_306 * 0.13274884223937988f) + 0.7175776362419128f) + _322;
    float _325 = ((_306 * 0.3335757553577423f) + 0.30871906876564026f) + _322;
    float _330 = (_26 * 1080.0f) * _247;
    float _331 = _27 * 1080.0f;
    float _332 = _330 * 0.04444444552063942f;
    float _333 = _27 * 27.712812423706055f;
    float _335 = ceil(_332 - _333);
    float _338 = floor(_27 * 55.42562484741211f) + 1.0f;
    float _341 = ceil((-0.0f - _333) - _332);
    float _343 = (_338 + _335) + _341;
    float _345 = (_343 * 22.5f) + -33.75f;
    float _347 = (_335 - _341) * 11.25f;
    float _353 = (((_338 * 0.5773502588272095f) - (_335 * 0.28867512941360474f)) - (_341 * 0.28867512941360474f)) * 22.5f;
    float _356 = _345 + _347;
    float _357 = _353 + (19.485570907592773f - (_343 * 12.990381240844727f));
    float _360 = ((_343 * 25.980762481689453f) + -38.97114181518555f) + _353;
    float _361 = _347 - _345;
    float _362 = _356 - _330;
    float _363 = _357 - _331;
    float _366 = _347 - _330;
    float _367 = _360 - _331;
    float _372 = _363 * _363;
    float _379 = _361 - _330;
    float _383 = frame_consts.time * 0.30000001192092896f;
    float _384 = _357 * 0.4000000059604645f;
    float _393 = sin(((_357 * 0.04444444552063942f) + _383) * 2.0f);
    float _398 = saturate((sqrt(_393 * cos((((_384 + _356) * 0.04444444552063942f) + _383) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _402 = (_398 * _398) * (3.0f - (_398 * 2.0f));
    float _404 = (_402 * 0.6499999761581421f) + 0.3499999940395355f;
    float _419 = saturate((sqrt(sin(((_360 * 0.04444444552063942f) + _383) * 2.0f) * cos(((((_360 * 0.4000000059604645f) + _347) * 0.04444444552063942f) + _383) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _423 = (_419 * _419) * (3.0f - (_419 * 2.0f));
    float _425 = (_423 * 0.6499999761581421f) + 0.3499999940395355f;
    float _435 = saturate((sqrt(cos((((_384 + _361) * 0.04444444552063942f) + _383) * 2.0f) * _393) * 2.0f) + 0.20000004768371582f);
    float _439 = (_435 * _435) * (3.0f - (_435 * 2.0f));
    float _441 = (_439 * 0.6499999761581421f) + 0.3499999940395355f;
    float _463 = saturate(_404);
    float _464 = saturate(_425);
    float _483 = ((((saturate(11.0f - (sqrt((_367 * _367) + (_366 * _366)) / ((_423 * 0.039000000804662704f) + 0.08100000768899918f))) * _425) + (saturate(11.0f - (sqrt((_362 * _362) + _372) / ((_402 * 0.039000000804662704f) + 0.08100000768899918f))) * _404)) + (saturate(11.0f - (sqrt((_379 * _379) + _372) / ((_439 * 0.039000000804662704f) + 0.08100000768899918f))) * _441)) + (((((saturate(1.0f - (abs(_363) * 0.8333333134651184f)) * _463) + (saturate(1.0f - (abs(dot(float2(_366, _367), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _464)) * saturate(_441)) + ((_463 * saturate(1.0f - (abs(dot(float2(_362, _363), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _464)) * 0.5f)) * _286;
    _494 = ((_483 * ((_323 * _323) - _280)) + _280);
    _495 = ((_483 * ((_324 * _324) - _281)) + _281);
    _496 = ((_483 * ((_325 * _325) - _282)) + _282);
  } else {
    _494 = _280;
    _495 = _281;
    _496 = _282;
  }
  SV_Target.x = _494;
  SV_Target.y = _495;
  SV_Target.z = _496;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_28.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
