#version 450
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

layout(set = 0, binding = 4, std140) uniform _8_4
{
    vec2 _m0;
    vec2 _m1;
    uvec2 _m2;
    uvec2 _m3;
    uvec2 _m4;
    uint _m5;
    uint _m6;
    vec2 _m7;
    vec2 _m8;
    vec2 _m9;
    vec2 _m10;
    vec2 _m11;
    vec2 _m12;
    vec2 _m13;
    vec2 _m14;
    vec2 _m15;
    vec2 _m16;
    uvec2 _m17;
    uvec2 _m18;
    uvec2 _m19;
    uvec2 _m20;
    vec2 _m21;
    vec2 _m22;
} _4;

layout(set = 1, binding = 0) uniform texture2D _5;
layout(set = 1, binding = 1, r32f) uniform writeonly image2D _6;
layout(set = 1, binding = 2, r32f) uniform writeonly image2D _7;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    uvec2 _48 = gl_GlobalInvocationID.xy + _4._m3;
    if (all(greaterThanEqual(_48, _4._m3)) && all(lessThanEqual(_48, _4._m4)))
    {
        uvec2 _58 = _48 * uvec2(2u);
        float _128;
        if (all(greaterThanEqual(_58, _4._m17)) && all(lessThanEqual(_58, _4._m18)))
        {
            uvec2 _70 = _48 * uvec2(4u);
            float _86;
            if (all(greaterThanEqual(_70, _4._m19)) && all(lessThanEqual(_70, _4._m20)))
            {
                _86 = spvNMax(0.0, texelFetch(_5, ivec2(_70), int(0u)).x);
            }
            else
            {
                _86 = 0.0;
            }
            uvec2 _87 = _70 + uvec2(1u, 0u);
            float _99;
            if (all(greaterThanEqual(_87, _4._m19)) && all(lessThanEqual(_87, _4._m20)))
            {
                _99 = spvNMax(_86, texelFetch(_5, ivec2(_87), int(0u)).x);
            }
            else
            {
                _99 = _86;
            }
            uvec2 _100 = _70 + uvec2(0u, 1u);
            float _112;
            if (all(greaterThanEqual(_100, _4._m19)) && all(lessThanEqual(_100, _4._m20)))
            {
                _112 = spvNMax(_99, texelFetch(_5, ivec2(_100), int(0u)).x);
            }
            else
            {
                _112 = _99;
            }
            uvec2 _113 = _70 + uvec2(1u);
            float _125;
            if (all(greaterThanEqual(_113, _4._m19)) && all(lessThanEqual(_113, _4._m20)))
            {
                _125 = spvNMax(_112, texelFetch(_5, ivec2(_113), int(0u)).x);
            }
            else
            {
                _125 = _112;
            }
            imageStore(_6, ivec2(_58), vec4(_125));
            _128 = spvNMax(0.0, _125);
        }
        else
        {
            _128 = 0.0;
        }
        uvec2 _129 = _58 + uvec2(1u, 0u);
        float _195;
        if (all(greaterThanEqual(_129, _4._m17)) && all(lessThanEqual(_129, _4._m18)))
        {
            uvec2 _137 = _129 * uvec2(2u);
            float _153;
            if (all(greaterThanEqual(_137, _4._m19)) && all(lessThanEqual(_137, _4._m20)))
            {
                _153 = spvNMax(0.0, texelFetch(_5, ivec2(_137), int(0u)).x);
            }
            else
            {
                _153 = 0.0;
            }
            uvec2 _154 = _137 + uvec2(1u, 0u);
            float _166;
            if (all(greaterThanEqual(_154, _4._m19)) && all(lessThanEqual(_154, _4._m20)))
            {
                _166 = spvNMax(_153, texelFetch(_5, ivec2(_154), int(0u)).x);
            }
            else
            {
                _166 = _153;
            }
            uvec2 _167 = _137 + uvec2(0u, 1u);
            float _179;
            if (all(greaterThanEqual(_167, _4._m19)) && all(lessThanEqual(_167, _4._m20)))
            {
                _179 = spvNMax(_166, texelFetch(_5, ivec2(_167), int(0u)).x);
            }
            else
            {
                _179 = _166;
            }
            uvec2 _180 = _137 + uvec2(1u);
            float _192;
            if (all(greaterThanEqual(_180, _4._m19)) && all(lessThanEqual(_180, _4._m20)))
            {
                _192 = spvNMax(_179, texelFetch(_5, ivec2(_180), int(0u)).x);
            }
            else
            {
                _192 = _179;
            }
            imageStore(_6, ivec2(_129), vec4(_192));
            _195 = spvNMax(_128, _192);
        }
        else
        {
            _195 = _128;
        }
        uvec2 _196 = _58 + uvec2(0u, 1u);
        float _262;
        if (all(greaterThanEqual(_196, _4._m17)) && all(lessThanEqual(_196, _4._m18)))
        {
            uvec2 _204 = _196 * uvec2(2u);
            float _220;
            if (all(greaterThanEqual(_204, _4._m19)) && all(lessThanEqual(_204, _4._m20)))
            {
                _220 = spvNMax(0.0, texelFetch(_5, ivec2(_204), int(0u)).x);
            }
            else
            {
                _220 = 0.0;
            }
            uvec2 _221 = _204 + uvec2(1u, 0u);
            float _233;
            if (all(greaterThanEqual(_221, _4._m19)) && all(lessThanEqual(_221, _4._m20)))
            {
                _233 = spvNMax(_220, texelFetch(_5, ivec2(_221), int(0u)).x);
            }
            else
            {
                _233 = _220;
            }
            uvec2 _234 = _204 + uvec2(0u, 1u);
            float _246;
            if (all(greaterThanEqual(_234, _4._m19)) && all(lessThanEqual(_234, _4._m20)))
            {
                _246 = spvNMax(_233, texelFetch(_5, ivec2(_234), int(0u)).x);
            }
            else
            {
                _246 = _233;
            }
            uvec2 _247 = _204 + uvec2(1u);
            float _259;
            if (all(greaterThanEqual(_247, _4._m19)) && all(lessThanEqual(_247, _4._m20)))
            {
                _259 = spvNMax(_246, texelFetch(_5, ivec2(_247), int(0u)).x);
            }
            else
            {
                _259 = _246;
            }
            imageStore(_6, ivec2(_196), vec4(_259));
            _262 = spvNMax(_195, _259);
        }
        else
        {
            _262 = _195;
        }
        uvec2 _263 = _58 + uvec2(1u);
        float _329;
        if (all(greaterThanEqual(_263, _4._m17)) && all(lessThanEqual(_263, _4._m18)))
        {
            uvec2 _271 = _263 * uvec2(2u);
            float _287;
            if (all(greaterThanEqual(_271, _4._m19)) && all(lessThanEqual(_271, _4._m20)))
            {
                _287 = spvNMax(0.0, texelFetch(_5, ivec2(_271), int(0u)).x);
            }
            else
            {
                _287 = 0.0;
            }
            uvec2 _288 = _271 + uvec2(1u, 0u);
            float _300;
            if (all(greaterThanEqual(_288, _4._m19)) && all(lessThanEqual(_288, _4._m20)))
            {
                _300 = spvNMax(_287, texelFetch(_5, ivec2(_288), int(0u)).x);
            }
            else
            {
                _300 = _287;
            }
            uvec2 _301 = _271 + uvec2(0u, 1u);
            float _313;
            if (all(greaterThanEqual(_301, _4._m19)) && all(lessThanEqual(_301, _4._m20)))
            {
                _313 = spvNMax(_300, texelFetch(_5, ivec2(_301), int(0u)).x);
            }
            else
            {
                _313 = _300;
            }
            uvec2 _314 = _271 + uvec2(1u);
            float _326;
            if (all(greaterThanEqual(_314, _4._m19)) && all(lessThanEqual(_314, _4._m20)))
            {
                _326 = spvNMax(_313, texelFetch(_5, ivec2(_314), int(0u)).x);
            }
            else
            {
                _326 = _313;
            }
            imageStore(_6, ivec2(_263), vec4(_326));
            _329 = spvNMax(_262, _326);
        }
        else
        {
            _329 = _262;
        }
        imageStore(_7, ivec2(_48), vec4(_329));
    }
}

