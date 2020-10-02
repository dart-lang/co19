/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It's not a compile error to read definitely unassigned local
 * variable in the form var x;
 *
 * @description Checks that it's not a compile error to read definitely
 * unassigned local variable in the form var x;. Test indirect read via compound
 * assignment
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

main() {
  var x1;
  try {
    x1 *= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x2;
  try {
    x2 /= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x3;
  try {
    x3 ~/= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x4;
  try {
    x4 %= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x5;
  try {
    x5 += 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x6;
  try {
    x6 -= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x7;
  try {
    x7 <<= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x8;
  try {
    x8 >>= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x9;
  try {
    x1 &= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x10;
  try {
    x10 ^= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x11;
  try {
    x11 |= 2;
    Expect.fail("Exception expected");
  } catch (_) {}

  var x12;
  x12 ??= 2;
  Expect.equals(2, x12);
}
