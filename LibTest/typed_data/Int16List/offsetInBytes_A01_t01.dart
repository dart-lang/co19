/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int offsetInBytes
 * Returns the offset in bytes into the underlying byte buffer of this view.
 * @description Checks that the returned offset is correct.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> array, int offset, int length) {
  var tmp = new Int16List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Int16List.view(byteBuffer, offset, length);
  Expect.equals(offset, l.offsetInBytes);
}

main() {
  var elemSize = Int16List.bytesPerElement;

  check([], 0, 0);
  check([1], 0, 1);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0, 1);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 9 * elemSize, 1);
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5 * elemSize, 5);
}
