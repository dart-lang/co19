/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Uint8List.view(
 *     ByteBuffer buffer, [
 *     int byteOffset = 0,
 *     int length
 * ])
 * ...
 * If the [offsetInBytes] index of the region is not specified, it defaults to
 * zero (the first byte in the byte buffer).
 * @description Checks that if the [offsetInBytes] is not specified, it defaults
 * to zero.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int length, int firstElement, int lastElement) {
  var tmp = new Uint8List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Uint8List.view(byteBuffer);
  Expect.equals(length, l.length);
  Expect.equals(firstElement, l[0]);
  Expect.equals(lastElement, l[length - 1]);
}

main() {
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 18, 0,
      17);
  check([0], 1, 0, 0);
  check([100, 50], 2, 100, 50);
}
