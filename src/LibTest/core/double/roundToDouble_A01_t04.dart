/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double roundToDouble()
 * Returns the integer value, as a double, closest to this.
 * Rounds away from zero when there is no closest integer:
 * (3.5).roundToDouble() == 4 and (-3.5).roundToDouble() == -4.
 * @description Checks that [:roundToDouble():] does not change the object.
 * @author msyabro
 */
import "../../../Utils/expect.dart";


check(double d) {
  double oldVal = d;
  d.roundToDouble();
  Expect.equals(oldVal, d);
}

main() {
  check(.0);
  check(.1);
  check(1.0);
  check(33.333);
  check(4.9406564584124654e-324);  // min subnormal
  check(2.2250738585072014e-308);  // min normal
  check(1.7976931348623157e308);  // max normal
}
