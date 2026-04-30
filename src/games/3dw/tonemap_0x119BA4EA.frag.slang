#version 450
#include "./shared.h"

const bool kShowExposureCanvas = false;

layout(set = 0, binding = 0, std140) uniform support_buffer
{
    uint _m0;
    uint _m1[8];
    vec4 _m2;
    vec4 _m3;
    int _m4;
    float _m5[73];
    ivec4 _m6;
    int _m7;
} support_buffer_1;

layout(set = 0, binding = 23, std140) uniform fp_c4
{
    vec4 _m0[4096];
} fp_c4_1;

layout(set = 2, binding = 128) uniform sampler2D fp_t_tcb_8;
layout(set = 2, binding = 129) uniform sampler2D fp_t_tcb_10;

layout(location = 0) in vec4 in;
layout(location = 0) out vec4 out;

void main()
{
    float coord = gl_FragCoord.w;
    float exposure = fp_c4_1._m0[1].x;
    vec2 uv = vec2(1.0 / coord * in.x * coord, 1.0 / coord * in.y * coord);
    vec4 raw = texture(fp_t_tcb_8, uv).xyzw;
    vec4 bloom = texture(fp_t_tcb_10, uv);
    out = raw * exposure + bloom * CUSTOM_BLOOM;

    if (kShowExposureCanvas)
    {
        renodx::canvas::Context canvas = renodx::canvas::CreateContext(
            float2(gl_FragCoord.xy),
            float2(16.0f, 16.0f),
            float2(20.0f, 40.0f),
            out.xyz,
            out.w,
            float3(1.0f, 1.0f, 1.0f),
            1.0f,
            1.0f,
            1.0f);


        renodx::canvas::SetColor(canvas, 0xd8dde3, 1.0f, 1.0f);
        renodx::canvas::DrawText(canvas, 'E', 'x', 'p', ':', ' ');
        renodx::canvas::DrawFloat(canvas, exposure, 0.0f, 6.0f, false, false);

        out = renodx::canvas::GetOutput(canvas);
    }
    if (RENODX_TONE_MAP_TYPE == 0) out = saturate(out);
    out.xyz = renodx::draw::ToneMapPass(out.xyz, saturate(out.xyz));
    
    out.xyz = renodx::draw::RenderIntermediatePass(out.xyz);
}

