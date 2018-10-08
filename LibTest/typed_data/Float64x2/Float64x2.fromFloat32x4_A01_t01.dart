/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2.fromFloat32x4(Float32x4 v)
 * Creates a new [Float64x2] instance.
 * Uses the "x" and "y" lanes from v.
 * @description Checks that an instance of [Float64x2] is created and all fields
 * are set correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(doubleX, doubleY, doubleZ, doubleW) {
  var obj1 = new Float32x4(doubleX, doubleY, doubleZ, doubleW);
  var obj2 = new Float64x2.fromFloat32x4(obj1);

  Expect.equals(obj1.x, obj2.x);
  Expect.equals(obj1.y, obj2.y);
}

main() {
  check(0.0, 0.0, 0.0, 0.0);
  check(1.0, 2.0, 3.0, 4.0);
  check(1.0000000000000002, 1.0000000000000004, 1.0, 1.0);
}
