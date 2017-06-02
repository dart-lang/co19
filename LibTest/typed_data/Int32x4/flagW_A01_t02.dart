/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool flagW
 * Extracted [w] value. Returns false for 0, true for any other value.
 * @description Checks that false is returned if [w] was set to false
 * and true otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

checkBool(w) {
  var obj = new Int32x4.bool(false, false, false, w);
  Expect.equals(w, obj.flagW);
}

main() {
  checkBool(false);
  checkBool(true);
}
