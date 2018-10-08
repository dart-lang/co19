/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan(num x)
 * Returns a value in the range -PI/2..PI/2, or NaN if [x] is NaN.
 * @description Checks that [atan] returns NaN if [x] is NaN.
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.atan(double.nan).isNaN);
}
