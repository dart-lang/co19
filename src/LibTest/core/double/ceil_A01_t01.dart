/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double ceil()
 * @description Checks that positive values less then one are rounded to one.
 * @author pagolubev
 * @reviewer msyabro
 */


import "dart:math" as Math;

check(double expected, double argument) {
  Expect.equals(expected, argument.ceil());
}

main() {
  check(1.0, .1);
  check(1.0, .01);
  check(1.0, 1.0E-100);
  check(1.0, 4.9406564584124654e-324); // min value
  check(1.0, 2.2250738585072014e-308); // min normal
  check(1.0, .5);
  check(1.0, .9);
  check(1.0, 1.0 - Math.pow(2.0, -53));
}
