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
  p = new Point(double.INFINITY, 5.0);
  Expect.equals(double.INFINITY, p.x);
  p = new Point(double.NEGATIVE_INFINITY, 5.0);
  Expect.equals(double.NEGATIVE_INFINITY, p.x);
  p = new Point(double.MIN_POSITIVE, 5.0);
  Expect.equals(double.MIN_POSITIVE, p.x);
  p = new Point(-double.MIN_POSITIVE, 5.0);
  Expect.equals(-double.MIN_POSITIVE, p.x);
  p = new Point(double.MAX_FINITE, 5.0);
  Expect.equals(double.MAX_FINITE, p.x);
  p = new Point(-double.MAX_FINITE, 5.0);
  Expect.equals(-double.MAX_FINITE, p.x);
  p = new Point(double.NAN, 5.0);
  Expect.notEquals(double.NAN, p.x);
}
