// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int32x4 withZ(int z)
/// Returns a new [Int32x4] copied from [this] with a new [z] value.
/// @description Checks that a new object is created and all its lanes except
/// [z] equal to corresponding lanes of [this]. Checks that [z] of new [Int32x4]
/// equals the [z] parameter of the method.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, newZ) {
  var obj1 = new Int32x4(x, y, z, w);
  var obj2 = obj1.withZ(newZ);

  Expect.isFalse(obj1 == obj2);
  Expect.equals(w, obj2.w);
  Expect.equals(x, obj2.x);
  Expect.equals(y, obj2.y);
  Expect.equals(newZ, obj2.z);
}

main() {
  check(0, 0, 0, 0,       0);
  check(1, 1, 1, 1,       0);
  check(10, 23, 43, 100,  256);
}
