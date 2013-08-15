/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int x
 * Extracts 32-bit mask from x lane.
 * @description Checks that [x] is final and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Uint32x4(0, 0, 0, 0);
  try {
    obj.x = 1;
    Expect.fail("[x] should be final");
  } on NoSuchMethodError catch(ok) {}
}
