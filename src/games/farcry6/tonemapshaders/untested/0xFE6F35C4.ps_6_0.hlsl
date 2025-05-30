#include "../../common.hlsli"
struct SExposureData {
  float SExposureData_000;
  float SExposureData_004;
  float SExposureData_008;
  float SExposureData_012;
  float SExposureData_016;
  float SExposureData_020;
};

StructuredBuffer<SExposureData> t0 : register(t0);

Texture2D<float4> t1 : register(t1);

Texture2D<float> t2 : register(t2);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t5 : register(t5);

Texture3D<float4> t6 : register(t6);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t8 : register(t8);

Texture3D<float2> t9 : register(t9);

Texture2D<float4> t10 : register(t10);

cbuffer cb0 : register(b0) {
  float cb0_028x : packoffset(c028.x);
  float cb0_028z : packoffset(c028.z);
};

cbuffer cb1 : register(b1) {
  float cb1_018y : packoffset(c018.y);
  float cb1_018z : packoffset(c018.z);
  uint cb1_018w : packoffset(c018.w);
};

cbuffer cb2 : register(b2) {
  float cb2_000x : packoffset(c000.x);
  float cb2_000y : packoffset(c000.y);
  float cb2_000z : packoffset(c000.z);
  float cb2_015x : packoffset(c015.x);
  float cb2_015y : packoffset(c015.y);
  float cb2_015z : packoffset(c015.z);
  float cb2_015w : packoffset(c015.w);
  float cb2_016x : packoffset(c016.x);
  float cb2_016y : packoffset(c016.y);
  float cb2_016z : packoffset(c016.z);
  float cb2_016w : packoffset(c016.w);
  float cb2_017x : packoffset(c017.x);
  float cb2_017y : packoffset(c017.y);
  float cb2_017z : packoffset(c017.z);
  float cb2_017w : packoffset(c017.w);
  float cb2_018x : packoffset(c018.x);
  float cb2_018y : packoffset(c018.y);
  uint cb2_019x : packoffset(c019.x);
  uint cb2_019y : packoffset(c019.y);
  uint cb2_019z : packoffset(c019.z);
  uint cb2_019w : packoffset(c019.w);
  float cb2_020x : packoffset(c020.x);
  float cb2_020y : packoffset(c020.y);
  float cb2_020z : packoffset(c020.z);
  float cb2_020w : packoffset(c020.w);
  float cb2_021x : packoffset(c021.x);
  float cb2_021y : packoffset(c021.y);
  float cb2_021z : packoffset(c021.z);
  float cb2_021w : packoffset(c021.w);
  float cb2_022x : packoffset(c022.x);
  float cb2_023x : packoffset(c023.x);
  float cb2_023y : packoffset(c023.y);
  float cb2_023z : packoffset(c023.z);
  float cb2_023w : packoffset(c023.w);
  float cb2_024x : packoffset(c024.x);
  float cb2_024y : packoffset(c024.y);
  float cb2_024z : packoffset(c024.z);
  float cb2_024w : packoffset(c024.w);
  float cb2_025x : packoffset(c025.x);
  float cb2_025y : packoffset(c025.y);
  float cb2_025z : packoffset(c025.z);
  float cb2_025w : packoffset(c025.w);
  float cb2_026x : packoffset(c026.x);
  float cb2_026z : packoffset(c026.z);
  float cb2_026w : packoffset(c026.w);
  float cb2_027x : packoffset(c027.x);
  float cb2_027y : packoffset(c027.y);
  float cb2_027z : packoffset(c027.z);
  float cb2_027w : packoffset(c027.w);
  uint cb2_069y : packoffset(c069.y);
  uint cb2_069z : packoffset(c069.z);
  uint cb2_070x : packoffset(c070.x);
  uint cb2_070y : packoffset(c070.y);
  uint cb2_070z : packoffset(c070.z);
  uint cb2_070w : packoffset(c070.w);
  uint cb2_071x : packoffset(c071.x);
  uint cb2_071y : packoffset(c071.y);
  uint cb2_071z : packoffset(c071.z);
  uint cb2_071w : packoffset(c071.w);
  uint cb2_072x : packoffset(c072.x);
  uint cb2_072y : packoffset(c072.y);
  uint cb2_072z : packoffset(c072.z);
  uint cb2_072w : packoffset(c072.w);
  uint cb2_073x : packoffset(c073.x);
  uint cb2_073y : packoffset(c073.y);
  uint cb2_073z : packoffset(c073.z);
  uint cb2_073w : packoffset(c073.w);
  uint cb2_074x : packoffset(c074.x);
  uint cb2_074y : packoffset(c074.y);
  uint cb2_074z : packoffset(c074.z);
  uint cb2_074w : packoffset(c074.w);
  uint cb2_075x : packoffset(c075.x);
  uint cb2_075y : packoffset(c075.y);
  uint cb2_075z : packoffset(c075.z);
  uint cb2_075w : packoffset(c075.w);
  uint cb2_076x : packoffset(c076.x);
  uint cb2_076y : packoffset(c076.y);
  uint cb2_076z : packoffset(c076.z);
  uint cb2_076w : packoffset(c076.w);
  uint cb2_077x : packoffset(c077.x);
  uint cb2_077y : packoffset(c077.y);
  uint cb2_077z : packoffset(c077.z);
  uint cb2_077w : packoffset(c077.w);
  uint cb2_078x : packoffset(c078.x);
  uint cb2_078y : packoffset(c078.y);
  uint cb2_078z : packoffset(c078.z);
  uint cb2_078w : packoffset(c078.w);
  uint cb2_079x : packoffset(c079.x);
  uint cb2_079y : packoffset(c079.y);
  uint cb2_079z : packoffset(c079.z);
  uint cb2_094x : packoffset(c094.x);
  uint cb2_094y : packoffset(c094.y);
  uint cb2_094z : packoffset(c094.z);
  uint cb2_094w : packoffset(c094.w);
  uint cb2_095x : packoffset(c095.x);
  float cb2_095y : packoffset(c095.y);
};

SamplerState s0_space2 : register(s0, space2);

SamplerState s2_space2 : register(s2, space2);

SamplerState s4_space2 : register(s4, space2);

struct OutputSignature {
  float4 SV_Target : SV_Target;
  float4 SV_Target_1 : SV_Target1;
};

OutputSignature main(
  linear float2 TEXCOORD0_centroid : TEXCOORD0_centroid,
  noperspective float4 SV_Position : SV_Position,
  nointerpolation uint SV_IsFrontFace : SV_IsFrontFace
) {
  float4 SV_Target;
  float4 SV_Target_1;
  float _25 = t2.SampleLevel(s4_space2, float2(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y), 0.0f);
  float4 _27 = t7.SampleLevel(s2_space2, float2(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y), 0.0f);
  float _31 = _27.x * 6.283199787139893f;
  float _32 = cos(_31);
  float _33 = sin(_31);
  float _34 = _32 * _27.z;
  float _35 = _33 * _27.z;
  float _36 = _34 + TEXCOORD0_centroid.x;
  float _37 = _35 + TEXCOORD0_centroid.y;
  float _38 = _36 * 10.0f;
  float _39 = 10.0f - _38;
  float _40 = min(_38, _39);
  float _41 = saturate(_40);
  float _42 = _41 * _34;
  float _43 = _37 * 10.0f;
  float _44 = 10.0f - _43;
  float _45 = min(_43, _44);
  float _46 = saturate(_45);
  float _47 = _46 * _35;
  float _48 = _42 + TEXCOORD0_centroid.x;
  float _49 = _47 + TEXCOORD0_centroid.y;
  float4 _50 = t7.SampleLevel(s2_space2, float2(_48, _49), 0.0f);
  float _52 = _50.w * _42;
  float _53 = _50.w * _47;
  float _54 = 1.0f - _27.y;
  float _55 = saturate(_54);
  float _56 = _52 * _55;
  float _57 = _53 * _55;
  float _61 = cb2_015x * TEXCOORD0_centroid.x;
  float _62 = cb2_015y * TEXCOORD0_centroid.y;
  float _65 = _61 + cb2_015z;
  float _66 = _62 + cb2_015w;
  float4 _67 = t8.SampleLevel(s0_space2, float2(_65, _66), 0.0f);
  float _71 = saturate(_67.x);
  float _72 = saturate(_67.z);
  float _75 = cb2_026x * _72;
  float _76 = _71 * 6.283199787139893f;
  float _77 = cos(_76);
  float _78 = sin(_76);
  float _79 = _75 * _77;
  float _80 = _78 * _75;
  float _81 = 1.0f - _67.y;
  float _82 = saturate(_81);
  float _83 = _79 * _82;
  float _84 = _80 * _82;
  float _85 = _56 + TEXCOORD0_centroid.x;
  float _86 = _85 + _83;
  float _87 = _57 + TEXCOORD0_centroid.y;
  float _88 = _87 + _84;
  float4 _89 = t7.SampleLevel(s2_space2, float2(_86, _88), 0.0f);
  bool _91 = (_89.y > 0.0f);
  float _92 = select(_91, TEXCOORD0_centroid.x, _86);
  float _93 = select(_91, TEXCOORD0_centroid.y, _88);
  float4 _94 = t1.SampleLevel(s4_space2, float2(_92, _93), 0.0f);
  float _98 = max(_94.x, 0.0f);
  float _99 = max(_94.y, 0.0f);
  float _100 = max(_94.z, 0.0f);
  float _101 = min(_98, 65000.0f);
  float _102 = min(_99, 65000.0f);
  float _103 = min(_100, 65000.0f);
  float4 _104 = t4.SampleLevel(s2_space2, float2(_92, _93), 0.0f);
  float _109 = max(_104.x, 0.0f);
  float _110 = max(_104.y, 0.0f);
  float _111 = max(_104.z, 0.0f);
  float _112 = max(_104.w, 0.0f);
  float _113 = min(_109, 5000.0f);
  float _114 = min(_110, 5000.0f);
  float _115 = min(_111, 5000.0f);
  float _116 = min(_112, 5000.0f);
  float _119 = _25.x * cb0_028z;
  float _120 = _119 + cb0_028x;
  float _121 = cb2_027w / _120;
  float _122 = 1.0f - _121;
  float _123 = abs(_122);
  float _125 = cb2_027y * _123;
  float _127 = _125 - cb2_027z;
  float _128 = saturate(_127);
  float _129 = max(_128, _116);
  float _130 = saturate(_129);
  float4 _131 = t5.SampleLevel(s2_space2, float2(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y), 0.0f);
  float _135 = _113 - _101;
  float _136 = _114 - _102;
  float _137 = _115 - _103;
  float _138 = _130 * _135;
  float _139 = _130 * _136;
  float _140 = _130 * _137;
  float _141 = _138 + _101;
  float _142 = _139 + _102;
  float _143 = _140 + _103;
  float _144 = dot(float3(_141, _142, _143), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  float _148 = t0[0].SExposureData_020;
  float _150 = t0[0].SExposureData_004;
  float _152 = cb2_018x * 0.5f;
  float _153 = _152 * cb2_018y;
  float _154 = _150.x - _153;
  float _155 = cb2_018y * cb2_018x;
  float _156 = 1.0f / _155;
  float _157 = _154 * _156;
  float _158 = _144 / _148.x;
  float _159 = _158 * 5464.01611328125f;
  float _160 = _159 + 9.99999993922529e-09f;
  float _161 = log2(_160);
  float _162 = _161 - _154;
  float _163 = _162 * _156;
  float _164 = saturate(_163);
  float2 _165 = t9.SampleLevel(s2_space2, float3(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y, _164), 0.0f);
  float _168 = max(_165.y, 1.0000000116860974e-07f);
  float _169 = _165.x / _168;
  float _170 = _169 + _157;
  float _171 = _170 / _156;
  float _172 = _171 - _150.x;
  float _173 = -0.0f - _172;
  float _175 = _173 - cb2_027x;
  float _176 = max(0.0f, _175);
  float _178 = cb2_026z * _176;
  float _179 = _172 - cb2_027x;
  float _180 = max(0.0f, _179);
  float _182 = cb2_026w * _180;
  bool _183 = (_172 < 0.0f);
  float _184 = select(_183, _178, _182);
  float _185 = exp2(_184);
  float _186 = _185 * _141;
  float _187 = _185 * _142;
  float _188 = _185 * _143;
  float _193 = cb2_024y * _131.x;
  float _194 = cb2_024z * _131.y;
  float _195 = cb2_024w * _131.z;
  float _196 = _193 + _186;
  float _197 = _194 + _187;
  float _198 = _195 + _188;
  float _203 = _196 * cb2_025x;
  float _204 = _197 * cb2_025y;
  float _205 = _198 * cb2_025z;
  float _206 = dot(float3(_203, _204, _205), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  float _207 = t0[0].SExposureData_012;
  float _209 = _206 * 5464.01611328125f;
  float _210 = _209 * _207.x;
  float _211 = _210 + 9.99999993922529e-09f;
  float _212 = log2(_211);
  float _213 = _212 + 16.929765701293945f;
  float _214 = _213 * 0.05734497308731079f;
  float _215 = saturate(_214);
  float _216 = _215 * _215;
  float _217 = _215 * 2.0f;
  float _218 = 3.0f - _217;
  float _219 = _216 * _218;
  float _220 = _204 * 0.8450999855995178f;
  float _221 = _205 * 0.14589999616146088f;
  float _222 = _220 + _221;
  float _223 = _222 * 2.4890189170837402f;
  float _224 = _222 * 0.3754962384700775f;
  float _225 = _222 * 2.811495304107666f;
  float _226 = _222 * 5.519708156585693f;
  float _227 = _206 - _223;
  float _228 = _219 * _227;
  float _229 = _228 + _223;
  float _230 = _219 * 0.5f;
  float _231 = _230 + 0.5f;
  float _232 = _231 * _227;
  float _233 = _232 + _223;
  float _234 = _203 - _224;
  float _235 = _204 - _225;
  float _236 = _205 - _226;
  float _237 = _231 * _234;
  float _238 = _231 * _235;
  float _239 = _231 * _236;
  float _240 = _237 + _224;
  float _241 = _238 + _225;
  float _242 = _239 + _226;
  float _243 = 1.0f / _233;
  float _244 = _229 * _243;
  float _245 = _244 * _240;
  float _246 = _244 * _241;
  float _247 = _244 * _242;
  float _251 = cb2_020x * TEXCOORD0_centroid.x;
  float _252 = cb2_020y * TEXCOORD0_centroid.y;
  float _255 = _251 + cb2_020z;
  float _256 = _252 + cb2_020w;
  float _259 = dot(float2(_255, _256), float2(_255, _256));
  float _260 = 1.0f - _259;
  float _261 = saturate(_260);
  float _262 = log2(_261);
  float _263 = _262 * cb2_021w;
  float _264 = exp2(_263);
  float _268 = _245 - cb2_021x;
  float _269 = _246 - cb2_021y;
  float _270 = _247 - cb2_021z;
  float _271 = _268 * _264;
  float _272 = _269 * _264;
  float _273 = _270 * _264;
  float _274 = _271 + cb2_021x;
  float _275 = _272 + cb2_021y;
  float _276 = _273 + cb2_021z;
  float _277 = t0[0].SExposureData_000;
  float _279 = max(_148.x, 0.0010000000474974513f);
  float _280 = 1.0f / _279;
  float _281 = _280 * _277.x;
  bool _284 = ((uint)(cb2_069y) == 0);
  float _290;
  float _291;
  float _292;
  float _346;
  float _347;
  float _348;
  float _379;
  float _380;
  float _381;
  float _531;
  float _568;
  float _569;
  float _570;
  float _599;
  float _600;
  float _601;
  float _682;
  float _683;
  float _684;
  float _690;
  float _691;
  float _692;
  float _706;
  float _707;
  float _708;
  float _733;
  float _745;
  float _773;
  float _785;
  float _797;
  float _798;
  float _799;
  float _826;
  float _827;
  float _828;
  if (!_284) {
    float _286 = _281 * _274;
    float _287 = _281 * _275;
    float _288 = _281 * _276;
    _290 = _286;
    _291 = _287;
    _292 = _288;
  } else {
    _290 = _274;
    _291 = _275;
    _292 = _276;
  }
  float _293 = _290 * 0.6130970120429993f;
  float _294 = mad(0.33952298760414124f, _291, _293);
  float _295 = mad(0.04737899824976921f, _292, _294);
  float _296 = _290 * 0.07019399851560593f;
  float _297 = mad(0.9163540005683899f, _291, _296);
  float _298 = mad(0.013451999984681606f, _292, _297);
  float _299 = _290 * 0.02061600051820278f;
  float _300 = mad(0.10956999659538269f, _291, _299);
  float _301 = mad(0.8698149919509888f, _292, _300);
  float _302 = log2(_295);
  float _303 = log2(_298);
  float _304 = log2(_301);
  float _305 = _302 * 0.04211956635117531f;
  float _306 = _303 * 0.04211956635117531f;
  float _307 = _304 * 0.04211956635117531f;
  float _308 = _305 + 0.6252607107162476f;
  float _309 = _306 + 0.6252607107162476f;
  float _310 = _307 + 0.6252607107162476f;
  float4 _311 = t6.SampleLevel(s2_space2, float3(_308, _309, _310), 0.0f);
  bool _317 = ((int)(uint)(cb1_018w) > (int)-1);
  if (_317 && RENODX_TONE_MAP_TYPE == 0.f) {
    float _321 = cb2_017x * _311.x;
    float _322 = cb2_017x * _311.y;
    float _323 = cb2_017x * _311.z;
    float _325 = _321 + cb2_017y;
    float _326 = _322 + cb2_017y;
    float _327 = _323 + cb2_017y;
    float _328 = exp2(_325);
    float _329 = exp2(_326);
    float _330 = exp2(_327);
    float _331 = _328 + 1.0f;
    float _332 = _329 + 1.0f;
    float _333 = _330 + 1.0f;
    float _334 = 1.0f / _331;
    float _335 = 1.0f / _332;
    float _336 = 1.0f / _333;
    float _338 = cb2_017z * _334;
    float _339 = cb2_017z * _335;
    float _340 = cb2_017z * _336;
    float _342 = _338 + cb2_017w;
    float _343 = _339 + cb2_017w;
    float _344 = _340 + cb2_017w;
    _346 = _342;
    _347 = _343;
    _348 = _344;
  } else {
    _346 = _311.x;
    _347 = _311.y;
    _348 = _311.z;
  }
  float _349 = _346 * 23.0f;
  float _350 = _349 + -14.473931312561035f;
  float _351 = exp2(_350);
  float _352 = _347 * 23.0f;
  float _353 = _352 + -14.473931312561035f;
  float _354 = exp2(_353);
  float _355 = _348 * 23.0f;
  float _356 = _355 + -14.473931312561035f;
  float _357 = exp2(_356);
  float _364 = cb2_016x - _351;
  float _365 = cb2_016y - _354;
  float _366 = cb2_016z - _357;
  float _367 = _364 * cb2_016w;
  float _368 = _365 * cb2_016w;
  float _369 = _366 * cb2_016w;
  float _370 = _367 + _351;
  float _371 = _368 + _354;
  float _372 = _369 + _357;
  if (_317 && RENODX_TONE_MAP_TYPE == 0.f) {
    float _375 = cb2_024x * _370;
    float _376 = cb2_024x * _371;
    float _377 = cb2_024x * _372;
    _379 = _375;
    _380 = _376;
    _381 = _377;
  } else {
    _379 = _370;
    _380 = _371;
    _381 = _372;
  }
  float _384 = _379 * 0.9708889722824097f;
  float _385 = mad(0.026962999254465103f, _380, _384);
  float _386 = mad(0.002148000057786703f, _381, _385);
  float _387 = _379 * 0.01088900025933981f;
  float _388 = mad(0.9869629740715027f, _380, _387);
  float _389 = mad(0.002148000057786703f, _381, _388);
  float _390 = mad(0.026962999254465103f, _380, _387);
  float _391 = mad(0.9621480107307434f, _381, _390);
  float _392 = max(_386, 0.0f);
  float _393 = max(_389, 0.0f);
  float _394 = max(_391, 0.0f);
  float _395 = min(_392, cb2_095y);
  float _396 = min(_393, cb2_095y);
  float _397 = min(_394, cb2_095y);
  bool _400 = ((uint)(cb2_095x) == 0);
  bool _403 = ((uint)(cb2_094w) == 0);
  bool _405 = ((uint)(cb2_094z) == 0);
  bool _407 = ((uint)(cb2_094y) != 0);
  bool _409 = ((uint)(cb2_094x) == 0);
  bool _411 = ((uint)(cb2_069z) != 0);
  float _458 = asfloat((uint)(cb2_075y));
  float _459 = asfloat((uint)(cb2_075z));
  float _460 = asfloat((uint)(cb2_075w));
  float _461 = asfloat((uint)(cb2_074z));
  float _462 = asfloat((uint)(cb2_074w));
  float _463 = asfloat((uint)(cb2_075x));
  float _464 = asfloat((uint)(cb2_073w));
  float _465 = asfloat((uint)(cb2_074x));
  float _466 = asfloat((uint)(cb2_074y));
  float _467 = asfloat((uint)(cb2_077x));
  float _468 = asfloat((uint)(cb2_077y));
  float _469 = asfloat((uint)(cb2_079x));
  float _470 = asfloat((uint)(cb2_079y));
  float _471 = asfloat((uint)(cb2_079z));
  float _472 = asfloat((uint)(cb2_078y));
  float _473 = asfloat((uint)(cb2_078z));
  float _474 = asfloat((uint)(cb2_078w));
  float _475 = asfloat((uint)(cb2_077z));
  float _476 = asfloat((uint)(cb2_077w));
  float _477 = asfloat((uint)(cb2_078x));
  float _478 = asfloat((uint)(cb2_072y));
  float _479 = asfloat((uint)(cb2_072z));
  float _480 = asfloat((uint)(cb2_072w));
  float _481 = asfloat((uint)(cb2_071x));
  float _482 = asfloat((uint)(cb2_071y));
  float _483 = asfloat((uint)(cb2_076x));
  float _484 = asfloat((uint)(cb2_070w));
  float _485 = asfloat((uint)(cb2_070x));
  float _486 = asfloat((uint)(cb2_070y));
  float _487 = asfloat((uint)(cb2_070z));
  float _488 = asfloat((uint)(cb2_073x));
  float _489 = asfloat((uint)(cb2_073y));
  float _490 = asfloat((uint)(cb2_073z));
  float _491 = asfloat((uint)(cb2_071z));
  float _492 = asfloat((uint)(cb2_071w));
  float _493 = asfloat((uint)(cb2_072x));
  float _494 = max(_396, _397);
  float _495 = max(_395, _494);
  float _496 = 1.0f / _495;
  float _497 = _496 * _395;
  float _498 = _496 * _396;
  float _499 = _496 * _397;
  float _500 = abs(_497);
  float _501 = log2(_500);
  float _502 = _501 * _485;
  float _503 = exp2(_502);
  float _504 = abs(_498);
  float _505 = log2(_504);
  float _506 = _505 * _486;
  float _507 = exp2(_506);
  float _508 = abs(_499);
  float _509 = log2(_508);
  float _510 = _509 * _487;
  float _511 = exp2(_510);
  if (_407) {
    float _514 = asfloat((uint)(cb2_076w));
    float _516 = asfloat((uint)(cb2_076z));
    float _518 = asfloat((uint)(cb2_076y));
    float _519 = _516 * _396;
    float _520 = _518 * _395;
    float _521 = _514 * _397;
    float _522 = _520 + _521;
    float _523 = _522 + _519;
    _531 = _523;
  } else {
    float _525 = _492 * _396;
    float _526 = _491 * _395;
    float _527 = _493 * _397;
    float _528 = _525 + _526;
    float _529 = _528 + _527;
    _531 = _529;
  }
  float _532 = abs(_531);
  float _533 = log2(_532);
  float _534 = _533 * _484;
  float _535 = exp2(_534);
  float _536 = log2(_535);
  float _537 = _536 * _483;
  float _538 = exp2(_537);
  float _539 = select(_411, _538, _535);
  float _540 = _539 * _481;
  float _541 = _540 + _482;
  float _542 = 1.0f / _541;
  float _543 = _542 * _535;
  if (_407) {
    if (!_409) {
      float _546 = _503 * _475;
      float _547 = _507 * _476;
      float _548 = _511 * _477;
      float _549 = _547 + _546;
      float _550 = _549 + _548;
      float _551 = _507 * _473;
      float _552 = _503 * _472;
      float _553 = _511 * _474;
      float _554 = _551 + _552;
      float _555 = _554 + _553;
      float _556 = _511 * _471;
      float _557 = _507 * _470;
      float _558 = _503 * _469;
      float _559 = _557 + _558;
      float _560 = _559 + _556;
      float _561 = max(_555, _560);
      float _562 = max(_550, _561);
      float _563 = 1.0f / _562;
      float _564 = _563 * _550;
      float _565 = _563 * _555;
      float _566 = _563 * _560;
      _568 = _564;
      _569 = _565;
      _570 = _566;
    } else {
      _568 = _503;
      _569 = _507;
      _570 = _511;
    }
    float _571 = _568 * _468;
    float _572 = exp2(_571);
    float _573 = _572 * _467;
    float _574 = saturate(_573);
    float _575 = _568 * _467;
    float _576 = _568 - _575;
    float _577 = saturate(_576);
    float _578 = max(_467, _577);
    float _579 = min(_578, _574);
    float _580 = _569 * _468;
    float _581 = exp2(_580);
    float _582 = _581 * _467;
    float _583 = saturate(_582);
    float _584 = _569 * _467;
    float _585 = _569 - _584;
    float _586 = saturate(_585);
    float _587 = max(_467, _586);
    float _588 = min(_587, _583);
    float _589 = _570 * _468;
    float _590 = exp2(_589);
    float _591 = _590 * _467;
    float _592 = saturate(_591);
    float _593 = _570 * _467;
    float _594 = _570 - _593;
    float _595 = saturate(_594);
    float _596 = max(_467, _595);
    float _597 = min(_596, _592);
    _599 = _579;
    _600 = _588;
    _601 = _597;
  } else {
    _599 = _503;
    _600 = _507;
    _601 = _511;
  }
  float _602 = _599 * _491;
  float _603 = _600 * _492;
  float _604 = _603 + _602;
  float _605 = _601 * _493;
  float _606 = _604 + _605;
  float _607 = 1.0f / _606;
  float _608 = _607 * _543;
  float _609 = saturate(_608);
  float _610 = _609 * _599;
  float _611 = saturate(_610);
  float _612 = _609 * _600;
  float _613 = saturate(_612);
  float _614 = _609 * _601;
  float _615 = saturate(_614);
  float _616 = _611 * _478;
  float _617 = _478 - _616;
  float _618 = _613 * _479;
  float _619 = _479 - _618;
  float _620 = _615 * _480;
  float _621 = _480 - _620;
  float _622 = _615 * _493;
  float _623 = _611 * _491;
  float _624 = _613 * _492;
  float _625 = _543 - _623;
  float _626 = _625 - _624;
  float _627 = _626 - _622;
  float _628 = saturate(_627);
  float _629 = _619 * _492;
  float _630 = _617 * _491;
  float _631 = _621 * _493;
  float _632 = _629 + _630;
  float _633 = _632 + _631;
  float _634 = 1.0f / _633;
  float _635 = _634 * _628;
  float _636 = _635 * _617;
  float _637 = _636 + _611;
  float _638 = saturate(_637);
  float _639 = _635 * _619;
  float _640 = _639 + _613;
  float _641 = saturate(_640);
  float _642 = _635 * _621;
  float _643 = _642 + _615;
  float _644 = saturate(_643);
  float _645 = _644 * _493;
  float _646 = _638 * _491;
  float _647 = _641 * _492;
  float _648 = _543 - _646;
  float _649 = _648 - _647;
  float _650 = _649 - _645;
  float _651 = saturate(_650);
  float _652 = _651 * _488;
  float _653 = _652 + _638;
  float _654 = saturate(_653);
  float _655 = _651 * _489;
  float _656 = _655 + _641;
  float _657 = saturate(_656);
  float _658 = _651 * _490;
  float _659 = _658 + _644;
  float _660 = saturate(_659);
  if (!_405) {
    float _662 = _654 * _464;
    float _663 = _657 * _465;
    float _664 = _660 * _466;
    float _665 = _663 + _662;
    float _666 = _665 + _664;
    float _667 = _657 * _462;
    float _668 = _654 * _461;
    float _669 = _660 * _463;
    float _670 = _667 + _668;
    float _671 = _670 + _669;
    float _672 = _660 * _460;
    float _673 = _657 * _459;
    float _674 = _654 * _458;
    float _675 = _673 + _674;
    float _676 = _675 + _672;
    if (!_403) {
      float _678 = saturate(_666);
      float _679 = saturate(_671);
      float _680 = saturate(_676);
      _682 = _680;
      _683 = _679;
      _684 = _678;
    } else {
      _682 = _676;
      _683 = _671;
      _684 = _666;
    }
  } else {
    _682 = _660;
    _683 = _657;
    _684 = _654;
  }
  if (!_400) {
    float _686 = _684 * _464;
    float _687 = _683 * _464;
    float _688 = _682 * _464;
    _690 = _688;
    _691 = _687;
    _692 = _686;
  } else {
    _690 = _682;
    _691 = _683;
    _692 = _684;
  }
  if (_317) {
    float _696 = cb1_018z * 9.999999747378752e-05f;
    float _697 = _696 * _692;
    float _698 = _696 * _691;
    float _699 = _696 * _690;
    float _701 = 5000.0f / cb1_018y;
    float _702 = _697 * _701;
    float _703 = _698 * _701;
    float _704 = _699 * _701;
    _706 = _702;
    _707 = _703;
    _708 = _704;
  } else {
    _706 = _692;
    _707 = _691;
    _708 = _690;
  }
  float _709 = _706 * 1.6047500371932983f;
  float _710 = mad(-0.5310800075531006f, _707, _709);
  float _711 = mad(-0.07366999983787537f, _708, _710);
  float _712 = _706 * -0.10208000242710114f;
  float _713 = mad(1.1081299781799316f, _707, _712);
  float _714 = mad(-0.006049999967217445f, _708, _713);
  float _715 = _706 * -0.0032599999103695154f;
  float _716 = mad(-0.07275000214576721f, _707, _715);
  float _717 = mad(1.0760200023651123f, _708, _716);
  if (_317) {
    // float _719 = max(_711, 0.0f);
    // float _720 = max(_714, 0.0f);
    // float _721 = max(_717, 0.0f);
    // bool _722 = !(_719 >= 0.0030399328097701073f);
    // if (!_722) {
    //   float _724 = abs(_719);
    //   float _725 = log2(_724);
    //   float _726 = _725 * 0.4166666567325592f;
    //   float _727 = exp2(_726);
    //   float _728 = _727 * 1.0549999475479126f;
    //   float _729 = _728 + -0.054999999701976776f;
    //   _733 = _729;
    // } else {
    //   float _731 = _719 * 12.923210144042969f;
    //   _733 = _731;
    // }
    // bool _734 = !(_720 >= 0.0030399328097701073f);
    // if (!_734) {
    //   float _736 = abs(_720);
    //   float _737 = log2(_736);
    //   float _738 = _737 * 0.4166666567325592f;
    //   float _739 = exp2(_738);
    //   float _740 = _739 * 1.0549999475479126f;
    //   float _741 = _740 + -0.054999999701976776f;
    //   _745 = _741;
    // } else {
    //   float _743 = _720 * 12.923210144042969f;
    //   _745 = _743;
    // }
    // bool _746 = !(_721 >= 0.0030399328097701073f);
    // if (!_746) {
    //   float _748 = abs(_721);
    //   float _749 = log2(_748);
    //   float _750 = _749 * 0.4166666567325592f;
    //   float _751 = exp2(_750);
    //   float _752 = _751 * 1.0549999475479126f;
    //   float _753 = _752 + -0.054999999701976776f;
    //   _826 = _733;
    //   _827 = _745;
    //   _828 = _753;
    // } else {
    //   float _755 = _721 * 12.923210144042969f;
    //   _826 = _733;
    //   _827 = _745;
    //   _828 = _755;
    // }
    _826 = renodx::color::srgb::EncodeSafe(_711);
    _827 = renodx::color::srgb::EncodeSafe(_714);
    _828 = renodx::color::srgb::EncodeSafe(_717);

  } else {
    float _757 = saturate(_711);
    float _758 = saturate(_714);
    float _759 = saturate(_717);
    bool _760 = ((uint)(cb1_018w) == -2);
    if (!_760) {
      bool _762 = !(_757 >= 0.0030399328097701073f);
      if (!_762) {
        float _764 = abs(_757);
        float _765 = log2(_764);
        float _766 = _765 * 0.4166666567325592f;
        float _767 = exp2(_766);
        float _768 = _767 * 1.0549999475479126f;
        float _769 = _768 + -0.054999999701976776f;
        _773 = _769;
      } else {
        float _771 = _757 * 12.923210144042969f;
        _773 = _771;
      }
      bool _774 = !(_758 >= 0.0030399328097701073f);
      if (!_774) {
        float _776 = abs(_758);
        float _777 = log2(_776);
        float _778 = _777 * 0.4166666567325592f;
        float _779 = exp2(_778);
        float _780 = _779 * 1.0549999475479126f;
        float _781 = _780 + -0.054999999701976776f;
        _785 = _781;
      } else {
        float _783 = _758 * 12.923210144042969f;
        _785 = _783;
      }
      bool _786 = !(_759 >= 0.0030399328097701073f);
      if (!_786) {
        float _788 = abs(_759);
        float _789 = log2(_788);
        float _790 = _789 * 0.4166666567325592f;
        float _791 = exp2(_790);
        float _792 = _791 * 1.0549999475479126f;
        float _793 = _792 + -0.054999999701976776f;
        _797 = _773;
        _798 = _785;
        _799 = _793;
      } else {
        float _795 = _759 * 12.923210144042969f;
        _797 = _773;
        _798 = _785;
        _799 = _795;
      }
    } else {
      _797 = _757;
      _798 = _758;
      _799 = _759;
    }
    float _804 = abs(_797);
    float _805 = abs(_798);
    float _806 = abs(_799);
    float _807 = log2(_804);
    float _808 = log2(_805);
    float _809 = log2(_806);
    float _810 = _807 * cb2_000z;
    float _811 = _808 * cb2_000z;
    float _812 = _809 * cb2_000z;
    float _813 = exp2(_810);
    float _814 = exp2(_811);
    float _815 = exp2(_812);
    float _816 = _813 * cb2_000y;
    float _817 = _814 * cb2_000y;
    float _818 = _815 * cb2_000y;
    float _819 = _816 + cb2_000x;
    float _820 = _817 + cb2_000x;
    float _821 = _818 + cb2_000x;
    float _822 = saturate(_819);
    float _823 = saturate(_820);
    float _824 = saturate(_821);
    _826 = _822;
    _827 = _823;
    _828 = _824;
  }
  float _832 = cb2_023x * TEXCOORD0_centroid.x;
  float _833 = cb2_023y * TEXCOORD0_centroid.y;
  float _836 = _832 + cb2_023z;
  float _837 = _833 + cb2_023w;
  float4 _840 = t10.SampleLevel(s0_space2, float2(_836, _837), 0.0f);
  float _842 = _840.x + -0.5f;
  float _843 = _842 * cb2_022x;
  float _844 = _843 + 0.5f;
  float _845 = _844 * 2.0f;
  float _846 = _845 * _826;
  float _847 = _845 * _827;
  float _848 = _845 * _828;
  float _852 = float((uint)(cb2_019z));
  float _853 = float((uint)(cb2_019w));
  float _854 = _852 + SV_Position.x;
  float _855 = _853 + SV_Position.y;
  uint _856 = uint(_854);
  uint _857 = uint(_855);
  uint _860 = cb2_019x + -1u;
  uint _861 = cb2_019y + -1u;
  int _862 = _856 & _860;
  int _863 = _857 & _861;
  float4 _864 = t3.Load(int3(_862, _863, 0));
  float _868 = _864.x * 2.0f;
  float _869 = _864.y * 2.0f;
  float _870 = _864.z * 2.0f;
  float _871 = _868 + -1.0f;
  float _872 = _869 + -1.0f;
  float _873 = _870 + -1.0f;
  float _874 = _871 * cb2_025w;
  float _875 = _872 * cb2_025w;
  float _876 = _873 * cb2_025w;
  float _877 = _874 + _846;
  float _878 = _875 + _847;
  float _879 = _876 + _848;
  float _880 = dot(float3(_877, _878, _879), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  SV_Target.x = _877;
  SV_Target.y = _878;
  SV_Target.z = _879;
  SV_Target.w = _880;
  SV_Target_1.x = _880;
  SV_Target_1.y = 0.0f;
  SV_Target_1.z = 0.0f;
  SV_Target_1.w = 0.0f;
  OutputSignature output_signature = { SV_Target, SV_Target_1 };
  return output_signature;
}
