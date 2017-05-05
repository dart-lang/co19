/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2.splat(double v)
 * Creates a new [Float64x2] instance.
 * @description Checks that an instance of [Float64x2] is created and all fields
 * are set correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(v) {
  var obj = new Float64x2.splat(v);
  Expect.isTrue(obj is Float64x2);
  Expect.equals(v, obj.x);
  Expect.equals(v, obj.y);
}

main() {
  check(0.0);
  check(-0.0);
  check(2e-2);
  check(3.40282e+038);
  check(0.12e-20);
  check(10e10);
}
