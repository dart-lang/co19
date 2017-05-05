/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 clamp(Float64x2 lowerLimit, Float64x2 upperLimit)
 * Lane-wise clamp this to be in the range lowerLimit-upperLimit.
 * @description Checks that the returned value is in the correct range.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(obj, lowerLimit, upperLimit, expected) {
  var res = obj.clamp(lowerLimit, upperLimit);
  Expect.equals(expected.x, res.x);
  Expect.equals(expected.y, res.y);
}

main() {
  check(new Float64x2(.0, .0), new Float64x2(-1.0, -1.0),
      new Float64x2(1.0, 1.0,), new Float64x2(.0, .0));
  check(new Float64x2(-5.0, .0), new Float64x2(-1.0, -1.0),
      new Float64x2(1.0, 1.0), new Float64x2(-1.0, .0));
  check(new Float64x2(-5.0, 1.0), new Float64x2(-1.0, -1.0),
      new Float64x2(1.0, 1.0), new Float64x2(-1.0, 1.0));
  check(new Float64x2(-5.0, 1.0001), new Float64x2(-1.0, -1.0),
      new Float64x2(1.0, 1.0), new Float64x2(-1.0, 1.0));
  check(new Float64x2(-5.0, 1e20), new Float64x2(-1.0, -2.0),
      new Float64x2(10.0, .05), new Float64x2(-1.0, .05));
  check(new Float64x2(0.23e-40, -0.0), new Float64x2(1.0, .0),
      new Float64x2(1.0, 1.0), new Float64x2(1.0, .0));
  check(new Float64x2(1e40, -1e40), new Float64x2(5.0, 5.0),
      new Float64x2(5.0, 5.0), new Float64x2(5.0, 5.0));
}
