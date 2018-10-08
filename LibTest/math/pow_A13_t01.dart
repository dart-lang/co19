/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [y] is Infinity and the absolute value of [x] is less than 1, the
 *    result is 0.0.
 * @description Checks the result when [y] is infinite and the absolute value
 * of [x] is less than 1.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(.0, Math.pow(0.9999999999999999, double.infinity));
  Expect.equals(.0, Math.pow(-0.9999999999999999, double.infinity));

  Expect.equals(.0, Math.pow(0.5, double.infinity));
  Expect.equals(.0, Math.pow(-0.5, double.infinity));

  Expect.equals(.0, Math.pow(4.9406564584124654e-324, double.infinity));
  Expect.equals(.0, Math.pow(-4.9406564584124654e-324, double.infinity));
}
