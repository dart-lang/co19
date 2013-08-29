/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion pow function defined by the IEEE Standard 754-2008
 * relevant cases:
 * If x is an int and exponent is a non-negative int, the result is an int, otherwise both arguments are converted to doubles first, and the result is a double.
 * if x is 1.0, the result is always 1.0.
 * if y is Infinity and x is -1, the result is 1.0
 * if y is -Infinity, the result is 1/pow(x, Infinity).
 * @description Checks result if y is infinite.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(1.0, Math.pow(1, double.INFINITY));
  Expect.equals(1.0, Math.pow(-1, double.INFINITY));
  Expect.equals(1.0, Math.pow(1.0, double.INFINITY));
  Expect.equals(1.0, Math.pow(-1.0, double.INFINITY));

  Expect.equals(1.0, Math.pow(1, double.NEGATIVE_INFINITY));
  Expect.equals(1.0, Math.pow(-1, double.NEGATIVE_INFINITY));
  Expect.equals(1.0, Math.pow(1.0, double.NEGATIVE_INFINITY));
  Expect.equals(1.0, Math.pow(-1.0, double.NEGATIVE_INFINITY));
}
