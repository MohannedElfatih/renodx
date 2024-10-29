#include "./shared.h"

SamplerState sourceSampler_s : register(s0);
Texture2D<float4> sourceTexture : register(t0);

void main(
        float4 vpos : SV_Position,
        float2 texcoord : TEXCOORD,
    out float4 output : SV_Target0)
{
    float4 color = sourceTexture.Sample(sourceSampler_s, texcoord.xy);

    color.rgb = renodx::math::SafePow(color.rgb, 2.2f);
    color.rgb *= injectedData.toneMapGameNits;
    color.rgb /= 80.f;
    
    if ((injectedData.toneMapType >= 2) && (injectedData.clipPeak)) { //If tonemapper is not "none" or "Vanilla"
        color.rgb = min(color.rgb, injectedData.toneMapPeakNits / 80.f); //clamp output to peak nits slider, bandaid for a few effects
    }
    
    
    output.rgba = color;
}