/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Float64x2List.view(
 *     ByteBuffer buffer, [
 *     int offsetInBytes = 0,
 *     int length
 * ])
 * Changes in the Float64x2List will be visible in the byte buffer and vice
 * versa.
 * @description Checks that changes done in the Float64x2List is seen in the
 * buffer and vice versa.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2V(v) => new Float64x2.splat(v);

main() {
  var tmp = new Float64x2List.fromList([f64x2V(1.0), f64x2V(2.0), f64x2V(3.0)]);
  var byteBuffer = tmp.buffer;
  Float64x2List l = new Float64x2List.view(byteBuffer, 0, 3);

  l[0] = f64x2V(11.0);
  tmp[1] = f64x2V(12.0);

  Expect.equals(l[0].x, tmp[0].x);
  Expect.equals(l[0].y, tmp[0].y);

  Expect.equals(tmp[1].x, l[1].x);
  Expect.equals(tmp[1].y, l[1].y);
}
