/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If y is +0, the result is 1, even if x is NaN.
 * If y is -0, the result is 1, even if x is NaN.
 * @description Checks result if y is zero.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;

main() {
  Expect.equals(1, Math.pow(double.NAN, .0));
  Expect.equals(1, Math.pow(double.NAN, -.0));

  Expect.equals(1, Math.pow(double.INFINITY, .0));
  Expect.equals(1, Math.pow(double.INFINITY, -.0));

  Expect.equals(1, Math.pow(double.NEGATIVE_INFINITY, .0));
  Expect.equals(1, Math.pow(double.NEGATIVE_INFINITY, -.0));

  Expect.equals(1, Math.pow(.0, .0));
  Expect.equals(1, Math.pow(-.0, .0));
  Expect.equals(1, Math.pow(.0, -.0));
  Expect.equals(1, Math.pow(-.0, -.0));
  Expect.equals(1, Math.pow(0, .0));
  Expect.equals(1, Math.pow(0, -.0));

  Expect.equals(1, Math.pow(11.11, .0));
  Expect.equals(1, Math.pow(11.11, -.0));
  Expect.equals(1, Math.pow(-11.11, .0));
  Expect.equals(1, Math.pow(-11.11, -.0));

  Expect.equals(1, Math.pow(11, .0));
  Expect.equals(1, Math.pow(11, -.0));
  Expect.equals(1, Math.pow(-11, .0));
  Expect.equals(1, Math.pow(-11, -.0));
}
