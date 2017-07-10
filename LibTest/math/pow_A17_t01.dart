/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * Returns x to the power of exponent.
 * @description Checks that this method throws an Error if either [x] or
 * [exponent] is null (not a number).
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

check(var a1, var a2) {
  Expect.throws(() {
    Math.pow(a1, a2);
  });
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