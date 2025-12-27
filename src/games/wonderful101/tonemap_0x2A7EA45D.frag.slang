#version 450
// import slang_spirv_intrinsics;

// Specialization constants
[[vk::constant_id(12)]] const uint _69 = 0u;
[[vk::constant_id(2)]]  const uint _76 = 0u;
[[vk::constant_id(1)]]  const uint _88 = 0u;
[[vk::constant_id(4)]]  const uint _96 = 0u;
[[vk::constant_id(5)]]  const uint _136 = 0u;

struct cbuffer_t { int4 i[16]; float4 f[224]; };
struct spec_state_t { uint dword0, dword1, dword2, dword3, dword4, dword5, dword6, dword7, dword8, dword9, dword10, dword11, dword12, dword13, dword14; };
struct render_state_t { float3 fog_color; float fog_scale; float fog_end; float fog_density; uint alpha_ref; float point_size; float point_size_min; float point_size_max; float point_scale_a; float point_scale_b; float point_scale_c; uint pad; uint s0_s1_idx, s2_s3_idx, s4_s5_idx, s6_s7_idx, s8_s9_idx, s10_s11_idx, s12_s13_idx, s14_s15_idx; };

// Bindings
[[vk::binding(3, 2)]] ConstantBuffer<cbuffer_t> c;
[[vk::binding(5, 2)]] ConstantBuffer<spec_state_t> spec_state;
[[vk::push_constant]] ConstantBuffer<render_state_t> render_state;

// Single heap definition to avoid overlap warnings
[[vk::binding(0, 0)]] SamplerState sampler_heap[];

[[vk::binding(0, 1)]] Texture2D t0_2d;
[[vk::binding(1, 1)]] Texture2D t1_2d;
[[vk::binding(2, 1)]] Texture2D t2_2d;
[[vk::binding(3, 1)]] Texture3D t3_3d;

uint bitfieldExtract(uint value, int offset, int bits) {
    return (value >> uint(offset)) & ((1u << uint(bits)) - 1u);
}

[shader("pixel")]
float4 main(float4 in_Texcoord0 : TEXCOORD0) : SV_Target
{
    float4 v = in_Texcoord0;
    float4 r0 = 0.0, r1 = 0.0, r2 = 0.0;

    // --- Texture 0 Logic ---
    if (bitfieldExtract((_69 != 0u) ? _88 : spec_state.dword1, 0, 1) != 0u) {
        uint sIdx = bitfieldExtract(render_state.s0_s1_idx, 0, 16);
        float compareVal = (bitfieldExtract((_69 != 0u) ? _136 : spec_state.dword5, 0, 1) != 0u) ? clamp(v.z, 0.0, 1.0) : v.z;
        
        // FIX: Reinterpret regular SamplerState as SamplerComparisonState for this call
        SamplerComparisonState scs = reinterpret<SamplerComparisonState>(sampler_heap[sIdx]);
        r0 = float4(t0_2d.SampleCmp(scs, v.xy, compareVal).xxx, 1.0);
        
    } else {
        uint sIdx = bitfieldExtract(render_state.s0_s1_idx, 0, 16);
        float4 texCol = t0_2d.Sample(sampler_heap[sIdx], v.xy);
        
        if (bitfieldExtract((_69 != 0u) ? _96 : spec_state.dword4, 0, 1) != 0u) {
            uint2 txSize; t0_2d.GetDimensions(txSize.x, txSize.y);
            texCol = t0_2d.Gather(sampler_heap[sIdx], v.xy + (0.99609375 / (float2(txSize) * 2.0))).zxyw;
        }
        r0 = (bitfieldExtract((_69 != 0u) ? _76 : spec_state.dword2, 0, 1) != 0u) ? float4(0,0,0,1) : texCol;
    }

    r0.w = 1.0 - r0.w;

    // --- Texture 1 Logic ---
    if (bitfieldExtract((_69 != 0u) ? _88 : spec_state.dword1, 1, 1) != 0u) {
        uint sIdx = bitfieldExtract(render_state.s0_s1_idx, 16, 16);
        float compareVal = (bitfieldExtract((_69 != 0u) ? _136 : spec_state.dword5, 1, 1) != 0u) ? clamp(v.z, 0.0, 1.0) : v.z;
        
        SamplerComparisonState scs = reinterpret<SamplerComparisonState>(sampler_heap[sIdx]);
        r1 = float4(t1_2d.SampleCmp(scs, v.xy, compareVal).xxx, 1.0);
    } else {
        uint sIdx = bitfieldExtract(render_state.s0_s1_idx, 16, 16);
        float4 texCol = t1_2d.Sample(sampler_heap[sIdx], v.xy);
        r1 = (bitfieldExtract((_69 != 0u) ? _76 : spec_state.dword2, 1, 1) != 0u) ? float4(0,0,0,1) : texCol;
    }

    // Blend logic remains the same
    r0.w = ((r1.w == 0.0) ? 0.0 : r0.w) * ((r0.w == 0.0) ? 0.0 : r1.w);
    float3 _253 = r1.xyz - r0.xyz;
    r2.xyz = (all(_253 == 0.0) ? 0.0 : r0.www) * (all(r0.www == 0.0) ? 0.0 : _253) + r0.xyz;

    return r2;
}