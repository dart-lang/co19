/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Int32x4List.view(
 *    ByteBuffer buffer, [
 *    int offsetInBytes = 0,
 *    int length
 * ])
 * ...
 * Throws RangeError if offsetInBytes or length are negative, or if
 * offsetInBytes + (length * elementSizeInBytes) is greater than the length of
 * buffer.
 * @description Checks that RangeError is thrown if length is negative.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(list, offset, length) {
  var l = new Int32x4List.fromList(list);
  var buffer = l.buffer;
  try {
    new Int32x4List.view(buffer, offset, length);
    Expect.fail("RangeError is expected");
  } on RangeError {}
}

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ];
  check([i32x4(1)], 0, -1);
  check(list, 0, -2);
  check(list, 2 * Int32x4List.bytesPerElement, -3);
  check(list, 3 * Int32x4List.bytesPerElement, -4);
}
