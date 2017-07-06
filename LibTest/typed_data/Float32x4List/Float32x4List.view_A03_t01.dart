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
 * If the length is not specified, it defaults to null, which indicates that
 * the view extends to the end of the byte buffer.
 * @description Checks that if the [length] is not specified, the view extends
 * to the end of the byte buffer.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> array, int offset, int numberOfElements,
    Float32x4 lastElement) {
  var tmp = new Float32x4List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Float32x4List.view(byteBuffer, offset);
  Expect.equals(numberOfElements, l.length);
  Expect.isTrue(equal(lastElement, l[numberOfElements - 1]));
}

main() {
  List<Float32x4> list = [
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0), pack(11.0),
    pack(12.0), pack(13.0), pack(14.0), pack(15.0), pack(16.0), pack(17.0)
  ];
  check(list, 0, 18, pack(17.0));
  check(list, 16, 17, pack(17.0));
  check(list, 17 * 16, 1, pack(17.0));
}
