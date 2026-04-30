#include "./common.hlsl"

#version 450

struct CommonPerMeshUniforms
{
    vec2 viewSize;
    vec4 frag[12];
};

struct UniformBuffer
{
    CommonPerMeshUniforms mpCommonPerMesh;
};

layout(set = 0, binding = 0, std140) uniform lUniforms_BLK
{
    UniformBuffer lUniforms;
} _122;

layout(set = 1, binding = 0) uniform sampler2D gDiffuseMap;

layout(location = 0) in VertexBlock
{
    vec2 mTexCoordsVec2;
    vec2 mPosVec2;
} In;

layout(location = 0) out vec4 out_color0;

void main()
{
    do
    {
        vec3 _515 = vec3(In.mPosVec2, 1.0);
        vec2 _524 = fma(-(abs((mat3(vec3(_122.lUniforms.mpCommonPerMesh.frag[0].xyz), vec3(_122.lUniforms.mpCommonPerMesh.frag[1].xyz), vec3(_122.lUniforms.mpCommonPerMesh.frag[2].xyz)) * _515).xy) - _122.lUniforms.mpCommonPerMesh.frag[8].xy), _122.lUniforms.mpCommonPerMesh.frag[8].zw, vec2(0.5));
        float _531 = clamp(_524.x, 0.0, 1.0) * clamp(_524.y, 0.0, 1.0);
        float _546 = min(1.0, (1.0 - abs(fma(In.mTexCoordsVec2.x, 2.0, -1.0))) * _122.lUniforms.mpCommonPerMesh.frag[10].x) * min(1.0, In.mTexCoordsVec2.y);
        int _181 = int(_122.lUniforms.mpCommonPerMesh.frag[10].w);
        vec4 _599;
        if (_181 == 4)
        {
            if (_546 < _122.lUniforms.mpCommonPerMesh.frag[10].y)
            {
                discard;
            }
            out_color0 = _122.lUniforms.mpCommonPerMesh.frag[6] * (_546 * _531);
            break;
        }
        else
        {
            if (_181 == 1)
            {
                vec4 _258 = texture(gDiffuseMap, (mat3(vec3(_122.lUniforms.mpCommonPerMesh.frag[3].xyz), vec3(_122.lUniforms.mpCommonPerMesh.frag[4].xyz), vec3(_122.lUniforms.mpCommonPerMesh.frag[5].xyz)) * _515).xy / _122.lUniforms.mpCommonPerMesh.frag[9].xy);
                int _262 = int(_122.lUniforms.mpCommonPerMesh.frag[10].z);
                vec4 _596;
                if (_262 == 1)
                {
                    float _269 = _258.w;
                    _596 = vec4(_258.xyz * _269, _269);
                }
                else
                {
                    _596 = _258;
                }
                vec4 _597;
                if (_262 == 2)
                {
                    _597 = vec4(_596.x);
                }
                else
                {
                    _597 = _596;
                }
                vec4 _289 = _597 * _122.lUniforms.mpCommonPerMesh.frag[6];
                vec4 _598;
                if (_122.lUniforms.mpCommonPerMesh.frag[11].z != 0.0)
                {
                    float _299 = clamp(_122.lUniforms.mpCommonPerMesh.frag[11].z, 0.0, 1.0);
                    vec3 _326 = (vec3(fma(_289.z, 0.072200000286102294921875, fma(_289.x, 0.2125999927520751953125, _289.y * 0.715200006961822509765625))) * _299) + (_289.xyz * (1.0 - _299));
                    vec4 _584 = _289;
                    _584.x = _326.x;
                    _584.y = _326.y;
                    _584.z = _326.z;
                    _598 = _584;
                }
                else
                {
                    _598 = _289;
                }
                _599 = _598 * (_546 * _531);
            }
            else
            {
                vec4 _600;
                if (_181 == 3)
                {
                    vec4 _350 = texture(gDiffuseMap, In.mTexCoordsVec2);
                    int _353 = int(_122.lUniforms.mpCommonPerMesh.frag[10].z);
                    vec4 _594;
                    if (_353 == 1)
                    {
                        float _360 = _350.w;
                        _594 = vec4(_350.xyz * _360, _360);
                    }
                    else
                    {
                        _594 = _350;
                    }
                    vec4 _595;
                    if (_353 == 2)
                    {
                        _595 = vec4(_594.x);
                    }
                    else
                    {
                        _595 = _594;
                    }
                    _600 = (_595 * _531) * _122.lUniforms.mpCommonPerMesh.frag[6];
                }
                else
                {
                    vec4 _601;
                    if (_181 == 0)
                    {
                        vec2 _559 = abs((mat3(vec3(_122.lUniforms.mpCommonPerMesh.frag[3].xyz), vec3(_122.lUniforms.mpCommonPerMesh.frag[4].xyz), vec3(_122.lUniforms.mpCommonPerMesh.frag[5].xyz)) * _515).xy) - (_122.lUniforms.mpCommonPerMesh.frag[9].xy - vec2(_122.lUniforms.mpCommonPerMesh.frag[9].z));
                        _601 = mix(_122.lUniforms.mpCommonPerMesh.frag[6], _122.lUniforms.mpCommonPerMesh.frag[7], vec4(clamp(fma(_122.lUniforms.mpCommonPerMesh.frag[9].w, 0.5, (min(max(_559.x, _559.y), 0.0) + length(max(_559, vec2(0.0)))) - _122.lUniforms.mpCommonPerMesh.frag[9].z) / _122.lUniforms.mpCommonPerMesh.frag[9].w, 0.0, 1.0))) * (_546 * _531);
                    }
                    else
                    {
                        _601 = mix(vec4(0.5), vec4(1.0), bvec4(_181 == 2));
                    }
                    _600 = _601;
                }
                _599 = _600;
            }
        }
        if (_546 < _122.lUniforms.mpCommonPerMesh.frag[10].y)
        {
            discard;
        }
        out_color0 = _599;
        break;
    } while(false);

    // out_color0.rgb = renodx::color::pq::EncodeSafe(out_color0.rgb, RENODX_GRAPHICS_WHITE_NITS);
}

