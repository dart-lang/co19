/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double x
 * Extracted x value.
 * @description Checks that correct value is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(double x, double y) {
  Float64x2 fl64x2 = new Float64x2(x, y);
  double v = fl64x2.x;
  Expect.equals(x, v);
}

main() {
  check(1.0, 2.0);
  check(-1.0, 2.0);
  check(3.1e+38, -2.1e-30);
  check(1e-35, 2e+31);
}
