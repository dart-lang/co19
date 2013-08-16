/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32List.view(ByteBuffer buffer, [int byteOffset = 0, int length])
 * Creates an [Int32List] _view_ of the specified region in
 * the specified byte buffer.
 * @description Checks that a new instance has the same elements as
 * the specified region.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(array, offset, length) {
  var tmp = new Int32List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Int32List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  for(int i = 0; i < l.length; ++i) {
    Expect.equals(tmp[offset ~/ Int32List.BYTES_PER_ELEMENT + i], l[i]);
  }
}

checkIntersection(array, offset, length, expected) {
  var tmp = new Int32List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Int32List.view(byteBuffer, offset, length);
  Expect.equals(length, l.length);
  Expect.listEquals(expected, l);
}

main() {
  check([], 0, 0);
  check([1], 0, 1);
  check([2147483647, -2147483648], 0, 2);
  check([1000, 1000, 1000], 0, 3);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 0, 18);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 20, 13);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 68, 1);

  checkIntersection([1, 1], 1, 1, [16777216]);
  checkIntersection([0xab086745, 0x76bca730, 0x6347cc87, 0x7fed00ff, 0x876312cb], 3, 4, [-1129893717, 1204586358, -318701725, 1662176127]);
  checkIntersection([0xab086745, 0x76bca730, 0x6347cc87, 0x7fed00ff, 0x876312cb], 2, 4, [-1489982712, -863537476, 16737095, 315326445]);
}
