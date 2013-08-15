/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint32x4 toUint32x4()
 * Returns a bit-wise copy of this as a Uint32x4.
 * @description Checks special cases.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Float32x4(double.INFINITY, double.NEGATIVE_INFINITY, double.NAN, -double.NAN);
  var res = obj.toUint32x4();

  Expect.equals(0x7f800000, res.x);
  Expect.equals(0xff800000, res.y);
  Expect.equals(0xffc00000, res.z);
  Expect.equals(0xffc00000, res.w);
}