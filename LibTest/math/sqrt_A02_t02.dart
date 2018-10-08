/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sqrt(num x)
 * Returns -0.0 if x is -0.0, and NaN if x is otherwise negative or NaN.
 * @description Checks that [sqrt] returns NaN if [x] is NaN.
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.sqrt(double.nan).isNaN);
}
