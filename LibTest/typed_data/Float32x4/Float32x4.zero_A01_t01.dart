/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Float32x4.zero()
 * @description Checks that an instance of [Float32x4] is created and all fields
 * are set to 0.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Float32x4.zero();
  Expect.equals(0.0, obj.x);
  Expect.equals(0.0, obj.y);
  Expect.equals(0.0, obj.z);
  Expect.equals(0.0, obj.w);
}
