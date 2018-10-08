/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Point(T x, T y)
 * Creates a new Object instance.
 * @description Checks that coordinate properties of the created object are
 * equal to the constructor arguments.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(num x, num y) {
  Point point = new Point(x, y);
  Expect.equals(x, point.x);
  Expect.equals(y, point.y);
}

main() {
  check(0, 0);
  check(-1.0, 0);
  check(0, -1);
  check(1.0, 1);
  check(e, -pi);
}
