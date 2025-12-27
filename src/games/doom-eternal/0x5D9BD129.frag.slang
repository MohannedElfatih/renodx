#version 450
// #extension GL_EXT_nonuniform_qualifier : require
// #extension GL_EXT_spirv_intrinsics : require
// #extension GL_KHR_shader_subgroup_vote : require
// #extension GL_EXT_samplerless_texture_functions : require

// Slang GLSL-compat helpers.
float spvNMax(float a, float b) { return max(a, b); }
vec2 spvNMax(vec2 a, vec2 b) { return max(a, b); }
vec3 spvNMax(vec3 a, vec3 b) { return max(a, b); }
vec4 spvNMax(vec4 a, vec4 b) { return max(a, b); }
float spvNMin(float a, float b) { return min(a, b); }
vec2 spvNMin(vec2 a, vec2 b) { return min(a, b); }
vec3 spvNMin(vec3 a, vec3 b) { return min(a, b); }
vec4 spvNMin(vec4 a, vec4 b) { return min(a, b); }

#define sampler2D(tex, samp) tex, samp
#define sampler3D(tex, samp) tex, samp

vec4 textureLod(Texture2D tex, SamplerState samp, vec2 uv, float lod) {
  return tex.SampleLevel(samp, uv, lod);
}

vec4 textureLod(Texture3D tex, SamplerState samp, vec3 uv, float lod) {
  return tex.SampleLevel(samp, uv, lod);
}

vec4 texelFetch(Texture2D tex, ivec2 coord, int lod) {
  return tex.Load(int3(coord, lod));
}

vec4 textureGatherOffset(Texture2D tex, SamplerState samp, vec2 uv, ivec2 offset, int comp) {
  int2 ioffset = int2(offset);
  if (comp == 0) return tex.GatherRed(samp, uv, ioffset);
  if (comp == 1) return tex.GatherGreen(samp, uv, ioffset);
  if (comp == 2) return tex.GatherBlue(samp, uv, ioffset);
  return tex.GatherAlpha(samp, uv, ioffset);
}

struct ViewConstants
{
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

const vec3 _212[3] = vec3[](vec3(0.8631572723388671875, 0.06301002204418182373046875, 0.15896083414554595947265625), vec3(0.9911022186279296875, 0.6444797515869140625, 0.13286833465099334716796875), vec3(0.02028855867683887481689453125, 0.304987370967864990234375, 0.520995616912841796875));

layout(set = 1, binding = 0, std140) uniform type_ConstantBuffer_FrameConstants
{
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
} frame_constants;

layout(set = 0, binding = 13, std140) uniform type_Globals
{
    uvec2 input_tex_dims;
    uvec2 blur_pyramid_tex_dims;
    uvec2 grading_lut_tex_dims;
    uvec2 icc_lut_dims;
    uvec2 blue_noise_texture_dims;
    uint is_input_valid;
    uint use_icc;
    float sharpen_amount;
    uint upsampling_mode;
    uint grading_flags;
    float grading_strength;
    float grading_contrast;
    float grading_saturation;
    float vignette_amount;
    float distortion_amount;
    float ca_amount;
    float gamma_shift;
    uvec2 framebuffer_dims;
} _Globals;

layout(set = 0, binding = 19, std430) readonly buffer type_StructuredBuffer_float
{
    float _m0[];
} shadow_mask_mean;

layout(set = 0, binding = 0) uniform SamplerState sampler_lnc;
layout(set = 0, binding = 2) uniform SamplerState sampler_nnc;
layout(set = 0, binding = 3) uniform SamplerState sampler_llc;
layout(set = 0, binding = 14) uniform Texture2D input_tex;
layout(set = 0, binding = 15) uniform Texture2D blur_pyramid_tex;
layout(set = 0, binding = 16) uniform Texture3D grading_lut_tex;
layout(set = 0, binding = 17) uniform Texture3D icc_lut;
layout(set = 0, binding = 18) uniform Texture2D blue_noise_texture;
layout(set = 0, binding = 20) uniform Texture3D tony_mc_mapface_lut;

layout(location = 0) out vec4 out_var_SV_TARGET;

void main()
{
    ivec2 _218 = ivec2(gl_FragCoord.xy);
    vec2 _221 = vec2(_Globals.framebuffer_dims);
    vec2 _224 = (vec2(_218) + vec2(0.5)) / _221;
    vec3 _1543;
    vec3 test = textureLod(sampler2D(input_tex, sampler_nnc), _224, 0.0).xyz;
    
    if (_Globals.upsampling_mode == 0u)
    {
      _1543 = textureLod(sampler2D(input_tex, sampler_nnc), _224, 0.0).xyz;
    }
    else
    {
        vec3 _1537;
        if (_Globals.upsampling_mode == 1u)
        {
          _1537 = textureLod(sampler2D(input_tex, sampler_lnc), _224, 0.0).xyz;
        }
        else
        {
            vec3 _1531;
            if (_Globals.upsampling_mode == 2u)
            {
                vec2 _1444 = vec2(_Globals.input_tex_dims);
                vec2 _1445 = _224 * _1444;
                vec2 _1447 = floor(_1445 - vec2(0.5));
                vec2 _1448 = _1447 + vec2(0.5);
                vec2 _1449 = _1445 - _1448;
                vec2 _1450 = _1449 * 0.5;
                vec2 _1454 = _1449 * (vec2(-0.5) + (_1449 * (vec2(1.0) - _1450)));
                vec2 _1455 = _1449 * _1449;
                vec2 _1456 = _1449 * 1.5;
                vec2 _1463 = _1449 * (vec2(0.5) + (_1449 * (vec2(2.0) - _1456)));
                vec2 _1465 = _1455 * (vec2(-0.5) + _1450);
                vec2 _1466 = (vec2(1.0) + (_1455 * (vec2(-2.5) + _1456))) + _1463;
                vec2 _1471 = (_1447 + vec2(-0.5)) / _1444;
                vec2 _1472 = (_1447 + vec2(2.5)) / _1444;
                vec2 _1473 = (_1448 + (_1463 / _1466)) / _1444;
                float _1474 = _1473.x;
                float _1480 = _1466.x;
                float _1482 = _1454.y;
                float _1485 = _1473.y;
                float _1490 = _1454.x;
                float _1492 = _1466.y;
                float _1506 = _1465.x;
                float _1516 = _1465.y;
                _1531 = spvNMax(vec3(0.0), ((((((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_1474, _1471.y), 0.0).xyz * _1480) * _1482) + ((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_1471.x, _1485), 0.0).xyz * _1490) * _1492)) + ((textureLod(sampler2D(input_tex, sampler_lnc), _1473, 0.0).xyz * _1480) * _1492)) + ((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_1472.x, _1485), 0.0).xyz * _1506) * _1492)) + ((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_1474, _1472.y), 0.0).xyz * _1480) * _1516)) / vec3(((((_1480 * _1482) + (_1490 * _1492)) + (_1480 * _1492)) + (_1506 * _1492)) + (_1480 * _1516)));
            }
            else
            {
                vec3 _1439;
                if (_Globals.upsampling_mode == 3u)
                {
                    vec2 _900 = vec2(_Globals.input_tex_dims);
                    float _902 = _900.x;
                    float _903 = _221.x;
                    float _905 = _900.y;
                    float _906 = _221.y;
                    vec4 _914 = vec4(_902 / _903, _905 / _906, ((0.5 * _902) / _903) - 0.5, ((0.5 * _905) / _906) - 0.5);
                    vec4 _915 = _900.xyxy;
                    vec4 _916 = vec4(1.0, 1.0, 1.0, -1.0) / _915;
                    vec4 _917 = vec4(-1.0, 2.0, 1.0, 2.0) / _915;
                    vec2 _923 = (vec2(uvec2(_218)) * _914.xy) + _914.zw;
                    vec2 _924 = floor(_923);
                    vec2 _925 = _923 - _924;
                    vec2 _929 = (_924 * _916.xy) + _916.zw;
                    vec2 _931 = _929 + _917.xy;
                    vec2 _933 = _929 + _917.zw;
                    vec2 _935 = _929 + (vec4(0.0, 4.0, 0.0, 0.0) / _915).xy;
                    vec4 _937 = vec4(-0.5, 0.5, -0.5, 0.5) * _916.xxyy;
                    vec2 _938 = _937.xw;
                    vec4 _942 = textureLod(sampler2D(input_tex, sampler_lnc), _929 + _938, 0.0);
                    float _949 = _942.y + (0.5 * (_942.x + _942.z));
                    vec2 _950 = _937.yw;
                    vec4 _953 = textureLod(sampler2D(input_tex, sampler_lnc), _929 + _950, 0.0);
                    float _960 = _953.y + (0.5 * (_953.x + _953.z));
                    vec4 _963 = textureLod(sampler2D(input_tex, sampler_lnc), _931 + _938, 0.0);
                    float _970 = _963.y + (0.5 * (_963.x + _963.z));
                    vec4 _973 = textureLod(sampler2D(input_tex, sampler_lnc), _931 + _950, 0.0);
                    vec3 _974 = _973.xyz;
                    float _980 = _973.y + (0.5 * (_973.x + _973.z));
                    vec2 _981 = _937.yz;
                    vec4 _984 = textureLod(sampler2D(input_tex, sampler_lnc), _931 + _981, 0.0);
                    vec3 _985 = _984.xyz;
                    float _991 = _984.y + (0.5 * (_984.x + _984.z));
                    vec2 _992 = _937.xz;
                    vec4 _995 = textureLod(sampler2D(input_tex, sampler_lnc), _931 + _992, 0.0);
                    float _1002 = _995.y + (0.5 * (_995.x + _995.z));
                    vec4 _1005 = textureLod(sampler2D(input_tex, sampler_lnc), _933 + _938, 0.0);
                    vec3 _1006 = _1005.xyz;
                    float _1012 = _1005.y + (0.5 * (_1005.x + _1005.z));
                    vec4 _1015 = textureLod(sampler2D(input_tex, sampler_lnc), _933 + _950, 0.0);
                    float _1022 = _1015.y + (0.5 * (_1015.x + _1015.z));
                    vec4 _1025 = textureLod(sampler2D(input_tex, sampler_lnc), _933 + _981, 0.0);
                    float _1032 = _1025.y + (0.5 * (_1025.x + _1025.z));
                    vec4 _1035 = textureLod(sampler2D(input_tex, sampler_lnc), _933 + _992, 0.0);
                    vec3 _1036 = _1035.xyz;
                    float _1042 = _1035.y + (0.5 * (_1035.x + _1035.z));
                    vec4 _1045 = textureLod(sampler2D(input_tex, sampler_lnc), _935 + _981, 0.0);
                    float _1052 = _1045.y + (0.5 * (_1045.x + _1045.z));
                    vec4 _1055 = textureLod(sampler2D(input_tex, sampler_lnc), _935 + _992, 0.0);
                    float _1062 = _1055.y + (0.5 * (_1055.x + _1055.z));
                    float _1063 = _925.x;
                    float _1064 = 1.0 - _1063;
                    float _1065 = _925.y;
                    float _1066 = 1.0 - _1065;
                    float _1067 = _1064 * _1066;
                    float _1069 = abs(_1042 - _991);
                    float _1073 = _1042 - _1002;
                    float _1077 = clamp(abs(_1073) / spvNMax(_1069, abs(_991 - _1002)), 0.0, 1.0);
                    float _1080 = abs(_980 - _991);
                    float _1084 = _980 - _949;
                    float _1088 = clamp(abs(_1084) / spvNMax(_1080, abs(_991 - _949)), 0.0, 1.0);
                    float _1092 = _1063 * _1066;
                    float _1096 = _1032 - _991;
                    float _1101 = clamp(abs(_1096) / spvNMax(abs(_1032 - _1042), _1069), 0.0, 1.0);
                    float _1106 = abs(_1012 - _1042);
                    float _1110 = _1012 - _960;
                    float _1115 = clamp(abs(_1110) / spvNMax(_1106, abs(_1042 - _960)), 0.0, 1.0);
                    float _1119 = _1064 * _1065;
                    float _1121 = abs(_1012 - _980);
                    float _1125 = _1012 - _970;
                    float _1130 = clamp(abs(_1125) / spvNMax(_1121, abs(_980 - _970)), 0.0, 1.0);
                    float _1137 = _1062 - _991;
                    float _1142 = clamp(abs(_1137) / spvNMax(abs(_1062 - _980), _1080), 0.0, 1.0);
                    float _1146 = _1063 * _1065;
                    float _1150 = _1022 - _980;
                    float _1152 = (((_1073 * _1067) + (_1096 * _1092)) + (_1125 * _1119)) + (_1150 * _1146);
                    float _1155 = clamp(abs(_1150) / spvNMax(abs(_1022 - _1012), _1121), 0.0, 1.0);
                    float _1162 = _1052 - _1042;
                    vec2 _1165 = vec2(_1152, (((_1084 * _1067) + (_1110 * _1092)) + (_1137 * _1119)) + (_1162 * _1146));
                    float _1168 = clamp(abs(_1162) / spvNMax(abs(_1052 - _1012), _1106), 0.0, 1.0);
                    vec2 _1172 = _1165 * _1165;
                    float _1175 = _1172.x + _1172.y;
                    bool _1176 = _1175 < 3.0517578125e-05;
                    vec2 _1180 = _1165;
                    _1180.x = _1176 ? 1.0 : _1152;
                    vec2 _1182 = _1180 * vec2(_1176 ? 1.0 : inversesqrt(_1175));
                    float _1183 = (((((((_1067 * ((_1077 * _1077) + (_1088 * _1088))) + ((_1101 * _1101) * _1092)) + ((_1115 * _1115) * _1092)) + ((_1130 * _1130) * _1119)) + ((_1142 * _1142) * _1119)) + ((_1155 * _1155) * _1146)) + ((_1168 * _1168) * _1146)) * 0.5;
                    float _1184 = _1183 * _1183;
                    float _1186 = _1182.x;
                    float _1188 = _1182.y;
                    vec2 _1197 = vec2(1.0 + (((dot(_1182, _1182) / spvNMax(abs(_1186), abs(_1188))) - 1.0) * _1184), 1.0 - (0.5 * _1184));
                    float _1199 = 0.5 - (0.2899999916553497314453125 * _1184);
                    float _1200 = 1.0 / _1199;
                    vec2 _1207 = vec2(0.0, -1.0) - _925;
                    vec2 _1210 = vec2(-_1188, _1186);
                    vec2 _1213 = vec2(dot(_1207, _1182), dot(_1207, _1210)) * _1197;
                    float _1215 = spvNMin(dot(_1213, _1213), _1200);
                    float _1217 = (0.4000000059604644775390625 * _1215) - 1.0;
                    float _1219 = (_1199 * _1215) - 1.0;
                    float _1224 = ((1.5625 * (_1217 * _1217)) - 0.5625) * (_1219 * _1219);
                    vec2 _1226 = vec2(1.0, -1.0) - _925;
                    vec2 _1230 = vec2(dot(_1226, _1182), dot(_1226, _1210)) * _1197;
                    float _1232 = spvNMin(dot(_1230, _1230), _1200);
                    float _1234 = (0.4000000059604644775390625 * _1232) - 1.0;
                    float _1236 = (_1199 * _1232) - 1.0;
                    float _1241 = ((1.5625 * (_1234 * _1234)) - 0.5625) * (_1236 * _1236);
                    vec2 _1245 = vec2(-1.0, 1.0) - _925;
                    vec2 _1249 = vec2(dot(_1245, _1182), dot(_1245, _1210)) * _1197;
                    float _1251 = spvNMin(dot(_1249, _1249), _1200);
                    float _1253 = (0.4000000059604644775390625 * _1251) - 1.0;
                    float _1255 = (_1199 * _1251) - 1.0;
                    float _1260 = ((1.5625 * (_1253 * _1253)) - 0.5625) * (_1255 * _1255);
                    vec2 _1264 = vec2(0.0, 1.0) - _925;
                    vec2 _1268 = vec2(dot(_1264, _1182), dot(_1264, _1210)) * _1197;
                    float _1270 = spvNMin(dot(_1268, _1268), _1200);
                    float _1272 = (0.4000000059604644775390625 * _1270) - 1.0;
                    float _1274 = (_1199 * _1270) - 1.0;
                    float _1279 = ((1.5625 * (_1272 * _1272)) - 0.5625) * (_1274 * _1274);
                    vec2 _1283 = -_925;
                    vec2 _1287 = vec2(dot(_1283, _1182), dot(_1283, _1210)) * _1197;
                    float _1289 = spvNMin(dot(_1287, _1287), _1200);
                    float _1291 = (0.4000000059604644775390625 * _1289) - 1.0;
                    float _1293 = (_1199 * _1289) - 1.0;
                    float _1298 = ((1.5625 * (_1291 * _1291)) - 0.5625) * (_1293 * _1293);
                    vec2 _1302 = vec2(-1.0, 0.0) - _925;
                    vec2 _1306 = vec2(dot(_1302, _1182), dot(_1302, _1210)) * _1197;
                    float _1308 = spvNMin(dot(_1306, _1306), _1200);
                    float _1310 = (0.4000000059604644775390625 * _1308) - 1.0;
                    float _1312 = (_1199 * _1308) - 1.0;
                    float _1317 = ((1.5625 * (_1310 * _1310)) - 0.5625) * (_1312 * _1312);
                    vec2 _1321 = vec2(1.0) - _925;
                    vec2 _1325 = vec2(dot(_1321, _1182), dot(_1321, _1210)) * _1197;
                    float _1327 = spvNMin(dot(_1325, _1325), _1200);
                    float _1329 = (0.4000000059604644775390625 * _1327) - 1.0;
                    float _1331 = (_1199 * _1327) - 1.0;
                    float _1336 = ((1.5625 * (_1329 * _1329)) - 0.5625) * (_1331 * _1331);
                    vec2 _1340 = vec2(2.0, 1.0) - _925;
                    vec2 _1344 = vec2(dot(_1340, _1182), dot(_1340, _1210)) * _1197;
                    float _1346 = spvNMin(dot(_1344, _1344), _1200);
                    float _1348 = (0.4000000059604644775390625 * _1346) - 1.0;
                    float _1350 = (_1199 * _1346) - 1.0;
                    float _1355 = ((1.5625 * (_1348 * _1348)) - 0.5625) * (_1350 * _1350);
                    vec2 _1359 = vec2(2.0, 0.0) - _925;
                    vec2 _1363 = vec2(dot(_1359, _1182), dot(_1359, _1210)) * _1197;
                    float _1365 = spvNMin(dot(_1363, _1363), _1200);
                    float _1367 = (0.4000000059604644775390625 * _1365) - 1.0;
                    float _1369 = (_1199 * _1365) - 1.0;
                    float _1374 = ((1.5625 * (_1367 * _1367)) - 0.5625) * (_1369 * _1369);
                    vec2 _1378 = vec2(1.0, 0.0) - _925;
                    vec2 _1382 = vec2(dot(_1378, _1182), dot(_1378, _1210)) * _1197;
                    float _1384 = spvNMin(dot(_1382, _1382), _1200);
                    float _1386 = (0.4000000059604644775390625 * _1384) - 1.0;
                    float _1388 = (_1199 * _1384) - 1.0;
                    float _1393 = ((1.5625 * (_1386 * _1386)) - 0.5625) * (_1388 * _1388);
                    vec2 _1397 = vec2(1.0, 2.0) - _925;
                    vec2 _1401 = vec2(dot(_1397, _1182), dot(_1397, _1210)) * _1197;
                    float _1403 = spvNMin(dot(_1401, _1401), _1200);
                    float _1405 = (0.4000000059604644775390625 * _1403) - 1.0;
                    float _1407 = (_1199 * _1403) - 1.0;
                    float _1412 = ((1.5625 * (_1405 * _1405)) - 0.5625) * (_1407 * _1407);
                    vec2 _1416 = vec2(0.0, 2.0) - _925;
                    vec2 _1420 = vec2(dot(_1416, _1182), dot(_1416, _1210)) * _1197;
                    float _1422 = spvNMin(dot(_1420, _1420), _1200);
                    float _1424 = (0.4000000059604644775390625 * _1422) - 1.0;
                    float _1426 = (_1199 * _1422) - 1.0;
                    float _1431 = ((1.5625 * (_1424 * _1424)) - 0.5625) * (_1426 * _1426);
                    vec3 _1437 = spvNMax(spvNMin(spvNMin(_985, _1036), spvNMin(_974, _1006)), ((((((((((((_942.xyz * _1224) + (_953.xyz * _1241)) + (_963.xyz * _1260)) + (_974 * _1279)) + (_985 * _1298)) + (_995.xyz * _1317)) + (_1006 * _1336)) + (_1015.xyz * _1355)) + (_1025.xyz * _1374)) + (_1036 * _1393)) + (_1045.xyz * _1412)) + (_1055.xyz * _1431)) / vec3(((((((((((_1224 + _1241) + _1260) + _1279) + _1298) + _1317) + _1336) + _1355) + _1374) + _1393) + _1412) + _1431));
                    _1439 = spvNMin(spvNMax(spvNMax(_985, _1036), spvNMax(_974, _1006)), _1437);
                }
                else
                {
                    vec4 _246 = textureGatherOffset(sampler2D(input_tex, sampler_lnc), _224, ivec2(0), 1);
                    float _247 = _246.x;
                    float _248 = _246.y;
                    float _249 = _246.z;
                    float _250 = _246.w;
                    float _253 = spvNMin(spvNMin(_247, _248), spvNMin(_249, _250));
                    float _256 = spvNMax(spvNMax(_247, _248), spvNMax(_249, _250));
                    vec3 _896;
                    if (subgroupAny((abs(_253 - _256) / spvNMax(9.9999996826552253889678874634872e-21, _253 + _256)) > 0.5))
                    {
                        vec2 _358 = vec2(_Globals.input_tex_dims);
                        float _360 = _358.x;
                        float _361 = _221.x;
                        float _363 = _358.y;
                        float _364 = _221.y;
                        vec4 _372 = vec4(_360 / _361, _363 / _364, ((0.5 * _360) / _361) - 0.5, ((0.5 * _363) / _364) - 0.5);
                        vec4 _373 = _358.xyxy;
                        vec4 _374 = vec4(1.0, 1.0, 1.0, -1.0) / _373;
                        vec4 _375 = vec4(-1.0, 2.0, 1.0, 2.0) / _373;
                        vec2 _381 = (vec2(uvec2(_218)) * _372.xy) + _372.zw;
                        vec2 _382 = floor(_381);
                        vec2 _383 = _381 - _382;
                        vec2 _387 = (_382 * _374.xy) + _374.zw;
                        vec2 _389 = _387 + _375.xy;
                        vec2 _391 = _387 + _375.zw;
                        vec2 _393 = _387 + (vec4(0.0, 4.0, 0.0, 0.0) / _373).xy;
                        vec4 _395 = vec4(-0.5, 0.5, -0.5, 0.5) * _374.xxyy;
                        vec2 _396 = _395.xw;
                        vec4 _399 = textureLod(sampler2D(input_tex, sampler_lnc), _387 + _396, 0.0);
                        float _406 = _399.y + (0.5 * (_399.x + _399.z));
                        vec2 _407 = _395.yw;
                        vec4 _410 = textureLod(sampler2D(input_tex, sampler_lnc), _387 + _407, 0.0);
                        float _417 = _410.y + (0.5 * (_410.x + _410.z));
                        vec4 _420 = textureLod(sampler2D(input_tex, sampler_lnc), _389 + _396, 0.0);
                        float _427 = _420.y + (0.5 * (_420.x + _420.z));
                        vec4 _430 = textureLod(sampler2D(input_tex, sampler_lnc), _389 + _407, 0.0);
                        vec3 _431 = _430.xyz;
                        float _437 = _430.y + (0.5 * (_430.x + _430.z));
                        vec2 _438 = _395.yz;
                        vec4 _441 = textureLod(sampler2D(input_tex, sampler_lnc), _389 + _438, 0.0);
                        vec3 _442 = _441.xyz;
                        float _448 = _441.y + (0.5 * (_441.x + _441.z));
                        vec2 _449 = _395.xz;
                        vec4 _452 = textureLod(sampler2D(input_tex, sampler_lnc), _389 + _449, 0.0);
                        float _459 = _452.y + (0.5 * (_452.x + _452.z));
                        vec4 _462 = textureLod(sampler2D(input_tex, sampler_lnc), _391 + _396, 0.0);
                        vec3 _463 = _462.xyz;
                        float _469 = _462.y + (0.5 * (_462.x + _462.z));
                        vec4 _472 = textureLod(sampler2D(input_tex, sampler_lnc), _391 + _407, 0.0);
                        float _479 = _472.y + (0.5 * (_472.x + _472.z));
                        vec4 _482 = textureLod(sampler2D(input_tex, sampler_lnc), _391 + _438, 0.0);
                        float _489 = _482.y + (0.5 * (_482.x + _482.z));
                        vec4 _492 = textureLod(sampler2D(input_tex, sampler_lnc), _391 + _449, 0.0);
                        vec3 _493 = _492.xyz;
                        float _499 = _492.y + (0.5 * (_492.x + _492.z));
                        vec4 _502 = textureLod(sampler2D(input_tex, sampler_lnc), _393 + _438, 0.0);
                        float _509 = _502.y + (0.5 * (_502.x + _502.z));
                        vec4 _512 = textureLod(sampler2D(input_tex, sampler_lnc), _393 + _449, 0.0);
                        float _519 = _512.y + (0.5 * (_512.x + _512.z));
                        float _520 = _383.x;
                        float _521 = 1.0 - _520;
                        float _522 = _383.y;
                        float _523 = 1.0 - _522;
                        float _524 = _521 * _523;
                        float _526 = abs(_499 - _448);
                        float _530 = _499 - _459;
                        float _534 = clamp(abs(_530) / spvNMax(_526, abs(_448 - _459)), 0.0, 1.0);
                        float _537 = abs(_437 - _448);
                        float _541 = _437 - _406;
                        float _545 = clamp(abs(_541) / spvNMax(_537, abs(_448 - _406)), 0.0, 1.0);
                        float _549 = _520 * _523;
                        float _553 = _489 - _448;
                        float _558 = clamp(abs(_553) / spvNMax(abs(_489 - _499), _526), 0.0, 1.0);
                        float _563 = abs(_469 - _499);
                        float _567 = _469 - _417;
                        float _572 = clamp(abs(_567) / spvNMax(_563, abs(_499 - _417)), 0.0, 1.0);
                        float _576 = _521 * _522;
                        float _578 = abs(_469 - _437);
                        float _582 = _469 - _427;
                        float _587 = clamp(abs(_582) / spvNMax(_578, abs(_437 - _427)), 0.0, 1.0);
                        float _594 = _519 - _448;
                        float _599 = clamp(abs(_594) / spvNMax(abs(_519 - _437), _537), 0.0, 1.0);
                        float _603 = _520 * _522;
                        float _607 = _479 - _437;
                        float _609 = (((_530 * _524) + (_553 * _549)) + (_582 * _576)) + (_607 * _603);
                        float _612 = clamp(abs(_607) / spvNMax(abs(_479 - _469), _578), 0.0, 1.0);
                        float _619 = _509 - _499;
                        vec2 _622 = vec2(_609, (((_541 * _524) + (_567 * _549)) + (_594 * _576)) + (_619 * _603));
                        float _625 = clamp(abs(_619) / spvNMax(abs(_509 - _469), _563), 0.0, 1.0);
                        vec2 _629 = _622 * _622;
                        float _632 = _629.x + _629.y;
                        bool _633 = _632 < 3.0517578125e-05;
                        vec2 _637 = _622;
                        _637.x = _633 ? 1.0 : _609;
                        vec2 _639 = _637 * vec2(_633 ? 1.0 : inversesqrt(_632));
                        float _640 = (((((((_524 * ((_534 * _534) + (_545 * _545))) + ((_558 * _558) * _549)) + ((_572 * _572) * _549)) + ((_587 * _587) * _576)) + ((_599 * _599) * _576)) + ((_612 * _612) * _603)) + ((_625 * _625) * _603)) * 0.5;
                        float _641 = _640 * _640;
                        float _643 = _639.x;
                        float _645 = _639.y;
                        vec2 _654 = vec2(1.0 + (((dot(_639, _639) / spvNMax(abs(_643), abs(_645))) - 1.0) * _641), 1.0 - (0.5 * _641));
                        float _656 = 0.5 - (0.2899999916553497314453125 * _641);
                        float _657 = 1.0 / _656;
                        vec2 _664 = vec2(0.0, -1.0) - _383;
                        vec2 _667 = vec2(-_645, _643);
                        vec2 _670 = vec2(dot(_664, _639), dot(_664, _667)) * _654;
                        float _672 = spvNMin(dot(_670, _670), _657);
                        float _674 = (0.4000000059604644775390625 * _672) - 1.0;
                        float _676 = (_656 * _672) - 1.0;
                        float _681 = ((1.5625 * (_674 * _674)) - 0.5625) * (_676 * _676);
                        vec2 _683 = vec2(1.0, -1.0) - _383;
                        vec2 _687 = vec2(dot(_683, _639), dot(_683, _667)) * _654;
                        float _689 = spvNMin(dot(_687, _687), _657);
                        float _691 = (0.4000000059604644775390625 * _689) - 1.0;
                        float _693 = (_656 * _689) - 1.0;
                        float _698 = ((1.5625 * (_691 * _691)) - 0.5625) * (_693 * _693);
                        vec2 _702 = vec2(-1.0, 1.0) - _383;
                        vec2 _706 = vec2(dot(_702, _639), dot(_702, _667)) * _654;
                        float _708 = spvNMin(dot(_706, _706), _657);
                        float _710 = (0.4000000059604644775390625 * _708) - 1.0;
                        float _712 = (_656 * _708) - 1.0;
                        float _717 = ((1.5625 * (_710 * _710)) - 0.5625) * (_712 * _712);
                        vec2 _721 = vec2(0.0, 1.0) - _383;
                        vec2 _725 = vec2(dot(_721, _639), dot(_721, _667)) * _654;
                        float _727 = spvNMin(dot(_725, _725), _657);
                        float _729 = (0.4000000059604644775390625 * _727) - 1.0;
                        float _731 = (_656 * _727) - 1.0;
                        float _736 = ((1.5625 * (_729 * _729)) - 0.5625) * (_731 * _731);
                        vec2 _740 = -_383;
                        vec2 _744 = vec2(dot(_740, _639), dot(_740, _667)) * _654;
                        float _746 = spvNMin(dot(_744, _744), _657);
                        float _748 = (0.4000000059604644775390625 * _746) - 1.0;
                        float _750 = (_656 * _746) - 1.0;
                        float _755 = ((1.5625 * (_748 * _748)) - 0.5625) * (_750 * _750);
                        vec2 _759 = vec2(-1.0, 0.0) - _383;
                        vec2 _763 = vec2(dot(_759, _639), dot(_759, _667)) * _654;
                        float _765 = spvNMin(dot(_763, _763), _657);
                        float _767 = (0.4000000059604644775390625 * _765) - 1.0;
                        float _769 = (_656 * _765) - 1.0;
                        float _774 = ((1.5625 * (_767 * _767)) - 0.5625) * (_769 * _769);
                        vec2 _778 = vec2(1.0) - _383;
                        vec2 _782 = vec2(dot(_778, _639), dot(_778, _667)) * _654;
                        float _784 = spvNMin(dot(_782, _782), _657);
                        float _786 = (0.4000000059604644775390625 * _784) - 1.0;
                        float _788 = (_656 * _784) - 1.0;
                        float _793 = ((1.5625 * (_786 * _786)) - 0.5625) * (_788 * _788);
                        vec2 _797 = vec2(2.0, 1.0) - _383;
                        vec2 _801 = vec2(dot(_797, _639), dot(_797, _667)) * _654;
                        float _803 = spvNMin(dot(_801, _801), _657);
                        float _805 = (0.4000000059604644775390625 * _803) - 1.0;
                        float _807 = (_656 * _803) - 1.0;
                        float _812 = ((1.5625 * (_805 * _805)) - 0.5625) * (_807 * _807);
                        vec2 _816 = vec2(2.0, 0.0) - _383;
                        vec2 _820 = vec2(dot(_816, _639), dot(_816, _667)) * _654;
                        float _822 = spvNMin(dot(_820, _820), _657);
                        float _824 = (0.4000000059604644775390625 * _822) - 1.0;
                        float _826 = (_656 * _822) - 1.0;
                        float _831 = ((1.5625 * (_824 * _824)) - 0.5625) * (_826 * _826);
                        vec2 _835 = vec2(1.0, 0.0) - _383;
                        vec2 _839 = vec2(dot(_835, _639), dot(_835, _667)) * _654;
                        float _841 = spvNMin(dot(_839, _839), _657);
                        float _843 = (0.4000000059604644775390625 * _841) - 1.0;
                        float _845 = (_656 * _841) - 1.0;
                        float _850 = ((1.5625 * (_843 * _843)) - 0.5625) * (_845 * _845);
                        vec2 _854 = vec2(1.0, 2.0) - _383;
                        vec2 _858 = vec2(dot(_854, _639), dot(_854, _667)) * _654;
                        float _860 = spvNMin(dot(_858, _858), _657);
                        float _862 = (0.4000000059604644775390625 * _860) - 1.0;
                        float _864 = (_656 * _860) - 1.0;
                        float _869 = ((1.5625 * (_862 * _862)) - 0.5625) * (_864 * _864);
                        vec2 _873 = vec2(0.0, 2.0) - _383;
                        vec2 _877 = vec2(dot(_873, _639), dot(_873, _667)) * _654;
                        float _879 = spvNMin(dot(_877, _877), _657);
                        float _881 = (0.4000000059604644775390625 * _879) - 1.0;
                        float _883 = (_656 * _879) - 1.0;
                        float _888 = ((1.5625 * (_881 * _881)) - 0.5625) * (_883 * _883);
                        vec3 _894 = spvNMax(spvNMin(spvNMin(_442, _493), spvNMin(_431, _463)), ((((((((((((_399.xyz * _681) + (_410.xyz * _698)) + (_420.xyz * _717)) + (_431 * _736)) + (_442 * _755)) + (_452.xyz * _774)) + (_463 * _793)) + (_472.xyz * _812)) + (_482.xyz * _831)) + (_493 * _850)) + (_502.xyz * _869)) + (_512.xyz * _888)) / vec3(((((((((((_681 + _698) + _717) + _736) + _755) + _774) + _793) + _812) + _831) + _850) + _869) + _888));
                        _896 = spvNMin(spvNMax(spvNMax(_442, _493), spvNMax(_431, _463)), _894);
                    }
                    else
                    {
                        vec2 _269 = vec2(_Globals.input_tex_dims);
                        vec2 _270 = _224 * _269;
                        vec2 _272 = floor(_270 - vec2(0.5));
                        vec2 _273 = _272 + vec2(0.5);
                        vec2 _274 = _270 - _273;
                        vec2 _275 = _274 * 0.5;
                        vec2 _279 = _274 * (vec2(-0.5) + (_274 * (vec2(1.0) - _275)));
                        vec2 _280 = _274 * _274;
                        vec2 _281 = _274 * 1.5;
                        vec2 _288 = _274 * (vec2(0.5) + (_274 * (vec2(2.0) - _281)));
                        vec2 _290 = _280 * (vec2(-0.5) + _275);
                        vec2 _291 = (vec2(1.0) + (_280 * (vec2(-2.5) + _281))) + _288;
                        vec2 _296 = (_272 + vec2(-0.5)) / _269;
                        vec2 _297 = (_272 + vec2(2.5)) / _269;
                        vec2 _298 = (_273 + (_288 / _291)) / _269;
                        float _299 = _298.x;
                        float _305 = _291.x;
                        float _307 = _279.y;
                        float _310 = _298.y;
                        float _315 = _279.x;
                        float _317 = _291.y;
                        float _331 = _290.x;
                        float _341 = _290.y;
                        _896 = spvNMax(vec3(0.0), ((((((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_299, _296.y), 0.0).xyz * _305) * _307) + ((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_296.x, _310), 0.0).xyz * _315) * _317)) + ((textureLod(sampler2D(input_tex, sampler_lnc), _298, 0.0).xyz * _305) * _317)) + ((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_297.x, _310), 0.0).xyz * _331) * _317)) + ((textureLod(sampler2D(input_tex, sampler_lnc), vec2(_299, _297.y), 0.0).xyz * _305) * _341)) / vec3(((((_305 * _307) + (_315 * _317)) + (_305 * _317)) + (_331 * _317)) + (_305 * _341)));
                    }
                    _1439 = _896;
                }
                _1531 = _1439;
            }
            _1537 = _1531;
        }
        _1543 = _1537;
    }
    vec2 _1548 = vec2(_Globals.blur_pyramid_tex_dims);
    float _1551 = spvNMax(_1548.x, _1548.y);
    vec3 _1567 = (textureLod(sampler2D(blur_pyramid_tex, sampler_lnc), _224, log2(0.0500000007450580596923828125 * _1551)).xyz * 0.119999997317790985107421875) * 0.25;
    float _1575 = spvNMax(0.0, _Globals.distortion_amount);
    vec3 _1688;
    if (_1575 > 0.0)
    {
        float _1583 = _1575 * (1.0 + _Globals.ca_amount);
        vec2 _1598 = vec2(frame_constants.view_constants[0u].view_to_clip[1].y / frame_constants.view_constants[0u].view_to_clip[0].x, 1.0);
        vec2 _1599 = (vec4((_224 - vec2(0.5)) * vec2(2.0, -2.0), 0.0, 1.0) * frame_constants.view_constants[0u].clip_to_view).xy / _1598;
        float _1600 = _1599.x;
        float _1602 = _1599.y;
        float _1604 = (_1600 * _1600) + (_1602 * _1602);
        vec2 _1616 = (vec4(1.0, 1.0, 0.0, 1.0) * frame_constants.view_constants[0u].clip_to_view).xy / _1598;
        float _1617 = _1616.x;
        float _1619 = _1616.y;
        float _1621 = (_1617 * _1617) + (_1619 * _1619);
        float _1662 = _1575 * (1.0 - _Globals.ca_amount);
        _1688 = vec3(textureLod(sampler2D(input_tex, sampler_lnc), (((vec4((_1599 + (_1599 * (_1583 * _1604))) * _1598, 0.0, 1.0) * frame_constants.view_constants[0u].view_to_clip).xy / (vec4((_1616 + (_1616 * (_1583 * _1621))) * _1598, 0.0, 1.0) * frame_constants.view_constants[0u].view_to_clip).xy) * vec2(0.5, -0.5)) + vec2(0.5), 0.0).x, textureLod(sampler2D(input_tex, sampler_lnc), (((vec4((_1599 + (_1599 * (_1575 * _1604))) * _1598, 0.0, 1.0) * frame_constants.view_constants[0u].view_to_clip).xy / (vec4((_1616 + (_1616 * (_1575 * _1621))) * _1598, 0.0, 1.0) * frame_constants.view_constants[0u].view_to_clip).xy) * vec2(0.5, -0.5)) + vec2(0.5), 0.0).y, textureLod(sampler2D(input_tex, sampler_lnc), (((vec4((_1599 + (_1599 * (_1662 * _1604))) * _1598, 0.0, 1.0) * frame_constants.view_constants[0u].view_to_clip).xy / (vec4((_1616 + (_1616 * (_1662 * _1621))) * _1598, 0.0, 1.0) * frame_constants.view_constants[0u].view_to_clip).xy) * vec2(0.5, -0.5)) + vec2(0.5), 0.0).z);
    }
    else
    {
        _1688 = spvNMax(((_1543 + (textureLod(sampler2D(blur_pyramid_tex, sampler_llc), _224, log2(0.001000000047497451305389404296875 * _1551)).xyz * 0.119999997317790985107421875)) * vec3(0.917431175708770751953125)) - mix(_1567, vec3(dot(_1567, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))), vec3(0.5)), vec3(0.0));
    }
    vec2 _1698 = _224 - vec2(0.5);
    float _1700 = 3.5 * dot(_1698, _1698);
    vec3 _1712 = pow(spvNMax(vec3(0.0), (_1688 * mix(1.0, 0.569999992847442626953125, smoothstep(0.300000011920928955078125, 1.0, clamp(shadow_mask_mean._m0[0u], 0.0, 1.0)))) * exp((-_Globals.vignette_amount) * (_1700 * _1700))), vec3(spvNMax(0.0, 1.10000002384185791015625 + _Globals.gamma_shift))) * 1.60000002384185791015625;
    vec3 _1727 = mix(spvNMax(vec3(0.0), textureLod(sampler3D(tony_mc_mapface_lut, sampler_lnc), ((_1712 / (_1712 + vec3(1.0))) * 0.979166686534881591796875) + vec3(0.010416666977107524871826171875), 0.0).xyz), vec3(0.180000007152557373046875), bvec3(!(_Globals.is_input_valid != 0u)));
    vec3 _1734 = clamp(mix(vec3(dot(_1727, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875))), _1727, vec3(_Globals.grading_saturation)), vec3(0.0), vec3(1.0));
    float _1735 = dot(_1734, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    vec3 _1741 = _1734 * (pow(_1735, _Globals.grading_contrast) / spvNMax(9.9999997473787516355514526367188e-06, _1735));
    vec3 _1883;
    if ((1u & _Globals.grading_flags) != 0u)
    {
        vec3 _1882;
        if ((2u & _Globals.grading_flags) != 0u)
        {
            int _1833 = _218.x;
            bool _1839;
            if (_1833 < 256)
            {
                _1839 = _218.y < 16;
            }
            else
            {
                _1839 = false;
            }
            vec3 _1881;
            if (_1839)
            {
                vec3 _1849 = vec3(ivec3(_1833 - 16 * (_1833 / 16), _1833 / 16, 15 - (_218.y - 16 * (_218.y / 16)))) * vec3(0.066666670143604278564453125);
                float _1850 = _1849.x;
                float _1859;
                if (0.040449999272823333740234375 < _1850)
                {
                    _1859 = pow((_1850 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
                }
                else
                {
                    _1859 = _1850 * 0.077399380505084991455078125;
                }
                float _1860 = _1849.y;
                float _1869;
                if (0.040449999272823333740234375 < _1860)
                {
                    _1869 = pow((_1860 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
                }
                else
                {
                    _1869 = _1860 * 0.077399380505084991455078125;
                }
                float _1870 = _1849.z;
                float _1879;
                if (0.040449999272823333740234375 < _1870)
                {
                    _1879 = pow((_1870 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
                }
                else
                {
                    _1879 = _1870 * 0.077399380505084991455078125;
                }
                _1881 = vec3(_1859, _1869, _1879);
            }
            else
            {
                _1881 = _1741;
            }
            _1882 = _1881;
        }
        else
        {
            _1882 = _1741;
        }
        _1883 = _1882;
    }
    else
    {
        float _1752 = _1741.x;
        float _1761;
        if (0.003130800090730190277099609375 >= _1752)
        {
            _1761 = 12.9200000762939453125 * _1752;
        }
        else
        {
            _1761 = (1.05499994754791259765625 * pow(_1752, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
        }
        float _1762 = _1741.y;
        float _1771;
        if (0.003130800090730190277099609375 >= _1762)
        {
            _1771 = 12.9200000762939453125 * _1762;
        }
        else
        {
            _1771 = (1.05499994754791259765625 * pow(_1762, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
        }
        float _1772 = _1741.z;
        float _1781;
        if (0.003130800090730190277099609375 >= _1772)
        {
            _1781 = 12.9200000762939453125 * _1772;
        }
        else
        {
            _1781 = (1.05499994754791259765625 * pow(_1772, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
        }
        vec3 _1787 = vec3(float(_Globals.grading_lut_tex_dims.x));
        vec4 _1793 = textureLod(sampler3D(grading_lut_tex, sampler_lnc), (vec3(_1761, _1771, _1781) * (vec3(float(_Globals.grading_lut_tex_dims.x - 1u)) / _1787)) + (vec3(0.5) / _1787), 0.0);
        float _1794 = _1793.x;
        float _1803;
        if (0.040449999272823333740234375 < _1794)
        {
            _1803 = pow((_1794 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
        }
        else
        {
            _1803 = _1794 * 0.077399380505084991455078125;
        }
        float _1804 = _1793.y;
        float _1813;
        if (0.040449999272823333740234375 < _1804)
        {
            _1813 = pow((_1804 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
        }
        else
        {
            _1813 = _1804 * 0.077399380505084991455078125;
        }
        float _1814 = _1793.z;
        float _1823;
        if (0.040449999272823333740234375 < _1814)
        {
            _1823 = pow((_1814 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
        }
        else
        {
            _1823 = _1814 * 0.077399380505084991455078125;
        }
        _1883 = mix(_1741, vec3(_1803, _1813, _1823), vec3(_Globals.grading_strength));
    }
    float _1898 = (texelFetch(blue_noise_texture, ivec2(uvec2((_218 + ivec2(int(frame_constants.frame_index * 59u), int(frame_constants.frame_index * 37u))) & ivec2(255))), int(0u)).x * 2.0) - 1.0;
    vec3 _1912 = clamp(_1883 + (clamp(_1883 * 512.0, vec3(0.0), vec3(1.0)) * ((spvNMax(-1.0, _1898 * inversesqrt(abs(_1898))) - float(int(sign(_1898)))) * 0.0039215688593685626983642578125)), vec3(0.0), vec3(1.0));
    vec3 _2041;
    if (_Globals.use_icc != 0u)
    {
        ivec2 _1929 = ivec2(uvec2(ivec2(_218.x, int((_Globals.framebuffer_dims.y - 1u) - uint(_218.y)))) - uvec2(24u, 18u));
        bool _1937;
        if (all(greaterThanEqual(_1929, ivec2(0))))
        {
            _1937 = uint(_1929.x) < 88u;
        }
        else
        {
            _1937 = false;
        }
        bool _1943;
        if (_1937)
        {
            _1943 = uint(_1929.y) < 24u;
        }
        else
        {
            _1943 = false;
        }
        vec3 _1973;
        if (_1943)
        {
            uint _1947 = uint(_1929.x);
            int _1949 = int(_1947 % 32u);
            vec3 _1972;
            if (uint(_1949) < 24u)
            {
                int _1955 = int(_1947 / 32u);
                vec3 _1971;
                if (any(equal(ivec2(_1949, _1929.y), ivec2(0))))
                {
                    _1971 = _212[_1955] * (0.4199999868869781494140625 / spvNMax(_212[_1955].x, spvNMax(_212[_1955].y, _212[_1955].z)));
                }
                else
                {
                    _1971 = _212[_1955];
                }
                _1972 = _1971;
            }
            else
            {
                _1972 = _1912;
            }
            _1973 = _1972;
        }
        else
        {
            _1973 = _1912;
        }
        float _1984;
        if (0.003130800090730190277099609375 >= _1973.x)
        {
            _1984 = 12.9200000762939453125 * _1973.x;
        }
        else
        {
            _1984 = (1.05499994754791259765625 * pow(_1973.x, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
        }
        float _1994;
        if (0.003130800090730190277099609375 >= _1973.y)
        {
            _1994 = 12.9200000762939453125 * _1973.y;
        }
        else
        {
            _1994 = (1.05499994754791259765625 * pow(_1973.y, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
        }
        float _2004;
        if (0.003130800090730190277099609375 >= _1973.z)
        {
            _2004 = 12.9200000762939453125 * _1973.z;
        }
        else
        {
            _2004 = (1.05499994754791259765625 * pow(_1973.z, 0.4166666567325592041015625)) - 0.054999999701976776123046875;
        }
        vec4 _2009 = textureLod(sampler3D(icc_lut, sampler_lnc), (vec3(_1984, _1994, _2004) * vec3(0.96875)) + vec3(0.015625), 0.0);
        float _2010 = _2009.x;
        float _2019;
        if (0.040449999272823333740234375 < _2010)
        {
            _2019 = pow((_2010 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
        }
        else
        {
            _2019 = _2010 * 0.077399380505084991455078125;
        }
        float _2020 = _2009.y;
        float _2029;
        if (0.040449999272823333740234375 < _2020)
        {
            _2029 = pow((_2020 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
        }
        else
        {
            _2029 = _2020 * 0.077399380505084991455078125;
        }
        float _2030 = _2009.z;
        float _2039;
        if (0.040449999272823333740234375 < _2030)
        {
            _2039 = pow((_2030 + 0.054999999701976776123046875) * 0.947867333889007568359375, 2.400000095367431640625);
        }
        else
        {
            _2039 = _2030 * 0.077399380505084991455078125;
        }
        _2041 = vec3(_2019, _2029, _2039);
    }
    else
    {
        _2041 = _1912;
    }
    out_var_SV_TARGET = vec4(_1912.rgb, 1.0);
    out_var_SV_TARGET.rgb = test;
}

