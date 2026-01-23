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
  float _16 = float((int)(frame_consts.vp_dim.x));
  float _17 = float((int)(frame_consts.vp_dim.y));
  float2 _18 = distortion.SampleLevel(sampler_nearest, float2(O_Uv.x, O_Uv.y), 0.0f);
  float _21 = _17 / _16;
  float _26 = saturate((_18.x * _21) + O_Uv.x);
  float _27 = saturate((_18.y * _21) + O_Uv.y);
  float4 _28 = tex.SampleLevel(sampler_nearest, float2(_26, _27), 0.0f);
  float3 _32 = bloom_tex.SampleLevel(sampler_bilinear, float2(_26, _27), 0.0f);
  float _47 = max((((1.0f - (_28.y * 0.7152000069618225f)) - (_28.x * 0.2125999927520752f)) - (_28.z * 0.0722000002861023f)), 0.0010000000474974513f);
  float _51 = (_28.x / _47) + (frame_consts.params.bloom.intensity * _32.x);
  float _52 = (_28.y / _47) + (frame_consts.params.bloom.intensity * _32.y);
  float _53 = (_28.z / _47) + (frame_consts.params.bloom.intensity * _32.z);
  float _59 = (((_51 * 0.2125999927520752f) + 1.0f) + (_52 * 0.7152000069618225f)) + (_53 * 0.0722000002861023f);
  float _63 = saturate(_51 / _59);
  float _64 = saturate(_52 / _59);
  float _65 = saturate(_53 / _59);
  uint2 _66; color_correct_lut.GetDimensions(_66.x, _66.y);
  float _79;
  float _90;
  float _101;
  float _486;
  float _487;
  float _488;
  if (!(!(_63 <= 0.0031308000907301903f))) {
    _79 = (_63 * 12.920000076293945f);
  } else {
    _79 = (((pow(_63, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_64 <= 0.0031308000907301903f))) {
    _90 = (_64 * 12.920000076293945f);
  } else {
    _90 = (((pow(_64, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  if (!(!(_65 <= 0.0031308000907301903f))) {
    _101 = (_65 * 12.920000076293945f);
  } else {
    _101 = (((pow(_65, 0.4166666567325592f)) * 1.0549999475479126f) + -0.054999999701976776f);
  }
  float _104 = float((uint)(_66.y + -1u));
  float _107 = _101 * _104;
  float _108 = frac(_107);
  float _110 = float((uint)_66.y);
  float _112 = (_79 * _104) + 0.5f;
  float _115 = float((uint)_66.x);
  float _117 = (lerp(_90, 1.0f, _104)) / _110;
  float3 _118 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((ceil(_107) * _110) + _112) / _115), _117), 0.0f);
  float3 _126 = color_correct_lut.SampleLevel(sampler_bilinear, float2((((floor(_107) * _110) + _112) / _115), _117), 0.0f);
  float _136 = ((_118.x - _126.x) * _108) + _126.x;
  float _137 = ((_118.y - _126.y) * _108) + _126.y;
  float _138 = ((_118.z - _126.z) * _108) + _126.z;
  float _144 = depth_tex.SampleLevel(sampler_nearest, float2(_26, _27), 0.0f);
  float _148 = 10000.0f / ((_144.x * 19999.5f) + 0.5f);
  float _153 = (_148 * ((_26 * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.x;
  float _155 = (_148 * (((1.0f - _27) * 2.0f) + -1.0f)) * frame_consts.inv_near_dim.y;
  float _156 = -0.0f - _148;
  float _180 = mad((frame_consts.paper_xf[2].z), _156, mad((frame_consts.paper_xf[1].z), _155, (_153 * (frame_consts.paper_xf[0].z))));
  float _181 = mad((frame_consts.paper_xf[2].x), _156, mad((frame_consts.paper_xf[1].x), _155, (_153 * (frame_consts.paper_xf[0].x)))) / _180;
  float _182 = mad((frame_consts.paper_xf[2].y), _156, mad((frame_consts.paper_xf[1].y), _155, (_153 * (frame_consts.paper_xf[0].y)))) / _180;
  float _189 = log2(max(5.0f, (-0.0f - (_180 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _190 = floor(_189);
  float _191 = _189 - _190;
  float _193 = exp2(_190 * 0.10000000149011612f);
  float _194 = 1.0f / _193;
  float _195 = min(_194, 0.20000000298023224f);
  float _197 = min((_194 * 0.9330329895019531f), 0.20000000298023224f);
  float _198 = frame_consts.game_plane_blend.x - _193;
  float _204 = frame_consts.game_plane_blend.x - (_193 * 1.0717734098434448f);
  float _214 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_198 * _181) + (frame_consts.paper_xf[3].x)) * _195), (((_198 * _182) + (frame_consts.paper_xf[3].y)) * _195)), 0.0f);
  float _217 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_204 * _181) + (frame_consts.paper_xf[3].x)) * _197), (((_204 * _182) + (frame_consts.paper_xf[3].y)) * _197)), 0.0f);
  float _224 = ((1.0f - (_214.x * (1.0f - _191))) - (_217.x * _191)) * frame_consts.paper_mult;
  float _239 = _16 / _17;
  float _251 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(_26 + -0.5f)) * (((_239 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _252 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(_27 + -0.5f))) * 5.0f);
  float _258 = exp2(log2(saturate(1.0f - dot(float2(_251, _252), float2(_251, _252)))) * 6.0f);
  float _263 = 1.0f - _258;
  float _265 = 1.0f - (_263 * 0.8500000238418579f);
  float _272 = (_265 * ((_136 - (_224 * _136)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _273 = (_265 * ((_137 - (_224 * _137)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _274 = (_265 * ((_138 - (_224 * _138)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _278 = ((_258 * 1.2000000476837158f) * _263) * frame_consts.params.vignette.golden_intensity;
  if (_278 > 0.0020000000949949026f) {
    float _283 = _26 * _16;
    float _284 = _27 * _17;
    float _285 = _284 + _283;
    float _291 = frac(_285 * 0.0033333334140479565f) + -0.5f;
    float _292 = frac((_284 - _283) * 0.0033333334140479565f) + -0.5f;
    float _298 = saturate(sqrt((_292 * _292) + (_291 * _291)) * 2.0f);
    float _309 = saturate((sin((_285 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _314 = ((_309 * _309) * 0.2199999988079071f) * (3.0f - (_309 * 2.0f));
    float _315 = _314 + 0.9777389168739319f;
    float _316 = ((_298 * 0.13274884223937988f) + 0.7175776362419128f) + _314;
    float _317 = ((_298 * 0.3335757553577423f) + 0.30871906876564026f) + _314;
    float _322 = (_26 * 1080.0f) * _239;
    float _323 = _27 * 1080.0f;
    float _324 = _322 * 0.04444444552063942f;
    float _325 = _27 * 27.712812423706055f;
    float _327 = ceil(_324 - _325);
    float _330 = floor(_27 * 55.42562484741211f) + 1.0f;
    float _333 = ceil((-0.0f - _325) - _324);
    float _335 = (_330 + _327) + _333;
    float _337 = (_335 * 22.5f) + -33.75f;
    float _339 = (_327 - _333) * 11.25f;
    float _345 = (((_330 * 0.5773502588272095f) - (_327 * 0.28867512941360474f)) - (_333 * 0.28867512941360474f)) * 22.5f;
    float _348 = _337 + _339;
    float _349 = _345 + (19.485570907592773f - (_335 * 12.990381240844727f));
    float _352 = ((_335 * 25.980762481689453f) + -38.97114181518555f) + _345;
    float _353 = _339 - _337;
    float _354 = _348 - _322;
    float _355 = _349 - _323;
    float _358 = _339 - _322;
    float _359 = _352 - _323;
    float _364 = _355 * _355;
    float _371 = _353 - _322;
    float _375 = frame_consts.time * 0.30000001192092896f;
    float _376 = _349 * 0.4000000059604645f;
    float _385 = sin(((_349 * 0.04444444552063942f) + _375) * 2.0f);
    float _390 = saturate((sqrt(_385 * cos((((_376 + _348) * 0.04444444552063942f) + _375) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _394 = (_390 * _390) * (3.0f - (_390 * 2.0f));
    float _396 = (_394 * 0.6499999761581421f) + 0.3499999940395355f;
    float _411 = saturate((sqrt(sin(((_352 * 0.04444444552063942f) + _375) * 2.0f) * cos(((((_352 * 0.4000000059604645f) + _339) * 0.04444444552063942f) + _375) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _415 = (_411 * _411) * (3.0f - (_411 * 2.0f));
    float _417 = (_415 * 0.6499999761581421f) + 0.3499999940395355f;
    float _427 = saturate((sqrt(cos((((_376 + _353) * 0.04444444552063942f) + _375) * 2.0f) * _385) * 2.0f) + 0.20000004768371582f);
    float _431 = (_427 * _427) * (3.0f - (_427 * 2.0f));
    float _433 = (_431 * 0.6499999761581421f) + 0.3499999940395355f;
    float _455 = saturate(_396);
    float _456 = saturate(_417);
    float _475 = ((((saturate(11.0f - (sqrt((_359 * _359) + (_358 * _358)) / ((_415 * 0.039000000804662704f) + 0.08100000768899918f))) * _417) + (saturate(11.0f - (sqrt((_354 * _354) + _364) / ((_394 * 0.039000000804662704f) + 0.08100000768899918f))) * _396)) + (saturate(11.0f - (sqrt((_371 * _371) + _364) / ((_431 * 0.039000000804662704f) + 0.08100000768899918f))) * _433)) + (((((saturate(1.0f - (abs(_355) * 0.8333333134651184f)) * _455) + (saturate(1.0f - (abs(dot(float2(_358, _359), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _456)) * saturate(_433)) + ((_455 * saturate(1.0f - (abs(dot(float2(_354, _355), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _456)) * 0.5f)) * _278;
    _486 = ((_475 * ((_315 * _315) - _272)) + _272);
    _487 = ((_475 * ((_316 * _316) - _273)) + _273);
    _488 = ((_475 * ((_317 * _317) - _274)) + _274);
  } else {
    _486 = _272;
    _487 = _273;
    _488 = _274;
  }
  SV_Target.x = _486;
  SV_Target.y = _487;
  SV_Target.z = _488;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_28.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
