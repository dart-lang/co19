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
  var p = new Point(3.0, 5.0);
  Expect.equals(5, p.y);
  p = new Point(3.0, 4.5);
  Expect.equals(4.5, p.y);
  p = new Point(3.0, double.infinity);
  Expect.equals(double.infinity, p.y);
  p = new Point(3.0, double.negativeInfinity);
  Expect.equals(double.negativeInfinity, p.y);
  p = new Point(3.0, double.minPositive);
  Expect.equals(double.minPositive, p.y);
  p = new Point(3.0, -double.minPositive);
  Expect.equals(-double.minPositive, p.y);
  p = new Point(3.0, double.maxFinite);
  Expect.equals(double.maxFinite, p.y);
  p = new Point(3.0, -double.maxFinite);
  Expect.equals(-double.maxFinite, p.y);
  p = new Point(3.0, double.nan);
  Expect.notEquals(double.nan, p.y);
}
