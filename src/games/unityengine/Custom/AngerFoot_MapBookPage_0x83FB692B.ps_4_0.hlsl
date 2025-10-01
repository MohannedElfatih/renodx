
TextureCube<float4> t9 : register(t9);
Texture3D<float4> t8 : register(t8);
Texture2D<float4> t7 : register(t7);
Texture2D<float4> t6 : register(t6);
Texture2D<float4> t5 : register(t5);
Texture2D<float4> t4 : register(t4);
Texture2D<float4> t3 : register(t3);
Texture2D<float4> t2 : register(t2);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t0 : register(t0);
SamplerState s9_s : register(s9);
SamplerState s8_s : register(s8);
SamplerState s7_s : register(s7);
SamplerState s6_s : register(s6);
SamplerState s5_s : register(s5);
SamplerState s4_s : register(s4);
SamplerState s3_s : register(s3);
SamplerState s2_s : register(s2);
SamplerComparisonState s1_s : register(s1);
SamplerState s0_s : register(s0);
cbuffer cb6 : register(b6){
  float4 cb6[7];
}
cbuffer cb5 : register(b5){
  float4 cb5[2];
}
cbuffer cb4 : register(b4){
  float4 cb4[12];
}
cbuffer cb3 : register(b3){
  float4 cb3[26];
}
cbuffer cb2 : register(b2){
  float4 cb2[47];
}
cbuffer cb1 : register(b1){
  float4 cb1[6];
}
cbuffer cb0 : register(b0){
  float4 cb0[20];
}

#define cmp -

void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float w1 : TEXCOORD7,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : TEXCOORD4,
  float4 v6 : TEXCOORD5,
  float4 v7 : TEXCOORD6,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = cb0[3].xyz * v5.yyy;
  r0.xyz = cb0[2].xyz * v5.xxx + r0.xyz;
  r0.xyz = cb0[4].xyz * v5.zzz + r0.xyz;
  r0.xyz = cb0[5].xyz + r0.xyz;
  r1.xyz = cb1[4].xyz + -v5.xyz;
  r2.x = cb4[9].z;
  r2.y = cb4[10].z;
  r2.z = cb4[11].z;
  r0.w = dot(r1.xyz, r2.xyz);
  r2.xyz = -cb3[25].xyz + v5.xyz;
  r1.w = dot(r2.xyz, r2.xyz);
  r1.w = sqrt(r1.w);
  r1.w = r1.w + -r0.w;
  r0.w = cb3[25].w * r1.w + r0.w;
  r0.w = saturate(r0.w * cb3[24].z + cb3[24].w);
  r1.w = cmp(cb6[0].x == 1.000000);
  if (r1.w != 0) {
    r1.w = cmp(cb6[0].y == 1.000000);
    r2.xyz = cb6[2].xyz * v5.yyy;
    r2.xyz = cb6[1].xyz * v5.xxx + r2.xyz;
    r2.xyz = cb6[3].xyz * v5.zzz + r2.xyz;
    r2.xyz = cb6[4].xyz + r2.xyz;
    r2.xyz = r1.www ? r2.xyz : v5.xyz;
    r2.xyz = -cb6[6].xyz + r2.xyz;
    r2.yzw = cb6[5].xyz * r2.xyz;
    r1.w = r2.y * 0.25 + 0.75;
    r2.y = cb6[0].z * 0.5 + 0.75;
    r2.x = max(r2.y, r1.w);
    r2.xyzw = t8.Sample(s0_s, r2.xzw).xyzw;
  } else {
    r2.xyzw = float4(1,1,1,1);
  }
  r1.w = saturate(dot(r2.xyzw, cb2[46].xyzw));
  r2.x = cmp(r0.w < 0.99000001);
  if (r2.x != 0) {
    r2.xyz = -cb2[1].xyz + v5.xyz;
    r2.w = max(abs(r2.x), abs(r2.y));
    r2.w = max(r2.w, abs(r2.z));
    r2.w = -cb2[2].z + r2.w;
    r2.w = max(9.99999975e-06, r2.w);
    r2.w = cb2[2].w * r2.w;
    r2.w = cb2[2].y / r2.w;
    r2.w = -cb2[2].x + r2.w;
    r2.w = 1 + -r2.w;
    r3.xyz = float3(0.0078125,0.0078125,0.0078125) + r2.xyz;
    r3.x = t9.SampleCmpLevelZero(s1_s, r3.xyz, r2.w).x;
    r4.xyz = float3(-0.0078125,-0.0078125,0.0078125) + r2.xyz;
    r3.y = t9.SampleCmpLevelZero(s1_s, r4.xyz, r2.w).x;
    r4.xyz = float3(-0.0078125,0.0078125,-0.0078125) + r2.xyz;
    r3.z = t9.SampleCmpLevelZero(s1_s, r4.xyz, r2.w).x;
    r2.xyz = float3(0.0078125,-0.0078125,-0.0078125) + r2.xyz;
    r3.w = t9.SampleCmpLevelZero(s1_s, r2.xyz, r2.w).x;
    r2.x = dot(r3.xyzw, float4(0.25,0.25,0.25,0.25));
    r2.y = 1 + -cb3[24].x;
    r2.x = r2.x * r2.y + cb3[24].x;
  } else {
    r2.x = 1;
  }
  r1.w = -r2.x + r1.w;
  r0.w = r0.w * r1.w + r2.x;
  r0.x = dot(r0.xyz, r0.xyz);
  r2.xyzw = t0.Sample(s2_s, r0.xx).xyzw;
  r0.x = r2.x * r0.w;
  r0.xyz = cb0[6].xyz * r0.xxx;
  r2.xyz = float3(9.99999997e-07,9.99999997e-07,9.99999997e-07) + cb0[6].xyz;
  r0.xyz = r0.xyz / r2.xyz;
  r0.x = max(r0.x, r0.y);
  r0.x = max(r0.x, r0.z);
  r0.yz = v1.xy * cb0[8].xy + cb0[8].zw;
  r2.xy = float2(-0.5,-0.5) + v1.xy;
  r0.w = log2(abs(r2.x));
  r0.w = 0.239999995 * r0.w;
  r0.w = exp2(r0.w);
  r1.w = dot(r1.xyz, r1.xyz);
  r1.w = max(0.00100000005, r1.w);
  r1.w = rsqrt(r1.w);
  r1.xyz = r1.xyz * r1.www;
  r2.zw = v1.xy * cb0[9].xy + cb0[9].zw;
  r3.xyzw = t1.Sample(s5_s, r2.zw).xyzw;
  r3.x = r3.x * r3.w;
  r2.zw = r3.xy * float2(2,2) + float2(-1,-1);
  r3.xy = cb0[10].xx * r2.zw;
  r1.w = dot(r3.xy, r3.xy);
  r1.w = min(1, r1.w);
  r1.w = 1 + -r1.w;
  r3.z = sqrt(r1.w);
  r1.w = 1 + -r0.x;
  r1.w = log2(r1.w);
  r1.w = 6.5 * r1.w;
  r1.w = exp2(r1.w);
  r1.w = 1 + -r1.w;
  r1.w = saturate(2.5 * r1.w);
  r1.w = 3 * r1.w;
  r2.z = floor(r1.w);
  r1.w = frac(r1.w);
  r1.w = 0.333333343 * r1.w;
  r1.w = log2(r1.w);
  r1.w = 0.75 * r1.w;
  r1.w = exp2(r1.w);
  r1.w = 0.699999988 * r1.w;
  r1.w = r2.z * 0.333333343 + r1.w;
  r1.w = min(1, r1.w);
  r1.w = r1.w + -r0.x;
  r0.x = cb2[0].w * r1.w + r0.x;
  r4.x = dot(v2.xyz, r3.xyz);
  r4.y = dot(v3.xyz, r3.xyz);
  r4.z = dot(v4.xyz, r3.xyz);
  r1.w = dot(r4.xyz, r4.xyz);
  r1.w = rsqrt(r1.w);
  r3.xyz = r4.xyz * r1.www;
  r1.w = dot(-r1.xyz, r3.xyz);
  r1.w = r1.w + r1.w;
  r2.zw = r3.xy * -r1.ww + -r1.xy;
  r5.xyzw = t2.Sample(s4_s, r2.zw).xyzw;
  r5.xyz = cb0[10].yyy * r5.xyz;
  r6.xyz = cb0[6].xyz * cb0[6].www;
  r5.xyz = r6.xyz * r5.xyz;
  r2.zw = v1.xy * cb0[12].xy + cb0[12].zw;
  r6.xy = v1.xy * cb0[13].xy + cb0[13].zw;
  r6.zw = v1.xy * cb0[14].xy + cb0[14].zw;
  r7.xyzw = t3.Sample(s8_s, r6.zw).xyzw;
  r6.xyzw = t4.Sample(s7_s, r6.xy).xyzw;
  r7.xyz = r7.xyz + -r6.xyz;
  r6.xyz = r7.www * r7.xyz + r6.xyz;
  r7.xy = v1.xy * cb0[15].xy + cb0[15].zw;
  r8.xyzw = cb0[16].xyzw + r7.xyxy;
  r9.xyzw = t5.Sample(s9_s, r8.xy).xyzw;
  r9.x = r9.x * r6.x;
  r8.xyzw = t5.Sample(s9_s, r8.zw).xyzw;
  r9.y = r8.y * r6.y;
  r7.xy = cb0[17].xy + r7.xy;
  r7.xyzw = t5.Sample(s9_s, r7.xy).xyzw;
  r9.z = r7.z * r6.z;
  r7.xy = -cb0[18].yz + v1.xy;
  r1.w = dot(r7.xy, r7.xy);
  r1.w = sqrt(r1.w);
  r3.w = cb0[18].x + -cb0[17].w;
  r1.w = -cb0[17].w + r1.w;
  r3.w = 1 / r3.w;
  r1.w = saturate(r3.w * r1.w);
  r3.w = r1.w * -2 + 3;
  r1.w = r1.w * r1.w;
  r1.w = r3.w * r1.w;
  r7.xyz = r9.xyz * cb0[17].zzz + -r6.xyz;
  r6.xyz = r1.www * r7.xyz + r6.xyz;
  r1.w = cmp(cb0[18].w >= abs(r2.x));
  r1.w = r1.w ? 1.000000 : 0;
  r2.x = max(abs(r2.x), abs(r2.y));
  r2.x = cmp(0.49000001 >= r2.x);
  r2.x = r2.x ? -1 : -0;
  r1.w = r2.x + r1.w;
  r1.w = 1 + r1.w;
  r7.xyz = r1.www + -r6.xyz;
  r6.xyz = r1.www * r7.xyz + r6.xyz;
  r7.xyz = cb2[0].xyz + -v5.xyz;
  r1.w = dot(r7.xyz, r7.xyz);
  r1.w = max(0.00100000005, r1.w);
  r1.w = rsqrt(r1.w);
  r7.xyz = r7.xyz * r1.www;
  r1.w = dot(r4.xyz, r7.xyz);
  r2.x = r1.w * 0.5 + -0.225000024;
  r2.x = saturate(20.0000191 * r2.x);
  r2.y = r2.x * -2 + 3;
  r2.x = r2.x * r2.x;
  r2.x = r2.y * r2.x;
  r2.y = dot(-r7.xyz, r3.xyz);
  r2.y = r2.y + r2.y;
  r3.xyz = r3.xyz * -r2.yyy + -r7.xyz;
  r1.x = dot(r3.xyz, r1.xyz);
  r1.y = 1 + -cb0[19].x;
  r1.z = 1 + cb0[19].x;
  r1.x = max(0, r1.x);
  r1.xz = r1.xz + -r1.yy;
  r1.y = 1 / r1.z;
  r1.x = saturate(r1.x * r1.y);
  r1.y = r1.x * -2 + 3;
  r1.x = r1.x * r1.x;
  r1.x = r1.y * r1.x;
  r3.xyz = cb0[6].xyz * r0.xxx;
  r1.x = log2(r1.x);
  r1.x = cb0[19].y * r1.x;
  r1.x = exp2(r1.x);
  r1.xyz = r3.xyz * r1.xxx;
  r1.xyz = cb0[6].www * r1.xyz;
  r3.xyzw = t6.Sample(s6_s, r2.zw).xyzw;
  r2.yzw = cb0[11].xyz * r3.xxx;
  r2.yzw = r2.yzw * cb0[11].www + r6.xyz;
  r3.xyz = float3(1,1,1) + cb0[6].xyz;
  r3.w = saturate(cb0[6].w);
  r3.xyz = r3.xyz * r3.www;
  r3.xyz = r3.xyz * r0.xxx;
  r3.xyz = r3.xyz * r2.xxx;
  r1.w = saturate(r1.w);
  r3.xyz = r3.xyz * r1.www;
  r3.xyz = max(float3(0,0,0), r3.xyz);
  r1.xyz = r2.yzw * r3.xyz + r1.xyz;
  r1.xyz = r5.xyz * r0.xxx + r1.xyz;
  r1.xyz = r1.xyz * r0.www;
  r0.xyzw = t7.Sample(s3_s, r0.yz).xyzw;
  r0.x = 1 + -r0.x;
  r0.x = -cb0[19].z + r0.x;
  r0.x = cmp(r0.x < 0);
  if (r0.x != 0) discard;
  r0.x = w1.x / cb1[5].y;
  r0.x = 1 + -r0.x;
  r0.x = cb1[5].z * r0.x;
  r0.x = max(0, r0.x);
  r0.x = cb5[1].x * r0.x;
  r0.x = -r0.x * r0.x;
  r0.x = exp2(r0.x);
  o0.xyz = r0.xxx * r1.xyz;
  o0.w = 1;
  o0.xyz = max(0.f, o0.xyz);
  return;
}