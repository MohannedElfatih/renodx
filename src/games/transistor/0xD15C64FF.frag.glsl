#define UBERINDEX0
#define UBERINDEX1
#define UBERINDEX2
#define UBERINDEX3
#define UBERINDEX4
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

varying float v_Ambient;
varying float v_Diffuse;
varying float v_Directionality;
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

// Helper functions for lighting in fragment shaders

// Lighting data is packed like this to reduce the number of SetValue calls
// Light Data format:
//
// vec3 Ambient;
// float buffer;
// struct Light
// {
//		vec3	Pos;
//		float	Radius;
//		vec3	Color;
//		float	buffer;
// } [4]; (32 floats, 8 vec4s)

uniform vec4 u_LightData[9];

// From http://imdoingitwrong.wordpress.com/2011/01/31/light-attenuation/
vec3 DiffuseLightIntensity(vec3 P, vec3 N, vec3 lightPos, float lightRadius, vec3 lightColor, float directionality )
{
const float cutoff = 0.005;

vec3 L = lightPos - P;
float d = length(L);
L /= d;
float attenuation = lightRadius / (lightRadius + d);
attenuation *= attenuation;

// scale and bias attenuation such that:
//   attenuation == 0 at extent of max influence
//   attenuation == 1 when d == 0
attenuation = (attenuation - cutoff) / (1.0 - cutoff);

// calculate directionality
directionality = dot(L,N) * directionality + (1.0 - directionality);

return lightColor * max(directionality * attenuation, 0.0);
}

float rand(vec3 seed)
{
return fract(sin(dot(seed ,vec3(12.9898,78.233, 157.3681))) * 43758.5453);
}

vec3 CalculateLightColor( vec3 pos, vec3 normal, float ambient, float diffuse, float directionality )
{
vec3 diffuseColor = vec3(0,0,0);
#ifdef UBERINDEX1
diffuseColor += DiffuseLightIntensity(pos, normal, u_LightData[1].xyz, u_LightData[1].w, u_LightData[2].rgb, directionality );
#endif
#ifdef UBERINDEX2
diffuseColor += DiffuseLightIntensity(pos, normal, u_LightData[3].xyz, u_LightData[3].w, u_LightData[4].rgb, directionality );
#endif
#ifdef UBERINDEX3
diffuseColor += DiffuseLightIntensity(pos, normal, u_LightData[5].xyz, u_LightData[5].w, u_LightData[6].rgb, directionality );
#endif
#ifdef UBERINDEX4
diffuseColor += DiffuseLightIntensity(pos, normal, u_LightData[7].xyz, u_LightData[7].w, u_LightData[8].rgb, directionality );
#endif

vec3 ambientColor = mix( vec3(1,1,1), u_LightData[0].xyz, ambient );
vec3 lightColor = ambientColor + (diffuseColor * diffuse);

//lightColor = min(lightColor, 1.0);	// Clamp light effect

float randFac = (rand(pos) - 0.5) / 257.0;	// + / - just under one half color to avoid changing black to non-black
lightColor += randFac;

return lightColor;
}

void main()
{
vec4 color = SampleFromFileTintedDiscard( TextureSampler, v_TexCoord, v_Color );
vec3 lightColor = CalculateLightColor( v_Position, v_Normal, v_Ambient, v_Diffuse, v_Directionality );
// color.rgb = min(color.rgb * lightColor, color.a);
color.rgb = color.rgb * lightColor;
gl_FragColor = color;
}
