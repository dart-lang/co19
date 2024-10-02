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
/// @description Check that more than `_` is allowed as a separator between
/// adjacent digits in an float number.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

const pi = 0_________________________3.14__________________15_____________926;
const e = 0.0______________271_______________828__________18_00 * 1_00;

main() {
  Expect.equals(1000.123, 1___________000.12_______________3);
  Expect.equals(-1000.123, -1___________000.12_______________3);
  Expect.equals(123.4567890, 1__2__3.4__5___6__7__8__9__0);
  Expect.equals(0.11, 0___0.1___1);
  Expect.equals(3.1415926, pi);
  Expect.approxEquals(2.7182818, e, 0.000_000_1);
  Expect.equals("12.34", "${1__2.3___4}");
}
