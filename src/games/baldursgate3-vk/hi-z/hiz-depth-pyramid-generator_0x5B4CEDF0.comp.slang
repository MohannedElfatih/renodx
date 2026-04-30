
[[vk::binding(3, 0)]]
cbuffer _11_6 : register(b3, space0)
{
    float _6_m0 : packoffset(c0);
    float _6_m1 : packoffset(c0.y);
    float _6_m2 : packoffset(c0.z);
    float _6_m3 : packoffset(c0.w);
};

[[vk::binding(4, 0)]]
cbuffer _12_7 : register(b4, space0)
{
    float2 _7_m0 : packoffset(c0);
    float2 _7_m1 : packoffset(c0.z);
    uint2 _7_m2 : packoffset(c1);
    uint2 _7_m3 : packoffset(c1.z);
    uint2 _7_m4 : packoffset(c2);
    uint _7_m5 : packoffset(c2.z);
    uint _7_m6 : packoffset(c2.w);
    float2 _7_m7 : packoffset(c3);
    float2 _7_m8 : packoffset(c3.z);
    float2 _7_m9 : packoffset(c4);
    float2 _7_m10 : packoffset(c4.z);
    float2 _7_m11 : packoffset(c5);
    float2 _7_m12 : packoffset(c5.z);
    float2 _7_m13 : packoffset(c6);
    float2 _7_m14 : packoffset(c6.z);
    float2 _7_m15 : packoffset(c7);
    float2 _7_m16 : packoffset(c7.z);
    uint2 _7_m17 : packoffset(c8);
    uint2 _7_m18 : packoffset(c8.z);
    uint2 _7_m19 : packoffset(c9);
    uint2 _7_m20 : packoffset(c9.z);
    float2 _7_m21 : packoffset(c10);
    float2 _7_m22 : packoffset(c10.z);
};

[[vk::binding(2, 1)]]
RWByteAddressBuffer _10 : register(u2, space1);
[[vk::binding(0, 1)]]
Texture2D<float4> _8 : register(t0, space1);
RWTexture2D<float> _9[13] : register(u1, space1);

static uint3 gl_WorkGroupID = (uint3)0;
static uint gl_LocalInvocationIndex = (uint)0;
struct SPIRV_Cross_Input
{
    uint3 gl_WorkGroupID : SV_GroupID;
    uint gl_LocalInvocationIndex : SV_GroupIndex;
};

groupshared float _86[16][16];
groupshared uint _87;

void comp_main()
{
    uint _114 = uint((_6_m0 + 63.0f) * 0.015625f);
    uint _117 = uint((_6_m1 + 63.0f) * 0.015625f);
    uint _119 = 8u * _117;
    uint _126 = (_114 * gl_WorkGroupID.y) + gl_WorkGroupID.x;
    uint _128 = _126 % _119;
    uint _139;
    uint _140;
    if ((((_114 / 8u) * 8u) * _117) <= _126)
    {
        uint _134 = max(1u, (_114 % 8u));
        _139 = _128 % _134;
        _140 = _128 / _134;
    }
    else
    {
        _139 = _128 % 8u;
        _140 = _128 / 8u;
    }
    uint _144 = (((_126 / _119) * 8u) + (_140 * _114)) + _139;
    uint2 _147 = uint2(_144 % _114, _144 / _114);
    for (int _149 = 0; _149 < 16; )
    {
        int _157 = int(gl_LocalInvocationIndex + uint(256 * _149));
        uint2 _165 = uint2(int2((uint2(64u, 64u) * _147) + uint2(int2(_157 - 64 * (_157 / 64), _157 / 64))));
        _9[0][_165] = _8.Load(int3(_165, 0u)).x;
        _149++;
        continue;
    }
    uint2 _175 = uint2(float2(_6_m0, _6_m1));
    uint _183 = uint(1.0f + floor(log2(max(_6_m0, _6_m1))));
    do
    {
        uint2 _210;
        float2 _216;
        float2 _223;
        uint _235;
        int _236;
        uint _237;
        int _238;
        int2 _239;
        int2 _245;
        uint _186 = gl_LocalInvocationIndex % 64u;
        uint _202 = ((_186 & 1u) | (((_186 >> 2u) & 7u) & 4294967294u)) + (8u * ((gl_LocalInvocationIndex >> 6u) % 2u));
        uint _205 = ((((_186 >> 1u) & 3u) & 3u) | (((_186 >> 3u) & 7u) & 4294967292u)) + (8u * (gl_LocalInvocationIndex >> 7u));
        do
        {
            _210 = uint2(uint(_6_m0), uint(_6_m1));
            float2 _214 = float2(max(uint2(1u, 1u), (_210 >> (uint2(1u, 1u) & uint2(31u, 31u)))));
            _216 = _7_m1;
            _223 = _216 + float2(_7_m2);
            int4 _232 = int4(int2(floor(_216 * _214)), int2(ceil(_223 * _214)) - int2(1, 1));
            int2 _234 = int2(gl_WorkGroupID.xy * uint2(64u, 64u));
            _235 = _202 * 2u;
            _236 = int(_235);
            _237 = _205 * 2u;
            _238 = int(_237);
            _239 = int2(_236, _238);
            int2 _242 = int2(gl_WorkGroupID.xy * uint2(32u, 32u));
            int _243 = int(_202);
            int _244 = int(_205);
            _245 = int2(_243, _244);
            int2 _246 = _242 + _245;
            uint2 _247 = uint2(_234 + _239);
            float4 _275 = (((_8.Load(int3(uint2(int2(_247)), 0u)).x.xxxx + _8.Load(int3(uint2(int2(_247 + uint2(0u, 1u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_247 + uint2(1u, 0u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_247 + uint2(1u, 1u))), 0u)).x.xxxx) * 0.25f;
            int2 _276 = _232.xy;
            int2 _279 = _232.zw;
            if (all(bool2(_246.x >= _276.x, _246.y >= _276.y)) && all(bool2(_246.x <= _279.x, _246.y <= _279.y)))
            {
                _9[1u][uint2(_246)] = _275.x;
            }
            int _290 = int(_235 + 32u);
            int _294 = int(_202 + 16u);
            int2 _296 = _242 + int2(_294, _244);
            uint2 _297 = uint2(_234 + int2(_290, _238));
            float4 _324 = (((_8.Load(int3(uint2(int2(_297)), 0u)).x.xxxx + _8.Load(int3(uint2(int2(_297 + uint2(0u, 1u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_297 + uint2(1u, 0u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_297 + uint2(1u, 1u))), 0u)).x.xxxx) * 0.25f;
            if (all(bool2(_296.x >= _276.x, _296.y >= _276.y)) && all(bool2(_296.x <= _279.x, _296.y <= _279.y)))
            {
                _9[1u][uint2(_296)] = _324.x;
            }
            int _337 = int(_237 + 32u);
            int _341 = int(_205 + 16u);
            int2 _343 = _242 + int2(_243, _341);
            uint2 _344 = uint2(_234 + int2(_236, _337));
            float4 _371 = (((_8.Load(int3(uint2(int2(_344)), 0u)).x.xxxx + _8.Load(int3(uint2(int2(_344 + uint2(0u, 1u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_344 + uint2(1u, 0u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_344 + uint2(1u, 1u))), 0u)).x.xxxx) * 0.25f;
            if (all(bool2(_343.x >= _276.x, _343.y >= _276.y)) && all(bool2(_343.x <= _279.x, _343.y <= _279.y)))
            {
                _9[1u][uint2(_343)] = _371.x;
            }
            int2 _386 = _242 + int2(_294, _341);
            uint2 _387 = uint2(_234 + int2(_290, _337));
            float4 _414 = (((_8.Load(int3(uint2(int2(_387)), 0u)).x.xxxx + _8.Load(int3(uint2(int2(_387 + uint2(0u, 1u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_387 + uint2(1u, 0u))), 0u)).x.xxxx) + _8.Load(int3(uint2(int2(_387 + uint2(1u, 1u))), 0u)).x.xxxx) * 0.25f;
            if (all(bool2(_386.x >= _276.x, _386.y >= _276.y)) && all(bool2(_386.x <= _279.x, _386.y <= _279.y)))
            {
                _9[1u][uint2(_386)] = _414.x;
            }
            if (_183 <= 1u)
            {
                break;
            }
            float2 _432 = float2(max(uint2(1u, 1u), (_210 >> (uint2(2u, 2u) & uint2(31u, 31u)))));
            int4 _444 = int4(int2(floor(_216 * _432)), int2(ceil(_223 * _432)) - int2(1, 1));
            uint _446 = WaveGetLaneIndex() & 4294967292u;
            uint _447 = _446 | 1u;
            float4 _448 = WaveReadLaneAt(_275, _447);
            uint _449 = _446 | 2u;
            float4 _450 = WaveReadLaneAt(_275, _449);
            uint _451 = _446 | 3u;
            float4 _452 = WaveReadLaneAt(_275, _451);
            float4 _456 = (((_275 + _448) + _450) + _452) * 0.25f;
            float4 _457 = WaveReadLaneAt(_324, _447);
            float4 _458 = WaveReadLaneAt(_324, _449);
            float4 _459 = WaveReadLaneAt(_324, _451);
            float4 _463 = (((_324 + _457) + _458) + _459) * 0.25f;
            float4 _464 = WaveReadLaneAt(_371, _447);
            float4 _465 = WaveReadLaneAt(_371, _449);
            float4 _466 = WaveReadLaneAt(_371, _451);
            float4 _470 = (((_371 + _464) + _465) + _466) * 0.25f;
            float4 _471 = WaveReadLaneAt(_414, _447);
            float4 _472 = WaveReadLaneAt(_414, _449);
            float4 _473 = WaveReadLaneAt(_414, _451);
            float4 _477 = (((_414 + _471) + _472) + _473) * 0.25f;
            if ((gl_LocalInvocationIndex % 4u) == 0u)
            {
                int2 _483 = int2(gl_WorkGroupID.xy * uint2(16u, 16u));
                uint _484 = _202 / 2u;
                int _485 = int(_484);
                uint _486 = _205 / 2u;
                int _487 = int(_486);
                int2 _489 = _483 + int2(_485, _487);
                int2 _490 = _444.xy;
                int2 _493 = _444.zw;
                if (all(bool2(_489.x >= _490.x, _489.y >= _490.y)) && all(bool2(_489.x <= _493.x, _489.y <= _493.y)))
                {
                    _9[2u][uint2(_489)] = _456.x;
                }
                _86[_484][_486] = _456.x;
                uint _505 = _484 + 8u;
                int _506 = int(_505);
                int2 _508 = _483 + int2(_506, _487);
                if (all(bool2(_508.x >= _490.x, _508.y >= _490.y)) && all(bool2(_508.x <= _493.x, _508.y <= _493.y)))
                {
                    _9[2u][uint2(_508)] = _463.x;
                }
                _86[_505][_486] = _463.x;
                uint _522 = _486 + 8u;
                int _523 = int(_522);
                int2 _525 = _483 + int2(_485, _523);
                if (all(bool2(_525.x >= _490.x, _525.y >= _490.y)) && all(bool2(_525.x <= _493.x, _525.y <= _493.y)))
                {
                    _9[2u][uint2(_525)] = _470.x;
                }
                _86[_484][_522] = _470.x;
                int2 _540 = _483 + int2(_506, _523);
                if (all(bool2(_540.x >= _490.x, _540.y >= _490.y)) && all(bool2(_540.x <= _493.x, _540.y <= _493.y)))
                {
                    _9[2u][uint2(_540)] = _477.x;
                }
                _86[_505][_522] = _477.x;
            }
            break;
        } while(false);
        do
        {
            if (_183 <= 2u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _562 = float2(max(uint2(1u, 1u), (_210 >> (uint2(3u, 3u) & uint2(31u, 31u)))));
            int4 _574 = int4(int2(floor(_216 * _562)), int2(ceil(_223 * _562)) - int2(1, 1));
            float4 _577 = _86[_202][_205].xxxx;
            uint _579 = WaveGetLaneIndex() & 4294967292u;
            uint _580 = _579 | 1u;
            float4 _581 = WaveReadLaneAt(_577, _580);
            uint _582 = _579 | 2u;
            float4 _583 = WaveReadLaneAt(_577, _582);
            uint _584 = _579 | 3u;
            float4 _585 = WaveReadLaneAt(_577, _584);
            float4 _589 = (((_577 + _581) + _583) + _585) * 0.25f;
            bool _591 = (gl_LocalInvocationIndex % 4u) == 0u;
            if (_591)
            {
                uint _598 = _205 / 2u;
                int2 _601 = int2(gl_WorkGroupID.xy * uint2(8u, 8u)) + int2(int(_202 / 2u), int(_598));
                int2 _602 = _574.xy;
                int2 _605 = _574.zw;
                if (all(bool2(_601.x >= _602.x, _601.y >= _602.y)) && all(bool2(_601.x <= _605.x, _601.y <= _605.y)))
                {
                    _9[3u][uint2(_601)] = _589.x;
                }
                _86[_202 + (_598 % 2u)][_205] = _589.x;
            }
            if (_183 <= 3u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _625 = float2(max(uint2(1u, 1u), (_210 >> (uint2(4u, 4u) & uint2(31u, 31u)))));
            int4 _637 = int4(int2(floor(_216 * _625)), int2(ceil(_223 * _625)) - int2(1, 1));
            if (gl_LocalInvocationIndex < 64u)
            {
                float4 _645 = _86[_235 + (_205 % 2u)][_237].xxxx;
                float4 _646 = WaveReadLaneAt(_645, _580);
                float4 _647 = WaveReadLaneAt(_645, _582);
                float4 _648 = WaveReadLaneAt(_645, _584);
                float4 _652 = (((_645 + _646) + _647) + _648) * 0.25f;
                if (_591)
                {
                    uint _659 = _205 / 2u;
                    int2 _662 = int2(gl_WorkGroupID.xy * uint2(4u, 4u)) + int2(int(_202 / 2u), int(_659));
                    int2 _663 = _637.xy;
                    int2 _666 = _637.zw;
                    if (all(bool2(_662.x >= _663.x, _662.y >= _663.y)) && all(bool2(_662.x <= _666.x, _662.y <= _666.y)))
                    {
                        _9[4u][uint2(_662)] = _652.x;
                    }
                    _86[_235 + _659][_237] = _652.x;
                }
            }
            if (_183 <= 4u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _685 = float2(max(uint2(1u, 1u), (_210 >> (uint2(5u, 5u) & uint2(31u, 31u)))));
            int4 _697 = int4(int2(floor(_216 * _685)), int2(ceil(_223 * _685)) - int2(1, 1));
            if (gl_LocalInvocationIndex < 16u)
            {
                float4 _706 = _86[(_202 * 4u) + _205][_205 * 4u].xxxx;
                float4 _707 = WaveReadLaneAt(_706, _580);
                float4 _708 = WaveReadLaneAt(_706, _582);
                float4 _709 = WaveReadLaneAt(_706, _584);
                float4 _713 = (((_706 + _707) + _708) + _709) * 0.25f;
                if (_591)
                {
                    uint _718 = _202 / 2u;
                    int2 _723 = int2(gl_WorkGroupID.xy * uint2(2u, 2u)) + int2(int(_718), int(_205 / 2u));
                    int2 _724 = _697.xy;
                    int2 _727 = _697.zw;
                    if (all(bool2(_723.x >= _724.x, _723.y >= _724.y)) && all(bool2(_723.x <= _727.x, _723.y <= _727.y)))
                    {
                        _9[5u][uint2(_723)] = _713.x;
                    }
                    _86[_718 + _205][0u] = _713.x;
                }
            }
            if (_183 <= 5u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _746 = float2(max(uint2(1u, 1u), (_210 >> (uint2(6u, 6u) & uint2(31u, 31u)))));
            int4 _758 = int4(int2(floor(_216 * _746)), int2(ceil(_223 * _746)) - int2(1, 1));
            if (gl_LocalInvocationIndex < 4u)
            {
                float4 _764 = _86[gl_LocalInvocationIndex][0u].xxxx;
                float4 _765 = WaveReadLaneAt(_764, _580);
                float4 _766 = WaveReadLaneAt(_764, _582);
                float4 _767 = WaveReadLaneAt(_764, _584);
                if (_591)
                {
                    int2 _774 = int2(gl_WorkGroupID.xy);
                    int2 _775 = _758.xy;
                    int2 _778 = _758.zw;
                    if (all(bool2(_774.x >= _775.x, _774.y >= _775.y)) && all(bool2(_774.x <= _778.x, _774.y <= _778.y)))
                    {
                        _9[6u][uint2(_774)] = ((((_764 + _765) + _766) + _767) * 0.25f).x;
                    }
                }
            }
            break;
        } while(false);
        if (_183 <= 6u)
        {
            break;
        }
        if (gl_LocalInvocationIndex == 0u)
        {
            uint _795;
            _10.InterlockedAdd(0, 1u, _795);
            _87 = (_795);
        }
        GroupMemoryBarrierWithGroupSync();
        if (_87 != ((((_175.x + 63u) / 64u) * ((_175.y + 63u) / 64u)) - 1u))
        {
            break;
        }
        uint _836;
        uint _838;
        do
        {
            float2 _807 = float2(max(uint2(1u, 1u), (_210 >> (uint2(6u, 6u) & uint2(31u, 31u)))));
            int4 _819 = int4(int2(floor(_216 * _807)), int2(ceil(_223 * _807)) - int2(1, 1));
            float2 _823 = float2(max(uint2(1u, 1u), (_210 >> (uint2(7u, 7u) & uint2(31u, 31u)))));
            int4 _835 = int4(int2(floor(_216 * _823)), int2(ceil(_223 * _823)) - int2(1, 1));
            _836 = _202 * 4u;
            int _837 = int(_836);
            _838 = _205 * 4u;
            int _839 = int(_838);
            uint2 _841 = uint2(int2(_837, _839));
            int2 _846 = _819.xy;
            int2 _847 = _819.zw;
            float4 _852 = _9[6][uint2(clamp(int2(_841), _846, _847))].xxxx;
            float4 _859 = _9[6][uint2(clamp(int2(_841 + uint2(0u, 1u)), _846, _847))].xxxx;
            float4 _866 = _9[6][uint2(clamp(int2(_841 + uint2(1u, 0u)), _846, _847))].xxxx;
            float4 _873 = _9[6][uint2(clamp(int2(_841 + uint2(1u, 1u)), _846, _847))].xxxx;
            float4 _879 = (((_852.x.xxxx + _859.x.xxxx) + _866.x.xxxx) + _873.x.xxxx) * 0.25f;
            int2 _880 = _835.xy;
            int2 _883 = _835.zw;
            if (all(bool2(_239.x >= _880.x, _239.y >= _880.y)) && all(bool2(_239.x <= _883.x, _239.y <= _883.y)))
            {
                _9[7u][uint2(_239)] = _879.x;
            }
            int _894 = int(_836 + 2u);
            int _897 = int(_235 + 1u);
            int2 _898 = int2(_897, _238);
            uint2 _899 = uint2(int2(_894, _839));
            float4 _907 = _9[6][uint2(clamp(int2(_899), _846, _847))].xxxx;
            float4 _914 = _9[6][uint2(clamp(int2(_899 + uint2(0u, 1u)), _846, _847))].xxxx;
            float4 _921 = _9[6][uint2(clamp(int2(_899 + uint2(1u, 0u)), _846, _847))].xxxx;
            float4 _928 = _9[6][uint2(clamp(int2(_899 + uint2(1u, 1u)), _846, _847))].xxxx;
            float4 _934 = (((_907.x.xxxx + _914.x.xxxx) + _921.x.xxxx) + _928.x.xxxx) * 0.25f;
            if (all(bool2(_898.x >= _880.x, _898.y >= _880.y)) && all(bool2(_898.x <= _883.x, _898.y <= _883.y)))
            {
                _9[7u][uint2(_898)] = _934.x;
            }
            int _947 = int(_838 + 2u);
            int _950 = int(_237 + 1u);
            int2 _951 = int2(_236, _950);
            uint2 _952 = uint2(int2(_837, _947));
            float4 _960 = _9[6][uint2(clamp(int2(_952), _846, _847))].xxxx;
            float4 _967 = _9[6][uint2(clamp(int2(_952 + uint2(0u, 1u)), _846, _847))].xxxx;
            float4 _974 = _9[6][uint2(clamp(int2(_952 + uint2(1u, 0u)), _846, _847))].xxxx;
            float4 _981 = _9[6][uint2(clamp(int2(_952 + uint2(1u, 1u)), _846, _847))].xxxx;
            float4 _987 = (((_960.x.xxxx + _967.x.xxxx) + _974.x.xxxx) + _981.x.xxxx) * 0.25f;
            if (all(bool2(_951.x >= _880.x, _951.y >= _880.y)) && all(bool2(_951.x <= _883.x, _951.y <= _883.y)))
            {
                _9[7u][uint2(_951)] = _987.x;
            }
            int2 _1000 = int2(_897, _950);
            uint2 _1001 = uint2(int2(_894, _947));
            float4 _1009 = _9[6][uint2(clamp(int2(_1001), _846, _847))].xxxx;
            float4 _1016 = _9[6][uint2(clamp(int2(_1001 + uint2(0u, 1u)), _846, _847))].xxxx;
            float4 _1023 = _9[6][uint2(clamp(int2(_1001 + uint2(1u, 0u)), _846, _847))].xxxx;
            float4 _1030 = _9[6][uint2(clamp(int2(_1001 + uint2(1u, 1u)), _846, _847))].xxxx;
            float4 _1036 = (((_1009.x.xxxx + _1016.x.xxxx) + _1023.x.xxxx) + _1030.x.xxxx) * 0.25f;
            if (all(bool2(_1000.x >= _880.x, _1000.y >= _880.y)) && all(bool2(_1000.x <= _883.x, _1000.y <= _883.y)))
            {
                _9[7u][uint2(_1000)] = _1036.x;
            }
            if (_183 <= 7u)
            {
                break;
            }
            float2 _1054 = float2(max(uint2(1u, 1u), (_210 >> (uint2(8u, 8u) & uint2(31u, 31u)))));
            int4 _1066 = int4(int2(floor(_216 * _1054)), int2(ceil(_223 * _1054)) - int2(1, 1));
            float4 _1070 = (((_879 + _934) + _987) + _1036) * 0.25f;
            int2 _1071 = _1066.xy;
            int2 _1074 = _1066.zw;
            if (all(bool2(_245.x >= _1071.x, _245.y >= _1071.y)) && all(bool2(_245.x <= _1074.x, _245.y <= _1074.y)))
            {
                _9[8u][uint2(_245)] = _1070.x;
            }
            _86[_202][_205] = _1070.x;
            break;
        } while(false);
        do
        {
            if (_183 <= 8u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _1094 = float2(max(uint2(1u, 1u), (_210 >> (uint2(9u, 9u) & uint2(31u, 31u)))));
            int4 _1106 = int4(int2(floor(_216 * _1094)), int2(ceil(_223 * _1094)) - int2(1, 1));
            float4 _1109 = _86[_202][_205].xxxx;
            uint _1111 = WaveGetLaneIndex() & 4294967292u;
            uint _1112 = _1111 | 1u;
            float4 _1113 = WaveReadLaneAt(_1109, _1112);
            uint _1114 = _1111 | 2u;
            float4 _1115 = WaveReadLaneAt(_1109, _1114);
            uint _1116 = _1111 | 3u;
            float4 _1117 = WaveReadLaneAt(_1109, _1116);
            float4 _1121 = (((_1109 + _1113) + _1115) + _1117) * 0.25f;
            bool _1123 = (gl_LocalInvocationIndex % 4u) == 0u;
            if (_1123)
            {
                uint _1130 = _205 / 2u;
                int2 _1133 = int2(uint2(0u, 0u) * uint2(8u, 8u)) + int2(int(_202 / 2u), int(_1130));
                int2 _1134 = _1106.xy;
                int2 _1137 = _1106.zw;
                if (all(bool2(_1133.x >= _1134.x, _1133.y >= _1134.y)) && all(bool2(_1133.x <= _1137.x, _1133.y <= _1137.y)))
                {
                    _9[9u][uint2(_1133)] = _1121.x;
                }
                _86[_202 + (_1130 % 2u)][_205] = _1121.x;
            }
            if (_183 <= 9u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _1157 = float2(max(uint2(1u, 1u), (_210 >> (uint2(10u, 10u) & uint2(31u, 31u)))));
            int4 _1169 = int4(int2(floor(_216 * _1157)), int2(ceil(_223 * _1157)) - int2(1, 1));
            if (gl_LocalInvocationIndex < 64u)
            {
                float4 _1177 = _86[_235 + (_205 % 2u)][_237].xxxx;
                float4 _1178 = WaveReadLaneAt(_1177, _1112);
                float4 _1179 = WaveReadLaneAt(_1177, _1114);
                float4 _1180 = WaveReadLaneAt(_1177, _1116);
                float4 _1184 = (((_1177 + _1178) + _1179) + _1180) * 0.25f;
                if (_1123)
                {
                    uint _1191 = _205 / 2u;
                    int2 _1194 = int2(uint2(0u, 0u) * uint2(4u, 4u)) + int2(int(_202 / 2u), int(_1191));
                    int2 _1195 = _1169.xy;
                    int2 _1198 = _1169.zw;
                    if (all(bool2(_1194.x >= _1195.x, _1194.y >= _1195.y)) && all(bool2(_1194.x <= _1198.x, _1194.y <= _1198.y)))
                    {
                        _9[10u][uint2(_1194)] = _1184.x;
                    }
                    _86[_235 + _1191][_237] = _1184.x;
                }
            }
            if (_183 <= 10u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _1217 = float2(max(uint2(1u, 1u), (_210 >> (uint2(11u, 11u) & uint2(31u, 31u)))));
            int4 _1229 = int4(int2(floor(_216 * _1217)), int2(ceil(_223 * _1217)) - int2(1, 1));
            if (gl_LocalInvocationIndex < 16u)
            {
                float4 _1236 = _86[_836 + _205][_838].xxxx;
                float4 _1237 = WaveReadLaneAt(_1236, _1112);
                float4 _1238 = WaveReadLaneAt(_1236, _1114);
                float4 _1239 = WaveReadLaneAt(_1236, _1116);
                float4 _1243 = (((_1236 + _1237) + _1238) + _1239) * 0.25f;
                if (_1123)
                {
                    uint _1248 = _202 / 2u;
                    int2 _1253 = int2(uint2(0u, 0u) * uint2(2u, 2u)) + int2(int(_1248), int(_205 / 2u));
                    int2 _1254 = _1229.xy;
                    int2 _1257 = _1229.zw;
                    if (all(bool2(_1253.x >= _1254.x, _1253.y >= _1254.y)) && all(bool2(_1253.x <= _1257.x, _1253.y <= _1257.y)))
                    {
                        _9[11u][uint2(_1253)] = _1243.x;
                    }
                    _86[_1248 + _205][0u] = _1243.x;
                }
            }
            if (_183 <= 11u)
            {
                break;
            }
            GroupMemoryBarrierWithGroupSync();
            float2 _1276 = float2(max(uint2(1u, 1u), (_210 >> (uint2(12u, 12u) & uint2(31u, 31u)))));
            int4 _1288 = int4(int2(floor(_216 * _1276)), int2(ceil(_223 * _1276)) - int2(1, 1));
            if (gl_LocalInvocationIndex < 4u)
            {
                float4 _1294 = _86[gl_LocalInvocationIndex][0u].xxxx;
                float4 _1295 = WaveReadLaneAt(_1294, _1112);
                float4 _1296 = WaveReadLaneAt(_1294, _1114);
                float4 _1297 = WaveReadLaneAt(_1294, _1116);
                if (_1123)
                {
                    int2 _1304 = _1288.xy;
                    int2 _1307 = _1288.zw;
                    if (all(bool2(int2(0, 0).x >= _1304.x, int2(0, 0).y >= _1304.y)) && all(bool2(int2(0, 0).x <= _1307.x, int2(0, 0).y <= _1307.y)))
                    {
                        _9[12u][uint2(0u, 0u)] = ((((_1294 + _1295) + _1296) + _1297) * 0.25f).x;
                    }
                }
            }
            break;
        } while(false);
        break;
    } while(false);
}

[numthreads(256, 1, 1)]
void main(SPIRV_Cross_Input stage_input)
{
    gl_WorkGroupID = stage_input.gl_WorkGroupID;
    gl_LocalInvocationIndex = stage_input.gl_LocalInvocationIndex;
    comp_main();
}

