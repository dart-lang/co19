/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion MutableRectangle(T left, T top, T width, T height)
 * ...
 * The rectangle contains the points with x-coordinate between left and
 * left + width, and with y-coordinate between top and top + height, both
 * inclusive.
 * @description Checks that the rectangle contains the points with x-coordinate
 * between left and left + width, and with y-coordinate between top and
 * top + height, both inclusive.
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);

  for (int i = r.left; i <= r.left + r.width; i++) {
    for (int j = r.top; j <= r.top + r.height; j++) {
      Expect.isTrue(r.containsPoint(new Point(i, j)));
    }
  }
  var step = 1;
  Expect.isFalse(r.containsPoint(new Point(r.left - step, r.top)));
  Expect.isFalse(r.containsPoint(new Point(r.left + r.width + step, r.top)));
  Expect.isFalse(r.containsPoint(new Point(r.left, r.top - step)));
  Expect.isFalse(r.containsPoint(new Point(r.left, r.top + r.height + step)));

  Expect.isFalse(r.containsPoint(new Point(r.left - step, r.top + r.height)));
  Expect.isFalse(
      r.containsPoint(new Point(r.left + r.width + step, r.top + r.height)));
  Expect.isFalse(r.containsPoint(new Point(r.left + r.width, r.top - step)));
  Expect.isFalse(
      r.containsPoint(new Point(r.left + r.width, r.top + r.height + step)));
}
