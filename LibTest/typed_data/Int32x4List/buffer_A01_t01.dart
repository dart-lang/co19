/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ByteBuffer buffer
 * Returns the byte buffer associated with this object.
 * @description Checks that the returned buffer is equal to the buffer with
 * which this object is associated.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [
    i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6), i32x4(7),
    i32x4(8), i32x4(9)
  ];

  var l = new Int32x4List.fromList(list);
  var byteBuffer = l.buffer;
  var elemSize = Int32x4List.bytesPerElement;

  for (int i = 0; i <= 8; ++i) {
    var l = new Int32x4List.view(byteBuffer, i * elemSize, 1) ;
    Expect.equals(byteBuffer, l.buffer);
  }
}
