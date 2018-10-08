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
 * If the [offsetInBytes] index of the region is not specified, it defaults to
 * zero (the first byte in the byte buffer).
 * @description Checks that if the [offsetInBytes] is not specified, it defaults
 * to zero.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> list, int length, Float32x4 firstElement,
    Float32x4 lastElement) {
  var tmp = new Float32x4List.fromList(list);
  var byteBuffer = tmp.buffer;
  var l = new Float32x4List.view(byteBuffer);
  Expect.equals(length, l.length);
  Expect.isTrue(equal(firstElement, l[0]));
  Expect.isTrue(equal(lastElement, l[length - 1]));
}

main() {
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0), pack(11.0), pack(12.0),
    pack(13.0), pack(14.0), pack(15.0), pack(16.0), pack(17.0)
  ], 18, pack(.0), pack(17.0));
  check([pack(.0)], 1, pack(.0), pack(.0));
  check([pack(100.0), pack(50.0)], 2, pack(100.0), pack(50.0));
}
