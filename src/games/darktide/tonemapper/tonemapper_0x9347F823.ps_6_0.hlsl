#define TONEMAPPER_LAYOUT_MINIMAL
// This permutation omits global_viewport, shifting the vanilla cbuffers down one slot.
#define TONEMAPPER_ENVIRONMENT_REGISTER b0
#define TONEMAPPER_CONSTANTS_REGISTER b1

#include "tonemapper.hlsl"
