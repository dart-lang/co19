/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4.splat(double v)
 * @description Checks special cases.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Float32x4.splat(0.0 / 0.0);
  Expect.isTrue(obj.x.isNaN);
  Expect.isTrue(obj.y.isNaN);
  Expect.isTrue(obj.z.isNaN);
  Expect.isTrue(obj.w.isNaN);

  obj = new Float32x4.splat(1.0 / 0.0);
  Expect.isTrue(obj.x.isInfinite);
  Expect.isFalse(obj.x.isNegative);
  Expect.isTrue(obj.y.isInfinite);
  Expect.isFalse(obj.y.isNegative);
  Expect.isTrue(obj.z.isInfinite);
  Expect.isFalse(obj.z.isNegative);
  Expect.isTrue(obj.w.isInfinite);
  Expect.isFalse(obj.w.isNegative);

  obj = new Float32x4.splat(1.0 / -0.0);
  Expect.isTrue(obj.x.isInfinite);
  Expect.isTrue(obj.x.isNegative);
  Expect.isTrue(obj.y.isInfinite);
  Expect.isTrue(obj.y.isNegative);
  Expect.isTrue(obj.z.isInfinite);
  Expect.isTrue(obj.z.isNegative);
  Expect.isTrue(obj.w.isInfinite);
  Expect.isTrue(obj.w.isNegative);
}
