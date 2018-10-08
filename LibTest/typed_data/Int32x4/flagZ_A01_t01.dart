/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool flagZ
 * Extracted [z] value. Returns false for 0, true for any other value.
 * @description Checks that false is returned if [z] is 0 and true otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(z) {
  var obj = new Int32x4(0, 0, z, 0);
  if (z == 0) {
    Expect.isFalse(obj.flagZ);
  } else {
    Expect.isTrue(obj.flagZ);
  }
}

main() {
  check(0);
  check(1);
  check(-1);
  check(2147483648);
}
