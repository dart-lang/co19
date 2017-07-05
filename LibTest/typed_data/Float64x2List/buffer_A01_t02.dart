/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteBuffer buffer
 * Returns the byte buffer associated with this object.
 * @description Checks that buffet is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(x, y) => new Float64x2(x,y);

void check(List<Float64x2> list) {
  dynamic l = new Float64x2List.fromList(list);
  try {
    l.buffer = new Float64x2List.fromList(list).buffer;
    Expect.fail("[buffer] should be read-only");
  } on NoSuchMethodError {}
}

main() {
  check([]);
  check([f64x2(1.0, 2.0)]);
  check([
    f64x2(1.0, 2.0), f64x2(3.0, 4.0), f64x2(5.0, 6.0), f64x2(7.0, 8.0),
    f64x2(9.0, 10.0), f64x2(11.0, 12.0), f64x2(13.0, 14.0), f64x2(15.0, 16.0)
  ]);
}
