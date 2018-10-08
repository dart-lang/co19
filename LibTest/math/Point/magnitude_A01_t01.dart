/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double magnitude
 * Get the straight line (Euclidean) distance between the origin (0, 0) and
 * this point.
 * @description Checks that the value of the property equals to the Euclidean
 * distance.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

const EPS = 1.0e-10;

void check(num x, num y) {
  Point point = new Point(x, y);
  double dist = sqrt(x * x + y * y);
  Expect.approxEquals(dist, point.magnitude, EPS);
}

main() {
  check(0, 0);
  check(-1.0, 0);
  check(0, -1);
  check(1.0, 1);
  check(e, -pi);
}
