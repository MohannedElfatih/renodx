

[[vk::binding(4, 0)]]
cbuffer _13_5 : register(b4, space0)
{
    float2 _5_m0 : packoffset(c0);
    float2 _5_m1 : packoffset(c0.z);
    uint2 _5_m2 : packoffset(c1);
    uint2 _5_m3 : packoffset(c1.z);
    uint2 _5_m4 : packoffset(c2);
    uint _5_m5 : packoffset(c2.z);
    uint _5_m6 : packoffset(c2.w);
    float2 _5_m7 : packoffset(c3);
    float2 _5_m8 : packoffset(c3.z);
    float2 _5_m9 : packoffset(c4);
    float2 _5_m10 : packoffset(c4.z);
    float2 _5_m11 : packoffset(c5);
    float2 _5_m12 : packoffset(c5.z);
    float2 _5_m13 : packoffset(c6);
    float2 _5_m14 : packoffset(c6.z);
    float2 _5_m15 : packoffset(c7);
    float2 _5_m16 : packoffset(c7.z);
    uint2 _5_m17 : packoffset(c8);
    uint2 _5_m18 : packoffset(c8.z);
    uint2 _5_m19 : packoffset(c9);
    uint2 _5_m20 : packoffset(c9.z);
    float2 _5_m21 : packoffset(c10);
    float2 _5_m22 : packoffset(c10.z);
};

[[vk::binding(0, 1)]]
RWByteAddressBuffer _6 : register(u0, space1);
[[vk::binding(1, 1)]]
RWByteAddressBuffer _7 : register(u1, space1);
[[vk::binding(3, 1)]]
ByteAddressBuffer _9 : register(t3, space1);
[[vk::binding(5, 1)]]
cbuffer _18_11 : register(b5, space1)
{
    float2 _11_m0 : packoffset(c0);
    uint2 _11_m1 : packoffset(c0.z);
};

[[vk::binding(2, 1)]]
Texture2D<float4> _8 : register(t2, space1);
[[vk::binding(4, 1)]]
SamplerState _10 : register(s4, space1);
[[vk::binding(6, 1)]]
RWTexture2D<float> _12 : register(u6, space1);

static uint3 gl_WorkGroupID = (uint3)0;
static uint gl_LocalInvocationIndex = (uint)0;
struct SPIRV_Cross_Input
{
    uint3 gl_WorkGroupID : SV_GroupID;
    uint gl_LocalInvocationIndex : SV_GroupIndex;
};

groupshared uint _80[256];

void comp_main()
{
    uint2 _92 = _5_m4 / uint2(8u, 8u);
    uint2 _97 = (gl_WorkGroupID.xy << (uint2(4u, 4u) & uint2(31u, 31u))) + ((_5_m3 / uint2(8u, 8u)) * uint2(8u, 8u));
    uint _98 = gl_LocalInvocationIndex >> 4u;
    uint _101 = gl_LocalInvocationIndex & 15u;
    uint2 _114 = uint2(_97.x + (((_98 & 1u) << 3u) | ((_101 & 3u) << 1u)), _97.y + (((_98 >> 1u) << 3u) | ((_101 >> 2u) << 1u)));
    uint2 _116 = _114 >> (uint2(3u, 3u) & uint2(31u, 31u));
    uint _199;
    [branch]
    if ((_5_m2.x > 1u) && (_5_m2.y > 1u))
    {
        uint4 _146 = uint4(1u, 1u, 1u, 1u) << ((uint4(round(_8.GatherAlpha(_10, float2(max((_5_m3 + uint2(1u, 1u)), min(_5_m4, (_114 + uint2(1u, 1u))))) * _11_m0) * 255.0f)) & uint4(7u, 7u, 7u, 7u)) & uint4(31u, 31u, 31u, 31u));
        uint2 _149 = _146.xy | _146.zw;
        uint _152 = _149.x | _149.y;
        _80[gl_LocalInvocationIndex] = _152;
        _199 = _152;
    }
    else
    {
        uint _197 = (((0u | (1u << ((uint(_8.Load(int3(max(_5_m3, min(_5_m4, _114)), 0u)).w * 255.0f) & 7u) & 31u))) | (1u << ((uint(_8.Load(int3(max(_5_m3, min(_5_m4, (_114 + uint2(0u, 1u)))), 0u)).w * 255.0f) & 7u) & 31u))) | (1u << ((uint(_8.Load(int3(max(_5_m3, min(_5_m4, (_114 + uint2(1u, 0u)))), 0u)).w * 255.0f) & 7u) & 31u))) | (1u << ((uint(_8.Load(int3(max(_5_m3, min(_5_m4, (_114 + uint2(1u, 1u)))), 0u)).w * 255.0f) & 7u) & 31u));
        _80[gl_LocalInvocationIndex] = _197;
        _199 = _197;
    }
    GroupMemoryBarrierWithGroupSync();
    uint _216;
    if (_101 < 4u)
    {
        uint _205 = _80[gl_LocalInvocationIndex + 4u];
        uint _208 = _80[gl_LocalInvocationIndex + 8u];
        uint _212 = _80[gl_LocalInvocationIndex + 12u];
        uint _214 = _199 | ((_205 | _208) | _212);
        _80[gl_LocalInvocationIndex] = _214;
        _216 = _214;
    }
    else
    {
        _216 = _199;
    }
    GroupMemoryBarrierWithGroupSync();
    if ((_101 == 0u) && all(bool2(_116.x <= _92.x, _116.y <= _92.y)))
    {
        uint _232 = _216 | ((_80[gl_LocalInvocationIndex + 1u] | _80[gl_LocalInvocationIndex + 2u]) | _80[gl_LocalInvocationIndex + 3u]);
        uint _234 = _9.Load(_232 * 4 + 0);
        _12[_116] = float((_232 & 32u) != 0u);
        if (_234 > 0u)
        {
            uint _242 = _234 - 1u;
            uint _246;
            _6.InterlockedAdd(((_242 * 12u) >> 2u) * 4 + 0, 1u, _246);
            _7.Store(((((_242 & 1u) != 0u) ? (((_11_m1.x * _11_m1.y) - 1u) - _246) : _246) + (((_242 >> 1u) * _11_m1.x) * _11_m1.y)) * 4 + 0, _116.x | (_116.y << 16u));
        }
    }
}

[numthreads(8, 8, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_WorkGroupID = stage_input.gl_WorkGroupID;
    gl_LocalInvocationIndex = stage_input.gl_LocalInvocationIndex;
    comp_main();
}

