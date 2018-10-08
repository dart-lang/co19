/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [x] is 0.0 and [y] is negative, the result is Infinity.
 * @description Checks the result when [x] is 0.0 and [y] is negative.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, Math.pow(.0, -4.9406564584124654e-324));
  Expect.equals(double.infinity, Math.pow(0, -4.9406564584124654e-324));

  Expect.equals(double.infinity, Math.pow(.0, -0.123));
  Expect.equals(double.infinity, Math.pow(0, -0.123));

  Expect.equals(double.infinity, Math.pow(.0, -111.11));
  Expect.equals(double.infinity, Math.pow(0, -111.11));

  Expect.equals(double.infinity, Math.pow(.0, -1.7976931348623157e308));
  Expect.equals(double.infinity, Math.pow(0, -1.7976931348623157e308));

  Expect.equals(double.infinity, Math.pow(.0, double.negativeInfinity));
  Expect.equals(double.infinity, Math.pow(0, double.negativeInfinity));

  Expect.equals(double.infinity, Math.pow(.0, -100));
  Expect.equals(double.infinity, Math.pow(0, -100));

  Expect.equals(double.infinity, Math.pow(.0, -9223372036854775808));
  Expect.equals(double.infinity, Math.pow(0, -9223372036854775808));
}
