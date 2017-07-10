/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan2(num a, num b)
 * A variant of atan.
 * Converts both arguments to doubles.
 * @description Checks that arguments of atan2 should be numbers (a decimal
 * or hexadecimal integer, or a decimal double).
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  var a1 = Math.atan2(0, 0);
  var a2 = Math.atan2(0x0000, 0x0000);
  var a3 = Math.atan2(0.0, 0.0);
  var a4 = Math.atan2(0.0, 0);
  Expect.equals(a1, a2);
  Expect.equals(a1, a3);
  Expect.equals(a1, a4);
}
