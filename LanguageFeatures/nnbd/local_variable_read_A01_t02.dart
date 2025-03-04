// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not an error to read definitely assigned local variable in
/// the form var x;
///
/// @description Checks that it's not an error to read definitely assigned local
/// variable in the form var x;. Test indirect read via compound assignment
///
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  var x1;
  x1 = 42;
  x1 *= 2;
  Expect.equals(42 * 2, x1);

  var x2;
  x2 = 42;
  x2 /= 2;
  Expect.equals(42 / 2, x2);

  var x3;
  x3 = 42;
  x3 ~/= 2;
  Expect.equals(42 ~/ 2, x3);

  var x4;
  x4 = 42;
  x4 %= 22;
  Expect.equals(42 % 22, x4);

  var x5;
  x5 = 42;
  x5 += 2;
  Expect.equals(42 + 2, x5);

  var x6;
  x6 = 42;
  x6 -= 2;
  Expect.equals(42 - 2, x6);

  var x7;
  x7 = 42;
  x7 <<= 2;
  Expect.equals(42 << 2, x7);

  var x8;
  x8 = 42;
  x8 >>= 2;
  Expect.equals(42 >> 2, x8);

  var x9;
  x9 = 42;
  x9 &= 2;
  Expect.equals(42 & 2, x9);

  var x10;
  x10 = 42;
  x10 ^= 2;
  Expect.equals(42 ^ 2, x10);

  var x11;
  x11 = 42;
  x11 |= 2;
  Expect.equals(42 | 2, x11);

  var x12;
  x12 = 42;
  x12 ??= 2;
  Expect.equals(42, x12);
}
