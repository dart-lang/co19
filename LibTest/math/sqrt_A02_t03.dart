/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sqrt(num x)
 * Returns -0.0 if x is -0.0, and NaN if x is otherwise negative or NaN.
 * @description Checks that [sqrt] return NaN if [x] is negative.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.sqrt(-1).isNaN);
  Expect.isTrue(Math.sqrt(-10).isNaN);
  Expect.isTrue(Math.sqrt(-1e-52).isNaN);
  Expect.isTrue(Math.sqrt(-4.9406564584124654e-324).isNaN);
  Expect.isTrue(Math.sqrt(double.negativeInfinity).isNaN);
}
