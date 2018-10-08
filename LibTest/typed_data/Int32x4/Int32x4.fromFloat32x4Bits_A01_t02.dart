/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4.fromFloat32x4Bits(Float32x4 x)
 * Returns a bit-wise copy of x as a Int32x4.
 * @description Checks special cases.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";
import "../toInt32.lib.dart";

main() {
  var obj = new Float32x4(double.infinity, double.negativeInfinity,
      double.nan, -double.nan);
  var res = new Int32x4.fromFloat32x4Bits(obj);

  Expect.equals(0x7f800000, res.x);
  Expect.equals(toInt32(0xff800000), res.y);

  var nanMask = 0x7f800000;
  var fraction = 0x7fffff;
  Expect.equals(nanMask, res.z & nanMask);
  Expect.isTrue((res.z & fraction) != 0);
  Expect.equals(nanMask, res.w & nanMask);
  Expect.isTrue((res.w & fraction) != 0);
}
