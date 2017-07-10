/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * If [x] is an int and exponent is a non-negative int, the result is an int,
 * otherwise both arguments are converted to doubles first, and the result is
 * a double.
 * @description Checks that the result is a double if [x] is a double
 * or [y] is a double or a negative int.
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.pow(0, .0) is double);
  Expect.isTrue(Math.pow(.0, 0) is double);
  Expect.isTrue(Math.pow(.0, .0) is double);
  Expect.isTrue(Math.pow(1, -1) is double);
  Expect.isTrue(Math.pow(1e1, -2) is double);
  Expect.isTrue(Math.pow(.25, .25) is double);
}
