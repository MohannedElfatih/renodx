#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_samplerless_texture_functions : require

layout(set = 0, binding = 13, scalar) uniform type_Globals {
  uint transform_image;
  uvec2 framebuffer_dims;
}
_Globals;

layout(set = 0, binding = 14) uniform Texture2DMS input_tex;

layout(location = 0) out vec4 out_var_SV_TARGET;

void main() {
  ivec2 _58 = ivec2(gl_FragCoord.xy);
  ivec2 _75;
  if ((_Globals.transform_image & 1u) != 0u) {
    ivec2 _74 = _58;
    _74.y = int((_Globals.framebuffer_dims.y - 1u) - uint(_58.y));
    _75 = _74;
  } else {
    _75 = _58;
  }
  uvec2 _76 = uvec2(_75);
  uint w, h, samples;
  input_tex.GetDimensions(w, h, samples);
  uint _77 = uint(samples);
  vec3 _84;
  if (0u < _77) {
    _84 = input_tex.Load(int2(_76), 0).xyz;
  } else {
    _84 = vec3(0.0);
  }
  vec3 _92;
  if (1u < _77) {
    _92 = _84 + input_tex.Load(int2(_76), 1).xyz;
  } else {
    _92 = _84;
  }
  vec3 _100;
  if (2u < _77) {
    _100 = _92 + input_tex.Load(int2(_76), 2).xyz;
  } else {
    _100 = _92;
  }
  vec3 _108;
  if (3u < _77) {
    _108 = _100 + input_tex.Load(int2(_76), 3).xyz;
  } else {
    _108 = _100;
  }
  vec3 _111 = _108 / vec3(float(_77));
  float _112 = _111.x;
  float _121;
  if (0.003130800090730190277099609375 >= _112) {
    _121 = 12.9200000762939453125 * _112;
  } else {
    _121 = (1.05499994754791259765625 * pow(_112, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
  }
  float _122 = _111.y;
  float _131;
  if (0.003130800090730190277099609375 >= _122) {
    _131 = 12.9200000762939453125 * _122;
  } else {
    _131 = (1.05499994754791259765625 * pow(_122, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
  }
  float _132 = _111.z;
  float _141;
  if (0.003130800090730190277099609375 >= _132) {
    _141 = 12.9200000762939453125 * _132;
  } else {
    _141 = (1.05499994754791259765625 * pow(_132, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
  }
  out_var_SV_TARGET = vec4(_111, 1.0);
}

