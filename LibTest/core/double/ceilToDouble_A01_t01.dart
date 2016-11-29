/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double ceilToDouble()
 * Returns the least integer value no smaller than this.
 * The result is a double.
 * @description Checks that positive values less than one are rounded to one.
 * @author pagolubev
 */
import "dart:math" as Math;
import "../../../Utils/expect.dart";

check(double argument) {
  Expect.equals(1.0, argument.ceilToDouble());
}

main() {
  check(.1);
  check(.01);
  check(1.0E-100);
  check(4.9406564584124654e-324); // min value
  check(2.2250738585072014e-308); // min normal
  check(.5);
  check(.9);
  check(1.0 - Math.pow(2.0, -53));
}
