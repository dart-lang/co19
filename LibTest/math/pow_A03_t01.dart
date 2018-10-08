/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 *  - if [y] is zero (0.0 or -0.0), the result is always 1.0.
 * @description Checks the result if [y] is zero.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(1.0, Math.pow(double.nan, .0));
  Expect.equals(1.0, Math.pow(double.nan, -.0));

  Expect.equals(1.0, Math.pow(double.infinity, .0));
  Expect.equals(1.0, Math.pow(double.infinity, -.0));

  Expect.equals(1.0, Math.pow(double.negativeInfinity, .0));
  Expect.equals(1.0, Math.pow(double.negativeInfinity, -.0));

  Expect.equals(1.0, Math.pow(.0, .0));
  Expect.equals(1.0, Math.pow(-.0, .0));
  Expect.equals(1.0, Math.pow(.0, -.0));
  Expect.equals(1.0, Math.pow(-.0, -.0));
  Expect.equals(1.0, Math.pow(0, .0));
  Expect.equals(1.0, Math.pow(0, -.0));

  Expect.equals(1.0, Math.pow(11.11, .0));
  Expect.equals(1.0, Math.pow(11.11, -.0));
  Expect.equals(1.0, Math.pow(-11.11, .0));
  Expect.equals(1.0, Math.pow(-11.11, -.0));

  Expect.equals(1.0, Math.pow(11, .0));
  Expect.equals(1.0, Math.pow(11, -.0));
  Expect.equals(1.0, Math.pow(-11, .0));
  Expect.equals(1.0, Math.pow(-11, -.0));
}
