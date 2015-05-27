import "../../../Utils/expect.dart";
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsExponential(int fractionDigits)
 * @description Checks the method on a set of values.
 * @author msyabro
 */

check(String expected, double val, int digits) {
  Expect.equals(expected, val.toStringAsExponential(digits));
  Expect.equals('-$expected', (-val).toStringAsExponential(digits));
}

main() {
  check('1e+0', 1.0, 0);
  check('1.0e+0', 1.0, 1);
  check('1.00e+0', 1.0, 2);
  check('1.000e+0', 1.0, 3);
  check('1.0000e+0', 1.0, 4);
  check('1.00000e+0', 1.0, 5);

  check('1e-1', 0.123456, 0);
  check('1.2e-1', 0.123456, 1);
  check('1.23e-1', 0.123456, 2);
  check('1.235e-1', 0.123456, 3);
  check('1.2346e-1', 0.123456, 4);
  check('1.23456e-1', 0.123456, 5);

  check('9e-14', 0.00000000000009, 0);
  check('9.0e-14', 0.00000000000009, 1);
  check('9.00e-14', 0.00000000000009, 2);
  check('9.000e-14', 0.00000000000009, 3);
  check('9.0000e-14', 0.00000000000009, 4);
  check('9.00000e-14', 0.00000000000009, 5);

  check('3e+0', 2.999999999, 0);
  check('3.0e+0', 2.999999999, 1);
  check('3.00e+0', 2.999999999, 2);
  check('3.000e+0', 2.999999999, 3);
  check('3.0000e+0', 2.999999999, 4);
  check('3.00000e+0', 2.999999999, 5);

  check('1e+2', 111.1111111, 0);
  check('1.1e+2', 111.1111111, 1);
  check('1.11e+2', 111.1111111, 2);
  check('1.111e+2', 111.1111111, 3);
  check('1.1111e+2', 111.1111111, 4);
  check('1.11111e+2', 111.1111111, 5);
}
