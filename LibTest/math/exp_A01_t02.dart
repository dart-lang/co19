/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double exp(num x)
 * Converts [x] to a double and returns the natural exponent, E, to the power [x].
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(double.INFINITY, Math.exp(double.INFINITY));
  Expect.equals(.0, Math.exp(double.NEGATIVE_INFINITY));
}
