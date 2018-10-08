/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 operator /(Float32x4 other)
 * Division operator.
 * @description Checks division by zero.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var op1 = new Float32x4(1.0, 0.0, -1.0, 1.0);
  var op2 = new Float32x4(0.0, 0.0, 0.0, -0.0);
  var res = op1 / op2;
  Expect.isTrue(res.x.isInfinite);
  Expect.isFalse(res.x.isNegative);

  Expect.isTrue(res.y.isNaN);

  Expect.isTrue(res.z.isInfinite);
  Expect.isTrue(res.z.isNegative);

  Expect.isTrue(res.w.isInfinite);
  Expect.isTrue(res.w.isNegative);
}
