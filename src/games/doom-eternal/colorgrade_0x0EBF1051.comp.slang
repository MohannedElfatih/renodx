#version 450

#include "./common.slang"

layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;

const vec3 _3575[5] = vec3[](vec3(0.0588235296308994293212890625, 0.21960784494876861572265625, 0.0588235296308994293212890625), vec3(0.18823529779911041259765625, 0.3843137323856353759765625, 0.18823529779911041259765625), vec3(0.5450980663299560546875, 0.674509823322296142578125, 0.0588235296308994293212890625), vec3(0.6078431606292724609375, 0.737254917621612548828125, 0.0588235296308994293212890625), vec3(0.792156875133514404296875, 0.862745106220245361328125, 0.6235294342041015625));

struct _4015 {
  float _m0;
  float _m1;
};

struct _4016 {
  float _m0[6];
  float _m1[6];
  _4015 _m2;
  _4015 _m3;
  _4015 _m4;
  float _m5;
  float _m6;
};

layout(set = 0, binding = 0, std140) uniform _279_281 {
  vec4 _m0;
  vec4 _m1;
  vec4 _m2;
  vec4 _m3;
  vec4 _m4;
  vec4 _m5;
  vec4 _m6;
  vec4 _m7;
  vec4 _m8;
  vec4 _m9;
  vec4 _m10;
  vec4 _m11;
  vec4 _m12;
  vec4 _m13;
  vec4 _m14;
  vec4 _m15;
  vec4 _m16;
  vec4 _m17;
  vec4 _m18;
  vec4 _m19;
  vec4 _m20;
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
  float _m32;
  float _m33;
  float _m34;
  float _m35;
  float _m36;
  float _m37;
  float _m38;
  uint _m39;
  float _m40;
  float _m41;
  float _m42;
  float _m43;
  float _m44;
  float _m45;
  float _m46;
  uint _m47;
  float _m48;
  float _m49;
  float _m50;
  float _m51;
  float _m52;
  float _m53;
  float _m54;
  float _m55[2];
}
_281;

layout(set = 1, binding = 0, std140) uniform _615_617 {
  vec4 _m0;
  vec4 _m1;
  vec4 _m2;
  vec4 _m3;
  vec4 _m4;
  vec4 _m5;
  vec4 _m6;
  vec4 _m7;
  vec4 _m8;
  vec4 _m9;
  vec4 _m10;
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
  float _m22[1];
}
_617;

layout(set = 1, binding = 9, std430) restrict buffer _1595_1597 {
  float _m0[];
}
_1597;

layout(set = 1, binding = 13, std140) uniform _1869_1871 {
  vec4 _m0[4];
}
_1871;

layout(set = 1, binding = 15, std140) uniform _2296_2298 {
  vec4 _m0[4];
}
_2298;

layout(set = 1, binding = 16, std140) uniform _3252_3254 {
  vec4 _m0[3];
}
_3254;

layout(set = 0, binding = 1, std140) uniform _3836_3838 {
  vec4 _m0[64];
}
_3838;

layout(set = 1, binding = 2) uniform texture2D _558;
layout(set = 0, binding = 2) uniform SamplerState _562;
layout(set = 0, binding = 3) uniform texture2D _726;
layout(set = 0, binding = 4) uniform SamplerState _728;
layout(set = 0, binding = 5) uniform texture2D _918;
layout(set = 1, binding = 3) uniform texture2D _941;
layout(set = 1, binding = 4) uniform texture2D _994;
layout(set = 1, binding = 5) uniform texture2D _1225;
layout(set = 1, binding = 6) uniform texture2D _1260;
layout(set = 1, binding = 7) uniform texture2D _1290;
layout(set = 0, binding = 6) uniform texture2D _1513;
layout(set = 0, binding = 7) uniform texture2D _1528;
layout(set = 1, binding = 8) uniform texture2D _1545;
layout(set = 0, binding = 8) uniform texture2D _1562;
layout(set = 0, binding = 9) uniform texture2D _1641;
layout(set = 0, binding = 10) uniform SamplerState _1665;
layout(set = 1, binding = 10) uniform Texture3D<float4> _1707;
layout(set = 1, binding = 11, r8) uniform readonly image2D _1767;
layout(set = 1, binding = 12) uniform texture2D _1837;
layout(set = 0, binding = 11) uniform texture2D _1899;
layout(set = 0, binding = 12) uniform SamplerState _1901;
layout(set = 1, binding = 14) uniform texture2D _2160;
layout(set = 0, binding = 13) uniform texture2D _2563;
layout(set = 0, binding = 14) uniform texture2D _2610;
layout(set = 0, binding = 15) uniform SamplerState _2612;
layout(set = 0, binding = 16) uniform texture2D _2800;
layout(set = 0, binding = 17) uniform texture2D _2847;
layout(set = 0, binding = 18) uniform SamplerState _2849;
layout(set = 0, binding = 19) uniform texture2D _3036;
layout(set = 0, binding = 20) uniform texture2D _3083;
layout(set = 0, binding = 21) uniform SamplerState _3085;
layout(set = 1, binding = 17) uniform texture2D _3293;
layout(set = 1, binding = 1) uniform texture2D _3499;
layout(set = 0, binding = 22) uniform Texture3D<float4> _3768;
layout(set = 1, binding = 18, r11f_g11f_b10f) uniform writeonly image2D _3824;

uint _104;
uint _106;
uint _108;
uint _110;
uint _112;
uint _114;
uint _116;
uint _117;
uint _119;
uint _120;
uint _122;
uint _124;
uint _126;
uint _128;
uint _130;
uint _132;
uint _134;
uint _136;
uint _138;

vec2 _91(inout vec2 _89, vec2 _90) {
  _89 = (_89 * 2.0) - vec2(1.0);
  _89 *= vec2(1.0 + ((_89.y * _89.y) * _90.x), 1.0 + ((_89.x * _89.x) * _90.y));
  return (_89 * 0.5) + vec2(0.5);
}

float _98(vec2 _97) {
  return (_558.Sample(_562, vec4(_97, 0.0, 0.0).xy, 0.0).x - 0.5) * 2.0;
}

uint _21(float _20) {
  return floatBitsToUint(_20);
}

float _27(float _24, float _25, float _26) {
  return max(_24, max(_25, _26));
}

vec3 _101(vec3 _100) {
  float _584 = _100.x;
  float _587 = _100.y;
  float _590 = _100.z;
  return _100 * (1.0 / (1.0 - (0.9900000095367431640625 * _27(_584, _587, _590))));
}

float _10(float _9) {
  return clamp(_9, 0.0, 1.0);
}

vec3 _16(vec3 _15) {
  return clamp(_15, vec3(0.0), vec3(1.0));
}

vec3 _81(vec3 _79, float _80) {
  vec3 _388 = sqrt(sqrt(_79 / vec3(100.0)));
  _388 *= ((_80 - 1.0) / _80);
  _388 += vec3(0.5 / _80);
  vec3 _407 = _388;
  return _16(_407);
}

float _52(vec3 _51) {
  return dot(_51, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
}

float _59(inout float _57, bool _58) {
  if (_58) {
    _57 += (float(_57 < _281._m21) * _281._m22);
  }
  float _299 = _57;
  return _281._m0.w / (_10(_299) + _281._m0.z);
}

vec3 _64(vec2 _63) {
  return (vec3(_281._m23, _281._m24, _281._m25) + (vec3(_281._m26, _281._m27, _281._m28) * _63.x)) + (vec3(_281._m29, _281._m30, _281._m31) * _63.y);
}

vec3 _69(vec2 _67, float _68) {
  vec3 _346 = _64(_67);
  return _346 * _68;
}

vec4 _45(uint _44) {
  return unpackUnorm4x8(_44).wzyx;
}

float _30(float _29) {
  float _166;
  if (_29 <= 0.040449999272823333740234375) {
    _166 = _29 / 12.9200000762939453125;
  } else {
    _166 = pow((_29 / 1.05499994754791259765625) + 0.0521326996386051177978515625, 2.400000095367431640625);
  }
  return _166;
}

vec3 _33(vec3 _32) {
  float _183 = _32.x;
  float _187 = _32.y;
  float _192 = _32.z;
  return vec3(_30(_183), _30(_187), _30(_192));
}

float _36(float _35) {
  float _203;
  if (_35 > 0.003130800090730190277099609375) {
    _203 = (pow(_35, 0.4166666567325592041015625) * 1.05499994754791259765625) - 0.054999999701976776123046875;
  } else {
    _203 = _35 * 12.9200000762939453125;
  }
  return _203;
}

vec3 _39(vec3 _38) {
  float _218 = _38.x;
  float _222 = _38.y;
  float _226 = _38.z;
  return vec3(_36(_218), _36(_222), _36(_226));
}

vec3 _94(vec3 _93) {
  vec4 _473 = mix(vec4(_93.zy, -1.0, 0.666666686534881591796875), vec4(_93.yz, 0.0, -0.3333333432674407958984375), vec4(step(_93.z, _93.y)));
  vec4 _499 = mix(vec4(_473.xyw, _93.x), vec4(_93.x, _473.yzx), vec4(step(_473.x, _93.x)));
  float _523 = _499.x - min(_499.w, _499.y);
  return vec3(abs(_499.z + ((_499.w - _499.y) / ((6.0 * _523) + 9.9999997473787516355514526367188e-05))), _523 / (_499.x + 9.9999997473787516355514526367188e-05), _499.x);
}

vec3 _48(vec3 _47) {
  vec3 _238 = abs((fract(_47.xxx + vec3(1.0, 0.666666686534881591796875, 0.3333333432674407958984375)) * 6.0) - vec3(3.0));
  vec3 _257 = _238 - vec3(1.0);
  return mix(vec3(1.0), _16(_257), vec3(_47.y)) * _47.z;
}

vec3 _85(vec3 _83, float _84) {
  vec3 _412 = (log(_83 + vec3(0.001000000047497451305389404296875)) + vec3(6.907755374908447265625)) / vec3(9.22029018402099609375);
  _412 *= ((_84 - 1.0) / _84);
  _412 += vec3(0.5 / _84);
  vec3 _435 = _412;
  return _16(_435);
}

float _76(uvec2 _74, uint _75) {
  uvec2 _352 = _74 & uvec2(3u);
  return float(((((2068378560u * (1u - (_352.x >> uint(1)))) + (1500172770u * (_352.x >> uint(1)))) >> ((_352.y + ((_352.x & 1u) << uint(2))) << uint(2))) + _75) & 15u) / 16.0;
}

void main() {
  _104 = 2147483648u;
  _106 = 1073741824u;
  _108 = 0u;
  _110 = 268435456u;
  _112 = 536870912u;
  _114 = 805306368u;
  _116 = 1073741824u;
  _117 = 1342177280u;
  _119 = 0u;
  _120 = 16777216u;
  _122 = 33554432u;
  _124 = 50331648u;
  _126 = 67108864u;
  _128 = 83886080u;
  _130 = 100663296u;
  _132 = 117440512u;
  _134 = 134217728u;
  _136 = 150994944u;
  _138 = 167772160u;
  ivec2 _602 = ivec2(gl_GlobalInvocationID.xy);
  vec2 _609 = (vec2(_602) + vec2(0.5)) * _617._m0.zw;
  float _623 = _281._m46;
  float _627 = 1.0 / _623;
  vec2 _630 = _609 - vec2(0.5);
  float _634 = length(_630);

  if (_281._m47 == 3u) {
    _609 = floor(_609 * vec2(320.0, 240.0)) / vec2(320.0, 240.0);
  } else {
    if (_281._m47 == 5u) {
      vec2 _661 = _609;
      vec2 _663 = vec2(0.0078125, 0.02083333395421504974365234375);
      vec2 _664 = _91(_661, _663);
      _609 = _664;
      vec2 _673 = vec2(_281._m48, _609.y * 40.0);
      _609.x += ((_98(_673) * _617._m1.z) * 0.001000000047497451305389404296875);
    } else {
      if (_281._m47 == 6u) {
        vec2 _690 = vec2(1.0) / (_617._m0.zw * 4.0);
        _609 = floor(_609 * _690) / _690;
      } else {
        if (_281._m47 == 7u) {
          vec2 _711 = vec2(1.0) / (_617._m0.zw * 4.0);
          _609 = floor(_609 * _711) / _711;
        }
      }
    }
  }
  vec2 _724 = (_726.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0).xy - vec2(0.4980392158031463623046875)) * 0.0199999995529651641845703125;
  _724.x *= _627;
  float _752 = _726.Sample(_728, vec4(_609 + _724, 0.0, 0.0).xy, 0.0).z;
  vec2 _772 = _609 + (_724 * _752);
  float _778 = _617._m11;

  if (_778 > 0.0) {
    float _786 = float(_778 < 1.0);
    vec2 _790 = _609;
    _790.x *= _623;
    _790.x *= (1.0 + (0.4000000059604644775390625 * _786));
    _790.y -= ((_786 * _281._m48) * 2.0);
    _790 *= 6.0;
    _790 += vec2(_281._m48 * 1.5);
    vec2 _823 = vec2(sin(_790.x - _790.y) * sin(_790.y), cos(_790.x + _790.y) * cos(_790.y)) * 0.0040000001899898052215576171875;
    _823.x *= _627;
    _823 *= (1.0 + ((_786 * 3000.0) * _823.x));
    _772 += (_823 * _778);
  }
  float _866 = _281._m49;
  bool _874 = _281._m50 != 0.0;
  bool _882;
  if (!_874) {
    _882 = _281._m3.z != 0.0;
  } else {
    _882 = _874;
  }
  bool _870 = _882;
  vec3 _934;

  if (_870 || (_866 != 0.0)) {
    if (_866 != 0.0) {
      float _893 = 1.0 - (0.100000001490116119384765625 * _866);
      float _898 = 0.100000001490116119384765625 * _866;
      float _901 = (_772.x * _893) + (0.75 * _898);
      float _910 = 0.25 * _898;
      float _914 = 0.0;

      if (_870) {
        _914 = _918.Sample(_728, vec4(_901, _772.y, 0.0, 0.0).xy, 0.0).w;
      }
      _934 = vec3(0.0);

      if (_914 != 0.0) {
        vec3 _940 = _941.Sample(_728, vec4(_901 + _910, _772.y, 0.0, 0.0).xy, 0.0).xyz;
        vec3 _961 = _941.Sample(_728, vec4(_901 + _910, _772.y, 0.0, 0.0).xy, 0.0).xyz;
        _934 += ((_940 + _961) * (_914 * 0.5));
      }

      if (_914 != 1.0) {
        vec3 _993 = _994.Sample(_728, vec4(_901 + _910, _772.y, 0.0, 0.0).xy, 0.0).xyz;
        vec3 _1014 = _994.Sample(_728, vec4(_901 + _910, _772.y, 0.0, 0.0).xy, 0.0).xyz;
        _934 += ((_993 + _1014) * ((1.0 - _914) * 0.5));
      }
    } else {
      float _1044 = 0.0;

      if (_870) {
        _1044 = _918.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).w;
      }
      _934 = vec3(0.0);

      if (_1044 != 0.0) {
        _934 += (_941.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).xyz * _1044);
      }

      if (_1044 != 1.0) {
        _934 += (_994.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).xyz * (1.0 - _1044));
      }
    }
  } else {
    _934 = _994.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).xyz;
  }
  bool _1129 = _617._m12 != 0.0;
  bool _1135;
  if (_1129) {
    _1135 = _281._m47 != 3u;
  } else {
    _1135 = _1129;
  }

  if (_1135) {
    float _1138 = _617._m12 * pow(_634, _617._m13 - 1.0);

    if (_1138 != 0.0) {
      vec2 _1152 = _630 * _1138;
      _934.x = _994.Sample(_728, vec4(_772 - _1152, 0.0, 0.0).xy, 0.0).x;
      _934.y = _994.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).y;
      _934.z = _994.Sample(_728, vec4(_772 + _1152, 0.0, 0.0).xy, 0.0).z;
    }
  }
  float _1214 = _617._m14;
  uint _1212 = _21(_1214);

  // Neither are SDR
  if ((_1212 & 16u) != 0u) {
    vec4 _1224 = _1225.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0);
    vec3 _1240 = _1224.xyz;
    vec3 _1243 = _101(_1240);
    _1224 = vec4(_1243.x, _1243.y, _1243.z, _1224.w);
    _934 = (_934 * (1.0 - _1224.w)) + _1224.xyz;
  }
  if (_617._m2.x > 0.0) {
    vec4 _1259 = _1260.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0);
    float _1278 = _1259.w;
    _934 = mix(_934, _1259.xyz, vec3(_10(_1278)));
  }

  if (_281._m47 == 5u) {
    vec4 _1289 = _1290.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0);
    vec2 _1312 = mix(_934.xz, _1289.xy, vec2(_617._m3.w));
    _934 = vec3(_1312.x, _934.y, _1312.y);
    float _1315 = _617._m4.z * 10.0;
    float _1321 = _617._m4.y;
    float _1324 = 10.0;
    float _1325 = 4.0;
    float _1326 = 0.100000001490116119384765625;
    float _1327 = 0.0030000000260770320892333984375;
    float _1329 = fract((_609.y * _1326) + (_281._m4.x * _1327));
    vec2 _1340 = vec2(vec2(0.5) - vec2(0.5, _1329));
    float _1352 = pow(dot(_1340, _1340), _1325);
    _1315 *= (_10(_1352) * _1324);
    vec2 _1367 = vec2(_281._m48 * 0.0199999995529651641845703125, _281._m48 * 0.031199999153614044189453125);
    _1321 *= mix(0.60000002384185791015625, 1.0, _98(_1367));
    float _1376 = _609.y - 0.660000026226043701171875;
    _1321 *= _10(_1376);
    float _1380 = 0.0;
    vec2 _1393 = vec2(_281._m48 * 0.2249999940395355224609375, (_609.y * _617._m5.x) * 100.0);
    _1380 += (_98(_1393) * _1321);
    vec2 _1408 = vec2(_281._m4.x * 0.7599999904632568359375, _609.y * 25.0);
    _1380 += (_98(_1408) * _1321);
    float _1414 = min((_1380 * 0.5) + 0.00200000009499490261077880859375, 0.00999999977648258209228515625) * _617._m4.w;
    vec2 _1424 = vec2((_609.x - _1380) - _1414, _609.y);
    vec2 _1434 = vec2(_609.x - _1380, _609.y);
    vec2 _1442 = vec2((_609.x - _1380) + _1414, _609.y);
    vec3 _1452 = vec3(0.0);
    _1452.x = _994.Sample(_728, vec4(_1424, 0.0, 0.0).xy, 0.0).x;
    _1452.y = _994.Sample(_728, vec4(_1434, 0.0, 0.0).xy, 0.0).y;
    _1452.z = _994.Sample(_728, vec4(_1442, 0.0, 0.0).xy, 0.0).z;
    float _1503 = _1315;
    _934 = mix(_934, _1452, vec3(_10(_1503)));
  }
  vec4 _1508 = _617._m6;
  float _1512 = _1513.Sample(_728, vec2(0.5), 0.0).x;
  float _1519 = _1508.w;
  _1512 = (_1519 != 0.0) ? _1519 : _1512;

  vec3 _1527 = _1528.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).xyz;
  vec3 _1544 = _1545.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).xyz;
  vec3 _1561 = _1562.Sample(_728, vec4((_609 * 1.39999997615814208984375) * vec2(1.0, _627), 0.0, 0.0).xy, 0.0).xyz;

  if (_617._m15 > 0.0) {
    float _1593 = _1597._m0[1];
    _934 *= _1593;
    _1527 *= _1593;
  }
  _934 += ((_1527 * _1561) * _1508.z);
  _934 += ((_1544 * ((_1561 * 0.5) + vec3(0.5))) * 0.100000001490116119384765625);
  _934 = ((_934 * _1508.x) + (_1527 * _1508.y)) * _1512;

  if (_281._m51 > 0.0) {
    _934 = _1641.Sample(_728, vec4(_772, 0.0, 0.0).xy, 0.0).xyz;
  }

  if (_617._m16 > 0.0) {
    // float _1663 = fract(texelFetch(sampler2D(_558, _1665), ivec2(_602) & ivec2(511), 0).x + (float(uint(_281._m4.x) % 8u) * 1.61803400516510009765625));
    float _1663 = fract(_558.Load(int3(int2(_602) & int2(511), 0)).x + (float(uint(_281._m4.x) % 8u) * 1.61803400516510009765625));
    _1663 = (_1663 - 0.5) / 255.0;
    vec3 _1694 = _934;
    float _1696 = _281._m52;
    vec3 _1692 = _81(_1694, _1696);
    _1692 = max(vec3(0.0), _1692 + vec3(_1663));
    _934 = _1707.Sample(_728, vec4(_1692, 0.0).xyz, 0.0).xyz;
  }
  float _1736 = pow(_634, _617._m17) * _617._m18;
  float _1726 = _10(_1736);
  _934 = mix(_934, _281._m5.xyz, vec3(_1726));
  float _1747 = _617._m19;
  uint _1745 = _21(_1747);

  if ((_1745 & 7u) != 0u) {
    ivec2 _1756 = ivec2(_602.x >> 1, _602.y);
    uint _1764 = uint(imageLoad(_1767, _1756).x * 255.0);
    uint _1774 = (_1764 >> uint((_602.x & 1) * 4)) & 15u;
    uint _1782 = _1774 & 7u;
    vec4 _1785 = _617._m7;
    bool _1789 = ((_1745 >> uint(3)) & 1u) != 0u;
    _1785.w *= float(((!_1789) || (_1782 == 0u)) || (_1782 == 6u));
    vec3 _1808 = _934;
    float _1807 = _52(_1808);
    _934 = mix(_934, _1785.xyz * _1807, vec3(_1785.w));
    bool _1820 = ((_1745 >> uint(1)) & 1u) != 0u;
    bool _1825 = ((_1745 >> uint(2)) & 1u) != 0u;

    if (_1825 && (_1782 == 0u)) {
      vec4 _1836 = _1837.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0);
      _934 = (_934 * (1.0 - _1836.w)) + _1836.xyz;
    }
    if ((_1782 >= 1u) && (_1782 <= 4u)) {
      _934 = _1871._m0[_1782 - 1u].xyz;
    }
    bool _1877 = (_1774 & 8u) != 0u;
    _934 = mix(_934, _617._m8.xyz, vec3(float(_1877) * _617._m8.w));
  }

  if (_281._m6.w > 0.0) {
    float _1898 = 1.0 - _1899.Sample(_1901, vec4(_772, 0.0, 0.0).xy, 0.0).x;
    float _1920 = _1898;
    bool _1922 = false;
    float _1923 = _59(_1920, _1922);
    vec3 _1917 = _69(_772, _1923);
    vec3 _1925 = vec3(subgroupShuffleXor(_1917.x, 1u), subgroupShuffleXor(_1917.y, 1u), subgroupShuffleXor(_1917.z, 1u));
    vec3 _1936 = vec3(subgroupShuffleXor(_1917.x, 8u), subgroupShuffleXor(_1917.y, 8u), subgroupShuffleXor(_1917.z, 8u));
    vec3 _1947 = _1925 - _1917;
    vec3 _1951 = _1936 - _1917;
    vec3 _1955 = _1917 + vec3(_281._m32, _281._m33, _281._m34);
    float _1968 = 0.25;
    float _1969 = 0.0199999995529651641845703125;
    vec3 _1970 = _1955;
    float _1972 = _1968;
    float _1974 = _1969 / _1968;
    vec3 _1978 = sqrt((_1947 * _1947) + (_1951 * _1951));
    float _1987 = 1.2000000476837158203125;
    vec3 _1989 = max(vec3(0.0), ((vec3(1.0) / _1978) - vec3(2.0 / _1972)) * _1987);
    vec3 _2000 = fract(_1970 / vec3(_1972));
    vec3 _2006 = (vec3(0.5 * _1974) - abs(_2000 - vec3(0.5))) * _1972;
    vec3 _2023 = vec3(0.5) + (_1989 * _2006);
    vec3 _2017 = _16(_2023);
    vec3 _2025 = normalize(cross(_1947, _1951));
    vec3 _2030 = sqrt(vec3(1.0) - (_2025 * _2025));
    _2030 = max(vec3(0.0), (_2030 - vec3(0.20000000298023223876953125)) / vec3(0.800000011920928955078125));
    _2017 *= _2030;
    float _2049 = _2017.x;
    float _2052 = _2017.y;
    float _2055 = _2017.z;
    float _2048 = _27(_2049, _2052, _2055);
    vec3 _2059 = _281._m6.xyz;
    float _2063 = length(_1955 - _2059);
    float _2068 = _281._m6.w;
    float _2071 = _2063 - _2068;
    float _2075 = 5.0;
    float _2082 = (-_2071) / _2075;
    float _2077 = _10(_2082);
    _2048 = 1.0 - (_2077 * (1.0 - _2048));
    float _2089 = 0.100000001490116119384765625;
    float _2090 = 5.0;
    float _2091 = 20.0;
    float _2105 = 1.0 + min((_2071 + _2090) / _2091, (-_2071) / _2089);
    float _2093 = _10(_2105);
    _2048 *= (_2093 * _2093);
    float _2112 = length(_1917);
    float _2118 = (_2112 - 1.0) / 4.0;
    _2048 *= _10(_2118);
    float _2127 = (5000.0 - _2063) / 4000.0;
    _2048 *= _10(_2127);
    vec3 _2131 = vec3(1.0, 0.319999992847442626953125, 0.0);
    _934 = mix(_934, _2131, vec3(_2048));
  }

  if (_617._m9.w != 0.0) {
    float _2145 = fract(_281._m48);
    float _2149 = fract(_281._m48 + 0.5);
    float _2154 = abs(1.0 - (_2145 / 0.5));
    vec2 _2159 = _2160.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0).xy;
    _2159 = (_2159 * 2.0) - vec2(1.0);
    float _2180 = _2160.Sample(_728, vec4(_609 + (_2159 * _2145), 0.0, 0.0).xy, 0.0).z;
    float _2204 = _2160.Sample(_728, vec4(_609 + (_2159 * _2149), 0.0, 0.0).xy, 0.0).z;
    float _2230 = _2154;
    _2154 = mix(_2180, _2204, _10(_2230));
    vec3 _2234 = vec3(_2154);
    _2234 *= _617._m9.xyz;
    float _2244 = _617._m9.w;
    _934 = mix(_934, _2234, vec3(_10(_2244)));
  }
  vec4 _2250 = vec4(0.0);
  vec4 _2252 = vec4(0.0);

  if (_617._m20 > 0.0) {
    float _2259 = 3.0;
    vec2 _2260 = abs((_609 * 2.0) - vec2(1.0));
    _2260.x = max(0.0, 1.0 - ((1.0 - _2260.x) / _627));
    float _2274 = 0.0416666679084300994873046875;
    vec2 _2276 = (floor(_2260 / vec2(_2274)) + vec2(0.5)) * _2274;
    _2250 = vec4(0.0);
    _2252 = vec4(0.0);
    for (int _2286 = 0; _2286 < 4; _2286++) {
      vec4 _2294 = _2298._m0[_2286];
      float _2303 = _2294.x;
      uint _2302 = _21(_2303);

      if (_2302 == 0u) {
        break;
      }
      float _2312 = _2294.y;
      float _2315 = _2294.z;
      float _2318 = _2294.w;
      float _2321 = pow(pow(_2260.x, _2312) + pow(_2260.y * _2318, _2312), 1.0 / _2312);
      uint _2337 = _2302;
      vec4 _2336 = _45(_2337);
      vec3 _2340 = _2336.xyz;
      vec3 _2343 = _33(_2340);
      _2336 = vec4(_2343.x, _2343.y, _2343.z, _2336.w);
      float _2346 = min(1.0, _2321 * 5.0);
      _2336.w *= _2346;
      float _2358 = 2.0 - _2312;
      float _2355 = 1.0 + (_10(_2358) * 0.4142135679721832275390625);
      float _2363 = (_2321 - _2315) / _2355;
      float _2369 = 0.300000011920928955078125;
      float _2371 = 0.4000000059604644775390625;
      float _2372 = max(0.0, 1.0 - max(_2363 / _2369, (-_2363) / _2371));
      _2372 *= _2372;
      _2372 *= _2372;
      _2372 *= 0.5;
      float _2397 = 1.2000000476837158203125 - (abs(_2363) * 50.0);
      float _2391 = _10(_2397);
      float _2399 = (_2372 + _2391) * _2336.w;
      _2252.w = ((1.0 - _2399) * _2252.w) + _2399;
      vec3 _2423 = (_2252.xyz * (1.0 - _2399)) + (_2336.xyz * _2399);
      _2252 = vec4(_2423.x, _2423.y, _2423.z, _2252.w);
      float _2426 = pow(pow(_2276.x, _2312) + pow(_2276.y * _2318, _2312), 1.0 / _2312);
      float _2441 = (_2426 - _2315) / _2355;
      float _2447 = max(0.0, 1.0 - (abs(_2441) / 0.054999999701976776123046875)) * _2336.w;
      vec3 _2462 = _2252.xyz + (_2336.xyz * _2447);
      _2252 = vec4(_2462.x, _2462.y, _2462.z, _2252.w);
      float _2465 = 0.0199999995529651641845703125;
      float _2466 = 0.60000002384185791015625 + (max(0.0, _2312 - 8.0) * 0.25);
      float _2473 = max(0.0, 1.0 - max(_2363 / _2465, (-_2363) / _2466));
      _2473 *= _2473;
      _2473 *= _2473;
      float _2490 = _2473 * _2336.w;
      _2250.w = ((1.0 - _2490) * _2250.w) + _2490;
      vec3 _2512 = (_2250.xyz * (1.0 - _2490)) + (_2336.xyz * _2490);
      _2250 = vec4(_2512.x, _2512.y, _2512.z, _2250.w);
    }
  }
  vec4 _2517 = _281._m7;
  vec4 _2520 = _281._m8;
  vec4 _2523 = _281._m9;

  if (_2517.w != 0.0) {
    float _2531 = _2520.z;
    float _2534 = _2520.w;
    vec2 _2537 = _2523.xy;
    vec4 _2609;

    if (_2534 != 0.0) {
      float _2544 = fract(_281._m48 / _2531);
      float _2550 = fract(0.5 + (_281._m48 / _2531));
      float _2557 = abs(1.0 - (2.0 * _2544));
      vec3 _2562 = _2563.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0).xyw;
      vec2 _2579 = ((_2562.xy * 2.0) - vec2(1.0)) * (_2534 * _2562.z);
      _2579.x *= _627;
      vec2 _2595 = _609 - (_2579 * (_2544 - 0.5));
      vec2 _2602 = _609 - (_2579 * (_2550 - 0.5));
      _2609 = mix(_2610.Sample(_2612, vec4(_2595 * _2537, 0.0, 0.0).xy, 0.0), _2610.Sample(_2612, vec4(_2602 * _2537, 0.0, 0.0).xy, 0.0), vec4(_2557));
    } else {
      _2609 = _2610.Sample(_2612, vec4(_609 * _2537, 0.0, 0.0).xy, 0.0);
    }

    float _2670 = float(_2523.w < 0.0);
    _2609 = mix(_2609, vec4(1.0, 1.0, 1.0, _2609.x), vec4(_2670));
    _2609.w *= min(1.0, _2520.x * pow(2.0 * _634, _2520.y));
    _2609.w *= abs(_2517.w);
    vec3 _2706 = _2609.xyz * _2517.xyz;
    _2609 = vec4(_2706.x, _2706.y, _2706.z, _2609.w);
    float _2709 = abs(_2523.w);
    vec3 _2716 = _2609.xyz * _2709;
    _2609 = vec4(_2716.x, _2716.y, _2716.z, _2609.w);
    vec3 _2719 = _2609.xyz * _2609.w;
    bool _2725 = _2523.z != 0.0;

    if (_2725) {
      _2609.w *= _2250.w;
      _2719 *= _2250.xyz;
    }
    float _2742 = 1.0 - (float(_2517.w > 0.0) * _2609.w);
    _934 = (_934 * _2742) + _2719;
  }
  _2517 = _281._m10;
  _2520 = _281._m11;
  _2523 = _281._m12;

  if (_2517.w != 0.0) {
    float _2768 = _2520.z;
    float _2771 = _2520.w;
    vec2 _2774 = _2523.xy;
    vec4 _2846;

    if (_2771 != 0.0) {
      float _2781 = fract(_281._m48 / _2768);
      float _2787 = fract(0.5 + (_281._m48 / _2768));
      float _2794 = abs(1.0 - (2.0 * _2781));
      vec3 _2799 = _2800.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0).xyw;
      vec2 _2816 = ((_2799.xy * 2.0) - vec2(1.0)) * (_2771 * _2799.z);
      _2816.x *= _627;
      vec2 _2832 = _609 - (_2816 * (_2781 - 0.5));
      vec2 _2839 = _609 - (_2816 * (_2787 - 0.5));
      _2846 = mix(_2847.Sample(_2849, vec4(_2832 * _2774, 0.0, 0.0).xy, 0.0), _2847.Sample(_2849, vec4(_2839 * _2774, 0.0, 0.0).xy, 0.0), vec4(_2794));
    } else {
      _2846 = _2847.Sample(_2849, vec4(_609 * _2774, 0.0, 0.0).xy, 0.0);
    }
    float _2907 = float(_2523.w < 0.0);
    _2846 = mix(_2846, vec4(1.0, 1.0, 1.0, _2846.x), vec4(_2907));
    _2846.w *= min(1.0, _2520.x * pow(2.0 * _634, _2520.y));
    _2846.w *= abs(_2517.w);
    vec3 _2943 = _2846.xyz * _2517.xyz;
    _2846 = vec4(_2943.x, _2943.y, _2943.z, _2846.w);
    float _2946 = abs(_2523.w);
    vec3 _2953 = _2846.xyz * _2946;
    _2846 = vec4(_2953.x, _2953.y, _2953.z, _2846.w);
    vec3 _2956 = _2846.xyz * _2846.w;
    bool _2962 = _2523.z != 0.0;

    if (_2962) {
      _2846.w *= _2250.w;
      _2956 *= _2250.xyz;
    }
    float _2979 = 1.0 - (float(_2517.w > 0.0) * _2846.w);
    _934 = (_934 * _2979) + _2956;
  }
  _2517 = _281._m13;
  _2520 = _281._m14;
  _2523 = _281._m15;

  if (_2517.w != 0.0) {
    float _3004 = _2520.z;
    float _3007 = _2520.w;
    vec2 _3010 = _2523.xy;
    vec4 _3082;

    if (_3007 != 0.0) {
      float _3017 = fract(_281._m48 / _3004);
      float _3023 = fract(0.5 + (_281._m48 / _3004));
      float _3030 = abs(1.0 - (2.0 * _3017));
      vec3 _3035 = _3036.Sample(_728, vec4(_609, 0.0, 0.0).xy, 0.0).xyw;
      vec2 _3052 = ((_3035.xy * 2.0) - vec2(1.0)) * (_3007 * _3035.z);
      _3052.x *= _627;
      vec2 _3068 = _609 - (_3052 * (_3017 - 0.5));
      vec2 _3075 = _609 - (_3052 * (_3023 - 0.5));
      _3082 = mix(_3083.Sample(_3085, vec4(_3068 * _3010, 0.0, 0.0).xy, 0.0), _3083.Sample(_3085, vec4(_3075 * _3010, 0.0, 0.0).xy, 0.0), vec4(_3030));
    } else {
      _3082 = _3083.Sample(_3085, vec4(_609 * _3010, 0.0, 0.0).xy, 0.0);
    }
    float _3143 = float(_2523.w < 0.0);
    _3082 = mix(_3082, vec4(1.0, 1.0, 1.0, _3082.x), vec4(_3143));
    _3082.w *= min(1.0, _2520.x * pow(2.0 * _634, _2520.y));
    _3082.w *= abs(_2517.w);
    vec3 _3179 = _3082.xyz * _2517.xyz;
    _3082 = vec4(_3179.x, _3179.y, _3179.z, _3082.w);
    float _3182 = abs(_2523.w);
    vec3 _3189 = _3082.xyz * _3182;
    _3082 = vec4(_3189.x, _3189.y, _3189.z, _3082.w);
    vec3 _3192 = _3082.xyz * _3082.w;
    bool _3198 = _2523.z != 0.0;

    if (_3198) {
      _3082.w *= _2250.w;
      _3192 *= _2250.xyz;
    }
    float _3215 = 1.0 - (float(_2517.w > 0.0) * _3082.w);
    _934 = (_934 * _3215) + _3192;
  }
  _934 = (_934 * (1.0 - _2252.w)) + _2252.xyz;
  int _3237 = int(_617._m21);

  for (int _3241 = 0; _3241 < _3237; _3241++) {
    vec4 _3250 = _3254._m0[_3241];
    float _3266 = pow(_634, _3250.z) * _3250.y;
    float _3258 = _10(_3266);
    float _3269 = _3250.x;
    uint _3273 = _21(_3269);
    vec3 _3268 = _45(_3273).xyz;
    vec3 _3277 = _3268;
    vec3 _3276 = _33(_3277);
    _934 = mix(_934, _3276, vec3(_3258));
  }

  if (_281._m16.x > 0.0) {
    vec4 _3292 = _3293.Sample(_728,
                              vec4((_609 * vec2(1.2999999523162841796875)) + (floor(vec2(_281._m48 * 15.0, _281._m48 * 20.0)) * 0.300000011920928955078125), 0.0, 0.0).xy,
                              0.0);
    float _3336 = _281._m16.x;
    _934 = mix(_934, _3292.xyz, vec3(_10(_3336))) * vec3(1.0, 0.20000000298023223876953125, 0.100000001490116119384765625);
  }

  if (_617._m10.w > 0.0) {
    float _3353 = _617._m10.w;
    _934 = mix(_934, _617._m10.xyz, vec3(_10(_3353)));
  }
  _934 = max(_934, vec3(0.0));
  bool _3363 = _281._m47 == 1u;
  bool _3370;
  if (!_3363) {
    _3370 = _281._m47 == 2u;
  } else {
    _3370 = _3363;
  }
  bool _3377;
  if (!_3370) {
    _3377 = _281._m47 == 4u;
  } else {
    _3377 = _3370;
  }
  bool _3384;
  if (!_3377) {
    _3384 = _281._m47 == 5u;
  } else {
    _3384 = _3377;
  }

  if (_3384) {
    float _3387 = 0.0;
    float _3388 = 1.0;
    float _3389 = 1.0;
    float _3390 = 1.0099999904632568359375;
    vec3 _3392 = vec3(1.0);

    if (_281._m47 == 1u) {
      _3388 = 0.75;
      _3389 = ((_1212 & 1u) == 0u) ? 2.0 : 1.25;
    } else {
      if (_281._m47 == 2u) {
        _3390 = ((_1212 & 1u) == 0u) ? 1.01499998569488525390625 : 1.0099999904632568359375;
        _3387 = 1.0;
        _3388 = 0.800000011920928955078125;
        _3389 = ((_1212 & 1u) == 0u) ? 2.5 : 1.5;
        _3392 = vec3(0.800000011920928955078125, 0.89999997615814208984375, 1.0);
      } else {
        if (_281._m47 == 4u) {
          _3388 = 0.0;
          _3390 = 1.0;
        } else {
          if (_281._m47 == 5u) {
            _3389 = ((_1212 & 1u) == 0u) ? 2.0 : 1.25;
            _3388 = 0.699999988079071044921875;
            _3390 = _617._m4.x;
            _3387 = 1.0;
          }
        }
      }
    }
    _934 *= _3392;
    float _3451 = smoothstep(0.100000001490116119384765625, 0.699999988079071044921875, 1.0 - (length(_609 - vec2(0.5)) * _3387));
    _934 *= _10(_3451);
    vec3 _3455 = _934;
    _934 = mix(vec3(_52(_3455)), _934, vec3(_3388));
    _934 *= _3389;
    _934 = max(vec3(0.0), mix(vec3(0.5), _934, vec3(_3390)));
  }

  if (_281._m47 == 5u) {
    vec2 _3477 = vec2(_609.x * _281._m46, _609.y) + (vec2(ivec2(_281._m17.xy) & ivec2(1023)) / vec2(1023.0));
    float _3517 = _3499.Sample(_562, vec4(_3477 * 4.30000019073486328125, 0.0, 0.0).xy, 0.0).x;
    float _3498 = _10(_3517);
    float _3540 = _3499.Sample(_562, vec4(_3477 * 0.07299999892711639404296875, 0.0, 0.0).xy, 0.0).x + 0.64999997615814208984375;
    _3498 *= _10(_3540);
    _934 *= mix(1.0, _3498, _617._m1.y);

  } else {
    if (_281._m47 == 7u) {
      vec3 _3577 = _934;
      vec3 _3580 = _39(_3577);
      vec3 _3582 = _39(_3580);
      float _3584 = _52(_3582);
      float _3576 = _10(_3584);
      int _3586 = int((_3576 - 0.00999999977648258209228515625) * 5.0);
      float _3592 = _3576;
      float _3599 = (floor(_10(_3592) * 8.0) / 8.0) + 0.300000011920928955078125;
      float _3591 = _10(_3599);
      _934 = _3575[_3586];
      _934 *= _3591;
      vec3 _3607 = _934;
      _934 = _33(_3607);
    } else {
      if (_281._m47 == 6u) {
        vec3 _3617 = _934;
        vec3 _3616 = _94(_3617);
        float _3620 = 8.0;
        _3616.x = (floor(_3616.x * _3620) / _3620) + ((1.0 / _3620) * 0.5);
        float _3633 = 4.0;
        _3616.y = (floor(_3616.y * _3633) / _3633) + ((1.0 / _3633) * 0.5);
        _3616.y = mix(_3616.y, 0.89999997615814208984375, 0.4000000059604644775390625);
        float _3650 = 16.0;
        _3616.z *= 1.39999997615814208984375;
        vec3 _3655 = _3616;
        _934 = _48(_3655);
      }
    }
  }
  vec3 _3658 = _934;

  if ((_1212 & 1u) == 0u) {
    vec3 _3666 = _934;
    float _3665 = _52(_3666);
    float _3669 = _281._m18.w;
    _934 = max(vec3(0.0), mix(vec3(_3665), _934 * _281._m18.xyz, vec3(_3669)));
    float _3683 = _281._m19.x;
    float _3686 = _281._m19.y;
    float _3689 = 0.100000001490116119384765625;
    float _3690 = 0.20000000298023223876953125;
    float _3691 = _281._m19.z;
    float _3694 = 0.300000011920928955078125;
    _3658 = (((_934 * ((_934 * _3683) + vec3(_281._m20.x))) + vec3(_281._m20.y)) / ((_934 * ((_934 * _3683) + vec3(_3686))) + vec3(_3690 * _3694))) - vec3(_281._m19.w);
    // _3658.rgb = renodx::tonemap::uncharted2::BT709(_934.rgb);
    vec3 _3730 = _3658 * _281._m20.z;
    _3658 = _39(_3730);
  } else {
    vec3 _3734 = _934;
    float _3733 = _52(_3734);
    float _3737 = _281._m18.w;
    _934 = mix(vec3(_3733), _934 * _281._m18.xyz, vec3(_3737));
    vec3 _3750 = _934;
    float lerpValue = _281._m53;
    if (RENODX_TONE_MAP_TYPE) {
      lerpValue = 1.f;
    }
    _934 = max(vec3(0.0), mix(vec3(_52(_3750)), _934, vec3(lerpValue)));
    vec3 _3762 = _934;
    float _3764 = _281._m52;
    vec3 _3761 = _85(_3762, _3764);
    _3658 = _3768.Sample(_728, vec4(_3761, 0.0).xyz, 0.0).xyz;
  }

  if (_281._m47 == 3u) {
    // SDR
    _3658 = floor(_3658 * 16.0) / vec3(16.0);
  }
  float _3801;
  if (_281._m54 == 0.0) {
    // Here
    uvec2 _3809 = uvec2(_602);
    uint _3810 = uint(_281._m4.x);
    _3801 = ((_76(_3809, _3810) * 2.0) - 1.0) / 255.0;
  } else {
    _3801 = 0.0;
  }
  float _3796 = _3801;
  _3658 = max(vec3(0.0), _3658 + vec3(_3796));
  imageStore(_3824, _602, vec4(_3658.x, _3658.y, _3658.z, 1.0));
}

