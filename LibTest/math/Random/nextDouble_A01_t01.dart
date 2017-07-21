/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double nextDouble()
 * Generates a positive random floating point value uniformly distributed
 * on the range from 0.0, inclusive, to 1.0, exclusive.
 * @description Checks range of the result.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  Random rand = new Random(1023);
  for (int i = 0; i < 1000; i++) {
    double x = rand.nextDouble();
    Expect.isTrue(x < 1 && x >= 0);
  }
}
