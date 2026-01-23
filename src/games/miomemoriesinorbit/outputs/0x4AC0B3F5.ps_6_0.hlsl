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
  float _118 = exp2(round(log2(max(5.0f, (-0.0f - (_106 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _120 = min((1.0f / _118), 0.20000000298023224f);
  float _121 = frame_consts.game_plane_blend.x - _118;
  float _128 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_121 * (mad((frame_consts.paper_xf[2].x), _82, mad((frame_consts.paper_xf[1].x), _81, (_79 * (frame_consts.paper_xf[0].x)))) / _106)) + (frame_consts.paper_xf[3].x)) * _120), (((_121 * (mad((frame_consts.paper_xf[2].y), _82, mad((frame_consts.paper_xf[1].y), _81, (_79 * (frame_consts.paper_xf[0].y)))) / _106)) + (frame_consts.paper_xf[3].y)) * _120)), 0.0f);
  float _133 = (1.0f - _128.x) * frame_consts.paper_mult;
  float _148 = _15 / _16;
  float _160 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_25 + -0.5f)) * (((_148 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _161 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_26 + -0.5f))) * 5.0f);
  float _167 = exp2(log2(saturate(1.0f - dot(float2(_160, _161), float2(_160, _161)))) * 6.0f);
  float _172 = 1.0f - _167;
  float _174 = 1.0f - (_172 * 0.8500000238418579f);
  float _181 = (_174 * ((_62 - (_133 * _62)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _182 = (_174 * ((_63 - (_133 * _63)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _183 = (_174 * ((_64 - (_133 * _64)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _187 = ((_167 * 1.2000000476837158f) * _172) * frame_consts.params.vignette.golden_intensity;
  float _395;
  float _396;
  float _397;
  if (_187 > 0.0020000000949949026f) {
    float _192 = _25 * _15;
    float _193 = _26 * _16;
    float _194 = _193 + _192;
    float _200 = frac(_194 * 0.0033333334140479565f) + -0.5f;
    float _201 = frac((_193 - _192) * 0.0033333334140479565f) + -0.5f;
    float _207 = saturate(sqrt((_201 * _201) + (_200 * _200)) * 2.0f);
    float _218 = saturate((sin((_194 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _223 = ((_218 * _218) * 0.2199999988079071f) * (3.0f - (_218 * 2.0f));
    float _224 = _223 + 0.9777389168739319f;
    float _225 = ((_207 * 0.13274884223937988f) + 0.7175776362419128f) + _223;
    float _226 = ((_207 * 0.3335757553577423f) + 0.30871906876564026f) + _223;
    float _231 = (_25 * 1080.0f) * _148;
    float _232 = _26 * 1080.0f;
    float _233 = _231 * 0.04444444552063942f;
    float _234 = _26 * 27.712812423706055f;
    float _236 = ceil(_233 - _234);
    float _239 = floor(_26 * 55.42562484741211f) + 1.0f;
    float _242 = ceil((-0.0f - _234) - _233);
    float _244 = (_239 + _236) + _242;
    float _246 = (_244 * 22.5f) + -33.75f;
    float _248 = (_236 - _242) * 11.25f;
    float _254 = (((_239 * 0.5773502588272095f) - (_236 * 0.28867512941360474f)) - (_242 * 0.28867512941360474f)) * 22.5f;
    float _257 = _246 + _248;
    float _258 = _254 + (19.485570907592773f - (_244 * 12.990381240844727f));
    float _261 = ((_244 * 25.980762481689453f) + -38.97114181518555f) + _254;
    float _262 = _248 - _246;
    float _263 = _257 - _231;
    float _264 = _258 - _232;
    float _267 = _248 - _231;
    float _268 = _261 - _232;
    float _273 = _264 * _264;
    float _280 = _262 - _231;
    float _284 = frame_consts.time * 0.30000001192092896f;
    float _285 = _258 * 0.4000000059604645f;
    float _294 = sin(((_258 * 0.04444444552063942f) + _284) * 2.0f);
    float _299 = saturate((sqrt(_294 * cos((((_285 + _257) * 0.04444444552063942f) + _284) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _303 = (_299 * _299) * (3.0f - (_299 * 2.0f));
    float _305 = (_303 * 0.6499999761581421f) + 0.3499999940395355f;
    float _320 = saturate((sqrt(sin(((_261 * 0.04444444552063942f) + _284) * 2.0f) * cos(((((_261 * 0.4000000059604645f) + _248) * 0.04444444552063942f) + _284) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _324 = (_320 * _320) * (3.0f - (_320 * 2.0f));
    float _326 = (_324 * 0.6499999761581421f) + 0.3499999940395355f;
    float _336 = saturate((sqrt(cos((((_285 + _262) * 0.04444444552063942f) + _284) * 2.0f) * _294) * 2.0f) + 0.20000004768371582f);
    float _340 = (_336 * _336) * (3.0f - (_336 * 2.0f));
    float _342 = (_340 * 0.6499999761581421f) + 0.3499999940395355f;
    float _364 = saturate(_305);
    float _365 = saturate(_326);
    float _384 = ((((saturate(11.0f - (sqrt((_268 * _268) + (_267 * _267)) / ((_324 * 0.039000000804662704f) + 0.08100000768899918f))) * _326) + (saturate(11.0f - (sqrt((_263 * _263) + _273) / ((_303 * 0.039000000804662704f) + 0.08100000768899918f))) * _305)) + (saturate(11.0f - (sqrt((_280 * _280) + _273) / ((_340 * 0.039000000804662704f) + 0.08100000768899918f))) * _342)) + (((((saturate(1.0f - (abs(_264) * 0.8333333134651184f)) * _364) + (saturate(1.0f - (abs(dot(float2(_267, _268), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _365)) * saturate(_342)) + ((_364 * saturate(1.0f - (abs(dot(float2(_263, _264), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _365)) * 0.5f)) * _187;
    _395 = ((_384 * ((_224 * _224) - _181)) + _181);
    _396 = ((_384 * ((_225 * _225) - _182)) + _182);
    _397 = ((_384 * ((_226 * _226) - _183)) + _183);
  } else {
    _395 = _181;
    _396 = _182;
    _397 = _183;
  }
  SV_Target.x = _395;
  SV_Target.y = _396;
  SV_Target.z = _397;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_27.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
