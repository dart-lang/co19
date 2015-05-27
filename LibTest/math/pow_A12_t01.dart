/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * if x is -Infinity or -0.0 and y is not an odd integer,
 * then the result is the same as pow(-x , y).
 * @description Checks the result when [x] is -Infinity
 * or -0.0 and [y] is not an odd integer.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 2));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 2.0));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 22));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 22.0));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 0.2));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, double.INFINITY));

  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -2));
  Expect.isFalse(Math.pow(double.NEGATIVE_INFINITY, -2).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -2.0));
  Expect.isFalse(Math.pow(double.NEGATIVE_INFINITY, -2.0).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -22));
  Expect.isFalse(Math.pow(double.NEGATIVE_INFINITY, -22).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -22.0));
  Expect.isFalse(Math.pow(double.NEGATIVE_INFINITY, -22.0).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -0.2));
  Expect.isFalse(Math.pow(double.NEGATIVE_INFINITY, -0.2).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, double.NEGATIVE_INFINITY));
  Expect.isFalse(Math.pow(double.NEGATIVE_INFINITY, double.NEGATIVE_INFINITY).isNegative);

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
  Expect.equals(.0, Math.pow(-.0, double.INFINITY));
  Expect.isFalse(Math.pow(-.0, double.INFINITY).isNegative);

  Expect.equals(double.INFINITY, Math.pow(-.0, -2));
  Expect.equals(double.INFINITY, Math.pow(-.0, -2.0));
  Expect.equals(double.INFINITY, Math.pow(-.0, -22));
  Expect.equals(double.INFINITY, Math.pow(-.0, -22.0));
  Expect.equals(double.INFINITY, Math.pow(-.0, -0.2));
  Expect.equals(double.INFINITY, Math.pow(-.0, double.NEGATIVE_INFINITY));
}
