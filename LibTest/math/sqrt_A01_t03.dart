/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sqrt(num x)
 * Converts [x] to a double and returns the positive square root of the value.
 * @description Checks that an argument of sqrt should be number (a decimal
 * or hexadecimal integer, or a decimal double).
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  var a1 = Math.sqrt(4);
  var a2 = Math.sqrt(0x0009);
  var a3 = Math.sqrt(16.0);
  Expect.equals(a1, 2);
  Expect.equals(a2, 3);
  Expect.equals(a3, 4);
}
