#include "./shared.h"
#include "./tonemapper.hlsl"

struct _EyeAdaptationBuffer {
  float data[4];
};
StructuredBuffer<_EyeAdaptationBuffer> EyeAdaptationBuffer : register(t0);

Texture2D<float4> ColorTexture : register(t1);

Texture2D<float4> BloomTexture : register(t2);

struct _SceneColorApplyParamaters {
  float data[4];
};
StructuredBuffer<_SceneColorApplyParamaters> SceneColorApplyParamaters : register(t3);

Texture2D<float4> BloomDirtMaskTexture : register(t4);

Texture3D<float4> ColorGradingLUT : register(t5);

cbuffer _RootShaderParameters : register(b0) {
  float _RootShaderParameters_015x : packoffset(c015.x);
  float _RootShaderParameters_015y : packoffset(c015.y);
  float _RootShaderParameters_015z : packoffset(c015.z);
  float _RootShaderParameters_015w : packoffset(c015.w);
  float _RootShaderParameters_033x : packoffset(c033.x);
  float _RootShaderParameters_033y : packoffset(c033.y);
  float _RootShaderParameters_033z : packoffset(c033.z);
  float _RootShaderParameters_033w : packoffset(c033.w);
  float _RootShaderParameters_034x : packoffset(c034.x);
  float _RootShaderParameters_034y : packoffset(c034.y);
  float _RootShaderParameters_034z : packoffset(c034.z);
  float _RootShaderParameters_034w : packoffset(c034.w);
  float _RootShaderParameters_041x : packoffset(c041.x);
  float _RootShaderParameters_041y : packoffset(c041.y);
  float _RootShaderParameters_041z : packoffset(c041.z);
  float _RootShaderParameters_042x : packoffset(c042.x);
  float _RootShaderParameters_042y : packoffset(c042.y);
  float _RootShaderParameters_042z : packoffset(c042.z);
  float _RootShaderParameters_045x : packoffset(c045.x);
  float _RootShaderParameters_045y : packoffset(c045.y);
  float _RootShaderParameters_045z : packoffset(c045.z);
  float _RootShaderParameters_045w : packoffset(c045.w);
  float _RootShaderParameters_047z : packoffset(c047.z);
  float _RootShaderParameters_047w : packoffset(c047.w);
  float _RootShaderParameters_048x : packoffset(c048.x);
  uint _RootShaderParameters_048y : packoffset(c048.y);
};

cbuffer UniformBufferConstants_View : register(b1) {
  float UniformBufferConstants_View_136z : packoffset(c136.z);
};

SamplerState ColorSampler : register(s0);

SamplerState BloomSampler : register(s1);

SamplerState BloomDirtMaskSampler : register(s2);

SamplerState ColorGradingLUTSampler : register(s3);

struct OutputSignature {
  float4 SV_Target : SV_Target;
  float SV_Target_1 : SV_Target1;
};

OutputSignature main(
  noperspective float2 TEXCOORD : TEXCOORD,
  noperspective float2 TEXCOORD_1 : TEXCOORD1,
  noperspective float4 TEXCOORD_2 : TEXCOORD2,
  noperspective float2 TEXCOORD_3 : TEXCOORD3,
  noperspective float2 TEXCOORD_4 : TEXCOORD4,
  noperspective float4 SV_Position : SV_Position
) {
  float4 SV_Target;
  float3 post_lut;

  float SV_Target_1;
  // texture _1 = ColorGradingLUT;
  // texture _2 = BloomDirtMaskTexture;
  // texture _3 = SceneColorApplyParamaters;
  // texture _4 = BloomTexture;
  // texture _5 = ColorTexture;
  // texture _6 = EyeAdaptationBuffer;
  // SamplerState _7 = ColorGradingLUTSampler;
  // SamplerState _8 = BloomDirtMaskSampler;
  // SamplerState _9 = BloomSampler;
  // SamplerState _10 = ColorSampler;
  // cbuffer _11 = UniformBufferConstants_View;
  // cbuffer _12 = _RootShaderParameters;
  // _13 = _11;
  // _14 = _12;
  float _15 = TEXCOORD_3.x;
  float _16 = TEXCOORD_3.y;
  float _17 = TEXCOORD_2.z;
  float _18 = TEXCOORD_2.w;
  float _19 = TEXCOORD.x;
  float _20 = TEXCOORD.y;
  float _22 = _RootShaderParameters_015z;
  float _23 = _RootShaderParameters_015w;
  float _24 = _RootShaderParameters_015x;
  float _25 = _RootShaderParameters_015y;
  float _26 = max(_19, _24);
  float _27 = max(_20, _25);
  float _28 = min(_26, _22);
  float _29 = min(_27, _23);
  // _30 = _5;
  // _31 = _10;
  float4 _32 = ColorTexture.Sample(ColorSampler, float2(_28, _29));
  float _33 = _32.x;
  float _34 = _32.y;
  float _35 = _32.z;
  float _37 = UniformBufferConstants_View_136z;
  float _38 = _37 * _33;
  float _39 = _37 * _34;
  float _40 = _37 * _35;
  // _41 = _6;
  float4 _42 = EyeAdaptationBuffer[0].data[0 / 4];
  float _43 = _42.x;
  float _45 = _RootShaderParameters_041x;
  float _46 = _RootShaderParameters_041y;
  float _47 = _RootShaderParameters_041z;
  float _48 = _38 * _45;
  float _49 = _39 * _46;
  float _50 = _40 * _47;
  // _51 = _3;
  float4 _52 = SceneColorApplyParamaters[0].data[0 / 4];
  float _53 = _52.x;
  float _54 = _52.y;
  float _55 = _52.z;
  float _56 = _48 * _53;
  float _57 = _49 * _54;
  float _58 = _50 * _55;
  float _60 = _RootShaderParameters_033x;
  float _61 = _RootShaderParameters_033y;
  float _62 = _RootShaderParameters_033z;
  float _63 = _RootShaderParameters_033w;
  float _64 = _60 * _19;
  float _65 = _61 * _20;
  float _66 = _64 + _62;
  float _67 = _65 + _63;
  float _69 = _RootShaderParameters_034z;
  float _70 = _RootShaderParameters_034w;
  float _71 = _RootShaderParameters_034x;
  float _72 = _RootShaderParameters_034y;
  float _73 = max(_66, _71);
  float _74 = max(_67, _72);
  float _75 = min(_73, _69);
  float _76 = min(_74, _70);
  // _77 = _4;
  // _78 = _9;
  float4 _79 = BloomTexture.Sample(BloomSampler, float2(_75, _76));
  float _80 = _79.x;
  float _81 = _79.y;
  float _82 = _79.z;
  float _84 = UniformBufferConstants_View_136z;
  float _85 = _84 * _80;
  float _86 = _84 * _81;
  float _87 = _84 * _82;
  float _89 = _RootShaderParameters_045x;
  float _90 = _RootShaderParameters_045y;
  float _91 = _RootShaderParameters_045z;
  float _92 = _RootShaderParameters_045w;
  float _93 = _91 * _15;
  float _94 = _92 * _16;
  float _95 = _93 + _89;
  float _96 = _94 + _90;
  float _97 = _95 * 0.5f;
  float _98 = _96 * 0.5f;
  float _99 = _97 + 0.5f;
  float _100 = 0.5f - _98;
  // _101 = _2;
  // _102 = _8;
  float4 _103 = BloomDirtMaskTexture.Sample(BloomDirtMaskSampler, float2(_99, _100));
  float _104 = _103.x;
  float _105 = _103.y;
  float _106 = _103.z;
  float _108 = _RootShaderParameters_042x;
  float _109 = _RootShaderParameters_042y;
  float _110 = _RootShaderParameters_042z;
  float _111 = _108 * _104;
  float _112 = _109 * _105;
  float _113 = _110 * _106;
  float _114 = _111 + 1.0f;
  float _115 = _112 + 1.0f;
  float _116 = _113 + 1.0f;
  float _117 = _85 * _114;
  float _118 = _86 * _115;
  float _119 = _87 * _116;
  float _120 = _117 + _56;
  float _121 = _118 + _57;
  float _122 = _119 + _58;
  float _123 = _43 * 0.009999999776482582f;
  float _124 = _123 * _120;
  float _125 = _123 * _121;
  float _126 = _123 * _122;
  float _127 = log2(_124);
  float _128 = log2(_125);
  float _129 = log2(_126);
  float _130 = _127 * 0.1593017578125f;
  float _131 = _128 * 0.1593017578125f;
  float _132 = _129 * 0.1593017578125f;
  float _133 = exp2(_130);
  float _134 = exp2(_131);
  float _135 = exp2(_132);
  float _136 = _133 * 18.8515625f;
  float _137 = _134 * 18.8515625f;
  float _138 = _135 * 18.8515625f;
  float _139 = _136 + 0.8359375f;
  float _140 = _137 + 0.8359375f;
  float _141 = _138 + 0.8359375f;
  float _142 = _133 * 18.6875f;
  float _143 = _134 * 18.6875f;
  float _144 = _135 * 18.6875f;
  float _145 = _142 + 1.0f;
  float _146 = _143 + 1.0f;
  float _147 = _144 + 1.0f;
  float _148 = 1.0f / _145;
  float _149 = 1.0f / _146;
  float _150 = 1.0f / _147;
  float _151 = _148 * _139;
  float _152 = _149 * _140;
  float _153 = _150 * _141;
  float _154 = log2(_151);
  float _155 = log2(_152);
  float _156 = log2(_153);
  float _157 = _154 * 78.84375f;
  float _158 = _155 * 78.84375f;
  float _159 = _156 * 78.84375f;
  float _160 = exp2(_157);
  float _161 = exp2(_158);
  float _162 = exp2(_159);
  float _164 = _RootShaderParameters_047z;
  float _165 = _164 * _160;
  float _166 = _164 * _161;
  float _167 = _164 * _162;
  float _168 = _RootShaderParameters_047w;
  float _169 = _165 + _168;
  float _170 = _166 + _168;
  float _171 = _167 + _168;
  // _172 = _1;
  // _173 = _7;
  float4 _174 = ColorGradingLUT.Sample(ColorGradingLUTSampler, float3(_169, _170, _171));
  post_lut = _174.rgb;

  float _175 = _174.x;
  float _176 = _174.y;
  float _177 = _174.z;
  float _178 = _175 * 1.0499999523162842f;
  float _179 = _176 * 1.0499999523162842f;
  float _180 = _177 * 1.0499999523162842f;
  float _181 = dot(float3(_178, _179, _180), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
  float _182 = _18 * 543.3099975585938f;
  float _183 = _182 + _17;
  float _184 = sin(_183);
  float _185 = _184 * 493013.0f;
  float _186 = frac(_185);
  float _187 = _186 * 0.00390625f;
  float _188 = _187 + -0.001953125f;
  float _189 = _188 + _178;
  float _190 = _188 + _179;
  float _191 = _188 + _180;
  uint _193 = _RootShaderParameters_048y;
  bool _194 = (_193 == 0);
  float _265 = _189;
  float _266 = _190;
  float _267 = _191;
  if (!_194) {
    float _196 = log2(_189);
    float _197 = log2(_190);
    float _198 = log2(_191);
    float _199 = _196 * 0.012683313339948654f;
    float _200 = _197 * 0.012683313339948654f;
    float _201 = _198 * 0.012683313339948654f;
    float _202 = exp2(_199);
    float _203 = exp2(_200);
    float _204 = exp2(_201);
    float _205 = _202 + -0.8359375f;
    float _206 = _203 + -0.8359375f;
    float _207 = _204 + -0.8359375f;
    float _208 = max(0.0f, _205);
    float _209 = max(0.0f, _206);
    float _210 = max(0.0f, _207);
    float _211 = _202 * 18.6875f;
    float _212 = _203 * 18.6875f;
    float _213 = _204 * 18.6875f;
    float _214 = 18.8515625f - _211;
    float _215 = 18.8515625f - _212;
    float _216 = 18.8515625f - _213;
    float _217 = _208 / _214;
    float _218 = _209 / _215;
    float _219 = _210 / _216;
    float _220 = log2(_217);
    float _221 = log2(_218);
    float _222 = log2(_219);
    float _223 = _220 * 6.277394771575928f;
    float _224 = _221 * 6.277394771575928f;
    float _225 = _222 * 6.277394771575928f;
    float _226 = exp2(_223);
    float _227 = exp2(_224);
    float _228 = exp2(_225);
    float _229 = _226 * 10000.0f;
    float _230 = _227 * 10000.0f;
    float _231 = _228 * 10000.0f;
    float _233 = _RootShaderParameters_048x;
    float _234 = _229 / _233;
    float _235 = _230 / _233;
    float _236 = _231 / _233;
    float _237 = max(6.103519990574569e-05f, _234);
    float _238 = max(6.103519990574569e-05f, _235);
    float _239 = max(6.103519990574569e-05f, _236);
    float _240 = max(_237, 0.0031306699384003878f);
    float _241 = max(_238, 0.0031306699384003878f);
    float _242 = max(_239, 0.0031306699384003878f);
    float _243 = log2(_240);
    float _244 = log2(_241);
    float _245 = log2(_242);
    float _246 = _243 * 0.4166666567325592f;
    float _247 = _244 * 0.4166666567325592f;
    float _248 = _245 * 0.4166666567325592f;
    float _249 = exp2(_246);
    float _250 = exp2(_247);
    float _251 = exp2(_248);
    float _252 = _249 * 1.0549999475479126f;
    float _253 = _250 * 1.0549999475479126f;
    float _254 = _251 * 1.0549999475479126f;
    float _255 = _252 + -0.054999999701976776f;
    float _256 = _253 + -0.054999999701976776f;
    float _257 = _254 + -0.054999999701976776f;
    float _258 = _237 * 12.920000076293945f;
    float _259 = _238 * 12.920000076293945f;
    float _260 = _239 * 12.920000076293945f;
    float _261 = min(_258, _255);
    float _262 = min(_259, _256);
    float _263 = min(_260, _257);
    _265 = _261;
    _266 = _262;
    _267 = _263;
  }
  SV_Target.x = _265;
  SV_Target.y = _266;
  SV_Target.z = _267;
  if (injectedData.toneMapType != 0.f) {
    SV_Target.rgb = post_lut;
  }
  SV_Target.w = 0.0f;
  SV_Target_1 = _181;
  OutputSignature output_signature = { SV_Target, SV_Target_1 };
  return output_signature;
}