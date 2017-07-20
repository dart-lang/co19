/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion MutableRectangle(T left, T top, T width, T height)
 * ...
 * If width and height are zero, the "rectangle" comprises only the single
 * point (left, top).
 * @description Checks that if width and height are zero, the "rectangle"
 * comprises only the single point (left, top).
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 0, 0);
  var step = .1;

  Expect.isTrue(r.containsPoint(new Point(r.left, r.top)));

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
