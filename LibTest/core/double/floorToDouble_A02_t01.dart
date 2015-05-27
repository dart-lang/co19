/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * abstract abstract double floorToDouble()
 * If this is not finite (NaN or infinity), returns this object unchanged.
 * @description Checks that [:ceilToDouble():] on NaN returns NaN.
 * @needsreview #16102
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  double nan = 0 / 0;
  Expect.isTrue(nan.ceilToDouble().isNaN);
  Expect.isTrue((-nan).ceilToDouble().isNaN);
}
