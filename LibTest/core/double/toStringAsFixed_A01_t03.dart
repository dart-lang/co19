/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * @description Checks return value for .0 and -.0.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(String expected, int digits) {
  Expect.equals(expected, .0.toStringAsFixed(digits));
  Expect.equals('-$expected', (-.0).toStringAsFixed(digits));
}

main() {
  check('0', 0);
  check('0.0', 1);
  check('0.00', 2);
  check('0.000', 3);
  check('0.0000', 4);
  check('0.00000', 5);
  check('0.000000', 6);
  check('0.0000000', 7);
  check('0.00000000', 8);
  check('0.000000000', 9);
}
