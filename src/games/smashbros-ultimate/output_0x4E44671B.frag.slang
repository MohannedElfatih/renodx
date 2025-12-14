#version 450
#extension GL_EXT_scalar_block_layout : require

layout(set = 0, binding = 1, scalar) uniform fs_cbuf_block_4f {
  float data[16384];
}
c3;

layout(set = 0, binding = 2, scalar) uniform c10 {
  float data[16384];
}
c10_1;

layout(set = 0, binding = 3) uniform sampler2D fs_tex2_20;

layout(location = 2) in vec4 in_attr2;
layout(location = 0) out vec4 frag_color0;

void main() {
  precise float _53 = c3.data[84u] * 1920.0;
  precise float _58 = c3.data[85u] * 1080.0;
  precise float _72 = in_attr2.x * c3.data[84u];
  precise float _75 = in_attr2.y * c3.data[85u];
  vec4 _82 = texture(fs_tex2_20, vec2(max(min(fma(floor(_53), 0.0005208333604969084262847900390625, -0.0005208333604969084262847900390625), _72), 0.0005208333604969084262847900390625), max(min(fma(floor(_58), 0.000925925909541547298431396484375, -0.000925925909541547298431396484375), _75), 0.000925925909541547298431396484375)));
  precise float _96 = log2(abs(_82.x)) * c10_1.data[51u];
  precise float _99 = log2(abs(_82.y)) * c10_1.data[51u];
  precise float _102 = log2(abs(_82.z)) * c10_1.data[51u];
  frag_color0.x = exp2(_96);
  frag_color0.y = exp2(_99);
  frag_color0.z = exp2(_102);
  frag_color0.w = _82.w;
}

