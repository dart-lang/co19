/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4.fromInt32x4Bits(Int32x4 x)
 * Returns a bit-wise copy of x as a Float32x4.
 * @description Checks special cases.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Int32x4(0x7f800000, 0xff800000, 0x7fc00000, 0x80000000);
  var res = new Float32x4.fromInt32x4Bits(obj);

  Expect.isTrue(res.x.isInfinite);
  Expect.isFalse(res.x.isNegative);

  Expect.isTrue(res.y.isInfinite);
  Expect.isTrue(res.y.isNegative);

  Expect.isTrue(res.z.isNaN);

  Expect.equals(-0.0, res.w);
}
