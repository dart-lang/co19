/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * @description Checks that 0.0123456789 and -0.0123456789 are properly rounded
 * and converted to string with 'fractionDigits' ranging from 0 to 10.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(String expected, int digits) {
  Expect.equals(expected, 0.0123456789.toStringAsFixed(digits));
  Expect.equals('-$expected', (-0.0123456789).toStringAsFixed(digits));
}

main() {
  check('0', 0);
  check('0.0', 1);
  check('0.01', 2);
  check('0.012', 3);
  check('0.0123', 4);
  check('0.01235', 5);
  check('0.012346', 6);
  check('0.0123457', 7);
  check('0.01234568', 8);
  check('0.012345679', 9);
  check('0.0123456789', 10);
}
