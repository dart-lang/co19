/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint16List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * Creates an [Uint16List] _view_ of the specified region in
 * the specified byte buffer.
 * @description Checks that a new instance has the same elements as
 * the specified region.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(array, offset, length) {
  var tmp = new Uint16List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Uint16List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  for(int i = 0; i < l.length; ++i) {
    Expect.equals(tmp[offset ~/ Uint16List.BYTES_PER_ELEMENT + i], l[i]);
  }
}

checkIntersection(array, offset, length, expected) {
  var tmp = new Uint16List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Uint16List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  Expect.listEquals(expected, l);
}

main() {
  check([], 0, 0);
  check([1], 0, 1);
  check([32768, 65535], 0, 2);
  check([1000, 1000, 1000], 0, 3);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 0, 18);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 10, 13);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 34, 1);

  checkIntersection([1, 1], 1, 1, [256]);
  checkIntersection([0xab08, 0x76bc, 0x6347, 0x7fff, 0x87cb], 3, 3, [0x4776, 0xff63, 0xcb7f]);
}
