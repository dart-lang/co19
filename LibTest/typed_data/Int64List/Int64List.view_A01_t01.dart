/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Int64List.view(
 *     ByteBuffer buffer, [
 *     int byteOffset = 0,
 *     int length
 * ])
 * Creates an [Int64List] view of the specified region in buffer.
 * @description Checks that an instance of Int64List is created.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int offset, int length) {
  var tmp = new Int64List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Int64List.view(byteBuffer, offset, length);
  Expect.isTrue(l is Int64List);
}

main() {
  var elemSize = Int64List.bytesPerElement;

  check([], 0, 0);
  check([9223372036854775807, -9223372036854775808], 0, 2);
  check([1000, 1000, 1000], 0, 3);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 0, 18);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
      5 * elemSize, 13);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
      17 * elemSize, 1);
}
