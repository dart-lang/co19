/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If abs(x)> 1 and y is +∞, the result is +∞ .
 * @description Checks result value.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(double.INFINITY, Math.pow(1.0000000000000002, double.INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-1.0000000000000002, double.INFINITY));

  Expect.equals(double.INFINITY, Math.pow(2, double.INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-2, double.INFINITY));

  Expect.equals(double.INFINITY, Math.pow(123.123, double.INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-123.123, double.INFINITY));

  Expect.equals(double.INFINITY, Math.pow(1.7976931348623157e308, double.INFINITY));
  Expect.equals(double.INFINITY, Math.pow(-1.7976931348623157e308, double.INFINITY));
}
