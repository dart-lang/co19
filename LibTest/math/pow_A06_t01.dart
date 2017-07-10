/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [x] is negative (but not -0.0) and [y] is a finite non-integer, the
 *    result is NaN.
 * @description Checks that if [x] is a negative number and
 * [y] is a finite non-integer, the result is NaN.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.pow(-1, 0.5).isNaN);
  Expect.isTrue(Math.pow(-1, 1/3).isNaN);

  Expect.isTrue(Math.pow(-1.111, -0.5).isNaN);
  Expect.isTrue(Math.pow(-1.111, -2/3).isNaN);

  Expect.isTrue(Math.pow(-4.9406564584124654e-324, -1.1).isNaN);
  Expect.isTrue(Math.pow(-4.9406564584124654e-324, 0.5).isNaN);
}
