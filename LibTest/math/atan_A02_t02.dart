/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double asin(num x)
 * Returns a value in the range -PI/2..PI/2, or NaN if [x] is NaN.
 * @description Checks returned values are in the range -PI/2..PI/2, if an
 * argument is not NaN.
 * @reviewer ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  var a;
  for (var d = -10.0; d <= 10.0; d += 0.5) {
    a = Math.atan(d);
    Expect.isTrue(a >= -Math.pi / 2);
    Expect.isTrue(a <= Math.pi / 2);
  }
}
