/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float64x2.zero()
 * Creates a new [Float64x2] instance.
 * @description Checks that an instance of [Float64x2] is created and all fields
 * are set correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Float64x2.zero();
  Expect.isTrue(obj is Float64x2);
  Expect.equals(0.0, obj.x);
  Expect.equals(0.0, obj.y);
}
