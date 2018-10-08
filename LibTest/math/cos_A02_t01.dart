/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double cos(num radians)
 * If [radians] is not a finite number, the result is NaN.
 * @description Checks that [cos] returns NaN if [radians] is not a finite
 * number.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.cos(double.nan).isNaN);
  Expect.isTrue(Math.cos(double.infinity).isNaN);
  Expect.isTrue(Math.cos(double.negativeInfinity).isNaN);
}
