/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T y
 * @description Checks that [y] returns the y coordinate of this point.
 * @note undocumented
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  var p = new Point(3, 5);
  Expect.equals(5, p.y);
  p = new Point(3, 4.5);
  Expect.equals(4.5, p.y);
  p = new Point(3, double.INFINITY);
  Expect.equals(double.INFINITY, p.y);
  p = new Point(3, double.NEGATIVE_INFINITY);
  Expect.equals(double.NEGATIVE_INFINITY, p.y);
  p = new Point(3, double.MIN_POSITIVE);
  Expect.equals(double.MIN_POSITIVE, p.y);
  p = new Point(3, -double.MIN_POSITIVE);
  Expect.equals(-double.MIN_POSITIVE, p.y);
  p = new Point(3, double.MAX_FINITE);
  Expect.equals(double.MAX_FINITE, p.y);
  p = new Point(3, -double.MAX_FINITE);
  Expect.equals(-double.MAX_FINITE, p.y);
  p = new Point(3, double.NAN);
  Expect.notEquals(double.NAN, p.y);
}
