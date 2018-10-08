/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double log(num x)
 * Returns NaN if [x] is NaN or less than zero.
 * @description Checks that [log] returns NaN if [x] is NaN or less than zero.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.log(-1).isNaN);
  Expect.isTrue(Math.log(-0.5).isNaN);
  Expect.isTrue(Math.log(double.nan).isNaN);
  Expect.isTrue(Math.log(double.negativeInfinity).isNaN);
}
