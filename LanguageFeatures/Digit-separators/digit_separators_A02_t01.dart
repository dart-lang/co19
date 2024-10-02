// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Allow one or more `_`s between any two otherwise adjacent digits
/// of a `NUMBER` or `HEX_NUMBER` token. The following are not digits: The
/// leading `0x` or `0X` in `HEX_NUMBER`, and any `.`, `e`, `E`, `+` or `-` in
/// `NUMBER`.
///
/// That means only allowing `_`s between two `0-9` digits in `NUMBER` and
/// between two `0-9`, `a-f`, `A-F` digits in `HEX_NUMBER`.
///
/// @description Check that `_` is allowed as a separator between adjacent
/// digits in an integer hexadecimal number.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

const one = 0x0_0_0_1;

main() {
  Expect.equals(0x1000, 0x1_000);
  Expect.equals(-0x1000, -0x1_000);
  Expect.equals(0x12345678, 0x1_2_3_4_5_6_7_8);
  Expect.equals(0x90abcdef, 0x9_0_a_b_c_d_e_f);
  Expect.equals(0x90abcdef, 0x9_0_A_B_C_D_E_F);
  Expect.equals(0x89, 0x8_9);
  Expect.equals(1, one);
  Expect.equals(0x90abcdef.toString(), "${0x9_0_A_B_C_D_E_F}");
}
