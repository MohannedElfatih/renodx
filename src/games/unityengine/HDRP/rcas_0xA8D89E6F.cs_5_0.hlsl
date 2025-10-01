#include "../common.hlsl"

struct u0_t {
  float val[4];
};
RWStructuredBuffer<u0_t> u0 : register(u0);
Texture2DArray<float4> t0 : register(t0);
RWTexture2DArray<float4> u1 : register(u1);

#define cmp -

[numthreads(64, 1, 1)]
void main(uint vThreadIDInGroup: SV_GroupThreadID, uint2 vThreadGroupID: SV_GroupID, uint3 vThreadID: SV_DispatchThreadID) {
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (uint)vThreadIDInGroup.x >> 3;
  bitmask.y = ((~(-1 << 1)) << 0) & 0xffffffff;  r0.y = (((uint)vThreadIDInGroup.x << 0) & bitmask.y) | ((uint)r0.x & ~bitmask.y);
  if (3 == 0) r0.x = 0; else if (3+1 < 32) {   r0.x = (uint)vThreadIDInGroup.x << (32-(3 + 1)); r0.x = (uint)r0.x >> (32-3);  } else r0.x = (uint)vThreadIDInGroup.x >> 1;
  r0.xy = mad((int2)vThreadGroupID.xy, int2(8,8), (int2)r0.xy);
  //r1.xyzw = (int4)r0.xyxy + int4(0,-1,-1,0);
  //r2.xy = r1.zw;
  r0.w = 0;
  r0.z = vThreadID.z;
  r3.w = t0.Load(r0.xyzw).w;
  /*r1.zw = r0.zw;
  r3.xyzw = t0.Load(r0.xyzw).xyzw;
  r2.zw = r1.zw;
  r1.xyz = t0.Load(r1.xyzw).xyz;
  r4.xyz = t0.Load(r2.xyzw).xyz;
  r5.xyzw = (int4)r0.xyxy + int4(0,1,1,0);
  r2.xy = r5.zw;
  r6.xyz = t0.Load(r2.xyzw).xyz;
  r5.zw = r2.zw;
  r2.xyz = t0.Load(r5.xyzw).xyz;
  r5.xyz = max(r6.xyz, r4.xyz);
  r5.xyz = max(r5.xyz, r1.xyz);
  r5.xyz = max(r5.xyz, r2.xyz);
  r7.xyz = max(r5.xyz, r3.xyz);
  r5.xyz = float3(4,4,4) * r5.xyz;
  r5.xyz = rcp(r5.xyz);
  r7.xyz = float3(1,1,1) + -r7.xyz;
  r8.xyz = min(r6.xyz, r4.xyz);
  r8.xyz = min(r8.xyz, r1.xyz);
  r8.xyz = min(r8.xyz, r2.xyz);
  r9.xyz = r8.xyz * float3(4,4,4) + float3(-4,-4,-4);
  r8.xyz = min(r8.xyz, r3.xyz);
  r5.xyz = r8.xyz * r5.xyz;
  r8.xyz = rcp(r9.xyz);
  r7.xyz = r8.xyz * r7.xyz;
  r5.xyz = max(r7.xyz, -r5.xyz);
  r0.w = max(r5.y, r5.z);
  r0.w = max(r5.x, r0.w);
  r0.w = min(0, r0.w);
  r0.w = max(-0.1875, r0.w);
  r1.w = u0[0].val[0/4];
  r0.w = r1.w * r0.w;
  r4.xyz = r0.www * r4.xyz;
  r1.xyz = r0.www * r1.xyz + r4.xyz;
  r1.xyz = r0.www * r2.xyz + r1.xyz;
  r1.xyz = r0.www * r6.xyz + r1.xyz;
  r0.w = r0.w * 4 + 1;
  r1.xyz = r1.xyz + r3.xyz;
  r1.w = (int)-r0.w + 0x7ef19fff;
  r0.w = -r1.w * r0.w + 2;
  r0.w = r1.w * r0.w;
  r3.xyz = r1.xyz * r0.www;*/
  r3.xyz = applySharpen(t0, int2(r0.xy), u0[0].val[0/4]);
  u1[r0.xyz] = r3;
  return;
}