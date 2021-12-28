// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int32x4(int x, int y, int z, int w)
/// Creates a new [Int32x4] instance.
/// @description Checks that an instance of [Int32x4] is created and all fields
/// are set correctly.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w) {
  var obj = new Int32x4(x, y, z, w);
  Expect.isTrue(obj is Int32x4);
  Expect.runtimeIsType<Int32x4>(obj);
  Expect.equals(x.toUnsigned(32), obj.x.toUnsigned(32));
  Expect.equals(x.toUnsigned(32), obj.x.toUnsigned(32));
  Expect.equals(y.toUnsigned(32), obj.y.toUnsigned(32));
  Expect.equals(z.toUnsigned(32), obj.z.toUnsigned(32));
  Expect.equals(w.toUnsigned(32), obj.w.toUnsigned(32));
}

main() {
  check(0, 0, 0, 0);
  check(4, 1, 3, 10);
  check(256, 65536, 0, 2147483648);
}
