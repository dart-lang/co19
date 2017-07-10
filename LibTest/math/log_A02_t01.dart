/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double log(num x)
 * Returns negative infinity if [x] is equal to zero.
 * @description Checks that [log] returns negative infinity
 * if [x] is equal to zero.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.log(0).isInfinite);
  Expect.isTrue(Math.log(0).isNegative);

  Expect.isTrue(Math.log(-.0).isInfinite);
  Expect.isTrue(Math.log(-.0).isNegative);

  Expect.isTrue(Math.log(.0).isInfinite);
  Expect.isTrue(Math.log(.0).isNegative);
}
