// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not an error to read potentially assigned local variable in
/// the form var x;
///
/// @description Checks that it's not an error to read potentially assigned local
/// variable in the form var x;. Test indirect read via compound assignment
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  bool tr = true;
  bool fl = false;

  var x1;
  if (tr) {
    x1 = 42;
  }
  x1 *= 2;
  Expect.equals(42 * 2, x1);

  var y1;
  if (fl) {
    y1 = 42;
  }
  Expect.throws(() {y1 *= 2;});

  var x2;
  if (tr) {
    x2 = 42;
  }
  x2 /= 2;
  Expect.equals(42 / 2, x2);

  var y2;
  if (fl) {
    y2 = 42;
  }
  Expect.throws(() {y2 /= 2;});

  var x3;
  if (tr) {
    x3 = 42;
  }
  x3 ~/= 2;
  Expect.equals(42 ~/ 2, x3);

  var y3;
  if (fl) {
    y3 = 42;
  }
  Expect.throws(() {y3 ~/= 2;});

  var x4;
  if (tr) {
    x4 = 42;
  }
  x4 %= 22;
  Expect.equals(42 % 22, x4);

  var y4;
  if (fl) {
    y4 = 42;
  }
  Expect.throws(() {y4 %= 2;});

  var x5;
  if (tr) {
    x5 = 42;
  }
  x5 += 2;
  Expect.equals(42 + 2, x5);

  var y5;
  if (fl) {
    y5 = 42;
  }
  Expect.throws(() {y5 += 2;});

  var x6;
  if (tr) {
    x6 = 42;
  }
  x6 -= 2;
  Expect.equals(42 - 2, x6);

  var y6;
  if (fl) {
    y6 = 42;
  }
  Expect.throws(() {y6 -= 2;});

  var x7;
  if (tr) {
    x7 = 42;
  }
  x7 <<= 2;
  Expect.equals(42 << 2, x7);

  var y7;
  if (fl) {
    y7 = 42;
  }
  Expect.throws(() {y7 <<= 2;});

  var x8;
  if (tr) {
    x8 = 42;
  }
  x8 >>= 2;
  Expect.equals(42 >> 2, x8);

  var y8;
  if (fl) {
    y8 = 42;
  }
  Expect.throws(() {y8 >>= 2;});

  var x9;
  if (tr) {
    x9 = 42;
  }
  x9 &= 2;
  Expect.equals(42 & 2, x9);

  var y9;
  if (fl) {
    y9 = 42;
  }
  Expect.throws(() {y9 &= 2;});

  var x10;
  if (tr) {
    x10 = 42;
  }
  x10 ^= 2;
  Expect.equals(42 ^ 2, x10);

  var y10;
  if (fl) {
    y10 = 42;
  }
  Expect.throws(() {y10 ^= 2;});

  var x11;
  if (tr) {
    x11 = 42;
  }
  x11 |= 2;
  Expect.equals(42 | 2, x11);

  var y11;
  if (fl) {
    y11 = 42;
  }
  Expect.throws(() {y11 |= 2;});

  var x12;
  if (tr) {
    x12 = 42;
  }
  x12 ??= 2;
  Expect.equals(42, x12);

  var y12;
  if (fl) {
    y12 = 42;
  }
  y12 ??= 2;
  Expect.equals(2, y12);

}
