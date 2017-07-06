/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Float32List.view(
 *     ByteBuffer buffer, [
 *     int byteOffset = 0, int length
 * ])
 * ...
 * Throws [RangeError] if [offsetInBytes] or [length] are negative, or if
 * [offsetInBytes] + ([length] * elementSizeInBytes) is greater than the length
 * of [buffer].
 * @description Checks that [RangeError] is thrown if [offsetInBytes] +
 * ([length] * elementSizeInBytes) is greater than the length of [buffer].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> array, int offset, int length) {
  var tmp = new Float32List.fromList(array);
  var byteBuffer = tmp.buffer;
  try {
    new Float32List.view(byteBuffer, offset, length);
    Expect.fail("RangeError exception is expected");
  } on RangeError {
  }
}

main() {
  check([], 0, 1);
  check([0.0], 0, 5);
  check([0.0], 1, 2);
  check([100.0, 50.0], 2, 20);
  check([100.0, 50.0], 4, 20);
  check([
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0,
    13.0, 14.0, 15.0, 16.0, 17.0
  ], 20, 20);
}
