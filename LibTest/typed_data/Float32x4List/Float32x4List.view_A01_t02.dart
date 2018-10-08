/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Float32x4List.view(
 *     ByteBuffer buffer, [
 *     int byteOffset = 0,
 *     int length
 * ])
 * Creates a [Float32x4List] view of the specified region in buffer.
 * @description Checks that a new instance has the same elements as the
 * specified region.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

packM(x, y, z, w) => new Float32x4(x,y,z,w);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

check(List<Float32x4> list, int offset, int length) {
  var tmp = new Float32x4List.fromList(list);
  var byteBuffer = tmp.buffer;
  var l = new Float32x4List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(equal(tmp[offset ~/ Float32x4List.bytesPerElement + i],
        l[i]));
  }
}

main() {
  check([], 0, 0);
  check([
    pack(3.4028234663852886e38), pack(1.401298464324817e-45),
    pack(1.1754943508222875e-38)
  ], 0, 3);
  check([pack(1000.0), pack(1000.0), pack(1000.0)], 0, 3);
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0), pack(11.0),
    pack(12.0), pack(13.0), pack(14.0), pack(15.0), pack(16.0), pack(17.0)
  ], 0, 18);
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0), pack(11.0),
    pack(12.0), pack(13.0), pack(14.0), pack(15.0), pack(16.0), pack(17.0)
  ], 32, 13);
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0), pack(11.0),
    pack(12.0), pack(13.0), pack(14.0), pack(15.0), pack(16.0), pack(17.0)
  ], 16*16, 1);
}
