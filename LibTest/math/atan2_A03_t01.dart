/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan2(num a, num b)
 * The result is negative when [a] is negative (including when [a] is the
 * double -0.0).
 * @description Checks that if [a] is negative, the result is negative.
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.atan2(-.0, 1).isNegative);
  Expect.isTrue(Math.atan2(-.0, -1).isNegative);

  Expect.isTrue(Math.atan2(-.5, 0.2).isNegative);
  Expect.isTrue(Math.atan2(-.5, -0.2).isNegative);

  Expect.isTrue(Math.atan2(-1e2, double.infinity).isNegative);
  Expect.isTrue(Math.atan2(-1e2, double.negativeInfinity).isNegative);

  Expect.isTrue(Math.atan2(
      double.negativeInfinity, double.infinity).isNegative);
  Expect.isTrue(Math.atan2(
      double.negativeInfinity, double.negativeInfinity).isNegative);
}
