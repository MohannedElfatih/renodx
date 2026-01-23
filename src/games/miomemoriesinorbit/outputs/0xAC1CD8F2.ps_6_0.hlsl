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
  float _475;
  float _476;
  float _477;
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
  float _178 = log2(max(5.0f, (-0.0f - (_169 - frame_consts.game_plane_blend.x)))) * 10.0f;
  float _179 = floor(_178);
  float _180 = _178 - _179;
  float _182 = exp2(_179 * 0.10000000149011612f);
  float _183 = 1.0f / _182;
  float _184 = min(_183, 0.20000000298023224f);
  float _186 = min((_183 * 0.9330329895019531f), 0.20000000298023224f);
  float _187 = frame_consts.game_plane_blend.x - _182;
  float _193 = frame_consts.game_plane_blend.x - (_182 * 1.0717734098434448f);
  float _203 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_187 * _170) + (frame_consts.paper_xf[3].x)) * _184), (((_187 * _171) + (frame_consts.paper_xf[3].y)) * _184)), 0.0f);
  float _206 = paper_tex.SampleLevel(sampler_bilinear_wrap, float2((((_193 * _170) + (frame_consts.paper_xf[3].x)) * _186), (((_193 * _171) + (frame_consts.paper_xf[3].y)) * _186)), 0.0f);
  float _213 = ((1.0f - (_203.x * (1.0f - _180))) - (_206.x * _180)) * frame_consts.paper_mult;
  float _228 = _15 / _16;
  float _240 = exp2(log2(saturate((frame_consts.params.vignette.intensity * abs(O_Uv.x + -0.5f)) * (((_228 + -1.0f) * frame_consts.params.vignette.rounded) + 1.0f))) * 5.0f);
  float _241 = exp2(log2(saturate(frame_consts.params.vignette.intensity * abs(O_Uv.y + -0.5f))) * 5.0f);
  float _247 = exp2(log2(saturate(1.0f - dot(float2(_240, _241), float2(_240, _241)))) * 6.0f);
  float _252 = 1.0f - _247;
  float _254 = 1.0f - (_252 * 0.8500000238418579f);
  float _261 = (_254 * ((_125 - (_213 * _125)) - frame_consts.params.vignette.color.x)) + frame_consts.params.vignette.color.x;
  float _262 = (_254 * ((_126 - (_213 * _126)) - frame_consts.params.vignette.color.y)) + frame_consts.params.vignette.color.y;
  float _263 = (_254 * ((_127 - (_213 * _127)) - frame_consts.params.vignette.color.z)) + frame_consts.params.vignette.color.z;
  float _267 = ((_247 * 1.2000000476837158f) * _252) * frame_consts.params.vignette.golden_intensity;
  if (_267 > 0.0020000000949949026f) {
    float _272 = _15 * O_Uv.x;
    float _273 = _16 * O_Uv.y;
    float _274 = _272 + _273;
    float _280 = frac(_274 * 0.0033333334140479565f) + -0.5f;
    float _281 = frac((_273 - _272) * 0.0033333334140479565f) + -0.5f;
    float _287 = saturate(sqrt((_281 * _281) + (_280 * _280)) * 2.0f);
    float _298 = saturate((sin((_274 * 0.01666666753590107f) - (frame_consts.time * 0.8500000238418579f)) * 1.2500001192092896f) + -0.25000008940696716f);
    float _303 = ((_298 * _298) * 0.2199999988079071f) * (3.0f - (_298 * 2.0f));
    float _304 = _303 + 0.9777389168739319f;
    float _305 = ((_287 * 0.13274884223937988f) + 0.7175776362419128f) + _303;
    float _306 = ((_287 * 0.3335757553577423f) + 0.30871906876564026f) + _303;
    float _311 = (O_Uv.x * 1080.0f) * _228;
    float _312 = O_Uv.y * 1080.0f;
    float _313 = _311 * 0.04444444552063942f;
    float _314 = O_Uv.y * 27.712812423706055f;
    float _316 = ceil(_313 - _314);
    float _319 = floor(O_Uv.y * 55.42562484741211f) + 1.0f;
    float _322 = ceil((-0.0f - _314) - _313);
    float _324 = (_319 + _316) + _322;
    float _326 = (_324 * 22.5f) + -33.75f;
    float _328 = (_316 - _322) * 11.25f;
    float _334 = (((_319 * 0.5773502588272095f) - (_316 * 0.28867512941360474f)) - (_322 * 0.28867512941360474f)) * 22.5f;
    float _337 = _326 + _328;
    float _338 = _334 + (19.485570907592773f - (_324 * 12.990381240844727f));
    float _341 = ((_324 * 25.980762481689453f) + -38.97114181518555f) + _334;
    float _342 = _328 - _326;
    float _343 = _337 - _311;
    float _344 = _338 - _312;
    float _347 = _328 - _311;
    float _348 = _341 - _312;
    float _353 = _344 * _344;
    float _360 = _342 - _311;
    float _364 = frame_consts.time * 0.30000001192092896f;
    float _365 = _338 * 0.4000000059604645f;
    float _374 = sin(((_338 * 0.04444444552063942f) + _364) * 2.0f);
    float _379 = saturate((sqrt(_374 * cos((((_365 + _337) * 0.04444444552063942f) + _364) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _383 = (_379 * _379) * (3.0f - (_379 * 2.0f));
    float _385 = (_383 * 0.6499999761581421f) + 0.3499999940395355f;
    float _400 = saturate((sqrt(sin(((_341 * 0.04444444552063942f) + _364) * 2.0f) * cos(((((_341 * 0.4000000059604645f) + _328) * 0.04444444552063942f) + _364) * 2.0f)) * 2.0f) + 0.20000004768371582f);
    float _404 = (_400 * _400) * (3.0f - (_400 * 2.0f));
    float _406 = (_404 * 0.6499999761581421f) + 0.3499999940395355f;
    float _416 = saturate((sqrt(cos((((_365 + _342) * 0.04444444552063942f) + _364) * 2.0f) * _374) * 2.0f) + 0.20000004768371582f);
    float _420 = (_416 * _416) * (3.0f - (_416 * 2.0f));
    float _422 = (_420 * 0.6499999761581421f) + 0.3499999940395355f;
    float _444 = saturate(_385);
    float _445 = saturate(_406);
    float _464 = ((((saturate(11.0f - (sqrt((_348 * _348) + (_347 * _347)) / ((_404 * 0.039000000804662704f) + 0.08100000768899918f))) * _406) + (saturate(11.0f - (sqrt((_343 * _343) + _353) / ((_383 * 0.039000000804662704f) + 0.08100000768899918f))) * _385)) + (saturate(11.0f - (sqrt((_360 * _360) + _353) / ((_420 * 0.039000000804662704f) + 0.08100000768899918f))) * _422)) + (((((saturate(1.0f - (abs(_344) * 0.8333333134651184f)) * _444) + (saturate(1.0f - (abs(dot(float2(_347, _348), float2(-0.8660253882408142f, 0.5f))) * 0.8333333134651184f)) * _445)) * saturate(_422)) + ((_444 * saturate(1.0f - (abs(dot(float2(_343, _344), float2(0.8660253882408142f, 0.5f))) * 0.8333333134651184f))) * _445)) * 0.5f)) * _267;
    _475 = ((_464 * ((_304 * _304) - _261)) + _261);
    _476 = ((_464 * ((_305 * _305) - _262)) + _262);
    _477 = ((_464 * ((_306 * _306) - _263)) + _263);
  } else {
    _475 = _261;
    _476 = _262;
    _477 = _263;
  }
  SV_Target.x = _475;
  SV_Target.y = _476;
  SV_Target.z = _477;
  if (RENODX_TONE_MAP_TYPE) {
    SV_Target.rgb = renodx::draw::ToneMapPass(_17.rgb, SV_Target.rgb);
  } else {
    SV_Target.rgb = saturate(SV_Target.rgb);
  }
  SV_Target.rgb = renodx::draw::RenderIntermediatePass(SV_Target.rgb);

  SV_Target.w = 1.0f;
  return SV_Target;
}
