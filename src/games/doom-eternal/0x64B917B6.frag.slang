#version 450
// #extension GL_EXT_nonuniform_qualifier : require
// #extension GL_EXT_scalar_block_layout : require
// #extension GL_EXT_samplerless_texture_functions : require
// #extension GL_EXT_spirv_intrinsics : require
// #extension GL_KHR_shader_subgroup_vote : require
// #extension GL_KHR_shader_subgroup_quad : require

float spvNMax(float a, float b) {
  return max(a, b);
}
vec2 spvNMax(vec2 a, vec2 b) {
  return max(a, b);
}
vec3 spvNMax(vec3 a, vec3 b) {
  return max(a, b);
}
vec4 spvNMax(vec4 a, vec4 b) {
  return max(a, b);
}
float spvNMin(float a, float b) {
  return min(a, b);
}
vec2 spvNMin(vec2 a, vec2 b) {
  return min(a, b);
}
vec3 spvNMin(vec3 a, vec3 b) {
  return min(a, b);
}
vec4 spvNMin(vec4 a, vec4 b) {
  return min(a, b);
}

#define sampler2D(tex, samp) tex, samp
#define sampler3D(tex, samp) tex, samp

vec4 textureLod(Texture2D tex, SamplerState samp, vec2 uv, float lod) {
  return tex.SampleLevel(samp, uv, lod);
}

vec4 textureLod(Texture3D tex, SamplerState samp, vec3 uv, float lod) {
  return tex.SampleLevel(samp, uv, lod);
}

T texelFetch<T : ITexelElement>(Texture2D<T> tex, int2 coord, int lod) {
  return tex.Load(int3(coord, lod));
}

vec4 textureGatherOffset(Texture2D tex, SamplerState samp, vec2 uv, ivec2 offset, int comp) {
  int2 ioffset = int2(offset);
  if (comp == 0) return tex.GatherRed(samp, uv, ioffset);
  if (comp == 1) return tex.GatherGreen(samp, uv, ioffset);
  if (comp == 2) return tex.GatherBlue(samp, uv, ioffset);
  return tex.GatherAlpha(samp, uv, ioffset);
}

struct ViewConstants {
  mat4 view_to_clip;
  mat4 clip_to_view;
  mat4 view_to_sample;
  mat4 sample_to_view;
  mat4 world_to_view;
  mat4 view_to_world;
  mat4 world_to_sample;
  mat4 clip_to_prev_clip;
  mat4 prev_view_to_prev_clip;
  mat4 prev_clip_to_prev_view;
  mat4 prev_world_to_prev_view;
  mat4 prev_view_to_prev_world;
  vec2 sample_offset_pixels;
  vec2 sample_offset_clip;
  vec2 prev_sample_offset_pixels;
  vec2 prev_sample_offset_clip;
};

struct LanternPacked {
  vec3 position;
  uint intensity_color_id;
};

struct Reservoir1spp {
  float w_sum;
  uint payload;
  float M;
  float W;
};

struct Reservoir1sppStreamState {
  float p_q_sel;
  float M_sum;
};

float _249;
uint _250;

layout(set = 1, binding = 0, std140) uniform type_ConstantBuffer_FrameConstants {
  vec4 sun_color;
  vec4 sky_low_color;
  vec4 sky_high_color;
  vec4 fog_tint_thickness;
  vec4 fake_light_color;
  vec4 fake_light_dir;
  vec4 fake_light2_color;
  vec4 fake_light2_dir;
  uint frame_index;
  float delta_time_seconds;
  float ev_mult;
  uint glade_theme_id;
  uvec2 inner_rendering_resolution;
  uint game_time_sec;
  float game_time_frac;
  vec3 editing_highlight_color;
  float time_of_day;
  vec3 dir_to_sun;
  uint camera_idx;
  vec3 dir_to_moon;
  uint render_overrides;
  float global_mip_bias;
  uint highlighted_transient_stair_edge_id;
  uint pad1;
  uint pad2;
  vec4 debug_tweakers;
  ViewConstants view_constants[5];
}
frame_constants;

layout(set = 0, binding = 13, scalar) uniform type_Globals {
  [[vk::offset(0)]]
  uvec2 gbuffer_tex_dims;
  [[vk::offset(8)]]
  uvec2 depth_tex_dims;
  [[vk::offset(16)]]
  uvec2 half_depth_tex_dims;
  [[vk::offset(24)]]
  uvec2 taa_history_tex_dims;
  [[vk::offset(32)]]
  uint taa_history_valid;
  [[vk::offset(36)]]
  uvec2 blue_noise_texture_dims;
  [[vk::offset(48)]]
  uvec2 ssgi_tex_dims;
  [[vk::offset(56)]]
  uvec2 screen_shadows_tex_dims;
  [[vk::offset(64)]]
  uvec2 terrain_lighting_texture_dims;
  [[vk::offset(72)]]
  uvec2 highlight_active_hill_dims;
  [[vk::offset(80)]]
  float time;
  [[vk::offset(84)]]
  uint lantern_count;
  [[vk::offset(88)]]
  uvec2 indirect_radiance_tex_dims;
  [[vk::offset(96)]]
  uvec2 rdi_reservoir_tex_dims;
  [[vk::offset(104)]]
  uvec2 terrain_heightmap_dims;
  [[vk::offset(112)]]
  uvec2 visual_terrain_heightmap_dims;
  [[vk::offset(120)]]
  uvec2 brdf_fg_lut_dims;
  [[vk::offset(128)]]
  uint rt_bvh_node_count;
  [[vk::offset(132)]]
  uint rt_triangle_count;
}
_Globals;

layout(set = 0, binding = 23, std140) uniform type_ConstantBuffer_ColorLibrary {
  vec4 temp_color_1;
  vec4 temp_color_2;
  vec4 temp_color_3;
  vec4 roof_color_1;
  vec4 roof_color_2;
  vec4 sky_low_day;
  vec4 sky_high_day;
  vec4 sun_tint_day;
  vec4 sky_low_dusk;
  vec4 sky_high_dusk;
  vec4 sun_tint_dusk;
  vec4 indirect_light_tint;
  vec4 fence_color_1;
  vec4 fence_color_2;
  vec4 flower_color_1;
  vec4 flower_color_2;
  vec4 canopy_color_1;
  vec4 canopy_color_2;
  vec4 grass_1;
  vec4 grass_2;
  vec4 path;
  vec4 sky_base;
  vec4 sky_horizon;
  vec4 sky_clouds_1;
  vec4 sky_clouds_2;
  vec4 terrain_1;
  vec4 terrain_2;
  vec4 terrain_flattened;
  vec4 wall_1;
  vec4 wall_2;
  vec4 wall_moss;
  vec4 wall_bricks;
  vec4 ivy_branch;
  vec4 ivy_leaf_1;
  vec4 ivy_leaf_2;
  vec4 terrain_highlight;
  vec4 night_tint;
}
color_library;

layout(set = 0, binding = 24, std140) uniform type_spatial_resolve_offsets {
  ivec4 spatial_resolve_offsets_array[512];
}
spatial_resolve_offsets;

layout(set = 0, binding = 26, std430) readonly buffer type_StructuredBuffer_LanternPacked {
  LanternPacked _m0[];
}
lantern_buf;

layout(set = 0, binding = 36, std430) readonly buffer type_StructuredBuffer_uint {
  uint _m0[];
}
light_indirection_grid;

layout(set = 0, binding = 37, std430) readonly buffer grid_light_indices {
  uint _m0[];
}
grid_light_indices_1;

layout(set = 0, binding = 2) uniform SamplerState sampler_nnc;
layout(set = 0, binding = 3) uniform SamplerState sampler_llc;
layout(set = 0, binding = 14) uniform Texture2D<uint4> gbuffer_tex;
layout(set = 0, binding = 15) uniform Texture2D depth_tex;
layout(set = 0, binding = 16) uniform Texture2D half_depth_tex;
layout(set = 0, binding = 18) uniform Texture2D blue_noise_texture;
layout(set = 0, binding = 19) uniform Texture2D ssgi_tex;
layout(set = 0, binding = 20) uniform Texture2D screen_shadows_tex;
layout(set = 0, binding = 27) uniform Texture2D indirect_radiance_tex;
layout(set = 0, binding = 28) uniform Texture2D<uint4> rdi_reservoir_tex;

layout(location = 0) out vec4 out_var_SV_TARGET;

void main() {
  ivec2 _312 = ivec2(gl_FragCoord.xy);
  uvec2 _313 = uvec2(_312);
  vec4 _328 = ((texelFetch(blue_noise_texture, ivec2((_313 + uvec2(fract((vec2(0.75487768650054931640625, 0.56984031200408935546875) * float(frame_constants.frame_index)) + vec2(0.5)) * vec2(256.0))) % uvec2(256u)), int(0u)) * 255.0) * vec4(0.00390625)) + vec4(0.001953125);
  uvec4 _330 = texelFetch(gbuffer_tex, ivec2(_313), int(0u));
  vec4 _332 = texelFetch(depth_tex, ivec2(_313), int(0u));
  float _333 = _332.x;
  uint _334 = _330.x;
  float _349 = float((_334 >> 24u) & 255u) * 0.0039215688593685626983642578125;
  uint _351 = _330.y;
  float _366 = float((_351 >> 24u) & 255u) * 0.0039215688593685626983642578125;
  vec3 _370 = (vec4(float(_334 & 255u) * 0.0039215688593685626983642578125, float((_334 >> 8u) & 255u) * 0.0039215688593685626983642578125, float((_334 >> 16u) & 255u) * 0.0039215688593685626983642578125, _349).xyz * 2.0) - vec3(1.0);
  vec3 _371 = vec4(float(_351 & 255u) * 0.0039215688593685626983642578125, float((_351 >> 8u) & 255u) * 0.0039215688593685626983642578125, float((_351 >> 16u) & 255u) * 0.0039215688593685626983642578125, _366).xyz;
  vec3 _376 = (vec4(0.0, 0.0, 1.0, 0.0) * frame_constants.view_constants[2u].view_to_world).xyz;
  vec2 _379 = vec2(_Globals.depth_tex_dims);
  vec2 _382 = (vec2(_312) + vec2(0.5)) / _379;
  vec2 _388 = (_382 - vec2(0.5)) * vec2(2.0, -2.0);
  float _389 = _388.x;
  vec4 _394 = vec4(_389, _388.y, _333, 1.0);
  vec4 _396 = (_394 * frame_constants.view_constants[0u].sample_to_view) * frame_constants.view_constants[0u].view_to_world;
  vec3 _399 = -normalize(((vec4(_389, _388.y, 0.0, 1.0) * frame_constants.view_constants[0u].sample_to_view) * frame_constants.view_constants[0u].view_to_world).xyz);
  vec3 _403 = _396.xyz / vec3(_396.w);
  float _410 = clamp(0.100000001490116119384765625 + textureLod(sampler2D(ssgi_tex, sampler_nnc), _382, 0.0).x, 0.0, 1.0);
  vec3 _419 = mix(_371 * _371, vec3(0.5), bvec3((frame_constants.render_overrides & 1u) != 0u));
  float _423 = 1.0 - texelFetch(screen_shadows_tex, ivec2(_313), int(0u)).x;
  float _426 = dot(_370, _376);
  vec3 _485;
  do {
    bool _442;
    if (!(_426 <= 0.0)) {
      _442 = dot(_370, _399) <= 0.0;
    } else {
      _442 = true;
    }
    if (_442) {
      _485 = vec3(0.0);
      break;
    }
    vec3 _446 = normalize(_399 + _376);
    float _447 = dot(_370, _446);
    float _450 = spvNMax(0.0, 1.0 - dot(_446, _376));
    float _451 = _450 * _450;
    float _456 = dot(_370, _399);
    float _476 = ((_447 * _447) * (-0.9375)) + 1.0;
    _485 = ((mix(vec3(0.039999999105930328369140625), vec3(1.0), vec3((_451 * _451) * _450)) * (((2.0 * _426) * _456) / ((_426 * sqrt((((_456 * (-0.0625)) + _456) * _456) + 0.0625)) + (_456 * sqrt((((_426 * (-0.0625)) + _426) * _426) + 0.0625))))) * (0.0625 / ((3.1415927410125732421875 * _476) * _476))) / vec3((4.0 * _456) * _426);
    break;
  } while (false);
  vec4 _306[3] = vec4[](vec4(0.0), vec4(0.0), vec4(0.0));
  float _499 = _328.x;
  uint _503 = uint((_499 * 3.0) + 0.5) & 3u;
  float _505;
  _505 = 0.0;
  float _506;
  for (uint _508 = 0u; _508 < 3u; _505 = _506, _508++) {
    uvec2 _520 = (_313 / uvec2(2u)) + uvec2(spatial_resolve_offsets.spatial_resolve_offsets_array[(_503 * 16u) + _508].xy);
    float _530 = exp2(-spvNMin(30.0, 80.0 * abs(1.0 - (texelFetch(half_depth_tex, ivec2(_520), int(0u)).x / _333))));
    for (uint _532 = 0u; _532 < 3u;) {
      _306[_532] += (texelFetch(indirect_radiance_tex, ivec2(_520 + uvec2((_532 * _Globals.indirect_radiance_tex_dims.x) / 3u, 0u)), int(0u)) * _530);
      _532++;
      continue;
    }
    _506 = _505 + _530;
  }
  float _597;
  if (_505 < 0.001000000047497451305389404296875) {
    float _553;
    _553 = _505;
    float _554;
    for (uint _556 = 3u; _556 < 6u; _553 = _554, _556++) {
      uvec2 _568 = (_313 / uvec2(2u)) + uvec2(spatial_resolve_offsets.spatial_resolve_offsets_array[(_503 * 16u) + _556].xy);
      float _578 = exp2(-spvNMin(30.0, 80.0 * abs(1.0 - (texelFetch(half_depth_tex, ivec2(_568), int(0u)).x / _333))));
      for (uint _580 = 0u; _580 < 3u;) {
        _306[_580] += (texelFetch(indirect_radiance_tex, ivec2(_568 + uvec2((_580 * _Globals.indirect_radiance_tex_dims.x) / 3u, 0u)), int(0u)) * _578);
        _580++;
        continue;
      }
      _554 = _553 + _578;
    }
    _597 = _553;
  } else {
    _597 = _505;
  }
  float _751;
  float _599 = 1.0 / spvNMax(9.9999997473787516355514526367188e-05, _597);
  _306[0] *= _599;
  _306[1] *= _599;
  _306[2] *= _599;
  vec3 _617 = (_306[0].yzw + _306[1].yzw) + _306[2].yzw;
  vec3 _621 = _617 / vec3(spvNMax(9.9999996826552253889678874634872e-21, length(_617)));
  vec3 _625 = vec3(_306[0].x, _306[1].x, _306[2].x);
  vec3 _628 = _306[0].yzw / vec3(spvNMax(9.9999996826552253889678874634872e-21, _306[0].x));
  vec3 _631 = _306[1].yzw / vec3(spvNMax(9.9999996826552253889678874634872e-21, _306[1].x));
  vec3 _634 = _306[2].yzw / vec3(spvNMax(9.9999996826552253889678874634872e-21, _306[2].x));
  vec3 _640 = spvNMax(vec3(0.0), vec3(1.0) - (color_library.indirect_light_tint.xyz * 0.920000016689300537109375));
  vec3 _648 = spvNMax(vec3(0.0), mix((_640 / vec3(dot(_640, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)))) * dot(_625, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), _625, vec3(1.16999995708465576171875)) * 1.2000000476837158203125);
  vec3 _654 = (-vec3(_628.y, _631.y, _634.y)) * _648;
  vec3 _659 = vec3(_628.z, _631.z, _634.z) * _648;
  vec3 _665 = (-vec3(_628.x, _631.x, _634.x)) * _648;
  vec3 _672 = normalize(vec3(-dot(_665, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), -dot(_654, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875)), dot(_659, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))));
  vec3 _698 = vec3(abs(dot(vec3(-_665.x, -_654.x, _659.x), _672)), abs(dot(vec3(-_665.y, -_654.y, _659.y), _672)), abs(dot(vec3(-_665.z, -_654.z, _659.z), _672))) / _648;
  float _704 = dot(_672, _370);
  vec3 _730 = spvNMax(spvNMax(vec3(0.0), ((((vec3(0.886227548122406005859375) * _648) + ((vec3(1.0) * (_370.y * (-1.02332770824432373046875))) * _654)) + ((vec3(1.0) * (_370.z * 1.02332770824432373046875)) * _659)) + ((vec3(1.0) * (_370.x * (-1.02332770824432373046875))) * _665)) + (((_648 * ((_698 * 0.07999999821186065673828125) + ((_698 * 0.60000002384185791015625) * _698))) * 0.25) * (0.3153915703296661376953125 * (((3.0 * _704) * _704) - 1.0)))), _648 * 2.0);
  float _731 = mix(0.5, 1.0, _410);
  vec3 _801;
  do {
    _751 = dot(_370, _621);
    bool _758;
    if (!(_751 <= 0.0)) {
      _758 = dot(_370, _399) <= 0.0;
    } else {
      _758 = true;
    }
    if (_758) {
      _801 = vec3(0.0);
      break;
    }
    vec3 _762 = normalize(_399 + _621);
    float _763 = dot(_370, _762);
    float _766 = spvNMax(0.0, 1.0 - dot(_762, _621));
    float _767 = _766 * _766;
    float _772 = dot(_370, _399);
    float _792 = ((_763 * _763) * (-0.9084937572479248046875)) + 1.0;
    _801 = ((mix(vec3(0.039999999105930328369140625), vec3(1.0), vec3((_767 * _767) * _766)) * (((2.0 * _751) * _772) / ((_751 * sqrt((((_772 * (-0.09150625765323638916015625)) + _772) * _772) + 0.09150625765323638916015625)) + (_772 * sqrt((((_751 * (-0.09150625765323638916015625)) + _751) * _751) + 0.09150625765323638916015625))))) * (0.09150625765323638916015625 / ((3.1415927410125732421875 * _792) * _792))) / vec3((4.0 * _772) * _751);
    break;
  } while (false);
  vec3 _808 = (vec3(0.3183098733425140380859375) * (((((_419 * 1.0) * mix(mix(0.0, 0.5, _366), 1.0, smoothstep(mix(0.0, -0.699999988079071044921875, _366), mix(1.0, 0.699999988079071044921875, _366), _426))) * frame_constants.sun_color.xyz) * _423) + ((((((_485 * frame_constants.sun_color.xyz) * _349) * (color_library.sky_base.xyz * color_library.sky_base.xyz)) * spvNMax(0.0, _426)) * frame_constants.sun_color.xyz) * _423))) + ((((spvNMax(vec3(_731), ((((((_419 * 2.040400028228759765625) - vec3(0.3323999941349029541015625)) * _731) + ((_419 * (-4.79510021209716796875)) + vec3(0.6417000293731689453125))) * _731) + ((_419 * 2.755199909210205078125) + vec3(0.69029998779296875))) * _731) * 1.10000002384185791015625) * _419) * _730) + ((((_730 * _349) * _801) * _410) * clamp(_751 * 12.0, 0.0, 4.0)));
  vec3 _2279;
  if ((_Globals.lantern_count > 0u) ? true : false) {
    uvec3 _819 = uvec3(clamp(floor((_403 * vec3(0.24615384638309478759765625, 0.123076923191547393798828125, 0.24615384638309478759765625)) + vec3(16.0, 2.0, 16.0)), vec3(0.0), vec3(31.0, 15.0, 31.0)));
    uint _826 = (32u * ((32u * _819.y) + _819.z)) + _819.x;
    bool _831 = subgroupAll((light_indirection_grid._m0[_826] >> 20u) <= 2u);
    uint _832 = _831 ? 2u : 6u;
    vec3 _2278;
    if (6u == _832) {
      uint _307[8];
      for (uint _1383 = 0u; _1383 < 8u;) {
        _307[_1383] = 4294967295u;
        _1383++;
        continue;
      }
      uvec2 _1390 = uvec2(_312 & ivec2(1));
      uint _1395 = (_1390.x + (_1390.y * 2u)) & 3u;
      uint _1397;
      _1397 = 0u;
      uint _1398;
      uint _1400 = 0u;
      for (;;) {
        bool _1408;
        if (_1400 < 8u) {
          _1408 = _1397 < 8u;
        } else {
          _1408 = false;
        }
        if (_1408) {
          uvec4 _1420 = texelFetch(rdi_reservoir_tex, ivec2(uvec2((_312 / ivec2(2)) + spatial_resolve_offsets.spatial_resolve_offsets_array[((_1395 * 16u) + _1400) + 256u].xy)), int(0u));
          uint _1422 = _1420.x;
          bool _1428;
          if (any(notEqual(_1420.xy, uvec2(0u)))) {
            _1428 = _1422 < _Globals.lantern_count;
          } else {
            _1428 = false;
          }
          bool _1434;
          if (_1428) {
            _1434 = _307[0u] != _1422;
          } else {
            _1434 = false;
          }
          bool _1440;
          if (_1434) {
            _1440 = _307[1u] != _1422;
          } else {
            _1440 = false;
          }
          bool _1446;
          if (_1440) {
            _1446 = _307[2u] != _1422;
          } else {
            _1446 = false;
          }
          bool _1452;
          if (_1446) {
            _1452 = _307[3u] != _1422;
          } else {
            _1452 = false;
          }
          bool _1458;
          if (_1452) {
            _1458 = _307[4u] != _1422;
          } else {
            _1458 = false;
          }
          bool _1464;
          if (_1458) {
            _1464 = _307[5u] != _1422;
          } else {
            _1464 = false;
          }
          bool _1470;
          if (_1464) {
            _1470 = _307[6u] != _1422;
          } else {
            _1470 = false;
          }
          bool _1476;
          if (_1470) {
            _1476 = _307[7u] != _1422;
          } else {
            _1476 = false;
          }
          if (_1476) {
            _307[_1397] = _1422;
            _1398 = _1397 + 1u;
          } else {
            _1398 = _1397;
          }
          _1397 = _1398;
          _1400++;
          continue;
        } else {
          break;
        }
      }
      uint _1482;
      _1482 = _1397;
      uint _1483;
      for (uint _1485 = 0u; _1485 < 8u; _1482 = _1483, _1485++) {
        uint _1492 = subgroupQuadSwapDiagonal(_307[_1485]);
        bool _1497;
        if (_1492 < _Globals.lantern_count) {
          _1497 = _1482 < 8u;
        } else {
          _1497 = false;
        }
        if (_1497) {
          bool _1508;
          if (_307[0u] != _1492) {
            _1508 = _307[1u] != _1492;
          } else {
            _1508 = false;
          }
          bool _1514;
          if (_1508) {
            _1514 = _307[2u] != _1492;
          } else {
            _1514 = false;
          }
          bool _1520;
          if (_1514) {
            _1520 = _307[3u] != _1492;
          } else {
            _1520 = false;
          }
          bool _1526;
          if (_1520) {
            _1526 = _307[4u] != _1492;
          } else {
            _1526 = false;
          }
          bool _1532;
          if (_1526) {
            _1532 = _307[5u] != _1492;
          } else {
            _1532 = false;
          }
          bool _1538;
          if (_1532) {
            _1538 = _307[6u] != _1492;
          } else {
            _1538 = false;
          }
          bool _1544;
          if (_1538) {
            _1544 = _307[7u] != _1492;
          } else {
            _1544 = false;
          }
          uint _1549;
          if (_1544) {
            _307[_1482] = _1492;
            _1549 = _1482 + 1u;
          } else {
            _1549 = _1482;
          }
          _1483 = _1549;
        } else {
          _1483 = _1482;
        }
      }
      Reservoir1sppStreamState _308[2];
      Reservoir1spp _309[2];
      for (uint _1551 = 0u; _1551 < 2u;) {
        _308[_1551] = Reservoir1sppStreamState(0.0, 0.0);
        _309[_1551] = Reservoir1spp(0.0, 0u, 0.0, 0.0);
        _1551++;
        continue;
      }
      for (uint _1559 = 0u; _1559 < _1482; _1559++) {
        vec2 _1572 = unpackHalf2x16(lantern_buf._m0[_307[_1559]].intensity_color_id & 65535u);
        float _1573 = _1572.x;
        uint _1575 = lantern_buf._m0[_307[_1559]].intensity_color_id >> 16u;
        vec3 _1576 = lantern_buf._m0[_307[_1559]].position - _403;
        float _1578 = dot(_1576, _1576);
        vec3 _1585 = _1576 + vec3(0.0, 0.1500000059604644775390625, 0.0);
        vec3 _1630;
        do {
          if (_1575 == 0u) {
            float _1627 = spvNMax(1.0000000133514319600180897396058e-10, 0.7919800281524658203125);
            _1630 = vec3(0.7919800281524658203125, 0.63358402252197265625, 0.07919800281524658203125) / vec3(_1627);
            break;
          } else {
            if (_1575 == 1u) {
              float _1624 = spvNMax(1.0000000133514319600180897396058e-10, 0.215240001678466796875);
              _1630 = vec3(0.0, 0.1583960056304931640625, 0.7919800281524658203125) / vec3(_1624);
              break;
            } else {
              if (_1575 == 2u) {
                float _1621 = spvNMax(1.0000000133514319600180897396058e-10, 0.772159993648529052734375);
                _1630 = vec3(0.1583960056304931640625, 0.7919800281524658203125, 0.1583960056304931640625) / vec3(_1621);
                break;
              } else {
                if (_1575 == 3u) {
                  float _1618 = spvNMax(1.0000000133514319600180897396058e-10, 0.279020011425018310546875);
                  _1630 = vec3(0.23759402334690093994140625, 0.1583960056304931640625, 0.7919800281524658203125) / vec3(_1618);
                  break;
                } else {
                  float _1615 = spvNMax(1.0000000133514319600180897396058e-10, 0.4343800246715545654296875);
                  _1630 = vec3(0.7919800281524658203125, 0.23759402334690093994140625, 0.07919800281524658203125) / vec3(_1615);
                  break;
                }
                break;  // unreachable workaround
              }
              break;  // unreachable workaround
            }
            break;  // unreachable workaround
          }
          break;  // unreachable workaround
        } while (false);
        float _1634 = dot(((_1630 * 4.0) * _1573) * ((spvNMax(0.0, dot(_370, _1576 / vec3(length(_1576)))) * ((1.0 / (0.3359999954700469970703125 + _1578)) * smoothstep(36.0 * _1573, 16.0 * _1573, _1578))) * smoothstep(-0.5, 0.20000000298023223876953125, (_1585 / vec3(length(_1585))).y)), vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
        float _1635 = float(_1482);
        float _1639 = fract(_499 + (float(_1559) / _1635));
        if (_309[0].w_sum <= _309[1].w_sum) {
          do {
            _308[0].M_sum += 1.0;
            float _1678 = _1634 * _1635;
            bool _1693;
            do {
              _309[0].w_sum += _1678;
              _309[0].M += 1.0;
              if ((_1678 / _309[0].w_sum) >= _1639) {
                _309[0].payload = _307[_1559];
                _1693 = true;
                break;
              } else {
                _1693 = false;
                break;
              }
              break;  // unreachable workaround
            } while (false);
            if (_1693) {
              _308[0].p_q_sel = _1634;
              break;
            } else {
              break;
            }
            break;  // unreachable workaround
          } while (false);
        } else {
          do {
            _308[1].M_sum += 1.0;
            float _1653 = _1634 * _1635;
            bool _1668;
            do {
              _309[1].w_sum += _1653;
              _309[1].M += 1.0;
              if ((_1653 / _309[1].w_sum) >= _1639) {
                _309[1].payload = _307[_1559];
                _1668 = true;
                break;
              } else {
                _1668 = false;
                break;
              }
              break;  // unreachable workaround
            } while (false);
            if (_1668) {
              _308[1].p_q_sel = _1634;
              break;
            } else {
              break;
            }
            break;  // unreachable workaround
          } while (false);
        }
      }
      for (uint _1699 = 1u; _1699 < 2u;) {
        _308[0].M_sum += _308[_1699].M_sum;
        _1699++;
        continue;
      }
      for (uint _1710 = 1u; _1710 < 2u;) {
        _308[_1710].M_sum = _308[0].M_sum;
        _1710++;
        continue;
      }
      vec3 _1726;
      _1726 = _808;
      float _1720;
      float _1723;
      float _1725;
      vec3 _1727;
      uint _1731;
      uint _1733;
      bool _1735;
      bool _1737;
      float _1719;
      float _1722;
      float _1724;
      uint _1728 = 0u;
      uint _1730;
      uint _1732;
      bool _1734 = false;
      bool _1736 = false;
      for (; _1728 < 2u; _1719 = _1720, _1722 = _1723, _1724 = _1725, _1726 = _1727, _1728++, _1730 = _1731, _1732 = _1733, _1734 = _1735, _1736 = _1737) {
        _309[_1728].M = _308[_1728].M_sum;
        _309[_1728].W = _309[_1728].w_sum / spvNMax(9.9999999392252902907785028219223e-09, _309[_1728].M * _308[_1728].p_q_sel);
        if (_309[_1728].W > 0.0) {
          vec2 _1764 = unpackHalf2x16(lantern_buf._m0[_309[_1728].payload].intensity_color_id & 65535u);
          float _1765 = _1764.x;
          uint _1767 = lantern_buf._m0[_309[_1728].payload].intensity_color_id >> 16u;
          vec3 _1768 = lantern_buf._m0[_309[_1728].payload].position - _403;
          float _1769 = length(_1768);
          float _1770 = dot(_1768, _1768);
          vec3 _1777 = _1768 + vec3(0.0, 0.1500000059604644775390625, 0.0);
          vec3 _1783 = vec3(_1769);
          vec3 _1822;
          do {
            if (_1767 == 0u) {
              float _1819 = spvNMax(1.0000000133514319600180897396058e-10, 0.7919800281524658203125);
              _1822 = vec3(0.7919800281524658203125, 0.63358402252197265625, 0.07919800281524658203125) / vec3(_1819);
              break;
            } else {
              if (_1767 == 1u) {
                float _1816 = spvNMax(1.0000000133514319600180897396058e-10, 0.215240001678466796875);
                _1822 = vec3(0.0, 0.1583960056304931640625, 0.7919800281524658203125) / vec3(_1816);
                break;
              } else {
                if (_1767 == 2u) {
                  float _1813 = spvNMax(1.0000000133514319600180897396058e-10, 0.772159993648529052734375);
                  _1822 = vec3(0.1583960056304931640625, 0.7919800281524658203125, 0.1583960056304931640625) / vec3(_1813);
                  break;
                } else {
                  if (_1767 == 3u) {
                    float _1810 = spvNMax(1.0000000133514319600180897396058e-10, 0.279020011425018310546875);
                    _1822 = vec3(0.23759402334690093994140625, 0.1583960056304931640625, 0.7919800281524658203125) / vec3(_1810);
                    break;
                  } else {
                    float _1807 = spvNMax(1.0000000133514319600180897396058e-10, 0.4343800246715545654296875);
                    _1822 = vec3(0.7919800281524658203125, 0.23759402334690093994140625, 0.07919800281524658203125) / vec3(_1807);
                    break;
                  }
                  break;  // unreachable workaround
                }
                break;  // unreachable workaround
              }
              break;  // unreachable workaround
            }
            break;  // unreachable workaround
          } while (false);
          vec3 _1825 = ((_1822 * 4.0) * _1765) * ((spvNMax(0.0, dot(_370, _1768 / _1783)) * ((1.0 / (0.3359999954700469970703125 + _1770)) * smoothstep(36.0 * _1765, 16.0 * _1765, _1770))) * smoothstep(-0.5, 0.20000000298023223876953125, (_1777 / vec3(length(_1777))).y));
          float _2269;
          float _2270;
          float _2271;
          uint _2272;
          uint _2273;
          bool _2274;
          bool _2275;
          vec3 _2276;
          if ((_309[_1728].W * spvNMax(spvNMax(_1825.x, _1825.y), _1825.z)) > 0.0) {
            float _2084;
            float _2085;
            float _2086;
            vec3 _2087;
            if (_1769 > 0.5) {
              vec3 _1845 = (_403 + ((_1768 * (_1769 - 0.5)) / _1783)) + (_370 * (0.0199999995529651641845703125 * _328.y));
              vec3 _1846 = _394.xyz;
              vec4 _1856 = (vec4(_1845, 1.0) * frame_constants.view_constants[0u].world_to_view) * frame_constants.view_constants[0u].view_to_sample;
              vec3 _1860 = _1856.xyz / vec3(_1856.w);
              vec4 _1871 = _394 + (vec4(_1860 - _1846, 0.0) * float(int(sign(_1860.z))));
              float _1872 = _1871.w;
              vec3 _1881 = (_1871 / vec4(float((_1872 >= 0.0) ? 1 : (-1)) * spvNMax(1.0000000133514319600180897396058e-10, abs(_1872)))).xyz;
              vec3 _1882 = _1881 - _1846;
              vec3 _1886 = (mix(vec3(-1.0, -1.0, 0.0), vec3(1.0), lessThan(_1882, vec3(0.0))) - _1846) / _1882;
              vec3 _1892 = _1846 + (_1882 * spvNMax(0.0, spvNMax(_1886.x, _1886.y)));
              vec3 _1893 = _1881 - _1892;
              vec3 _1897 = (mix(vec3(-1.0, -1.0, 0.0), vec3(1.0), greaterThanEqual(_1893, vec3(0.0))) - _1892) / _1893;
              vec3 _1905 = _1892 + (_1893 * spvNMin(1.0, spvNMin(spvNMin(_1897.x, _1897.y), _1897.z)));
              float _2036;
              float _2037;
              float _2038;
              bool _2051;
              float _2052;
              float _2053;
              do {
                float _1926 = 0.800000011920928955078125 * frame_constants.view_constants[0u].clip_to_view[3].z;
                uint _1927 = uint(int(max(2u, min(4u, uint(int(floor(length((((_1905.xy * vec2(0.5, -0.5)) + vec2(0.5)) - ((_1892.xy * vec2(0.5, -0.5)) + vec2(0.5))) * _379))))))));
                float _2031;
                float _2035;
                bool _2039;
                do {
                  vec3 _1932 = _1905 - _1892;
                  float _1940;
                  if (_1905.z > 9.5367431640625e-07) {
                    _1940 = float(_1927);
                  } else {
                    _1940 = spvNMax(1.0, float(_1927) - 1.0);
                  }
                  float _1941 = 1.0 / _1940;
                  float _2026;
                  float _2027;
                  float _2028;
                  float _2029;
                  bool _2030;
                  if (_1927 > 0u) {
                    float _1947 = mix(0.0, 1.0, pow(_499 * _1941, 1.0));
                    vec3 _1949 = _1892 + (_1932 * _1947);
                    vec2 _1952 = (_1949.xy * vec2(0.5, -0.5)) + vec2(0.5);
                    float _1954 = 1.0 / _1949.z;
                    float _1959 = 1.0 / textureLod(sampler2D(depth_tex, sampler_llc), _1952, 0.0).x;
                    float _1963 = 1.0 / textureLod(sampler2D(depth_tex, sampler_nnc), _1952, 0.0).x;
                    float _1967 = (spvNMax(_1959, _1963) * 1.00000202655792236328125) - _1954;
                    float _1968 = _1954 - spvNMin(_1959, _1963);
                    bool _1971 = (_1967 < 0.0) ? (_1968 < _1926) : false;
                    float _2020;
                    float _2021;
                    float _2022;
                    float _2023;
                    bool _2024;
                    float _2025;
                    if (_1971) {
                      _2020 = _1967;
                      _2021 = _1968;
                      _2022 = _1926;
                      _2023 = _1947;
                      _2024 = _1971;
                      _2025 = 0.0;
                    } else {
                      float _1981;
                      _1981 = _1947;
                      bool _1980;
                      float _1982;
                      float _2015;
                      float _2016;
                      float _2017;
                      float _2018;
                      bool _2019;
                      uint _1976 = 1u;
                      bool _1979 = _1971;
                      for (;;) {
                        if (_1976 < _1927) {
                          _1982 = mix(0.0, 1.0, spvNMin(0.9999847412109375, pow((float(_1976) + _499) * _1941, 1.0)));
                          vec3 _1992 = _1892 + (_1932 * _1982);
                          vec2 _1995 = (_1992.xy * vec2(0.5, -0.5)) + vec2(0.5);
                          float _1997 = 1.0 / _1992.z;
                          float _2001 = 1.0 / textureLod(sampler2D(depth_tex, sampler_llc), _1995, 0.0).x;
                          float _2005 = 1.0 / textureLod(sampler2D(depth_tex, sampler_nnc), _1995, 0.0).x;
                          float _2009 = (spvNMax(_2001, _2005) * 1.00000202655792236328125) - _1997;
                          float _2010 = _1997 - spvNMin(_2001, _2005);
                          _1980 = (_2009 < 0.0) ? (_2010 < _1926) : false;
                          if (_1980) {
                            _2015 = _2009;
                            _2016 = _2010;
                            _2017 = _1926;
                            _2018 = _1982;
                            _2019 = _1980;
                            break;
                          }
                          _1976++;
                          _1979 = _1980;
                          _1981 = _1982;
                          continue;
                        } else {
                          _2015 = 0.0;
                          _2016 = 0.0;
                          _2017 = 0.0;
                          _2018 = 1.0;
                          _2019 = _1979;
                          break;
                        }
                      }
                      _2020 = _2015;
                      _2021 = _2016;
                      _2022 = _2017;
                      _2023 = _2018;
                      _2024 = _2019;
                      _2025 = _1981;
                    }
                    _2026 = _2020;
                    _2027 = _2021;
                    _2028 = _2022;
                    _2029 = _2023;
                    _2030 = _2024;
                    _2031 = _2025;
                  } else {
                    _2026 = 0.0;
                    _2027 = 0.0;
                    _2028 = 0.0;
                    _2029 = 1.0;
                    _2030 = false;
                    _2031 = 0.0;
                  }
                  if (_2030) {
                    _2035 = _2029;
                    _2036 = _2026;
                    _2037 = _2028;
                    _2038 = _2027;
                    _2039 = true;
                    break;
                  } else {
                    _2035 = _2031;
                    _2036 = _1719;
                    _2037 = _1722;
                    _2038 = _1724;
                    _2039 = false;
                    break;
                  }
                  break;  // unreachable workaround
                } while (false);
                bool _2047;
                if (_2039) {
                  bool _2046;
                  if (_2038 < _2037) {
                    _2046 = _2036 < _2037;
                  } else {
                    _2046 = false;
                  }
                  _2047 = _2046;
                } else {
                  _2047 = false;
                }
                if (_2047) {
                  _2051 = true;
                  _2052 = _2035;
                  _2053 = _2038 / frame_constants.view_constants[0u].clip_to_view[3].z;
                  break;
                }
                _2051 = false;
                _2052 = _2031;
                _2053 = 0.0;
                break;
              } while (false);
              vec3 _2083;
              if (_2051) {
                vec4 _2063 = (vec4(mix(_1892, _1905, vec3(_2052)), 1.0) * frame_constants.view_constants[0u].sample_to_view) * frame_constants.view_constants[0u].view_to_world;
                vec3 _2070 = ((_2063.xyz / vec3(_2063.w)) + (_399 * _2053)) - lantern_buf._m0[_309[_1728].payload].position;
                bool _2080;
                if (!(abs(_2070.y) > 0.5)) {
                  vec2 _2077 = _2070.xz;
                  _2080 = dot(_2077, _2077) > 0.136900007724761962890625;
                } else {
                  _2080 = true;
                }
                _2083 = mix(_1825, vec3(0.0), bvec3(_2080));
              } else {
                _2083 = _1825;
              }
              _2084 = _2036;
              _2085 = _2037;
              _2086 = _2038;
              _2087 = _2083;
            } else {
              _2084 = _1719;
              _2085 = _1722;
              _2086 = _1724;
              _2087 = _1825;
            }
            vec2 _2097 = vec2((float(frame_constants.game_time_sec) + frame_constants.game_time_frac) * 4.0, float(_309[_1728].payload * 10u));
            ivec2 _2099 = ivec2(floor(_2097));
            vec2 _2100 = fract(_2097);
            uvec2 _2101 = uvec2(_2099);
            uint _2103 = _2101.y;
            uint _2105 = _2103 + (_2103 << 10u);
            uint _2107 = _2105 ^ (_2105 >> 6u);
            uint _2109 = _2107 + (_2107 << 3u);
            uint _2111 = _2109 ^ (_2109 >> 11u);
            uint _2117 = (((_2101.x * 1664525u) + (_2111 + (_2111 << 15u))) + 1013904223u) * 1664525u;
            uint _2119 = _2117 ^ (_2117 >> 11u);
            uint _2122 = _2119 ^ ((_2119 << 7u) & 2636928640u);
            uint _2125 = _2122 ^ ((_2122 << 15u) & 4022730752u);
            bool _2128 = _1736 ? _1736 : true;
            uint _2129 = _1736 ? _1732 : 8388607u;
            bool _2130 = _1734 ? _1734 : true;
            uint _2131 = _1734 ? _1730 : 1065353216u;
            uvec2 _2137 = uvec2(_2099 + ivec2(1, 0));
            uint _2139 = _2137.y;
            uint _2141 = _2139 + (_2139 << 10u);
            uint _2143 = _2141 ^ (_2141 >> 6u);
            uint _2145 = _2143 + (_2143 << 3u);
            uint _2147 = _2145 ^ (_2145 >> 11u);
            uint _2153 = (((_2137.x * 1664525u) + (_2147 + (_2147 << 15u))) + 1013904223u) * 1664525u;
            uint _2155 = _2153 ^ (_2153 >> 11u);
            uint _2158 = _2155 ^ ((_2155 << 7u) & 2636928640u);
            uint _2161 = _2158 ^ ((_2158 << 15u) & 4022730752u);
            bool _2164 = _2128 ? _2128 : true;
            uint _2165 = _2128 ? _2129 : 8388607u;
            bool _2166 = _2130 ? _2130 : true;
            uint _2167 = _2130 ? _2131 : 1065353216u;
            uvec2 _2173 = uvec2(_2099 + ivec2(0, 1));
            uint _2175 = _2173.y;
            uint _2177 = _2175 + (_2175 << 10u);
            uint _2179 = _2177 ^ (_2177 >> 6u);
            uint _2181 = _2179 + (_2179 << 3u);
            uint _2183 = _2181 ^ (_2181 >> 11u);
            uint _2189 = (((_2173.x * 1664525u) + (_2183 + (_2183 << 15u))) + 1013904223u) * 1664525u;
            uint _2191 = _2189 ^ (_2189 >> 11u);
            uint _2194 = _2191 ^ ((_2191 << 7u) & 2636928640u);
            uint _2197 = _2194 ^ ((_2194 << 15u) & 4022730752u);
            bool _2200 = _2164 ? _2164 : true;
            uint _2201 = _2164 ? _2165 : 8388607u;
            bool _2202 = _2166 ? _2166 : true;
            uint _2203 = _2166 ? _2167 : 1065353216u;
            uvec2 _2209 = uvec2(_2099 + ivec2(1));
            uint _2211 = _2209.y;
            uint _2213 = _2211 + (_2211 << 10u);
            uint _2215 = _2213 ^ (_2213 >> 6u);
            uint _2217 = _2215 + (_2215 << 3u);
            uint _2219 = _2217 ^ (_2217 >> 11u);
            uint _2225 = (((_2209.x * 1664525u) + (_2219 + (_2219 << 15u))) + 1013904223u) * 1664525u;
            uint _2227 = _2225 ^ (_2225 >> 11u);
            uint _2230 = _2227 ^ ((_2227 << 7u) & 2636928640u);
            uint _2233 = _2230 ^ ((_2230 << 15u) & 4022730752u);
            uint _2237 = _2200 ? _2201 : 8388607u;
            uint _2239 = _2202 ? _2203 : 1065353216u;
            vec2 _2247 = (_2100 * _2100) * (vec2(3.0) - (_2100 * 2.0));
            float _2248 = _2247.x;
            float _2249 = 1.0 - _2248;
            float _2251 = _2247.y;
            _2269 = _2084;
            _2270 = _2085;
            _2271 = _2086;
            _2272 = _2239;
            _2273 = _2237;
            _2274 = _2202 ? _2202 : true;
            _2275 = _2200 ? _2200 : true;
            _2276 = (((_2087 * mix(0.5, 1.0, (((1.0 - _2251) * (((uintBitsToFloat(((_2125 ^ (_2125 >> 18u)) & _2129) | _2131) - 1.0) * _2249) + ((uintBitsToFloat(((_2161 ^ (_2161 >> 18u)) & _2165) | _2167) - 1.0) * _2248))) + (((uintBitsToFloat(((_2197 ^ (_2197 >> 18u)) & _2201) | _2203) - 1.0) * _2249) * _2251)) + (((uintBitsToFloat(((_2233 ^ (_2233 >> 18u)) & _2237) | _2239) - 1.0) * _2248) * _2251))) * _309[_1728].W) * _419) * frame_constants.ev_mult;
          } else {
            _2269 = _1719;
            _2270 = _1722;
            _2271 = _1724;
            _2272 = _1730;
            _2273 = _1732;
            _2274 = _1734;
            _2275 = _1736;
            _2276 = vec3(0.0);
          }
          _1720 = _2269;
          _1723 = _2270;
          _1725 = _2271;
          _1727 = _1726 + _2276;
          _1731 = _2272;
          _1733 = _2273;
          _1735 = _2274;
          _1737 = _2275;
        } else {
          _1720 = _1719;
          _1723 = _1722;
          _1725 = _1724;
          _1727 = _1726;
          _1731 = _1730;
          _1733 = _1732;
          _1735 = _1734;
          _1737 = _1736;
        }
      }
      _2278 = _1726;
    } else {
      vec3 _1381;
      if (2u == _832) {
        uint _842 = light_indirection_grid._m0[_826] & 1048575u;
        uint _844 = min(64u, (light_indirection_grid._m0[_826] >> 20u));
        vec3 _846;
        _846 = _808;
        vec3 _847;
        float _850;
        float _852;
        float _854;
        uint _858;
        uint _860;
        bool _862;
        bool _864;
        float _849;
        float _851;
        float _853;
        uint _855 = 0u;
        uint _857;
        uint _859;
        bool _861 = false;
        bool _863 = false;
        for (; _855 < _844; _846 = _847, _849 = _850, _851 = _852, _853 = _854, _855++, _857 = _858, _859 = _860, _861 = _862, _863 = _864) {
          uint _868 = _842 + _855;
          vec2 _876 = unpackHalf2x16(lantern_buf._m0[grid_light_indices_1._m0[_868]].intensity_color_id & 65535u);
          float _877 = _876.x;
          uint _879 = lantern_buf._m0[grid_light_indices_1._m0[_868]].intensity_color_id >> 16u;
          vec3 _880 = lantern_buf._m0[grid_light_indices_1._m0[_868]].position - _403;
          float _881 = length(_880);
          float _882 = dot(_880, _880);
          vec3 _889 = _880 + vec3(0.0, 0.1500000059604644775390625, 0.0);
          vec3 _895 = vec3(_881);
          vec3 _934;
          do {
            if (_879 == 0u) {
              float _931 = spvNMax(1.0000000133514319600180897396058e-10, 0.7919800281524658203125);
              _934 = vec3(0.7919800281524658203125, 0.63358402252197265625, 0.07919800281524658203125) / vec3(_931);
              break;
            } else {
              if (_879 == 1u) {
                float _928 = spvNMax(1.0000000133514319600180897396058e-10, 0.215240001678466796875);
                _934 = vec3(0.0, 0.1583960056304931640625, 0.7919800281524658203125) / vec3(_928);
                break;
              } else {
                if (_879 == 2u) {
                  float _925 = spvNMax(1.0000000133514319600180897396058e-10, 0.772159993648529052734375);
                  _934 = vec3(0.1583960056304931640625, 0.7919800281524658203125, 0.1583960056304931640625) / vec3(_925);
                  break;
                } else {
                  if (_879 == 3u) {
                    float _922 = spvNMax(1.0000000133514319600180897396058e-10, 0.279020011425018310546875);
                    _934 = vec3(0.23759402334690093994140625, 0.1583960056304931640625, 0.7919800281524658203125) / vec3(_922);
                    break;
                  } else {
                    float _919 = spvNMax(1.0000000133514319600180897396058e-10, 0.4343800246715545654296875);
                    _934 = vec3(0.7919800281524658203125, 0.23759402334690093994140625, 0.07919800281524658203125) / vec3(_919);
                    break;
                  }
                  break;  // unreachable workaround
                }
                break;  // unreachable workaround
              }
              break;  // unreachable workaround
            }
            break;  // unreachable workaround
          } while (false);
          vec3 _937 = ((_934 * 4.0) * _877) * ((spvNMax(0.0, dot(_370, _880 / _895)) * ((1.0 / (0.3359999954700469970703125 + _882)) * smoothstep(36.0 * _877, 16.0 * _877, _882))) * smoothstep(-0.5, 0.20000000298023223876953125, (_889 / vec3(length(_889))).y));
          vec3 _1380;
          if (spvNMax(spvNMax(_937.x, _937.y), _937.z) > 0.0) {
            float _1195;
            float _1196;
            float _1197;
            vec3 _1198;
            if (_881 > 0.5) {
              vec3 _956 = (_403 + ((_880 * (_881 - 0.5)) / _895)) + (_370 * (0.0199999995529651641845703125 * _328.y));
              vec3 _957 = _394.xyz;
              vec4 _967 = (vec4(_956, 1.0) * frame_constants.view_constants[0u].world_to_view) * frame_constants.view_constants[0u].view_to_sample;
              vec3 _971 = _967.xyz / vec3(_967.w);
              vec4 _982 = _394 + (vec4(_971 - _957, 0.0) * float(int(sign(_971.z))));
              float _983 = _982.w;
              vec3 _992 = (_982 / vec4(float((_983 >= 0.0) ? 1 : (-1)) * spvNMax(1.0000000133514319600180897396058e-10, abs(_983)))).xyz;
              vec3 _993 = _992 - _957;
              vec3 _997 = (mix(vec3(-1.0, -1.0, 0.0), vec3(1.0), lessThan(_993, vec3(0.0))) - _957) / _993;
              vec3 _1003 = _957 + (_993 * spvNMax(0.0, spvNMax(_997.x, _997.y)));
              vec3 _1004 = _992 - _1003;
              vec3 _1008 = (mix(vec3(-1.0, -1.0, 0.0), vec3(1.0), greaterThanEqual(_1004, vec3(0.0))) - _1003) / _1004;
              vec3 _1016 = _1003 + (_1004 * spvNMin(1.0, spvNMin(spvNMin(_1008.x, _1008.y), _1008.z)));
              float _1147;
              float _1148;
              float _1149;
              bool _1162;
              float _1163;
              float _1164;
              do {
                float _1037 = 0.800000011920928955078125 * frame_constants.view_constants[0u].clip_to_view[3].z;
                uint _1038 = uint(int(max(2u, min(4u, uint(int(floor(length((((_1016.xy * vec2(0.5, -0.5)) + vec2(0.5)) - ((_1003.xy * vec2(0.5, -0.5)) + vec2(0.5))) * _379))))))));
                float _1142;
                float _1146;
                bool _1150;
                do {
                  vec3 _1043 = _1016 - _1003;
                  float _1051;
                  if (_1016.z > 9.5367431640625e-07) {
                    _1051 = float(_1038);
                  } else {
                    _1051 = spvNMax(1.0, float(_1038) - 1.0);
                  }
                  float _1052 = 1.0 / _1051;
                  float _1137;
                  float _1138;
                  float _1139;
                  float _1140;
                  bool _1141;
                  if (_1038 > 0u) {
                    float _1058 = mix(0.0, 1.0, pow(_499 * _1052, 1.0));
                    vec3 _1060 = _1003 + (_1043 * _1058);
                    vec2 _1063 = (_1060.xy * vec2(0.5, -0.5)) + vec2(0.5);
                    float _1065 = 1.0 / _1060.z;
                    float _1070 = 1.0 / textureLod(sampler2D(depth_tex, sampler_llc), _1063, 0.0).x;
                    float _1074 = 1.0 / textureLod(sampler2D(depth_tex, sampler_nnc), _1063, 0.0).x;
                    float _1078 = (spvNMax(_1070, _1074) * 1.00000202655792236328125) - _1065;
                    float _1079 = _1065 - spvNMin(_1070, _1074);
                    bool _1082 = (_1078 < 0.0) ? (_1079 < _1037) : false;
                    float _1131;
                    float _1132;
                    float _1133;
                    float _1134;
                    bool _1135;
                    float _1136;
                    if (_1082) {
                      _1131 = _1078;
                      _1132 = _1079;
                      _1133 = _1037;
                      _1134 = _1058;
                      _1135 = _1082;
                      _1136 = 0.0;
                    } else {
                      float _1092;
                      _1092 = _1058;
                      bool _1091;
                      float _1093;
                      float _1126;
                      float _1127;
                      float _1128;
                      float _1129;
                      bool _1130;
                      uint _1087 = 1u;
                      bool _1090 = _1082;
                      for (;;) {
                        if (_1087 < _1038) {
                          _1093 = mix(0.0, 1.0, spvNMin(0.9999847412109375, pow((float(_1087) + _499) * _1052, 1.0)));
                          vec3 _1103 = _1003 + (_1043 * _1093);
                          vec2 _1106 = (_1103.xy * vec2(0.5, -0.5)) + vec2(0.5);
                          float _1108 = 1.0 / _1103.z;
                          float _1112 = 1.0 / textureLod(sampler2D(depth_tex, sampler_llc), _1106, 0.0).x;
                          float _1116 = 1.0 / textureLod(sampler2D(depth_tex, sampler_nnc), _1106, 0.0).x;
                          float _1120 = (spvNMax(_1112, _1116) * 1.00000202655792236328125) - _1108;
                          float _1121 = _1108 - spvNMin(_1112, _1116);
                          _1091 = (_1120 < 0.0) ? (_1121 < _1037) : false;
                          if (_1091) {
                            _1126 = _1120;
                            _1127 = _1121;
                            _1128 = _1037;
                            _1129 = _1093;
                            _1130 = _1091;
                            break;
                          }
                          _1087++;
                          _1090 = _1091;
                          _1092 = _1093;
                          continue;
                        } else {
                          _1126 = 0.0;
                          _1127 = 0.0;
                          _1128 = 0.0;
                          _1129 = 1.0;
                          _1130 = _1090;
                          break;
                        }
                      }
                      _1131 = _1126;
                      _1132 = _1127;
                      _1133 = _1128;
                      _1134 = _1129;
                      _1135 = _1130;
                      _1136 = _1092;
                    }
                    _1137 = _1131;
                    _1138 = _1132;
                    _1139 = _1133;
                    _1140 = _1134;
                    _1141 = _1135;
                    _1142 = _1136;
                  } else {
                    _1137 = 0.0;
                    _1138 = 0.0;
                    _1139 = 0.0;
                    _1140 = 1.0;
                    _1141 = false;
                    _1142 = 0.0;
                  }
                  if (_1141) {
                    _1146 = _1140;
                    _1147 = _1137;
                    _1148 = _1139;
                    _1149 = _1138;
                    _1150 = true;
                    break;
                  } else {
                    _1146 = _1142;
                    _1147 = _849;
                    _1148 = _851;
                    _1149 = _853;
                    _1150 = false;
                    break;
                  }
                  break;  // unreachable workaround
                } while (false);
                bool _1158;
                if (_1150) {
                  bool _1157;
                  if (_1149 < _1148) {
                    _1157 = _1147 < _1148;
                  } else {
                    _1157 = false;
                  }
                  _1158 = _1157;
                } else {
                  _1158 = false;
                }
                if (_1158) {
                  _1162 = true;
                  _1163 = _1146;
                  _1164 = _1149 / frame_constants.view_constants[0u].clip_to_view[3].z;
                  break;
                }
                _1162 = false;
                _1163 = _1142;
                _1164 = 0.0;
                break;
              } while (false);
              vec3 _1194;
              if (_1162) {
                vec4 _1174 = (vec4(mix(_1003, _1016, vec3(_1163)), 1.0) * frame_constants.view_constants[0u].sample_to_view) * frame_constants.view_constants[0u].view_to_world;
                vec3 _1181 = ((_1174.xyz / vec3(_1174.w)) + (_399 * _1164)) - lantern_buf._m0[grid_light_indices_1._m0[_868]].position;
                bool _1191;
                if (!(abs(_1181.y) > 0.5)) {
                  _1191 = dot(_1181.xz, _1181.xz) > 0.136900007724761962890625;
                } else {
                  _1191 = true;
                }
                _1194 = mix(_937, vec3(0.0), bvec3(_1191));
              } else {
                _1194 = _937;
              }
              _1195 = _1147;
              _1196 = _1148;
              _1197 = _1149;
              _1198 = _1194;
            } else {
              _1195 = _849;
              _1196 = _851;
              _1197 = _853;
              _1198 = _937;
            }
            vec2 _1208 = vec2((float(frame_constants.game_time_sec) + frame_constants.game_time_frac) * 4.0, float(grid_light_indices_1._m0[_868] * 10u));
            ivec2 _1210 = ivec2(floor(_1208));
            vec2 _1211 = fract(_1208);
            uvec2 _1212 = uvec2(_1210);
            uint _1214 = _1212.y;
            uint _1216 = _1214 + (_1214 << 10u);
            uint _1218 = _1216 ^ (_1216 >> 6u);
            uint _1220 = _1218 + (_1218 << 3u);
            uint _1222 = _1220 ^ (_1220 >> 11u);
            uint _1228 = (((_1212.x * 1664525u) + (_1222 + (_1222 << 15u))) + 1013904223u) * 1664525u;
            uint _1230 = _1228 ^ (_1228 >> 11u);
            uint _1233 = _1230 ^ ((_1230 << 7u) & 2636928640u);
            uint _1236 = _1233 ^ ((_1233 << 15u) & 4022730752u);
            bool _1239 = _863 ? _863 : true;
            uint _1240 = _863 ? _859 : 8388607u;
            bool _1241 = _861 ? _861 : true;
            uint _1242 = _861 ? _857 : 1065353216u;
            uvec2 _1248 = uvec2(_1210 + ivec2(1, 0));
            uint _1250 = _1248.y;
            uint _1252 = _1250 + (_1250 << 10u);
            uint _1254 = _1252 ^ (_1252 >> 6u);
            uint _1256 = _1254 + (_1254 << 3u);
            uint _1258 = _1256 ^ (_1256 >> 11u);
            uint _1264 = (((_1248.x * 1664525u) + (_1258 + (_1258 << 15u))) + 1013904223u) * 1664525u;
            uint _1266 = _1264 ^ (_1264 >> 11u);
            uint _1269 = _1266 ^ ((_1266 << 7u) & 2636928640u);
            uint _1272 = _1269 ^ ((_1269 << 15u) & 4022730752u);
            bool _1275 = _1239 ? _1239 : true;
            uint _1276 = _1239 ? _1240 : 8388607u;
            bool _1277 = _1241 ? _1241 : true;
            uint _1278 = _1241 ? _1242 : 1065353216u;
            uvec2 _1284 = uvec2(_1210 + ivec2(0, 1));
            uint _1286 = _1284.y;
            uint _1288 = _1286 + (_1286 << 10u);
            uint _1290 = _1288 ^ (_1288 >> 6u);
            uint _1292 = _1290 + (_1290 << 3u);
            uint _1294 = _1292 ^ (_1292 >> 11u);
            uint _1300 = (((_1284.x * 1664525u) + (_1294 + (_1294 << 15u))) + 1013904223u) * 1664525u;
            uint _1302 = _1300 ^ (_1300 >> 11u);
            uint _1305 = _1302 ^ ((_1302 << 7u) & 2636928640u);
            uint _1308 = _1305 ^ ((_1305 << 15u) & 4022730752u);
            bool _1311 = _1275 ? _1275 : true;
            uint _1312 = _1275 ? _1276 : 8388607u;
            bool _1313 = _1277 ? _1277 : true;
            uint _1314 = _1277 ? _1278 : 1065353216u;
            uvec2 _1320 = uvec2(_1210 + ivec2(1));
            uint _1322 = _1320.y;
            uint _1324 = _1322 + (_1322 << 10u);
            uint _1326 = _1324 ^ (_1324 >> 6u);
            uint _1328 = _1326 + (_1326 << 3u);
            uint _1330 = _1328 ^ (_1328 >> 11u);
            uint _1336 = (((_1320.x * 1664525u) + (_1330 + (_1330 << 15u))) + 1013904223u) * 1664525u;
            uint _1338 = _1336 ^ (_1336 >> 11u);
            uint _1341 = _1338 ^ ((_1338 << 7u) & 2636928640u);
            uint _1344 = _1341 ^ ((_1341 << 15u) & 4022730752u);
            uint _1348 = _1311 ? _1312 : 8388607u;
            uint _1350 = _1313 ? _1314 : 1065353216u;
            vec2 _1358 = (_1211 * _1211) * (vec2(3.0) - (_1211 * 2.0));
            float _1359 = _1358.x;
            float _1360 = 1.0 - _1359;
            float _1362 = _1358.y;
            _850 = _1195;
            _852 = _1196;
            _854 = _1197;
            _858 = _1350;
            _860 = _1348;
            _862 = _1313 ? _1313 : true;
            _864 = _1311 ? _1311 : true;
            _1380 = (((_1198 * mix(0.5, 1.0, (((1.0 - _1362) * (((uintBitsToFloat(((_1236 ^ (_1236 >> 18u)) & _1240) | _1242) - 1.0) * _1360) + ((uintBitsToFloat(((_1272 ^ (_1272 >> 18u)) & _1276) | _1278) - 1.0) * _1359))) + (((uintBitsToFloat(((_1308 ^ (_1308 >> 18u)) & _1312) | _1314) - 1.0) * _1360) * _1362)) + (((uintBitsToFloat(((_1344 ^ (_1344 >> 18u)) & _1348) | _1350) - 1.0) * _1359) * _1362))) * 1.0) * _419) * frame_constants.ev_mult;
          } else {
            _850 = _849;
            _852 = _851;
            _854 = _853;
            _858 = _857;
            _860 = _859;
            _862 = _861;
            _864 = _863;
            _1380 = vec3(0.0);
          }
          _847 = _846 + _1380;
        }
        _1381 = _846;
      } else {
        _1381 = _808;
      }
      _2278 = _1381;
    }
    _2279 = _2278;
  } else {
    _2279 = _808;
  }
  out_var_SV_TARGET = vec4(_2279, 0.0);
  out_var_SV_TARGET.rgb = vec3(5, 5, 0);
}

