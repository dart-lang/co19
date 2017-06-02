/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4.bool(bool x, bool y, bool z, bool w)
 * Creates a new [Int32x4] instance.
 * @description Checks that an instance of [Int32x4] is created and all fields
 * are set correctly.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w) {
  var obj = new Int32x4.bool(x, y, z, w);
  Expect.isTrue(obj is Int32x4);
  Expect.equals(x, obj.flagX);
  Expect.equals(y, obj.flagY);
  Expect.equals(z, obj.flagZ);
  Expect.equals(w, obj.flagW);
}

main() {
  check(false, false, false, false);
  check(true, true, true, true);
  check(false, true, false, true);
}
