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

cbuffer frame_consts : register(b0) {
  Frame_constants frame_consts : packoffset(c000.x);
};

SamplerState sampler_nearest : register(s0);

SamplerState sampler_bilinear_wrap : register(s1);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 O_Uv : O_Uv
) : SV_Target {
  float4 SV_Target;
  float _13 = float((int)(frame_consts.vp_dim.x));
  float _14 = float((int)(frame_consts.vp_dim.y));
  float2 _15 = distortion.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _18 = _14 / _13;
  float _23 = saturate((_15.x * _18) + O_Uv.x);
  float _24 = saturate((_15.y * _18) + O_Uv.y);
  float4 _25 = tex.SampleLevel(sampler_nearest, float2(_23, _24), 0.0f);
  float3 untonemapped = _25.rgb;
  float _34 = depth_tex.SampleLevel(sampler_nearest, float2(_23, _24), 0.0f);
  float _38 = 10000.0f / ((_34.x * 19999.5f) + 0.5f);
  float _43 = (_38 * ((_23 * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _45 = (_38 * (((1.0f - _24) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _46 = -0.0f - _38;
  float _70 = mad((frame_consts.paper_xf[2].z), _46, mad((frame_consts.paper_xf[1].z), _45, (_43 * (frame_consts.paper_xf[0].z))));
  float _71 = mad((frame_consts.paper_xf[2].x), _46, mad((frame_consts.paper_xf[1].x), _45, (_43 * (frame_consts.paper_xf[0].x)))) / _70;
  float _72 = mad((frame_consts.paper_xf[2].y), _46, mad((frame_consts.paper_xf[1].y), _45, (_43 * (frame_consts.paper_xf[0].y)))) / _70;
  float _79 = log2(max(5.0f, (-0.0f - (_70 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _80 = floor(_79);
  float _81 = _79 - _80;
  float _83 = exp2(_80 * 0.10000000149011612f);
  float _84 = 1.0f / _83;
  float _85 = min(_84, 0.20000000298023224f);
  float _87 = min((_84 * 0.9330329895019531f), 0.20000000298023224f);
  float _88 = frame_consts.game_plane_blend.x - _83;
  float _94 = frame_consts.game_plane_blend.x - (_83 * 1.0717734098434448f);
  float _104 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_88 * _71) + (frame_consts.paper_xf[3].x)) * _85), (((_88 * _72) + (frame_consts.paper_xf[3].y)) * _85)), 0.0f);
  float _107 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_94 * _71) + (frame_consts.paper_xf[3].x)) * _87), (((_94 * _72) + (frame_consts.paper_xf[3].y)) * _87)), 0.0f);
  float _114 = ((1.0f - (_104.x * (1.0f - _81))) - (_107.x * _81)) * frame_consts.paper_mult;
  float _141 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_23 + -0.5f)) * ((((_13 / _14) + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _142 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_24 + -0.5f))) * 5.0f);
  float _155 = 1.0f - ((1.0f - exp2(log2(saturate(1.0f - dot(float2(_141, _142), float2(_141, _142)))) * 6.0f)) * 0.8500000238418579f);
  SV_Target.x = ((_155 * ((_25.x - (_114 * _25.x)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x);
  SV_Target.y = ((_155 * ((_25.y - (_114 * _25.y)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y);
  SV_Target.z = ((_155 * ((_25.z - (_114 * _25.z)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z);
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(untonemapped.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);
  SV_Target.w = 1.0f;
  return SV_Target;
}
