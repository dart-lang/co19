/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If x is -0 and y < 0 and y is an odd integer, the result is -∞.
 * If x is -0 and y< 0 and y is not an odd integer, the result is +∞ .
 * @description Checks for odd integer, even integer and decimal exponents.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview In IEEE standard -0 differs from +0, but this is not so in Dart.
 * Is it a bug or the expected behavior?
 * @needsreview issue 449
 */

#import("dart:math", prefix: "Math");

main() {
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -1));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -1.0));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -9223372036854775809));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -9223372036854775809.0));

  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -1.001));
  Expect.equals(double.INFINITY, Math.pow(-.0, -2));
  Expect.equals(double.INFINITY, Math.pow(-.0, -2.0));
  Expect.equals(double.INFINITY, Math.pow(-.0, -17.17));
  Expect.equals(double.INFINITY, Math.pow(-.0, -9223372036854775810));
  Expect.equals(double.INFINITY, Math.pow(-.0, -9223372036854775810.0));
}
