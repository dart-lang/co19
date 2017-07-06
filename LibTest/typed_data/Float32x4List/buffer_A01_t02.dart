/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteBuffer buffer
 * Returns the byte buffer associated with this object.
 * @description Checks that [buffer] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(x, y, z, w) => new Float32x4(x,y,z,w);

void check(List<Float32x4> list) {
  dynamic l = new Float32x4List.fromList(list);
  try {
    l.buffer = new Float32x4List.fromList(list).buffer;
    Expect.fail("[buffer] should be read-only");
  } on NoSuchMethodError {}
}

main() {
  check([]);
  check([pack(1.0, 0.2, 3e1, 0.012)]);
  check([
    pack(1.0, 1e-1, 0.12e1, 0.5), pack(2.0, 1e-2, 0.12e-15, 3.0),
    pack(3.0, 1e-3, 3.17e21, -0.0002e-10), pack(4.0, 1e-4, 8.64, 0.25e25),
    pack(5.0, 1e-5, 3.34e-13, 0.345235), pack(6.0, 1e-6, 0.34, 3.34),
    pack(7.0, 1e-7, 0.123e3, 9.3), pack(8.0, 1e-8, -0.34, 43.23),
    pack(9.0, 1e-9, .012e-1, 3e3), pack(10.0, 1e-10, 9.2, 4.84e-12),
    pack(11.0, 1e-11, 1e-11, 1e10), pack(12.0, 1e-12, 0.25, 1.44),
    pack(13.0, 1e-13, 0.1, -.01), pack(14.0, 1e-14, -2.1, 0.9e30),
    pack(15.0, 1e-15, 0.009, 4.1e-3)
  ]);
}
