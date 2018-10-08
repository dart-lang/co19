/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * ...
 * The method should also be consistent over time, so whether two objects are
 * equal should only change if at least one of the objects was modified.
 * @description Checks that the equality operator should be consistent
 * over time.
 * @author ngl@unipru.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";
 
main() {
  MutableRectangle r1 = new MutableRectangle(1, 2, 10, 6);
  MutableRectangle r2 =
      new MutableRectangle.fromPoints(new Point(1, 8), new Point(11, 2));
  Expect.isTrue(r1 == r2);

  r1.height = 5;
  Expect.isFalse(r1 == r2);

  r2.height = 5;
  Expect.isTrue(r1 == r2);
}
