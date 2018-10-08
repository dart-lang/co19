/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool flagW
 * Extracted [w] value. Returns false for 0, true for any other value.
 * @description Checks that false is returned if [w] is 0 and true otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(w) {
  var obj = new Int32x4(0, 0, 0, w);
  if (w == 0) {
    Expect.isFalse(obj.flagW);
  } else {
    Expect.isTrue(obj.flagW);
  }
}

main() {
  check(0);
  check(1);
  check(-1);
  check(2147483648);
}
