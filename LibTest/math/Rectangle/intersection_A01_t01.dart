/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Rectangle<T> intersection(Rectangle<T> other)
 * Computes the intersection of this and other.
 * The intersection of two axis-aligned rectangles, if any, is always another
 * axis-aligned rectangle.
 * Returns the intersection of this and other, or null if they don't intersect.
 * @description Checks the function for some predefined data.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(Rectangle r1, Rectangle r2, Rectangle expected) {
  Rectangle actual1 = r1.intersection(r2);
  Expect.equals(expected, actual1,
      "r1=$r1, r2=$r2, expected=$expected, actual1=$actual1");
  Rectangle actual2 = r2.intersection(r1);
  Expect.equals(actual1, actual2, "r1=$r1, r2=$r2");
}

main() {
  Rectangle r = new Rectangle(0, 0, 1, 1);
  check(r, new Rectangle(0, 0, 1, 1), new Rectangle(0, 0, 1, 1));
  check(r, new Rectangle(0.5, 0, 0.5, 1), new Rectangle(0.5, 0, 0.5, 1));
  check(r, new Rectangle(-10, -5, 1, 1.5), null);
  check(r, new Rectangle(0, 0, 1.1, 1), new Rectangle(0, 0, 1, 1));
  check(r, new Rectangle(1.1, 1.1, 2, 2), null);
  check(r, new Rectangle(1.0, 1.0, 2.1, 3.1), new Rectangle(1.0, 1.0, 0, 0));
}
