#ifndef BG3_AO_SHARED_H_
#define BG3_AO_SHARED_H_

// XeGTAO push constants — shared between C++ addon and GLSL compute shaders.
// 128 bytes (8 × vec4), well within the 256B Vulkan minimum.
//
// Camera params are derived from estimated near/far/FOV on C++ side.
// All AO parameters come from the addon's UI settings.

#ifdef __cplusplus

struct XeGTAOPushData {
  float screen_size[4];        // w, h, 1/w, 1/h  (AO operating resolution)
  float depth_buffer_size[4];  // w, h, 1/w, 1/h  (scene depth texture resolution)
  float zbuffer_params[4];     // near, far, 1/near - 1/far, 1/far
  float inv_proj_params[4];    // tan(fov_h/2), tan(fov_v/2), unused, unused
  float ao_params0[4];         // radius, radius_scale, falloff_range, distribution_power
  float ao_params1[4];         // thin_occluder, gamma, mip_bias, direction_count
  float ao_params2[4];         // step_count, normal_attenuation, bitmask, thickness
  float ao_params3[4];         // denoiser_blur_beta, frame_index (as float), 0, 0
};

#else  // GLSL

layout(push_constant) uniform XeGTAOParams {
  vec4 ScreenSize;        // xy = resolution, zw = 1/resolution  (AO res)
  vec4 DepthBufferSize;   // xy = resolution, zw = 1/resolution  (scene depth)
  vec4 ZBufferParams;     // x=near, y=far, z=1/near-1/far, w=1/far
  vec4 InvProjParams;     // x=tan(fov_h/2), y=tan(fov_v/2)
  vec4 AOParams0;         // x=radius, y=radius_scale, z=falloff_range, w=distribution_power
  vec4 AOParams1;         // x=thin_occluder, y=gamma, z=mip_bias, w=direction_count
  vec4 AOParams2;         // x=step_count, y=normal_attenuation, z=bitmask, w=thickness
  vec4 AOParams3;         // x=denoiser_blur_beta, y=frame_index (float)
} pc;

// --- Screen / depth helpers ---
#define SCREEN_SIZE         pc.ScreenSize.xy
#define SCREEN_SIZE_RCP     pc.ScreenSize.zw
#define DEPTH_SIZE          pc.DepthBufferSize.xy
#define DEPTH_SIZE_RCP      pc.DepthBufferSize.zw
#define NEAR_PLANE          pc.ZBufferParams.x
#define FAR_PLANE           pc.ZBufferParams.y
#define ZBUFFER_Z           pc.ZBufferParams.z
#define ZBUFFER_W           pc.ZBufferParams.w
#define INV_PROJ_X          pc.InvProjParams.x
#define INV_PROJ_Y          pc.InvProjParams.y

// --- AO parameter accessors ---
#define AO_RADIUS             pc.AOParams0.x
#define AO_RADIUS_SCALE       pc.AOParams0.y
#define AO_FALLOFF_RANGE      pc.AOParams0.z
#define AO_DISTRIBUTION_POWER pc.AOParams0.w
#define AO_THIN_OCCLUDER      pc.AOParams1.x
#define AO_GAMMA_GTAO         pc.AOParams1.y
#define AO_MIP_BIAS           pc.AOParams1.z
#define AO_DIRECTION_COUNT    pc.AOParams1.w
#define AO_STEP_COUNT         pc.AOParams2.x
#define AO_NORMAL_ATTENUATION pc.AOParams2.y
#define AO_USE_BITMASK        (pc.AOParams2.z != 0.0)
#define AO_THICKNESS          pc.AOParams2.w
#define AO_DENOISER_BLUR_BETA pc.AOParams3.x
#define AO_FRAME_INDEX        uint(pc.AOParams3.y)
#define AO_TEMPORAL_FRAME     64u

// Depth linearization: reversed-Z D24  (depth=1 near, depth=0 far)
// z_view = 1.0 / (ZBUFFER_Z * depth + ZBUFFER_W)
float XeGTAO_LinearizeDepth(float d) {
  return 1.0 / (ZBUFFER_Z * d + ZBUFFER_W);
}

// Viewspace position from normalised screen coords [0,1] + linearised depth
vec3 XeGTAO_ComputeViewspacePosition(vec2 screenPos, float viewspaceDepth) {
  vec2 ndc = screenPos * 2.0 - 1.0;
  return vec3(
      ndc.x * INV_PROJ_X * viewspaceDepth,
      -ndc.y * INV_PROJ_Y * viewspaceDepth,
      viewspaceDepth);
}

bool XeGTAO_IsSky(float linearDepth) {
  return (linearDepth >= FAR_PLANE * 0.99);
}

#define XE_GTAO_SCALED_BUFFER_PIXEL_SIZE SCREEN_SIZE_RCP

#define HALF_PI 1.5707963267948966
#define PI      3.1415926535897932
#define TWO_PI  6.2831853071795864

#define XE_GTAO_QWORD_BIT_WIDTH  32
#define XE_GTAO_BITMASK_NUM_BITS float(XE_GTAO_QWORD_BIT_WIDTH * 1)

#endif  // __cplusplus
#endif  // BG3_AO_SHARED_H_
