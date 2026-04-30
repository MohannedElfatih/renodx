// XeGTAO Denoise / Bilateral Blur — BG3 port
// Depth-weighted 5×5 separable bilateral blur using shared memory (18×18 tile).
// Reads raw AO and prefiltered depth, outputs denoised AO.

#version 450
#extension GL_GOOGLE_include_directive : require
#extension GL_EXT_samplerless_texture_functions : require
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
layout(set = 0, binding = 0) uniform texture2D InputAO;    // R8 from MainPass
layout(set = 0, binding = 1) uniform texture2D InputDepth;  // R32F prefiltered mip 0
layout(set = 0, binding = 2, r8) uniform writeonly image2D OutputAO;

// Shared-memory tile: 8 core + 5 border on each side = 18
const uint TILE_SIZE   = 18u;
const uint BORDER_SIZE = 5u;

shared float gAO      [TILE_SIZE * TILE_SIZE];
shared float gFiltered[TILE_SIZE * TILE_SIZE];
shared float gDepth   [TILE_SIZE * TILE_SIZE];

float Weight(float centerDepth, float sampleDepth, float radius) {
    return exp(-abs(sampleDepth - centerDepth) * AO_DENOISER_BLUR_BETA - radius);
}

void main()
{
    uvec3 groupID      = gl_WorkGroupID;
    uvec3 threadInGroup = gl_LocalInvocationID;
    uvec3 dispatchThread = gl_GlobalInvocationID;
    uvec2 pixel = dispatchThread.xy;

    // Derive blur kernel radius from a fixed baseline (no temporal age info)
    float radius = 1.0;  // constant kernel width without temporal

    uvec2 local     = threadInGroup.xy;
    uvec2 groupBase = groupID.xy * 8u;
    uvec2 sharedCenter = local + BORDER_SIZE;

    // --- Load tile data into shared memory ---
    ivec2 screenSize = ivec2(SCREEN_SIZE);
    SPIRV_CROSS_UNROLL
    for (uint y = local.y; y < TILE_SIZE; y += 8u)
    {
        SPIRV_CROSS_UNROLL
        for (uint x = local.x; x < TILE_SIZE; x += 8u)
        {
            ivec2 p = ivec2(groupBase) + ivec2(x, y) - ivec2(BORDER_SIZE);
            p = clamp(p, ivec2(0), screenSize - 1);

            uint idx  = y * TILE_SIZE + x;
            gAO[idx]    = texelFetch(InputAO,    p, 0).r;
            gDepth[idx] = texelFetch(InputDepth, p, 0).r;
        }
    }

    groupMemoryBarrier();
    barrier();

    // --- Pass 1: Horizontal blur ---
    {
        uint cx = sharedCenter.x;

        SPIRV_CROSS_UNROLL
        for (uint y = local.y; y < TILE_SIZE; y += 8u)
        {
            uint idx = y * TILE_SIZE + cx;
            float centerDepth = gDepth[idx];

            float sum  = 0.0;
            float wsum = 0.0;

            SPIRV_CROSS_UNROLL
            for (int i = -2; i <= 2; i++)
            {
                uint nIdx = y * TILE_SIZE + (cx + i);
                float d = gDepth[nIdx];
                float a = gAO[nIdx];
                float w = Weight(centerDepth, d, radius);
                sum  += a * w;
                wsum += w;
            }

            gFiltered[idx] = sum / wsum;
        }
    }

    groupMemoryBarrier();
    barrier();

    // --- Pass 2: Vertical blur ---
    {
        uint cx = sharedCenter.x;
        uint cy = sharedCenter.y;
        uint centerIdx = cy * TILE_SIZE + cx;
        float centerDepth = gDepth[centerIdx];

        float sum  = 0.0;
        float wsum = 0.0;

        SPIRV_CROSS_UNROLL
        for (int i = -2; i <= 2; i++)
        {
            uint idx = (cy + i) * TILE_SIZE + cx;
            float d = gDepth[idx];
            float a = gFiltered[idx];
            float w = Weight(centerDepth, d, radius);
            sum  += a * w;
            wsum += w;
        }

        imageStore(OutputAO, ivec2(pixel), vec4(sum / wsum));
    }
}
