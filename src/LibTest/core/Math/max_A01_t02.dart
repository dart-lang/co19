/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns maximum from [a] and [b]
 * @description Checks that if one of the arguments is NaN,
 * the result is also NaN.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Undocumented.
 */

main() {
  List<double> data = [double.NEGATIVE_INFINITY, -1e200, -10, -0.001, 0, 0.001, 10, 1e200, double.INFINITY];
  for(int i = 0; i < data.length; i++) {
    Expect.isTrue(Math.max(double.NAN, data[i]).isNaN());
    Expect.isTrue(Math.max(data[i], double.NAN).isNaN());
  }
}
