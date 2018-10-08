/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 * This Rectangle is equal to other if, and only if, other is a Rectangle with
 * the same coordinates.
 * @needsreview #16167, #16170
 * @description Checks that Rectangle with a coordinate equal to NaN is not
 * equal to itself.
 * @author kaigorodov
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  Rectangle point = new Rectangle(0, double.nan, 0, 0);
  Expect.isFalse(point == point);
  point = new Rectangle(double.nan, 0, 0, 0);
  Expect.isFalse(point == point);
  point = new Rectangle(double.nan, double.nan, 0, 0);
  Expect.isFalse(point == point);
}
