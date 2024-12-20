#ifndef SRC_DBZSPARK_SHARED_H_
#define SRC_DBZSPARK_SHARED_H_

#ifndef __cplusplus
#include "../../shaders/renodx.hlsl"
#endif

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float toneMapType;
  float toneMapDisplay;
  float toneMapPeakNits;
  float toneMapGameNits;
  float toneMapUINits;
  float colorGradeExposure;
  float colorGradeHighlights;
  float colorGradeShadows;
  float colorGradeContrast;
  float colorGradeSaturation;
  float colorGradeBlowout;
};

#ifndef __cplusplus
cbuffer injectedBuffer : register(b0, space50) {
  ShaderInjectData injectedData : packoffset(c0);
}
/* static const ShaderInjectData injectedData = {
    3.f,    // toneMapType
    1.f,    // toneMapDisplay
    800.f,  // toneMapPeakNits
    120.f,  // toneMapGameNits
    120.f,  // toneMapUINits
    1.f,    // colorGradeExposure
    1.f,    // colorGradeHighlights
    1.f,    // colorGradeShadows
    1.f,    // colorGradeContrast
    5.f,    // colorGradeSaturation
    0.f,    // colorGradeBlowout
}; */
#endif

#endif  // SRC_DBZSPARK_SHARED_H_
