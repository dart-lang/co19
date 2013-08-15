/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint32x4(int x, int y, int z, int w)
 * Creates a new [Uint32x4] instance.
 * @description Checks that an instance of [Uint32x4] is
 * created and all fields are set correctly.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w) {
  var obj = new Uint32x4(x, y, z, w);
  Expect.isTrue(obj is Uint32x4);
  Expect.equals(x, obj.x);
  Expect.equals(y, obj.y);
  Expect.equals(z, obj.z);
  Expect.equals(w, obj.w);
}

main() {
  check(0,0,0,0);
  check(4, 1, 3, 10);
  check(256, 65536, 0, 2147483648);
}
