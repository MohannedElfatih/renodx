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
  float2 _17 = distortion.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _20 = _16 / _15;
  float _25 = saturate((_17.x * _20) + O_Uv.x);
  float _26 = saturate((_17.y * _20) + O_Uv.y);
  float4 _27 = tex.SampleLevel(sampler_nearest, float2(_25, _26), 0.0f);
  uint2 _31; color_correct_lut.GetDimensions(_31.x, _31.y);
  float _44;
  float _55;
  float _66;
  if (!(!(_27.x <= 0.0031308000907301903f))) {
    _44 = (_27.x * 12.920000076293945f);
  } else {
    _44 = (((pow(_27.x, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_27.y <= 0.0031308000907301903f))) {
    _55 = (_27.y * 12.920000076293945f);
  } else {
    _55 = (((pow(_27.y, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_27.z <= 0.0031308000907301903f))) {
    _66 = (_27.z * 12.920000076293945f);
  } else {
    _66 = (((pow(_27.z, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  float _69 = float((uint)(_31.y + -1u));
  float _72 = _66 * _69;
  float _73 = frac(_72);
  float _75 = float((uint)_31.y);
  float _77 = (_44 * _69) + 0.5f;
  float _80 = float((uint)_31.x);
  float _82 = (lerp(_55, 1.0f, _69)) / _75;
  float3 _83 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((ceil(_72) * _75) + _77) / _80), _82), 0.0f);
  float3 _91 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((floor(_72) * _75) + _77) / _80), _82), 0.0f);
  float _101 = ((_83.x - _91.x) * _73) + _91.x;
  float _102 = ((_83.y - _91.y) * _73) + _91.y;
  float _103 = ((_83.z - _91.z) * _73) + _91.z;
  float _109 = depth_tex.SampleLevel(sampler_nearest, float2(_25, _26), 0.0f);
  float _113 = 10000.0f / ((_109.x * 19999.5f) + 0.5f);
  float _118 = (_113 * ((_25 * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _120 = (_113 * (((1.0f - _26) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _121 = -0.0f - _113;
  float _145 = mad((frame_consts.paper_xf[2].z), _121, mad((frame_consts.paper_xf[1].z), _120, (_118 * (frame_consts.paper_xf[0].z))));
  float _146 = mad((frame_consts.paper_xf[2].x), _121, mad((frame_consts.paper_xf[1].x), _120, (_118 * (frame_consts.paper_xf[0].x)))) / _145;
  float _147 = mad((frame_consts.paper_xf[2].y), _121, mad((frame_consts.paper_xf[1].y), _120, (_118 * (frame_consts.paper_xf[0].y)))) / _145;
  float _151 = 1.0f - frame_consts.game_plane_blend.y;
  float _156 = log2(max(5.0f, (-0.0f - (_145 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _157 = floor(_156);
  float _158 = _156 - _157;
  float _160 = exp2(_157 * 0.10000000149011612f);
  float _161 = 1.0f / _160;
  float _162 = min(_161, 0.20000000298023224f);
  float _164 = min((_161 * 0.9330329895019531f), 0.20000000298023224f);
  float _165 = frame_consts.game_plane_blend.x - _160;
  float _171 = frame_consts.game_plane_blend.x - (_160 * 1.0717734098434448f);
  float _183 = frame_consts.game_plane_blend.x + 10.0f;
  float _188 = log2(max(5.0f, (-0.0f - (_145 - _183)))) * 10.0f;
  float _189 = floor(_188);
  float _190 = _188 - _189;
  float _192 = exp2(_189 * 0.10000000149011612f);
  float _193 = 1.0f / _192;
  float _194 = min(_193, 0.20000000298023224f);
  float _196 = min((_193 * 0.9330329895019531f), 0.20000000298023224f);
  float _197 = _183 - _192;
  float _203 = _183 - (_192 * 1.0717734098434448f);
  float _215 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_165 * _146) + (frame_consts.paper_xf[3].x)) * _162), (((_165 * _147) + (frame_consts.paper_xf[3].y)) * _162)), 0.0f);
  float _218 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_171 * _146) + (frame_consts.paper_xf[3].x)) * _164), (((_171 * _147) + (frame_consts.paper_xf[3].y)) * _164)), 0.0f);
  float _221 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_197 * _146) + (frame_consts.paper_xf[3].x)) * _194), (((_197 * _147) + (frame_consts.paper_xf[3].y)) * _194)), 0.0f);
  float _224 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_203 * _146) + (frame_consts.paper_xf[3].x)) * _196), (((_203 * _147) + (frame_consts.paper_xf[3].y)) * _196)), 0.0f);
  float _233 = ((((1.0f - (((1.0f - _158) * _151) * _215.x)) - ((_158 * _151) * _218.x)) - (((1.0f - _190) * frame_consts.game_plane_blend.y) * _221.x)) - ((_190 * frame_consts.game_plane_blend.y) * _224.x)) * frame_consts.paper_mult;
  float _260 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_25 + -0.5f)) * ((((_15 / _16) + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _261 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_26 + -0.5f))) * 5.0f);
  float _274 = 1.0f - ((1.0f - exp2(log2(saturate(1.0f - dot(float2(_260, _261), float2(_260, _261)))) * 6.0f)) * 0.8500000238418579f);
  SV_Target.x = ((_274 * ((_101 - (_233 * _101)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x);
  SV_Target.y = ((_274 * ((_102 - (_233 * _102)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y);
  SV_Target.z = ((_274 * ((_103 - (_233 * _103)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z);

  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_27.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
