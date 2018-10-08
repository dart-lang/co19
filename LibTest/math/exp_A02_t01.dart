/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double exp(num x)
 * Returns NaN if [x] is NaN.
 * @description Checks that [exp] returns NaN if [x] is NaN.
 * @author msyabro
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.exp(double.nan).isNaN);
}
