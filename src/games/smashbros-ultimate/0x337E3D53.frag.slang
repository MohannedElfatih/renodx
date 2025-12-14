#version 450

layout(set = 0, binding = 1, std140) uniform freqHigh_fragmentUniforms_ubo
{
    vec4 binkhasalpha;
    vec4 uimult;
} freqHigh_fragmentUniforms;

layout(set = 0, binding = 2) uniform sampler2D samp_binky;
layout(set = 0, binding = 3) uniform sampler2D samp_binkcr;
layout(set = 0, binding = 4) uniform sampler2D samp_binkcb;
layout(set = 0, binding = 5) uniform sampler2D samp_binka;

layout(location = 2) in vec4 vofi_TexCoord0;
layout(location = 0) out vec4 out_FragColor0;
layout(location = 0) in vec4 vofi_Color;

vec4 tex2D(sampler2D image, vec2 texcoord)
{
    return texture(image, texcoord);
}

void main()
{
    vec3 crc = vec3(1.595794677734375, -0.8134765625, 0.0);
    vec3 crb = vec3(0.0, -0.391448974609375, 2.017822265625);
    vec3 adj = vec3(-0.870655059814453125, 0.529705047607421875, -1.081668853759765625);
    vec2 param = vofi_TexCoord0.xy;
    float Y = tex2D(samp_binky, param).x;
    vec2 param_1 = vofi_TexCoord0.xy;
    float Cr = tex2D(samp_binkcr, param_1).x;
    vec2 param_2 = vofi_TexCoord0.xy;
    float Cb = tex2D(samp_binkcb, param_2).x;
    float A = 1.0;
    if (freqHigh_fragmentUniforms.binkhasalpha.x > 0.0)
    {
        vec2 param_3 = vofi_TexCoord0.xy;
        A = tex2D(samp_binka, param_3).x;
    }
    vec3 p = vec3(Y * 1.16412353515625);
    p += (((crc * Cr) + (crb * Cb)) + adj);
    vec3 _111 = (p * vofi_Color.xyz) * freqHigh_fragmentUniforms.uimult.x;
    out_FragColor0 = vec4(_111.x, _111.y, _111.z, out_FragColor0.w);
    out_FragColor0.w = A * vofi_Color.w;
    out_FragColor0.rgb = float3(5, 5, 0);
}

