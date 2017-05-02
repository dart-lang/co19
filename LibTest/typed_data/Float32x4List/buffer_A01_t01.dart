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
  var tmp = new Float32List.fromList([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0,
      9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0]);
  var byteBuffer = tmp.buffer;
  var elemSize = Float32x4List.BYTES_PER_ELEMENT;

  for(int i = 0; i <= 4; ++i) {
    var l = new Float32x4List.view(byteBuffer, i * elemSize, 4 - i) ;
    Expect.equals(byteBuffer, l.buffer);
  }
}
