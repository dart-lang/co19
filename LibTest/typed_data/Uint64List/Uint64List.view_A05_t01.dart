/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Uint64List.view(
 *     ByteBuffer buffer, [
 *     int offsetInBytes = 0,
 *     int length
 * ])
 * ...
 * Throws [RangeError] if [offsetInBytes] or [length] are negative, or if
 * [offsetInBytes] + ([length] * elementSizeInBytes) is greater than the length
 * of [buffer].
 * @description Checks that [RangeError] is thrown if [offsetInBytes] is
 * negative.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int offset) {
  var tmp = new Uint64List.fromList(array);
  var byteBuffer = tmp.buffer;
  try {
    new Uint64List.view(byteBuffer, offset);
    Expect.fail("RangeError exception is expected");
  } on RangeError {}
}

main() {
  check([0], -5);
  check([100, 50], -100);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], -1);
}
