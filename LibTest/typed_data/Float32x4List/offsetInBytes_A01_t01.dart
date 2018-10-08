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

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> array, int offset, int length) {
  var tmp = new Float32x4List.fromList(array);
  var byteBuffer = tmp.buffer;
  var l = new Float32x4List.view(byteBuffer, offset, length);
  Expect.equals(offset, l.offsetInBytes);
}

main() {
  var elemSize = Float32x4List.bytesPerElement;
  check([], 0, 0);
  check([pack(1.0)], 0, 1);
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], 0, 1);
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], 9 * elemSize, 1);
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], 5 * elemSize, 5);
}
