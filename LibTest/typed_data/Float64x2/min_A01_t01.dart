/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 min(Float64x2 other)
 * Returns the lane-wise minimum value in this or other.
 * @description Checks that the returned value contains minimum of
 * corresponding lane values from [this] and [other].
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "dart:math";
import "../../../Utils/expect.dart";

check(Float64x2 obj1, Float64x2 obj2) {
  var res = obj1.min(obj2);
  Expect.equals(min(obj1.x, obj2.x), res.x);
  Expect.equals(min(obj1.y, obj2.y), res.y);
}

main() {
  check(new Float64x2(.0, .0), new Float64x2(-1.0, -1.0));
  check(new Float64x2(-5.0, .0), new Float64x2(-1.0, -1.0));
  check(new Float64x2(1.0, 1.0), new Float64x2(-1.0, 6.0));
  check(new Float64x2(-5.0, 1.0001), new Float64x2(-1.0, 1.0));
  check(new Float64x2(10.0, -.05), new Float64x2(-1.0, .05));
  check(new Float64x2(0.23e-40, -0.0), new Float64x2(1.0, .0));
}
