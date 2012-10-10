/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If x is +∞ and y< 0, the result is +0.
 * @description Checks the result when x equals double.INFINITY and y is negative.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;

main() {
  Expect.equals(0, Math.pow(double.INFINITY, -1));
  Expect.equals(0, Math.pow(double.INFINITY, -1.0));
  Expect.equals(0, Math.pow(double.INFINITY, -11));
  Expect.equals(0, Math.pow(double.INFINITY, -11.11));
  Expect.equals(0, Math.pow(double.INFINITY, double.NEGATIVE_INFINITY));
}
