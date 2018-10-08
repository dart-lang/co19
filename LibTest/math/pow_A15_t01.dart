/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [y] is Infinity and the absolute value of [x] is greater than 1,
 * the result is Infinity.
 * @description Checks the result when [y] is Infinity and the absolute value
 * of [x] is greater than 1.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, Math.pow(1.0000000000000002, double.infinity));
  Expect.equals(
      double.infinity, Math.pow(-1.0000000000000002, double.infinity));

  Expect.equals(double.infinity, Math.pow(2, double.infinity));
  Expect.equals(double.infinity, Math.pow(-2, double.infinity));

  Expect.equals(double.infinity, Math.pow(123.123, double.infinity));
  Expect.equals(double.infinity, Math.pow(-123.123, double.infinity));

  Expect.equals(
      double.infinity, Math.pow(1.7976931348623157e308, double.infinity));
  Expect.equals(
      double.infinity, Math.pow(-1.7976931348623157e308, double.infinity));
}
