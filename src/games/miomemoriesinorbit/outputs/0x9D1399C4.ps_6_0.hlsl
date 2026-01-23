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
  float _519;
  float _520;
  float _521;
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
  float _175 = 1.0f - frame_consts.game_plane_blend.y;
  float _180 = log2(max(5.0f, (-0.0f - (_169 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _181 = floor(_180);
  float _182 = _180 - _181;
  float _184 = exp2(_181 * 0.10000000149011612f);
  float _185 = 1.0f / _184;
  float _186 = min(_185, 0.20000000298023224f);
  float _188 = min((_185 * 0.9330329895019531f), 0.20000000298023224f);
  float _189 = frame_consts.game_plane_blend.x - _184;
  float _195 = frame_consts.game_plane_blend.x - (_184 * 1.0717734098434448f);
  float _207 = frame_consts.game_plane_blend.x + 10.0f;
  float _212 = log2(max(5.0f, (-0.0f - (_169 - _207)))) * 10.0f;
  float _213 = floor(_212);
  float _214 = _212 - _213;
  float _216 = exp2(_213 * 0.10000000149011612f);
  float _217 = 1.0f / _216;
  float _218 = min(_217, 0.20000000298023224f);
  float _220 = min((_217 * 0.9330329895019531f), 0.20000000298023224f);
  float _221 = _207 - _216;
  float _227 = _207 - (_216 * 1.0717734098434448f);
  float _239 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_189 * _170) + (frame_consts.paper_xf[3].x)) * _186), (((_189 * _171) + (frame_consts.paper_xf[3].y)) * _186)), 0.0f);
  float _242 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_195 * _170) + (frame_consts.paper_xf[3].x)) * _188), (((_195 * _171) + (frame_consts.paper_xf[3].y)) * _188)), 0.0f);
  float _245 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_221 * _170) + (frame_consts.paper_xf[3].x)) * _218), (((_221 * _171) + (frame_consts.paper_xf[3].y)) * _218)), 0.0f);
  float _248 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_227 * _170) + (frame_consts.paper_xf[3].x)) * _220), (((_227 * _171) + (frame_consts.paper_xf[3].y)) * _220)), 0.0f);
  float _257 = ((((1.0f - (((1.0f - _182) * _175) * _239.x)) - ((_182 * _175) * _242.x)) - (((1.0f - _214) * frame_consts.game_plane_blend.y) * _245.x)) - ((_214 * frame_consts.game_plane_blend.y) * _248.x)) * frame_consts.paper_mult;
  float _272 = _15 / _16;
  float _284 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(O_Uv.x + -0.5f)) * (((_272 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _285 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _291 = exp2(log2(saturate(1.0f - dot(float2(_284, _285), float2(_284, _285)))) * 6.0f);
  float _296 = 1.0f - _291;
  float _298 = 1.0f - (_296 * 0.8500000238418579f);
  float _305 = (_298 * ((_125 - (_257 * _125)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _306 = (_298 * ((_126 - (_257 * _126)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _307 = (_298 * ((_127 - (_257 * _127)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _311 = ((_291 * 1.2000000476837158f) * _296) * frame_consts.params.vignette.golden_intensity;
  if (_311 > 0.0020000000949949026f) {
    float _316 = _15 * O_Uv.x;
    float _317 = _16 * O_Uv.y;
    float _318 = _316 + _317;
    float _324 = frac(_318 * 0.0033333334140479565f) + -0.5f;
    float _325 = frac((_317 - _316) * 0.0033333334140479565f) + -0.5f;
    float _331 = saturate(sqrt((_325 * _325) + (_324 * _324)) * 2.0f);
    float _342 = saturate((sin((_318 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _347 = ((_342 * _342) * 0.2199999988079071f) * (3.0f - (_342 * 2.0f));
    float _348 = _347 + 0.9777389168739319f;
    float _349 = ((_331 * 0.13274884223937988f) + 0.7175776362419128f) + _347;
    float _350 = ((_331 * 0.3335757553577423f) + 0.30871906876564026f) + _347;
    float _355 = (O_Uv.x * 1080.0f) * _272;
    float _356 = O_Uv.y * 1080.0f;
    float _357 = _355 * 0.04444444552063942f;
    float _358 = O_Uv.y * 27.712812423706055f;
    float _360 = ceil(_357 - _358);
    float _363 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _366 = ceil((-0.0f - _358) - _357);
    float _368 = (_363 + _360) + _366;
    float _370 = (_368 * 22.5f) + -33.75f;
    float _372 = (_360 - _366) * 11.25f;
    float _378 = (((_363 * 0.5773502588272095f) - (_360 * 0.28867512941360474f)) - (_366 * 0.28867512941360474f)) * 22.5f;
    float _381 = _370 + _372;
    float _382 = _378 + (19.485570907592773f - (_368 * 12.990381240844727f));
    float _385 = ((_368 * 25.980762481689453f) + -38.97114181518555f) + _378;
    float _386 = _372 - _370;
    float _387 = _381 - _355;
    float _388 = _382 - _356;
    float _391 = _372 - _355;
    float _392 = _385 - _356;
    float _397 = _388 * _388;
    float _404 = _386 - _355;
    float _408 = frame_consts.time * 0.30000001192092896f;
    float _409 = _382 * 0.4000000059604645f;
    float _418 = sin(((_382 * 0.04444444552063942f) + _408) * 2.0f);
    float _423 = saturate((sqrt(_418 * cos((((_409 + _381) * 0.04444444552063942f) + _408) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _427 = (_423 * _423) * (3.0f - (_423 * 2.0f));
    float _429 = (_427 * 0.6499999761581421f) + 0.3499999940395355f;
    float _444 = saturate((sqrt(sin(((_385 * 0.04444444552063942f) + _408) * 2.0f) * cos(((((_385 * 0.4000000059604645f) + _372) * 0.04444444552063942f) + _408) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _448 = (_444 * _444) * (3.0f - (_444 * 2.0f));
    float _450 = (_448 * 0.6499999761581421f) + 0.3499999940395355f;
    float _460 = saturate((sqrt(cos((((_409 + _386) * 0.04444444552063942f) + _408) * 2.0f) * _418) * 2.0f) + 0.20000004768371582f);
    float _464 = (_460 * _460) * (3.0f - (_460 * 2.0f));
    float _466 = (_464 * 0.6499999761581421f) + 0.3499999940395355f;
    float _488 = saturate(_429);
    float _489 = saturate(_450);
    float _508 = ((((saturate(11.0f - (sqrt((_392 * _392) + (_391 * _391)) / ((_448 * 0.039000000804662704f) + 0.08100000768899918f))) * _450) + (saturate(11.0f - (sqrt((_387 * _387) + _397) / ((_427 * 0.039000000804662704f) + 0.08100000768899918f))) * _429)) + (saturate(11.0f - (sqrt((_404 * _404) + _397) / ((_464 * 0.039000000804662704f) + 0.08100000768899918f))) * _466)) + (((((saturate(1.0f - (abs(_388) * 0.8333333134651184f)) * _488) + (saturate(1.0f - (abs(dot(float2(_391, _392), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _489)) * saturate(_466)) + ((_488 * saturate(1.0f - (abs(dot(float2(_387, _388), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _489)) * 0.5f)) * _311;
    _519 = ((_508 * ((_348 * _348) - _305)) + _305);
    _520 = ((_508 * ((_349 * _349) - _306)) + _306);
    _521 = ((_508 * ((_350 * _350) - _307)) + _307);
  } else {
    _519 = _305;
    _520 = _306;
    _521 = _307;
  }
  SV_Target.x = _519;
  SV_Target.y = _520;
  SV_Target.z = _521;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_17.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
