/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion MutableRectangle.fromPoints(Point<T> a, Point<T> b)
 * ...
 * The rectangle contains the points with x-coordinate between a.x and b.x, and
 * with y-coordinate between a.y and b.y, both inclusive.
 * @description Checks that the rectangle contains the points with x-coordinate
 * between a.x and b.x, and with y-coordinate between a.y and b.y, both
 * inclusive.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

void check(Point p1, Point p2) {
  MutableRectangle r = new MutableRectangle.fromPoints(p1, p2);
  Expect.equals(min(p1.x, p2.x), r.left);
  Expect.equals(min(p1.y, p2.y), r.top);
  Expect.equals((p2.x - p1.x).abs(), r.width);
  Expect.equals((p2.y - p1.y).abs(), r.height);
}

main() {
  Point p1 = new Point(2, 1);
  Point p2 = new Point(22, 16);
  MutableRectangle r = new MutableRectangle.fromPoints(p1, p2);

  for (int i = p1.x; i <= p2.x; i++) {
    for (int j = p1.y; j <= p2.y; j++) {
      Expect.isTrue(r.containsPoint(new Point(i, j)));
    }
  }
  var step = 1;
  Expect.isFalse(r.containsPoint(new Point(p1.x, p1.y - step)));
  Expect.isFalse(r.containsPoint(new Point(p1.x, p2.y + step)));
  Expect.isFalse(r.containsPoint(new Point(p1.x - step, p1.y)));
  Expect.isFalse(r.containsPoint(new Point(p2.x + step, p1.y)));

  Expect.isFalse(r.containsPoint(new Point(p1.x - step, p2.y)));
  Expect.isFalse(r.containsPoint(new Point(p2.x + step, p2.y )));
  Expect.isFalse(r.containsPoint(new Point(p2.x, p1.y - step)));
  Expect.isFalse(r.containsPoint(new Point(p2.x, p2.y + step)));
}
