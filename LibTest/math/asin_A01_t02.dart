/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double acos(num x)
 * Converts [x] to a double and returns its arc sine in radians.
 * @description Checks that an argument of asin should be a number (a decimal
 * or hexadecimal integer, or a decimal double).
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  var a1 = Math.asin(0);
  var a2 = Math.asin(0x0000);
  var a3 = Math.asin(0.0);
  Expect.equals(a1, a2);
  Expect.equals(a1, a3);
}
