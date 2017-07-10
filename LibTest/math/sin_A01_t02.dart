/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sin(num radians)
 * Converts [radians] to a double and returns the sine of the value.
 * @description Checks result when argument ranges from 1E-52 to 1E-16.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Why exact equality?
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(.0, Math.sin(0.0));
  Expect.equals(.0, Math.sin(-0.0));
  
  for (double x = 1e-52; x < 1e-16; x *= 10) {
    Expect.equals(x, Math.sin(x));
    Expect.equals(-x, Math.sin(-x));
  }
}
