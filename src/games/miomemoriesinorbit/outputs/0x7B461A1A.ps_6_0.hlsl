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
  float _115 = log2(max(5.0f, (-0.0f - (_106 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _116 = floor(_115);
  float _117 = _115 - _116;
  float _119 = exp2(_116 * 0.10000000149011612f);
  float _120 = 1.0f / _119;
  float _121 = min(_120, 0.20000000298023224f);
  float _123 = min((_120 * 0.9330329895019531f), 0.20000000298023224f);
  float _124 = frame_consts.game_plane_blend.x - _119;
  float _130 = frame_consts.game_plane_blend.x - (_119 * 1.0717734098434448f);
  float _140 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_124 * _107) + (frame_consts.paper_xf[3].x)) * _121), (((_124 * _108) + (frame_consts.paper_xf[3].y)) * _121)), 0.0f);
  float _143 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_130 * _107) + (frame_consts.paper_xf[3].x)) * _123), (((_130 * _108) + (frame_consts.paper_xf[3].y)) * _123)), 0.0f);
  float _150 = ((1.0f - (_140.x * (1.0f - _117))) - (_143.x * _117)) * frame_consts.paper_mult;
  float _165 = _15 / _16;
  float _177 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_25 + -0.5f)) * (((_165 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _178 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_26 + -0.5f))) * 5.0f);
  float _184 = exp2(log2(saturate(1.0f - dot(float2(_177, _178), float2(_177, _178)))) * 6.0f);
  float _189 = 1.0f - _184;
  float _191 = 1.0f - (_189 * 0.8500000238418579f);
  float _198 = (_191 * ((_62 - (_150 * _62)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _199 = (_191 * ((_63 - (_150 * _63)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _200 = (_191 * ((_64 - (_150 * _64)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _204 = ((_184 * 1.2000000476837158f) * _189) * frame_consts.params.vignette.golden_intensity;
  float _412;
  float _413;
  float _414;
  if (_204 > 0.0020000000949949026f) {
    float _209 = _25 * _15;
    float _210 = _26 * _16;
    float _211 = _210 + _209;
    float _217 = frac(_211 * 0.0033333334140479565f) + -0.5f;
    float _218 = frac((_210 - _209) * 0.0033333334140479565f) + -0.5f;
    float _224 = saturate(sqrt((_218 * _218) + (_217 * _217)) * 2.0f);
    float _235 = saturate((sin((_211 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _240 = ((_235 * _235) * 0.2199999988079071f) * (3.0f - (_235 * 2.0f));
    float _241 = _240 + 0.9777389168739319f;
    float _242 = ((_224 * 0.13274884223937988f) + 0.7175776362419128f) + _240;
    float _243 = ((_224 * 0.3335757553577423f) + 0.30871906876564026f) + _240;
    float _248 = (_25 * 1080.0f) * _165;
    float _249 = _26 * 1080.0f;
    float _250 = _248 * 0.04444444552063942f;
    float _251 = _26 * 27.712812423706055f;
    float _253 = ceil(_250 - _251);
    float _256 = floor(_26 * 55.42562484741211f) + 1.0f;
    float _259 = ceil((-0.0f - _251) - _250);
    float _261 = (_256 + _253) + _259;
    float _263 = (_261 * 22.5f) + -33.75f;
    float _265 = (_253 - _259) * 11.25f;
    float _271 = (((_256 * 0.5773502588272095f) - (_253 * 0.28867512941360474f)) - (_259 * 0.28867512941360474f)) * 22.5f;
    float _274 = _263 + _265;
    float _275 = _271 + (19.485570907592773f - (_261 * 12.990381240844727f));
    float _278 = ((_261 * 25.980762481689453f) + -38.97114181518555f) + _271;
    float _279 = _265 - _263;
    float _280 = _274 - _248;
    float _281 = _275 - _249;
    float _284 = _265 - _248;
    float _285 = _278 - _249;
    float _290 = _281 * _281;
    float _297 = _279 - _248;
    float _301 = frame_consts.time * 0.30000001192092896f;
    float _302 = _275 * 0.4000000059604645f;
    float _311 = sin(((_275 * 0.04444444552063942f) + _301) * 2.0f);
    float _316 = saturate((sqrt(_311 * cos((((_302 + _274) * 0.04444444552063942f) + _301) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _320 = (_316 * _316) * (3.0f - (_316 * 2.0f));
    float _322 = (_320 * 0.6499999761581421f) + 0.3499999940395355f;
    float _337 = saturate((sqrt(sin(((_278 * 0.04444444552063942f) + _301) * 2.0f) * cos(((((_278 * 0.4000000059604645f) + _265) * 0.04444444552063942f) + _301) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _341 = (_337 * _337) * (3.0f - (_337 * 2.0f));
    float _343 = (_341 * 0.6499999761581421f) + 0.3499999940395355f;
    float _353 = saturate((sqrt(cos((((_302 + _279) * 0.04444444552063942f) + _301) * 2.0f) * _311) * 2.0f) + 0.20000004768371582f);
    float _357 = (_353 * _353) * (3.0f - (_353 * 2.0f));
    float _359 = (_357 * 0.6499999761581421f) + 0.3499999940395355f;
    float _381 = saturate(_322);
    float _382 = saturate(_343);
    float _401 = ((((saturate(11.0f - (sqrt((_285 * _285) + (_284 * _284)) / ((_341 * 0.039000000804662704f) + 0.08100000768899918f))) * _343) + (saturate(11.0f - (sqrt((_280 * _280) + _290) / ((_320 * 0.039000000804662704f) + 0.08100000768899918f))) * _322)) + (saturate(11.0f - (sqrt((_297 * _297) + _290) / ((_357 * 0.039000000804662704f) + 0.08100000768899918f))) * _359)) + (((((saturate(1.0f - (abs(_281) * 0.8333333134651184f)) * _381) + (saturate(1.0f - (abs(dot(float2(_284, _285), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _382)) * saturate(_359)) + ((_381 * saturate(1.0f - (abs(dot(float2(_280, _281), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _382)) * 0.5f)) * _204;
    _412 = ((_401 * ((_241 * _241) - _198)) + _198);
    _413 = ((_401 * ((_242 * _242) - _199)) + _199);
    _414 = ((_401 * ((_243 * _243) - _200)) + _200);
  } else {
    _412 = _198;
    _413 = _199;
    _414 = _200;
  }
  SV_Target.x = _412;
  SV_Target.y = _413;
  SV_Target.z = _414;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_27.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
