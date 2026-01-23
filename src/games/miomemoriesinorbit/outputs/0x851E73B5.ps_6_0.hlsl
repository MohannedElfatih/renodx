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
  float4 _16 = tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float3 _20 = bloom_tex.SampleLevel(sampler_bilinear, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _35 = max((((1.0f - (_16.y * 0.7152000069618225f)) - (_16.x * 0.2125999927520752f)) - (_16.z * 0.0722000002861023f)), 0.0010000000474974513f);
  float _39 = (_16.x / _35) + (frame_consts.params.bloom.intensity * _20.x);
  float _40 = (_16.y / _35) + (frame_consts.params.bloom.intensity * _20.y);
  float _41 = (_16.z / _35) + (frame_consts.params.bloom.intensity * _20.z);
  float _47 = (((_39 * 0.2125999927520752f) + 1.0f) + (_40 * 0.7152000069618225f)) + (_41 * 0.0722000002861023f);
  float _51 = saturate(_39 / _47);
  float _52 = saturate(_40 / _47);
  float _53 = saturate(_41 / _47);
  float _59 = depth_tex.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _63 = 10000.0f / ((_59.x * 19999.5f) + 0.5f);
  float _68 = (_63 * ((O_Uv.x * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _70 = (_63 * (((1.0f - O_Uv.y) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _71 = -0.0f - _63;
  float _95 = mad((frame_consts.paper_xf[2].z), _71, mad((frame_consts.paper_xf[1].z), _70, (_68 * (frame_consts.paper_xf[0].z))));
  float _96 = mad((frame_consts.paper_xf[2].x), _71, mad((frame_consts.paper_xf[1].x), _70, (_68 * (frame_consts.paper_xf[0].x)))) / _95;
  float _97 = mad((frame_consts.paper_xf[2].y), _71, mad((frame_consts.paper_xf[1].y), _70, (_68 * (frame_consts.paper_xf[0].y)))) / _95;
  float _104 = log2(max(5.0f, (-0.0f - (_95 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _105 = floor(_104);
  float _106 = _104 - _105;
  float _108 = exp2(_105 * 0.10000000149011612f);
  float _109 = 1.0f / _108;
  float _110 = min(_109, 0.20000000298023224f);
  float _112 = min((_109 * 0.9330329895019531f), 0.20000000298023224f);
  float _113 = frame_consts.game_plane_blend.x - _108;
  float _119 = frame_consts.game_plane_blend.x - (_108 * 1.0717734098434448f);
  float _129 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_113 * _96) + (frame_consts.paper_xf[3].x)) * _110), (((_113 * _97) + (frame_consts.paper_xf[3].y)) * _110)), 0.0f);
  float _132 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_119 * _96) + (frame_consts.paper_xf[3].x)) * _112), (((_119 * _97) + (frame_consts.paper_xf[3].y)) * _112)), 0.0f);
  float _139 = ((1.0f - (_129.x * (1.0f - _106))) - (_132.x * _106)) * frame_consts.paper_mult;
  float _166 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(O_Uv.x + -0.5f)) * ((((float((int)(frame_consts.vp_dim.x)) / float((int)(frame_consts.vp_dim.y))) + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _167 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _180 = 1.0f - ((1.0f - exp2(log2(saturate(1.0f - dot(float2(_166, _167), float2(_166, _167)))) * 6.0f)) * 0.8500000238418579f);
  SV_Target.x = ((_180 * ((_51 - (_139 * _51)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x);
  SV_Target.y = ((_180 * ((_52 - (_139 * _52)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y);
  SV_Target.z = ((_180 * ((_53 - (_139 * _53)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z);
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_16.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
