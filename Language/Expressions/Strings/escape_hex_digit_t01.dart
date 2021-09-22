// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Strings support escape sequences for special characters. The
/// escapes are:
/// . . .
/// • \xHEX_DIGIT1 HEX_DIGIT2, equivalent to \u{ HEX_DIGIT1 HEX_DIGIT2}.
/// @description Checks that \xHEX_DIGIT1 HEX_DIGIT2 is equivalent to
/// \u{ HEX_DIGIT1 HEX_DIGIT2}.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  const CheckIdentical('\x00', '\u{00}');
  const CheckIdentical('\x01', '\u{01}');
  const CheckIdentical('\x02', '\u{02}');
  const CheckIdentical('\x03', '\u{03}');
  const CheckIdentical('\x04', '\u{04}');
  const CheckIdentical('\x05', '\u{05}');
  const CheckIdentical('\x06', '\u{06}');
  const CheckIdentical('\x07', '\u{07}');
  const CheckIdentical('\x08', '\u{08}');
  const CheckIdentical('\x09', '\u{09}');
  const CheckIdentical('\x0a', '\u{0a}');
  const CheckIdentical('\x0B', '\u{0B}');
  const CheckIdentical('\x0C', '\u{0c}');
  const CheckIdentical('\x0D', '\u{0D}');
  const CheckIdentical('\x0e', '\u{0E}');
  const CheckIdentical('\x0f', '\u{0f}');

  const CheckIdentical('\x10', '\u{10}');
  const CheckIdentical('\x11', '\u{11}');
  const CheckIdentical('\x12', '\u{12}');
  const CheckIdentical('\x13', '\u{13}');
  const CheckIdentical('\x14', '\u{14}');
  const CheckIdentical('\x15', '\u{15}');
  const CheckIdentical('\x16', '\u{16}');
  const CheckIdentical('\x17', '\u{17}');
  const CheckIdentical('\x18', '\u{18}');
  const CheckIdentical('\x19', '\u{19}');
  const CheckIdentical('\x1a', '\u{1a}');
  const CheckIdentical('\x1B', '\u{1B}');
  const CheckIdentical('\x1C', '\u{1c}');
  const CheckIdentical('\x1D', '\u{1D}');
  const CheckIdentical('\x1e', '\u{1E}');
  const CheckIdentical('\x1f', '\u{1f}');

  const CheckIdentical('\x20', '\u{20}');
  const CheckIdentical('\x21', '\u{21}');
  const CheckIdentical('\x22', '\u{22}');
  const CheckIdentical('\x23', '\u{23}');
  const CheckIdentical('\x24', '\u{24}');
  const CheckIdentical('\x25', '\u{25}');
  const CheckIdentical('\x26', '\u{26}');
  const CheckIdentical('\x27', '\u{27}');
  const CheckIdentical('\x28', '\u{28}');
  const CheckIdentical('\x29', '\u{29}');
  const CheckIdentical('\x2a', '\u{2a}');
  const CheckIdentical('\x2B', '\u{2B}');
  const CheckIdentical('\x2C', '\u{2c}');
  const CheckIdentical('\x2D', '\u{2D}');
  const CheckIdentical('\x2e', '\u{2E}');
  const CheckIdentical('\x2f', '\u{2f}');

  const CheckIdentical('\x30', '\u{30}');
  const CheckIdentical('\x31', '\u{31}');
  const CheckIdentical('\x32', '\u{32}');
  const CheckIdentical('\x33', '\u{33}');
  const CheckIdentical('\x34', '\u{34}');
  const CheckIdentical('\x35', '\u{35}');
  const CheckIdentical('\x36', '\u{36}');
  const CheckIdentical('\x37', '\u{37}');
  const CheckIdentical('\x38', '\u{38}');
  const CheckIdentical('\x39', '\u{39}');
  const CheckIdentical('\x3a', '\u{3a}');
  const CheckIdentical('\x3B', '\u{3B}');
  const CheckIdentical('\x3C', '\u{3c}');
  const CheckIdentical('\x3D', '\u{3D}');
  const CheckIdentical('\x3e', '\u{3E}');
  const CheckIdentical('\x3f', '\u{3f}');

  const CheckIdentical('\x40', '\u{40}');
  const CheckIdentical('\x41', '\u{41}');
  const CheckIdentical('\x42', '\u{42}');
  const CheckIdentical('\x43', '\u{43}');
  const CheckIdentical('\x44', '\u{44}');
  const CheckIdentical('\x45', '\u{45}');
  const CheckIdentical('\x46', '\u{46}');
  const CheckIdentical('\x47', '\u{47}');
  const CheckIdentical('\x48', '\u{48}');
  const CheckIdentical('\x49', '\u{49}');
  const CheckIdentical('\x4a', '\u{4a}');
  const CheckIdentical('\x4B', '\u{4B}');
  const CheckIdentical('\x4C', '\u{4c}');
  const CheckIdentical('\x4D', '\u{4D}');
  const CheckIdentical('\x4e', '\u{4E}');
  const CheckIdentical('\x4f', '\u{4f}');

  const CheckIdentical('\x50', '\u{50}');
  const CheckIdentical('\x51', '\u{51}');
  const CheckIdentical('\x52', '\u{52}');
  const CheckIdentical('\x53', '\u{53}');
  const CheckIdentical('\x54', '\u{54}');
  const CheckIdentical('\x55', '\u{55}');
  const CheckIdentical('\x56', '\u{56}');
  const CheckIdentical('\x57', '\u{57}');
  const CheckIdentical('\x58', '\u{58}');
  const CheckIdentical('\x59', '\u{59}');
  const CheckIdentical('\x5a', '\u{5a}');
  const CheckIdentical('\x5B', '\u{5B}');
  const CheckIdentical('\x5C', '\u{5c}');
  const CheckIdentical('\x5D', '\u{5D}');
  const CheckIdentical('\x5e', '\u{5E}');
  const CheckIdentical('\x5f', '\u{5f}');

  const CheckIdentical('\x60', '\u{60}');
  const CheckIdentical('\x61', '\u{61}');
  const CheckIdentical('\x62', '\u{62}');
  const CheckIdentical('\x63', '\u{63}');
  const CheckIdentical('\x64', '\u{64}');
  const CheckIdentical('\x65', '\u{65}');
  const CheckIdentical('\x66', '\u{66}');
  const CheckIdentical('\x67', '\u{67}');
  const CheckIdentical('\x68', '\u{68}');
  const CheckIdentical('\x69', '\u{69}');
  const CheckIdentical('\x6a', '\u{6a}');
  const CheckIdentical('\x6B', '\u{6B}');
  const CheckIdentical('\x6C', '\u{6c}');
  const CheckIdentical('\x6D', '\u{6D}');
  const CheckIdentical('\x6e', '\u{6E}');
  const CheckIdentical('\x6f', '\u{6f}');

  const CheckIdentical('\x70', '\u{70}');
  const CheckIdentical('\x71', '\u{71}');
  const CheckIdentical('\x72', '\u{72}');
  const CheckIdentical('\x73', '\u{73}');
  const CheckIdentical('\x74', '\u{74}');
  const CheckIdentical('\x75', '\u{75}');
  const CheckIdentical('\x76', '\u{76}');
  const CheckIdentical('\x77', '\u{77}');
  const CheckIdentical('\x78', '\u{78}');
  const CheckIdentical('\x79', '\u{79}');
  const CheckIdentical('\x7a', '\u{7a}');
  const CheckIdentical('\x7B', '\u{7B}');
  const CheckIdentical('\x7C', '\u{7c}');
  const CheckIdentical('\x7D', '\u{7D}');
  const CheckIdentical('\x7e', '\u{7E}');
  const CheckIdentical('\x7f', '\u{7f}');

  const CheckIdentical('\x80', '\u{80}');
  const CheckIdentical('\x81', '\u{81}');
  const CheckIdentical('\x82', '\u{82}');
  const CheckIdentical('\x83', '\u{83}');
  const CheckIdentical('\x84', '\u{84}');
  const CheckIdentical('\x85', '\u{85}');
  const CheckIdentical('\x86', '\u{86}');
  const CheckIdentical('\x87', '\u{87}');
  const CheckIdentical('\x88', '\u{88}');
  const CheckIdentical('\x89', '\u{89}');
  const CheckIdentical('\x8a', '\u{8a}');
  const CheckIdentical('\x8B', '\u{8B}');
  const CheckIdentical('\x8C', '\u{8c}');
  const CheckIdentical('\x8D', '\u{8D}');
  const CheckIdentical('\x8e', '\u{8E}');
  const CheckIdentical('\x8f', '\u{8f}');

  const CheckIdentical('\x90', '\u{90}');
  const CheckIdentical('\x91', '\u{91}');
  const CheckIdentical('\x92', '\u{92}');
  const CheckIdentical('\x93', '\u{93}');
  const CheckIdentical('\x94', '\u{94}');
  const CheckIdentical('\x95', '\u{95}');
  const CheckIdentical('\x96', '\u{96}');
  const CheckIdentical('\x97', '\u{97}');
  const CheckIdentical('\x98', '\u{98}');
  const CheckIdentical('\x99', '\u{99}');
  const CheckIdentical('\x9a', '\u{9a}');
  const CheckIdentical('\x9B', '\u{9B}');
  const CheckIdentical('\x9C', '\u{9c}');
  const CheckIdentical('\x9D', '\u{9D}');
  const CheckIdentical('\x9e', '\u{9E}');
  const CheckIdentical('\x9f', '\u{9f}');

  const CheckIdentical('\xA0', '\u{A0}');
  const CheckIdentical('\xA1', '\u{A1}');
  const CheckIdentical('\xA2', '\u{A2}');
  const CheckIdentical('\xA3', '\u{A3}');
  const CheckIdentical('\xA4', '\u{A4}');
  const CheckIdentical('\xA5', '\u{A5}');
  const CheckIdentical('\xA6', '\u{A6}');
  const CheckIdentical('\xA7', '\u{A7}');
  const CheckIdentical('\xA8', '\u{A8}');
  const CheckIdentical('\xA9', '\u{A9}');
  const CheckIdentical('\xAa', '\u{Aa}');
  const CheckIdentical('\xAB', '\u{AB}');
  const CheckIdentical('\xAC', '\u{Ac}');
  const CheckIdentical('\xAD', '\u{AD}');
  const CheckIdentical('\xAe', '\u{AE}');
  const CheckIdentical('\xAf', '\u{Af}');

  const CheckIdentical('\xb0', '\u{b0}');
  const CheckIdentical('\xb1', '\u{b1}');
  const CheckIdentical('\xb2', '\u{b2}');
  const CheckIdentical('\xb3', '\u{b3}');
  const CheckIdentical('\xb4', '\u{b4}');
  const CheckIdentical('\xb5', '\u{b5}');
  const CheckIdentical('\xb6', '\u{b6}');
  const CheckIdentical('\xb7', '\u{b7}');
  const CheckIdentical('\xb8', '\u{b8}');
  const CheckIdentical('\xb9', '\u{b9}');
  const CheckIdentical('\xba', '\u{ba}');
  const CheckIdentical('\xbB', '\u{bB}');
  const CheckIdentical('\xbC', '\u{bc}');
  const CheckIdentical('\xbD', '\u{bD}');
  const CheckIdentical('\xbe', '\u{bE}');
  const CheckIdentical('\xbf', '\u{bf}');

  const CheckIdentical('\xc0', '\u{c0}');
  const CheckIdentical('\xc1', '\u{c1}');
  const CheckIdentical('\xc2', '\u{c2}');
  const CheckIdentical('\xc3', '\u{c3}');
  const CheckIdentical('\xc4', '\u{c4}');
  const CheckIdentical('\xc5', '\u{c5}');
  const CheckIdentical('\xc6', '\u{c6}');
  const CheckIdentical('\xc7', '\u{c7}');
  const CheckIdentical('\xc8', '\u{c8}');
  const CheckIdentical('\xc9', '\u{c9}');
  const CheckIdentical('\xca', '\u{ca}');
  const CheckIdentical('\xcB', '\u{cB}');
  const CheckIdentical('\xcC', '\u{cc}');
  const CheckIdentical('\xcD', '\u{cD}');
  const CheckIdentical('\xce', '\u{cE}');
  const CheckIdentical('\xcf', '\u{cf}');

  const CheckIdentical('\xD0', '\u{D0}');
  const CheckIdentical('\xD1', '\u{D1}');
  const CheckIdentical('\xD2', '\u{D2}');
  const CheckIdentical('\xD3', '\u{D3}');
  const CheckIdentical('\xD4', '\u{D4}');
  const CheckIdentical('\xD5', '\u{D5}');
  const CheckIdentical('\xD6', '\u{D6}');
  const CheckIdentical('\xD7', '\u{D7}');
  const CheckIdentical('\xD8', '\u{D8}');
  const CheckIdentical('\xD9', '\u{D9}');
  const CheckIdentical('\xDa', '\u{Da}');
  const CheckIdentical('\xDB', '\u{DB}');
  const CheckIdentical('\xDC', '\u{Dc}');
  const CheckIdentical('\xDD', '\u{DD}');
  const CheckIdentical('\xDe', '\u{DE}');
  const CheckIdentical('\xDf', '\u{Df}');

  const CheckIdentical('\xE0', '\u{E0}');
  const CheckIdentical('\xE1', '\u{E1}');
  const CheckIdentical('\xE2', '\u{E2}');
  const CheckIdentical('\xE3', '\u{E3}');
  const CheckIdentical('\xE4', '\u{E4}');
  const CheckIdentical('\xE5', '\u{E5}');
  const CheckIdentical('\xE6', '\u{E6}');
  const CheckIdentical('\xE7', '\u{E7}');
  const CheckIdentical('\xE8', '\u{E8}');
  const CheckIdentical('\xE9', '\u{E9}');
  const CheckIdentical('\xEa', '\u{Ea}');
  const CheckIdentical('\xEB', '\u{EB}');
  const CheckIdentical('\xEC', '\u{Ec}');
  const CheckIdentical('\xED', '\u{ED}');
  const CheckIdentical('\xEe', '\u{EE}');
  const CheckIdentical('\xEf', '\u{Ef}');

  const CheckIdentical('\xf0', '\u{f0}');
  const CheckIdentical('\xf1', '\u{f1}');
  const CheckIdentical('\xf2', '\u{f2}');
  const CheckIdentical('\xf3', '\u{f3}');
  const CheckIdentical('\xf4', '\u{f4}');
  const CheckIdentical('\xf5', '\u{f5}');
  const CheckIdentical('\xf6', '\u{f6}');
  const CheckIdentical('\xf7', '\u{f7}');
  const CheckIdentical('\xf8', '\u{f8}');
  const CheckIdentical('\xf9', '\u{f9}');
  const CheckIdentical('\xfa', '\u{fa}');
  const CheckIdentical('\xfB', '\u{fB}');
  const CheckIdentical('\xfC', '\u{fc}');
  const CheckIdentical('\xfD', '\u{fD}');
  const CheckIdentical('\xfe', '\u{fE}');
  const CheckIdentical('\xff', '\u{ff}');
}
