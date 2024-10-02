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
/// @description Check that more than one `_` is allowed as a separator between
/// adjacent digits in an float number. Test exponential format.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

const pi1 = 0.0____________________________3_____1_____4e+0___________2;
const pi2 = 3______________1________________4E-0______________________2;

main() {
  Expect.equals(10002345678.9, 0__1.0__0__0__2__3__4___5__6__7__8__9E+1__0);
  Expect.equals(10002345678.9, 0__1.0__0__0__2__3__4___5__6__7__8__9e1__0);
  Expect.equals(-10002345678.9, -0__1.0__0__0__2__3__4___5__6__7__8__9e1__0);
  Expect.equals(0.001023456789, 1___0___2___3___4____5___6___7.8__9E-1___0);
  Expect.equals(3.14, pi1);
  Expect.equals(3.14, pi2);
}
