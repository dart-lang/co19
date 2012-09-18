/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns Euler's number e raised to the power of a double value.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

#import("dart:math", prefix: "Math");

main() {
  Expect.isTrue(Math.exp(double.NAN).isNaN());
  Expect.equals(double.INFINITY, Math.exp(double.INFINITY));
  Expect.equals(.0, Math.exp(double.NEGATIVE_INFINITY));
}
