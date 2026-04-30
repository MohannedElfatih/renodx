// XeGTAO PrefilterDepths — BG3 port
// Reads D24_UNORM_S8_UINT scene depth, linearises it (reversed-Z),
// and builds a 5-level R32F depth mip pyramid at AO resolution.

#version 450
#extension GL_GOOGLE_include_directive : require
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH  [[dont_flatten]]
#define SPIRV_CROSS_UNROLL  [[unroll]]
#define SPIRV_CROSS_LOOP    [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif

#include "ao_shared.h"

layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

// --- Descriptor bindings (set 0) ---
layout(set = 0, binding = 0) uniform sampler       s_point_clamp;
layout(set = 0, binding = 1) uniform texture2D     SceneDepth;
layout(set = 0, binding = 2, r32f) uniform writeonly image2D DepthMip0;
layout(set = 0, binding = 3, r32f) uniform writeonly image2D DepthMip1;
layout(set = 0, binding = 4, r32f) uniform writeonly image2D DepthMip2;
layout(set = 0, binding = 5, r32f) uniform writeonly image2D DepthMip3;
layout(set = 0, binding = 6, r32f) uniform writeonly image2D DepthMip4;

// Shared memory for hierarchical mip building
shared float g_scratchDepths[8][8];

void main()
{
    uvec2 basePixel = gl_GlobalInvocationID.xy * 2u;

    // Sample a 2x2 block of scene depth via textureGather.
    // UV is in [0,1] — the sampler handles the depth-to-AO resolution mapping.
    vec2 uv = (vec2(basePixel) + vec2(1.0)) * SCREEN_SIZE_RCP;
    vec4 rawDepths = textureGather(sampler2D(SceneDepth, s_point_clamp), uv);

    // Linearise (reversed-Z D24): z_view = 1 / (ZBUFFER_Z * d + ZBUFFER_W)
    // textureGather component order: w=TL, z=TR, x=BL, y=BR
    float d0 = XeGTAO_LinearizeDepth(rawDepths.w);  // (basePixel + 0,0)
    float d1 = XeGTAO_LinearizeDepth(rawDepths.z);  // (basePixel + 1,0)
    float d2 = XeGTAO_LinearizeDepth(rawDepths.x);  // (basePixel + 0,1)
    float d3 = XeGTAO_LinearizeDepth(rawDepths.y);  // (basePixel + 1,1)

    // Store full-res (mip 0) — 4 texels per thread
    imageStore(DepthMip0, ivec2(basePixel),                vec4(d0));
    imageStore(DepthMip0, ivec2(basePixel + uvec2(1, 0)),  vec4(d1));
    imageStore(DepthMip0, ivec2(basePixel + uvec2(0, 1)),  vec4(d2));
    imageStore(DepthMip0, ivec2(basePixel + uvec2(1, 1)),  vec4(d3));

    // --- Build mip 1: weighted 2x2 downsample ---
    // Weighted average that favours the maximum depth (keeps nearby occluders)
    float dMax  = max(max(d0, d1), max(d2, d3));
    float range = (0.75 * AO_RADIUS) * AO_RADIUS_SCALE;
    float fall  = AO_FALLOFF_RANGE * range;
    float fMul  = -1.0 / fall;
    float fAdd  = ((range * (1.0 - AO_FALLOFF_RANGE)) / fall) + 1.0;

    float w0 = clamp((dMax - d0) * fMul + fAdd, 0.0, 1.0);
    float w1 = clamp((dMax - d1) * fMul + fAdd, 0.0, 1.0);
    float w2 = clamp((dMax - d2) * fMul + fAdd, 0.0, 1.0);
    float w3 = clamp((dMax - d3) * fMul + fAdd, 0.0, 1.0);

    float mip1Val = ((w0 * d0) + (w1 * d1) + (w2 * d2) + (w3 * d3))
                  / ((w0 + w1) + (w2 + w3));

    imageStore(DepthMip1, ivec2(gl_GlobalInvocationID.xy), vec4(mip1Val));
    g_scratchDepths[gl_LocalInvocationID.x][gl_LocalInvocationID.y] = mip1Val;
    barrier();

    // --- Mip 2: 2x2 of mip-1 values from shared memory ---
    SPIRV_CROSS_BRANCH
    if (all(equal(gl_LocalInvocationID.xy % uvec2(2u), uvec2(0u))))
    {
        uint rx = gl_LocalInvocationID.x + 1u;
        uint ry = gl_LocalInvocationID.y + 1u;

        float a = g_scratchDepths[gl_LocalInvocationID.x][gl_LocalInvocationID.y];
        float b = g_scratchDepths[rx][gl_LocalInvocationID.y];
        float c = g_scratchDepths[gl_LocalInvocationID.x][ry];
        float d = g_scratchDepths[rx][ry];

        float mx = max(max(a, b), max(c, d));
        float wa = clamp((mx - a) * fMul + fAdd, 0.0, 1.0);
        float wb = clamp((mx - b) * fMul + fAdd, 0.0, 1.0);
        float wc = clamp((mx - c) * fMul + fAdd, 0.0, 1.0);
        float wd = clamp((mx - d) * fMul + fAdd, 0.0, 1.0);

        float v = ((wa * a) + (wb * b) + (wc * c) + (wd * d))
                / ((wa + wb) + (wc + wd));

        imageStore(DepthMip2, ivec2(gl_GlobalInvocationID.xy / 2u), vec4(v));
        g_scratchDepths[gl_LocalInvocationID.x][gl_LocalInvocationID.y] = v;
    }
    barrier();

    // --- Mip 3 ---
    SPIRV_CROSS_BRANCH
    if (all(equal(gl_LocalInvocationID.xy % uvec2(4u), uvec2(0u))))
    {
        uint rx = gl_LocalInvocationID.x + 2u;
        uint ry = gl_LocalInvocationID.y + 2u;

        float a = g_scratchDepths[gl_LocalInvocationID.x][gl_LocalInvocationID.y];
        float b = g_scratchDepths[rx][gl_LocalInvocationID.y];
        float c = g_scratchDepths[gl_LocalInvocationID.x][ry];
        float d = g_scratchDepths[rx][ry];

        float mx = max(max(a, b), max(c, d));
        float wa = clamp((mx - a) * fMul + fAdd, 0.0, 1.0);
        float wb = clamp((mx - b) * fMul + fAdd, 0.0, 1.0);
        float wc = clamp((mx - c) * fMul + fAdd, 0.0, 1.0);
        float wd = clamp((mx - d) * fMul + fAdd, 0.0, 1.0);

        float v = ((wa * a) + (wb * b) + (wc * c) + (wd * d))
                / ((wa + wb) + (wc + wd));

        imageStore(DepthMip3, ivec2(gl_GlobalInvocationID.xy / 4u), vec4(v));
        g_scratchDepths[gl_LocalInvocationID.x][gl_LocalInvocationID.y] = v;
    }
    barrier();

    // --- Mip 4 ---
    SPIRV_CROSS_BRANCH
    if (all(equal(gl_LocalInvocationID.xy % uvec2(8u), uvec2(0u))))
    {
        uint rx = gl_LocalInvocationID.x + 4u;
        uint ry = gl_LocalInvocationID.y + 4u;

        float a = g_scratchDepths[gl_LocalInvocationID.x][gl_LocalInvocationID.y];
        float b = g_scratchDepths[rx][gl_LocalInvocationID.y];
        float c = g_scratchDepths[gl_LocalInvocationID.x][ry];
        float d = g_scratchDepths[rx][ry];

        float mx = max(max(a, b), max(c, d));
        float wa = clamp((mx - a) * fMul + fAdd, 0.0, 1.0);
        float wb = clamp((mx - b) * fMul + fAdd, 0.0, 1.0);
        float wc = clamp((mx - c) * fMul + fAdd, 0.0, 1.0);
        float wd = clamp((mx - d) * fMul + fAdd, 0.0, 1.0);

        imageStore(DepthMip4, ivec2(gl_GlobalInvocationID.xy / 8u),
            vec4(((wa * a) + (wb * b) + (wc * c) + (wd * d))
               / ((wa + wb) + (wc + wd))));
    }
}
