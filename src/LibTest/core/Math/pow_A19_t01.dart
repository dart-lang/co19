/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static num pow(num x, num exponent)
 * Throws [NullPointerException] if one of the arguments is [:null:].
 * @description Checks that the correct exception is thrown.
 * @author msyabro
 * @reviewer pagolubev
 */

#import("dart:math", prefix: "Math");

check(var a1, var a2) {
  try {
    Math.pow(a1, a2);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}

main() {
  check(null, 1);
  check(1, null);
  check(0, null);
  check(null, 0);
  check(double.INFINITY, null);
  check(null, double.INFINITY);
  check(null, double.NAN);
  check(double.NAN, null);
  check(double.NEGATIVE_INFINITY, null);
  check(null, double.NEGATIVE_INFINITY);
  check(null, null);
}
