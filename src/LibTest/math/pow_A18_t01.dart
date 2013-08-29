/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion pow function defined by the IEEE Standard 754-2008
 * relevant cases:
 * If x is an int and exponent is a non-negative int, the result is an int, otherwise both arguments are converted to doubles first, and the result is a double.
 * if x is 1.0, the result is always 1.0.
 * otherwise, if either x or y is NaN then the result is NaN.
 * @description Checks the result if y is NaN.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.pow(double.INFINITY, double.NAN).isNaN);
  Expect.isTrue(Math.pow(double.NEGATIVE_INFINITY, double.NAN).isNaN);
  Expect.isTrue(Math.pow(double.NAN, double.NAN).isNaN);
  Expect.equals(1.0, Math.pow(1, double.NAN));
  Expect.equals(1.0, Math.pow(1.0, double.NAN));
  Expect.isTrue(Math.pow(-1, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-1.0, double.NAN).isNaN);
  Expect.isTrue(Math.pow(3.33, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-3.33, double.NAN).isNaN);
  Expect.isTrue(Math.pow(3, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-3, double.NAN).isNaN);
  Expect.isTrue(Math.pow(-.0, double.NAN).isNaN);
  Expect.isTrue(Math.pow(.0, double.NAN).isNaN);

}
