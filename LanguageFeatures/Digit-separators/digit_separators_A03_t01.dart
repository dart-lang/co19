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
/// digits in an float number.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

const pi = 0_3.14_15_926;
const e = 2_71.828_1800 / 1_00;

main() {
  Expect.equals(1000.123, 1_000.12_3);
  Expect.equals(-1000.123, -1_000.12_3);
  Expect.approxEquals(123.0456789, 1_2_3.0_4_5_6_7_8_9_0, 0.000_000_1);
  Expect.equals(0.11, 0_0.1_1);
  Expect.approxEquals(3.1415926, pi, 0.000_000_1);
  Expect.approxEquals(2.7182818, e, 0.000_000_1);
  Expect.equals("12.34", "${1_2.3_4}");
}
