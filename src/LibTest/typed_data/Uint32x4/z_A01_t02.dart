/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int z
 * Extracts 32-bit mask from z lane.
 * @description Checks that [z] is final and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var obj = new Uint32x4(0, 0, 0, 0);
  try {
    obj.z = 1;
    Expect.fail("[z] should be final");
  } on NoSuchMethodError catch(ok) {}
}
