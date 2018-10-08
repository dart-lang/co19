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
 * @note see bug 669
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var tmp = new Uint8ClampedList.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  var byteBuffer = tmp.buffer;

  for (int i = 0; i <= 10; ++i) {
    var l = new Uint8ClampedList.view(byteBuffer, i, 10 - i) ;
    Expect.equals(byteBuffer, l.buffer);
  }
}
