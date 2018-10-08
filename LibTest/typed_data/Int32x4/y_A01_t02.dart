/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int y
 * Extracts 32-bit mask from y lane.
 * @description Checks that [y] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Int32x4(0, 0, 0, 0);
  try {
    obj.y = 1;
    Expect.fail("[y] should be read-only");
  } on NoSuchMethodError {}
}
