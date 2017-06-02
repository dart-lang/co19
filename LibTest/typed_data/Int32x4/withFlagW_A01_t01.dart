/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4 withFlagW(bool w)
 * Returns a new [Int32x4] copied from [this] with a new [w] value.
 * @description Checks that a new object is created and all its lanes except
 * [w] equal to corresponding lanes of [this]. Checks that [w] of new [Int32x4]
 * equals the [w] parameter of the method.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, newW) {
  var obj1 = new Int32x4.bool(x, y, z, w);
  var obj2 = obj1.withFlagW(newW);

  Expect.isFalse(obj1 == obj2);
  Expect.equals(x, obj2.flagX);
  Expect.equals(y, obj2.flagY);
  Expect.equals(z, obj2.flagZ);
  Expect.equals(newW, obj2.flagW);
}

main() {
  check(false, false, false, false,   false);
  check(false, true, false, false,    true);
  check(true, false, true, true,      false);
}
