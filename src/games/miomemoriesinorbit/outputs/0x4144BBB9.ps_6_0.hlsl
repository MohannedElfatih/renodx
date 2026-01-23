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
  float _14 = float((int)(frame_consts.vp_dim.x));
  float _15 = float((int)(frame_consts.vp_dim.y));
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
  float _109 = exp2(round(log2(max(5.0f, (-0.0f - (_95 - frame_consts.game_plane_blend.x)))) * 10.0f) * 0.10000000149011612f);
  float _111 = min((1.0f / _109), 0.20000000298023224f);
  float _112 = frame_consts.game_plane_blend.x - _109;
  float _119 = frame_consts.game_plane_blend.x + 10.0f;
  float _127 = exp2(round(log2(max(5.0f, (-0.0f - (_95 - _119)))) * 10.0f) * 0.10000000149011612f);
  float _129 = min((1.0f / _127), 0.20000000298023224f);
  float _130 = _119 - _127;
  float _137 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_112 * _96) + (frame_consts.paper_xf[3].x)) * _111), (((_112 * _97) + (frame_consts.paper_xf[3].y)) * _111)), 0.0f);
  float _140 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_130 * _96) + (frame_consts.paper_xf[3].x)) * _129), (((_130 * _97) + (frame_consts.paper_xf[3].y)) * _129)), 0.0f);
  float _147 = ((1.0f - (_137.x * (1.0f - frame_consts.game_plane_blend.y))) - (_140.x * frame_consts.game_plane_blend.y)) * frame_consts.paper_mult;
  float _162 = _14 / _15;
  float _174 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(O_Uv.x + -0.5f)) * (((_162 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _175 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _181 = exp2(log2(saturate(1.0f - dot(float2(_174, _175), float2(_174, _175)))) * 6.0f);
  float _186 = 1.0f - _181;
  float _188 = 1.0f - (_186 * 0.8500000238418579f);
  float _195 = (_188 * ((_51 - (_147 * _51)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _196 = (_188 * ((_52 - (_147 * _52)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _197 = (_188 * ((_53 - (_147 * _53)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _201 = ((_181 * 1.2000000476837158f) * _186) * frame_consts.params.vignette.golden_intensity;
  float _409;
  float _410;
  float _411;
  if (_201 > 0.0020000000949949026f) {
    float _206 = _14 * O_Uv.x;
    float _207 = _15 * O_Uv.y;
    float _208 = _206 + _207;
    float _214 = frac(_208 * 0.0033333334140479565f) + -0.5f;
    float _215 = frac((_207 - _206) * 0.0033333334140479565f) + -0.5f;
    float _221 = saturate(sqrt((_215 * _215) + (_214 * _214)) * 2.0f);
    float _232 = saturate((sin((_208 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _237 = ((_232 * _232) * 0.2199999988079071f) * (3.0f - (_232 * 2.0f));
    float _238 = _237 + 0.9777389168739319f;
    float _239 = ((_221 * 0.13274884223937988f) + 0.7175776362419128f) + _237;
    float _240 = ((_221 * 0.3335757553577423f) + 0.30871906876564026f) + _237;
    float _245 = (O_Uv.x * 1080.0f) * _162;
    float _246 = O_Uv.y * 1080.0f;
    float _247 = _245 * 0.04444444552063942f;
    float _248 = O_Uv.y * 27.712812423706055f;
    float _250 = ceil(_247 - _248);
    float _253 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _256 = ceil((-0.0f - _248) - _247);
    float _258 = (_253 + _250) + _256;
    float _260 = (_258 * 22.5f) + -33.75f;
    float _262 = (_250 - _256) * 11.25f;
    float _268 = (((_253 * 0.5773502588272095f) - (_250 * 0.28867512941360474f)) - (_256 * 0.28867512941360474f)) * 22.5f;
    float _271 = _260 + _262;
    float _272 = _268 + (19.485570907592773f - (_258 * 12.990381240844727f));
    float _275 = ((_258 * 25.980762481689453f) + -38.97114181518555f) + _268;
    float _276 = _262 - _260;
    float _277 = _271 - _245;
    float _278 = _272 - _246;
    float _281 = _262 - _245;
    float _282 = _275 - _246;
    float _287 = _278 * _278;
    float _294 = _276 - _245;
    float _298 = frame_consts.time * 0.30000001192092896f;
    float _299 = _272 * 0.4000000059604645f;
    float _308 = sin(((_272 * 0.04444444552063942f) + _298) * 2.0f);
    float _313 = saturate((sqrt(_308 * cos((((_299 + _271) * 0.04444444552063942f) + _298) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _317 = (_313 * _313) * (3.0f - (_313 * 2.0f));
    float _319 = (_317 * 0.6499999761581421f) + 0.3499999940395355f;
    float _334 = saturate((sqrt(sin(((_275 * 0.04444444552063942f) + _298) * 2.0f) * cos(((((_275 * 0.4000000059604645f) + _262) * 0.04444444552063942f) + _298) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _338 = (_334 * _334) * (3.0f - (_334 * 2.0f));
    float _340 = (_338 * 0.6499999761581421f) + 0.3499999940395355f;
    float _350 = saturate((sqrt(cos((((_299 + _276) * 0.04444444552063942f) + _298) * 2.0f) * _308) * 2.0f) + 0.20000004768371582f);
    float _354 = (_350 * _350) * (3.0f - (_350 * 2.0f));
    float _356 = (_354 * 0.6499999761581421f) + 0.3499999940395355f;
    float _378 = saturate(_319);
    float _379 = saturate(_340);
    float _398 = ((((saturate(11.0f - (sqrt((_282 * _282) + (_281 * _281)) / ((_338 * 0.039000000804662704f) + 0.08100000768899918f))) * _340) + (saturate(11.0f - (sqrt((_277 * _277) + _287) / ((_317 * 0.039000000804662704f) + 0.08100000768899918f))) * _319)) + (saturate(11.0f - (sqrt((_294 * _294) + _287) / ((_354 * 0.039000000804662704f) + 0.08100000768899918f))) * _356)) + (((((saturate(1.0f - (abs(_278) * 0.8333333134651184f)) * _378) + (saturate(1.0f - (abs(dot(float2(_281, _282), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _379)) * saturate(_356)) + ((_378 * saturate(1.0f - (abs(dot(float2(_277, _278), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _379)) * 0.5f)) * _201;
    _409 = ((_398 * ((_238 * _238) - _195)) + _195);
    _410 = ((_398 * ((_239 * _239) - _196)) + _196);
    _411 = ((_398 * ((_240 * _240) - _197)) + _197);
  } else {
    _409 = _195;
    _410 = _196;
    _411 = _197;
  }
  SV_Target.x = _409;
  SV_Target.y = _410;
  SV_Target.z = _411;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_16.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
