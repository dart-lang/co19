/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * . . .
 * • \xHEX_DIGIT1 HEX_DIGIT2, equivalent to \u{ HEX_DIGIT1 HEX_DIGIT2}.
 * @description Checks that \xHEX_DIGIT1 HEX_DIGIT2 is equivalent to
 * \u{ HEX_DIGIT1 HEX_DIGIT2}.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.identical('\x00', '\u{00}');
  Expect.identical('\x01', '\u{01}');
  Expect.identical('\x02', '\u{02}');
  Expect.identical('\x03', '\u{03}');
  Expect.identical('\x04', '\u{04}');
  Expect.identical('\x05', '\u{05}');
  Expect.identical('\x06', '\u{06}');
  Expect.identical('\x07', '\u{07}');
  Expect.identical('\x08', '\u{08}');
  Expect.identical('\x09', '\u{09}');
  Expect.identical('\x0a', '\u{0a}');
  Expect.identical('\x0B', '\u{0B}');
  Expect.identical('\x0C', '\u{0c}');
  Expect.identical('\x0D', '\u{0D}');
  Expect.identical('\x0e', '\u{0E}');
  Expect.identical('\x0f', '\u{0f}');

  Expect.identical('\x10', '\u{10}');
  Expect.identical('\x11', '\u{11}');
  Expect.identical('\x12', '\u{12}');
  Expect.identical('\x13', '\u{13}');
  Expect.identical('\x14', '\u{14}');
  Expect.identical('\x15', '\u{15}');
  Expect.identical('\x16', '\u{16}');
  Expect.identical('\x17', '\u{17}');
  Expect.identical('\x18', '\u{18}');
  Expect.identical('\x19', '\u{19}');
  Expect.identical('\x1a', '\u{1a}');
  Expect.identical('\x1B', '\u{1B}');
  Expect.identical('\x1C', '\u{1c}');
  Expect.identical('\x1D', '\u{1D}');
  Expect.identical('\x1e', '\u{1E}');
  Expect.identical('\x1f', '\u{1f}');

  Expect.identical('\x20', '\u{20}');
  Expect.identical('\x21', '\u{21}');
  Expect.identical('\x22', '\u{22}');
  Expect.identical('\x23', '\u{23}');
  Expect.identical('\x24', '\u{24}');
  Expect.identical('\x25', '\u{25}');
  Expect.identical('\x26', '\u{26}');
  Expect.identical('\x27', '\u{27}');
  Expect.identical('\x28', '\u{28}');
  Expect.identical('\x29', '\u{29}');
  Expect.identical('\x2a', '\u{2a}');
  Expect.identical('\x2B', '\u{2B}');
  Expect.identical('\x2C', '\u{2c}');
  Expect.identical('\x2D', '\u{2D}');
  Expect.identical('\x2e', '\u{2E}');
  Expect.identical('\x2f', '\u{2f}');

  Expect.identical('\x30', '\u{30}');
  Expect.identical('\x31', '\u{31}');
  Expect.identical('\x32', '\u{32}');
  Expect.identical('\x33', '\u{33}');
  Expect.identical('\x34', '\u{34}');
  Expect.identical('\x35', '\u{35}');
  Expect.identical('\x36', '\u{36}');
  Expect.identical('\x37', '\u{37}');
  Expect.identical('\x38', '\u{38}');
  Expect.identical('\x39', '\u{39}');
  Expect.identical('\x3a', '\u{3a}');
  Expect.identical('\x3B', '\u{3B}');
  Expect.identical('\x3C', '\u{3c}');
  Expect.identical('\x3D', '\u{3D}');
  Expect.identical('\x3e', '\u{3E}');
  Expect.identical('\x3f', '\u{3f}');

  Expect.identical('\x40', '\u{40}');
  Expect.identical('\x41', '\u{41}');
  Expect.identical('\x42', '\u{42}');
  Expect.identical('\x43', '\u{43}');
  Expect.identical('\x44', '\u{44}');
  Expect.identical('\x45', '\u{45}');
  Expect.identical('\x46', '\u{46}');
  Expect.identical('\x47', '\u{47}');
  Expect.identical('\x48', '\u{48}');
  Expect.identical('\x49', '\u{49}');
  Expect.identical('\x4a', '\u{4a}');
  Expect.identical('\x4B', '\u{4B}');
  Expect.identical('\x4C', '\u{4c}');
  Expect.identical('\x4D', '\u{4D}');
  Expect.identical('\x4e', '\u{4E}');
  Expect.identical('\x4f', '\u{4f}');

  Expect.identical('\x50', '\u{50}');
  Expect.identical('\x51', '\u{51}');
  Expect.identical('\x52', '\u{52}');
  Expect.identical('\x53', '\u{53}');
  Expect.identical('\x54', '\u{54}');
  Expect.identical('\x55', '\u{55}');
  Expect.identical('\x56', '\u{56}');
  Expect.identical('\x57', '\u{57}');
  Expect.identical('\x58', '\u{58}');
  Expect.identical('\x59', '\u{59}');
  Expect.identical('\x5a', '\u{5a}');
  Expect.identical('\x5B', '\u{5B}');
  Expect.identical('\x5C', '\u{5c}');
  Expect.identical('\x5D', '\u{5D}');
  Expect.identical('\x5e', '\u{5E}');
  Expect.identical('\x5f', '\u{5f}');

  Expect.identical('\x60', '\u{60}');
  Expect.identical('\x61', '\u{61}');
  Expect.identical('\x62', '\u{62}');
  Expect.identical('\x63', '\u{63}');
  Expect.identical('\x64', '\u{64}');
  Expect.identical('\x65', '\u{65}');
  Expect.identical('\x66', '\u{66}');
  Expect.identical('\x67', '\u{67}');
  Expect.identical('\x68', '\u{68}');
  Expect.identical('\x69', '\u{69}');
  Expect.identical('\x6a', '\u{6a}');
  Expect.identical('\x6B', '\u{6B}');
  Expect.identical('\x6C', '\u{6c}');
  Expect.identical('\x6D', '\u{6D}');
  Expect.identical('\x6e', '\u{6E}');
  Expect.identical('\x6f', '\u{6f}');

  Expect.identical('\x70', '\u{70}');
  Expect.identical('\x71', '\u{71}');
  Expect.identical('\x72', '\u{72}');
  Expect.identical('\x73', '\u{73}');
  Expect.identical('\x74', '\u{74}');
  Expect.identical('\x75', '\u{75}');
  Expect.identical('\x76', '\u{76}');
  Expect.identical('\x77', '\u{77}');
  Expect.identical('\x78', '\u{78}');
  Expect.identical('\x79', '\u{79}');
  Expect.identical('\x7a', '\u{7a}');
  Expect.identical('\x7B', '\u{7B}');
  Expect.identical('\x7C', '\u{7c}');
  Expect.identical('\x7D', '\u{7D}');
  Expect.identical('\x7e', '\u{7E}');
  Expect.identical('\x7f', '\u{7f}');

  Expect.identical('\x80', '\u{80}');
  Expect.identical('\x81', '\u{81}');
  Expect.identical('\x82', '\u{82}');
  Expect.identical('\x83', '\u{83}');
  Expect.identical('\x84', '\u{84}');
  Expect.identical('\x85', '\u{85}');
  Expect.identical('\x86', '\u{86}');
  Expect.identical('\x87', '\u{87}');
  Expect.identical('\x88', '\u{88}');
  Expect.identical('\x89', '\u{89}');
  Expect.identical('\x8a', '\u{8a}');
  Expect.identical('\x8B', '\u{8B}');
  Expect.identical('\x8C', '\u{8c}');
  Expect.identical('\x8D', '\u{8D}');
  Expect.identical('\x8e', '\u{8E}');
  Expect.identical('\x8f', '\u{8f}');

  Expect.identical('\x90', '\u{90}');
  Expect.identical('\x91', '\u{91}');
  Expect.identical('\x92', '\u{92}');
  Expect.identical('\x93', '\u{93}');
  Expect.identical('\x94', '\u{94}');
  Expect.identical('\x95', '\u{95}');
  Expect.identical('\x96', '\u{96}');
  Expect.identical('\x97', '\u{97}');
  Expect.identical('\x98', '\u{98}');
  Expect.identical('\x99', '\u{99}');
  Expect.identical('\x9a', '\u{9a}');
  Expect.identical('\x9B', '\u{9B}');
  Expect.identical('\x9C', '\u{9c}');
  Expect.identical('\x9D', '\u{9D}');
  Expect.identical('\x9e', '\u{9E}');
  Expect.identical('\x9f', '\u{9f}');

  Expect.identical('\xA0', '\u{A0}');
  Expect.identical('\xA1', '\u{A1}');
  Expect.identical('\xA2', '\u{A2}');
  Expect.identical('\xA3', '\u{A3}');
  Expect.identical('\xA4', '\u{A4}');
  Expect.identical('\xA5', '\u{A5}');
  Expect.identical('\xA6', '\u{A6}');
  Expect.identical('\xA7', '\u{A7}');
  Expect.identical('\xA8', '\u{A8}');
  Expect.identical('\xA9', '\u{A9}');
  Expect.identical('\xAa', '\u{Aa}');
  Expect.identical('\xAB', '\u{AB}');
  Expect.identical('\xAC', '\u{Ac}');
  Expect.identical('\xAD', '\u{AD}');
  Expect.identical('\xAe', '\u{AE}');
  Expect.identical('\xAf', '\u{Af}');

  Expect.identical('\xb0', '\u{b0}');
  Expect.identical('\xb1', '\u{b1}');
  Expect.identical('\xb2', '\u{b2}');
  Expect.identical('\xb3', '\u{b3}');
  Expect.identical('\xb4', '\u{b4}');
  Expect.identical('\xb5', '\u{b5}');
  Expect.identical('\xb6', '\u{b6}');
  Expect.identical('\xb7', '\u{b7}');
  Expect.identical('\xb8', '\u{b8}');
  Expect.identical('\xb9', '\u{b9}');
  Expect.identical('\xba', '\u{ba}');
  Expect.identical('\xbB', '\u{bB}');
  Expect.identical('\xbC', '\u{bc}');
  Expect.identical('\xbD', '\u{bD}');
  Expect.identical('\xbe', '\u{bE}');
  Expect.identical('\xbf', '\u{bf}');

  Expect.identical('\xc0', '\u{c0}');
  Expect.identical('\xc1', '\u{c1}');
  Expect.identical('\xc2', '\u{c2}');
  Expect.identical('\xc3', '\u{c3}');
  Expect.identical('\xc4', '\u{c4}');
  Expect.identical('\xc5', '\u{c5}');
  Expect.identical('\xc6', '\u{c6}');
  Expect.identical('\xc7', '\u{c7}');
  Expect.identical('\xc8', '\u{c8}');
  Expect.identical('\xc9', '\u{c9}');
  Expect.identical('\xca', '\u{ca}');
  Expect.identical('\xcB', '\u{cB}');
  Expect.identical('\xcC', '\u{cc}');
  Expect.identical('\xcD', '\u{cD}');
  Expect.identical('\xce', '\u{cE}');
  Expect.identical('\xcf', '\u{cf}');

  Expect.identical('\xD0', '\u{D0}');
  Expect.identical('\xD1', '\u{D1}');
  Expect.identical('\xD2', '\u{D2}');
  Expect.identical('\xD3', '\u{D3}');
  Expect.identical('\xD4', '\u{D4}');
  Expect.identical('\xD5', '\u{D5}');
  Expect.identical('\xD6', '\u{D6}');
  Expect.identical('\xD7', '\u{D7}');
  Expect.identical('\xD8', '\u{D8}');
  Expect.identical('\xD9', '\u{D9}');
  Expect.identical('\xDa', '\u{Da}');
  Expect.identical('\xDB', '\u{DB}');
  Expect.identical('\xDC', '\u{Dc}');
  Expect.identical('\xDD', '\u{DD}');
  Expect.identical('\xDe', '\u{DE}');
  Expect.identical('\xDf', '\u{Df}');

  Expect.identical('\xE0', '\u{E0}');
  Expect.identical('\xE1', '\u{E1}');
  Expect.identical('\xE2', '\u{E2}');
  Expect.identical('\xE3', '\u{E3}');
  Expect.identical('\xE4', '\u{E4}');
  Expect.identical('\xE5', '\u{E5}');
  Expect.identical('\xE6', '\u{E6}');
  Expect.identical('\xE7', '\u{E7}');
  Expect.identical('\xE8', '\u{E8}');
  Expect.identical('\xE9', '\u{E9}');
  Expect.identical('\xEa', '\u{Ea}');
  Expect.identical('\xEB', '\u{EB}');
  Expect.identical('\xEC', '\u{Ec}');
  Expect.identical('\xED', '\u{ED}');
  Expect.identical('\xEe', '\u{EE}');
  Expect.identical('\xEf', '\u{Ef}');

  Expect.identical('\xf0', '\u{f0}');
  Expect.identical('\xf1', '\u{f1}');
  Expect.identical('\xf2', '\u{f2}');
  Expect.identical('\xf3', '\u{f3}');
  Expect.identical('\xf4', '\u{f4}');
  Expect.identical('\xf5', '\u{f5}');
  Expect.identical('\xf6', '\u{f6}');
  Expect.identical('\xf7', '\u{f7}');
  Expect.identical('\xf8', '\u{f8}');
  Expect.identical('\xf9', '\u{f9}');
  Expect.identical('\xfa', '\u{fa}');
  Expect.identical('\xfB', '\u{fB}');
  Expect.identical('\xfC', '\u{fc}');
  Expect.identical('\xfD', '\u{fD}');
  Expect.identical('\xfe', '\u{fE}');
  Expect.identical('\xff', '\u{ff}');
}
