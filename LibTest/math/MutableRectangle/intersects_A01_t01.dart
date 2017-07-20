/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool intersects(MutableRectangle<num> other)
 * Returns true if this intersects other.
 * @description Checks the predicate for some predefined data.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(MutableRectangle r1, MutableRectangle r2, bool expected) {
  bool actual1 = r1.intersects(r2);
  Expect.equals(expected, actual1, "r1=$r1, r2=$r2, expected=$expected");
  bool actual2 = r2.intersects(r1);
  Expect.equals(actual1, actual2, "r1=$r1, r2=$r2");
}

main() {
  MutableRectangle r = new MutableRectangle(0, 0, 1, 1);
  check(r, new MutableRectangle(0, 0, 1, 1), true);
  check(r, new MutableRectangle(0.5, 0, 0.5, 1), true);
  check(r, new MutableRectangle(-10, -5, 1, 1.5), false);
  check(r, new MutableRectangle(0, 0, 1.1, 1), true);
  check(r, new MutableRectangle(1.1, 1.1, 2, 2), false);
  check(r, new MutableRectangle(1.05, 1.05, 0.1, 0.1), false);
}
