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
/// digits in an float number. Test exponential format.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

const pi1 = 0.0_3_1_4E+0_2;
const pi2 = 3_1_4e-0_2;

main() {
  Expect.equals(10002345678.9, 0_1.0_0_0_2_3_4_5_6_7_8_9e+1_0);
  Expect.equals(10002345678.9, 0_1.0_0_0_2_3_4_5_6_7_8_9E1_0);
  Expect.equals(-10002345678.9, -0_1.0_0_0_2_3_4_5_6_7_8_9E1_0);
  Expect.equals(0.001023456789, 1_0_2_3_4_5_6_7.8_9E-1_0);
  Expect.equals(3.14, pi1);
  Expect.equals(3.14, pi2);
}
