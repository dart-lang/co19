/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double ceil()
 * @description Checks that [:ceil():] called on a NaN returns the same value.
 * @author pagolubev
 * @reviewer msyabro
 */


import "dart:math" as Math;

check(double arg) {
  Expect.isTrue(arg.ceil().isNaN);
}

main() {
  double nan = .0 / .0;
  check(nan);
  check(-nan);
  check(0/(1.0 - 1.0));
  check(nan*100);
  check(Math.sqrt(-1.0));
  check(Math.sin(nan));
}
