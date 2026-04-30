

[[vk::binding(4, 0)]]
cbuffer _10_6 : register(b4, space0)
{
    float2 _6_m0 : packoffset(c0);
    float2 _6_m1 : packoffset(c0.z);
    uint2 _6_m2 : packoffset(c1);
    uint2 _6_m3 : packoffset(c1.z);
    uint2 _6_m4 : packoffset(c2);
    uint _6_m5 : packoffset(c2.z);
    uint _6_m6 : packoffset(c2.w);
    float2 _6_m7 : packoffset(c3);
    float2 _6_m8 : packoffset(c3.z);
    float2 _6_m9 : packoffset(c4);
    float2 _6_m10 : packoffset(c4.z);
    float2 _6_m11 : packoffset(c5);
    float2 _6_m12 : packoffset(c5.z);
    float2 _6_m13 : packoffset(c6);
    float2 _6_m14 : packoffset(c6.z);
    float2 _6_m15 : packoffset(c7);
    float2 _6_m16 : packoffset(c7.z);
    uint2 _6_m17 : packoffset(c8);
    uint2 _6_m18 : packoffset(c8.z);
    uint2 _6_m19 : packoffset(c9);
    uint2 _6_m20 : packoffset(c9.z);
    float2 _6_m21 : packoffset(c10);
    float2 _6_m22 : packoffset(c10.z);
};

[[vk::binding(0, 1)]]
Texture2D<float4> _7 : register(t0, space1);
[[vk::binding(1, 1)]]
Texture2D<uint4> _8 : register(t1, space1);
[[vk::binding(2, 1)]]
RWTexture2D<float4> _9 : register(u2, space1);

static uint3 gl_WorkGroupID = (uint3)0;
static uint3 gl_LocalInvocationID = (uint3)0;
static uint3 gl_GlobalInvocationID = (uint3)0;
struct SPIRV_Cross_Input
{
    uint3 gl_WorkGroupID : SV_GroupID;
    uint3 gl_LocalInvocationID : SV_GroupThreadID;
    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
};

groupshared uint _61[19][19];
groupshared float4 _62[19][19];

void comp_main()
{
    do
    {
        uint _72;
        _72 = gl_LocalInvocationID.x;
        for (; _72 < 19u; _72 += 16u)
        {
            for (uint _80 = gl_LocalInvocationID.y; _80 < 19u; )
            {
                int2 _105 = int3(int2(clamp(uint2(int2(((gl_WorkGroupID.xy * uint2(16u, 16u)) + uint2(4294967295u, 4294967295u)) + uint2(int2(int(_72), int(_80))))) + _6_m3, _6_m3, _6_m4)), 0).xy;
                _61[_72][_80] = _8.Load(int3(_105, 0)).y;
                _62[_72][_80] = _7.Load(int3(_105, 0));
                _80 += 16u;
                continue;
            }
        }
        GroupMemoryBarrierWithGroupSync();
        int2 _117 = int2(gl_GlobalInvocationID.xy + _6_m3);
        int2 _118 = int2(_6_m3);
        int2 _123 = int2(_6_m4);
        if (!(all(bool2(_117.x >= _118.x, _117.y >= _118.y)) && all(bool2(_117.x <= _123.x, _117.y <= _123.y))))
        {
            break;
        }
        uint _130 = gl_LocalInvocationID.x + 1u;
        uint _132 = gl_LocalInvocationID.y + 1u;
        [branch]
        if (!(((_61[_130][_132] >> 4u) & 1u) == 0u))
        {
            _9[uint2(_117)] = _62[_130][_132];
            break;
        }
        else
        {
            uint _143;
            uint _146;
            float4 _148;
            float4 _150;
            _143 = 0u;
            _146 = 0u;
            _148 = float4(1.0f, 1.0f, 1.0f, 0.0f);
            _150 = float4(1.0f, 1.0f, 1.0f, 0.0f);
            uint _144;
            uint _147;
            float4 _149;
            float4 _151;
            for (int _152 = 0; _152 < 4; _143 = _144, _146 = _147, _148 = _149, _150 = _151, _152++)
            {
                _149 = _148;
                _151 = _150;
                _147 = _146;
                _144 = _143;
                uint _161;
                uint _162;
                float4 _158;
                float4 _160;
                for (int _163 = 0; _163 < 4; _149 = _158, _151 = _160, _147 = _161, _144 = _162, _163++)
                {
                    uint _169 = gl_LocalInvocationID.x + uint(_152);
                    uint _171 = gl_LocalInvocationID.y + uint(_163);
                    _162 = _144 + (1u - ((_61[_169][_171] >> 4u) & 1u));
                    uint _179 = (_61[_169][_171] >> 5u) & 1u;
                    _161 = _147 + _179;
                    if ((((_152 != 3) && (_163 != 3)) || (_151.w == 0.0f)) || (_149.w == 0.0f))
                    {
                        float4 _208;
                        float4 _209;
                        if (_179 != 0u)
                        {
                            float3 _204 = _151.xyz * _62[_169][_171].xyz;
                            float4 _205 = float4(_204.x, _204.y, _204.z, _151.w);
                            _205.w = _151.w + 1.0f;
                            _208 = _149;
                            _209 = _205;
                        }
                        else
                        {
                            float3 _199 = _149.xyz * _62[_169][_171].xyz;
                            float4 _200 = float4(_199.x, _199.y, _199.z, _149.w);
                            _200.w = _149.w + 1.0f;
                            _208 = _200;
                            _209 = _151;
                        }
                        _158 = _208;
                        _160 = _209;
                    }
                    else
                    {
                        _158 = _149;
                        _160 = _151;
                    }
                }
            }
            if ((_150.w == 0.0f) || (_148.w == 0.0f))
            {
                _9[uint2(_117)] = _62[_130][_132];
                break;
            }
            float3 _225 = pow(abs(_150.xyz), (1.0f / _150.w).xxx);
            float3 _231 = pow(abs(_148.xyz), (1.0f / _148.w).xxx);
            float _235 = float(_146) / float(_143);
            float4 _255;
            float4 _256;
            if (((_61[_130][_132] >> 5u) & 1u) == 1u)
            {
                float3 _253 = lerp(_225.xyz, _62[_130][_132].xyz, _235.xxx);
                _255 = float4(_253.x, _253.y, _253.z, _150.w);
                _256 = float4(_231.x, _231.y, _231.z, _148.w);
            }
            else
            {
                float3 _248 = lerp(_231.xyz, _62[_130][_132].xyz, _235.xxx);
                _255 = float4(_225.x, _225.y, _225.z, _150.w);
                _256 = float4(_248.x, _248.y, _248.z, _148.w);
            }
            _9[uint2(_117)] = float4(lerp(_256.xyz, _255.xyz, _235.xxx), _62[_130][_132].w);
            break;
        }
        break; // unreachable workaround
    } while(false);
}

[numthreads(16, 16, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_WorkGroupID = stage_input.gl_WorkGroupID;
    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
    comp_main();
}

