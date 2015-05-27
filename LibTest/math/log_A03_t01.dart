/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double log(num x)
 * Returns NaN if [x] is NaN or less than zero.
 * @description Checks that [log] returns NaN if [x] is
 * NaN or less than zero.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.log(-1).isNaN);
  Expect.isTrue(Math.log(-0.5).isNaN);
  Expect.isTrue(Math.log(double.NAN).isNaN);
  Expect.isTrue(Math.log(double.NEGATIVE_INFINITY).isNaN);
}
