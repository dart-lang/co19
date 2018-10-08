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
 * Throws ArgumentError if offsetInBytes is not a multiple of BYTES_PER_ELEMENT.
 * @description Checks that ArgumentError is thrown if offsetInBytes is not a
 * multiple of BYTES_PER_ELEMENT.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

void check(list, offset) {
  var l = new Int32x4List.fromList(list);
  var buffer = l.buffer;
  try {
    new Int32x4List.view(buffer, offset);
    Expect.fail("ArgumentError is expected");
  } on ArgumentError {}
}

main() {
  var list = [
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ];
  for (int i = 1; i < Int32x4List.bytesPerElement; ++i) {
    check(list, i);
  }
}
