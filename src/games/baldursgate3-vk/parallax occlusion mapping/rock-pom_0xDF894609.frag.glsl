#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_spirv_intrinsics : require

vec4 _114;

layout(set = 0, binding = 2, std140) uniform _22_13
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    float _m3;
    float _m4;
    vec2 _m5;
    vec3 _m6;
    int _m7;
} _13;

layout(set = 1, binding = 0, std140) uniform _23_15
{
    layout(row_major) mat4 _m0;
    uint _m1;
    uint _m2;
    uint _m3;
    uint _m4;
} _15;

layout(set = 1, binding = 1, std140) uniform _24_16
{
    vec3 _m0;
    float _m1;
    vec3 _m2;
    float _m3;
    vec3 _m4;
    float _m5;
    vec3 _m6;
    float _m7;
    vec3 _m8;
    float _m9;
    vec3 _m10;
    float _m11;
    vec3 _m12;
    float _m13;
    vec3 _m14;
    float _m15;
    float _m16;
    float _m17;
    float _m18;
    float _m19;
} _16;

layout(set = 0, binding = 7) uniform sampler _14;
layout(set = 1, binding = 2) uniform texture2D _17;
layout(set = 1, binding = 3) uniform texture2D _18;
layout(set = 1, binding = 4) uniform texture2D _19;
layout(set = 1, binding = 5) uniform texture2D _20;
layout(set = 1, binding = 6) uniform texture2D _21;

layout(location = 0) in vec2 _3;
layout(location = 1) in vec3 _4;
layout(location = 2) in vec3 _5;
layout(location = 3) in vec3 _6;
layout(location = 4) in vec3 _7;
layout(location = 5) in vec4 _8;
layout(location = 0) out vec4 _9;
layout(location = 1) out vec4 _10;
layout(location = 2) out vec4 _11;
layout(location = 3) out vec4 _12;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    mat3 _122 = mat3(_6, _4, _5);
    vec3 _126 = normalize(normalize(-_7) * _122);
    vec2 _135 = vec2(_126.x, -_126.z);
    vec2 _138 = _3 + (_135 * fma(texture(sampler2D(_17, _14), _3).w, -0.04500000178813934326171875, -0.04500000178813934326171875));
    vec4 _141 = texture(sampler2D(_18, _14), _138);
    vec3 _144 = (_141.wzy * 2.0) - vec3(1.0);
    vec4 _145 = vec4(_144.x, _144.y, _144.z, _141.x);
    _145.z = -_144.z;
    float _161 = mix(_16._m1, _16._m3, _8.x);
    vec4 _167 = texture(sampler2D(_20, _14), _138);
    vec3 _170 = (_167.wzy * 2.0) - vec3(1.0);
    vec4 _171 = vec4(_170.x, _170.y, _170.z, _167.x);
    _171.z = -_170.z;
    vec3 _191 = normalize(_122 * normalize(fma(normalize(_171.xyz).xyz, vec3(1.0, 0.0, 1.0), mix(normalize(_145.xyz).xyz, vec3(0.0, 1.0, 0.0), vec3(texture(sampler2D(_19, _14), _138).y * _161))))) * mat3(_13._m0[0].xyz, _13._m0[1].xyz, _13._m0[2].xyz);
    float _194 = _8.x * _16._m5;
    vec3 _199 = vec3(_194);
    float _214 = (1.0 - _8.x) * _16._m11;
    float _215 = mix(mix(_16._m7, _16._m9, _194), 2.0, _214);
    vec2 _221 = _3 + (_135 * fma(texture(sampler2D(_17, _14), _3).w, -0.04500000178813934326171875, -0.04500000178813934326171875));
    vec4 _224 = texture(sampler2D(_21, _14), _221);
    vec4 _234 = texture(sampler2D(_19, _14), _221);
    float _235 = _234.y;
    vec3 _241 = vec3(clamp(mix(_215 * _224.w, (texture(sampler2D(_19, _14), _221).x * _235) * (_235 * _215), _161), 0.0, 1.0));
    vec3 _247 = vec3(_214);
    vec3 _280 = vec3(clamp(pow(spvNMax(abs(_224.x), 9.9999997473787516355514526367188e-05), mix(mix(_16._m16, _16._m17, _194), 1.5, _214)), 0.0, 1.0));
    vec4 _285 = texture(sampler2D(_17, _14), _221);
    float _286 = _285.y;
    vec2 _311 = _3 + (_135 * fma(texture(sampler2D(_17, _14), _3).w, -0.04500000178813934326171875, -0.04500000178813934326171875));
    vec2 _330 = (((_191.xy / vec2(1.0 - _191.z)) * vec2(0.562524616718292236328125)) * 0.5) + vec2(0.5);
    vec3 _332 = clamp(mix((mix(mix(mix(mix(_16._m0, _16._m2, _199), mix(_16._m4, _16._m6, _199), _241), mix(vec3(0.4368127882480621337890625, 0.4995053112506866455078125, 0.5234432220458984375), vec3(0.259027302265167236328125, 0.3537409007549285888671875, 0.3736149966716766357421875), _241), vec3(_161)), mix(vec3(0.25084018707275390625, 0.598941802978515625, 0.827725827693939208984375), vec3(0.932276785373687744140625, 0.5542271137237548828125, 0.18354900181293487548828125), _241), _247) * mix(_224.y, 1.0, _161)) * fma(-_224.z, mix(mix(_16._m13, _16._m15, _194), 0.5, _214), 1.0), mix(mix(mix(_16._m8, _16._m10, _199), mix(_16._m12, _16._m14, _199), _280), mix(vec3(0.35865390300750732421875, 0.0414518900215625762939453125, 0.0342301987111568450927734375), vec3(0.4045408070087432861328125, 0.470440208911895751953125, 0.3111805021762847900390625), _280), _247) * (_286 * _285.z), vec3(mix(_286, 1.0 - _235, _161))), vec3(0.0), vec3(1.0));
    vec4 _333 = vec4(_332.x, _332.y, _332.z, _114.w);
    _333.w = pow(spvNMax(abs(texture(sampler2D(_17, _14), _3 + (_135 * fma(texture(sampler2D(_17, _14), _3).w, -0.04500000178813934326171875, -0.04500000178813934326171875))).x), 9.9999997473787516355514526367188e-05), 2.0);
    _9 = vec4(_330.x, _330.y, vec4(0.0).z, vec4(0.0).w);
    _10 = _333;
    _11 = vec4(clamp(mix(0.89999997615814208984375, 0.0, mix(texture(sampler2D(_17, _14), _311).y, 1.0 - texture(sampler2D(_19, _14), _311).y, _161)), 0.0, 1.0), 0.5, 0.0, float((0u | ((_15._m2 & 7u) << 4u)) | 0u) * 0.0039215688593685626983642578125);
    _12 = vec4(0.0);
}

