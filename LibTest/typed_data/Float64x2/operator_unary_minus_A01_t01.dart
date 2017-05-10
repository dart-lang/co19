/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 operator unary-()
 * Negate operator.
 * @description Checks that every lane of the new [Float64x2] equals the
 * negate value of the corresponding lane of [this].
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1) {
  var op1 = new Float64x2(x1, y1);
  var res = -op1;
  Expect.equals(-x1, res.x);
  Expect.equals(-y1, res.y);
}

main() {
  check(.0, .1);
  check(1.23e18, -3.94e20);
  check(-1e-15, 0.23e-20);
  check(32.81e30, 1.907e2);
}
