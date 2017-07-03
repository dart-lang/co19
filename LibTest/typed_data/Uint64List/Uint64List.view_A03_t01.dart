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
 * If the length is not specified, it defaults to null, which indicates that
 * the view extends to the end of the byte buffer.
 * @description Checks that if the [length] is not specified, the view extends
 * to the end of the byte buffer.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int offset, int numberOfElements, int lastElement) {
  var tmp = new Uint64List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Uint64List.view(byteBuffer, offset);
  Expect.equals(numberOfElements, l.length);
  Expect.equals(lastElement, l[numberOfElements - 1]);
}

main() {
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 0, 18,
      17);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 8, 17,
      17);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 136, 1,
      17);
}
