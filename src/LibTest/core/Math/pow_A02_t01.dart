/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If x is NaN and y is nonzero, the result is NaN.
 * @description Checks result if x is NaN.
 * @author msyabro
 * @reviewer pagolubev
 */

main() {
  Expect.isTrue(Math.pow(double.NAN, double.INFINITY).isNaN());
  Expect.isTrue(Math.pow(double.NAN, double.NEGATIVE_INFINITY).isNaN());
  Expect.isTrue(Math.pow(double.NAN, double.NAN).isNaN());
  Expect.isTrue(Math.pow(double.NAN, 1).isNaN());
  Expect.isTrue(Math.pow(double.NAN, 1.0).isNaN());
  Expect.isTrue(Math.pow(double.NAN, -1).isNaN());
  Expect.isTrue(Math.pow(double.NAN, -1.0).isNaN());
  Expect.isTrue(Math.pow(double.NAN, 3.33).isNaN());
  Expect.isTrue(Math.pow(double.NAN, -3.33).isNaN());
  Expect.isTrue(Math.pow(double.NAN, 3).isNaN());
  Expect.isTrue(Math.pow(double.NAN, -3).isNaN());
}
