/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * A MutableRectangle is only equal to another MutableRectangle with the same coordinates.
 * This MutableRectangle is equal to other if, and only if, other is a MutableRectangle with
 * the same coordinates.
 * @needsreview #16167, #16170
 * @description checks that MutableRectangle with a coordinate equal to NaN is not equal to itself.
 * @author kaigorodov
 */
import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle point=new MutableRectangle(0, double.NAN, 0, 0);
  Expect.isFalse(point == point);
  point=new MutableRectangle(double.NAN, 0, 0, 0);
  Expect.isFalse(point == point);
  point=new MutableRectangle(double.NAN, double.NAN, 0, 0);
  Expect.isFalse(point == point);
}