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

Texture3D<float4> t5 : register(t5);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t8 : register(t8);

Texture3D<float2> t9 : register(t9);

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
  float cb2_001x : packoffset(c001.x);
  float cb2_001y : packoffset(c001.y);
  float cb2_001z : packoffset(c001.z);
  float cb2_002x : packoffset(c002.x);
  float cb2_002y : packoffset(c002.y);
  float cb2_002z : packoffset(c002.z);
  float cb2_002w : packoffset(c002.w);
  float cb2_005x : packoffset(c005.x);
  float cb2_006x : packoffset(c006.x);
  float cb2_006y : packoffset(c006.y);
  float cb2_006z : packoffset(c006.z);
  float cb2_006w : packoffset(c006.w);
  float cb2_007x : packoffset(c007.x);
  float cb2_007y : packoffset(c007.y);
  float cb2_007z : packoffset(c007.z);
  float cb2_007w : packoffset(c007.w);
  float cb2_008x : packoffset(c008.x);
  float cb2_008y : packoffset(c008.y);
  float cb2_008z : packoffset(c008.z);
  float cb2_008w : packoffset(c008.w);
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
  float cb2_020x : packoffset(c020.x);
  float cb2_020y : packoffset(c020.y);
  float cb2_020z : packoffset(c020.z);
  float cb2_020w : packoffset(c020.w);
  float cb2_021x : packoffset(c021.x);
  float cb2_021y : packoffset(c021.y);
  float cb2_021z : packoffset(c021.z);
  float cb2_021w : packoffset(c021.w);
  float cb2_024x : packoffset(c024.x);
  float cb2_024y : packoffset(c024.y);
  float cb2_024z : packoffset(c024.z);
  float cb2_024w : packoffset(c024.w);
  float cb2_025x : packoffset(c025.x);
  float cb2_025y : packoffset(c025.y);
  float cb2_025z : packoffset(c025.z);
  float cb2_026x : packoffset(c026.x);
  float cb2_026z : packoffset(c026.z);
  float cb2_026w : packoffset(c026.w);
  float cb2_027x : packoffset(c027.x);
  float cb2_027y : packoffset(c027.y);
  float cb2_027z : packoffset(c027.z);
  float cb2_027w : packoffset(c027.w);
  uint cb2_069y : packoffset(c069.y);
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
  float _22 = t2.SampleLevel(s4_space2, float2(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y), 0.0f);
  float4 _24 = t7.SampleLevel(s2_space2, float2(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y), 0.0f);
  float _28 = _24.x * 6.283199787139893f;
  float _29 = cos(_28);
  float _30 = sin(_28);
  float _31 = _29 * _24.z;
  float _32 = _30 * _24.z;
  float _33 = _31 + TEXCOORD0_centroid.x;
  float _34 = _32 + TEXCOORD0_centroid.y;
  float _35 = _33 * 10.0f;
  float _36 = 10.0f - _35;
  float _37 = min(_35, _36);
  float _38 = saturate(_37);
  float _39 = _38 * _31;
  float _40 = _34 * 10.0f;
  float _41 = 10.0f - _40;
  float _42 = min(_40, _41);
  float _43 = saturate(_42);
  float _44 = _43 * _32;
  float _45 = _39 + TEXCOORD0_centroid.x;
  float _46 = _44 + TEXCOORD0_centroid.y;
  float4 _47 = t7.SampleLevel(s2_space2, float2(_45, _46), 0.0f);
  float _49 = _47.w * _39;
  float _50 = _47.w * _44;
  float _51 = 1.0f - _24.y;
  float _52 = saturate(_51);
  float _53 = _49 * _52;
  float _54 = _50 * _52;
  float _58 = cb2_015x * TEXCOORD0_centroid.x;
  float _59 = cb2_015y * TEXCOORD0_centroid.y;
  float _62 = _58 + cb2_015z;
  float _63 = _59 + cb2_015w;
  float4 _64 = t8.SampleLevel(s0_space2, float2(_62, _63), 0.0f);
  float _68 = saturate(_64.x);
  float _69 = saturate(_64.z);
  float _72 = cb2_026x * _69;
  float _73 = _68 * 6.283199787139893f;
  float _74 = cos(_73);
  float _75 = sin(_73);
  float _76 = _72 * _74;
  float _77 = _75 * _72;
  float _78 = 1.0f - _64.y;
  float _79 = saturate(_78);
  float _80 = _76 * _79;
  float _81 = _77 * _79;
  float _82 = _53 + TEXCOORD0_centroid.x;
  float _83 = _82 + _80;
  float _84 = _54 + TEXCOORD0_centroid.y;
  float _85 = _84 + _81;
  float4 _86 = t7.SampleLevel(s2_space2, float2(_83, _85), 0.0f);
  bool _88 = (_86.y > 0.0f);
  float _89 = select(_88, TEXCOORD0_centroid.x, _83);
  float _90 = select(_88, TEXCOORD0_centroid.y, _85);
  float4 _91 = t1.SampleLevel(s4_space2, float2(_89, _90), 0.0f);
  float _95 = max(_91.x, 0.0f);
  float _96 = max(_91.y, 0.0f);
  float _97 = max(_91.z, 0.0f);
  float _98 = min(_95, 65000.0f);
  float _99 = min(_96, 65000.0f);
  float _100 = min(_97, 65000.0f);
  float4 _101 = t3.SampleLevel(s2_space2, float2(_89, _90), 0.0f);
  float _106 = max(_101.x, 0.0f);
  float _107 = max(_101.y, 0.0f);
  float _108 = max(_101.z, 0.0f);
  float _109 = max(_101.w, 0.0f);
  float _110 = min(_106, 5000.0f);
  float _111 = min(_107, 5000.0f);
  float _112 = min(_108, 5000.0f);
  float _113 = min(_109, 5000.0f);
  float _116 = _22.x * cb0_028z;
  float _117 = _116 + cb0_028x;
  float _118 = cb2_027w / _117;
  float _119 = 1.0f - _118;
  float _120 = abs(_119);
  float _122 = cb2_027y * _120;
  float _124 = _122 - cb2_027z;
  float _125 = saturate(_124);
  float _126 = max(_125, _113);
  float _127 = saturate(_126);
  float _131 = cb2_006x * _89;
  float _132 = cb2_006y * _90;
  float _135 = _131 + cb2_006z;
  float _136 = _132 + cb2_006w;
  float _140 = cb2_007x * _89;
  float _141 = cb2_007y * _90;
  float _144 = _140 + cb2_007z;
  float _145 = _141 + cb2_007w;
  float _149 = cb2_008x * _89;
  float _150 = cb2_008y * _90;
  float _153 = _149 + cb2_008z;
  float _154 = _150 + cb2_008w;
  float4 _155 = t1.SampleLevel(s2_space2, float2(_135, _136), 0.0f);
  float _157 = max(_155.x, 0.0f);
  float _158 = min(_157, 65000.0f);
  float4 _159 = t1.SampleLevel(s2_space2, float2(_144, _145), 0.0f);
  float _161 = max(_159.y, 0.0f);
  float _162 = min(_161, 65000.0f);
  float4 _163 = t1.SampleLevel(s2_space2, float2(_153, _154), 0.0f);
  float _165 = max(_163.z, 0.0f);
  float _166 = min(_165, 65000.0f);
  float4 _167 = t3.SampleLevel(s2_space2, float2(_135, _136), 0.0f);
  float _169 = max(_167.x, 0.0f);
  float _170 = min(_169, 5000.0f);
  float4 _171 = t3.SampleLevel(s2_space2, float2(_144, _145), 0.0f);
  float _173 = max(_171.y, 0.0f);
  float _174 = min(_173, 5000.0f);
  float4 _175 = t3.SampleLevel(s2_space2, float2(_153, _154), 0.0f);
  float _177 = max(_175.z, 0.0f);
  float _178 = min(_177, 5000.0f);
  float4 _179 = t6.SampleLevel(s2_space2, float2(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y), 0.0f);
  float _185 = cb2_005x * _179.x;
  float _186 = cb2_005x * _179.y;
  float _187 = cb2_005x * _179.z;
  float _188 = _158 - _98;
  float _189 = _162 - _99;
  float _190 = _166 - _100;
  float _191 = _185 * _188;
  float _192 = _186 * _189;
  float _193 = _187 * _190;
  float _194 = _191 + _98;
  float _195 = _192 + _99;
  float _196 = _193 + _100;
  float _197 = _170 - _110;
  float _198 = _174 - _111;
  float _199 = _178 - _112;
  float _200 = _185 * _197;
  float _201 = _186 * _198;
  float _202 = _187 * _199;
  float _203 = _200 + _110;
  float _204 = _201 + _111;
  float _205 = _202 + _112;
  float4 _206 = t4.SampleLevel(s2_space2, float2(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y), 0.0f);
  float _210 = _203 - _194;
  float _211 = _204 - _195;
  float _212 = _205 - _196;
  float _213 = _210 * _127;
  float _214 = _211 * _127;
  float _215 = _212 * _127;
  float _216 = _213 + _194;
  float _217 = _214 + _195;
  float _218 = _215 + _196;
  float _219 = dot(float3(_216, _217, _218), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  float _223 = t0[0].SExposureData_020;
  float _225 = t0[0].SExposureData_004;
  float _227 = cb2_018x * 0.5f;
  float _228 = _227 * cb2_018y;
  float _229 = _225.x - _228;
  float _230 = cb2_018y * cb2_018x;
  float _231 = 1.0f / _230;
  float _232 = _229 * _231;
  float _233 = _219 / _223.x;
  float _234 = _233 * 5464.01611328125f;
  float _235 = _234 + 9.99999993922529e-09f;
  float _236 = log2(_235);
  float _237 = _236 - _229;
  float _238 = _237 * _231;
  float _239 = saturate(_238);
  float2 _240 = t9.SampleLevel(s2_space2, float3(TEXCOORD0_centroid.x, TEXCOORD0_centroid.y, _239), 0.0f);
  float _243 = max(_240.y, 1.0000000116860974e-07f);
  float _244 = _240.x / _243;
  float _245 = _244 + _232;
  float _246 = _245 / _231;
  float _247 = _246 - _225.x;
  float _248 = -0.0f - _247;
  float _250 = _248 - cb2_027x;
  float _251 = max(0.0f, _250);
  float _253 = cb2_026z * _251;
  float _254 = _247 - cb2_027x;
  float _255 = max(0.0f, _254);
  float _257 = cb2_026w * _255;
  bool _258 = (_247 < 0.0f);
  float _259 = select(_258, _253, _257);
  float _260 = exp2(_259);
  float _261 = _260 * _216;
  float _262 = _260 * _217;
  float _263 = _260 * _218;
  float _268 = cb2_024y * _206.x;
  float _269 = cb2_024z * _206.y;
  float _270 = cb2_024w * _206.z;
  float _271 = _268 + _261;
  float _272 = _269 + _262;
  float _273 = _270 + _263;
  float _278 = _271 * cb2_025x;
  float _279 = _272 * cb2_025y;
  float _280 = _273 * cb2_025z;
  float _281 = dot(float3(_278, _279, _280), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  float _282 = t0[0].SExposureData_012;
  float _284 = _281 * 5464.01611328125f;
  float _285 = _284 * _282.x;
  float _286 = _285 + 9.99999993922529e-09f;
  float _287 = log2(_286);
  float _288 = _287 + 16.929765701293945f;
  float _289 = _288 * 0.05734497308731079f;
  float _290 = saturate(_289);
  float _291 = _290 * _290;
  float _292 = _290 * 2.0f;
  float _293 = 3.0f - _292;
  float _294 = _291 * _293;
  float _295 = _279 * 0.8450999855995178f;
  float _296 = _280 * 0.14589999616146088f;
  float _297 = _295 + _296;
  float _298 = _297 * 2.4890189170837402f;
  float _299 = _297 * 0.3754962384700775f;
  float _300 = _297 * 2.811495304107666f;
  float _301 = _297 * 5.519708156585693f;
  float _302 = _281 - _298;
  float _303 = _294 * _302;
  float _304 = _303 + _298;
  float _305 = _294 * 0.5f;
  float _306 = _305 + 0.5f;
  float _307 = _306 * _302;
  float _308 = _307 + _298;
  float _309 = _278 - _299;
  float _310 = _279 - _300;
  float _311 = _280 - _301;
  float _312 = _306 * _309;
  float _313 = _306 * _310;
  float _314 = _306 * _311;
  float _315 = _312 + _299;
  float _316 = _313 + _300;
  float _317 = _314 + _301;
  float _318 = 1.0f / _308;
  float _319 = _304 * _318;
  float _320 = _319 * _315;
  float _321 = _319 * _316;
  float _322 = _319 * _317;
  float _326 = cb2_020x * TEXCOORD0_centroid.x;
  float _327 = cb2_020y * TEXCOORD0_centroid.y;
  float _330 = _326 + cb2_020z;
  float _331 = _327 + cb2_020w;
  float _334 = dot(float2(_330, _331), float2(_330, _331));
  float _335 = 1.0f - _334;
  float _336 = saturate(_335);
  float _337 = log2(_336);
  float _338 = _337 * cb2_021w;
  float _339 = exp2(_338);
  float _343 = _320 - cb2_021x;
  float _344 = _321 - cb2_021y;
  float _345 = _322 - cb2_021z;
  float _346 = _343 * _339;
  float _347 = _344 * _339;
  float _348 = _345 * _339;
  float _349 = _346 + cb2_021x;
  float _350 = _347 + cb2_021y;
  float _351 = _348 + cb2_021z;
  float _352 = t0[0].SExposureData_000;
  float _354 = max(_223.x, 0.0010000000474974513f);
  float _355 = 1.0f / _354;
  float _356 = _355 * _352.x;
  bool _359 = ((uint)(cb2_069y) == 0);
  float _365;
  float _366;
  float _367;
  float _421;
  float _422;
  float _423;
  float _498;
  float _499;
  float _500;
  float _601;
  float _602;
  float _603;
  float _628;
  float _640;
  float _668;
  float _680;
  float _692;
  float _693;
  float _694;
  float _721;
  float _722;
  float _723;
  if (!_359) {
    float _361 = _356 * _349;
    float _362 = _356 * _350;
    float _363 = _356 * _351;
    _365 = _361;
    _366 = _362;
    _367 = _363;
  } else {
    _365 = _349;
    _366 = _350;
    _367 = _351;
  }
  float _368 = _365 * 0.6130970120429993f;
  float _369 = mad(0.33952298760414124f, _366, _368);
  float _370 = mad(0.04737899824976921f, _367, _369);
  float _371 = _365 * 0.07019399851560593f;
  float _372 = mad(0.9163540005683899f, _366, _371);
  float _373 = mad(0.013451999984681606f, _367, _372);
  float _374 = _365 * 0.02061600051820278f;
  float _375 = mad(0.10956999659538269f, _366, _374);
  float _376 = mad(0.8698149919509888f, _367, _375);
  float _377 = log2(_370);
  float _378 = log2(_373);
  float _379 = log2(_376);
  float _380 = _377 * 0.04211956635117531f;
  float _381 = _378 * 0.04211956635117531f;
  float _382 = _379 * 0.04211956635117531f;
  float _383 = _380 + 0.6252607107162476f;
  float _384 = _381 + 0.6252607107162476f;
  float _385 = _382 + 0.6252607107162476f;
  float4 _386 = t5.SampleLevel(s2_space2, float3(_383, _384, _385), 0.0f);
  bool _392 = ((int)(uint)(cb1_018w) > (int)-1);
  if (_392 && RENODX_TONE_MAP_TYPE == 0.f) {
    float _396 = cb2_017x * _386.x;
    float _397 = cb2_017x * _386.y;
    float _398 = cb2_017x * _386.z;
    float _400 = _396 + cb2_017y;
    float _401 = _397 + cb2_017y;
    float _402 = _398 + cb2_017y;
    float _403 = exp2(_400);
    float _404 = exp2(_401);
    float _405 = exp2(_402);
    float _406 = _403 + 1.0f;
    float _407 = _404 + 1.0f;
    float _408 = _405 + 1.0f;
    float _409 = 1.0f / _406;
    float _410 = 1.0f / _407;
    float _411 = 1.0f / _408;
    float _413 = cb2_017z * _409;
    float _414 = cb2_017z * _410;
    float _415 = cb2_017z * _411;
    float _417 = _413 + cb2_017w;
    float _418 = _414 + cb2_017w;
    float _419 = _415 + cb2_017w;
    _421 = _417;
    _422 = _418;
    _423 = _419;
  } else {
    _421 = _386.x;
    _422 = _386.y;
    _423 = _386.z;
  }
  float _424 = _421 * 23.0f;
  float _425 = _424 + -14.473931312561035f;
  float _426 = exp2(_425);
  float _427 = _422 * 23.0f;
  float _428 = _427 + -14.473931312561035f;
  float _429 = exp2(_428);
  float _430 = _423 * 23.0f;
  float _431 = _430 + -14.473931312561035f;
  float _432 = exp2(_431);
  float _433 = dot(float3(_426, _429, _432), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
  float _438 = dot(float3(_426, _429, _432), float3(_426, _429, _432));
  float _439 = rsqrt(_438);
  float _440 = _439 * _426;
  float _441 = _439 * _429;
  float _442 = _439 * _432;
  float _443 = cb2_001x - _440;
  float _444 = cb2_001y - _441;
  float _445 = cb2_001z - _442;
  float _446 = dot(float3(_443, _444, _445), float3(_443, _444, _445));
  float _449 = cb2_002z * _446;
  float _451 = _449 + cb2_002w;
  float _452 = saturate(_451);
  float _454 = cb2_002x * _452;
  float _455 = _433 - _426;
  float _456 = _433 - _429;
  float _457 = _433 - _432;
  float _458 = _454 * _455;
  float _459 = _454 * _456;
  float _460 = _454 * _457;
  float _461 = _458 + _426;
  float _462 = _459 + _429;
  float _463 = _460 + _432;
  float _465 = cb2_002y * _452;
  float _466 = 0.10000000149011612f - _461;
  float _467 = 0.10000000149011612f - _462;
  float _468 = 0.10000000149011612f - _463;
  float _469 = _466 * _465;
  float _470 = _467 * _465;
  float _471 = _468 * _465;
  float _472 = _469 + _461;
  float _473 = _470 + _462;
  float _474 = _471 + _463;
  float _475 = saturate(_472);
  float _476 = saturate(_473);
  float _477 = saturate(_474);
  float _483 = cb2_016x - _475;
  float _484 = cb2_016y - _476;
  float _485 = cb2_016z - _477;
  float _486 = _483 * cb2_016w;
  float _487 = _484 * cb2_016w;
  float _488 = _485 * cb2_016w;
  float _489 = _486 + _475;
  float _490 = _487 + _476;
  float _491 = _488 + _477;
  if (_392 && RENODX_TONE_MAP_TYPE == 0.f) {
    float _494 = cb2_024x * _489;
    float _495 = cb2_024x * _490;
    float _496 = cb2_024x * _491;
    _498 = _494;
    _499 = _495;
    _500 = _496;
  } else {
    _498 = _489;
    _499 = _490;
    _500 = _491;
  }
  float _501 = _498 * 0.9708889722824097f;
  float _502 = mad(0.026962999254465103f, _499, _501);
  float _503 = mad(0.002148000057786703f, _500, _502);
  float _504 = _498 * 0.01088900025933981f;
  float _505 = mad(0.9869629740715027f, _499, _504);
  float _506 = mad(0.002148000057786703f, _500, _505);
  float _507 = mad(0.026962999254465103f, _499, _504);
  float _508 = mad(0.9621480107307434f, _500, _507);
  if (_392) {
    if (RENODX_TONE_MAP_TYPE == 0.f) {
        float _513 = cb1_018y * 0.10000000149011612f;
        float _514 = log2(cb1_018z);
        float _515 = _514 + -13.287712097167969f;
        float _516 = _515 * 1.4929734468460083f;
        float _517 = _516 + 18.0f;
        float _518 = exp2(_517);
        float _519 = _518 * 0.18000000715255737f;
        float _520 = abs(_519);
        float _521 = log2(_520);
        float _522 = _521 * 1.5f;
        float _523 = exp2(_522);
        float _524 = _523 * _513;
        float _525 = _524 / cb1_018z;
        float _526 = _525 + -0.07636754959821701f;
        float _527 = _521 * 1.2750000953674316f;
        float _528 = exp2(_527);
        float _529 = _528 * 0.07636754959821701f;
        float _530 = cb1_018y * 0.011232397519052029f;
        float _531 = _530 * _523;
        float _532 = _531 / cb1_018z;
        float _533 = _529 - _532;
        float _534 = _528 + -0.11232396960258484f;
        float _535 = _534 * _513;
        float _536 = _535 / cb1_018z;
        float _537 = _536 * cb1_018z;
        float _538 = abs(_503);
        float _539 = abs(_506);
        float _540 = abs(_508);
        float _541 = log2(_538);
        float _542 = log2(_539);
        float _543 = log2(_540);
        float _544 = _541 * 1.5f;
        float _545 = _542 * 1.5f;
        float _546 = _543 * 1.5f;
        float _547 = exp2(_544);
        float _548 = exp2(_545);
        float _549 = exp2(_546);
        float _550 = _547 * _537;
        float _551 = _548 * _537;
        float _552 = _549 * _537;
        float _553 = _541 * 1.2750000953674316f;
        float _554 = _542 * 1.2750000953674316f;
        float _555 = _543 * 1.2750000953674316f;
        float _556 = exp2(_553);
        float _557 = exp2(_554);
        float _558 = exp2(_555);
        float _559 = _556 * _526;
        float _560 = _557 * _526;
        float _561 = _558 * _526;
        float _562 = _559 + _533;
        float _563 = _560 + _533;
        float _564 = _561 + _533;
        float _565 = _550 / _562;
        float _566 = _551 / _563;
        float _567 = _552 / _564;
        float _568 = _565 * 9.999999747378752e-05f;
        float _569 = _566 * 9.999999747378752e-05f;
        float _570 = _567 * 9.999999747378752e-05f;
        float _571 = 5000.0f / cb1_018y;
        float _572 = _568 * _571;
        float _573 = _569 * _571;
        float _574 = _570 * _571;
        _601 = _572;
        _602 = _573;
        _603 = _574;
    } else {
      float3 tonemapped = ApplyCustomToneMap(float3(_503, _506, _508));
      _601 = tonemapped.x, _602 = tonemapped.y, _603 = tonemapped.z;
    }
      } else {
        float _576 = _503 + 0.020616600289940834f;
        float _577 = _506 + 0.020616600289940834f;
        float _578 = _508 + 0.020616600289940834f;
        float _579 = _576 * _503;
        float _580 = _577 * _506;
        float _581 = _578 * _508;
        float _582 = _579 + -7.456949970219284e-05f;
        float _583 = _580 + -7.456949970219284e-05f;
        float _584 = _581 + -7.456949970219284e-05f;
        float _585 = _503 * 0.9837960004806519f;
        float _586 = _506 * 0.9837960004806519f;
        float _587 = _508 * 0.9837960004806519f;
        float _588 = _585 + 0.4336790144443512f;
        float _589 = _586 + 0.4336790144443512f;
        float _590 = _587 + 0.4336790144443512f;
        float _591 = _588 * _503;
        float _592 = _589 * _506;
        float _593 = _590 * _508;
        float _594 = _591 + 0.24617899954319f;
        float _595 = _592 + 0.24617899954319f;
        float _596 = _593 + 0.24617899954319f;
        float _597 = _582 / _594;
        float _598 = _583 / _595;
        float _599 = _584 / _596;
        _601 = _597;
        _602 = _598;
        _603 = _599;
      }
      float _604 = _601 * 1.6047500371932983f;
      float _605 = mad(-0.5310800075531006f, _602, _604);
      float _606 = mad(-0.07366999983787537f, _603, _605);
      float _607 = _601 * -0.10208000242710114f;
      float _608 = mad(1.1081299781799316f, _602, _607);
      float _609 = mad(-0.006049999967217445f, _603, _608);
      float _610 = _601 * -0.0032599999103695154f;
      float _611 = mad(-0.07275000214576721f, _602, _610);
      float _612 = mad(1.0760200023651123f, _603, _611);
      if (_392) {
        // float _614 = max(_606, 0.0f);
        // float _615 = max(_609, 0.0f);
        // float _616 = max(_612, 0.0f);
        // bool _617 = !(_614 >= 0.0030399328097701073f);
        // if (!_617) {
        //   float _619 = abs(_614);
        //   float _620 = log2(_619);
        //   float _621 = _620 * 0.4166666567325592f;
        //   float _622 = exp2(_621);
        //   float _623 = _622 * 1.0549999475479126f;
        //   float _624 = _623 + -0.054999999701976776f;
        //   _628 = _624;
        // } else {
        //   float _626 = _614 * 12.923210144042969f;
        //   _628 = _626;
        // }
        // bool _629 = !(_615 >= 0.0030399328097701073f);
        // if (!_629) {
        //   float _631 = abs(_615);
        //   float _632 = log2(_631);
        //   float _633 = _632 * 0.4166666567325592f;
        //   float _634 = exp2(_633);
        //   float _635 = _634 * 1.0549999475479126f;
        //   float _636 = _635 + -0.054999999701976776f;
        //   _640 = _636;
        // } else {
        //   float _638 = _615 * 12.923210144042969f;
        //   _640 = _638;
        // }
        // bool _641 = !(_616 >= 0.0030399328097701073f);
        // if (!_641) {
        //   float _643 = abs(_616);
        //   float _644 = log2(_643);
        //   float _645 = _644 * 0.4166666567325592f;
        //   float _646 = exp2(_645);
        //   float _647 = _646 * 1.0549999475479126f;
        //   float _648 = _647 + -0.054999999701976776f;
        //   _721 = _628;
        //   _722 = _640;
        //   _723 = _648;
        // } else {
        //   float _650 = _616 * 12.923210144042969f;
        //   _721 = _628;
        //   _722 = _640;
        //   _723 = _650;
        // }
        _721 = renodx::color::srgb::EncodeSafe(_606);
        _722 = renodx::color::srgb::EncodeSafe(_609);
        _723 = renodx::color::srgb::EncodeSafe(_612);

      } else {
        float _652 = saturate(_606);
        float _653 = saturate(_609);
        float _654 = saturate(_612);
        bool _655 = ((uint)(cb1_018w) == -2);
        if (!_655) {
          bool _657 = !(_652 >= 0.0030399328097701073f);
          if (!_657) {
            float _659 = abs(_652);
            float _660 = log2(_659);
            float _661 = _660 * 0.4166666567325592f;
            float _662 = exp2(_661);
            float _663 = _662 * 1.0549999475479126f;
            float _664 = _663 + -0.054999999701976776f;
            _668 = _664;
          } else {
            float _666 = _652 * 12.923210144042969f;
            _668 = _666;
          }
          bool _669 = !(_653 >= 0.0030399328097701073f);
          if (!_669) {
            float _671 = abs(_653);
            float _672 = log2(_671);
            float _673 = _672 * 0.4166666567325592f;
            float _674 = exp2(_673);
            float _675 = _674 * 1.0549999475479126f;
            float _676 = _675 + -0.054999999701976776f;
            _680 = _676;
          } else {
            float _678 = _653 * 12.923210144042969f;
            _680 = _678;
          }
          bool _681 = !(_654 >= 0.0030399328097701073f);
          if (!_681) {
            float _683 = abs(_654);
            float _684 = log2(_683);
            float _685 = _684 * 0.4166666567325592f;
            float _686 = exp2(_685);
            float _687 = _686 * 1.0549999475479126f;
            float _688 = _687 + -0.054999999701976776f;
            _692 = _668;
            _693 = _680;
            _694 = _688;
          } else {
            float _690 = _654 * 12.923210144042969f;
            _692 = _668;
            _693 = _680;
            _694 = _690;
          }
        } else {
          _692 = _652;
          _693 = _653;
          _694 = _654;
        }
        float _699 = abs(_692);
        float _700 = abs(_693);
        float _701 = abs(_694);
        float _702 = log2(_699);
        float _703 = log2(_700);
        float _704 = log2(_701);
        float _705 = _702 * cb2_000z;
        float _706 = _703 * cb2_000z;
        float _707 = _704 * cb2_000z;
        float _708 = exp2(_705);
        float _709 = exp2(_706);
        float _710 = exp2(_707);
        float _711 = _708 * cb2_000y;
        float _712 = _709 * cb2_000y;
        float _713 = _710 * cb2_000y;
        float _714 = _711 + cb2_000x;
        float _715 = _712 + cb2_000x;
        float _716 = _713 + cb2_000x;
        float _717 = saturate(_714);
        float _718 = saturate(_715);
        float _719 = saturate(_716);
        _721 = _717;
        _722 = _718;
        _723 = _719;
      }
      float _724 = dot(float3(_721, _722, _723), float3(0.2125999927520752f, 0.7152000069618225f, 0.0722000002861023f));
      SV_Target.x = _721;
      SV_Target.y = _722;
      SV_Target.z = _723;
      SV_Target.w = _724;
      SV_Target_1.x = _724;
      SV_Target_1.y = 0.0f;
      SV_Target_1.z = 0.0f;
      SV_Target_1.w = 0.0f;
      OutputSignature output_signature = { SV_Target, SV_Target_1 };
      return output_signature;
}
