/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4 withX(int x)
 * Returns a new [Int32x4] copied from [this] with a new [x] value.
 * @description Checks that a new object is created and all its lanes except
 * [x] equal to corresponding lanes of [this]. Checks that [x] of new [Int32x4]
 * equals the [x] parameter of the method.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, newX) {
  var obj1 = new Int32x4(x, y, z, w);
  var obj2 = obj1.withX(newX);

  Expect.isFalse(obj1 == obj2);
  Expect.equals(w, obj2.w);
  Expect.equals(y, obj2.y);
  Expect.equals(z, obj2.z);
  Expect.equals(newX, obj2.x);
}

main() {
  check(0, 0, 0, 0,       0);
  check(1, 1, 1, 1,       0);
  check(10, 23, 43, 100,  256);
}
