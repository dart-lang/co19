/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion pow function defined by the IEEE Standard 754-2008
 * If x is an int and exponent is a non-negative int, the result is an int, otherwise both arguments are converted to doubles first, and the result is a double.
 * if x is 0.0 and y is negative, the result is Infinity.
 * if x is 0.0 and y is positive, the result is 0.0.
 * if x is -Infinity or -0.0 and y is an odd integer, then the result is -pow(-x ,y).
 * if x is -Infinity or -0.0 and y is not an odd integer, then the result is the same as pow(-x , y).
 * @description Checks for -0 base and odd integer, even integer and decimal exponents.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -1));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -1.0));
  // (-9223372036854775809).toDouble() is -9223372036854776000.0, not an even integer
  Expect.equals(double.INFINITY, Math.pow(-.0, -9223372036854775809));
  Expect.equals(double.INFINITY, Math.pow(-.0, -9223372036854775809.0));

  Expect.equals(double.INFINITY, Math.pow(-.0, -1.001));
  Expect.equals(double.INFINITY, Math.pow(-.0, -2));
  Expect.equals(double.INFINITY, Math.pow(-.0, -2.0));
  Expect.equals(double.INFINITY, Math.pow(-.0, -17.17));
  Expect.equals(double.INFINITY, Math.pow(-.0, -9223372036854775810));
  Expect.equals(double.INFINITY, Math.pow(-.0, -9223372036854775810.0));
}
