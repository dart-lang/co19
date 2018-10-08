/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Float64x2List.view(
 *     ByteBuffer buffer, [
 *     int offsetInBytes = 0,
 *     int length
 * ])
 * Throws RangeError if offsetInBytes or length are negative, or if
 * offsetInBytes + (length * elementSizeInBytes) is greater than the length of
 * buffer.
 * @description Checks that RangeError is thrown if length is negative.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2V(v) => new Float64x2.splat(v);

void check(List<Float64x2> list, int offsetInEl, length) {
  var el_size = Float64x2List.bytesPerElement;
  Float64x2List tmp = new Float64x2List.fromList(list);
  var byteBuffer = tmp.buffer;
  try {
    new Float64x2List.view(byteBuffer, offsetInEl * el_size, length);
    Expect.fail("RangeError should be thrown.");
  } on RangeError {
  }
}

main() {
  check([
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ], 4, -4);
  check([f64x2V(0.0), f64x2V(1.0), f64x2V(2.0)], 2, -1);
  check([f64x2V(10.0), f64x2V(11.0)], 0, -2);
}
