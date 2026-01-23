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
  float _458;
  float _459;
  float _460;
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
  float _181 = exp2(round(log2(max(5.0f, (-0.0f - (_169 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _183 = min((1.0f / _181), 0.20000000298023224f);
  float _184 = frame_consts.game_plane_blend.x - _181;
  float _191 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_184 * (mad((frame_consts.paper_xf[2].x), _145, mad((frame_consts.paper_xf[1].x), _144, (_142 * (frame_consts.paper_xf[0].x)))) / _169)) + (frame_consts.paper_xf[3].x)) * _183), (((_184 * (mad((frame_consts.paper_xf[2].y), _145, mad((frame_consts.paper_xf[1].y), _144, (_142 * (frame_consts.paper_xf[0].y)))) / _169)) + (frame_consts.paper_xf[3].y)) * _183)), 0.0f);
  float _196 = (1.0f - _191.x) * frame_consts.paper_mult;
  float _211 = _15 / _16;
  float _223 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(O_Uv.x + -0.5f)) * (((_211 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _224 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _230 = exp2(log2(saturate(1.0f - dot(float2(_223, _224), float2(_223, _224)))) * 6.0f);
  float _235 = 1.0f - _230;
  float _237 = 1.0f - (_235 * 0.8500000238418579f);
  float _244 = (_237 * ((_125 - (_196 * _125)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _245 = (_237 * ((_126 - (_196 * _126)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _246 = (_237 * ((_127 - (_196 * _127)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _250 = ((_230 * 1.2000000476837158f) * _235) * frame_consts.params.vignette.golden_intensity;
  if (_250 > 0.0020000000949949026f) {
    float _255 = _15 * O_Uv.x;
    float _256 = _16 * O_Uv.y;
    float _257 = _255 + _256;
    float _263 = frac(_257 * 0.0033333334140479565f) + -0.5f;
    float _264 = frac((_256 - _255) * 0.0033333334140479565f) + -0.5f;
    float _270 = saturate(sqrt((_264 * _264) + (_263 * _263)) * 2.0f);
    float _281 = saturate((sin((_257 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _286 = ((_281 * _281) * 0.2199999988079071f) * (3.0f - (_281 * 2.0f));
    float _287 = _286 + 0.9777389168739319f;
    float _288 = ((_270 * 0.13274884223937988f) + 0.7175776362419128f) + _286;
    float _289 = ((_270 * 0.3335757553577423f) + 0.30871906876564026f) + _286;
    float _294 = (O_Uv.x * 1080.0f) * _211;
    float _295 = O_Uv.y * 1080.0f;
    float _296 = _294 * 0.04444444552063942f;
    float _297 = O_Uv.y * 27.712812423706055f;
    float _299 = ceil(_296 - _297);
    float _302 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _305 = ceil((-0.0f - _297) - _296);
    float _307 = (_302 + _299) + _305;
    float _309 = (_307 * 22.5f) + -33.75f;
    float _311 = (_299 - _305) * 11.25f;
    float _317 = (((_302 * 0.5773502588272095f) - (_299 * 0.28867512941360474f)) - (_305 * 0.28867512941360474f)) * 22.5f;
    float _320 = _309 + _311;
    float _321 = _317 + (19.485570907592773f - (_307 * 12.990381240844727f));
    float _324 = ((_307 * 25.980762481689453f) + -38.97114181518555f) + _317;
    float _325 = _311 - _309;
    float _326 = _320 - _294;
    float _327 = _321 - _295;
    float _330 = _311 - _294;
    float _331 = _324 - _295;
    float _336 = _327 * _327;
    float _343 = _325 - _294;
    float _347 = frame_consts.time * 0.30000001192092896f;
    float _348 = _321 * 0.4000000059604645f;
    float _357 = sin(((_321 * 0.04444444552063942f) + _347) * 2.0f);
    float _362 = saturate((sqrt(_357 * cos((((_348 + _320) * 0.04444444552063942f) + _347) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _366 = (_362 * _362) * (3.0f - (_362 * 2.0f));
    float _368 = (_366 * 0.6499999761581421f) + 0.3499999940395355f;
    float _383 = saturate((sqrt(sin(((_324 * 0.04444444552063942f) + _347) * 2.0f) * cos(((((_324 * 0.4000000059604645f) + _311) * 0.04444444552063942f) + _347) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _387 = (_383 * _383) * (3.0f - (_383 * 2.0f));
    float _389 = (_387 * 0.6499999761581421f) + 0.3499999940395355f;
    float _399 = saturate((sqrt(cos((((_348 + _325) * 0.04444444552063942f) + _347) * 2.0f) * _357) * 2.0f) + 0.20000004768371582f);
    float _403 = (_399 * _399) * (3.0f - (_399 * 2.0f));
    float _405 = (_403 * 0.6499999761581421f) + 0.3499999940395355f;
    float _427 = saturate(_368);
    float _428 = saturate(_389);
    float _447 = ((((saturate(11.0f - (sqrt((_331 * _331) + (_330 * _330)) / ((_387 * 0.039000000804662704f) + 0.08100000768899918f))) * _389) + (saturate(11.0f - (sqrt((_326 * _326) + _336) / ((_366 * 0.039000000804662704f) + 0.08100000768899918f))) * _368)) + (saturate(11.0f - (sqrt((_343 * _343) + _336) / ((_403 * 0.039000000804662704f) + 0.08100000768899918f))) * _405)) + (((((saturate(1.0f - (abs(_327) * 0.8333333134651184f)) * _427) + (saturate(1.0f - (abs(dot(float2(_330, _331), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _428)) * saturate(_405)) + ((_427 * saturate(1.0f - (abs(dot(float2(_326, _327), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _428)) * 0.5f)) * _250;
    _458 = ((_447 * ((_287 * _287) - _244)) + _244);
    _459 = ((_447 * ((_288 * _288) - _245)) + _245);
    _460 = ((_447 * ((_289 * _289) - _246)) + _246);
  } else {
    _458 = _244;
    _459 = _245;
    _460 = _246;
  }
  SV_Target.x = _458;
  SV_Target.y = _459;
  SV_Target.z = _460;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_17.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
