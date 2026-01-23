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
  float3 _31 = bloom_tex.SampleLevel(sampler_bilinear, float2(_25, _26), 0.0f);
  float _46 = max((((1.0f - (_27.y * 0.7152000069618225f)) - (_27.x * 0.2125999927520752f)) - (_27.z * 0.0722000002861023f)), 0.0010000000474974513f);
  float _50 = (_27.x / _46) + (frame_consts.params.bloom.intensity * _31.x);
  float _51 = (_27.y / _46) + (frame_consts.params.bloom.intensity * _31.y);
  float _52 = (_27.z / _46) + (frame_consts.params.bloom.intensity * _31.z);
  float _58 = (((_50 * 0.2125999927520752f) + 1.0f) + (_51 * 0.7152000069618225f)) + (_52 * 0.0722000002861023f);
  float _62 = saturate(_50 / _58);
  float _63 = saturate(_51 / _58);
  float _64 = saturate(_52 / _58);
  float _70 = depth_tex.SampleLevel(sampler_nearest, float2(_25, _26), 0.0f);
  float _74 = 10000.0f / ((_70.x * 19999.5f) + 0.5f);
  float _79 = (_74 * ((_25 * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _81 = (_74 * (((1.0f - _26) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _82 = -0.0f - _74;
  float _106 = mad((frame_consts.paper_xf[2].z), _82, mad((frame_consts.paper_xf[1].z), _81, (_79 * (frame_consts.paper_xf[0].z))));
  float _107 = mad((frame_consts.paper_xf[2].x), _82, mad((frame_consts.paper_xf[1].x), _81, (_79 * (frame_consts.paper_xf[0].x)))) / _106;
  float _108 = mad((frame_consts.paper_xf[2].y), _82, mad((frame_consts.paper_xf[1].y), _81, (_79 * (frame_consts.paper_xf[0].y)))) / _106;
  float _120 = exp2(round(log2(max(5.0f, (-0.0f - (_106 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _122 = min((1.0f / _120), 0.20000000298023224f);
  float _123 = frame_consts.game_plane_blend.x - _120;
  float _130 = frame_consts.game_plane_blend.x + 10.0f;
  float _138 = exp2(round(log2(max(5.0f, (-0.0f - (_106 - _130)))) * 10.0f) * 0.10000000149011612f);
  float _140 = min((1.0f / _138), 0.20000000298023224f);
  float _141 = _130 - _138;
  float _148 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_123 * _107) + (frame_consts.paper_xf[3].x)) * _122), (((_123 * _108) + (frame_consts.paper_xf[3].y)) * _122)), 0.0f);
  float _151 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_141 * _107) + (frame_consts.paper_xf[3].x)) * _140), (((_141 * _108) + (frame_consts.paper_xf[3].y)) * _140)), 0.0f);
  float _158 = ((1.0f - (_148.x * (1.0f - frame_consts.game_plane_blend.y))) - (_151.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _173 = _15 / _16;
  float _185 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_25 + -0.5f)) * (((_173 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _186 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_26 + -0.5f))) * 5.0f);
  float _192 = exp2(log2(saturate(1.0f - dot(float2(_185, _186), float2(_185, _186)))) * 6.0f);
  float _197 = 1.0f - _192;
  float _199 = 1.0f - (_197 * 0.8500000238418579f);
  float _206 = (_199 * ((_62 - (_158 * _62)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _207 = (_199 * ((_63 - (_158 * _63)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _208 = (_199 * ((_64 - (_158 * _64)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _212 = ((_192 * 1.2000000476837158f) * _197) * frame_consts.params.vignette.golden_intensity;
  float _420;
  float _421;
  float _422;
  if (_212 > 0.0020000000949949026f) {
    float _217 = _25 * _15;
    float _218 = _26 * _16;
    float _219 = _218 + _217;
    float _225 = frac(_219 * 0.0033333334140479565f) + -0.5f;
    float _226 = frac((_218 - _217) * 0.0033333334140479565f) + -0.5f;
    float _232 = saturate(sqrt((_226 * _226) + (_225 * _225)) * 2.0f);
    float _243 = saturate((sin((_219 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _248 = ((_243 * _243) * 0.2199999988079071f) * (3.0f - (_243 * 2.0f));
    float _249 = _248 + 0.9777389168739319f;
    float _250 = ((_232 * 0.13274884223937988f) + 0.7175776362419128f) + _248;
    float _251 = ((_232 * 0.3335757553577423f) + 0.30871906876564026f) + _248;
    float _256 = (_25 * 1080.0f) * _173;
    float _257 = _26 * 1080.0f;
    float _258 = _256 * 0.04444444552063942f;
    float _259 = _26 * 27.712812423706055f;
    float _261 = ceil(_258 - _259);
    float _264 = floor(_26 * 55.42562484741211f) + 1.0f;
    float _267 = ceil((-0.0f - _259) - _258);
    float _269 = (_264 + _261) + _267;
    float _271 = (_269 * 22.5f) + -33.75f;
    float _273 = (_261 - _267) * 11.25f;
    float _279 = (((_264 * 0.5773502588272095f) - (_261 * 0.28867512941360474f)) - (_267 * 0.28867512941360474f)) * 22.5f;
    float _282 = _271 + _273;
    float _283 = _279 + (19.485570907592773f - (_269 * 12.990381240844727f));
    float _286 = ((_269 * 25.980762481689453f) + -38.97114181518555f) + _279;
    float _287 = _273 - _271;
    float _288 = _282 - _256;
    float _289 = _283 - _257;
    float _292 = _273 - _256;
    float _293 = _286 - _257;
    float _298 = _289 * _289;
    float _305 = _287 - _256;
    float _309 = frame_consts.time * 0.30000001192092896f;
    float _310 = _283 * 0.4000000059604645f;
    float _319 = sin(((_283 * 0.04444444552063942f) + _309) * 2.0f);
    float _324 = saturate((sqrt(_319 * cos((((_310 + _282) * 0.04444444552063942f) + _309) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _328 = (_324 * _324) * (3.0f - (_324 * 2.0f));
    float _330 = (_328 * 0.6499999761581421f) + 0.3499999940395355f;
    float _345 = saturate((sqrt(sin(((_286 * 0.04444444552063942f) + _309) * 2.0f) * cos(((((_286 * 0.4000000059604645f) + _273) * 0.04444444552063942f) + _309) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _349 = (_345 * _345) * (3.0f - (_345 * 2.0f));
    float _351 = (_349 * 0.6499999761581421f) + 0.3499999940395355f;
    float _361 = saturate((sqrt(cos((((_310 + _287) * 0.04444444552063942f) + _309) * 2.0f) * _319) * 2.0f) + 0.20000004768371582f);
    float _365 = (_361 * _361) * (3.0f - (_361 * 2.0f));
    float _367 = (_365 * 0.6499999761581421f) + 0.3499999940395355f;
    float _389 = saturate(_330);
    float _390 = saturate(_351);
    float _409 = ((((saturate(11.0f - (sqrt((_293 * _293) + (_292 * _292)) / ((_349 * 0.039000000804662704f) + 0.08100000768899918f))) * _351) + (saturate(11.0f - (sqrt((_288 * _288) + _298) / ((_328 * 0.039000000804662704f) + 0.08100000768899918f))) * _330)) + (saturate(11.0f - (sqrt((_305 * _305) + _298) / ((_365 * 0.039000000804662704f) + 0.08100000768899918f))) * _367)) + (((((saturate(1.0f - (abs(_289) * 0.8333333134651184f)) * _389) + (saturate(1.0f - (abs(dot(float2(_292, _293), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _390)) * saturate(_367)) + ((_389 * saturate(1.0f - (abs(dot(float2(_288, _289), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _390)) * 0.5f)) * _212;
    _420 = ((_409 * ((_249 * _249) - _206)) + _206);
    _421 = ((_409 * ((_250 * _250) - _207)) + _207);
    _422 = ((_409 * ((_251 * _251) - _208)) + _208);
  } else {
    _420 = _206;
    _421 = _207;
    _422 = _208;
  }
  SV_Target.x = _420;
  SV_Target.y = _421;
  SV_Target.z = _422;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_27.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
