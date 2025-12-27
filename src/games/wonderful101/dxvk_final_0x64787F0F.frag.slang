// Specialization Constants
[[vk::constant_id(6)]]
const bool c_composite_hud = false;
[[vk::constant_id(7)]]
const bool c_composite_cursor = false;
[[vk::constant_id(2)]]
const uint c_src_color_space = 0u;
[[vk::constant_id(3)]]
const bool c_src_is_srgb = true;
[[vk::constant_id(1)]]
const bool c_gamma = false;
[[vk::constant_id(4)]]
const uint c_dst_color_space = 0u;
[[vk::constant_id(5)]]
const bool c_dst_is_srgb = true;
[[vk::constant_id(0)]]
const uint c_samples = 0u;

static const bool _323 = (!c_src_is_srgb);
static const bool _381 = (c_src_color_space != 1000104013u);
static const bool _462 = (c_dst_color_space != 1000104013u);
static const bool _505 = (!c_gamma);
static const bool _506 = (c_src_is_srgb != c_dst_is_srgb);
static const bool _507 = (_505 && _506);
static const bool _543 = (!c_dst_is_srgb);

struct present_info_t {
  int2 src_offset;
  int2 src_extent;
  int2 dst_offset;
  int2 cursor_offset;
  int2 cursor_extent;
  uint sampler_gamma;
  uint sampler_cursor;
};

[[vk::push_constant]]
ConstantBuffer<present_info_t> _260;

// Resources
[[vk::binding(2, 1)]]
Texture2D s_hud;
[[vk::binding(3, 1)]]
Texture2D s_cursor;
[[vk::binding(0, 0)]]
SamplerState s_samplers[];
[[vk::binding(1, 1)]]
Texture1D s_gamma;
[[vk::binding(0, 1)]]
Texture2D s_image;

static const float3x3 rec709_to_rec2020 = float3x3(
    0.627404, 0.329283, 0.043313,
    0.069097, 0.919544, 0.011359,
    0.016391, 0.088013, 0.895596);

static const float3x3 rec2020_to_rec709 = float3x3(
    1.660491, -0.587641, -0.072850,
    -0.124550, 1.132900, -0.008349,
    -0.018151, -0.100579, 1.118729);

float3 srgb_to_linear(float3 srgb) {
  bool3 isLo = srgb <= 0.040449999272823333740234375;
  float3 loPart = srgb / 12.9200000762939453125;
  float3 hiPart = pow((srgb + 0.054999999701976776123046875) / 1.05499994754791259765625, 2.400000095367431640625);
  return isLo ? loPart : hiPart;
}

float3 nits_to_sc_rgb(float3 nits) {
  return nits / 80.0;
}

float3 sc_rgb_to_nits(float3 sc_rgb) {
  return sc_rgb * 80.0;
}

float3 pq_to_nits(float3 pq) {
  float3 pq_m2 = pow(pq, 0.0126833133399486541748046875);
  float3 num = max(pq_m2 - 0.8359375, 0.0);
  float3 den = 18.8515625 - (pq_m2 * 18.6875);
  return pow(num / den, 6.277394771575927734375) * 10000.0;
}

float3 nits_to_pq(float3 nits) {
  float3 y = clamp(nits / 10000.0, 0.0, 1.0);
  float3 y_m1 = pow(y, 0.1593017578125);
  float3 num = 0.8359375 + (y_m1 * 18.8515625);
  float3 den = 1.0 + (y_m1 * 18.6875);
  return pow(num / den, 78.84375);
}

float3 linear_to_srgb(float3 linear) {
  bool3 isLo = linear <= 0.003130800090730190277099609375;
  float3 loPart = linear * 12.9200000762939453125;
  float3 hiPart = (pow(linear, 0.4166666567325592041015625) * 1.05499994754791259765625) - 0.054999999701976776123046875;
  return isLo ? loPart : hiPart;
}

float4 blend_sc_rgb(float4 dst, float4 src) {
  return lerp(dst, float4(src.xyz, 1.0), src.wwww);
}

float4 blend_linear_sdr(float4 dst, inout float4 src) {
  src.xyz = nits_to_sc_rgb(src.xyz * 203.0);
  return blend_sc_rgb(dst, src);
}

[shader("pixel")]
float4 main(float4 gl_FragCoord: SV_Position) : SV_Target {
  int2 coord = int2(gl_FragCoord.xy);
  float4 color;

  if (c_samples > 1u) {
    var s_image_ms = reinterpret<Texture2DMS>(s_image);

    color = s_image_ms.Load(coord, 0);
  } else {
    color = s_image.Load(int3(coord, 0));
  }
  return color;

  // input_to_sc_rgb
  switch (c_src_color_space) {
    case 0u:
      if (_323) color.xyz = srgb_to_linear(color.xyz);
      color.xyz = nits_to_sc_rgb(color.xyz * 203.0);
      break;
    case 1000104008u:
      color.xyz = nits_to_sc_rgb(pq_to_nits(color.xyz));
      color.xyz = mul(rec2020_to_rec709, color.xyz);
      break;
  }

  // composite_image
  if (c_composite_hud) {
    float4 hud_tex = s_hud.Load(int3(coord, 0));
    color = blend_linear_sdr(color, hud_tex);
  }

  if (c_composite_cursor) {
    int2 rel_ofs = coord - _260.cursor_offset;
    if (all(rel_ofs >= 0) && all(rel_ofs < _260.cursor_extent)) {
      float2 uv = float2(rel_ofs) / float2(_260.cursor_extent);
      float4 cursor_tex = s_cursor.Sample(s_samplers[_260.sampler_cursor], uv);
      color = blend_linear_sdr(color, cursor_tex);
    }
  }

  // sc_rgb_to_output
  if (c_gamma) {
    if (_381)
      color.xyz = linear_to_srgb(sc_rgb_to_nits(color.xyz) / 203.0);
    else if (c_src_is_srgb)
      color.xyz = linear_to_srgb(color.xyz);

    float3 lut;
    lut.x = s_gamma.Sample(s_samplers[_260.sampler_gamma], color.x).x;
    lut.y = s_gamma.Sample(s_samplers[_260.sampler_gamma], color.y).y;
    lut.z = s_gamma.Sample(s_samplers[_260.sampler_gamma], color.z).z;
    color.xyz = lut;

    if (_462)
      color.xyz = nits_to_sc_rgb(srgb_to_linear(color.xyz) * 203.0);
    else if (c_dst_is_srgb)
      color.xyz = srgb_to_linear(color.xyz);
  }

  switch (c_dst_color_space) {
    case 0u:
      color.xyz = sc_rgb_to_nits(color.xyz) / 203.0;
      if (_543) color.xyz = linear_to_srgb(color.xyz);
      break;
    case 1000104002u:
      break;
    case 1000104008u:
      color.xyz = mul(rec709_to_rec2020, color.xyz);
      color.xyz = nits_to_pq(sc_rgb_to_nits(color.xyz));
      break;
  }

  return color;
}
