#version 450
#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_EXT_spirv_intrinsics : require
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
layout(local_size_x = 16, local_size_y = 16, local_size_z = 1) in;

vec2 _164;

layout(set = 5, binding = 0, scalar) uniform _20_4
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    vec3 _m5;
    float _m6;
    vec3 _m7;
    vec3 _m8;
    float _m9;
} _4;

layout(set = 0, binding = 0, std140) uniform _21_9
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    float _m5;
    int _m6;
    float _m7;
} _9;

layout(set = 0, binding = 1, std140) uniform _23_10
{
    vec3 _m0;
    float _m1;
    vec3 _m2;
    float _m3;
    vec3 _m4;
    float _m5;
    layout(row_major) mat4 _m6;
    vec4 _m7[3];
    vec4 _m8;
    vec4 _m9;
    float _m10;
    float _m11;
    float _m12;
    float _m13;
    float _m14;
    float _m15;
    float _m16;
    float _m17;
    vec4 _m18;
    float _m19;
    float _m20;
    float _m21;
    float _m22;
    vec4 _m23;
    vec3 _m24;
    float _m25;
    vec3 _m26;
    float _m27;
    vec4 _m28;
    vec3 _m29;
    float _m30;
    vec4 _m31;
    vec3 _m32;
    float _m33;
    vec3 _m34;
    float _m35;
    vec3 _m36;
    float _m37;
} _10;

layout(set = 0, binding = 4, std140) uniform _24_11
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
} _11;

layout(set = 1, binding = 0, std140) uniform _27_12
{
    layout(row_major) mat4 _m0;
    vec4 _m1;
    vec3 _m2;
    float _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec2 _m7;
    float _m8;
    float _m9;
    float _m10;
    float _m11;
    float _m12;
    float _m13;
    float _m14;
    float _m15;
    float _m16;
    float _m17;
    float _m18;
    float _m19;
    float _m20;
    float _m21;
    float _m22;
    float _m23;
    float _m24;
    float _m25;
    float _m26;
    float _m27;
    float _m28;
    float _m29;
    float _m30;
    float _m31;
    vec2 _m32;
} _12;

layout(set = 1, binding = 2, std430) readonly buffer _26_14
{
    float _m0[];
} _14;

layout(set = 5, binding = 1) uniform texture2D _5;
layout(set = 5, binding = 2) uniform texture3D _6;
layout(set = 5, binding = 4) uniform texture2D _7;
layout(set = 5, binding = 5) uniform texture2D _8;
layout(set = 1, binding = 1) uniform sampler _13;
layout(set = 1, binding = 3) uniform texture2D _15;
layout(set = 1, binding = 4) uniform texture3D _16;
layout(set = 1, binding = 5) uniform texture3D _17;
layout(set = 1, binding = 6) uniform texture2D _18;
layout(set = 1, binding = 7, rgba32f) uniform writeonly image2D _19;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    do
    {
        uvec2 _172 = gl_GlobalInvocationID.xy + _11._m3;
        if (any(greaterThan(_172, _11._m4)))
        {
            break;
        }
        vec2 _199 = (((clamp(((vec2(_172) + vec2(0.5)) / _12._m32) * _11._m16, _11._m13, _11._m14) - _11._m1) / _11._m0) * 2.0) - vec2(1.0);
        vec3 _208 = normalize((vec4(_199.x, -_199.y, 0.0, 1.0) * _12._m0).xyz);
        float _213 = _208.y;
        vec4 _1054;
        if ((texelFetch(_15, ivec2(_172), int(0u)).x == 1.0) && (_213 > (-0.02500000037252902984619140625)))
        {
            float _228;
            float _229;
            float _230;
            float _233;
            float _225 = _12._m9 + _12._m26;
            vec3 _275;
            do
            {
                _228 = dot(_208, _12._m1.xyz);
                _229 = 2.0 * _228;
                _230 = dot(_12._m1.xyz, _12._m1.xyz);
                float _232 = _230 - pow(_225, 2.0);
                _233 = pow(_229, 2.0);
                float _234 = fma(-4.0, _232, _233);
                if (_234 < 0.0)
                {
                    _275 = _12._m1.xyz;
                    break;
                }
                else
                {
                    if ((abs(_234) - 4.9999998736893758177757263183594e-05) <= 0.0)
                    {
                        _275 = _12._m1.xyz + (_208 * (_228 * (-1.0)));
                        break;
                    }
                    else
                    {
                        float _256;
                        if (_229 > 0.0)
                        {
                            _256 = (-0.5) * fma(2.0, _228, sqrt(_234));
                        }
                        else
                        {
                            _256 = (-0.5) * fma(2.0, _228, -sqrt(_234));
                        }
                        float _257 = _232 / _256;
                        float _258 = spvNMin(_256, _257);
                        float _259 = spvNMax(_256, _257);
                        vec2 _268;
                        if (_258 < 0.0)
                        {
                            vec2 _264;
                            _264.x = _259;
                            if (_259 < 0.0)
                            {
                                _275 = _12._m1.xyz;
                                break;
                            }
                            _268 = _264;
                        }
                        else
                        {
                            _268 = vec2(_258, _259);
                        }
                        _275 = _12._m1.xyz + (_208 * _268.x);
                        break;
                    }
                    break; // unreachable workaround
                }
                break; // unreachable workaround
            } while(false);
            float _278 = _12._m27 - _12._m26;
            vec3 _325;
            do
            {
                float _283 = _230 - pow(_225 + _278, 2.0);
                float _284 = fma(-4.0, _283, _233);
                if (_284 < 0.0)
                {
                    _325 = _12._m1.xyz;
                    break;
                }
                else
                {
                    if ((abs(_284) - 4.9999998736893758177757263183594e-05) <= 0.0)
                    {
                        _325 = _12._m1.xyz + (_208 * (_228 * (-1.0)));
                        break;
                    }
                    else
                    {
                        float _306;
                        if (_229 > 0.0)
                        {
                            _306 = (-0.5) * fma(2.0, _228, sqrt(_284));
                        }
                        else
                        {
                            _306 = (-0.5) * fma(2.0, _228, -sqrt(_284));
                        }
                        float _307 = _283 / _306;
                        float _308 = spvNMin(_306, _307);
                        float _309 = spvNMax(_306, _307);
                        vec2 _318;
                        if (_308 < 0.0)
                        {
                            vec2 _314;
                            _314.x = _309;
                            if (_309 < 0.0)
                            {
                                _325 = _12._m1.xyz;
                                break;
                            }
                            _318 = _314;
                        }
                        else
                        {
                            _318 = vec2(_308, _309);
                        }
                        _325 = _12._m1.xyz + (_208 * _318.x);
                        break;
                    }
                    break; // unreachable workaround
                }
                break; // unreachable workaround
            } while(false);
            float _329 = floor(64.0);
            float _333 = fma(_329, clamp(pow(abs(1.0 - normalize(_208).y), 0.25), 0.0, 1.0), _329);
            vec3 _336 = (_325 - _275) / vec3(_333);
            uint _337 = uint(_333);
            vec3 _338 = _275 + _336;
            float _347 = (((length(_338) - _12._m9) - _12._m26) / _278) - (((length(_275) - _12._m9) - _12._m26) / _278);
            float _351 = distance(_12._m1.xyz, _275) / _12._m10;
            float _353 = distance(_275, _338) / _12._m10;
            vec3 _358 = vec3(0.0, 636100.0, 0.0) + (_12._m1.xyz - vec3(0.0, _12._m9, 0.0));
            float _361 = dot(_208, _10._m0);
            bool _364 = _10._m19 > 0.0;
            vec3 _415;
            SPIRV_CROSS_BRANCH
            if (_364 && (_10._m35 == 0.0))
            {
                float _372 = length(_358);
                vec3 _383;
                float _384;
                if (_372 < (0.89999997615814208984375 * _4._m0))
                {
                    vec3 _381 = _358;
                    _381.z = _358.z + _4._m0;
                    _383 = _381;
                    _384 = length(_381);
                }
                else
                {
                    _383 = _358;
                    _384 = _372;
                }
                float _387 = dot(_383 / vec3(_384), _10._m0);
                float _388 = _4._m0 / _384;
                _415 = (mix(textureLod(sampler2D(_5, _13), vec2(atan((_387 + 0.1500000059604644775390625) * 12.26210498809814453125) * 0.666666686534881591796875, sqrt((_384 - _4._m0) / (_4._m1 - _4._m0))), 0.0).xyz, vec3(0.0), bvec3(_387 < (-sqrt(fma(-_388, _388, 1.0))))) * 1.0) * _10._m34;
            }
            else
            {
                _415 = _12._m2;
            }
            vec3 _418 = _415 * _12._m4.w;
            vec4 _420;
            vec3 _423;
            _420 = vec4(0.0);
            _423 = _275;
            vec3 _424;
            float _426;
            float _428;
            vec4 _421;
            float _430;
            float _425 = _351;
            float _427 = 0.0;
            float _429 = 1.0;
            uint _431 = 0u;
            for (; _431 < _337; _420 = _421, _423 = _424, _425 = _426, _427 = _428, _429 = _430, _431++)
            {
                if (((_429 <= 0.00999999977648258209228515625) || (_427 >= 1.0)) || (_420.w >= 1.0))
                {
                    break;
                }
                float _447 = 1.0 / _12._m10;
                vec2 _459 = vec2(_10._m1, _10._m3);
                vec2 _466 = ((_459 * _9._m0) * _12._m4.x) * 0.0005000000237487256526947021484375;
                vec2 _467 = ((((_423.xz * _447) * 0.5) + vec2(0.5)) + _12._m7) - _466;
                _467.x = 1.0 - _467.x;
                vec4 _482 = vec4(_10._m16);
                vec4 _490 = mix(mix(textureLod(sampler2D(_7, _13), _467, 0.0), textureLod(sampler2D(_8, _13), _467, 0.0), _482), vec4(0.0, 0.0, 0.5, 0.0), vec4(smoothstep(_12._m28, _12._m29, distance(_423, _12._m1.xyz) / _12._m10)));
                float _491 = 1.0 / _12._m27;
                vec3 _492 = _423 * _491;
                vec4 _496 = vec4(_492, 0.0);
                vec2 _500 = (_459 * _10._m5) * _9._m0;
                vec2 _501 = _500 * 0.0030000000260770320892333984375;
                vec2 _503 = _496.xz - _501;
                vec4 _518 = vec4(1.0, smoothstep(0.010999999940395355224609375, 0.097999997437000274658203125, _427) - smoothstep(0.12600000202655792236328125, 0.2249999940395355224609375, _427), smoothstep(0.0, 0.09600000083446502685546875, _427) - smoothstep(0.31099998950958251953125, 0.505999982357025146484375, _427), smoothstep(0.0, 0.08699999749660491943359375, _427) - smoothstep(0.749000012874603271484375, 1.0, _427));
                vec4 _519 = textureLod(sampler3D(_16, _13), vec4(_503.x, _496.y, _503.y, _496.w).xyz, 0.0) * _518;
                float _529 = _490.z;
                bool _530 = _529 < 0.5;
                float _531 = _529 * 2.0;
                float _534 = (_529 - 0.5) * 2.0;
                float _554 = _12._m14 + _12._m16;
                float _556 = _490.x;
                float _559 = clamp(smoothstep(_12._m14, _554, clamp((((_519.x + _519.y) + _519.z) + _519.w) * 0.25, 0.0, 1.0) * (smoothstep(_530 ? mix(0.0, 0.0, _531) : mix(0.0, 0.010999999940395355224609375, _534), _530 ? mix(0.08699999749660491943359375, 0.09600000083446502685546875, _531) : mix(0.09600000083446502685546875, 0.097999997437000274658203125, _534), _427) - smoothstep(_530 ? mix(0.749000012874603271484375, 0.31099998950958251953125, _531) : mix(0.31099998950958251953125, 0.12600000202655792236328125, _534), _530 ? mix(1.0, 0.505999982357025146484375, _531) : mix(0.505999982357025146484375, 0.2249999940395355224609375, _534), _427))) - (1.0 - _556), 0.0, 1.0);
                float _560 = _559 * _556;
                float _620;
                if (((_560 > 0.0) && (_560 < 1.0)) && (step(_12._m25, _425) == 0.0))
                {
                    vec4 _589 = vec4(_492 * _12._m15, 0.0);
                    vec2 _592 = _589.xz - (_500 * 0.0500000007450580596923828125);
                    vec3 _607 = (vec3(1.0) - textureLod(sampler3D(_17, _13), (vec4(_592.x, _589.y, _592.y, _589.w).xyz + (((textureLod(sampler2D(_18, _13), vec4((_423.xy * _491) * _12._m18, 0.0, 0.0).xy, 0.0).xyz * 2.0) - vec3(1.0)) * (_12._m17 * _427))).xyz, 0.0).xyz) * _518.yzw;
                    _620 = clamp(fma(_559, _556, -((((_607.x + _607.y) + _607.z) * 0.3333333432674407958984375) * (smoothstep(1.0, 0.0, _560) * 0.5))), 0.0, 1.0);
                }
                else
                {
                    _620 = _560;
                }
                float _623 = _620 * _12._m13;
                float _626 = smoothstep(0.0, _12._m11, _427);
                float _627 = _623 * _626;
                if (_627 > 9.9999997473787516355514526367188e-06)
                {
                    vec3 _637 = vec3(_427);
                    float _641 = _490.y;
                    vec3 _651 = _10._m0 * ((_12._m23 * _278) * 0.5);
                    vec3 _652 = _423 + _651;
                    vec2 _658 = ((((_652.xz * _447) * 0.5) + vec2(0.5)) + _12._m7) - _466;
                    _658.x = 1.0 - _658.x;
                    vec4 _671 = mix(mix(textureLod(sampler2D(_7, _13), _658, 0.0), textureLod(sampler2D(_8, _13), _658, 0.0), _482), vec4(0.0, 0.0, 0.5, 0.0), vec4(smoothstep(_12._m28, _12._m29, distance(_652, _12._m1.xyz) / _12._m10)));
                    vec3 _672 = _652 + _651;
                    float _676 = ((length(_672) - _12._m9) - _12._m26) / _278;
                    vec4 _681 = vec4(_672 * _491, 0.0);
                    vec2 _683 = _681.xz - _501;
                    vec4 _698 = textureLod(sampler3D(_16, _13), vec4(_683.x, _681.y, _683.y, _681.w).xyz, 0.0) * vec4(1.0, smoothstep(0.010999999940395355224609375, 0.097999997437000274658203125, _676) - smoothstep(0.12600000202655792236328125, 0.2249999940395355224609375, _676), smoothstep(0.0, 0.09600000083446502685546875, _676) - smoothstep(0.31099998950958251953125, 0.505999982357025146484375, _676), smoothstep(0.0, 0.08699999749660491943359375, _676) - smoothstep(0.749000012874603271484375, 1.0, _676));
                    float _708 = _671.z;
                    bool _709 = _708 < 0.5;
                    float _710 = _708 * 2.0;
                    float _713 = (_708 - 0.5) * 2.0;
                    float _715 = _709 ? mix(0.0, 0.0, _710) : mix(0.0, 0.010999999940395355224609375, _713);
                    float _718 = _709 ? mix(0.08699999749660491943359375, 0.09600000083446502685546875, _710) : mix(0.09600000083446502685546875, 0.097999997437000274658203125, _713);
                    float _721 = _709 ? mix(0.749000012874603271484375, 0.31099998950958251953125, _710) : mix(0.31099998950958251953125, 0.12600000202655792236328125, _713);
                    float _724 = _709 ? mix(1.0, 0.505999982357025146484375, _710) : mix(0.505999982357025146484375, 0.2249999940395355224609375, _713);
                    float _730 = _671.x;
                    float _731 = 1.0 - _730;
                    vec3 _737 = _672 + _651;
                    float _741 = ((length(_737) - _12._m9) - _12._m26) / _278;
                    vec4 _746 = vec4(_737 * _491, 0.0);
                    vec2 _748 = _746.xz - _501;
                    vec4 _763 = textureLod(sampler3D(_16, _13), vec4(_748.x, _746.y, _748.y, _746.w).xyz, 0.0) * vec4(1.0, smoothstep(0.010999999940395355224609375, 0.097999997437000274658203125, _741) - smoothstep(0.12600000202655792236328125, 0.2249999940395355224609375, _741), smoothstep(0.0, 0.09600000083446502685546875, _741) - smoothstep(0.31099998950958251953125, 0.505999982357025146484375, _741), smoothstep(0.0, 0.08699999749660491943359375, _741) - smoothstep(0.749000012874603271484375, 1.0, _741));
                    vec3 _786 = _737 + (_651 * 8.0);
                    float _790 = ((length(_786) - _12._m9) - _12._m26) / _278;
                    vec4 _795 = vec4(_786 * _491, 0.0);
                    vec2 _797 = _795.xz - _501;
                    vec4 _812 = textureLod(sampler3D(_16, _13), vec4(_797.x, _795.y, _797.y, _795.w).xyz, 0.0) * vec4(1.0, smoothstep(0.010999999940395355224609375, 0.097999997437000274658203125, _790) - smoothstep(0.12600000202655792236328125, 0.2249999940395355224609375, _790), smoothstep(0.0, 0.09600000083446502685546875, _790) - smoothstep(0.31099998950958251953125, 0.505999982357025146484375, _790), smoothstep(0.0, 0.08699999749660491943359375, _790) - smoothstep(0.749000012874603271484375, 1.0, _790));
                    float _832 = fma((clamp(smoothstep(_12._m14, _554, clamp((((_812.x + _812.y) + _812.z) + _812.w) * 0.25, 0.0, 1.0) * (smoothstep(_715, _718, _790) - smoothstep(_721, _724, _790))) - _731, 0.0, 1.0) * _730) * _12._m13, smoothstep(0.0, _12._m11, _790), fma((clamp(smoothstep(_12._m14, _554, clamp((((_698.x + _698.y) + _698.z) + _698.w) * 0.25, 0.0, 1.0) * (smoothstep(_715, _718, _676) - smoothstep(_721, _724, _676))) - _731, 0.0, 1.0) * _730) * _12._m13, smoothstep(0.0, _12._m11, _676), ((clamp(smoothstep(_12._m14, _554, clamp((((_763.x + _763.y) + _763.z) + _763.w) * 0.25, 0.0, 1.0) * (smoothstep(_715, _718, _741) - smoothstep(_721, _724, _741))) - _731, 0.0, 1.0) * _730) * _12._m13) * smoothstep(0.0, _12._m11, _741)));
                    float _867 = (-_12._m19) * mix(1.0, spvNMax(1.0, _12._m30), _641);
                    vec3 _884 = (((_418 * exp(_867 * clamp(exp(10.0 * (_832 - 0.5)), 0.0, 1.75 * _832))) * mix(1.0, clamp(((1.0 - exp((_867 * _627) * 2.0)) * _12._m22) * 2.0, 0.0, 1.0), smoothstep(0.5, -0.5, _361))) * (((fma(-_12._m20, _12._m20, 1.0) / pow(abs(fma(_12._m20 * (-2.0), _361, fma(_12._m20, _12._m20, 1.0))), 1.5)) + (fma(-_12._m21, _12._m21, 1.0) / pow(abs(fma(_12._m21 * (-2.0), _361, fma(_12._m21, _12._m21, 1.0))), 1.5))) * 0.5)) + (mix(mix(_12._m5.xyz, _12._m6.xyz, _637), mix(_12._m5.xyz * 0.5, _12._m6.xyz, _637), vec3(_641)) * _12._m4.z);
                    _421 = ((vec4(_884, 1.0) * _627) * (1.0 - _420.w)) + _420;
                    _430 = _429 * fma(-_623, _626, 1.0);
                }
                else
                {
                    _421 = _420;
                    _430 = _429;
                }
                _424 = _423 + _336;
                _428 = _427 + _347;
                _426 = _425 + _353;
            }
            vec4 _899 = pow(abs(_420), vec4(2.2000000476837158203125));
            vec3 _904 = _899.xyz * (_14._m0[0u] * _12._m4.y);
            float _913 = clamp((1.0 - exp(smoothstep(0.1500000059604644775390625, 0.0, _213) * (-2.0))) * _12._m12, 0.0, 1.0);
            vec4 _1053;
            SPIRV_CROSS_BRANCH
            if (_364)
            {
                float _922 = length(_358);
                float _923 = dot(_358, _208);
                float _933 = spvNMax((-_923) - sqrt(fma(_4._m1, _4._m1, fma(_923, _923, -(_922 * _922)))), 0.0);
                bool _934 = _933 > 0.0;
                float _940;
                vec3 _941;
                if (_934)
                {
                    _940 = _923 + _933;
                    _941 = _358 + (_208 * _933);
                }
                else
                {
                    _940 = _923;
                    _941 = _358;
                }
                float _942 = _934 ? _4._m1 : _922;
                vec3 _1040;
                if (_942 <= _4._m1)
                {
                    float _947 = dot(_208, _10._m36);
                    float _954 = -(_4._m0 * _4._m0);
                    float _956 = sqrt(fma(_4._m1, _4._m1, _954));
                    float _958 = sqrt(fma(_942, _942, _954));
                    float _962 = fma(_4._m0, _4._m0, fma(_940, _940, -(_942 * _942)));
                    vec4 _969 = mix(vec4(-1.0, _956 * _956, _956, 0.50390625), vec4(1.0, 0.0, 0.0, 0.49609375), bvec4((_940 < 0.0) && (_962 > 0.0)));
                    float _971 = fma(_958 / _956, 0.96875, 0.015625);
                    float _981 = fma(fma(_940, _969.x, sqrt(_962 + _969.y)) / (_958 + _969.z), 0.4921875, _969.w);
                    float _987 = _947 + 1.0;
                    float _989 = floor(_987 * 3.5);
                    float _991 = fma(_987, 3.5, -_989);
                    float _992 = _989 + fma(fma(atan(spvNMax(dot(_941, _10._m36) / _942, -0.19750000536441802978515625) * 5.3496246337890625), 0.90909087657928466796875, 0.7400000095367431640625), 0.484375, 0.015625);
                    vec4 _1005 = (textureLod(sampler3D(_6, _13), vec3(_992 * 0.125, _981, _971), 0.0) * (1.0 - _991)) + (textureLod(sampler3D(_6, _13), vec3((_992 + 1.0) * 0.125, _981, _971), 0.0) * _991);
                    vec3 _1006 = _1005.xyz;
                    float _1020 = fma(_947, _947, 1.0);
                    _1040 = (_1006 * (0.0596831031143665313720703125 * _1020)) + ((((_1006 * _1005.w) / vec3(spvNMax(_1005.x, 9.9999997473787516355514526367188e-05))) * (vec3(_4._m5.x) / _4._m5)) * ((((0.119366206228733062744140625 * fma(-_4._m9, _4._m9, 1.0)) * (-pow(abs(fma(_4._m9 * (-2.0), _947, fma(_4._m9, _4._m9, 1.0))), 1.5))) * _1020) / fma(_4._m9, _4._m9, 2.0)));
                }
                else
                {
                    _1040 = vec3(0.0);
                }
                vec3 _1046 = mix(_904.xyz, _1040 * ((_10._m19 * _14._m0[0u]) * 10.0), vec3(_913));
                vec4 _1047 = vec4(_1046.x, _1046.y, _1046.z, _899.w);
                _1047.w = 1.0 - mix(1.0 - _899.w, 0.0, _913);
                _1053 = _1047;
            }
            else
            {
                _1053 = mix(vec4(_904.x, _904.y, _904.z, _899.w), vec4(0.0), vec4(_913));
            }
            _1054 = _1053;
        }
        else
        {
            _1054 = vec4(0.0);
        }
        imageStore(_19, ivec2(_172), _1054);
        break;
    } while(false);
}

