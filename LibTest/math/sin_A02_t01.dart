/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sin(num radians)
 * If [radians] is not a finite number, the result is NaN.
 * @description Checks that [sin] returns NaN if x is not a finite number.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.sin(double.nan).isNaN);
  Expect.isTrue(Math.sin(double.infinity).isNaN);
  Expect.isTrue(Math.sin(double.negativeInfinity).isNaN);
}
