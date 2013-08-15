/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4 interleaveZWPairs(Float32x4 other)
 * Returns a new [Float32x4] with the Z and W lane value pairs
 * from [this] and [other] interleaved.
 * @description Checks that the returned value contains interleaved
 * Z and W lane value pairs from [this] and [other].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(thisObj, otherObj) {
  var res = thisObj.interleaveZWPairs(otherObj);
  Expect.isFalse(res == thisObj);
  Expect.isFalse(res == otherObj);
  Expect.equals(thisObj.z, res.x);
  Expect.equals(thisObj.w, res.y);
  Expect.equals(otherObj.z, res.z);
  Expect.equals(otherObj.w, res.w);
}

main() {
  check(new Float32x4(.0, .0, .0, .0), new Float32x4(.0, .0, .0, .0));
  check(new Float32x4(.0, 1.0, 2.0, -1.0), new Float32x4(-1.0, -2.0, -.02, -1.32));
  check(new Float32x4(2.0, -1.0, -4.0, .023), new Float32x4(1e-30, 1.23e-40, .02, 1e-10));
  check(new Float32x4(1.0, 10.3e-12, 1e-2, 0.23e40), new Float32x4(1.0, 2.0, 1e-3, .04e-2));
}