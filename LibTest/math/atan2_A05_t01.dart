/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan2(num a, num b)
 * A variant of atan.
 * Converts both arguments to doubles.
 * @description Checks that an Error is thrown when argument is a null (not a
 * number).
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

void checkNPE(var arg1, var arg2) {
  Expect.throws(() {
    Math.atan2(arg1, arg2);
  });
}
main() {
  checkNPE(null, 1);
  checkNPE(1, null);
  checkNPE(null, null);
  checkNPE(double.nan, null);
}
