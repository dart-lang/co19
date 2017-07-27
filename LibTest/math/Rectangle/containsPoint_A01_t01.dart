/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool containsPoint(Point<num> another)
 * Tests whether another is inside or along the edges of this.
 * @description Checks the predicate for some predefined data.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(Rectangle r, num px, num py, bool expected) {
  Point p = new Point(px, py);
  bool actual = r.containsPoint(p);
  Expect.equals(expected, actual, "r=$r, p=$p, expected=$expected");
}

main() {
  Rectangle r = new Rectangle(0, 0, 1, 1);
  check(r, 0, 0, true);
  check(r, 0, 1, true);
  check(r, 1, 0, true);
  check(r, 0.5, 1, true);
  check(r, 1, 0.5, true);
  check(r, 0.5, 0.5, true);
  check(r, -0.001, 0, false);
  check(r, 0, -0.001, false);
  check(r, 1.0001, 0, false);
  check(r, 1.001, 1.0001, false);
  check(r, 1, -0.001, false);
  check(r, -0.001, -0.001, false);
  check(r, 1.001, -0.001, false);
}
