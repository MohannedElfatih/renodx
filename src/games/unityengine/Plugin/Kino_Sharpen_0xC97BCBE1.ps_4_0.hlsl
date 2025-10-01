#include "../shared.h"

Texture2DArray<float4> t0 : register(t0);
cbuffer cb1 : register(b1){
  float4 cb1[47];
}
cbuffer cb0 : register(b0){
  float4 cb0[1];
}

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.zw = float2(0,0);
  r1.xyzw = cb1[46].xyxy * v1.xyxy;
  r1.xyzw = (int4)r1.xyzw;
  r2.xyzw = (int4)r1.zwzw + int4(-1,-1,0,-1);
  r2.xyzw = max(int4(0,0,0,0), (int4)r2.xyzw);
  r2.xyzw = (int4)r2.xyzw;
  r3.xyzw = float4(-1,-1,-1,-1) + cb1[46].xyxy;
  r2.xyzw = min(r3.xyzw, r2.xyzw);
  r2.xyzw = (int4)r2.zwxy;
  r0.xy = r2.zw;
  r0.xyzw = t0.Load(r0.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r0 = max(0, r0);
  }
  r2.zw = float2(0,0);
  r2.xyzw = t0.Load(r2.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r2 = max(0, r2);
  }
  r0.xyzw = r2.xyzw + r0.xyzw;
  r2.zw = float2(0,0);
  r4.xyzw = (int4)r1.zwzw + int4(1,-1,-1,0);
  r4.xyzw = max(int4(0,0,0,0), (int4)r4.xyzw);
  r4.xyzw = (int4)r4.xyzw;
  r4.xyzw = min(r4.xyzw, r3.xyzw);
  r4.xyzw = (int4)r4.zwxy;
  r2.xy = r4.zw;
  r2.xyzw = t0.Load(r2.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r2 = max(0, r2);
  }
  r0.xyzw = r2.xyzw + r0.xyzw;
  r4.zw = float2(0,0);
  r2.xyzw = t0.Load(r4.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r2 = max(0, r2);
  }
  r0.xyzw = r2.xyzw + r0.xyzw;
  r2.xy = max(int2(0,0), (int2)r1.zw);
  r2.xy = (int2)r2.xy;
  r2.xy = min(r2.xy, r3.xy);
  r2.xy = (int2)r2.xy;
  r2.zw = float2(0,0);
  r2.xyzw = t0.Load(r2.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r2 = max(0, r2);
  }
  r0.xyzw = -r2.xyzw * float4(8,8,8,8) + r0.xyzw;
  r4.xyzw = (int4)r1.zwzw + int4(1,0,-1,1);
  r1.xyzw = (int4)r1.xyzw + int4(0,1,1,1);
  r1.xyzw = max(int4(0,0,0,0), (int4)r1.xyzw);
  r1.xyzw = (int4)r1.xyzw;
  r1.xyzw = min(r1.xyzw, r3.xyzw);
  r1.xyzw = (int4)r1.zwxy;
  r4.xyzw = max(int4(0,0,0,0), (int4)r4.xyzw);
  r4.xyzw = (int4)r4.xyzw;
  r3.xyzw = min(r4.xyzw, r3.xyzw);
  r3.xyzw = (int4)r3.zwxy;
  r4.xy = r3.zw;
  r4.zw = float2(0,0);
  r4.xyzw = t0.Load(r4.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r4 = max(0, r4);
  }
  r0.xyzw = r4.xyzw + r0.xyzw;
  r3.zw = float2(0,0);
  r3.xyzw = t0.Load(r3.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r3 = max(0, r3);
  }
  r0.xyzw = r3.xyzw + r0.xyzw;
  r3.xy = r1.zw;
  r3.zw = float2(0,0);
  r3.xyzw = t0.Load(r3.xyzw).xyzw;
  if(injectedData.FSRcheck != 0.f){
  r3 = max(0, r3);
  }
  r0.xyzw = r3.xyzw + r0.xyzw;
  r1.zw = float2(0,0);
  r1.xyzw = t0.Load(r1.xyzw).xyzw;
  r0.xyzw = r1.xyzw + r0.xyzw;
  o0.xyzw = -r0.xyzw * cb0[0].xxxx + r2.xyzw;
  o0.xyzw = r1.xyzw;
  return;
}