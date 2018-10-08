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
 * Creates a Float64x2List view of the specified region in buffer.
 * @description Checks that an created instance has the same elements as in
 * specified region.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2V(v) => new Float64x2.splat(v);

void check(List<Float64x2> list, int offset, int length) {
  Float64x2List tmp = new Float64x2List.fromList(list);
  var byteBuffer = tmp.buffer;
  Float64x2List l = new Float64x2List.view(byteBuffer, offset, length);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(l[i].x, tmp[i + (offset >> 4)].x);
    Expect.equals(l[i].y, tmp[i + (offset >> 4)].y);
  }
}

main() {
  var el_size = Float64x2List.bytesPerElement;
  check([], 0, 0);
  check([f64x2V(100.0), f64x2V(200.0), f64x2V(300.0)], 0, 3);
  check([
    f64x2V(0.0), f64x2V(1.0), f64x2V(2.0), f64x2V(3.0), f64x2V(4.0),
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ], 0, 18);
  check([
    f64x2V(0.0), f64x2V(1.0), f64x2V(2.0), f64x2V(3.0), f64x2V(4.0),
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ], 6 * el_size, 12);
  check([
    f64x2V(0.0), f64x2V(1.0), f64x2V(2.0), f64x2V(3.0), f64x2V(4.0),
    f64x2V(5.0), f64x2V(6.0), f64x2V(7.0), f64x2V(8.0), f64x2V(9.0),
    f64x2V(10.0), f64x2V(11.0), f64x2V(12.0), f64x2V(13.0), f64x2V(14.0),
    f64x2V(15.0), f64x2V(16.0), f64x2V(17.0)
  ], 17 * el_size, 1);
}
