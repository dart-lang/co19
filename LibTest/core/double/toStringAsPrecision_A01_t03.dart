/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsPrecision(int precision)
 * @description Checks return value for .0 and -.0.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(String expected, int digits) {
  Expect.equals(expected, .0.toStringAsPrecision(digits));
  Expect.equals('-$expected', (-.0).toStringAsPrecision(digits));
}

main() {
  check('0', 1);
  check('0.0', 2);
  check('0.00', 3);
  check('0.000', 4);
  check('0.0000', 5);
  check('0.00000', 6);
  check('0.000000', 7);
  check('0.0000000', 8);
  check('0.00000000', 9);
  check('0.000000000', 10);
}
