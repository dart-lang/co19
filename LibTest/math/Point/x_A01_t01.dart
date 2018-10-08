/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T x
 * @description Checks that [x] returns the x coordinate of this point.
 * @note undocumented
 * @author ngl@unipro.ru
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  var p = new Point(3.0, 5.0);
  Expect.equals(3, p.x);
  p = new Point(4.5, 5.0);
  Expect.equals(4.5, p.x);
  p = new Point(double.infinity, 5.0);
  Expect.equals(double.infinity, p.x);
  p = new Point(double.negativeInfinity, 5.0);
  Expect.equals(double.negativeInfinity, p.x);
  p = new Point(double.minPositive, 5.0);
  Expect.equals(double.minPositive, p.x);
  p = new Point(-double.minPositive, 5.0);
  Expect.equals(-double.minPositive, p.x);
  p = new Point(double.maxFinite, 5.0);
  Expect.equals(double.maxFinite, p.x);
  p = new Point(-double.maxFinite, 5.0);
  Expect.equals(-double.maxFinite, p.x);
  p = new Point(double.nan, 5.0);
  Expect.notEquals(double.nan, p.x);
}
