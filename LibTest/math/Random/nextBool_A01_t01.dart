/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool nextBool()
 * Generates a random boolean value.
 * @description Checks generated values.
 * @author msyabro
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  Random rand = new Random(97531);
  for (int i = 0; i < 1000; i++) {
    var x = rand.nextBool();
    Expect.isTrue(x is bool);
  }
}
