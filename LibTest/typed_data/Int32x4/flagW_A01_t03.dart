/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool flagW
 * Extracted [w] value. Returns false for 0, true for any other value.
 * @description Checks that [flagW] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Int32x4.bool(false, false, false, false);
  try {
    obj.flagW = true;
    Expect.fail("[flagW] should be read-only");
  } on NoSuchMethodError {}
}
