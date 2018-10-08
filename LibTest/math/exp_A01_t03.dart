/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double exp(num x)
 * TConverts [x] to a double and returns the natural exponent, E, to the power
 * [x].
 * @description Checks that an argument of exp should be a number (a decimal
 * or hexadecimal integer, or a decimal double).
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  var a1 = Math.exp(0);
  var a2 = Math.exp(0x0000);
  var a3 = Math.exp(0.0);
  Expect.equals(a1, a2);
  Expect.equals(a1, a3);
}
