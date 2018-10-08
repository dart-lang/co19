/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [x] is Infinity and [y] is positive, the result is Infinity.
 * @description Checks the result if [x] is Infinity and [y] is positive.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, Math.pow(double.infinity, 1));
  Expect.equals(double.infinity, Math.pow(double.infinity, 1.0));
  Expect.equals(double.infinity, Math.pow(double.infinity, 11));
  Expect.equals(double.infinity, Math.pow(double.infinity, 11.11));
  Expect.equals(double.infinity, Math.pow(double.infinity, double.infinity));
}
