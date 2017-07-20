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
  MutableRectangle point = new MutableRectangle(0, double.NAN, 0, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.NAN, 0, 0, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.NAN, double.NAN, 0, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.INFINITY, 0, double.NEGATIVE_INFINITY, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(double.NEGATIVE_INFINITY, 0, double.INFINITY, 0);
  Expect.isFalse(point == point);
  point = new MutableRectangle(0, double.INFINITY, 0, double.NEGATIVE_INFINITY);
  Expect.isFalse(point == point);
  point = new MutableRectangle(0, double.NEGATIVE_INFINITY, 0, double.INFINITY);
  Expect.isFalse(point == point);
}
