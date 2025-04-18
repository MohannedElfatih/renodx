#include "./common.hlsl"

// ---- Created with 3Dmigoto v1.3.16 on Thu Apr 17 23:27:06 2025

cbuffer cbHdrLut : register(b4) {
  float4 g_vHdrLutInfo : packoffset(c0);
  float4 g_vNeutralTonemapperParams0 : packoffset(c1);
  float4 g_vNeutralTonemapperParams1 : packoffset(c2);
}

Texture3D<float3> g_tInputMap : register(t0);
RWTexture3D<float3> g_uRwOutputLut : register(u0);

// 3Dmigoto declarations
#define cmp -

[numthreads(4, 4, 4)]
void main(uint3 vThreadID: SV_DispatchThreadID) {
  // Needs manual fix for instruction:
  // unknown dcl_: dcl_uav_typed_texture3d (float,float,float,float) u0
  float4 r0, r1, r2, r3, r4, r5, r6;
  uint4 bitmask, uiDest;
  float4 fDest;
  float3 test = float3(1, 1, 0);
  // Needs manual fix for instruction:
  // unknown dcl_: dcl_thread_group 4, 4, 4
  r0.xyz = vThreadID.xyz;
  r0.w = 0;
  r0.xyz = g_tInputMap.Load(r0.xyzw).xyz;
  test = r0.rgb;
  r0.w = (int)g_vHdrLutInfo.z;
  int check = (int)r0.w;

  float3 untonemapped = r0.rgb;  // in AP1?

  switch (check) {
    case 0u:
      // AP1_TO_BT709_MAT
      r1.x = dot(float3(1.70507967, -0.624233425, -0.0808462128), r0.xyz);
      r1.y = dot(float3(-0.129700527, 1.1384685, -0.00876801647), r0.xyz);
      r1.z = dot(float3(-0.0241668653, -0.124614917, 1.14878178), r0.xyz);
      // No code for instruction (needs manual fix):
      g_uRwOutputLut[vThreadID] =
          r1.rgb;  // store_uav_typed u0.xyzw, vThreadID.xyzz, r1.xyzx

      break;
    case 1u:
      // Case 1 is used in the main menu

      // AP1_TO_BT709_MAT
      r1.x = dot(float3(1.70507967, -0.624233425, -0.0808462128), r0.xyz);
      r1.y = dot(float3(-0.129700527, 1.1384685, -0.00876801647), r0.xyz);
      r1.z = dot(float3(-0.0241668653, -0.124614917, 1.14878178), r0.xyz);

      r2.xy = g_vHdrLutInfo.xy / g_vHdrLutInfo.yx;
      r3.xyzw = cmp(float4(0.5, 0.5, 0.5, 0.5) < r1.xyzx);
      r4.xyzw = float4(-0.5, -0.5, -0.5, -0.5) + r1.xyzx;
      r4.xyzw = float4(-0.137503549, -0.137503549, -0.137503549, -0.137503549) * r4.xyzw;
      r4.xyzw = exp2(r4.xyzw);
      r0.w = -1 + r2.x;
      r4.xyzw = -r4.xyzw * r0.wwww + r2.xxxx;
      r3.xyzw = r3.xyzw ? r4.xyzw : float4(1, 1, 1, 1);
      r1.xyzw = r1.xyzx / r3.wyzw;
      r1.xyzw = max(float4(0, 0, 0, 0), r1.xyzw);
      untonemapped = r1.rgb;

      // Unity Neutral Tonemap
      r2.xz = g_vNeutralTonemapperParams1.xy * g_vNeutralTonemapperParams0.ww;
      r0.w = g_vNeutralTonemapperParams0.z * g_vNeutralTonemapperParams0.y;
      r2.w = g_vNeutralTonemapperParams0.x * g_vNeutralTonemapperParams1.z + r0.w;
      r2.w = g_vNeutralTonemapperParams1.z * r2.w + r2.x;
      r4.x = g_vNeutralTonemapperParams0.x * g_vNeutralTonemapperParams1.z + g_vNeutralTonemapperParams0.y;
      r4.x = g_vNeutralTonemapperParams1.z * r4.x + r2.z;
      r2.w = r2.w / r4.x;
      r4.x = g_vNeutralTonemapperParams1.x / g_vNeutralTonemapperParams1.y;
      r2.w = -r4.x + r2.w;
      r2.w = 1 / r2.w;
      r1.xyzw = r2.wwww * r1.xyzw;
      r5.xyzw = g_vNeutralTonemapperParams0.xxxx * r1.wyzw + r0.wwww;
      r5.xyzw = r1.wyzw * r5.xyzw + r2.xxxx;
      r6.xyzw = g_vNeutralTonemapperParams0.xxxx * r1.wyzw + g_vNeutralTonemapperParams0.yyyy;
      r1.xyzw = r1.xyzw * r6.xyzw + r2.zzzz;
      r1.xyzw = r5.xyzw / r1.xyzw;
      r1.xyzw = r1.xyzw + -r4.xxxx;
      r0.w = r2.w / g_vNeutralTonemapperParams1.w;
      r1.xyzw = r1.xyzw * r0.wwww;
      r1.xyzw = r1.xyzw * r3.xyzw;
      r1.xyzw = r1.xyzw * r2.yyyy;
      // No code for instruction (needs manual fix):
      float3 gradedMenu = r1.rgb;

      if (RENODX_TONE_MAP_TYPE != 0.f) {
        untonemapped = renodx::color::bt709::from::AP1(untonemapped);
        gradedMenu = renodx::tonemap::renodrt::NeutralSDR(gradedMenu);
        r1.rgb = renodx::draw::ToneMapPass(untonemapped, gradedMenu);
      }

      g_uRwOutputLut[vThreadID] =
          r1.rgb;  // store_uav_typed u0.xyzw, vThreadID.xyzz, r1.xyzw
      break;
    case 3u:
      // AP1_TO_BT709_MAT
      r1.x = dot(float3(1.70507967, -0.624233425, -0.0808462128), r0.xyz);
      r1.y = dot(float3(-0.129700527, 1.1384685, -0.00876801647), r0.xyz);
      r1.z = dot(float3(-0.0241668653, -0.124614917, 1.14878178), r0.xyz);
      r2.xy = g_vHdrLutInfo.xy / g_vHdrLutInfo.yx;
      r3.xyzw = cmp(float4(0.5, 0.5, 0.5, 0.5) < r1.xyzx);
      r4.xyzw = float4(-0.5, -0.5, -0.5, -0.5) + r1.xyzx;
      r4.xyzw = float4(-0.137503549, -0.137503549, -0.137503549, -0.137503549) * r4.xyzw;
      r4.xyzw = exp2(r4.xyzw);
      r0.w = -1 + r2.x;
      r4.xyzw = -r4.xyzw * r0.wwww + r2.xxxx;
      r3.xyzw = r3.xyzw ? r4.xyzw : float4(1, 1, 1, 1);
      r1.xyzw = r1.xyzx / r3.wyzw;
      r2.xz = g_vNeutralTonemapperParams1.zz * float2(0.150000006, 0.150000006) + float2(0.0500000007, 0.5);
      r2.xz = g_vNeutralTonemapperParams1.zz * r2.xz + float2(0.00400000019, 0.0600000024);
      r0.w = r2.x / r2.z;
      r0.w = -0.0666666627 + r0.w;
      r0.w = 1 / r0.w;
      r1.xyzw = max(float4(0, 0, 0, 0), r1.xyzw);

      // Blur I think?
      r4.xyzw =
          r1.wyzw * float4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + float4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007);
      r4.xyzw = r1.wyzw * r4.xyzw + float4(0.00400000019, 0.00400000019, 0.00400000019, 0.00400000019);
      r5.xyzw =
          r1.wyzw * float4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + float4(0.5, 0.5, 0.5, 0.5);
      r1.xyzw = r1.xyzw * r5.xyzw + float4(0.0600000024, 0.0600000024, 0.0600000024, 0.0600000024);
      r1.xyzw = r4.xyzw / r1.xyzw;
      r1.xyzw =
          float4(-0.0666666627, -0.0666666627, -0.0666666627, -0.0666666627) + r1.xyzw;
      r1.xyzw = r1.xyzw * r0.wwww;
      r1.xyzw = r1.xyzw * r3.xyzw;
      r1.xyzw = r1.xyzw * r2.yyyy;
      // No code for instruction (needs manual fix):

      // if (RENODX_TONE_MAP_TYPE != 0.f) {
      //   gradedTest = renodx::tonemap::renodrt::NeutralSDR(gradedTest);
      //   r1.rgb = renodx::draw::ToneMapPass(untonemapped, gradedTest);
      // }

      g_uRwOutputLut[vThreadID] =
          r1.rgb;  // store_uav_typed u0.xyzw, vThreadID.xyzz, r1.xyzw
      break;
    case 4u:
      // Modifies game world

      // AP1_TO_AP0_MAT
      r1.y = dot(float3(0.695452213, 0.140678704, 0.163869068), r0.xyz);
      r2.y = dot(float3(0.0447945632, 0.859671116, 0.0955343172), r0.xyz);
      r3.y = dot(float3(-0.00552588282, 0.00402521016, 1.00150073), r0.xyz);
      r0.w = cmp(r1.y < r2.y);
      if (r0.w != 0) {
        r0.w = cmp(r2.y < r3.y);
        r3.z = r3.y + -r1.y;
        r1.w = cmp(0 < r3.z);
        r2.w = -r2.y + r1.y;
        r2.w = 60 * r2.w;
        r2.w = r2.w / r3.z;
        r2.w = 240 + r2.w;
        r3.x = r1.w ? r2.w : 0;
        r1.w = cmp(r1.y < r3.y);
        r4.z = r2.y + -r1.y;
        r2.w = cmp(0 < r4.z);
        r4.y = 60 * r3.z;
        r4.w = r4.y / r4.z;
        r4.w = 120 + r4.w;
        r4.x = r2.w ? r4.w : 0;
        r5.z = -r3.y + r2.y;
        r2.w = cmp(0 < r5.z);
        r4.y = r4.y / r5.z;
        r4.y = 120 + r4.y;
        r5.x = r2.w ? r4.y : 0;
        r2.xz = r1.ww ? r4.xz : r5.xz;
        r2.xzw = r0.www ? r3.yzx : r2.yzx;
      } else {
        r0.w = cmp(r1.y < r3.y);
        r3.z = r3.y + -r2.y;
        r1.w = cmp(0 < r3.z);
        r4.z = -r2.y + r1.y;
        r4.y = 60 * r4.z;
        r4.y = r4.y / r3.z;
        r4.y = 240 + r4.y;
        r3.x = r1.w ? r4.y : 0;
        r1.w = cmp(r2.y < r3.y);
        r4.y = cmp(0 < r4.z);
        r4.w = -r3.y + r2.y;
        r4.w = 60 * r4.w;
        r5.x = r4.w / r4.z;
        r4.x = r4.y ? r5.x : 0;
        r5.z = -r3.y + r1.y;
        r4.y = cmp(0 < r5.z);
        r4.w = r4.w / r5.z;
        r5.x = r4.y ? r4.w : 0;
        r1.xz = r1.ww ? r4.xz : r5.xz;
        r2.xzw = r0.www ? r3.yzx : r1.yzx;
      }
      r0.w = cmp(r2.w < 0);
      r1.x = cmp(360 < r2.w);
      r1.zw = float2(360, -360) + r2.ww;
      r1.x = r1.x ? r1.w : r2.w;
      r0.w = r0.w ? r1.z : r1.x;
      r1.x = cmp(r2.x == 0.000000);
      r1.z = r2.z / r2.x;
      r1.x = r1.x ? 0 : r1.z;
      r1.z = r3.y + -r2.y;
      r1.w = r2.y + -r1.y;
      r1.w = r2.y * r1.w;
      r1.z = r3.y * r1.z + r1.w;
      r1.w = -r3.y + r1.y;
      r1.z = r1.y * r1.w + r1.z;
      r1.z = sqrt(r1.z);
      r1.w = r2.y + r1.y;
      r1.w = r1.w + r3.y;
      r1.z = r1.w + r1.z;
      r1.z = 1.75 + r1.z;
      r1.w = 0.333333343 * r1.z;
      r2.x = -0.400000006 + r1.x;
      r2.z = 2.5 * r2.x;
      r2.z = 1 + -abs(r2.z);
      r2.z = max(0, r2.z);
      r2.x = cmp(r2.x >= 0);
      r2.x = r2.x ? 1 : -1;
      r2.z = -r2.z * r2.z + 1;
      r2.x = r2.x * r2.z + 1;
      r2.z = 0.0250000004 * r2.x;
      r2.w = cmp(0.159999996 >= r1.z);
      r2.x = r2.x * 0.0250000004 + 1;
      r1.z = cmp(r1.z >= 0.479999989);
      r1.w = 0.0799999982 / r1.w;
      r1.w = -0.5 + r1.w;
      r1.w = r2.z * r1.w + 1;
      r1.z = r1.z ? 1 : r1.w;
      r1.z = r2.w ? r2.x : r1.z;
      r3.z = r1.y;
      r3.w = r2.y;
      r2.yzw = r3.zwy * r1.zzz;
      r1.y = 1 * r0.w;
      r1.w = cmp(r0.w < -180);
      r3.x = cmp(180 < r0.w);
      r3.yw = r0.ww * float2(1, 1) + float2(360, -360);
      r0.w = r3.x ? r3.w : r1.y;
      r0.w = r1.w ? r3.y : r0.w;
      r0.w = 2.43902445 * r0.w;
      r0.w = 1 + -abs(r0.w);
      r0.w = max(0, r0.w);
      r1.y = r0.w * -2 + 3;
      r0.w = r0.w * r0.w;
      r0.w = r1.y * r0.w;
      r0.w = r0.w * r0.w;
      r0.w = r0.w * r1.x;
      r1.x = -r3.z * r1.z + 0.0299999993;
      r0.w = r1.x * r0.w;
      r2.x = r0.w * 0.180000007 + r2.y;
      r1.xyz = max(float3(0, 0, 0), r2.xzw);
      r1.xyz = min(float3(65504, 65504, 65504), r1.xyz);

      // AP0_TO_AP1_MAT
      r2.x = dot(float3(1.45143926, -0.236510754, -0.214928567), r1.xyz);
      r2.y = dot(float3(-0.0765537769, 1.17622972, -0.0996759236), r1.xyz);
      r2.z = dot(float3(0.00831614807, -0.00603244966, 0.997716308), r1.xyz);
      r1.xyz = max(float3(0, 0, 0), r2.xyz);
      r1.xyz = min(float3(65504, 65504, 65504), r1.xyz);
      r0.w = dot(r1.xyz, float3(0.272228986, 0.674081981, 0.0536894985));
      r1.xyz = r1.xyz + -r0.www;
      r1.xyz = r1.xyz * float3(0.959999979, 0.959999979, 0.959999979) + r0.www;
      r2.xy = g_vHdrLutInfo.xy / g_vHdrLutInfo.yx;
      r3.xyz = cmp(float3(0.5, 0.5, 0.5) < r1.xyz);
      r4.xyz = float3(-0.5, -0.5, -0.5) + r1.xyz;
      r4.xyz = float3(-0.137503549, -0.137503549, -0.137503549) * r4.xyz;
      r4.xyz = exp2(r4.xyz);
      r0.w = -1 + r2.x;
      r2.xzw = -r4.xyz * r0.www + r2.xxx;
      r2.xzw = r3.xyz ? r2.xzw : float3(1, 1, 1);
      r1.xyz = r1.xyz / r2.xzw;
      r3.xyz = r1.xyz * float3(30.9882221, 30.9882221, 30.9882221) + float3(1.19912136, 1.19912136, 1.19912136);
      r3.xyz = r3.xyz * r1.xyz;
      r4.xyz = r1.xyz * float3(32.667881, 32.667881, 32.667881) + float3(9.87056255, 9.87056255, 9.87056255);
      r1.xyz = r1.xyz * r4.xyz + float3(8.97784805, 8.97784805, 8.97784805);
      r1.xyz = r3.xyz / r1.xyz;
      r1.xyz = r1.xyz * r2.xzw;
      // AP1_TO_XYZ_MAT
      r0.w = dot(float3(0.662454188, 0.134004205, 0.156187683), r1.xyz);
      r1.w = dot(float3(0.272228718, 0.674081743, 0.0536895171), r1.xyz);
      r1.x = dot(float3(-0.00557464967, 0.0040607336, 1.01033914), r1.xyz);
      r1.y = r1.w + r0.w;
      r1.x = r1.y + r1.x;
      r1.xy = max(float2(1.00000001e-10, 0), r1.xw);
      r0.w = r0.w / r1.x;
      r1.x = r1.w / r1.x;
      r1.y = log2(r1.y);
      r1.y = 0.981100023 * r1.y;
      r3.y = exp2(r1.y);
      r1.y = max(1.00000001e-10, r1.x);
      r1.y = r3.y / r1.y;
      r3.x = r1.y * r0.w;
      r0.w = 1 + -r0.w;
      r0.w = r0.w + -r1.x;
      r3.z = r0.w * r1.y;
      r1.x = dot(float3(1.6410234, -0.324803293, -0.236424699), r3.xyz);
      r1.y = dot(float3(-0.663662851, 1.61533165, 0.0167563483), r3.xyz);
      r1.z = dot(float3(0.0117218941, -0.00828444213, 0.988394856), r3.xyz);
      r0.w = dot(r1.xyz, float3(0.272228986, 0.674081981, 0.0536894985));
      r1.xyz = r1.xyz + -r0.www;
      r1.xyz = r1.xyz * float3(0.930000007, 0.930000007, 0.930000007) + r0.www;
      // AP1_TO_XYZ_MAT
      r3.x = dot(float3(0.662454188, 0.134004205, 0.156187683), r1.xyz);
      r3.y = dot(float3(0.272228718, 0.674081743, 0.0536895171), r1.xyz);
      r3.z = dot(float3(-0.00557464967, 0.0040607336, 1.01033914), r1.xyz);

      // D60_TO_D65_MAT ?
      r4.x = dot(float3(0.988232493, -0.00788563583, 0.0167578701), r3.xyz);
      r4.y = dot(float3(-0.00569321448, 0.998692274, 0.00667246478), r3.xyz);
      r4.z = dot(float3(0.000352954201, 0.00112296687, 1.07808423), r3.xyz);
      r0.w = (int)g_vHdrLutInfo.w;
      switch (r0.w) {
        case 0:
          // XYZ_TO_BT709_MAT
          r1.x = dot(float3(3.2409699, -1.5373832, -0.498610765), r4.xyz);
          r1.y = dot(float3(-0.969243646, 1.8759675, 0.0415550582), r4.xyz);
          r1.z = dot(float3(0.0556300804, -0.203976959, 1.05697155), r4.xyz);
          break;
        case 1:
          // XYZ_TO_BT2020_MAT
          r1.x = dot(float3(1.7166512, -0.35567078, -0.253366292), r4.xyz);
          r1.y = dot(float3(-0.66668433, 1.61648118, 0.0157685466), r4.xyz);
          r1.z = dot(float3(0.0176398568, -0.042770613, 0.942103148), r4.xyz);
          break;
        case 2:
          r1.x = dot(float3(2.42140508, -0.872936487, -0.393461466), r4.xyz);
          r1.y = dot(float3(-0.831189752, 1.76404297, 0.0238428935), r4.xyz);
          r1.z = dot(float3(0.0305964444, -0.162594378, 1.04082072), r4.xyz);
          break;
        default:
          break;
      }
      r1.xyzw = r1.xyzx;
      r1.xyzw = r1.xyzw * r2.yyyy;
      float3 gradedGame = r1.rgb;
      gradedGame = RenoDRTSmoothClamp(gradedGame);

      // tonemap game
      if (RENODX_TONE_MAP_TYPE != 0.f) {
        r1.rgb = renodx::draw::ToneMapPass(untonemapped, gradedGame);
      }

      //  No code for instruction (needs manual fix):
      g_uRwOutputLut[vThreadID] =
          r1.rgb;  // store_uav_typed u0.xyzw, vThreadID.xyzz, r1.xyzw
      break;

    default:
      // No code for instruction (needs manual fix):
      g_uRwOutputLut[vThreadID] =
          r0.rgb;  // store_uav_typed u0.xyzw, vThreadID.xyzz, r0.xyzx
      break;
  }

  g_uRwOutputLut[vThreadID] = untonemapped;
  return;
}
