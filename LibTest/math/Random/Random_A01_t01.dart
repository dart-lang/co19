/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Random([int seed])
 * Creates a random-number generator.
 * @description Checks that an instance of [Random] is created.
 * @author msyabro
 */

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  var rand = new Random(519);
  Expect.isTrue(rand is Random);

  rand = new Random(100);
  Expect.isTrue(rand is Random);

  rand = new Random();
  Expect.isTrue(rand is Random);
}
