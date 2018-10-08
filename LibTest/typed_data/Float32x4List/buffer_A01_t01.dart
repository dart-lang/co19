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

Float32x4 pack(x, y, z, w) => new Float32x4(x,y,z,w);

main() {
  var tmp = new Float32x4List.fromList([
    pack(1.0, 2.0, 3.0, 4.0), pack(5.0, 6.0, 7.0, 8.0),
    pack(9.0, 10.0, 11.0, 12.0), pack(13.0, 14.0, 15.0, 16.0)
  ]);
  var byteBuffer = tmp.buffer;
  var elemSize = Float32x4List.bytesPerElement;

  for (int i = 0; i <= 4; ++i) {
    var l = new Float32x4List.view(byteBuffer, i * elemSize, 4 - i) ;
    Expect.equals(byteBuffer, l.buffer);
  }
}
