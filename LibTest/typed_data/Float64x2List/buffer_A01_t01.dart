/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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

Float64x2 f64x2(x, y) => new Float64x2(x,y);

main() {
  var tmp = new Float64x2List.fromList([
    f64x2(1.0, 2.0), f64x2(3.0, 4.0), f64x2(5.0, 6.0), f64x2(7.0, 8.0),
    f64x2(9.0, 10.0), f64x2(11.0, 12.0), f64x2(13.0, 14.0), f64x2(15.0, 16.0)
  ]);
  var tmpSize = tmp.length;
  var byteBuffer = tmp.buffer;
  var elemSize = Float64x2List.bytesPerElement;

  for (int i = 0; i <= tmpSize; ++i) {
    var l = new Float64x2List.view(byteBuffer, i * elemSize, tmpSize - i) ;
    Expect.equals(byteBuffer, l.buffer);
  }
}
