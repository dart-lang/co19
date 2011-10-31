/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If x is -∞ and y> 0 and y is an odd integer, the result is -∞.
 * If x is -∞ and y> 0 and y is not an odd integer, the result is +∞ .
 * @description Checks the result when x equals double.NEGATIVE_INFINITY and
 * y is positive integer.
 * @author pagolubev
 * @reviewer msyabro
 */

main() {
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 1));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 1.0));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 11));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 11.0));

  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 2));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 2.0));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 22));
  Expect.equals(double.INFINITY, Math.pow(double.NEGATIVE_INFINITY, 22.0));
}
