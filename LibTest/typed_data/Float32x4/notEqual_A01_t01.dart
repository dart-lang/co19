/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4 notEqual(Float32x4 other)
 * Relational not-equal.
 * @description Checks that the returned [Int32x4] contains correct values.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(op1, op2, expected) {
  var res = op1.notEqual(op2);
  Expect.equals(expected.x, res.x);
  Expect.equals(expected.y, res.y);
  Expect.equals(expected.z, res.z);
  Expect.equals(expected.w, res.w);
}

main() {
  check(new Float32x4(.0, .0, .0, .0), new Float32x4(.0, .0, .0, .0),
      new Int32x4.bool(false, false, false, false));
  check(new Float32x4(.0, .0, .0, .0), new Float32x4(-1.0, 1.0, .02, 1.32),
      new Int32x4.bool(true, true, true, true));
  check(new Float32x4(1.0, -2.0, 1e-3, 0.23e40),
      new Float32x4(1.0, 2.0, 1e-3, .04e-2),
      new Int32x4.bool(false, true, false, true));
}
