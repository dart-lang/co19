/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4 withFlagZ(bool z)
 * Returns a new [Int32x4] copied from [this] with a new [z] value.
 * @description Checks that a new object is created and all its lanes except
 * [z] equal to corresponding lanes of [this]. Checks that [z] of new [Int32x4]
 * equals the [z] parameter of the method.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, newZ) {
  var obj1 = new Int32x4.bool(x, y, z, w);
  var obj2 = obj1.withFlagZ(newZ);

  Expect.isFalse(obj1 == obj2);
  Expect.equals(w, obj2.flagW);
  Expect.equals(x, obj2.flagX);
  Expect.equals(y, obj2.flagY);
  Expect.equals(newZ, obj2.flagZ);
}

main() {
  check(false, false, false, false,   false);
  check(true, false, false, false,    true);
  check(true, true, true, true,       false);
}
