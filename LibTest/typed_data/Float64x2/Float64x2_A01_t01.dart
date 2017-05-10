/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2(double x, double y)
 * Creates a new [Float64x2] instance.
 * @description Checks that an instance of [Float64x2] is created and all fields
 * are set correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y) {
  var obj = new Float64x2(x, y);
  Expect.isTrue(obj is Float64x2);
  Expect.equals(x, obj.x);
  Expect.equals(y, obj.y);
}

main() {
  check(0.0, 0.0);
  check(1.0, 2.0);
  check(2e-2, 2e-23, );
  check(0.12e-20, 3.40282e+038);
}
