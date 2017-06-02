/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int signMask
 * Extract the top bit from each lane return them in the first 4 bits. "x" lane
 * is bit 0. "y" lane is bit 1. "z" lane is bit 2. "w" lane is bit 3.
 * @description Checks that the returned signMask is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, sm) {
  var obj = new Int32x4(x, y, z, w);
  var res = obj.signMask;
  Expect.equals(sm, res);
}

main() {
  check(1, 1, 0, 1, 0);
  check(-1, 1, 1, 1, 1);
  check(1, -1, 1, 0, 2);
  check(1, 1, -1, 1, 4);
  check(1, 1, 1, -1, 8);
  check(-1, -1, -1, -1, 15);
}
