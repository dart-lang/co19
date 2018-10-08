/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4List(int length)
 * Creates an [Float32x4List] of the specified length (in elements), all of
 * whose elements are initially zero.
 * @description Checks that all elements of the new [Float32x4List] are zero.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(int length) {
  Float32x4List l = new Float32x4List(length);
  for (int i = 0; i < length; ++i) {
    Expect.isTrue(equal(new Float32x4.zero(), l[i]));
  }
}

main() {
  check(1);
  check(10);
  check(1024);
  check(2048);
}
