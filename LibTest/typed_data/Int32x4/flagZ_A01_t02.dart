/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool flagZ
 * Extracted [z] value. Returns false for 0, true for any other value.
 * @description Checks that false is returned if [z] was set to false and true
 * otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

checkBool(z) {
  var obj = new Int32x4.bool(false, false, z, false);
  Expect.equals(z, obj.flagZ);
}

main() {
  checkBool(false);
  checkBool(true);
}
