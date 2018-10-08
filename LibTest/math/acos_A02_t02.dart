/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double acos(num x)
 * Returns a value in the range 0..PI, or NaN if [x] is outside the range -1..1.
 * @description Checks returned values are in the range 0..PI, if an argument
 * is in the range -1..1.
 * @reviewer ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  var a;
  for (var d = -1.0; d <= 1.0; d += 0.5) {
    a = Math.acos(d);
    Expect.isTrue(a >= 0);
    Expect.isTrue(a <= Math.pi);
  }
}
