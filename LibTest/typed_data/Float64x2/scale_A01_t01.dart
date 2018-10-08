/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2 scale(double s)
 * Returns a copy of this each lane being scaled by s. Equivalent to
 * [this] * new Float64x2.splat(s).
 * @description Checks that the returned value is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(obj, s) {
  var res = obj.scale(s);
  Expect.equals(obj.x * s, res.x);
  Expect.equals(obj.y * s, res.y);
}

main() {
  check(new Float64x2(.0, .0), 5.0);
  check(new Float64x2(-5.0, .0), 6.0);
  check(new Float64x2(1.0, 1.0), 3.14);
  check(new Float64x2(-5.0, 1.0001), 2.23);
  check(new Float64x2(10.0, -.05), 4.0);
  check(new Float64x2(0.23e-40, -0.0), 11.0);
}
