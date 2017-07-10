/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 * - otherwise, if either x or y is NaN then the result is NaN.
 * @description Checks the result when [x] or [y] is NaN.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.pow(double.NAN, double.INFINITY).isNaN);
  Expect.isTrue(Math.pow(double.NAN, double.NEGATIVE_INFINITY).isNaN);
  Expect.isTrue(Math.pow(double.NAN, double.NAN).isNaN);
  Expect.isTrue(Math.pow(double.NAN, 1).isNaN);
  Expect.isTrue(Math.pow(double.NAN, 1.0).isNaN);
  Expect.isTrue(Math.pow(double.NAN, -1).isNaN);
  Expect.isTrue(Math.pow(double.NAN, -1.0).isNaN);
  Expect.isTrue(Math.pow(double.NAN, 3.33).isNaN);
  Expect.isTrue(Math.pow(double.NAN, -3.33).isNaN);
  Expect.isTrue(Math.pow(double.NAN, 3).isNaN);
  Expect.isTrue(Math.pow(double.NAN, -3).isNaN);

  Expect.isTrue(Math.pow(double.INFINITY, double.NAN).isNaN);
  Expect.isTrue(Math.pow(double.NEGATIVE_INFINITY, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-1, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-1.0, double.NAN).isNaN);
  Expect.isTrue(Math.pow(3.33, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-3.33, double.NAN).isNaN);
  Expect.isTrue(Math.pow(3, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-3, double.NAN).isNaN);
}
