TextureCube<float4> t6 : register(t6);
Texture2D<float4> t5 : register(t5);
Texture2D<float4> t4 : register(t4);
Texture2D<float4> t3 : register(t3);
Texture2D<float4> t2 : register(t2);
Texture2D<float4> t1 : register(t1);
Texture2D<float4> t0 : register(t0);
SamplerState s6_s : register(s6);
SamplerState s5_s : register(s5);
SamplerState s4_s : register(s4);
SamplerState s3_s : register(s3);
SamplerState s2_s : register(s2);
SamplerState s1_s : register(s1);
SamplerState s0_s : register(s0);
cbuffer cb7 : register(b7){
  float4 cb7[14];
}
cbuffer cb6 : register(b6){
  float4 cb6[16];
}
cbuffer cb5 : register(b5){
  float4 cb5[1];
}
cbuffer cb4 : register(b4){
  float4 cb4[4];
}
cbuffer cb3 : register(b3){
  float4 cb3[21];
}
cbuffer cb2 : register(b2){
  float4 cb2[1];
}
cbuffer cb1 : register(b1){
  float4 cb1[6];
}
cbuffer cb0 : register(b0){
  float4 cb0[17];
}

void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  float4 v5 : COLOR0,
  float4 v6 : TEXCOORD4,
  float4 v7 : TEXCOORD6,
  nointerpolation uint v8 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v8.x + asint(cb5[0].x);
  r1.x = v2.w;
  r1.y = v3.w;
  r1.z = v4.w;
  r0.yzw = cb1[4].xyz + -r1.xyz;
  r1.w = dot(r0.yzw, r0.yzw);
  r1.w = rsqrt(r1.w);
  r0.yzw = r1.www * r0.yzw;
  r1.w = (int)r0.x * 7;
  r2.x = cb0[2].w == 0.0 ? 0 : cb7[r1.w+6].w;
  r2.yz = cb0[4].ww * r1.xz;
  r3.xyzw = t0.Sample(s1_s, r2.yz).xyzw;
  r2.yz = cb0[5].xx * r1.xz;
  r4.xyzw = t1.Sample(s2_s, r2.yz).xyzw;
  r2.y = saturate(dot(r3.xx, r4.xx));
  r2.z = v5.y * 2 + -cb0[5].y;
  r2.y = saturate(r2.y + -r2.z);
  r2.z = cb0[4].z + -cb0[4].y;
  r2.w = -cb0[4].y + r2.y;
  r2.z = 1 / r2.z;
  r2.z = saturate(r2.w * r2.z);
  r2.w = r2.z * -2 + 3;
  r2.z = r2.z * r2.z;
  r2.z = r2.w * r2.z;
  r2.z = r2.z * r2.z;
  r2.w = cb0[4].x * r2.z;
  r3.x = dot(cb2[0].xyz, cb2[0].xyz);
  r3.x = rsqrt(r3.x);
  r3.xyz = cb2[0].xyz * r3.xxx;
  r4.x = v2.z;
  r4.y = v3.z;
  r4.z = v4.z;
  r3.x = dot(r4.xyz, r3.xyz);
  r3.x = saturate(r3.x * 0.5 + 0.5);
  r3.xyzw = t2.Sample(s3_s, r3.xx).xyzw;
  r3.xyz = cb0[2].xyz * r3.xyz;
  r3.xyz = r3.xyz * r2.xxx;
  r3.xyz = cb0[5].zzz * -r3.xyz + r3.xyz;
  r2.x = dot(r4.xyz, r4.xyz);
  r2.x = rsqrt(r2.x);
  r4.xyz = r4.xyz * r2.xxx;
  r4.w = 1;
  r5.x = dot(cb7[r1.w+0].xyzw, r4.xyzw);
  r5.y = dot(cb7[r1.w+1].xyzw, r4.xyzw);
  r5.z = dot(cb7[r1.w+2].xyzw, r4.xyzw);
  r5.xyz = v6.xyz + r5.xyz;
  r5.xyz = max(float3(0,0,0), r5.xyz);
  r5.xyz = r4.xyz * float3(9.99999975e-05,9.99999975e-05,9.99999975e-05) + r5.xyz;
  r5.xyz = cb0[5].www * r5.xyz;
  r5.xyz = cb0[5].zzz * -r5.xyz + r5.xyz;
  r3.xyz = r5.xyz + r3.xyz;
  r5.xy = v1.xy * cb0[8].xy + cb0[8].zw;
  r5.xyzw = t3.Sample(s4_s, r5.xy).xyzw;
  r0.x = (uint)r0.x << 3;
  r6.xyz = cb6[r0.x+5].xyz * v3.www;
  r6.xyz = cb6[r0.x+4].xyz * v2.www + r6.xyz;
  r6.xyz = cb6[r0.x+6].xyz * v4.www + r6.xyz;
  r6.xyz = cb6[r0.x+7].xyz + r6.xyz;
  r7.xyz = cb0[7].xyz * r5.xyz;
  r5.xyz = -cb0[7].xyz * r5.xyz + float3(0.0455606803,0.0564138107,0.0651107132);
  r5.xyz = cb0[5].zzz * r5.xyz + r7.xyz;
  r5.xyz = -cb0[6].xyz + r5.xyz;
  r5.xyz = cb0[10].www * r5.xyz + cb0[6].xyz;
  r7.xy = v1.xy * cb0[12].xy + cb0[12].zw;
  r7.xyzw = t4.Sample(s5_s, r7.xy).xyzw;
  r7.x = r7.x * r7.w;
  r7.xy = r7.xy * float2(2,2) + float2(-1,-1);
  r8.xy = cb0[13].xx * r7.xy;
  r1.w = dot(r8.xy, r8.xy);
  r1.w = min(1, r1.w);
  r1.w = 1 + -r1.w;
  r8.z = sqrt(r1.w);
  r9.x = dot(v2.xyz, r8.xyz);
  r9.y = dot(v3.xyz, r8.xyz);
  r9.z = dot(v4.xyz, r8.xyz);
  r1.w = dot(r9.xyz, r9.xyz);
  r1.w = rsqrt(r1.w);
  r8.xyz = r9.xyz * r1.www;
  r1.w = 1 + -cb0[13].y;
  r2.x = dot(-r0.yzw, r8.xyz);
  r2.x = r2.x + r2.x;
  r8.xyz = r8.xyz * -r2.xxx + -r0.yzw;
  if (cb4[2].w > 0) {
    r2.x = dot(r8.xyz, r8.xyz);
    r2.x = rsqrt(r2.x);
    r9.xyz = r8.xyz * r2.xxx;
    r10.xyz = cb4[0].xyz + -r1.xyz;
    r10.xyz = r10.xyz / r9.xyz;
    r11.xyz = cb4[1].xyz + -r1.xyz;
    r11.xyz = r11.xyz / r9.xyz;
    r10.xyz = (r9.xyz > (0.0).xxx) ? r10.xyz : r11.xyz;
    r2.x = min(r10.x, r10.y);
    r2.x = min(r2.x, r10.z);
    r1.xyz = -cb4[2].xyz + r1.xyz;
    r8.xyz = r9.xyz * r2.xxx + r1.xyz;
  }
  r1.x = -r1.w * 0.7 + 1.7;
  r1.x = r1.w * r1.x;
  r1.x = 6 * r1.x;
  r1.xyzw = t6.SampleLevel(s0_s, r8.xyz, r1.x).xyzw;
  r1.w = -1 + r1.w;
  r1.w = cb4[3].w * r1.w + 1;
  r1.w = log2(r1.w);
  r1.w = cb4[3].y * r1.w;
  r1.w = exp2(r1.w);
  r1.w = cb4[3].x * r1.w;
  r1.xyz = r1.www * r1.xyz;
  r1.xyz = cb0[13].zzz * r1.xyz;
  r8.xyz = cb0[14].xyz * r1.xyz;
  r9.xyzw = cb6[r0.x+1].xyzw * r6.yyyy;
  r9.xyzw = cb6[r0.x+0].xyzw * r6.xxxx + r9.xyzw;
  r6.xyzw = cb6[r0.x+2].xyzw * r6.zzzz + r9.xyzw;
  r6.xyzw = cb6[r0.x+3].xyzw + r6.xyzw;
  r9.xyz = cb3[18].xyw * r6.yyy;
  r9.xyz = cb3[17].xyw * r6.xxx + r9.xyz;
  r6.xyz = cb3[19].xyw * r6.zzz + r9.xyz;
  r6.xyz = cb3[20].xyw * r6.www + r6.xyz;
  r9.xz = float2(0.5,0.5) * r6.xz;
  r0.x = cb1[5].x * r6.y;
  r9.w = 0.5 * r0.x;
  r6.xy = r9.xw + r9.zz;
  r6.xy = r6.xy / r6.zz;
  r6.zw = r7.xy * cb0[13].xx + float2(-0.5,-0.5);
  r6.zw = cb0[15].xx * r6.zw;
  r6.xy = r6.zw * float2(2,2) + r6.xy;
  r6.xyzw = t5.Sample(s6_s, r6.xy).xyzw;
  r6.w = saturate(r6.w);
  r1.xyz = -r1.xyz * cb0[14].xyz + r6.xyz;
  r1.xyz = r6.www * r1.xyz + r8.xyz;
  r0.x = dot(r4.xyz, r0.yzw);
  r0.x = 1 + -r0.x;
  r0.x = log2(r0.x);
  r0.x = cb0[15].z * r0.x;
  r0.x = exp2(r0.x);
  r0.x = saturate(cb0[15].y * r0.x);
  r0.y = cb0[16].x + -cb0[15].w;
  r0.z = -cb0[15].w + r2.y;
  r0.y = 1 / r0.y;
  r0.y = saturate(r0.z * r0.y);
  r0.z = r0.y * -2 + 3;
  r0.y = r0.y * r0.y;
  r0.y = r0.z * r0.y;
  r0.x = r0.x * r0.y;
  r0.yzw = cb0[11].xyz * r1.xyz + -r5.xyz;
  r0.xyz = r0.xxx * r0.yzw + r5.xyz;
  o0.xyz = r3.xyz * r0.xyz;
  r0.x = r2.z * cb0[4].x + -cb0[16].y;
  if (r0.x < 0) discard;
  o0.w = r2.w;
  return;
}