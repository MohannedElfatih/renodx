#define UBERINDEX0
#define PREMUL
#define GL
#define precision
#define lowp
#define mediump
#define highp
#define XMUL(a,b) ( a * vec4(b, 1.0) )
#define NMUL(a,b) ( a * b )
#define SAMPLE_COUNT 15

precision lowp float;
precision lowp sampler2D;

#pragma varying begin
varying lowp vec4 v_Color;
varying mediump vec2 v_TexCoord[SAMPLE_COUNT];
#pragma varying end

uniform sampler2D TextureSampler;

uniform lowp float SampleWeights[SAMPLE_COUNT];

void main()
{
lowp vec4 c = vec4(0.0, 0.0, 0.0, 0.0);

// Combine a number of weighted image filter taps.
for (int i = 0; i < SAMPLE_COUNT; i++)
{
c += texture2D(TextureSampler, v_TexCoord[i]) * SampleWeights[i];
}

gl_FragColor = c;
}
