/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ECMA-262 15.8.2.13 pow(x, y)
 * If x is -0 and y > 0 and y is an odd integer, the result is -0.
 * If x is -0 and y> 0 and y is not an odd integer, the result is +0.
 * @description Checks result if [number] is 0.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview Need to check +/-.0 for double result?
 */

import "dart:math" as Math;

main() {
  Expect.equals(0, Math.pow(-.0, 111));
  Expect.equals(0, Math.pow(-.0, 111.0));
  Expect.equals(0, Math.pow(-.0, 9223372036854775809));
  Expect.equals(0, Math.pow(-.0, 9223372036854775809));

  Expect.equals(0, Math.pow(-.0, 110));
  Expect.equals(0, Math.pow(-.0, 111.1));
  Expect.equals(0, Math.pow(-.0, 9223372036854775808));
}
