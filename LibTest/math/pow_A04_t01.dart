/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if x is 1.0, the result is always 1.0.
 * @description Checks the result if [x] is 1.0.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(1.0, Math.pow(1.0, double.nan));
  Expect.equals(1.0, Math.pow(1.0, double.infinity));
  Expect.equals(1.0, Math.pow(1.0, double.negativeInfinity));

  Expect.equals(1.0, Math.pow(1.0, .0));
  Expect.equals(1.0, Math.pow(1.0, -.0));

  Expect.equals(1.0, Math.pow(1.0, 11.11));
  Expect.equals(1.0, Math.pow(1.0, -11.11));
  Expect.equals(1.0, Math.pow(1.0, 11));
  Expect.equals(1.0, Math.pow(1.0, -11));

  Expect.equals(1.0, Math.pow(1.0, 1e20));
  Expect.equals(1.0, Math.pow(1.0, 1e-20));
}
