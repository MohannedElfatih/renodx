#define UBERINDEX0
#define PREMUL
#define GL
#define precision
#define lowp
#define mediump
#define highp
#define XMUL(a,b) ( a * vec4(b, 1.0) )
#define NMUL(a,b) ( a * b )
precision lowp float;
precision lowp sampler2D;

#pragma varying begin
varying mediump vec2 v_TexCoord;
varying lowp vec4 v_Color;
varying mediump vec3 v_Position;
#pragma varying end
// Helper for modifying the saturation of a color.
vec3 AdjustSaturation(vec3 color, float saturation)
{
// The constants 0.3, 0.59, and 0.11 are chosen because the
// human eye is more sensitive to green light, and less to blue.
float grey = dot(color, vec3(0.3, 0.59, 0.11));

vec3 result = mix(vec3(grey,grey,grey), color, saturation);
return result;
}

uniform sampler2D TextureSampler;
uniform sampler2D BaseSampler;

uniform float BloomIntensity;
uniform float BaseIntensity;

uniform float BloomSaturation;
uniform float BaseSaturation;

void main(void)
{
// Look up the bloom and original base image colors.
vec3 bloom = texture2D(TextureSampler, v_TexCoord).rgb;
vec3 base = texture2D(BaseSampler, v_TexCoord).rgb;

// Adjust color saturation and intensity.
bloom = AdjustSaturation(bloom, BloomSaturation) * BloomIntensity;
base = AdjustSaturation(base, BaseSaturation);

// Darken down the base image in areas where there is a lot of bloom,
// to prevent things looking excessively burned-out.
base *= (1.0 - clamp(bloom, 0.0, 1.0))  * BaseIntensity;

// Combine the two images.
//vec4 vout;
//vout.rgb = base + bloom;
//vout.a = 1.0;

gl_FragColor = vec4(base + bloom, 1.0);
}
