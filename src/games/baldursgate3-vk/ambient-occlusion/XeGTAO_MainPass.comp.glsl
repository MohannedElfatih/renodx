// XeGTAO MainPass — BG3 port
// Computes screen-space ambient occlusion from the prefiltered depth pyramid.
// Normals are generated in-place from depth (no game normal buffer needed).
// Supports both visibility-integral and bitmask modes.

#version 460
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
layout(set = 0, binding = 0) uniform sampler   s_point_clamp;
layout(set = 0, binding = 1) uniform texture2D DepthMIPs;     // R32F prefiltered, 5 mips
layout(set = 0, binding = 2, r8) uniform writeonly image2D OutAO;

// =========================================================================
//  Utility functions
// =========================================================================

float XeGTAO_FastSqrt(float x) {
    return intBitsToFloat(0x1fbd1df5 + (floatBitsToInt(x) >> 1));
}

float XeGTAO_FastACos(float inX) {
    float x   = abs(inX);
    float res = -0.156583 * x + HALF_PI;
    res *= XeGTAO_FastSqrt(1.0 - x);
    return (inX >= 0.0) ? res : PI - res;
}

// =========================================================================
//  Edge detection for normal generation from depth
// =========================================================================

vec4 XeGTAO_CalculateEdges(float centerZ, float leftZ, float rightZ,
                            float topZ, float bottomZ) {
    vec4 e = vec4(leftZ, rightZ, topZ, bottomZ) - centerZ;
    float slopeLR = (e.y - e.x) * 0.5;
    float slopeTB = (e.w - e.z) * 0.5;
    vec4 adj = e + vec4(slopeLR, -slopeLR, slopeTB, -slopeTB);
    e = min(abs(e), abs(adj));
    return clamp(1.25 - e / (centerZ * 0.011), 0.0, 1.0);
}

vec3 XeGTAO_CalculateNormal(vec4 edgesLRTB,
                             vec3 pixC, vec3 pixL, vec3 pixR,
                             vec3 pixT, vec3 pixB) {
    vec4 w = clamp(vec4(edgesLRTB.x * edgesLRTB.z,
                        edgesLRTB.z * edgesLRTB.y,
                        edgesLRTB.y * edgesLRTB.w,
                        edgesLRTB.w * edgesLRTB.x) + 0.01, 0.0, 1.0);

    vec3 dL = normalize(pixL - pixC);
    vec3 dR = normalize(pixR - pixC);
    vec3 dT = normalize(pixT - pixC);
    vec3 dB = normalize(pixB - pixC);

    vec3 n = w.x * cross(dL, dT)
           + w.y * cross(dT, dR)
           + w.z * cross(dR, dB)
           + w.w * cross(dB, dL);

    return normalize(n);
}

// =========================================================================
//  Bitmask helpers
// =========================================================================

uint UpdateSectors(float minH, float maxH, float samplesPerSlice, uint bitmask) {
    int start = int(minH * samplesPerSlice);
    int angle = max(int(round((maxH - minH) * samplesPerSlice)), 0);
    return bitfieldInsert(bitmask, 0xFFFFFFFFu, start, angle);
}

void ProcessSample(vec3 delta, vec3 viewVec, float dir,
                   vec2 N, float samplesPerSlice, inout uint bitmask) {
    vec3 back = delta - viewVec * AO_THICKNESS;
    vec2 fbH  = vec2(
        XeGTAO_FastACos(dot(normalize(delta), viewVec)),
        XeGTAO_FastACos(dot(normalize(back),  viewVec)));
    fbH = clamp((dir * -fbH - N + HALF_PI) / PI, 0.0, 1.0);
    fbH = (dir >= 0.0) ? fbH.yx : fbH.xy;
    fbH = smoothstep(0.0, 1.0, fbH);
    bitmask = UpdateSectors(fbH.x, fbH.y, samplesPerSlice, bitmask);
}

// =========================================================================
//  Main
// =========================================================================

void main()
{
    // --- Hilbert-curve-based spatial noise (from SPIRV-Cross decompile) ---
    uint noiseIdx;
    {
        uint _103 = 0u;
        uint _104, _99, _102;
        for (uint _98 = gl_GlobalInvocationID.y,
                  _101 = gl_GlobalInvocationID.x,
                  _105 = 32u;
             _105 > 0u;
             _98 = _99, _101 = _102, _103 = _104, _105 /= 2u)
        {
            uint xBit = uint((_101 & _105) > 0u);
            uint yBit = uint((_98  & _105) > 0u);
            _104 = _103 + (_105 * _105 * ((3u * xBit) ^ yBit));
            if (yBit == 0u) {
                if (xBit == 1u) { _99 = 63u - _98;  _102 = 63u - _101; }
                else            { _99 = _98;          _102 = _101;       }
                uint tmp = _99; _99 = _102; _102 = tmp;
            } else {
                _99 = _98; _102 = _101;
            }
        }
        noiseIdx = _103;
    }
    vec2 noise = fract(vec2(0.5) + vec2(0.75487768650054931640625,
                                         0.56984031200408935546875)
                 * float(noiseIdx + (288u * (AO_FRAME_INDEX % AO_TEMPORAL_FRAME))));

    vec2 pixCoord = vec2(gl_GlobalInvocationID.xy);
    vec2 normScreenPos = (pixCoord + 0.5) * SCREEN_SIZE_RCP;

    // Read centre viewspace depth
    float viewspaceZ = textureLod(sampler2D(DepthMIPs, s_point_clamp),
                                  normScreenPos, 0.0).x;

    // --- Generate viewspace normal in-place from depth ---
    vec4 gUL = textureGather(sampler2D(DepthMIPs, s_point_clamp),
                             pixCoord * SCREEN_SIZE_RCP, 0);
    vec4 gBR = textureGatherOffset(sampler2D(DepthMIPs, s_point_clamp),
                                   pixCoord * SCREEN_SIZE_RCP,
                                   ivec2(1, 1), 0);
    float pixLZ = gUL.x;
    float pixTZ = gUL.z;
    float pixRZ = gBR.z;
    float pixBZ = gBR.x;

    vec4 edgesLRTB = XeGTAO_CalculateEdges(viewspaceZ, pixLZ, pixRZ, pixTZ, pixBZ);

    vec3 CENTER = XeGTAO_ComputeViewspacePosition(normScreenPos, viewspaceZ);
    vec3 LEFT   = XeGTAO_ComputeViewspacePosition(normScreenPos + vec2(-1,  0) * SCREEN_SIZE_RCP, pixLZ);
    vec3 RIGHT  = XeGTAO_ComputeViewspacePosition(normScreenPos + vec2( 1,  0) * SCREEN_SIZE_RCP, pixRZ);
    vec3 TOP    = XeGTAO_ComputeViewspacePosition(normScreenPos + vec2( 0,  1) * SCREEN_SIZE_RCP, pixTZ);
    vec3 BOTTOM = XeGTAO_ComputeViewspacePosition(normScreenPos + vec2( 0, -1) * SCREEN_SIZE_RCP, pixBZ);

    vec3 viewspaceNormal = XeGTAO_CalculateNormal(edgesLRTB, CENTER, LEFT, RIGHT, TOP, BOTTOM);
    viewspaceNormal.y = -viewspaceNormal.y;

    // Sky → full visibility
    if (XeGTAO_IsSky(viewspaceZ)) {
        imageStore(OutAO, ivec2(gl_GlobalInvocationID.xy), vec4(1.0));
        return;
    }

    // Nudge towards camera for precision
    viewspaceZ *= 0.99999;

    vec3 pixCenterPos = XeGTAO_ComputeViewspacePosition(normScreenPos, viewspaceZ);
    vec3 viewVec      = normalize(-pixCenterPos);

    // Falloff precompute
    float falloffFrom  = AO_RADIUS * AO_RADIUS_SCALE * (1.0 - AO_FALLOFF_RANGE);
    float falloffRange = AO_FALLOFF_RANGE * AO_RADIUS * AO_RADIUS_SCALE;
    float falloffMul   = -1.0 / falloffRange;
    float falloffAdd   = falloffFrom / falloffRange + 1.0;

    // Screen-space radius
    vec2 pixelDir = XeGTAO_ComputeViewspacePosition(
        normScreenPos + XE_GTAO_SCALED_BUFFER_PIXEL_SIZE, pixCenterPos.z).xy
        - pixCenterPos.xy;
    float screenspaceRadius = (AO_RADIUS * AO_RADIUS_SCALE) / pixelDir.x;

    float visibility = 0.0;

    // Small-radius fade
    visibility += clamp((10.0 - screenspaceRadius) / 100.0, 0.0, 1.0) * 0.5;

    float minS = 1.3 / screenspaceRadius;  // pixelTooCloseThreshold

    SPIRV_CROSS_UNROLL
    for (float slice = 0.0; slice < AO_DIRECTION_COUNT; slice += 1.0)
    {
        float sliceK = (slice + noise.x) / AO_DIRECTION_COUNT;
        float phi    = sliceK * PI;
        float cosPhi = cos(phi);
        float sinPhi = sin(phi);
        vec2  omega  = vec2(cosPhi, sinPhi) * screenspaceRadius;

        vec3 dirVec      = vec3(cosPhi, sinPhi, 0.0);
        vec3 orthoDirVec = dirVec - dot(dirVec, viewVec) * viewVec;
        vec3 axisVec     = normalize(cross(orthoDirVec, viewVec));

        vec3  projNormVec    = viewspaceNormal - axisVec * dot(viewspaceNormal, axisVec);
        float signNorm       = sign(dot(orthoDirVec, projNormVec));
        float projNormLen    = length(projNormVec);
        float cosNorm        = clamp(dot(projNormVec, viewVec) / projNormLen, 0.0, 1.0);
        float n              = signNorm * XeGTAO_FastACos(cosNorm);
        vec2  N              = vec2(n);

        float lowHorizonCos0 = cos(n + HALF_PI);
        float lowHorizonCos1 = cos(n - HALF_PI);
        float horizonCos0    = lowHorizonCos0;
        float horizonCos1    = lowHorizonCos1;
        uint  bitmask        = 0u;

        SPIRV_CROSS_UNROLL
        for (float step = 0.0; step < AO_STEP_COUNT; step += 1.0)
        {
            float stepBaseNoise = (slice + step * AO_STEP_COUNT) * 0.6180339887498948482;
            float stepNoise     = fract(noise.y + stepBaseNoise);
            float s = (step + stepNoise) / AO_STEP_COUNT;
            s = pow(s, AO_DISTRIBUTION_POWER);
            s += minS;

            vec2 sampleOffset = s * omega;
            float mipLevel = clamp(log2(length(sampleOffset)) - AO_MIP_BIAS, 0.0, 4.0);
            sampleOffset = roundEven(sampleOffset) * XE_GTAO_SCALED_BUFFER_PIXEL_SIZE;

            vec2 sp0 = normScreenPos + sampleOffset;
            vec2 sp1 = normScreenPos - sampleOffset;

            float SZ0 = textureLod(sampler2D(DepthMIPs, s_point_clamp), sp0, mipLevel).x;
            float SZ1 = textureLod(sampler2D(DepthMIPs, s_point_clamp), sp1, mipLevel).x;

            vec3 d0 = XeGTAO_ComputeViewspacePosition(normScreenPos + sampleOffset, SZ0) - pixCenterPos;
            vec3 d1 = XeGTAO_ComputeViewspacePosition(normScreenPos - sampleOffset, SZ1) - pixCenterPos;

            SPIRV_CROSS_BRANCH
            if (AO_USE_BITMASK)
            {
                if (abs(length(d0)) < 1000.0)
                    ProcessSample(d0, viewVec, -1.0, N, XE_GTAO_BITMASK_NUM_BITS, bitmask);
                if (abs(length(d1)) < 1000.0)
                    ProcessSample(d1, viewVec,  1.0, N, XE_GTAO_BITMASK_NUM_BITS, bitmask);
            }
            else
            {
                float dist0 = length(d0);
                float dist1 = length(d1);

                vec3  hVec0 = d0 / dist0;
                vec3  hVec1 = d1 / dist1;

                float fb0 = length(vec3(d0.x, d0.y, d0.z * (1.0 + AO_THIN_OCCLUDER)));
                float fb1 = length(vec3(d1.x, d1.y, d1.z * (1.0 + AO_THIN_OCCLUDER)));
                float w0  = clamp(fb0 * falloffMul + falloffAdd, 0.0, 1.0);
                float w1  = clamp(fb1 * falloffMul + falloffAdd, 0.0, 1.0);

                float shc0 = dot(hVec0, viewVec);
                float shc1 = dot(hVec1, viewVec);
                shc0 = mix(lowHorizonCos0, shc0, w0);
                shc1 = mix(lowHorizonCos1, shc1, w1);

                horizonCos0 = max(horizonCos0, shc0);
                horizonCos1 = max(horizonCos1, shc1);
            }
        }

        if (AO_USE_BITMASK)
        {
            projNormLen = mix(projNormLen, 1.0, AO_NORMAL_ATTENUATION);
            visibility += 1.0 - float(bitCount(bitmask)) / XE_GTAO_BITMASK_NUM_BITS;
        }
        else
        {
            projNormLen = mix(projNormLen, 1.0, AO_NORMAL_ATTENUATION);
            float h0 = -XeGTAO_FastACos(horizonCos1);
            float h1 =  XeGTAO_FastACos(horizonCos0);
            float iarc0 = (cosNorm + 2.0 * h0 * sin(n) - cos(2.0 * h0 - n)) / 4.0;
            float iarc1 = (cosNorm + 2.0 * h1 * sin(n) - cos(2.0 * h1 - n)) / 4.0;
            visibility += projNormLen * (iarc0 + iarc1);
        }
    }

    visibility /= AO_DIRECTION_COUNT;
    visibility  = pow(visibility, AO_GAMMA_GTAO);
    visibility  = max(0.03, visibility);

    imageStore(OutAO, ivec2(gl_GlobalInvocationID.xy), vec4(visibility));
}
