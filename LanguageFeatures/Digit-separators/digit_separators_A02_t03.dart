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

const _A = 1;
const _B = 1;
const _C = 1;
const _D = 1;
const _E = 1;
const _F = 1;

main() {
  final _a = 1;
  final _b = 1;
  final _c = 1;
  final _d = 1;
  final _e = 1;
  final _f = 1;

  Expect.equals(0x1A, 0x1_A);
  Expect.equals(0x1B, 0x1_B);
  Expect.equals(0x1C, 0x1_C);
  Expect.equals(0x1D, 0x1_D);
  Expect.equals(0x1E, 0x1_E);
  Expect.equals(0x1F, 0x1_F);
  Expect.equals(0x1A, 0x1_a);
  Expect.equals(0x1B, 0x1_b);
  Expect.equals(0x1C, 0x1_c);
  Expect.equals(0x1D, 0x1_d);
  Expect.equals(0x1E, 0x1_e);
  Expect.equals(0x1F, 0x1_f);
  Expect.equals(0x0abcdef, 0x0_a_b_c_d_e_f);
  Expect.equals(0x0abcdef, 0x0_A_B_C_D_E_F);
}
