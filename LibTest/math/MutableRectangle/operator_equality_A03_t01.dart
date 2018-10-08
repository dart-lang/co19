/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * ...
 * Reflexive: For all objects o, o == o must be true.
 * @description Checks that MutableRectangle with a coordinate equal to NaN is
 * not equal to itself.
 * @needsreview #16167, #16170
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle point = new MutableRectangle(0, double.nan, 0, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.nan, 0, 0, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.nan, double.nan, 0, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.infinity, 0, double.negativeInfinity, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.negativeInfinity, 0, double.infinity, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(0, double.infinity, 0, double.negativeInfinity);
  Expect.isFalse(point == point);
  point = new MutableRectangle(0, double.negativeInfinity, 0, double.infinity);
  Expect.isFalse(point == point);
}
