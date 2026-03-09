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
varying mediump vec3 v_Normal;
#pragma varying end
// Helper for premultiplying colors from non-premultiplied textures
vec4 SampleFromFile( sampler2D sampler, vec2 texCoord )
{
vec4 color = texture2D( sampler, texCoord );
#ifdef PREMUL
color.rgb *= color.a;
#endif
return color;
}

vec4 SampleFromFileDiscard( sampler2D sampler, vec2 texCoord )
{
vec4 color = texture2D( sampler, texCoord );
#ifndef NODISCARD
if(color.a <= 0.0)
discard;
#endif
#ifdef PREMUL
color.rgb *= color.a;
#endif
return color;
}

// Doing the tint in this function saves an extra vec4 * float to apply both alphas
vec4 SampleFromFileTinted( sampler2D sampler, vec2 texCoord, vec4 tint )
{
vec4 color = texture2D( sampler, texCoord ) * tint;
#ifdef PREMUL
color.rgb *= color.a;
#endif
return color;
}

// Doing the tint in this function saves an extra vec4 * float to apply both alphas
vec4 SampleFromFileTintedDiscard( sampler2D sampler, vec2 texCoord, vec4 tint )
{
vec4 color = texture2D( sampler, texCoord ) * tint;
#ifndef NODISCARD
if(color.a <= 0.0)
discard;
#endif
#ifdef PREMUL
color.rgb *= color.a;
#endif
return color;
}

float SampleAlphaFromFileBounded( sampler2D sampler, vec2 texCoord, vec2 texTL, vec2 texBR )
{
float a = texture2D( sampler, texCoord ).a;

// Apply bounds to texCoord
vec2 vTextureValid = step(texTL, texCoord) * step(texCoord - texBR, vec2(0.0,0.0));
float textureValid = vTextureValid.x * vTextureValid.y;

return a * textureValid;
}

// Returns vec4(0) if out of bounds
vec4 SampleFromFileBounded( sampler2D sampler, vec2 texCoord, vec2 texTL, vec2 texBR )
{
vec4 color = texture2D( sampler, texCoord );

// Apply bounds to texCoord
vec2 vTextureValid = step(texTL, texCoord) * step(texCoord - texBR, vec2(0.0,0.0));
float textureValid = vTextureValid.x * vTextureValid.y;

#ifdef PREMUL
color.rgb *= (color.a * textureValid);
color.a *= textureValid;
#else
color *= textureValid;
#endif

return color;
}

// Returns vec4(0) if out of bounds
vec4 SampleFromFileBoundedNoPremul( sampler2D sampler, vec2 texCoord, vec2 texTL, vec2 texBR )
{
vec4 color = texture2D( sampler, texCoord );

// Apply bounds to texCoord
vec2 vTextureValid = step(texTL, texCoord) * step(texCoord - texBR, vec2(0.0,0.0));
float textureValid = vTextureValid.x * vTextureValid.y;

color *= textureValid;

return color;
}

// Returns vec4(0) if out of bounds
vec4 SampleFromFileBoundedTinted( sampler2D sampler, vec2 texCoord, vec2 texTL, vec2 texBR, vec4 tint )
{
vec4 color = texture2D( sampler, texCoord ) * tint;

// Apply bounds to texCoord
vec2 vTextureValid = step(texTL, texCoord) * step(texCoord - texBR, vec2(0.0,0.0));
float textureValid = vTextureValid.x * vTextureValid.y;

#ifdef PREMUL
color.rgb *= (color.a * textureValid);
color.a *= textureValid;
#else
color *= textureValid;
#endif

return color;
}

// Returns vec4(0) if out of bounds
vec4 SampleFromFileBoundedTintedNoPremul( sampler2D sampler, vec2 texCoord, vec2 texTL, vec2 texBR, vec4 tint )
{
vec4 color = texture2D( sampler, texCoord ) * tint;

// Apply bounds to texCoord
vec2 vTextureValid = step(texTL, texCoord) * step(texCoord - texBR, vec2(0.0,0.0));
float textureValid = vTextureValid.x * vTextureValid.y;

color *= textureValid;

return color;
}

// Doing the tint in this function saves an extra vec4 * float to apply both alphas
vec4 SampleFromFileYRBTinted( sampler2D ysampler, sampler2D crsampler, sampler2D cbsampler, sampler2D asampler, vec2 texCoord, vec4 tint )
{
const vec3 crc = vec3(1.595, -0.813, 0.0);
const vec3 crb = vec3(0.0, -0.391, 2.017);
const vec3 adj = vec3(-0.870, 0.529, -1.0816);

float Y = texture2D(ysampler, texCoord).x;
float cR = texture2D(crsampler, texCoord).x;
float cB = texture2D(cbsampler, texCoord).x;
float A = texture2D(asampler, texCoord).x;

vec3 p = vec3(Y * 1.164, Y * 1.164, Y * 1.164);
p += crc * cR;
p += crb * cB;
p += adj;
vec4 color = vec4(p, A) * tint;

#ifdef PREMUL
//color.rgb *= color.a;	// Movies are all premult
color.rgb *= tint.a;
#endif

return color;
}

// Doing the tint in this function saves an extra vec4 * float to apply both alphas
vec4 SampleFromFileYRBTintedDiscard( sampler2D ysampler, sampler2D crsampler, sampler2D cbsampler, sampler2D asampler, vec2 texCoord, vec4 tint )
{
float A = texture2D(asampler, texCoord).x;

#ifndef NODISCARD
if(A <= 0.0)
discard;
#endif

const vec3 crc = vec3(1.595, -0.813, 0.0);
const vec3 crb = vec3(0.0, -0.391, 2.017);
const vec3 adj = vec3(-0.870, 0.529, -1.0816);

float Y = texture2D(ysampler, texCoord).x;
float cR = texture2D(crsampler, texCoord).x;
float cB = texture2D(cbsampler, texCoord).x;

vec3 p = vec3(Y * 1.164, Y * 1.164, Y * 1.164);
p += crc * cR;
p += crb * cB;
p += adj;
vec4 color = vec4(p, A) * tint;

#ifdef PREMUL
//color.rgb *= color.a;	// Movies are all premult
color.rgb *= tint.a;
#endif

return color;
}

vec4 SampleFromFileYRB( sampler2D ysampler, sampler2D crsampler, sampler2D cbsampler, sampler2D asampler, vec2 texCoord )
{
const vec3 crc = vec3(1.595, -0.813, 0.0);
const vec3 crb = vec3(0.0, -0.391, 2.017);
const vec3 adj = vec3(-0.870, 0.529, -1.0816);

float Y = texture2D(ysampler, texCoord).x;
float cR = texture2D(crsampler, texCoord).x;
float cB = texture2D(cbsampler, texCoord).x;
float A = texture2D(asampler, texCoord).x;

vec3 p = vec3(Y * 1.164, Y * 1.164, Y * 1.164);
p += crc * cR;
p += crb * cB;
p += adj;
vec4 color = vec4(p, A);

#ifdef PREMUL
//color.rgb *= color.a;	// Movies are all premult
#endif

return color;
}

vec4 SampleFromFileYRBDiscard( sampler2D ysampler, sampler2D crsampler, sampler2D cbsampler, sampler2D asampler, vec2 texCoord )
{
float A = texture2D(asampler, texCoord).x;

#ifndef NODISCARD
if(A <= 0.0)
discard;
#endif

const vec3 crc = vec3(1.595, -0.813, 0.0);
const vec3 crb = vec3(0.0, -0.391, 2.017);
const vec3 adj = vec3(-0.870, 0.529, -1.0816);

float Y = texture2D(ysampler, texCoord).x;
float cR = texture2D(crsampler, texCoord).x;
float cB = texture2D(cbsampler, texCoord).x;

vec3 p = vec3(Y * 1.164, Y * 1.164, Y * 1.164);
p += crc * cR;
p += crb * cB;
p += adj;
vec4 color = vec4(p, A);

#ifdef PREMUL
//color.rgb *= color.a;	// Movies are all premult
#endif

return color;
}

uniform sampler2D TextureSampler;

void main()
{
vec4 mycolor = v_Color;
// Look up the texture color.
vec4 tex = SampleFromFileDiscard(TextureSampler, v_TexCoord.xy);

mycolor.rgb *= mycolor.a;
tex.rgb = mix( vec3(0.5, 0.5, 0.5), tex.rgb, mycolor.rgb);

gl_FragColor = tex;
}
