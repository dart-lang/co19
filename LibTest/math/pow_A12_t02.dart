/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion pow(x, exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if x is -Infinity or -0.0 and y is not an odd integer, then the result
 *    is the same as pow(-x , y).
 * @description Checks the result when [x] is -Infinity or -0.0 and [y] is
 * not an odd integer, the result is the same as pow(-x , y).
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(
      Math.pow(double.INFINITY, 2), Math.pow(double.NEGATIVE_INFINITY, 2));
  Expect.equals(
      Math.pow(double.INFINITY, 2.0), Math.pow(double.NEGATIVE_INFINITY, 2.0));
  Expect.equals(
      Math.pow(double.INFINITY, 22), Math.pow(double.NEGATIVE_INFINITY, 22));
  Expect.equals(Math.pow(double.INFINITY, 22.0),
      Math.pow(double.NEGATIVE_INFINITY, 22.0));
  Expect.equals(
      Math.pow(double.INFINITY, 0.2), Math.pow(double.NEGATIVE_INFINITY, 0.2));
  Expect.equals(Math.pow(double.INFINITY, double.INFINITY),
      Math.pow(double.NEGATIVE_INFINITY, double.INFINITY));

  Expect.equals(
      Math.pow(double.INFINITY, -2), Math.pow(double.NEGATIVE_INFINITY, -2));
  Expect.equals(Math.pow(double.INFINITY, -2.0),
      Math.pow(double.NEGATIVE_INFINITY, -2.0));
  Expect.equals(
      Math.pow(double.INFINITY, -22), Math.pow(double.NEGATIVE_INFINITY, -22));
  Expect.equals(Math.pow(double.INFINITY, -22.0),
      Math.pow(double.NEGATIVE_INFINITY, -22.0));
  Expect.equals(Math.pow(double.INFINITY, -0.2),
      Math.pow(double.NEGATIVE_INFINITY, -0.2));
  Expect.equals(Math.pow(double.INFINITY, double.NEGATIVE_INFINITY),
      Math.pow(double.NEGATIVE_INFINITY, double.NEGATIVE_INFINITY));

  Expect.equals(Math.pow(.0, 2), Math.pow(-.0, 2));
  Expect.equals(Math.pow(.0, 2.0), Math.pow(-.0, 2.0));
  Expect.equals(Math.pow(.0, 22), Math.pow(-.0, 22));
  Expect.equals(Math.pow(.0, 22.0), Math.pow(-.0, 22.0));
  Expect.equals(Math.pow(.0, 0.2), Math.pow(-.0, 0.2));
  Expect.equals(Math.pow(.0, double.INFINITY), Math.pow(-.0, double.INFINITY));

  Expect.equals(Math.pow(.0, -2), Math.pow(-.0, -2));
  Expect.equals(Math.pow(.0, -2.0), Math.pow(-.0, -2.0));
  Expect.equals(Math.pow(.0, -22), Math.pow(-.0, -22));
  Expect.equals(Math.pow(.0, -22.0), Math.pow(-.0, -22.0));
  Expect.equals(Math.pow(.0, -0.2), Math.pow(-.0, -0.2));
  Expect.equals(Math.pow(.0, double.NEGATIVE_INFINITY),
      Math.pow(-.0, double.NEGATIVE_INFINITY));
}
