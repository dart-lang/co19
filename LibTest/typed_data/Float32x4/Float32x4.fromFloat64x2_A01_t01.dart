/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4.fromFloat64x2(Float64x2 v)
 * Sets the x and y lanes to their respective values in v and sets the z and w
 * lanes to 0.0.
 * @description Checks that lanes are converted correctly. Note, some values may
 * be truncated when double value is stored to float.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(doubleX, doubleY, floatX, floatY) {
  var obj1 = new Float64x2(doubleX, doubleY);
  var obj2 = new Float32x4.fromFloat64x2(obj1);

  Expect.equals(floatX, obj2.x);
  Expect.equals(floatY, obj2.y);
  Expect.equals(0.0, obj2.z);
  Expect.equals(0.0, obj2.w);
}

main() {
  check(0.0, 0.0, 0.0, 0.0);
  check(1.0, 2.0, 1.0, 2.0);
  check(1.0000000000000002, 1.0000000000000004, 1.0, 1.0);
}
