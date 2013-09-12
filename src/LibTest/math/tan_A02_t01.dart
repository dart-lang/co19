/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double tan(num x)
 * If [x] is not a finite number, the result is NaN.
 * @description Checks that [tan] returns NaN if [x] is not a finite number.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.tan(double.NAN).isNaN);
  Expect.isTrue(Math.tan(double.INFINITY).isNaN);
  Expect.isTrue(Math.tan(double.NEGATIVE_INFINITY).isNaN);
}
