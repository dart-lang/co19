/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsRectangle(MutableRectangle<num> another)
 * Tests whether this entirely contains another.
 * @description Checks the predicate for some predefined data.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(
    MutableRectangle r1, MutableRectangle r2, bool expected1, bool expected2) {
  bool actual1 = r1.containsRectangle(r2);
  Expect.equals(expected1, actual1, "r1=$r1, r2=$r2, expected1=$expected1");
  bool actual2 = r2.containsRectangle(r1);
  Expect.equals(expected2, actual2, "r1=$r1, r2=$r2, expected2=$expected2");
}

main() {
  MutableRectangle r = new MutableRectangle(0, 0, 1, 1);
  check(r, new MutableRectangle(0, 0, 1, 1), true, true);
  check(r, new MutableRectangle(0.5, 0, 0.5, 1), true, false);
  check(r, new MutableRectangle(0, -0.5, 1, 1.5), false, true);
  check(r, new MutableRectangle(0, 0, 1.1, 1), false, true);
  check(r, new MutableRectangle(1, 1, 2, 2), false, false);
  check(r, new MutableRectangle(0.5, 0.5, 1, 1), false, false);
}
