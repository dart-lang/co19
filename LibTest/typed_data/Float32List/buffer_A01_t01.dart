/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final ByteBuffer buffer
 * Returns the byte buffer associated with this object.
 * @description Checks that the returned buffer is equal to the buffer
 * with which this object is associated.
 * @note see bug 669
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var tmp = new Float32List.fromList([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
  var byteBuffer = tmp.buffer;
  var elementSize = Float32List.BYTES_PER_ELEMENT;

  for(int i= 0; i <= 10; ++i) {
    var l = new Float32List.view(byteBuffer, i*elementSize, 10 - i) ;
    Expect.equals(byteBuffer, l.buffer);
  }
}
