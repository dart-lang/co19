/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If x< 0 and x is finite and y is finite and y is not an integer, the result is NaN.
 * @description Checks that if x is finite negative number and y is finite number not
 * equal to a math integer the result is NaN.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.pow(-1, 0.5).isNaN);
  Expect.isTrue(Math.pow(-1, 1/3).isNaN);

  Expect.isTrue(Math.pow(-1.111, -0.5).isNaN);
  Expect.isTrue(Math.pow(-1.111, -2/3).isNaN);

  Expect.isTrue(Math.pow(-4.9406564584124654e-324, -1.1).isNaN);
  Expect.isTrue(Math.pow(-4.9406564584124654e-324, 0.5).isNaN);
}
