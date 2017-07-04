/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Float64List.view(
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

void check(List<double> array, int length, int firstElement, int lastElement) {
  var tmp = new Float64List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Float64List.view(byteBuffer);
  Expect.equals(length, l.length);
  Expect.equals(firstElement, l[0]);
  Expect.equals(lastElement, l[length - 1]);
}

main() {
  check([
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0,
    14.0, 15.0, 16.0, 17.0
  ], 18, 0, 17);
  check([0.0], 1, 0, 0);
  check([100.0, 50.0], 2, 100, 50);
}
