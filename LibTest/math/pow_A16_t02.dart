/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [y] is -Infinity, the result is 1/pow([x], Infinity).
 * @description Checks the result when [y] is 1/pow([x], Infinity).
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(1 / Math.pow(0.9999999999999999, double.infinity),
      Math.pow(0.9999999999999999, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-0.9999999999999999, double.infinity),
      Math.pow(-0.9999999999999999, double.negativeInfinity));
  Expect.equals(1 / Math.pow(0.5, double.infinity),
      Math.pow(0.5, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-0.5, double.infinity),
      Math.pow(-0.5, double.negativeInfinity));
  Expect.equals(1 / Math.pow(4.9406564584124654e-324, double.infinity),
      Math.pow(4.9406564584124654e-324, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-4.9406564584124654e-324, double.infinity),
      Math.pow(-4.9406564584124654e-324, double.negativeInfinity));

  Expect.equals(1 / Math.pow(-1, double.infinity),
      Math.pow(-1, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-1.0, double.infinity),
      Math.pow(-1.0, double.negativeInfinity));

  Expect.equals(1 / Math.pow(1.0000000000000002, double.infinity),
      Math.pow(1.0000000000000002, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-1.0000000000000002, double.infinity),
      Math.pow(-1.0000000000000002, double.negativeInfinity));
  Expect.equals(1 / Math.pow(2, double.infinity),
      Math.pow(2, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-2, double.infinity),
      Math.pow(-2, double.negativeInfinity));
  Expect.equals(1 / Math.pow(123.123, double.infinity),
      Math.pow(123.123, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-123.123, double.infinity),
      Math.pow(-123.123, double.negativeInfinity));
  Expect.equals(1 / Math.pow(1.7976931348623157e308, double.infinity),
      Math.pow(1.7976931348623157e308, double.negativeInfinity));
  Expect.equals(1 / Math.pow(-1.7976931348623157e308, double.infinity),
      Math.pow(-1.7976931348623157e308, double.negativeInfinity));
}
