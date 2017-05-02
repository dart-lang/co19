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
 * Changes in the [Float32x4List] will be visible in the byte buffer and vice
 * versa.
 * @description Checks that changes in the [Float32x4List] will be visible in
 * the byte buffer and vice versa.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

main() {
  var tmp = new Float32x4List.fromList([pack(0.0), pack(0.0), pack(0.0)]);
  var byteBuffer = tmp.buffer;
  var l = new Float32x4List.view(byteBuffer, 0, 3);

  tmp[0] = pack(1.0);
  Expect.isTrue(equal(tmp[0], l[0]));
  l[1] = pack(2.0);
  Expect.isTrue(equal(l[1], tmp[1]));
}
