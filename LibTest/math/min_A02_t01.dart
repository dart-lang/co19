/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T min<T extends num>(T a, T b)
 * Returns NaN if either argument is NaN.
 * @description Checks that if one of the arguments is NaN,
 * the result is also NaN.
 * @author msyabro
  * @needsreview Undocumented.
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  List<double> data = [
    double.negativeInfinity, -1e200, -10.0, -0.001, 0.0, 0.001, 10.0, 1e200,
    double.infinity
  ];

  for (int i = 0; i < data.length; i++) {
    Expect.isTrue(Math.min(double.nan, data[i]).isNaN);
    Expect.isTrue(Math.min(data[i], double.nan).isNaN);
  }
}
