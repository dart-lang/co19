/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4List.fromList(List<Float32x4> elements)
 * Creates a [Float32x4List] with the same length as the [elements] list and
 * copies over the elements.
 * @description Checks that an instance of Float32x4List is created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(x, y, z, w) => new Float32x4(x,y,z,w);
Float32x4 packV(v) => new Float32x4.splat(v);

void check(List<Float32x4> list) {
  Float32x4List l = new Float32x4List.fromList(list);
  Expect.isTrue(l is Float32x4List);
}

main() {
  check([]);
  check([pack(3.4028234663852886e38, 1.401298464324817e-45,
      1.1754943508222875e-38, -.0)]);
  check([
    pack(2e-10, 4e12, .012e10, 1e15), pack(-2e-10, -1.2e1, -0.23, -4.98e-1),
    pack(2e10, 3e-1, 1.12, 0.5e-1)
  ]);
  check([
    packV(0.0), packV(1.0), packV(2.0), packV(3.0), packV(4.0), packV(5.0),
    packV(6.0), packV(7.0), packV(8.0), packV(9.0), packV(10.0), packV(11.0),
    packV(12.0), packV(13.0), packV(14.0), packV(15.0), packV(16.0),
    packV(17.0)
  ]);
}
