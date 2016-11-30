/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator -(num other)
 * @description Checks that when the 'other' is less than spacing the result
 * is rounded to the closest double. If 'other' is in the middle between two
 * adjacent doubles it's rounded to the value which significand ends in an
 * even digit.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  // round to closest
  // spacing 1.0
  Expect.equals(4503599627370496.0, 4503599627370497.0 - .6);
  Expect.equals(4503599627370497.0, 4503599627370497.0 - .4);
  // spacing .5
  Expect.equals(2251799813685248.5, 2251799813685249.0 - .26);
  Expect.equals(2251799813685249.0, 2251799813685249.0 - .24);

  // round half to even
  Expect.equals(4503599627370496.0, 4503599627370497.0 - .5);
  Expect.equals(4503599627370498.0, 4503599627370498.0 - .5);

  Expect.equals(2251799813685249.0, 2251799813685249.0 - .25);
  Expect.equals(2251799813685248.0, 2251799813685248.5 - .25);

  //big difference of exponents
  Expect.equals(-2.225E-100, -1.256e-118 - 2.225e-100);
  Expect.equals(3.4567E100,  3.4567e100 - 4.125e-100);
  Expect.equals(-1.45E-200,  7.185478e-300 -1.45e-200);
  Expect.equals(8.569E20,    8.569e20 - 1.0);
}
