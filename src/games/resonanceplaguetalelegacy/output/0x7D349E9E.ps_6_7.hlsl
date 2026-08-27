#include "../shared.h"

Texture2D<float4> InputTexture : register(t0);
Texture2DArray<float4> DitherTexture : register(t1);

cbuffer OutputConstants : register(b0) {
  float paper_white_nits
      : packoffset(c000.x); // User_000.UserConstant_Z_000[0].x
  uint gamma_correction_enabled
      : packoffset(c002.x); // User_000.UserConstant_Z_000[2].x
  uint monochrome_enabled
      : packoffset(c003.y); // User_000.UserConstant_Z_000[3].y
};

SamplerState InputSampler : register(s0);

float4 main(linear float4 COLOR : COLOR, linear float4 TEXCOORD : TEXCOORD,
            noperspective float4 SV_Position : SV_Position)
    : SV_Target {
  float3 output;
  float3 input = InputTexture.SampleLevel(InputSampler, TEXCOORD.xy, 0.f).rgb;
  if (RENODX_TONE_MAP_TYPE) {
    // TODO: Implement monochrome
    output = renodx::draw::SwapChainPass(input);
    return float4(output, 1.f);
  } else {
    float3 bt709_nits = renodx::color::srgb::Decode(input);
    bt709_nits *= paper_white_nits;

    if (gamma_correction_enabled != 0u) {
      float3 gamma_22 = pow(renodx::color::srgb::Encode(bt709_nits), 2.2f);
      bt709_nits = select(bt709_nits < 1.f.xxx, gamma_22, bt709_nits);
    }

    //   renodx::canvas::Context cbuffer_canvas = renodx::canvas::CreateContext(
    //       SV_Position.xy, float2(24.f, 24.f), float2(12.f, 18.f),
    //       bt709_nits, 1.f, paper_white_nits.xxx);

    //   renodx::canvas::SetColor(cbuffer_canvas, 0x000000, 0.8f);
    //   renodx::canvas::FillRect(cbuffer_canvas, float2(16.f, 16.f),
    //                            float2(336.f, 96.f));
    //   renodx::canvas::SetColor(cbuffer_canvas, paper_white_nits.xxx);

    //   renodx::canvas::DrawText(cbuffer_canvas, 'c', '0', '.', 'x', ' ', 'p',
    //   'a',
    //                            'p', 'e', 'r', ':', ' ');
    //   renodx::canvas::DrawFloat(cbuffer_canvas, paper_white_nits, 0.f, 2.f);
    //   renodx::canvas::NewLine(cbuffer_canvas);

    //   renodx::canvas::DrawText(cbuffer_canvas, 'c', '2', '.', 'x', ' ', 'g',
    //   'a',
    //                            'm', 'm', 'a', ':', ' ');
    //   renodx::canvas::DrawInteger(cbuffer_canvas,
    //   (int)gamma_correction_enabled);
    //   renodx::canvas::NewLine(cbuffer_canvas);

    //   renodx::canvas::DrawText(cbuffer_canvas, 'c', '3', '.', 'y', ' ', 'm',
    //   'o',
    //                            'n', 'o', ':', ' ');
    //   renodx::canvas::DrawInteger(cbuffer_canvas, (int)monochrome_enabled);
    //   bt709_nits = renodx::canvas::GetOutput(cbuffer_canvas).rgb;

    float3 bt2020_nits = renodx::color::bt2020::from::BT709(bt709_nits);
    if (monochrome_enabled != 0u) {
      bt2020_nits = renodx::color::y::from::BT2020(bt2020_nits).xxx;
    }

    output = renodx::color::pq::Encode(abs(bt2020_nits), 1.f);

    int2 dither_position =
        int2((uint)SV_Position.x & 63u, (uint)SV_Position.y & 63u);
    float dither =
        (DitherTexture.Load(int4(dither_position, 0, 0)).x - 0.5f) / 1023.f;

    return float4(saturate(output + dither.xxx), 1.f);
  }
}

// struct GlobalCB_Z__AnchorConstant_Z {
//   float4 GlobalCB_Z__AnchorConstant_Z_000[7];
//   float4 GlobalCB_Z__AnchorConstant_Z_112;
//   float4 GlobalCB_Z__AnchorConstant_Z_128;
//   float4 GlobalCB_Z__AnchorConstant_Z_144;
//   float4 GlobalCB_Z__AnchorConstant_Z_160;
//   float4 GlobalCB_Z__AnchorConstant_Z_176;
//   float4 GlobalCB_Z__AnchorConstant_Z_192;
//   float4 GlobalCB_Z__AnchorConstant_Z_208;
//   float4 GlobalCB_Z__AnchorConstant_Z_224;
//   float4 GlobalCB_Z__AnchorConstant_Z_240;
//   float4 GlobalCB_Z__AnchorConstant_Z_256[4];
//   float4 GlobalCB_Z__AnchorConstant_Z_320;
//   float4 GlobalCB_Z__AnchorConstant_Z_336;
// };

// struct GlobalCB_Z__ProjConstant_Z {
//   float4 GlobalCB_Z__ProjConstant_Z_000[4][32];
//   float2 GlobalCB_Z__ProjConstant_Z_2048;
//   float2 GlobalCB_Z__ProjConstant_Z_2056;
//   int4 GlobalCB_Z__ProjConstant_Z_2064;
//   float4 GlobalCB_Z__ProjConstant_Z_2080[4];
// };

// struct GlobalCB_Z__GlobalConstant_Z {
//   float4 GlobalCB_Z__GlobalConstant_Z_000[104];
//   int GlobalCB_Z__GlobalConstant_Z_1664;
//   int3 GlobalCB_Z__GlobalConstant_Z_1668;
//   float3 GlobalCB_Z__GlobalConstant_Z_1680;
//   int GlobalCB_Z__GlobalConstant_Z_1692;
//   float GlobalCB_Z__GlobalConstant_Z_1696;
//   float GlobalCB_Z__GlobalConstant_Z_1700;
//   float GlobalCB_Z__GlobalConstant_Z_1704;
//   float GlobalCB_Z__GlobalConstant_Z_1708;
//   float GlobalCB_Z__GlobalConstant_Z_1712;
//   float GlobalCB_Z__GlobalConstant_Z_1716;
//   float GlobalCB_Z__GlobalConstant_Z_1720;
//   float GlobalCB_Z__GlobalConstant_Z_1724;
// };

// struct GlobalCB_Z__ViewConstant_Z {
//   float4 GlobalCB_Z__ViewConstant_Z_000;
//   float4 GlobalCB_Z__ViewConstant_Z_016;
//   float4 GlobalCB_Z__ViewConstant_Z_032[32];
// };

// struct GlobalCB_Z__ViewportConstant_Z {
//   float2 GlobalCB_Z__ViewportConstant_Z_000;
//   float2 GlobalCB_Z__ViewportConstant_Z_008;
//   float2 GlobalCB_Z__ViewportConstant_Z_016;
//   float2 GlobalCB_Z__ViewportConstant_Z_024;
//   float2 GlobalCB_Z__ViewportConstant_Z_032;
//   int2 GlobalCB_Z__ViewportConstant_Z_040;
//   float GlobalCB_Z__ViewportConstant_Z_048;
//   int GlobalCB_Z__ViewportConstant_Z_052;
//   float GlobalCB_Z__ViewportConstant_Z_056;
//   int GlobalCB_Z__ViewportConstant_Z_060;
//   float4 GlobalCB_Z__ViewportConstant_Z_064;
//   float3 GlobalCB_Z__ViewportConstant_Z_080;
//   float GlobalCB_Z__ViewportConstant_Z_092;
// };

// struct GlobalCB_Z {
//   GlobalCB_Z__GlobalConstant_Z GlobalCB_Z_000;
//   GlobalCB_Z__ViewportConstant_Z GlobalCB_Z_1728;
//   GlobalCB_Z__AnchorConstant_Z GlobalCB_Z_1824;
//   GlobalCB_Z__ViewConstant_Z GlobalCB_Z_2176;
//   GlobalCB_Z__ProjConstant_Z GlobalCB_Z_2720;
// };

// struct UserConstant_Z {
//   float4 UserConstant_Z_000[84];
// };

// Texture2D<float4> t0 : register(t0);

// Texture2DArray<float4> t1 : register(t1);

// cbuffer cb1 : register(b1) {
//   GlobalCB_Z Global_000 : packoffset(c000.x);
// };

// cbuffer cb0 : register(b0) {
//   UserConstant_Z User_000 : packoffset(c000.x);
// };

// SamplerState s0 : register(s0);

// float4 main(
//   linear float4 COLOR : COLOR,
//   linear float4 TEXCOORD : TEXCOORD,
//   noperspective float4 SV_Position : SV_Position
// ) : SV_Target {
//   float4 SV_Target;
//   float4 _14 = t0.SampleLevel(s0, float2(TEXCOORD.x, TEXCOORD.y), 0.0f);
//   float _18 = _14.x + 0.054999999701976776f;
//   float _19 = _14.y + 0.054999999701976776f;
//   float _20 = _14.z + 0.054999999701976776f;
//   float _21 = _18 * 0.9478673338890076f;
//   float _22 = _19 * 0.9478673338890076f;
//   float _23 = _20 * 0.9478673338890076f;
//   float _24 = log2(_21);
//   float _25 = log2(_22);
//   float _26 = log2(_23);
//   float _27 = _24 * 2.4000000953674316f;
//   float _28 = _25 * 2.4000000953674316f;
//   float _29 = _26 * 2.4000000953674316f;
//   float _30 = exp2(_27);
//   float _31 = exp2(_28);
//   float _32 = exp2(_29);
//   float _33 = _14.x * 0.07739938050508499f;
//   float _34 = _14.y * 0.07739938050508499f;
//   float _35 = _14.z * 0.07739938050508499f;
//   bool _36 = (_14.x <= 0.040449999272823334f);
//   bool _37 = (_14.y <= 0.040449999272823334f);
//   bool _38 = (_14.z <= 0.040449999272823334f);
//   float _39 = select(_36, _33, _30);
//   float _40 = select(_37, _34, _31);
//   float _41 = select(_38, _35, _32);
//   float _44 = (User_000.UserConstant_Z_000[0].x) * _39;
//   float _45 = (User_000.UserConstant_Z_000[0].x) * _40;
//   float _46 = (User_000.UserConstant_Z_000[0].x) * _41;
//   int _49 = asint((User_000.UserConstant_Z_000[2].x));
//   bool _50 = (_49 == 0);
//   float _92;
//   float _93;
//   float _94;
//   float _111;
//   float _112;
//   float _113;
//   float _190;
//   float _191;
//   float _192;
//   float _391;
//   float _392;
//   float _393;
//   float _460;
//   float _461;
//   float _462;
//   float _488;
//   float _489;
//   float _490;
//   double _554;
//   float _557;
//   float _578;
//   double _644;
//   float _647;
//   float _668;
//   double _734;
//   float _737;
//   float _758;
//   double _824;
//   float _827;
//   float _848;
//   double _913;
//   float _916;
//   float _937;
//   float _1006;
//   float _1007;
//   double _1044;
//   float _1047;
//   float _1068;
//   float _1114;
//   float _1115;
//   double _1152;
//   float _1155;
//   float _1176;
//   float _1241;
//   float _1242;
//   double _1279;
//   float _1282;
//   float _1303;
//   float _1349;
//   float _1350;
//   float _1387;
//   float _1408;
//   float _1419;
//   float _1420;
//   float _1421;
//   float _1436;
//   float _1437;
//   float _1438;
//   float _1445;
//   float _1446;
//   float _1447;
//   float _1454;
//   float _1455;
//   float _1456;
//   float _1463;
//   float _1464;
//   float _1465;
//   float _1516;
//   float _1517;
//   float _1554;
//   float _1555;
//   float _1675;
//   float _1775;
//   float _1875;
//   float _1913;
//   float _1914;
//   float _1915;
//   if (!_50) {
//     float _52 = log2(_44);
//     float _53 = log2(_45);
//     float _54 = log2(_46);
//     float _55 = _52 * 0.4166666567325592f;
//     float _56 = _53 * 0.4166666567325592f;
//     float _57 = _54 * 0.4166666567325592f;
//     float _58 = exp2(_55);
//     float _59 = exp2(_56);
//     float _60 = exp2(_57);
//     float _61 = _58 * 1.0549999475479126f;
//     float _62 = _59 * 1.0549999475479126f;
//     float _63 = _60 * 1.0549999475479126f;
//     float _64 = _61 + -0.054999999701976776f;
//     float _65 = _62 + -0.054999999701976776f;
//     float _66 = _63 + -0.054999999701976776f;
//     float _67 = _44 * 12.920000076293945f;
//     float _68 = _45 * 12.920000076293945f;
//     float _69 = _46 * 12.920000076293945f;
//     bool _70 = (_44 <= 0.0031308000907301903f);
//     bool _71 = (_45 <= 0.0031308000907301903f);
//     bool _72 = (_46 <= 0.0031308000907301903f);
//     float _73 = select(_70, _67, _64);
//     float _74 = select(_71, _68, _65);
//     float _75 = select(_72, _69, _66);
//     float _76 = log2(_73);
//     float _77 = log2(_74);
//     float _78 = log2(_75);
//     float _79 = _76 * 2.200000047683716f;
//     float _80 = _77 * 2.200000047683716f;
//     float _81 = _78 * 2.200000047683716f;
//     float _82 = exp2(_79);
//     float _83 = exp2(_80);
//     float _84 = exp2(_81);
//     bool _85 = (_44 < 1.0f);
//     bool _86 = (_45 < 1.0f);
//     bool _87 = (_46 < 1.0f);
//     float _88 = select(_85, _82, _44);
//     float _89 = select(_86, _83, _45);
//     float _90 = select(_87, _84, _46);
//     _92 = _88;
//     _93 = _89;
//     _94 = _90;
//   } else {
//     _92 = _44;
//     _93 = _45;
//     _94 = _46;
//   }
//   float _95 = _92 * 0.627403974533081f;
//   float _96 = mad(0.3292819857597351f, _93, _95);
//   float _97 = mad(0.04331360012292862f, _94, _96);
//   float _98 = _92 * 0.06909699738025665f;
//   float _99 = mad(0.9195399880409241f, _93, _98);
//   float _100 = mad(0.011361200362443924f, _94, _99);
//   float _101 = _92 * 0.01639159955084324f;
//   float _102 = mad(0.08801320195198059f, _93, _101);
//   float _103 = mad(0.8955950140953064f, _94, _102);
//   int _106 = asint((User_000.UserConstant_Z_000[3].y));
//   bool _107 = (_106 == 0);
//   if (!_107) {
//     float _109 = dot(float3(_97, _100, _103), float3(0.26269999146461487f,
//     0.6779999732971191f, 0.059300001710653305f)); _111 = _109; _112 = _109;
//     _113 = _109;
//   } else {
//     _111 = _97;
//     _112 = _100;
//     _113 = _103;
//   }
//   float _114 = _111 * 9.999999747378752e-05f;
//   float _115 = _112 * 9.999999747378752e-05f;
//   float _116 = _113 * 9.999999747378752e-05f;
//   float _117 = abs(_114);
//   float _118 = abs(_115);
//   float _119 = abs(_116);
//   float _120 = log2(_117);
//   float _121 = log2(_118);
//   float _122 = log2(_119);
//   float _123 = _120 * 0.1593017578125f;
//   float _124 = _121 * 0.1593017578125f;
//   float _125 = _122 * 0.1593017578125f;
//   float _126 = exp2(_123);
//   float _127 = exp2(_124);
//   float _128 = exp2(_125);
//   float _129 = _126 * 18.8515625f;
//   float _130 = _127 * 18.8515625f;
//   float _131 = _128 * 18.8515625f;
//   float _132 = _129 + 0.8359375f;
//   float _133 = _130 + 0.8359375f;
//   float _134 = _131 + 0.8359375f;
//   float _135 = _126 * 18.6875f;
//   float _136 = _127 * 18.6875f;
//   float _137 = _128 * 18.6875f;
//   float _138 = _135 + 1.0f;
//   float _139 = _136 + 1.0f;
//   float _140 = _137 + 1.0f;
//   float _141 = _132 / _138;
//   float _142 = _133 / _139;
//   float _143 = _134 / _140;
//   float _144 = log2(_141);
//   float _145 = log2(_142);
//   float _146 = log2(_143);
//   float _147 = _144 * 78.84375f;
//   float _148 = _145 * 78.84375f;
//   float _149 = _146 * 78.84375f;
//   float _150 = exp2(_147);
//   float _151 = exp2(_148);
//   float _152 = exp2(_149);
//   uint _153 = uint(SV_Position.x);
//   uint _154 = uint(SV_Position.y);
//   int _155 = _153 & 63;
//   int _156 = _154 & 63;
//   float4 _158 = t1.Load(int4(_155, _156, 0, 0));
//   float _160 = _158.x + -0.5f;
//   float _161 = _160 * 0.0009775171056389809f;
//   float _162 = _161 + _150;
//   float _163 = _161 + _151;
//   float _164 = _161 + _152;
//   float _165 = saturate(_162);
//   float _166 = saturate(_163);
//   float _167 = saturate(_164);
//   int _169 = asint((User_000.UserConstant_Z_000[3].x));
//   bool _170 = ((int)_169 > (int)0);
//   if (_170) {
//     int _172 = int(SV_Position.x);
//     int _173 = int(SV_Position.y);
//     switch (_169) {
//       case 1: {
//         bool _175 = (TEXCOORD.x < 0.5f);
//         bool _176 = (TEXCOORD.y < 0.5f);
//         if (_175) {
//           bool _178 = (TEXCOORD.x < 0.25f);
//           if (_176) {
//             if (_178) {
//               _190 = 0.627403974533081f;
//               _191 = 0.06909699738025665f;
//               _192 = 0.01639159955084324f;
//             } else {
//               _190 = 1.0f;
//               _191 = 0.0f;
//               _192 = 0.0f;
//             }
//           } else {
//             if (_178) {
//               _190 = 0.04331360012292862f;
//               _191 = 0.011361200362443924f;
//               _192 = 0.8955950140953064f;
//             } else {
//               _190 = 0.0f;
//               _191 = 0.0f;
//               _192 = 1.0f;
//             }
//           }
//         } else {
//           bool _184 = (TEXCOORD.x < 0.75f);
//           if (_176) {
//             if (_184) {
//               _190 = 0.3292819857597351f;
//               _191 = 0.9195399880409241f;
//               _192 = 0.08801320195198059f;
//             } else {
//               _190 = 0.0f;
//               _191 = 1.0f;
//               _192 = 0.0f;
//             }
//           } else {
//             if (_184) {
//               _190 = 0.4999997913837433f;
//               _191 = 0.499999076128006f;
//               _192 = 0.49999991059303284f;
//             } else {
//               _190 = 0.5f;
//               _191 = 0.5f;
//               _192 = 0.5f;
//             }
//           }
//         }
//         float _193 = (User_000.UserConstant_Z_000[0].x)
//         * 9.999999747378752e-05f; float _194 = _190 * _193; float _195 = _191
//         * _193; float _196 = _192 * _193; float _197 = abs(_194); float _198
//         = abs(_195); float _199 = abs(_196); float _200 = log2(_197); float
//         _201 = log2(_198); float _202 = log2(_199); float _203 = _200 *
//         0.1593017578125f; float _204 = _201 * 0.1593017578125f; float _205 =
//         _202 * 0.1593017578125f; float _206 = exp2(_203); float _207 =
//         exp2(_204); float _208 = exp2(_205); float _209 = _206 * 18.8515625f;
//         float _210 = _207 * 18.8515625f;
//         float _211 = _208 * 18.8515625f;
//         float _212 = _209 + 0.8359375f;
//         float _213 = _210 + 0.8359375f;
//         float _214 = _211 + 0.8359375f;
//         float _215 = _206 * 18.6875f;
//         float _216 = _207 * 18.6875f;
//         float _217 = _208 * 18.6875f;
//         float _218 = _215 + 1.0f;
//         float _219 = _216 + 1.0f;
//         float _220 = _217 + 1.0f;
//         float _221 = _212 / _218;
//         float _222 = _213 / _219;
//         float _223 = _214 / _220;
//         float _224 = log2(_221);
//         float _225 = log2(_222);
//         float _226 = log2(_223);
//         float _227 = _224 * 78.84375f;
//         float _228 = _225 * 78.84375f;
//         float _229 = _226 * 78.84375f;
//         float _230 = exp2(_227);
//         float _231 = exp2(_228);
//         float _232 = exp2(_229);
//         _1913 = _230;
//         _1914 = _231;
//         _1915 = _232;
//         break;
//       }
//       case 3: {
//         float _236 = 1.0f - TEXCOORD.x;
//         bool _237 = (_236 < TEXCOORD.y);
//         if (_237) {
//           float _239 = _39 * _39;
//           float _240 = _239 + -1.0f;
//           float _241 = _39 + -1.0f;
//           float _242 = _240 / _241;
//           float _243 = _242 + -1.0f;
//           bool _244 = !(_39 == 1.0f);
//           float _245 = _243 / _242;
//           float _246 = select(_244, _245, 0.5f);
//           float _247 = _40 * _40;
//           float _248 = _247 + -1.0f;
//           float _249 = _40 + -1.0f;
//           float _250 = _248 / _249;
//           float _251 = _250 + -1.0f;
//           bool _252 = !(_40 == 1.0f);
//           float _253 = _251 / _250;
//           float _254 = select(_252, _253, 0.5f);
//           float _255 = _41 * _41;
//           float _256 = _255 + -1.0f;
//           float _257 = _41 + -1.0f;
//           float _258 = _256 / _257;
//           float _259 = _258 + -1.0f;
//           bool _260 = !(_41 == 1.0f);
//           float _261 = _259 / _258;
//           float _262 = select(_260, _261, 0.5f);
//           float _263 = saturate(_246);
//           float _264 = saturate(_254);
//           float _265 = saturate(_262);
//           float _266 = _263 * (User_000.UserConstant_Z_000[4].x);
//           float _267 = (User_000.UserConstant_Z_000[4].x)
//           * 9.999999747378752e-05f; float _268 = _264 * _267; float _269 =
//           _265 * _267; float _270 = _266 * 6.274039333220571e-05f; float _271
//           = mad(0.3292819857597351f, _268, _270); float _272 =
//           mad(0.04331360012292862f, _269, _271); float _273 = _266
//           * 6.909699550305959e-06f; float _274 = mad(0.9195399880409241f,
//           _268, _273); float _275 = mad(0.011361200362443924f, _269, _274);
//           float _276 = _266 * 1.6391599046983174e-06f;
//           float _277 = mad(0.08801320195198059f, _268, _276);
//           float _278 = mad(0.8955950140953064f, _269, _277);
//           float _279 = abs(_272);
//           float _280 = abs(_275);
//           float _281 = abs(_278);
//           float _282 = log2(_279);
//           float _283 = log2(_280);
//           float _284 = log2(_281);
//           float _285 = _282 * 0.1593017578125f;
//           float _286 = _283 * 0.1593017578125f;
//           float _287 = _284 * 0.1593017578125f;
//           float _288 = exp2(_285);
//           float _289 = exp2(_286);
//           float _290 = exp2(_287);
//           float _291 = _288 * 18.8515625f;
//           float _292 = _289 * 18.8515625f;
//           float _293 = _290 * 18.8515625f;
//           float _294 = _291 + 0.8359375f;
//           float _295 = _292 + 0.8359375f;
//           float _296 = _293 + 0.8359375f;
//           float _297 = _288 * 18.6875f;
//           float _298 = _289 * 18.6875f;
//           float _299 = _290 * 18.6875f;
//           float _300 = _297 + 1.0f;
//           float _301 = _298 + 1.0f;
//           float _302 = _299 + 1.0f;
//           float _303 = _294 / _300;
//           float _304 = _295 / _301;
//           float _305 = _296 / _302;
//           float _306 = log2(_303);
//           float _307 = log2(_304);
//           float _308 = log2(_305);
//           float _309 = _306 * 78.84375f;
//           float _310 = _307 * 78.84375f;
//           float _311 = _308 * 78.84375f;
//           float _312 = exp2(_309);
//           float _313 = exp2(_310);
//           float _314 = exp2(_311);
//           _1913 = _312;
//           _1914 = _313;
//           _1915 = _314;
//         } else {
//           _1913 = _150;
//           _1914 = _151;
//           _1915 = _152;
//         }
//         break;
//       }
//       case 4: {
//         float _319 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x *
//         TEXCOORD.x; float _320 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//         TEXCOORD.y; float _321 = dot(float3(_111, _112, _113),
//         float3(0.26269999146461487f, 0.6779999732971191f,
//         0.059300001710653305f)); float4 _322 = t0.SampleLevel(s0,
//         float2(0.5f, 0.5f), 0.0f); float _326 = _322.x +
//         0.054999999701976776f; float _327 = _322.y + 0.054999999701976776f;
//         float _328 = _322.z + 0.054999999701976776f;
//         float _329 = _326 * 0.9478673338890076f;
//         float _330 = _327 * 0.9478673338890076f;
//         float _331 = _328 * 0.9478673338890076f;
//         float _332 = log2(_329);
//         float _333 = log2(_330);
//         float _334 = log2(_331);
//         float _335 = _332 * 2.4000000953674316f;
//         float _336 = _333 * 2.4000000953674316f;
//         float _337 = _334 * 2.4000000953674316f;
//         float _338 = exp2(_335);
//         float _339 = exp2(_336);
//         float _340 = exp2(_337);
//         float _341 = _322.x * 0.07739938050508499f;
//         float _342 = _322.y * 0.07739938050508499f;
//         float _343 = _322.z * 0.07739938050508499f;
//         bool _344 = (_322.x <= 0.040449999272823334f);
//         bool _345 = (_322.y <= 0.040449999272823334f);
//         bool _346 = (_322.z <= 0.040449999272823334f);
//         float _347 = select(_344, _341, _338);
//         float _348 = select(_345, _342, _339);
//         float _349 = select(_346, _343, _340);
//         if (!_50) {
//           float _351 = log2(_347);
//           float _352 = log2(_348);
//           float _353 = log2(_349);
//           float _354 = _351 * 0.4166666567325592f;
//           float _355 = _352 * 0.4166666567325592f;
//           float _356 = _353 * 0.4166666567325592f;
//           float _357 = exp2(_354);
//           float _358 = exp2(_355);
//           float _359 = exp2(_356);
//           float _360 = _357 * 1.0549999475479126f;
//           float _361 = _358 * 1.0549999475479126f;
//           float _362 = _359 * 1.0549999475479126f;
//           float _363 = _360 + -0.054999999701976776f;
//           float _364 = _361 + -0.054999999701976776f;
//           float _365 = _362 + -0.054999999701976776f;
//           float _366 = _347 * 12.920000076293945f;
//           float _367 = _348 * 12.920000076293945f;
//           float _368 = _349 * 12.920000076293945f;
//           bool _369 = (_347 <= 0.0031308000907301903f);
//           bool _370 = (_348 <= 0.0031308000907301903f);
//           bool _371 = (_349 <= 0.0031308000907301903f);
//           float _372 = select(_369, _366, _363);
//           float _373 = select(_370, _367, _364);
//           float _374 = select(_371, _368, _365);
//           float _375 = log2(_372);
//           float _376 = log2(_373);
//           float _377 = log2(_374);
//           float _378 = _375 * 2.200000047683716f;
//           float _379 = _376 * 2.200000047683716f;
//           float _380 = _377 * 2.200000047683716f;
//           float _381 = exp2(_378);
//           float _382 = exp2(_379);
//           float _383 = exp2(_380);
//           bool _384 = (_347 < 1.0f);
//           bool _385 = (_348 < 1.0f);
//           bool _386 = (_349 < 1.0f);
//           float _387 = select(_384, _381, _347);
//           float _388 = select(_385, _382, _348);
//           float _389 = select(_386, _383, _349);
//           _391 = _387;
//           _392 = _388;
//           _393 = _389;
//         } else {
//           _391 = _347;
//           _392 = _348;
//           _393 = _349;
//         }
//         float _394 = _391 * 0.627403974533081f;
//         float _395 = mad(0.3292819857597351f, _392, _394);
//         float _396 = mad(0.04331360012292862f, _393, _395);
//         float _397 = _391 * 0.06909699738025665f;
//         float _398 = mad(0.9195399880409241f, _392, _397);
//         float _399 = mad(0.011361200362443924f, _393, _398);
//         float _400 = _391 * 0.01639159955084324f;
//         float _401 = mad(0.08801320195198059f, _392, _400);
//         float _402 = mad(0.8955950140953064f, _393, _401);
//         float _403 = dot(float3(_396, _399, _402),
//         float3(0.26269999146461487f, 0.6779999732971191f,
//         0.059300001710653305f)); float _404 = _403 *
//         (User_000.UserConstant_Z_000[0].x); float _405 = TEXCOORD.y *
//         TEXCOORD.y; float _406 = 1.0f - _405; float _407 = sqrt(_406); float
//         _408 = 1.0f - _407; float _409 = _408 * _408; float _410 = _409 *
//         10000.0f; bool _411 = (TEXCOORD.x < 0.03999999910593033f); float _412
//         = select(_411, _410, _321); float _413 = saturate(_412); float _414 =
//         _412 + -1.0f; float _415 = _414 * 0.1111111119389534f; float _416 =
//         saturate(_415); float _417 = 1.0f - _413; float _418 = _416 * _417;
//         float _419 = _418 + _413;
//         float _420 = _412 + -10.0f;
//         float _421 = _420 * 0.011111111380159855f;
//         float _422 = saturate(_421);
//         float _423 = 1.0f - _416;
//         float _424 = _422 * _423;
//         float _425 = _419 * _422;
//         float _426 = _424 + _416;
//         float _427 = _419 - _425;
//         float _428 = _412 + -100.0f;
//         float _429 = _428 * 0.0011111111380159855f;
//         float _430 = saturate(_429);
//         float _431 = 1.0f - _426;
//         float _432 = _431 * _430;
//         float _433 = _427 * _430;
//         float _434 = _432 + _426;
//         float _435 = _427 - _433;
//         float _436 = _412 + -1000.0f;
//         float _437 = _436 * 0.00011111111234640703f;
//         float _438 = saturate(_437);
//         float _439 = 1.0f - _430;
//         float _440 = _438 * _439;
//         float _441 = _434 * _438;
//         float _442 = _435 * _438;
//         float _443 = _440 + _430;
//         float _444 = _434 - _441;
//         float _445 = _435 - _442;
//         float _446 = _443 * (User_000.UserConstant_Z_000[0].x);
//         float _447 = _444 * (User_000.UserConstant_Z_000[0].x);
//         float _448 = _445 * (User_000.UserConstant_Z_000[0].x);
//         bool _449 = (TEXCOORD.x < 0.05000000074505806f);
//         if (_449) {
//           float _451 = log2(_410);
//           float _452 = _451 * 0.3010300099849701f;
//           bool _453 = !(_452 >= 0.0f);
//           if (!_453) {
//             float _455 = frac(_452);
//             float _456 = ddy_coarse(_452);
//             bool _457 = !(_455 <= _456);
//             if (!_457) {
//               _460 = 0.0f;
//               _461 = 0.0f;
//               _462 = 0.0f;
//             } else {
//               _460 = _446;
//               _461 = _447;
//               _462 = _448;
//             }
//           } else {
//             _460 = _446;
//             _461 = _447;
//             _462 = _448;
//           }
//           float _463 = _410 - _404;
//           float _464 = ddy_coarse(_410);
//           float _465 = _463 - _464;
//           float _466 = abs(_465);
//           bool _467 = (_466 <= _464);
//           float _468 = select(_467, 0.0f, _460);
//           float _469 = select(_467, 0.0f, _461);
//           float _470 = select(_467, 0.0f, _462);
//           float _471 = abs(_463);
//           bool _472 = !(_471 <= _464);
//           float _473 = select(_472, _468,
//           (User_000.UserConstant_Z_000[0].x)); float _474 = select(_472,
//           _469, (User_000.UserConstant_Z_000[0].x)); float _475 =
//           select(_472, _470, (User_000.UserConstant_Z_000[0].x)); float _477
//           = _410 - (User_000.UserConstant_Z_000[0].z); float _478 = _477 -
//           _464; float _479 = abs(_478); bool _480 = (_479 <= _464); float
//           _481 = select(_480, 0.0f, _473); float _482 = select(_480, 0.0f,
//           _474); float _483 = select(_480, 0.0f, _475); float _484 =
//           abs(_477); bool _485 = !(_484 <= _464); if (!_485) {
//             _488 = (User_000.UserConstant_Z_000[0].x);
//             _489 = (User_000.UserConstant_Z_000[0].x);
//             _490 = (User_000.UserConstant_Z_000[0].x);
//           } else {
//             _488 = _481;
//             _489 = _482;
//             _490 = _483;
//           }
//         } else {
//           _488 = _446;
//           _489 = _447;
//           _490 = _448;
//         }
//         bool _491 = (TEXCOORD.x < 0.15000000596046448f);
//         if (_491) {
//           float _493 =
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x *
//           0.05000000074505806f; float _494 =
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//           0.141067236661911f; float _495 = TEXCOORD.x +
//           -0.05000000074505806f; float _496 =
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x *
//           _495; float _497 = _320 + 10.0f; float _498 = _497 - _494; float
//           _499 = _496 * 0.10000000149011612f; float _500 = _498 *
//           0.10000000149011612f; float _501 = 1.0f - _500; bool _502 = (_501 <
//           0.0f); bool _503 = (_501 >= 1.0f); bool _504 = _502 || _503; if
//           (!_504) {
//             float _506 = floor(_499);
//             float _507 = 1.0f - _506;
//             bool _508 = !(_507 > -1.0099999904632568f);
//             bool _509 = (_507 > 0.0f);
//             bool _510 = _508 || _509;
//             bool _511 = (_507 == -1.0f);
//             bool _512 = _511 || _510;
//             if (!_512) {
//               bool _514 = (_507 < 0.0f);
//               float _515 = 2.0f - _506;
//               float _516 = select(_514, _515, _507);
//               float _517 = select(_514, 0.0f, 1.0f);
//               float _518 = _516 * 3.321928024291992f;
//               float _519 = exp2(_518);
//               float _520 = _517 / _519;
//               float _521 = abs(_520);
//               float _522 = _521 + 9.999999747378752e-05f;
//               float _523 = _522 * 0.10000000149011612f;
//               float _524 = -0.0f - _523;
//               bool _525 = (_523 >= _524);
//               float _526 = abs(_523);
//               float _527 = frac(_526);
//               float _528 = -0.0f - _527;
//               float _529 = select(_525, _527, _528);
//               float _530 = _529 * 10.0f;
//               float _531 = floor(_530);
//               int _532 = int(_531);
//               bool _533 = (_532 == 0);
//               if (!_533) {
//                 bool _535 = (_532 == 1);
//                 if (!_535) {
//                   bool _537 = (_532 == 2);
//                   if (!_537) {
//                     bool _539 = (_532 == 3);
//                     if (!_539) {
//                       bool _541 = (_532 == 4);
//                       if (!_541) {
//                         bool _543 = (_532 == 5);
//                         if (!_543) {
//                           bool _545 = (_532 == 6);
//                           if (!_545) {
//                             bool _547 = (_532 == 7);
//                             if (!_547) {
//                               bool _549 = (_532 == 8);
//                               if (!_549) {
//                                 bool _551 = (_532 == 9);
//                                 double _552 = select(_551, 481095.0, 0.0);
//                                 _554 = _552;
//                               } else {
//                                 _554 = 481111.0;
//                               }
//                             } else {
//                               _554 = 476228.0;
//                             }
//                           } else {
//                             _554 = 464727.0;
//                           }
//                         } else {
//                           _554 = 464711.0;
//                         }
//                       } else {
//                         _554 = 350020.0;
//                       }
//                     } else {
//                       _554 = 476999.0;
//                     }
//                   } else {
//                     _554 = 476951.0;
//                   }
//                 } else {
//                   _554 = 139810.0;
//                 }
//               } else {
//                 _554 = 480599.0;
//               }
//               float _555 = float(_554);
//               _557 = _555;
//             } else {
//               _557 = 0.0f;
//             }
//             float _558 = frac(_499);
//             float _559 = _558 * 4.0f;
//             float _560 = floor(_559);
//             float _561 = _498 * 0.5f;
//             float _562 = 5.0f - _561;
//             float _563 = floor(_562);
//             float _564 = _563 * 4.0f;
//             float _565 = _564 + _560;
//             float _566 = exp2(_565);
//             float _567 = _557 / _566;
//             float _568 = _567 * 0.5f;
//             float _569 = -0.0f - _568;
//             bool _570 = (_568 >= _569);
//             float _571 = abs(_568);
//             float _572 = frac(_571);
//             float _573 = -0.0f - _572;
//             float _574 = select(_570, _572, _573);
//             float _575 = _574 * 2.0f;
//             float _576 = floor(_575);
//             _578 = _576;
//           } else {
//             _578 = 0.0f;
//           }
//           float _579 = 15.0f - _488;
//           float _580 = 15.0f - _489;
//           float _581 = 15.0f - _490;
//           float _582 = _578 * _579;
//           float _583 = _578 * _580;
//           float _584 = _578 * _581;
//           float _585 = _582 + _488;
//           float _586 = _583 + _489;
//           float _587 = _584 + _490;
//           float _588 =
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//           0.24949057400226593f; float _589 = _497 - _588; float _590 = _589 *
//           0.10000000149011612f; float _591 = 1.0f - _590; bool _592 = (_591 <
//           0.0f); bool _593 = (_591 >= 1.0f); bool _594 = _592 || _593; if
//           (!_594) {
//             float _596 = floor(_499);
//             float _597 = 2.0f - _596;
//             bool _598 = !(_597 > -1.0099999904632568f);
//             bool _599 = (_597 > 1.0f);
//             bool _600 = _598 || _599;
//             bool _601 = (_597 == -1.0f);
//             bool _602 = _601 || _600;
//             if (!_602) {
//               bool _604 = (_597 < 0.0f);
//               float _605 = 3.0f - _596;
//               float _606 = select(_604, _605, _597);
//               float _607 = select(_604, 0.0f, 10.0f);
//               float _608 = _606 * 3.321928024291992f;
//               float _609 = exp2(_608);
//               float _610 = _607 / _609;
//               float _611 = abs(_610);
//               float _612 = _611 + 9.999999747378752e-05f;
//               float _613 = _612 * 0.10000000149011612f;
//               float _614 = -0.0f - _613;
//               bool _615 = (_613 >= _614);
//               float _616 = abs(_613);
//               float _617 = frac(_616);
//               float _618 = -0.0f - _617;
//               float _619 = select(_615, _617, _618);
//               float _620 = _619 * 10.0f;
//               float _621 = floor(_620);
//               int _622 = int(_621);
//               bool _623 = (_622 == 0);
//               if (!_623) {
//                 bool _625 = (_622 == 1);
//                 if (!_625) {
//                   bool _627 = (_622 == 2);
//                   if (!_627) {
//                     bool _629 = (_622 == 3);
//                     if (!_629) {
//                       bool _631 = (_622 == 4);
//                       if (!_631) {
//                         bool _633 = (_622 == 5);
//                         if (!_633) {
//                           bool _635 = (_622 == 6);
//                           if (!_635) {
//                             bool _637 = (_622 == 7);
//                             if (!_637) {
//                               bool _639 = (_622 == 8);
//                               if (!_639) {
//                                 bool _641 = (_622 == 9);
//                                 double _642 = select(_641, 481095.0, 0.0);
//                                 _644 = _642;
//                               } else {
//                                 _644 = 481111.0;
//                               }
//                             } else {
//                               _644 = 476228.0;
//                             }
//                           } else {
//                             _644 = 464727.0;
//                           }
//                         } else {
//                           _644 = 464711.0;
//                         }
//                       } else {
//                         _644 = 350020.0;
//                       }
//                     } else {
//                       _644 = 476999.0;
//                     }
//                   } else {
//                     _644 = 476951.0;
//                   }
//                 } else {
//                   _644 = 139810.0;
//                 }
//               } else {
//                 _644 = 480599.0;
//               }
//               float _645 = float(_644);
//               _647 = _645;
//             } else {
//               _647 = 0.0f;
//             }
//             float _648 = frac(_499);
//             float _649 = _648 * 4.0f;
//             float _650 = floor(_649);
//             float _651 = _589 * 0.5f;
//             float _652 = 5.0f - _651;
//             float _653 = floor(_652);
//             float _654 = _653 * 4.0f;
//             float _655 = _654 + _650;
//             float _656 = exp2(_655);
//             float _657 = _647 / _656;
//             float _658 = _657 * 0.5f;
//             float _659 = -0.0f - _658;
//             bool _660 = (_658 >= _659);
//             float _661 = abs(_658);
//             float _662 = frac(_661);
//             float _663 = -0.0f - _662;
//             float _664 = select(_660, _662, _663);
//             float _665 = _664 * 2.0f;
//             float _666 = floor(_665);
//             _668 = _666;
//           } else {
//             _668 = 0.0f;
//           }
//           float _669 = 15.0f - _585;
//           float _670 = 15.0f - _586;
//           float _671 = 15.0f - _587;
//           float _672 = _668 * _669;
//           float _673 = _668 * _670;
//           float _674 = _668 * _671;
//           float _675 = _672 + _585;
//           float _676 = _673 + _586;
//           float _677 = _674 + _587;
//           float _678 =
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//           0.43588995933532715f; float _679 = _497 - _678; float _680 = _679 *
//           0.10000000149011612f; float _681 = 1.0f - _680; bool _682 = (_681 <
//           0.0f); bool _683 = (_681 >= 1.0f); bool _684 = _682 || _683; if
//           (!_684) {
//             float _686 = floor(_499);
//             float _687 = 3.0f - _686;
//             bool _688 = !(_687 > -1.0099999904632568f);
//             bool _689 = (_687 > 2.0f);
//             bool _690 = _688 || _689;
//             bool _691 = (_687 == -1.0f);
//             bool _692 = _691 || _690;
//             if (!_692) {
//               bool _694 = (_687 < 0.0f);
//               float _695 = 4.0f - _686;
//               float _696 = select(_694, _695, _687);
//               float _697 = select(_694, 0.0f, 100.0f);
//               float _698 = _696 * 3.321928024291992f;
//               float _699 = exp2(_698);
//               float _700 = _697 / _699;
//               float _701 = abs(_700);
//               float _702 = _701 + 9.999999747378752e-05f;
//               float _703 = _702 * 0.10000000149011612f;
//               float _704 = -0.0f - _703;
//               bool _705 = (_703 >= _704);
//               float _706 = abs(_703);
//               float _707 = frac(_706);
//               float _708 = -0.0f - _707;
//               float _709 = select(_705, _707, _708);
//               float _710 = _709 * 10.0f;
//               float _711 = floor(_710);
//               int _712 = int(_711);
//               bool _713 = (_712 == 0);
//               if (!_713) {
//                 bool _715 = (_712 == 1);
//                 if (!_715) {
//                   bool _717 = (_712 == 2);
//                   if (!_717) {
//                     bool _719 = (_712 == 3);
//                     if (!_719) {
//                       bool _721 = (_712 == 4);
//                       if (!_721) {
//                         bool _723 = (_712 == 5);
//                         if (!_723) {
//                           bool _725 = (_712 == 6);
//                           if (!_725) {
//                             bool _727 = (_712 == 7);
//                             if (!_727) {
//                               bool _729 = (_712 == 8);
//                               if (!_729) {
//                                 bool _731 = (_712 == 9);
//                                 double _732 = select(_731, 481095.0, 0.0);
//                                 _734 = _732;
//                               } else {
//                                 _734 = 481111.0;
//                               }
//                             } else {
//                               _734 = 476228.0;
//                             }
//                           } else {
//                             _734 = 464727.0;
//                           }
//                         } else {
//                           _734 = 464711.0;
//                         }
//                       } else {
//                         _734 = 350020.0;
//                       }
//                     } else {
//                       _734 = 476999.0;
//                     }
//                   } else {
//                     _734 = 476951.0;
//                   }
//                 } else {
//                   _734 = 139810.0;
//                 }
//               } else {
//                 _734 = 480599.0;
//               }
//               float _735 = float(_734);
//               _737 = _735;
//             } else {
//               _737 = 0.0f;
//             }
//             float _738 = frac(_499);
//             float _739 = _738 * 4.0f;
//             float _740 = floor(_739);
//             float _741 = _679 * 0.5f;
//             float _742 = 5.0f - _741;
//             float _743 = floor(_742);
//             float _744 = _743 * 4.0f;
//             float _745 = _744 + _740;
//             float _746 = exp2(_745);
//             float _747 = _737 / _746;
//             float _748 = _747 * 0.5f;
//             float _749 = -0.0f - _748;
//             bool _750 = (_748 >= _749);
//             float _751 = abs(_748);
//             float _752 = frac(_751);
//             float _753 = -0.0f - _752;
//             float _754 = select(_750, _752, _753);
//             float _755 = _754 * 2.0f;
//             float _756 = floor(_755);
//             _758 = _756;
//           } else {
//             _758 = 0.0f;
//           }
//           float _759 = 15.0f - _675;
//           float _760 = 15.0f - _676;
//           float _761 = 15.0f - _677;
//           float _762 = _758 * _759;
//           float _763 = _758 * _760;
//           float _764 = _758 * _761;
//           float _765 = _762 + _675;
//           float _766 = _763 + _676;
//           float _767 = _764 + _677;
//           float _768 =
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//           0.7296954989433289f; float _769 = _497 - _768; float _770 = _769 *
//           0.10000000149011612f; float _771 = 1.0f - _770; bool _772 = (_771 <
//           0.0f); bool _773 = (_771 >= 1.0f); bool _774 = _772 || _773; if
//           (!_774) {
//             float _776 = floor(_499);
//             float _777 = 4.0f - _776;
//             bool _778 = !(_777 > -1.0099999904632568f);
//             bool _779 = (_777 > 3.0f);
//             bool _780 = _778 || _779;
//             bool _781 = (_777 == -1.0f);
//             bool _782 = _781 || _780;
//             if (!_782) {
//               bool _784 = (_777 < 0.0f);
//               float _785 = 5.0f - _776;
//               float _786 = select(_784, _785, _777);
//               float _787 = select(_784, 0.0f, 1000.0f);
//               float _788 = _786 * 3.321928024291992f;
//               float _789 = exp2(_788);
//               float _790 = _787 / _789;
//               float _791 = abs(_790);
//               float _792 = _791 + 9.999999747378752e-05f;
//               float _793 = _792 * 0.10000000149011612f;
//               float _794 = -0.0f - _793;
//               bool _795 = (_793 >= _794);
//               float _796 = abs(_793);
//               float _797 = frac(_796);
//               float _798 = -0.0f - _797;
//               float _799 = select(_795, _797, _798);
//               float _800 = _799 * 10.0f;
//               float _801 = floor(_800);
//               int _802 = int(_801);
//               bool _803 = (_802 == 0);
//               if (!_803) {
//                 bool _805 = (_802 == 1);
//                 if (!_805) {
//                   bool _807 = (_802 == 2);
//                   if (!_807) {
//                     bool _809 = (_802 == 3);
//                     if (!_809) {
//                       bool _811 = (_802 == 4);
//                       if (!_811) {
//                         bool _813 = (_802 == 5);
//                         if (!_813) {
//                           bool _815 = (_802 == 6);
//                           if (!_815) {
//                             bool _817 = (_802 == 7);
//                             if (!_817) {
//                               bool _819 = (_802 == 8);
//                               if (!_819) {
//                                 bool _821 = (_802 == 9);
//                                 double _822 = select(_821, 481095.0, 0.0);
//                                 _824 = _822;
//                               } else {
//                                 _824 = 481111.0;
//                               }
//                             } else {
//                               _824 = 476228.0;
//                             }
//                           } else {
//                             _824 = 464727.0;
//                           }
//                         } else {
//                           _824 = 464711.0;
//                         }
//                       } else {
//                         _824 = 350020.0;
//                       }
//                     } else {
//                       _824 = 476999.0;
//                     }
//                   } else {
//                     _824 = 476951.0;
//                   }
//                 } else {
//                   _824 = 139810.0;
//                 }
//               } else {
//                 _824 = 480599.0;
//               }
//               float _825 = float(_824);
//               _827 = _825;
//             } else {
//               _827 = 0.0f;
//             }
//             float _828 = frac(_499);
//             float _829 = _828 * 4.0f;
//             float _830 = floor(_829);
//             float _831 = _769 * 0.5f;
//             float _832 = 5.0f - _831;
//             float _833 = floor(_832);
//             float _834 = _833 * 4.0f;
//             float _835 = _834 + _830;
//             float _836 = exp2(_835);
//             float _837 = _827 / _836;
//             float _838 = _837 * 0.5f;
//             float _839 = -0.0f - _838;
//             bool _840 = (_838 >= _839);
//             float _841 = abs(_838);
//             float _842 = frac(_841);
//             float _843 = -0.0f - _842;
//             float _844 = select(_840, _842, _843);
//             float _845 = _844 * 2.0f;
//             float _846 = floor(_845);
//             _848 = _846;
//           } else {
//             _848 = 0.0f;
//           }
//           float _849 = 15.0f - _765;
//           float _850 = 15.0f - _766;
//           float _851 = 15.0f - _767;
//           float _852 = _848 * _849;
//           float _853 = _848 * _850;
//           float _854 = _848 * _851;
//           float _855 = _852 + _765;
//           float _856 = _853 + _766;
//           float _857 = _854 + _767;
//           float _858 = _497 -
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y;
//           float _859 = _858 * 0.10000000149011612f;
//           float _860 = 1.0f - _859;
//           bool _861 = (_860 < 0.0f);
//           bool _862 = (_860 >= 1.0f);
//           bool _863 = _861 || _862;
//           if (!_863) {
//             float _865 = floor(_499);
//             float _866 = 5.0f - _865;
//             bool _867 = !(_866 > -1.0099999904632568f);
//             bool _868 = (_866 > 4.0f);
//             bool _869 = _867 || _868;
//             bool _870 = (_866 == -1.0f);
//             bool _871 = _870 || _869;
//             if (!_871) {
//               bool _873 = (_866 < 0.0f);
//               float _874 = 6.0f - _865;
//               float _875 = select(_873, _874, _866);
//               float _876 = select(_873, 0.0f, 10000.0f);
//               float _877 = _875 * 3.321928024291992f;
//               float _878 = exp2(_877);
//               float _879 = _876 / _878;
//               float _880 = abs(_879);
//               float _881 = _880 + 9.999999747378752e-05f;
//               float _882 = _881 * 0.10000000149011612f;
//               float _883 = -0.0f - _882;
//               bool _884 = (_882 >= _883);
//               float _885 = abs(_882);
//               float _886 = frac(_885);
//               float _887 = -0.0f - _886;
//               float _888 = select(_884, _886, _887);
//               float _889 = _888 * 10.0f;
//               float _890 = floor(_889);
//               int _891 = int(_890);
//               bool _892 = (_891 == 0);
//               if (!_892) {
//                 bool _894 = (_891 == 1);
//                 if (!_894) {
//                   bool _896 = (_891 == 2);
//                   if (!_896) {
//                     bool _898 = (_891 == 3);
//                     if (!_898) {
//                       bool _900 = (_891 == 4);
//                       if (!_900) {
//                         bool _902 = (_891 == 5);
//                         if (!_902) {
//                           bool _904 = (_891 == 6);
//                           if (!_904) {
//                             bool _906 = (_891 == 7);
//                             if (!_906) {
//                               bool _908 = (_891 == 8);
//                               if (!_908) {
//                                 bool _910 = (_891 == 9);
//                                 double _911 = select(_910, 481095.0, 0.0);
//                                 _913 = _911;
//                               } else {
//                                 _913 = 481111.0;
//                               }
//                             } else {
//                               _913 = 476228.0;
//                             }
//                           } else {
//                             _913 = 464727.0;
//                           }
//                         } else {
//                           _913 = 464711.0;
//                         }
//                       } else {
//                         _913 = 350020.0;
//                       }
//                     } else {
//                       _913 = 476999.0;
//                     }
//                   } else {
//                     _913 = 476951.0;
//                   }
//                 } else {
//                   _913 = 139810.0;
//                 }
//               } else {
//                 _913 = 480599.0;
//               }
//               float _914 = float(_913);
//               _916 = _914;
//             } else {
//               _916 = 0.0f;
//             }
//             float _917 = frac(_499);
//             float _918 = _917 * 4.0f;
//             float _919 = floor(_918);
//             float _920 = _858 * 0.5f;
//             float _921 = 5.0f - _920;
//             float _922 = floor(_921);
//             float _923 = _922 * 4.0f;
//             float _924 = _923 + _919;
//             float _925 = exp2(_924);
//             float _926 = _916 / _925;
//             float _927 = _926 * 0.5f;
//             float _928 = -0.0f - _927;
//             bool _929 = (_927 >= _928);
//             float _930 = abs(_927);
//             float _931 = frac(_930);
//             float _932 = -0.0f - _931;
//             float _933 = select(_929, _931, _932);
//             float _934 = _933 * 2.0f;
//             float _935 = floor(_934);
//             _937 = _935;
//           } else {
//             _937 = 0.0f;
//           }
//           float _938 = 15.0f - _855;
//           float _939 = 15.0f - _856;
//           float _940 = 15.0f - _857;
//           float _941 = _937 * _938;
//           float _942 = _937 * _939;
//           float _943 = _937 * _940;
//           float _944 = _941 + _855;
//           float _945 = _942 + _856;
//           float _946 = _943 + _857;
//           float _947 = saturate(_404);
//           float _948 = log2(_947);
//           float _949 = _948 * 0.3010300099849701f;
//           float _950 = floor(_949);
//           float _951 =
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y +
//           -20.0f; float _952 = _404 * 9.999999747378752e-05f; float _953 =
//           saturate(_952); float _954 = sqrt(_953); float _955 = 1.0f - _954;
//           float _956 = _955 * _955;
//           float _957 = 1.0f - _956;
//           float _958 = sqrt(_957);
//           float _959 = _958 *
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y;
//           float _960 = _959 + -10.0f;
//           float _961 = max(_960, 30.0f);
//           float _962 = min(_961, _951);
//           float _963 = _319 + 1.0f;
//           float _964 = _320 + -1.0f;
//           float _965 = _963 - _493;
//           float _966 = _964 - _962;
//           float _967 = _965 * 0.10000000149011612f;
//           float _968 = _966 * 0.10000000149011612f;
//           float _969 = 1.0f - _968;
//           bool _970 = (_969 < 0.0f);
//           bool _971 = (_969 >= 1.0f);
//           bool _972 = _970 || _971;
//           if (!_972) {
//             float _974 = log2(_404);
//             float _975 = _974 * 0.3010300099849701f;
//             float _976 = floor(_975);
//             float _977 = _976 + 1.0f;
//             float _978 = abs(_404);
//             float _979 = log2(_978);
//             float _980 = _979 * 0.3010300099849701f;
//             float _981 = floor(_980);
//             float _982 = max(_981, 0.0f);
//             float _983 = floor(_967);
//             float _984 = _977 - _983;
//             float _985 = _950 + -1.0099999904632568f;
//             bool _986 = (_984 > _985);
//             if (_986) {
//               bool _988 = (_984 > _982);
//               if (_988) {
//                 bool _990 = (_404 < 0.0f);
//                 float _991 = _982 + 1.5f;
//                 bool _992 = (_984 < _991);
//                 bool _993 = _990 && _992;
//                 float _994 = select(_993, 1792.0f, 0.0f);
//                 _1047 = _994;
//               } else {
//                 bool _996 = (_984 == -1.0f);
//                 if (_996) {
//                   bool _998 = (_950 < -0.0f);
//                   if (_998) {
//                     _1047 = 2.0f;
//                   } else {
//                     _1047 = 0.0f;
//                   }
//                 } else {
//                   bool _1001 = (_984 < 0.0f);
//                   if (_1001) {
//                     float _1003 = frac(_404);
//                     float _1004 = _984 + 1.0f;
//                     _1006 = _1004;
//                     _1007 = _1003;
//                   } else {
//                     _1006 = _984;
//                     _1007 = _404;
//                   }
//                   float _1008 = _1006 * 3.321928024291992f;
//                   float _1009 = exp2(_1008);
//                   float _1010 = _1007 / _1009;
//                   float _1011 = abs(_1010);
//                   float _1012 = _1011 + 9.999999747378752e-05f;
//                   float _1013 = _1012 * 0.10000000149011612f;
//                   float _1014 = -0.0f - _1013;
//                   bool _1015 = (_1013 >= _1014);
//                   float _1016 = abs(_1013);
//                   float _1017 = frac(_1016);
//                   float _1018 = -0.0f - _1017;
//                   float _1019 = select(_1015, _1017, _1018);
//                   float _1020 = _1019 * 10.0f;
//                   float _1021 = floor(_1020);
//                   int _1022 = int(_1021);
//                   bool _1023 = (_1022 == 0);
//                   if (!_1023) {
//                     bool _1025 = (_1022 == 1);
//                     if (!_1025) {
//                       bool _1027 = (_1022 == 2);
//                       if (!_1027) {
//                         bool _1029 = (_1022 == 3);
//                         if (!_1029) {
//                           bool _1031 = (_1022 == 4);
//                           if (!_1031) {
//                             bool _1033 = (_1022 == 5);
//                             if (!_1033) {
//                               bool _1035 = (_1022 == 6);
//                               if (!_1035) {
//                                 bool _1037 = (_1022 == 7);
//                                 if (!_1037) {
//                                   bool _1039 = (_1022 == 8);
//                                   if (!_1039) {
//                                     bool _1041 = (_1022 == 9);
//                                     double _1042 = select(_1041, 481095.0,
//                                     0.0); _1044 = _1042;
//                                   } else {
//                                     _1044 = 481111.0;
//                                   }
//                                 } else {
//                                   _1044 = 476228.0;
//                                 }
//                               } else {
//                                 _1044 = 464727.0;
//                               }
//                             } else {
//                               _1044 = 464711.0;
//                             }
//                           } else {
//                             _1044 = 350020.0;
//                           }
//                         } else {
//                           _1044 = 476999.0;
//                         }
//                       } else {
//                         _1044 = 476951.0;
//                       }
//                     } else {
//                       _1044 = 139810.0;
//                     }
//                   } else {
//                     _1044 = 480599.0;
//                   }
//                   float _1045 = float(_1044);
//                   _1047 = _1045;
//                 }
//               }
//             } else {
//               _1047 = 0.0f;
//             }
//             float _1048 = frac(_967);
//             float _1049 = _1048 * 4.0f;
//             float _1050 = floor(_1049);
//             float _1051 = _966 * 0.5f;
//             float _1052 = 5.0f - _1051;
//             float _1053 = floor(_1052);
//             float _1054 = _1053 * 4.0f;
//             float _1055 = _1054 + _1050;
//             float _1056 = exp2(_1055);
//             float _1057 = _1047 / _1056;
//             float _1058 = _1057 * 0.5f;
//             float _1059 = -0.0f - _1058;
//             bool _1060 = (_1058 >= _1059);
//             float _1061 = abs(_1058);
//             float _1062 = frac(_1061);
//             float _1063 = -0.0f - _1062;
//             float _1064 = select(_1060, _1062, _1063);
//             float _1065 = _1064 * 2.0f;
//             float _1066 = floor(_1065);
//             _1068 = _1066;
//           } else {
//             _1068 = 0.0f;
//           }
//           float _1069 = _1068 * _944;
//           float _1070 = _1068 * _945;
//           float _1071 = _1068 * _946;
//           float _1072 = _944 - _1069;
//           float _1073 = _945 - _1070;
//           float _1074 = _946 - _1071;
//           float _1075 = _320 - _962;
//           float _1076 = _1075 * 0.10000000149011612f;
//           float _1077 = 1.0f - _1076;
//           bool _1078 = (_1077 < 0.0f);
//           bool _1079 = (_1077 >= 1.0f);
//           bool _1080 = _1078 || _1079;
//           if (!_1080) {
//             float _1082 = log2(_404);
//             float _1083 = _1082 * 0.3010300099849701f;
//             float _1084 = floor(_1083);
//             float _1085 = _1084 + 1.0f;
//             float _1086 = abs(_404);
//             float _1087 = log2(_1086);
//             float _1088 = _1087 * 0.3010300099849701f;
//             float _1089 = floor(_1088);
//             float _1090 = max(_1089, 0.0f);
//             float _1091 = floor(_499);
//             float _1092 = _1085 - _1091;
//             float _1093 = _950 + -1.0099999904632568f;
//             bool _1094 = (_1092 > _1093);
//             if (_1094) {
//               bool _1096 = (_1092 > _1090);
//               if (_1096) {
//                 bool _1098 = (_404 < 0.0f);
//                 float _1099 = _1090 + 1.5f;
//                 bool _1100 = (_1092 < _1099);
//                 bool _1101 = _1098 && _1100;
//                 float _1102 = select(_1101, 1792.0f, 0.0f);
//                 _1155 = _1102;
//               } else {
//                 bool _1104 = (_1092 == -1.0f);
//                 if (_1104) {
//                   bool _1106 = (_950 < -0.0f);
//                   if (_1106) {
//                     _1155 = 2.0f;
//                   } else {
//                     _1155 = 0.0f;
//                   }
//                 } else {
//                   bool _1109 = (_1092 < 0.0f);
//                   if (_1109) {
//                     float _1111 = frac(_404);
//                     float _1112 = _1092 + 1.0f;
//                     _1114 = _1112;
//                     _1115 = _1111;
//                   } else {
//                     _1114 = _1092;
//                     _1115 = _404;
//                   }
//                   float _1116 = _1114 * 3.321928024291992f;
//                   float _1117 = exp2(_1116);
//                   float _1118 = _1115 / _1117;
//                   float _1119 = abs(_1118);
//                   float _1120 = _1119 + 9.999999747378752e-05f;
//                   float _1121 = _1120 * 0.10000000149011612f;
//                   float _1122 = -0.0f - _1121;
//                   bool _1123 = (_1121 >= _1122);
//                   float _1124 = abs(_1121);
//                   float _1125 = frac(_1124);
//                   float _1126 = -0.0f - _1125;
//                   float _1127 = select(_1123, _1125, _1126);
//                   float _1128 = _1127 * 10.0f;
//                   float _1129 = floor(_1128);
//                   int _1130 = int(_1129);
//                   bool _1131 = (_1130 == 0);
//                   if (!_1131) {
//                     bool _1133 = (_1130 == 1);
//                     if (!_1133) {
//                       bool _1135 = (_1130 == 2);
//                       if (!_1135) {
//                         bool _1137 = (_1130 == 3);
//                         if (!_1137) {
//                           bool _1139 = (_1130 == 4);
//                           if (!_1139) {
//                             bool _1141 = (_1130 == 5);
//                             if (!_1141) {
//                               bool _1143 = (_1130 == 6);
//                               if (!_1143) {
//                                 bool _1145 = (_1130 == 7);
//                                 if (!_1145) {
//                                   bool _1147 = (_1130 == 8);
//                                   if (!_1147) {
//                                     bool _1149 = (_1130 == 9);
//                                     double _1150 = select(_1149, 481095.0,
//                                     0.0); _1152 = _1150;
//                                   } else {
//                                     _1152 = 481111.0;
//                                   }
//                                 } else {
//                                   _1152 = 476228.0;
//                                 }
//                               } else {
//                                 _1152 = 464727.0;
//                               }
//                             } else {
//                               _1152 = 464711.0;
//                             }
//                           } else {
//                             _1152 = 350020.0;
//                           }
//                         } else {
//                           _1152 = 476999.0;
//                         }
//                       } else {
//                         _1152 = 476951.0;
//                       }
//                     } else {
//                       _1152 = 139810.0;
//                     }
//                   } else {
//                     _1152 = 480599.0;
//                   }
//                   float _1153 = float(_1152);
//                   _1155 = _1153;
//                 }
//               }
//             } else {
//               _1155 = 0.0f;
//             }
//             float _1156 = frac(_499);
//             float _1157 = _1156 * 4.0f;
//             float _1158 = floor(_1157);
//             float _1159 = _1075 * 0.5f;
//             float _1160 = 5.0f - _1159;
//             float _1161 = floor(_1160);
//             float _1162 = _1161 * 4.0f;
//             float _1163 = _1162 + _1158;
//             float _1164 = exp2(_1163);
//             float _1165 = _1155 / _1164;
//             float _1166 = _1165 * 0.5f;
//             float _1167 = -0.0f - _1166;
//             bool _1168 = (_1166 >= _1167);
//             float _1169 = abs(_1166);
//             float _1170 = frac(_1169);
//             float _1171 = -0.0f - _1170;
//             float _1172 = select(_1168, _1170, _1171);
//             float _1173 = _1172 * 2.0f;
//             float _1174 = floor(_1173);
//             _1176 = _1174;
//           } else {
//             _1176 = 0.0f;
//           }
//           float _1177 = (User_000.UserConstant_Z_000[0].x) - _1072;
//           float _1178 = (User_000.UserConstant_Z_000[0].x) - _1073;
//           float _1179 = (User_000.UserConstant_Z_000[0].x) - _1074;
//           float _1180 = _1176 * _1177;
//           float _1181 = _1176 * _1178;
//           float _1182 = _1176 * _1179;
//           float _1183 = _1180 + _1072;
//           float _1184 = _1181 + _1073;
//           float _1185 = _1182 + _1074;
//           float _1187 = saturate(User_000.UserConstant_Z_000[0].z);
//           float _1188 = log2(_1187);
//           float _1189 = _1188 * 0.3010300099849701f;
//           float _1190 = floor(_1189);
//           float _1191 = (User_000.UserConstant_Z_000[0].z)
//           * 9.999999747378752e-05f; float _1192 = saturate(_1191); float
//           _1193 = sqrt(_1192); float _1194 = 1.0f - _1193; float _1195 =
//           _1194 * _1194; float _1196 = 1.0f - _1195; float _1197 =
//           sqrt(_1196); float _1198 = _1197 *
//           Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y;
//           float _1199 = _1198 + -10.0f;
//           float _1200 = max(_1199, 30.0f);
//           float _1201 = min(_1200, _951);
//           float _1202 = _964 - _1201;
//           float _1203 = _1202 * 0.10000000149011612f;
//           float _1204 = 1.0f - _1203;
//           bool _1205 = (_1204 < 0.0f);
//           bool _1206 = (_1204 >= 1.0f);
//           bool _1207 = _1205 || _1206;
//           if (!_1207) {
//             float _1209 = log2(User_000.UserConstant_Z_000[0].z);
//             float _1210 = _1209 * 0.3010300099849701f;
//             float _1211 = floor(_1210);
//             float _1212 = _1211 + 1.0f;
//             float _1213 = abs(User_000.UserConstant_Z_000[0].z);
//             float _1214 = log2(_1213);
//             float _1215 = _1214 * 0.3010300099849701f;
//             float _1216 = floor(_1215);
//             float _1217 = max(_1216, 0.0f);
//             float _1218 = floor(_967);
//             float _1219 = _1212 - _1218;
//             float _1220 = _1190 + -1.0099999904632568f;
//             bool _1221 = (_1219 > _1220);
//             if (_1221) {
//               bool _1223 = (_1219 > _1217);
//               if (_1223) {
//                 bool _1225 = ((User_000.UserConstant_Z_000[0].z) < 0.0f);
//                 float _1226 = _1217 + 1.5f;
//                 bool _1227 = (_1219 < _1226);
//                 bool _1228 = _1225 && _1227;
//                 float _1229 = select(_1228, 1792.0f, 0.0f);
//                 _1282 = _1229;
//               } else {
//                 bool _1231 = (_1219 == -1.0f);
//                 if (_1231) {
//                   bool _1233 = (_1190 < -0.0f);
//                   if (_1233) {
//                     _1282 = 2.0f;
//                   } else {
//                     _1282 = 0.0f;
//                   }
//                 } else {
//                   bool _1236 = (_1219 < 0.0f);
//                   if (_1236) {
//                     float _1238 = frac(User_000.UserConstant_Z_000[0].z);
//                     float _1239 = _1219 + 1.0f;
//                     _1241 = _1239;
//                     _1242 = _1238;
//                   } else {
//                     _1241 = _1219;
//                     _1242 = (User_000.UserConstant_Z_000[0].z);
//                   }
//                   float _1243 = _1241 * 3.321928024291992f;
//                   float _1244 = exp2(_1243);
//                   float _1245 = _1242 / _1244;
//                   float _1246 = abs(_1245);
//                   float _1247 = _1246 + 9.999999747378752e-05f;
//                   float _1248 = _1247 * 0.10000000149011612f;
//                   float _1249 = -0.0f - _1248;
//                   bool _1250 = (_1248 >= _1249);
//                   float _1251 = abs(_1248);
//                   float _1252 = frac(_1251);
//                   float _1253 = -0.0f - _1252;
//                   float _1254 = select(_1250, _1252, _1253);
//                   float _1255 = _1254 * 10.0f;
//                   float _1256 = floor(_1255);
//                   int _1257 = int(_1256);
//                   bool _1258 = (_1257 == 0);
//                   if (!_1258) {
//                     bool _1260 = (_1257 == 1);
//                     if (!_1260) {
//                       bool _1262 = (_1257 == 2);
//                       if (!_1262) {
//                         bool _1264 = (_1257 == 3);
//                         if (!_1264) {
//                           bool _1266 = (_1257 == 4);
//                           if (!_1266) {
//                             bool _1268 = (_1257 == 5);
//                             if (!_1268) {
//                               bool _1270 = (_1257 == 6);
//                               if (!_1270) {
//                                 bool _1272 = (_1257 == 7);
//                                 if (!_1272) {
//                                   bool _1274 = (_1257 == 8);
//                                   if (!_1274) {
//                                     bool _1276 = (_1257 == 9);
//                                     double _1277 = select(_1276, 481095.0,
//                                     0.0); _1279 = _1277;
//                                   } else {
//                                     _1279 = 481111.0;
//                                   }
//                                 } else {
//                                   _1279 = 476228.0;
//                                 }
//                               } else {
//                                 _1279 = 464727.0;
//                               }
//                             } else {
//                               _1279 = 464711.0;
//                             }
//                           } else {
//                             _1279 = 350020.0;
//                           }
//                         } else {
//                           _1279 = 476999.0;
//                         }
//                       } else {
//                         _1279 = 476951.0;
//                       }
//                     } else {
//                       _1279 = 139810.0;
//                     }
//                   } else {
//                     _1279 = 480599.0;
//                   }
//                   float _1280 = float(_1279);
//                   _1282 = _1280;
//                 }
//               }
//             } else {
//               _1282 = 0.0f;
//             }
//             float _1283 = frac(_967);
//             float _1284 = _1283 * 4.0f;
//             float _1285 = floor(_1284);
//             float _1286 = _1202 * 0.5f;
//             float _1287 = 5.0f - _1286;
//             float _1288 = floor(_1287);
//             float _1289 = _1288 * 4.0f;
//             float _1290 = _1289 + _1285;
//             float _1291 = exp2(_1290);
//             float _1292 = _1282 / _1291;
//             float _1293 = _1292 * 0.5f;
//             float _1294 = -0.0f - _1293;
//             bool _1295 = (_1293 >= _1294);
//             float _1296 = abs(_1293);
//             float _1297 = frac(_1296);
//             float _1298 = -0.0f - _1297;
//             float _1299 = select(_1295, _1297, _1298);
//             float _1300 = _1299 * 2.0f;
//             float _1301 = floor(_1300);
//             _1303 = _1301;
//           } else {
//             _1303 = 0.0f;
//           }
//           float _1304 = _1303 * _1183;
//           float _1305 = _1303 * _1184;
//           float _1306 = _1303 * _1185;
//           float _1307 = _1183 - _1304;
//           float _1308 = _1184 - _1305;
//           float _1309 = _1185 - _1306;
//           float _1310 = _320 - _1201;
//           float _1311 = _1310 * 0.10000000149011612f;
//           float _1312 = 1.0f - _1311;
//           bool _1313 = (_1312 < 0.0f);
//           bool _1314 = (_1312 >= 1.0f);
//           bool _1315 = _1313 || _1314;
//           if (!_1315) {
//             float _1317 = log2(User_000.UserConstant_Z_000[0].z);
//             float _1318 = _1317 * 0.3010300099849701f;
//             float _1319 = floor(_1318);
//             float _1320 = _1319 + 1.0f;
//             float _1321 = abs(User_000.UserConstant_Z_000[0].z);
//             float _1322 = log2(_1321);
//             float _1323 = _1322 * 0.3010300099849701f;
//             float _1324 = floor(_1323);
//             float _1325 = max(_1324, 0.0f);
//             float _1326 = floor(_499);
//             float _1327 = _1320 - _1326;
//             float _1328 = _1190 + -1.0099999904632568f;
//             bool _1329 = (_1327 > _1328);
//             if (_1329) {
//               bool _1331 = (_1327 > _1325);
//               if (_1331) {
//                 bool _1333 = ((User_000.UserConstant_Z_000[0].z) < 0.0f);
//                 float _1334 = _1325 + 1.5f;
//                 bool _1335 = (_1327 < _1334);
//                 bool _1336 = _1333 && _1335;
//                 float _1337 = select(_1336, 1792.0f, 0.0f);
//                 _1387 = _1337;
//               } else {
//                 bool _1339 = (_1327 == -1.0f);
//                 if (_1339) {
//                   bool _1341 = (_1190 < -0.0f);
//                   if (_1341) {
//                     _1387 = 2.0f;
//                   } else {
//                     _1387 = 0.0f;
//                   }
//                 } else {
//                   bool _1344 = (_1327 < 0.0f);
//                   if (_1344) {
//                     float _1346 = frac(User_000.UserConstant_Z_000[0].z);
//                     float _1347 = _1327 + 1.0f;
//                     _1349 = _1347;
//                     _1350 = _1346;
//                   } else {
//                     _1349 = _1327;
//                     _1350 = (User_000.UserConstant_Z_000[0].z);
//                   }
//                   float _1351 = _1349 * 3.321928024291992f;
//                   float _1352 = exp2(_1351);
//                   float _1353 = _1350 / _1352;
//                   float _1354 = abs(_1353);
//                   float _1355 = _1354 + 9.999999747378752e-05f;
//                   float _1356 = _1355 * 0.10000000149011612f;
//                   float _1357 = -0.0f - _1356;
//                   bool _1358 = (_1356 >= _1357);
//                   float _1359 = abs(_1356);
//                   float _1360 = frac(_1359);
//                   float _1361 = -0.0f - _1360;
//                   float _1362 = select(_1358, _1360, _1361);
//                   float _1363 = _1362 * 10.0f;
//                   float _1364 = floor(_1363);
//                   int _1365 = int(_1364);
//                   bool _1366 = (_1365 == 0);
//                   if (!_1366) {
//                     bool _1368 = (_1365 == 1);
//                     if (!_1368) {
//                       bool _1370 = (_1365 == 2);
//                       if (!_1370) {
//                         bool _1372 = (_1365 == 3);
//                         if (!_1372) {
//                           bool _1374 = (_1365 == 4);
//                           if (!_1374) {
//                             bool _1376 = (_1365 == 5);
//                             if (!_1376) {
//                               bool _1378 = (_1365 == 6);
//                               if (!_1378) {
//                                 bool _1380 = (_1365 == 7);
//                                 if (!_1380) {
//                                   bool _1382 = (_1365 == 8);
//                                   if (!_1382) {
//                                     bool _1384 = (_1365 == 9);
//                                     float _1385 = select(_1384, 481095.0f,
//                                     0.0f); _1387 = _1385;
//                                   } else {
//                                     _1387 = 481111.0f;
//                                   }
//                                 } else {
//                                   _1387 = 476228.0f;
//                                 }
//                               } else {
//                                 _1387 = 464727.0f;
//                               }
//                             } else {
//                               _1387 = 464711.0f;
//                             }
//                           } else {
//                             _1387 = 350020.0f;
//                           }
//                         } else {
//                           _1387 = 476999.0f;
//                         }
//                       } else {
//                         _1387 = 476951.0f;
//                       }
//                     } else {
//                       _1387 = 139810.0f;
//                     }
//                   } else {
//                     _1387 = 480599.0f;
//                   }
//                 }
//               }
//             } else {
//               _1387 = 0.0f;
//             }
//             float _1388 = frac(_499);
//             float _1389 = _1388 * 4.0f;
//             float _1390 = floor(_1389);
//             float _1391 = _1310 * 0.5f;
//             float _1392 = 5.0f - _1391;
//             float _1393 = floor(_1392);
//             float _1394 = _1393 * 4.0f;
//             float _1395 = _1394 + _1390;
//             float _1396 = exp2(_1395);
//             float _1397 = _1387 / _1396;
//             float _1398 = _1397 * 0.5f;
//             float _1399 = -0.0f - _1398;
//             bool _1400 = (_1398 >= _1399);
//             float _1401 = abs(_1398);
//             float _1402 = frac(_1401);
//             float _1403 = -0.0f - _1402;
//             float _1404 = select(_1400, _1402, _1403);
//             float _1405 = _1404 * 2.0f;
//             float _1406 = floor(_1405);
//             _1408 = _1406;
//           } else {
//             _1408 = 0.0f;
//           }
//           float _1409 = (User_000.UserConstant_Z_000[0].x) - _1307;
//           float _1410 = (User_000.UserConstant_Z_000[0].x) - _1308;
//           float _1411 = (User_000.UserConstant_Z_000[0].x) - _1309;
//           float _1412 = _1408 * _1409;
//           float _1413 = _1408 * _1410;
//           float _1414 = _1408 * _1411;
//           float _1415 = _1412 + _1307;
//           float _1416 = _1413 + _1308;
//           float _1417 = _1414 + _1309;
//           _1419 = _1415;
//           _1420 = _1416;
//           _1421 = _1417;
//         } else {
//           _1419 = _488;
//           _1420 = _489;
//           _1421 = _490;
//         }
//         float _1422 = floor(_319);
//         float _1423 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x *
//         0.5f; float _1424 = floor(_1423); float _1425 = _1422 - _1424; float
//         _1426 = floor(_320); float _1427 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//         0.5f; float _1428 = floor(_1427); float _1429 = _1426 - _1428; bool
//         _1430 = (_1425 == 0.0f); if (_1430) {
//           float _1432 = abs(_1429);
//           bool _1433 = (_1432 < 32.0f);
//           if (_1433) {
//             _1436 = 0.0f;
//             _1437 = 0.0f;
//             _1438 = 0.0f;
//           } else {
//             _1436 = _1419;
//             _1437 = _1420;
//             _1438 = _1421;
//           }
//         } else {
//           _1436 = _1419;
//           _1437 = _1420;
//           _1438 = _1421;
//         }
//         bool _1439 = (_1429 == 1.0f);
//         if (_1439) {
//           float _1441 = abs(_1425);
//           bool _1442 = (_1441 < 32.0f);
//           if (_1442) {
//             _1445 = 0.0f;
//             _1446 = 0.0f;
//             _1447 = 0.0f;
//           } else {
//             _1445 = _1436;
//             _1446 = _1437;
//             _1447 = _1438;
//           }
//         } else {
//           _1445 = _1436;
//           _1446 = _1437;
//           _1447 = _1438;
//         }
//         bool _1448 = (_1425 == 1.0f);
//         if (_1448) {
//           float _1450 = abs(_1429);
//           bool _1451 = (_1450 < 32.0f);
//           if (_1451) {
//             _1454 = (User_000.UserConstant_Z_000[0].x);
//             _1455 = (User_000.UserConstant_Z_000[0].x);
//             _1456 = (User_000.UserConstant_Z_000[0].x);
//           } else {
//             _1454 = _1445;
//             _1455 = _1446;
//             _1456 = _1447;
//           }
//         } else {
//           _1454 = _1445;
//           _1455 = _1446;
//           _1456 = _1447;
//         }
//         bool _1457 = (_1429 == 0.0f);
//         if (_1457) {
//           float _1459 = abs(_1425);
//           bool _1460 = (_1459 < 32.0f);
//           if (_1460) {
//             _1463 = (User_000.UserConstant_Z_000[0].x);
//             _1464 = (User_000.UserConstant_Z_000[0].x);
//             _1465 = (User_000.UserConstant_Z_000[0].x);
//           } else {
//             _1463 = _1454;
//             _1464 = _1455;
//             _1465 = _1456;
//           }
//         } else {
//           _1463 = _1454;
//           _1464 = _1455;
//           _1465 = _1456;
//         }
//         float _1466 = _1463 * 9.999999747378752e-05f;
//         float _1467 = _1464 * 9.999999747378752e-05f;
//         float _1468 = _1465 * 9.999999747378752e-05f;
//         float _1469 = abs(_1466);
//         float _1470 = abs(_1467);
//         float _1471 = abs(_1468);
//         float _1472 = log2(_1469);
//         float _1473 = log2(_1470);
//         float _1474 = log2(_1471);
//         float _1475 = _1472 * 0.1593017578125f;
//         float _1476 = _1473 * 0.1593017578125f;
//         float _1477 = _1474 * 0.1593017578125f;
//         float _1478 = exp2(_1475);
//         float _1479 = exp2(_1476);
//         float _1480 = exp2(_1477);
//         float _1481 = _1478 * 18.8515625f;
//         float _1482 = _1479 * 18.8515625f;
//         float _1483 = _1480 * 18.8515625f;
//         float _1484 = _1481 + 0.8359375f;
//         float _1485 = _1482 + 0.8359375f;
//         float _1486 = _1483 + 0.8359375f;
//         float _1487 = _1478 * 18.6875f;
//         float _1488 = _1479 * 18.6875f;
//         float _1489 = _1480 * 18.6875f;
//         float _1490 = _1487 + 1.0f;
//         float _1491 = _1488 + 1.0f;
//         float _1492 = _1489 + 1.0f;
//         float _1493 = _1484 / _1490;
//         float _1494 = _1485 / _1491;
//         float _1495 = _1486 / _1492;
//         float _1496 = log2(_1493);
//         float _1497 = log2(_1494);
//         float _1498 = log2(_1495);
//         float _1499 = _1496 * 78.84375f;
//         float _1500 = _1497 * 78.84375f;
//         float _1501 = _1498 * 78.84375f;
//         float _1502 = exp2(_1499);
//         float _1503 = exp2(_1500);
//         float _1504 = exp2(_1501);
//         _1913 = _1502;
//         _1914 = _1503;
//         _1915 = _1504;
//         break;
//       }
//       case 6: {
//         bool _1507 = (_111 > (User_000.UserConstant_Z_000[0].z));
//         bool _1508 = (_112 > (User_000.UserConstant_Z_000[0].z));
//         bool _1509 = (_113 > (User_000.UserConstant_Z_000[0].z));
//         bool _1510 = _1507 || _1508;
//         bool _1511 = _1509 || _1510;
//         if (!_1511) {
//           float _1513 = dot(float3(_111, _112, _113),
//           float3(0.26269999146461487f, 0.6779999732971191f,
//           0.059300001710653305f)); float _1514 = _1513
//           * 9.999999747378752e-05f; _1516 = _1514; _1517 = _1514;
//         } else {
//           _1516 = 1.0f;
//           _1517 = 0.0f;
//         }
//         float _1518 = abs(_1516);
//         float _1519 = abs(_1517);
//         float _1520 = log2(_1518);
//         float _1521 = log2(_1519);
//         float _1522 = _1520 * 0.1593017578125f;
//         float _1523 = _1521 * 0.1593017578125f;
//         float _1524 = exp2(_1522);
//         float _1525 = exp2(_1523);
//         float _1526 = _1524 * 18.8515625f;
//         float _1527 = _1525 * 18.8515625f;
//         float _1528 = _1526 + 0.8359375f;
//         float _1529 = _1527 + 0.8359375f;
//         float _1530 = _1524 * 18.6875f;
//         float _1531 = _1525 * 18.6875f;
//         float _1532 = _1530 + 1.0f;
//         float _1533 = _1531 + 1.0f;
//         float _1534 = _1528 / _1532;
//         float _1535 = _1529 / _1533;
//         float _1536 = log2(_1534);
//         float _1537 = log2(_1535);
//         float _1538 = _1536 * 78.84375f;
//         float _1539 = _1537 * 78.84375f;
//         float _1540 = exp2(_1538);
//         float _1541 = exp2(_1539);
//         _1913 = _1540;
//         _1914 = _1541;
//         _1915 = _1541;
//         break;
//       }
//       case 7: {
//         bool _1545 = (_111 > (User_000.UserConstant_Z_000[1].y));
//         bool _1546 = (_112 > (User_000.UserConstant_Z_000[1].y));
//         bool _1547 = (_113 > (User_000.UserConstant_Z_000[1].y));
//         bool _1548 = _1545 || _1546;
//         bool _1549 = _1547 || _1548;
//         if (!_1549) {
//           float _1551 = dot(float3(_111, _112, _113),
//           float3(0.26269999146461487f, 0.6779999732971191f,
//           0.059300001710653305f)); float _1552 = _1551
//           * 9.999999747378752e-05f; _1554 = _1552; _1555 = _1552;
//         } else {
//           _1554 = 0.0f;
//           _1555 = 1.0f;
//         }
//         float _1556 = abs(_1554);
//         float _1557 = abs(_1555);
//         float _1558 = log2(_1556);
//         float _1559 = log2(_1557);
//         float _1560 = _1558 * 0.1593017578125f;
//         float _1561 = _1559 * 0.1593017578125f;
//         float _1562 = exp2(_1560);
//         float _1563 = exp2(_1561);
//         float _1564 = _1562 * 18.8515625f;
//         float _1565 = _1563 * 18.8515625f;
//         float _1566 = _1564 + 0.8359375f;
//         float _1567 = _1565 + 0.8359375f;
//         float _1568 = _1562 * 18.6875f;
//         float _1569 = _1563 * 18.6875f;
//         float _1570 = _1568 + 1.0f;
//         float _1571 = _1569 + 1.0f;
//         float _1572 = _1566 / _1570;
//         float _1573 = _1567 / _1571;
//         float _1574 = log2(_1572);
//         float _1575 = log2(_1573);
//         float _1576 = _1574 * 78.84375f;
//         float _1577 = _1575 * 78.84375f;
//         float _1578 = exp2(_1576);
//         float _1579 = exp2(_1577);
//         _1913 = _1578;
//         _1914 = _1579;
//         _1915 = _1578;
//         break;
//       }
//       case 9: {
//         float _1586 = TEXCOORD.x + -0.5f;
//         float _1587 = TEXCOORD.y + -0.5f;
//         float _1588 = abs(_1586);
//         float _1589 = abs(_1587);
//         float _1590 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_024.x *
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y;
//         float _1591 = _1590 * 0.15000000596046448f;
//         bool _1592 = (_1588 < _1591);
//         bool _1593 = (_1589 < 0.15000000596046448f);
//         bool _1594 = _1592 && _1593;
//         if (_1594) {
//           float _1596 = _1590 * 0.05000000074505806f;
//           bool _1597 = (_1588 < _1596);
//           bool _1598 = (_1589 < 0.05000000074505806f);
//           bool _1599 = _1597 || _1598;
//           if (_1599) {
//             float _1601 = (User_000.UserConstant_Z_000[4].y)
//             * 9.999999747378752e-05f; float _1602 = abs(_1601); float _1603 =
//             log2(_1602); float _1604 = _1603 * 0.1593017578125f; float _1605
//             = exp2(_1604); float _1606 = _1605 * 18.8515625f; float _1607 =
//             _1606 + 0.8359375f; float _1608 = _1605 * 18.6875f; float _1609 =
//             _1608 + 1.0f; float _1610 = _1607 / _1609; float _1611 =
//             log2(_1610); float _1612 = _1611 * 78.84375f; float _1613 =
//             exp2(_1612); _1913 = _1613; _1914 = _1613; _1915 = _1613;
//           } else {
//             _1913 = 1.0f;
//             _1914 = 1.0f;
//             _1915 = 1.0f;
//           }
//         } else {
//           _1913 = 0.0f;
//           _1914 = 0.0f;
//           _1915 = 0.0f;
//         }
//         break;
//       }
//       case 20: {
//         int _1619 =
//         int(Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x);
//         int _1620 =
//         int(Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y);
//         float _1622 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y
//         * 24.0f; float _1623 = _1622 *
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_024.x; int
//         _1624 = int(_1623); int _1625 = _1619 / 24; int _1626 = _1620 /
//         _1624; int _1627 = _1619 % _1625; int _1628 = _1620 % _1626; uint
//         _1629 = _1627 + 1u; uint _1630 = _1628 + 1u; int _1631 = _1629 / 2;
//         int _1632 = _1630 / 2;
//         float _1633 = float((int)(_1619));
//         float _1634 = float((int)(_1620));
//         float _1635 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x -
//         _1633; float _1636 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y -
//         _1634; float _1637 = _1635 * 0.5f; float _1638 = _1636 * 0.5f; float
//         _1639 = float((int)(_1631)); float _1640 = float((int)(_1632)); float
//         _1641 = _1639 + _1637; float _1642 = _1640 + _1638; int _1643 =
//         int(_1641); int _1644 = int(_1642); bool _1645 = ((int)_172 >=
//         (int)_1643); bool _1646 = ((int)_173 >= (int)_1644); bool _1647 =
//         _1645 && _1646; if (_1647) {
//           uint _1649 = _1644 + _1620;
//           float _1650 = float((int)(_1649));
//           float _1651 = _1640 * 2.0f;
//           float _1652 = _1650 - _1651;
//           int _1653 = int(_1652);
//           uint _1654 = _1643 + _1619;
//           float _1655 = float((int)(_1654));
//           float _1656 = _1639 * 2.0f;
//           float _1657 = _1655 - _1656;
//           int _1658 = int(_1657);
//           bool _1659 = ((int)_172 < (int)_1658);
//           bool _1660 = ((int)_173 < (int)_1653);
//           bool _1661 = _1659 && _1660;
//           if (_1661) {
//             uint _1663 = _172 - _1643;
//             uint _1664 = _173 - _1644;
//             int _1665 = _1663 / _1625;
//             int _1666 = _1664 / _1626;
//             int _1667 = _1665 & 1;
//             bool _1668 = (_1667 != 0);
//             int _1669 = _1666 & 1;
//             bool _1670 = (_1669 != 0);
//             bool _1671 = _1668 ^ _1670;
//             float _1672 = (User_000.UserConstant_Z_000[0].w)
//             * 9.999999747378752e-05f; float _1673 = select(_1671, 1.0f,
//             _1672); _1675 = _1673;
//           } else {
//             _1675 = 0.0f;
//           }
//         } else {
//           _1675 = 0.0f;
//         }
//         float _1676 = abs(_1675);
//         float _1677 = abs(_1675);
//         float _1678 = abs(_1675);
//         float _1679 = log2(_1676);
//         float _1680 = log2(_1677);
//         float _1681 = log2(_1678);
//         float _1682 = _1679 * 0.1593017578125f;
//         float _1683 = _1680 * 0.1593017578125f;
//         float _1684 = _1681 * 0.1593017578125f;
//         float _1685 = exp2(_1682);
//         float _1686 = exp2(_1683);
//         float _1687 = exp2(_1684);
//         float _1688 = _1685 * 18.8515625f;
//         float _1689 = _1686 * 18.8515625f;
//         float _1690 = _1687 * 18.8515625f;
//         float _1691 = _1688 + 0.8359375f;
//         float _1692 = _1689 + 0.8359375f;
//         float _1693 = _1690 + 0.8359375f;
//         float _1694 = _1685 * 18.6875f;
//         float _1695 = _1686 * 18.6875f;
//         float _1696 = _1687 * 18.6875f;
//         float _1697 = _1694 + 1.0f;
//         float _1698 = _1695 + 1.0f;
//         float _1699 = _1696 + 1.0f;
//         float _1700 = _1691 / _1697;
//         float _1701 = _1692 / _1698;
//         float _1702 = _1693 / _1699;
//         float _1703 = log2(_1700);
//         float _1704 = log2(_1701);
//         float _1705 = log2(_1702);
//         float _1706 = _1703 * 78.84375f;
//         float _1707 = _1704 * 78.84375f;
//         float _1708 = _1705 * 78.84375f;
//         float _1709 = exp2(_1706);
//         float _1710 = exp2(_1707);
//         float _1711 = exp2(_1708);
//         _1913 = _1709;
//         _1914 = _1710;
//         _1915 = _1711;
//         break;
//       }
//       case 21: {
//         float _1717 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x *
//         0.3162277638912201f; float _1718 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//         0.3162277638912201f; int _1719 = int(_1717); int _1720 = int(_1718);
//         float _1722 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y
//         * 24.0f; float _1723 = _1722 *
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_024.x; int
//         _1724 = int(_1723); int _1725 = _1719 / 24; int _1726 = _1720 /
//         _1724; int _1727 = _1719 % _1725; int _1728 = _1720 % _1726; uint
//         _1729 = _1727 + 1u; uint _1730 = _1728 + 1u; int _1731 = _1729 / 2;
//         int _1732 = _1730 / 2;
//         float _1733 = float((int)(_1719));
//         float _1734 = float((int)(_1720));
//         float _1735 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x -
//         _1733; float _1736 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y -
//         _1734; float _1737 = _1735 * 0.5f; float _1738 = _1736 * 0.5f; float
//         _1739 = float((int)(_1731)); float _1740 = float((int)(_1732)); float
//         _1741 = _1737 + _1739; float _1742 = _1740 + _1738; int _1743 =
//         int(_1741); int _1744 = int(_1742); bool _1745 = ((int)_172 >=
//         (int)_1743); bool _1746 = ((int)_173 >= (int)_1744); bool _1747 =
//         _1745 && _1746; if (_1747) {
//           uint _1749 = _1744 + _1720;
//           float _1750 = float((int)(_1749));
//           float _1751 = _1740 * 2.0f;
//           float _1752 = _1750 - _1751;
//           int _1753 = int(_1752);
//           uint _1754 = _1743 + _1719;
//           float _1755 = float((int)(_1754));
//           float _1756 = _1739 * 2.0f;
//           float _1757 = _1755 - _1756;
//           int _1758 = int(_1757);
//           bool _1759 = ((int)_172 < (int)_1758);
//           bool _1760 = ((int)_173 < (int)_1753);
//           bool _1761 = _1759 && _1760;
//           if (_1761) {
//             uint _1763 = _172 - _1743;
//             uint _1764 = _173 - _1744;
//             int _1765 = _1763 / _1725;
//             int _1766 = _1764 / _1726;
//             int _1767 = _1765 & 1;
//             bool _1768 = (_1767 != 0);
//             int _1769 = _1766 & 1;
//             bool _1770 = (_1769 != 0);
//             bool _1771 = _1768 ^ _1770;
//             float _1772 = (User_000.UserConstant_Z_000[0].z)
//             * 9.999999747378752e-05f; float _1773 = select(_1771, 1.0f,
//             _1772); _1775 = _1773;
//           } else {
//             _1775 = 9.999999747378752e-05f;
//           }
//         } else {
//           _1775 = 9.999999747378752e-05f;
//         }
//         float _1776 = abs(_1775);
//         float _1777 = abs(_1775);
//         float _1778 = abs(_1775);
//         float _1779 = log2(_1776);
//         float _1780 = log2(_1777);
//         float _1781 = log2(_1778);
//         float _1782 = _1779 * 0.1593017578125f;
//         float _1783 = _1780 * 0.1593017578125f;
//         float _1784 = _1781 * 0.1593017578125f;
//         float _1785 = exp2(_1782);
//         float _1786 = exp2(_1783);
//         float _1787 = exp2(_1784);
//         float _1788 = _1785 * 18.8515625f;
//         float _1789 = _1786 * 18.8515625f;
//         float _1790 = _1787 * 18.8515625f;
//         float _1791 = _1788 + 0.8359375f;
//         float _1792 = _1789 + 0.8359375f;
//         float _1793 = _1790 + 0.8359375f;
//         float _1794 = _1785 * 18.6875f;
//         float _1795 = _1786 * 18.6875f;
//         float _1796 = _1787 * 18.6875f;
//         float _1797 = _1794 + 1.0f;
//         float _1798 = _1795 + 1.0f;
//         float _1799 = _1796 + 1.0f;
//         float _1800 = _1791 / _1797;
//         float _1801 = _1792 / _1798;
//         float _1802 = _1793 / _1799;
//         float _1803 = log2(_1800);
//         float _1804 = log2(_1801);
//         float _1805 = log2(_1802);
//         float _1806 = _1803 * 78.84375f;
//         float _1807 = _1804 * 78.84375f;
//         float _1808 = _1805 * 78.84375f;
//         float _1809 = exp2(_1806);
//         float _1810 = exp2(_1807);
//         float _1811 = exp2(_1808);
//         _1913 = _1809;
//         _1914 = _1810;
//         _1915 = _1811;
//         break;
//       }
//       case 22: {
//         float _1817 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x *
//         0.3162277638912201f; float _1818 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y *
//         0.3162277638912201f; int _1819 = int(_1817); int _1820 = int(_1818);
//         float _1822 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y
//         * 24.0f; float _1823 = _1822 *
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_024.x; int
//         _1824 = int(_1823); int _1825 = _1819 / 24; int _1826 = _1820 /
//         _1824; int _1827 = _1819 % _1825; int _1828 = _1820 % _1826; uint
//         _1829 = _1827 + 1u; uint _1830 = _1828 + 1u; int _1831 = _1829 / 2;
//         int _1832 = _1830 / 2;
//         float _1833 = float((int)(_1819));
//         float _1834 = float((int)(_1820));
//         float _1835 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.x -
//         _1833; float _1836 =
//         Global_000.GlobalCB_Z_1728.GlobalCB_Z__ViewportConstant_Z_016.y -
//         _1834; float _1837 = _1835 * 0.5f; float _1838 = _1836 * 0.5f; float
//         _1839 = float((int)(_1831)); float _1840 = float((int)(_1832)); float
//         _1841 = _1837 + _1839; float _1842 = _1840 + _1838; int _1843 =
//         int(_1841); int _1844 = int(_1842); bool _1845 = ((int)_172 >=
//         (int)_1843); bool _1846 = ((int)_173 >= (int)_1844); bool _1847 =
//         _1845 && _1846; if (_1847) {
//           uint _1849 = _1844 + _1820;
//           float _1850 = float((int)(_1849));
//           float _1851 = _1840 * 2.0f;
//           float _1852 = _1850 - _1851;
//           int _1853 = int(_1852);
//           uint _1854 = _1843 + _1819;
//           float _1855 = float((int)(_1854));
//           float _1856 = _1839 * 2.0f;
//           float _1857 = _1855 - _1856;
//           int _1858 = int(_1857);
//           bool _1859 = ((int)_172 < (int)_1858);
//           bool _1860 = ((int)_173 < (int)_1853);
//           bool _1861 = _1859 && _1860;
//           if (_1861) {
//             uint _1863 = _172 - _1843;
//             uint _1864 = _173 - _1844;
//             int _1865 = _1863 / _1825;
//             int _1866 = _1864 / _1826;
//             int _1867 = _1865 & 1;
//             bool _1868 = (_1867 != 0);
//             int _1869 = _1866 & 1;
//             bool _1870 = (_1869 != 0);
//             bool _1871 = _1868 ^ _1870;
//             float _1872 = (User_000.UserConstant_Z_000[0].y)
//             * 9.999999747378752e-05f; float _1873 = select(_1871, _1872,
//             0.0f); _1875 = _1873;
//           } else {
//             _1875 = 9.999999747378752e-05f;
//           }
//         } else {
//           _1875 = 9.999999747378752e-05f;
//         }
//         float _1876 = abs(_1875);
//         float _1877 = abs(_1875);
//         float _1878 = abs(_1875);
//         float _1879 = log2(_1876);
//         float _1880 = log2(_1877);
//         float _1881 = log2(_1878);
//         float _1882 = _1879 * 0.1593017578125f;
//         float _1883 = _1880 * 0.1593017578125f;
//         float _1884 = _1881 * 0.1593017578125f;
//         float _1885 = exp2(_1882);
//         float _1886 = exp2(_1883);
//         float _1887 = exp2(_1884);
//         float _1888 = _1885 * 18.8515625f;
//         float _1889 = _1886 * 18.8515625f;
//         float _1890 = _1887 * 18.8515625f;
//         float _1891 = _1888 + 0.8359375f;
//         float _1892 = _1889 + 0.8359375f;
//         float _1893 = _1890 + 0.8359375f;
//         float _1894 = _1885 * 18.6875f;
//         float _1895 = _1886 * 18.6875f;
//         float _1896 = _1887 * 18.6875f;
//         float _1897 = _1894 + 1.0f;
//         float _1898 = _1895 + 1.0f;
//         float _1899 = _1896 + 1.0f;
//         float _1900 = _1891 / _1897;
//         float _1901 = _1892 / _1898;
//         float _1902 = _1893 / _1899;
//         float _1903 = log2(_1900);
//         float _1904 = log2(_1901);
//         float _1905 = log2(_1902);
//         float _1906 = _1903 * 78.84375f;
//         float _1907 = _1904 * 78.84375f;
//         float _1908 = _1905 * 78.84375f;
//         float _1909 = exp2(_1906);
//         float _1910 = exp2(_1907);
//         float _1911 = exp2(_1908);
//         _1913 = _1909;
//         _1914 = _1910;
//         _1915 = _1911;
//         break;
//       }
//       default: {
//         _1913 = 0.0f;
//         _1914 = 0.0f;
//         _1915 = 0.0f;
//         break;
//       }
//     }
//   } else {
//     _1913 = _165;
//     _1914 = _166;
//     _1915 = _167;
//   }
//   SV_Target.x = _1913;
//   SV_Target.y = _1914;
//   SV_Target.z = _1915;
//   SV_Target.w = 1.0f;
//   return SV_Target;
// }
