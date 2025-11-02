#include "../common.hlsl"

Texture2D<float4> t0 : register(t0);
SamplerState s0_s : register(s0);
cbuffer cb0 : register(b0){
  float4 cb0[30];
}
#define cmp -

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = (uint4)cb0[28].zwzw;
  r0.xyzw = (uint4)r0.xyzw;
  r1.xyzw = v1.xyxy * r0.xyzw + float4(0.5,0.5,-1.5,-1.5);
  r0.xy = ceil(r1.zw);
  r1.xy = r0.xy + -r1.xy;
  r2.xyzw = float4(0,1,2,3) + r1.xxxx;
  r3.xyzw = cmp(float4(2,2,2,2) < abs(r2.xyzw));
  r4.xyzw = cmp(float4(1,1,1,1) < abs(r2.xyzw));
  r5.xyzw = float4(2,2,2,2) + -abs(r2.xyzw);
  r6.xyzw = r5.xyzw * r5.xyzw;
  r6.xyzw = r6.xyzw * float4(0.875,0.875,0.875,0.875) + float4(0.125,0.125,0.125,0.125);
  r5.xyzw = r6.xyzw * r5.xyzw;
  r2.xyzw = float4(1,1,1,1) + -abs(r2.xyzw);
  r6.xyzw = r2.xyzw * float4(-2.625,-2.625,-2.625,-2.625) + float4(2.625,2.625,2.625,2.625);
  r6.xyzw = r6.xyzw * r2.xyzw + float4(2.25,2.25,2.25,2.25);
  r2.xyzw = r6.xyzw * r2.xyzw + float4(1,1,1,1);
  r2.xyzw = r4.xyzw ? r5.xyzw : r2.xyzw;
  r2.xyzw = float4(0.190476194,0.190476194,0.190476194,0.190476194) * r2.xyzw;
  r2.xyzw = r3.xyzw ? float4(0,0,0,0) : r2.xyzw;
  r1.xyzw = float4(0,1,2,3) + r1.yyyy;
  r3.xyzw = cmp(float4(2,2,2,2) < abs(r1.xyzw));
  r4.xyzw = cmp(float4(1,1,1,1) < abs(r1.xyzw));
  r5.xyzw = float4(2,2,2,2) + -abs(r1.xyzw);
  r6.xyzw = r5.xyzw * r5.xyzw;
  r6.xyzw = r6.xyzw * float4(0.875,0.875,0.875,0.875) + float4(0.125,0.125,0.125,0.125);
  r5.xyzw = r6.xyzw * r5.xyzw;
  r1.xyzw = float4(1,1,1,1) + -abs(r1.xyzw);
  r6.xyzw = r1.xyzw * float4(-2.625,-2.625,-2.625,-2.625) + float4(2.625,2.625,2.625,2.625);
  r6.xyzw = r6.xyzw * r1.xyzw + float4(2.25,2.25,2.25,2.25);
  r1.xyzw = r6.xyzw * r1.xyzw + float4(1,1,1,1);
  r1.xyzw = r4.xyzw ? r5.xyzw : r1.xyzw;
  r1.xyzw = float4(0.190476194,0.190476194,0.190476194,0.190476194) * r1.xyzw;
  r1.xyzw = r3.xyzw ? float4(0,0,0,0) : r1.xyzw;
  r3.xy = r2.xz + r2.yw;
  r3.xz = r2.yw / r3.xy;
  r4.xy = r1.xz + r1.yw;
  r4.xz = r1.yw / r4.xy;
  r3.xz = r3.xz + r0.xx;
  r3.xz = float2(-0.5,1.5) + r3.xz;
  r5.xy = r3.xz / r0.zz;
  r0.xy = r4.xz + r0.yy;
  r0.xy = float2(-0.5,1.5) + r0.xy;
  r5.zw = r0.xy / r0.ww;
  r0.xyzw = t0.Sample(s0_s, r5.xz).xyzw;
  r0.xyzw = r0.xyzw * float4(2,2,2,2) + float4(-0.5,-0.5,-0.5,-0.5);
  r6.xyzw = t0.Sample(s0_s, r5.yz).xyzw;
  r6.xyzw = r6.xyzw * float4(2,2,2,2) + float4(-0.5,-0.5,-0.5,-0.5);
  r7.xyzw = t0.Sample(s0_s, r5.xw).xyzw;
  r7.xyzw = r7.xyzw * float4(2,2,2,2) + float4(-0.5,-0.5,-0.5,-0.5);
  r5.xyzw = t0.Sample(s0_s, r5.yw).xyzw;
  r5.xyzw = r5.xyzw * float4(2,2,2,2) + float4(-0.5,-0.5,-0.5,-0.5);
  r2.x = dot(r2.xyzw, float4(1,1,1,1));
  r2.x = r3.y / r2.x;
  r1.x = dot(r1.xyzw, float4(1,1,1,1));
  r1.x = r4.y / r1.x;
  r3.xyzw = r6.xyzw + -r0.xyzw;
  r0.xyzw = r2.xxxx * r3.xyzw + r0.xyzw;
  r3.xyzw = r5.xyzw + -r7.xyzw;
  r2.xyzw = r2.xxxx * r3.xyzw + r7.xyzw;
  r2.xyzw = r2.xyzw + -r0.xyzw;
  r0.xyzw = r1.xxxx * r2.xyzw + r0.xyzw;
  if (cb0[29].y == 0) {
    if (injectedData.countOld == injectedData.countNew) {
      o0.xyz = PostToneMapScale(r0.xyz, true);
    } else {
      o0.xyz = renodx::color::srgb::EncodeSafe(r0.xyz);
    }
    o0.w = r0.w;
    return;
  } else {
    o0.xyzw = r0.xyzw;
    return;
  }
  return;
}