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
  float _112 = 1.0f - frame_consts.game_plane_blend.y;
  float _117 = log2(max(5.0f, (-0.0f - (_106 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _118 = floor(_117);
  float _119 = _117 - _118;
  float _121 = exp2(_118 * 0.10000000149011612f);
  float _122 = 1.0f / _121;
  float _123 = min(_122, 0.20000000298023224f);
  float _125 = min((_122 * 0.9330329895019531f), 0.20000000298023224f);
  float _126 = frame_consts.game_plane_blend.x - _121;
  float _132 = frame_consts.game_plane_blend.x - (_121 * 1.0717734098434448f);
  float _144 = frame_consts.game_plane_blend.x + 10.0f;
  float _149 = log2(max(5.0f, (-0.0f - (_106 - _144)))) * 10.0f;
  float _150 = floor(_149);
  float _151 = _149 - _150;
  float _153 = exp2(_150 * 0.10000000149011612f);
  float _154 = 1.0f / _153;
  float _155 = min(_154, 0.20000000298023224f);
  float _157 = min((_154 * 0.9330329895019531f), 0.20000000298023224f);
  float _158 = _144 - _153;
  float _164 = _144 - (_153 * 1.0717734098434448f);
  float _176 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_126 * _107) + (frame_consts.paper_xf[3].x)) * _123), (((_126 * _108) + (frame_consts.paper_xf[3].y)) * _123)), 0.0f);
  float _179 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_132 * _107) + (frame_consts.paper_xf[3].x)) * _125), (((_132 * _108) + (frame_consts.paper_xf[3].y)) * _125)), 0.0f);
  float _182 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_158 * _107) + (frame_consts.paper_xf[3].x)) * _155), (((_158 * _108) + (frame_consts.paper_xf[3].y)) * _155)), 0.0f);
  float _185 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_164 * _107) + (frame_consts.paper_xf[3].x)) * _157), (((_164 * _108) + (frame_consts.paper_xf[3].y)) * _157)), 0.0f);
  float _194 = ((((1.0f - (((1.0f - _119) * _112) * _176.x)) - ((_119 * _112) * _179.x)) - (((1.0f - _151) * frame_consts.game_plane_blend.y) * _182.x)) - ((_151 * frame_consts.game_plane_blend.y) * _185.x)) * frame_consts.paper_mult;
  float _209 = _15 / _16;
  float _221 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_25 + -0.5f)) * (((_209 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _222 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_26 + -0.5f))) * 5.0f);
  float _228 = exp2(log2(saturate(1.0f - dot(float2(_221, _222), float2(_221, _222)))) * 6.0f);
  float _233 = 1.0f - _228;
  float _235 = 1.0f - (_233 * 0.8500000238418579f);
  float _242 = (_235 * ((_62 - (_194 * _62)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _243 = (_235 * ((_63 - (_194 * _63)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _244 = (_235 * ((_64 - (_194 * _64)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _248 = ((_228 * 1.2000000476837158f) * _233) * frame_consts.params.vignette.golden_intensity;
  float _456;
  float _457;
  float _458;
  if (_248 > 0.0020000000949949026f) {
    float _253 = _25 * _15;
    float _254 = _26 * _16;
    float _255 = _254 + _253;
    float _261 = frac(_255 * 0.0033333334140479565f) + -0.5f;
    float _262 = frac((_254 - _253) * 0.0033333334140479565f) + -0.5f;
    float _268 = saturate(sqrt((_262 * _262) + (_261 * _261)) * 2.0f);
    float _279 = saturate((sin((_255 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _284 = ((_279 * _279) * 0.2199999988079071f) * (3.0f - (_279 * 2.0f));
    float _285 = _284 + 0.9777389168739319f;
    float _286 = ((_268 * 0.13274884223937988f) + 0.7175776362419128f) + _284;
    float _287 = ((_268 * 0.3335757553577423f) + 0.30871906876564026f) + _284;
    float _292 = (_25 * 1080.0f) * _209;
    float _293 = _26 * 1080.0f;
    float _294 = _292 * 0.04444444552063942f;
    float _295 = _26 * 27.712812423706055f;
    float _297 = ceil(_294 - _295);
    float _300 = floor(_26 * 55.42562484741211f) + 1.0f;
    float _303 = ceil((-0.0f - _295) - _294);
    float _305 = (_300 + _297) + _303;
    float _307 = (_305 * 22.5f) + -33.75f;
    float _309 = (_297 - _303) * 11.25f;
    float _315 = (((_300 * 0.5773502588272095f) - (_297 * 0.28867512941360474f)) - (_303 * 0.28867512941360474f)) * 22.5f;
    float _318 = _307 + _309;
    float _319 = _315 + (19.485570907592773f - (_305 * 12.990381240844727f));
    float _322 = ((_305 * 25.980762481689453f) + -38.97114181518555f) + _315;
    float _323 = _309 - _307;
    float _324 = _318 - _292;
    float _325 = _319 - _293;
    float _328 = _309 - _292;
    float _329 = _322 - _293;
    float _334 = _325 * _325;
    float _341 = _323 - _292;
    float _345 = frame_consts.time * 0.30000001192092896f;
    float _346 = _319 * 0.4000000059604645f;
    float _355 = sin(((_319 * 0.04444444552063942f) + _345) * 2.0f);
    float _360 = saturate((sqrt(_355 * cos((((_346 + _318) * 0.04444444552063942f) + _345) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _364 = (_360 * _360) * (3.0f - (_360 * 2.0f));
    float _366 = (_364 * 0.6499999761581421f) + 0.3499999940395355f;
    float _381 = saturate((sqrt(sin(((_322 * 0.04444444552063942f) + _345) * 2.0f) * cos(((((_322 * 0.4000000059604645f) + _309) * 0.04444444552063942f) + _345) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _385 = (_381 * _381) * (3.0f - (_381 * 2.0f));
    float _387 = (_385 * 0.6499999761581421f) + 0.3499999940395355f;
    float _397 = saturate((sqrt(cos((((_346 + _323) * 0.04444444552063942f) + _345) * 2.0f) * _355) * 2.0f) + 0.20000004768371582f);
    float _401 = (_397 * _397) * (3.0f - (_397 * 2.0f));
    float _403 = (_401 * 0.6499999761581421f) + 0.3499999940395355f;
    float _425 = saturate(_366);
    float _426 = saturate(_387);
    float _445 = ((((saturate(11.0f - (sqrt((_329 * _329) + (_328 * _328)) / ((_385 * 0.039000000804662704f) + 0.08100000768899918f))) * _387) + (saturate(11.0f - (sqrt((_324 * _324) + _334) / ((_364 * 0.039000000804662704f) + 0.08100000768899918f))) * _366)) + (saturate(11.0f - (sqrt((_341 * _341) + _334) / ((_401 * 0.039000000804662704f) + 0.08100000768899918f))) * _403)) + (((((saturate(1.0f - (abs(_325) * 0.8333333134651184f)) * _425) + (saturate(1.0f - (abs(dot(float2(_328, _329), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _426)) * saturate(_403)) + ((_425 * saturate(1.0f - (abs(dot(float2(_324, _325), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _426)) * 0.5f)) * _248;
    _456 = ((_445 * ((_285 * _285) - _242)) + _242);
    _457 = ((_445 * ((_286 * _286) - _243)) + _243);
    _458 = ((_445 * ((_287 * _287) - _244)) + _244);
  } else {
    _456 = _242;
    _457 = _243;
    _458 = _244;
  }
  SV_Target.x = _456;
  SV_Target.y = _457;
  SV_Target.z = _458;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_27.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
