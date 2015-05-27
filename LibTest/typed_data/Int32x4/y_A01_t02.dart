/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int y
 * Extracts 32-bit mask from y lane.
 * @description Checks that [y] is final and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Int32x4(0, 0, 0, 0);
  try {
    obj.y = 1;
    Expect.fail("[y] should be final");
  } on NoSuchMethodError catch(ok) {}
}
