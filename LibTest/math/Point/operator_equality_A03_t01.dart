/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * A Point is only equal to another Point with the same coordinates.
 * This point is equal to other if, and only if, other is a Point with x equal
 * to other.x and y equal to other.y.
 * @description Checks that Point with a coordinate equal to NaN is not equal
 * to itself.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  Point point = new Point(0, double.nan);
  Expect.isFalse(point == point);
  point = new Point(double.nan, 0);
  Expect.isFalse(point == point);
  point = new Point(double.nan, double.nan);
  Expect.isFalse(point == point);
}
