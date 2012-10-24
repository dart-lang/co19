/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns minimum from [a] and [b]
 * @description Checks that if one of the arguments is NaN,
 * the result is also NaN.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Undocumented.
 */

import "dart:math" as Math;

main() {
  List<double> data = [double.NEGATIVE_INFINITY, -1e200, -10, -0.001, 0, 0.001, 10, 1e200, double.INFINITY];

  for(int i = 0; i < data.length; i++) {
    Expect.isTrue(Math.min(double.NAN, data[i]).isNaN);
    Expect.isTrue(Math.min(data[i], double.NAN).isNaN);
  }
}
