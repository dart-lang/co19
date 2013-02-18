import "../../../Utils/expect.dart";
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsExponential(int fractionDigits)
 * @description Checks return value for .0 and -.0.
 * @author msyabro
 */

check(String expected, int digits) {
  Expect.equals(expected, .0.toStringAsExponential(digits));
  Expect.equals('-$expected', (-.0).toStringAsExponential(digits));
}

main() {
  check('0e+0', 0);
  check('0.0e+0', 1);
  check('0.00e+0', 2);
  check('0.000e+0', 3);
  check('0.0000e+0', 4);
  check('0.00000e+0', 5);
  check('0.000000e+0', 6);
  check('0.0000000e+0', 7);
  check('0.00000000e+0', 8);
  check('0.000000000e+0', 9);
}
