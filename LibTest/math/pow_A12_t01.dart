/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion pow(x, exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if x is -Infinity or -0.0 and y is not an odd integer, then the result
 *    is the same as pow(-x , y).
 * @description Checks the result when [x] is -Infinity or -0.0 and [y] is
 * not an odd integer.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, Math.pow(double.negativeInfinity, 2));
  Expect.equals(double.infinity, Math.pow(double.negativeInfinity, 2.0));
  Expect.equals(double.infinity, Math.pow(double.negativeInfinity, 22));
  Expect.equals(double.infinity, Math.pow(double.negativeInfinity, 22.0));
  Expect.equals(double.infinity, Math.pow(double.negativeInfinity, 0.2));
  Expect.equals(
      double.infinity, Math.pow(double.negativeInfinity, double.infinity));

  Expect.equals(.0, Math.pow(double.negativeInfinity, -2));
  Expect.isFalse(Math.pow(double.negativeInfinity, -2).isNegative);
  Expect.equals(.0, Math.pow(double.negativeInfinity, -2.0));
  Expect.isFalse(Math.pow(double.negativeInfinity, -2.0).isNegative);
  Expect.equals(.0, Math.pow(double.negativeInfinity, -22));
  Expect.isFalse(Math.pow(double.negativeInfinity, -22).isNegative);
  Expect.equals(.0, Math.pow(double.negativeInfinity, -22.0));
  Expect.isFalse(Math.pow(double.negativeInfinity, -22.0).isNegative);
  Expect.equals(.0, Math.pow(double.negativeInfinity, -0.2));
  Expect.isFalse(Math.pow(double.negativeInfinity, -0.2).isNegative);
  Expect.equals(
      .0, Math.pow(double.negativeInfinity, double.negativeInfinity));
  Expect.isFalse(
      Math.pow(double.negativeInfinity, double.negativeInfinity).isNegative);

  Expect.equals(.0, Math.pow(-.0, 2));
  Expect.isFalse(Math.pow(-.0, 2).isNegative);
  Expect.equals(.0, Math.pow(-.0, 2.0));
  Expect.isFalse(Math.pow(-.0, 2.0).isNegative);
  Expect.equals(.0, Math.pow(-.0, 22));
  Expect.isFalse(Math.pow(-.0, 22).isNegative);
  Expect.equals(.0, Math.pow(-.0, 22.0));
  Expect.isFalse(Math.pow(-.0, 22.0).isNegative);
  Expect.equals(.0, Math.pow(-.0, 0.2));
  Expect.isFalse(Math.pow(-.0, 0.2).isNegative);
  Expect.equals(.0, Math.pow(-.0, double.infinity));
  Expect.isFalse(Math.pow(-.0, double.infinity).isNegative);

  Expect.equals(double.infinity, Math.pow(-.0, -2));
  Expect.equals(double.infinity, Math.pow(-.0, -2.0));
  Expect.equals(double.infinity, Math.pow(-.0, -22));
  Expect.equals(double.infinity, Math.pow(-.0, -22.0));
  Expect.equals(double.infinity, Math.pow(-.0, -0.2));
  Expect.equals(double.infinity, Math.pow(-.0, double.negativeInfinity));
}
