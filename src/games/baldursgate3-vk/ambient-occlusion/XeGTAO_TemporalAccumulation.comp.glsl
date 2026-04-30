// XeGTAO Temporal Accumulation — BG3 port (placeholder)
// Currently a pass-through / simple blend without motion vectors.
// Will be fully implemented once BG3 motion vectors are located.

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
layout(set = 0, binding = 0) uniform sampler   s_point_clamp;
layout(set = 0, binding = 1) uniform texture2D CurrentAO;      // R8, from MainPass
layout(set = 0, binding = 2) uniform texture2D CurrentDepth;    // R32F, prefiltered mip 0
layout(set = 0, binding = 3) uniform texture2D PreviousAO;      // RG8, previous accumulated (R=AO, G=age)
layout(set = 0, binding = 4) uniform texture2D PreviousDepth;   // R32F, previous frame depth
layout(set = 0, binding = 5, rg8) uniform writeonly image2D AccumulatedAO;  // RG8 output (R=AO, G=age)
layout(set = 0, binding = 6, r32f) uniform writeonly image2D SavedDepth;    // for next frame

// 3x3 neighbourhood offsets
const ivec2 kOffsets[9] = ivec2[](
    ivec2(-1, -1), ivec2(0, -1), ivec2(1, -1),
    ivec2(-1,  0), ivec2(0,  0), ivec2(1,  0),
    ivec2(-1,  1), ivec2(0,  1), ivec2(1,  1)
);

void main()
{
    ivec2 pixel = ivec2(gl_GlobalInvocationID.xy);
    vec2  uv    = (vec2(pixel) + 0.5) * SCREEN_SIZE_RCP;

    float currentDepth = textureLod(sampler2D(CurrentDepth, s_point_clamp), uv, 0.0).x;

    // Save depth for next frame
    imageStore(SavedDepth, pixel, vec4(currentDepth));

    // Sky → pass through
    if (XeGTAO_IsSky(currentDepth)) {
        imageStore(AccumulatedAO, pixel, vec4(1.0, 0.0, 0.0, 0.0));
        return;
    }

    // Current frame AO
    float currentAO = textureLod(sampler2D(CurrentAO, s_point_clamp), uv, 0.0).x;

    // Previous frame data (no motion vectors — sample at same UV)
    vec2  prevSample = textureLod(sampler2D(PreviousAO, s_point_clamp), uv, 0.0).xy;
    float prevAO     = prevSample.x;
    float prevAge    = prevSample.y;
    float prevDepth  = textureLod(sampler2D(PreviousDepth, s_point_clamp), uv, 0.0).x;

    // Disocclusion detection — reject history if depth changed significantly
    bool disoccluded = (currentDepth > prevDepth * 1.0425);

    if (disoccluded) {
        prevAge = 0.0;
        prevAO  = 1.0;
    } else {
        // 3x3 neighbourhood clamp to prevent ghosting
        float minAO =  9999.0;
        float maxAO = -9999.0;
        SPIRV_CROSS_UNROLL
        for (int i = 0; i < 9; i++) {
            float s = textureLod(sampler2D(CurrentAO, s_point_clamp),
                                 uv + vec2(kOffsets[i]) * SCREEN_SIZE_RCP, 0.0).x;
            minAO = min(minAO, s);
            maxAO = max(maxAO, s);
        }
        prevAO  = clamp(prevAO, minAO, maxAO);
        prevAge = clamp(prevAge + 1.0 / 7.0, 0.0, 1.0);
    }

    float blendFactor  = 1.0 / (prevAge * 7.0 + 1.0);
    float accumulatedAO = prevAO + blendFactor * (currentAO - prevAO);

    imageStore(AccumulatedAO, pixel, vec4(accumulatedAO, prevAge, 0.0, 0.0));
}
