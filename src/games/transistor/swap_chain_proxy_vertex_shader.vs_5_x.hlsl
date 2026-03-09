void main(uint id: SV_VERTEXID, out float4 pos: SV_POSITION,
          out float2 uv: TEXCOORD0) {
  float2 tc;
  tc.x = (id == 1) ? 2.0 : 0.0;
  tc.y = (id == 2) ? 2.0 : 0.0;
  pos = float4(tc * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
  uv = float2(tc.x, 1.0 - tc.y);
}
