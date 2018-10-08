/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sqrt(num x)
 * Converts [x] to a double and returns the positive square root of the value.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(double.infinity, Math.sqrt(double.infinity));
  Expect.equals(.0, Math.sqrt(0.0));
}
