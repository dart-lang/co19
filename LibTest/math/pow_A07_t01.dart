/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [x] is Infinity and [y] is negative, the result is 0.0.
 * @description Checks the result if [x] is Infinity and [y] is negative.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(.0, Math.pow(double.infinity, -1));
  Expect.equals(.0, Math.pow(double.infinity, -1.0));
  Expect.equals(.0, Math.pow(double.infinity, -11));
  Expect.equals(.0, Math.pow(double.infinity, -11.11));
  Expect.equals(.0, Math.pow(double.infinity, double.negativeInfinity));
}
