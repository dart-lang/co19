/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If abs(x)< 1 and y is -∞, the result is +∞.
 * @description Checks result value.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(double.INFINITY, Math.pow(0.9999999999999999, double.NEGATIVE_INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-0.9999999999999999, double.NEGATIVE_INFINITY));

  Expect.equals(double.INFINITY, Math.pow(0.5, double.NEGATIVE_INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-0.5, double.NEGATIVE_INFINITY));

  Expect.equals(double.INFINITY, Math.pow(4.9406564584124654e-324, double.NEGATIVE_INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-4.9406564584124654e-324, double.NEGATIVE_INFINITY));

  Expect.equals(double.INFINITY, Math.pow(.0, double.NEGATIVE_INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-.0, double.NEGATIVE_INFINITY));
  Expect.equals(double.INFINITY, Math.pow(0, double.NEGATIVE_INFINITY));
}
