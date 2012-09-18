/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If abs(x)== 1 and y is +∞ , the result is NaN.
 * If abs(x)== 1 and y is -∞, the result is NaN.
 * @description Checks result if y is infinite.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview
 * @needsreview issue 449
 */

#import("dart:math", prefix: "Math");

main() {
  Expect.equals(double.NAN, Math.pow(1, double.INFINITY));
  Expect.equals(double.NAN, Math.pow(-1, double.INFINITY));
  Expect.equals(double.NAN, Math.pow(1.0, double.INFINITY));
  Expect.equals(double.NAN, Math.pow(-1.0, double.INFINITY));

  Expect.equals(double.NAN, Math.pow(1, double.NEGATIVE_INFINITY));
  Expect.equals(double.NAN, Math.pow(-1, double.NEGATIVE_INFINITY));
  Expect.equals(double.NAN, Math.pow(1.0, double.NEGATIVE_INFINITY));
  Expect.equals(double.NAN, Math.pow(-1.0, double.NEGATIVE_INFINITY));
}
