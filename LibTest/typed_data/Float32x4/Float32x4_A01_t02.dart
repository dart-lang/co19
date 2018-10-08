/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4(double x, double y, double z, double w)
 * Creates a new [Float32x4] instance.
 * @description Checks special cases.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Float32x4(1.0 / 0, -1.0 / 0, 0.0 / 0.0, -0.0);
  Expect.isTrue(obj.x.isInfinite);
  Expect.isFalse(obj.x.isNegative);

  Expect.isTrue(obj.y.isInfinite);
  Expect.isTrue(obj.y.isNegative);

  Expect.isTrue(obj.z.isNaN);

  Expect.equals(-0.0, obj.w);
}
