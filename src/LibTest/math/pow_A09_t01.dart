/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If x is +0 and y< 0, the result is +∞ .
 * @description Checks sample values.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;

main() {
  Expect.equals(double.INFINITY, Math.pow(.0, -4.9406564584124654e-324));
  Expect.equals(double.INFINITY, Math.pow(0, -4.9406564584124654e-324));

  Expect.equals(double.INFINITY, Math.pow(.0, -0.123));
  Expect.equals(double.INFINITY, Math.pow(0, -0.123));

  Expect.equals(double.INFINITY, Math.pow(.0, -111.11));
  Expect.equals(double.INFINITY, Math.pow(0, -111.11));

  Expect.equals(double.INFINITY, Math.pow(.0, -1.7976931348623157e308));
  Expect.equals(double.INFINITY, Math.pow(0, -1.7976931348623157e308));

  Expect.equals(double.INFINITY, Math.pow(.0, double.NEGATIVE_INFINITY));
  Expect.equals(double.INFINITY, Math.pow(0, double.NEGATIVE_INFINITY));

  Expect.equals(double.INFINITY, Math.pow(.0, -100));

  Expect.equals(double.INFINITY, Math.pow(.0, -9223372036854775808));
}
