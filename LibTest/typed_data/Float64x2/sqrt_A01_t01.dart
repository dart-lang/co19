/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Float64x2 sqrt()
 * Returns the lane-wise square root of this.
 * @description Checks that the returned value is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "dart:math";
import "../../../Utils/expect.dart";

check(obj) {
  var res = obj.sqrt();
  Expect.equals(sqrt(obj.x), res.x);
  Expect.equals(sqrt(obj.y), res.y);
}

main() {
  check(new Float64x2(.0, .0));
  check(new Float64x2(-5.0, 5.0));
  check(new Float64x2(1e15, 1e-20));
  check(new Float64x2(10.0, -.05));
  check(new Float64x2(0.23e-40, -25.0));
}
