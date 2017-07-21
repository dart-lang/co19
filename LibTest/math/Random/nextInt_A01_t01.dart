/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int nextInt(int max)
 * Generates a non-negative random integer uniformly distributed on the range
 * from 0, inclusive, to max, exclusive.
 * @description Checks range of the result.
 * @author msyabro
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  Random rand = new Random(511);
  for (int i = 0; i < 1000; i++) {
    int x = rand.nextInt(1000);
    Expect.isTrue(x < 1000 && x >= 0);
  }
}
