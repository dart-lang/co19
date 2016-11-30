/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double roundToDouble()
 * Returns the integer value, as a double, closest to this.
 * Rounds away from zero when there is no closest integer:
 * (3.5).round() == 4 and (-3.5).round() == -4.
 * @description Checks the method on a bunch of values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


check(double arg, double expected) {
  Expect.equals(expected, arg.roundToDouble());
  Expect.equals(-expected, (-arg).roundToDouble());
}

main() {
  check(0.1, .0);

  // min subnormal
  check(4.9406564584124654e-324, .0);

  // min normal
  check(2.2250738585072014e-308, .0);

  // max normal
  check(1.7976931348623157e308, 1.7976931348623157e308);

  // adjacent doubles

  check(.4999999999999999, .0);
  check(.49999999999999994, .0);
  check(.5, 1.0);
  check(.5000000000000001, 1.0);

  check(0.9999999999999999, 1.0);
  check(1.0, 1.0);
  check(1.0000000000000002, 1.0);
}
