/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4 withFlagX(bool x)
 * Returns a new [Int32x4] copied from [this] with a new [x] value.
 * @description Checks that a new object is created and all its lanes except
 * [x] equal to corresponding lanes of [this]. Checks that [x] of new [Int32x4]
 * equals the [x] parameter of the method.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, newX) {
  var obj1 = new Int32x4.bool(x, y, z, w);
  var obj2 = obj1.withFlagX(newX);

  Expect.isFalse(obj1 == obj2);
  Expect.equals(w, obj2.flagW);
  Expect.equals(y, obj2.flagY);
  Expect.equals(z, obj2.flagZ);
  Expect.equals(newX, obj2.flagX);
}

main() {
  check(false, false, false, false,   false);
  check(false, true, false, false,    true);
  check(true, false, true, true,      false);
}
