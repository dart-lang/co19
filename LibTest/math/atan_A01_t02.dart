/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan(num x)
 * Converts [x] to a dobule and returns the arc tangent of the vlaue.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.atan(double.INFINITY) == Math.PI/2);
  Expect.isTrue(Math.atan(double.NEGATIVE_INFINITY) == -Math.PI/2);
}
