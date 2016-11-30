/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int round()
 * Returns the integer closest to this.
 * Rounds away from zero when there is no closest integer:
 * (3.5).round() == 4 and (-3.5).round() == -4.
 * @description Checks the method on a bunch of values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(int expected, double arg) {
  Expect.equals(expected, arg.round());
  Expect.equals(-expected, (-arg).round());
}

main() {
  check(0, 0.1);

  // min subnormal
  check(0, 4.9406564584124654e-324);

  // min normal
  check(0, 2.2250738585072014e-308);

  // adjacent doubles

  check(0, .4999999999999999);
  check(0, .49999999999999994);
  check(1, .5);
  check(1, .5000000000000001);

  check(1, 0.9999999999999999);
  check(1, 1.0);
  check(1, 1.0000000000000002);
}
