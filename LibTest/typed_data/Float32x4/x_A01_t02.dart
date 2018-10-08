/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double x
 * Extracted x value.
 * @description Checks that [x] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Float32x4(0.0, 0.0, 0.0, 0.0);
  try {
    obj.x = 1e-1;
    Expect.fail("[x] should be read-only");
  } on NoSuchMethodError {}
}
