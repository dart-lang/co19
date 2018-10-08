/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T max<T extends num>(T a, T b)
 * The larger of -0.0 and 0.0 is 0.0
 * @description Checks that 0.0 is larger than -0.0.
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isFalse(Math.max(.0, -.0).isNegative);
  Expect.isFalse(Math.max(-.0, .0).isNegative);
}
