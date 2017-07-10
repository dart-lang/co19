/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T min<T extends num>(T a, T b)
 * The lesser of -0.0 and 0.0 is -0.0
 * @description Checks that -0.0 is lesser than 0.0.
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.min(.0, -.0).isNegative);
  Expect.isTrue(Math.min(-.0, .0).isNegative);
}
