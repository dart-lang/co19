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
/// digits in an integer decimal number.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

const one = 0_0_0_1;

main() {
  Expect.equals(1000, 1_000);
  Expect.equals(-1000, -1_000);
  Expect.equals(1234567890, 1_2_3_4_5_6_7_8_9_0);
  Expect.equals(0, 0_0);
  Expect.equals(1, one);
  Expect.equals("1234567890", "${1_2_3_4_5_6_7_8_9_0}");
}
