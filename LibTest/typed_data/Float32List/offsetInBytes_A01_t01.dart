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

check(List<double> array, int offset, int length) {
  var tmp = new Float32List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Float32List.view(byteBuffer, offset, length);
  Expect.equals(offset, l.offsetInBytes);
}

main() {
  var elemSize = Float32List.bytesPerElement;
  check([], 0, 0);
  check([1.0], 0, 1);
  check([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 0, 1);
  check([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 9 * elemSize, 1);
  check([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 5 * elemSize, 5);

}
