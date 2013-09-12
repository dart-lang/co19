/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final ByteBuffer buffer
 * Returns the byte buffer associated with this object.
 * @description Checks that the returned buffer is identical to the buffer
 * with which this object is associated.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var tmp = new Float64List.fromList([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
  var byteBuffer = tmp.buffer;
  var elemSize = Float64List.BYTES_PER_ELEMENT;

  for(int i= 0; i <= 10; ++i) {
    var l = new Float64List.view(byteBuffer, i * elemSize, 10 - i) ;
    Expect.identical(byteBuffer, l.buffer);
  }
}
