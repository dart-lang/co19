/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double acos(num x)
 * Returns a value in the range -PI..PI, or NaN if [x] is outside the range -1..1.
 * @description Checks returned values on arguments outside [-1, 1].
 * @reviewer pagolubev
 * @author msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.acos(-10).isNaN);
  Expect.isTrue(Math.acos(10).isNaN);
  Expect.isTrue(Math.acos(1.0000000000001).isNaN);
  Expect.isTrue(Math.acos(-1.0000000000001).isNaN);

  Expect.isTrue(Math.acos(double.NAN).isNaN);
  Expect.isTrue(Math.acos(double.INFINITY).isNaN);
  Expect.isTrue(Math.acos(double.NEGATIVE_INFINITY).isNaN);
}
