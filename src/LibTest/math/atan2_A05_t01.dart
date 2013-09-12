/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan2(num a, num b)
 * Throws an error if either [a] or [b] is null.
 * @description Checks that Error is thrown when passed argument is a null.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

void checkNPE(var arg1, var arg2) {
  Expect.throws( () {
    Math.atan2(arg1, arg2);
  });
}
main() {
  checkNPE(null, 1);
  checkNPE(1, null);
  checkNPE(null, null);
  checkNPE(double.NAN, null);
}
