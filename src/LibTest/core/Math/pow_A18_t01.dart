/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If y is NaN, the result is NaN.
 * @description Checks the result if y is NaN.
 * @author msyabro
 * @reviewer pagolubev
 */

main() {
  Expect.isTrue(Math.pow(double.INFINITY, double.NAN).isNaN());
  Expect.isTrue(Math.pow(double.NEGATIVE_INFINITY, double.NAN).isNaN());
  Expect.isTrue(Math.pow(double.NAN, double.NAN).isNaN());
  Expect.isTrue(Math.pow(1, double.NAN).isNaN());
  Expect.isTrue(Math.pow(1.0, double.NAN).isNaN());
  Expect.isTrue(Math.pow(-1, double.NAN).isNaN());
  Expect.isTrue(Math.pow(-1.0, double.NAN).isNaN());
  Expect.isTrue(Math.pow(3.33, double.NAN).isNaN());
  Expect.isTrue(Math.pow(-3.33, double.NAN).isNaN());
  Expect.isTrue(Math.pow(3, double.NAN).isNaN());
  Expect.isTrue(Math.pow(-3, double.NAN).isNaN());
  Expect.isTrue(Math.pow(-.0, double.NAN).isNaN());
  Expect.isTrue(Math.pow(.0, double.NAN).isNaN());

}
