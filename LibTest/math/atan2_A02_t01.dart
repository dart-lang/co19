/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan2(num a, num b)
 * If [b] is positive, this is the same as atan(b/a).
 * @description Checks that if [b] is positive, the result equals
 * atan([a]/[b]).
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

check(num a, num b) {
  Expect.equals(Math.atan(a / b), Math.atan2(a, b));
}

main() {
  check(1, 1);
  check(-0.2, 1);
  check(2.0, .0);
  check(.0, 1e20);
  check(double.negativeInfinity, 0);
  check(double.infinity, 0);
}
