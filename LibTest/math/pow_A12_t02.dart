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
      Math.pow(double.infinity, 2), Math.pow(double.negativeInfinity, 2));
  Expect.equals(
      Math.pow(double.infinity, 2.0), Math.pow(double.negativeInfinity, 2.0));
  Expect.equals(
      Math.pow(double.infinity, 22), Math.pow(double.negativeInfinity, 22));
  Expect.equals(Math.pow(double.infinity, 22.0),
      Math.pow(double.negativeInfinity, 22.0));
  Expect.equals(
      Math.pow(double.infinity, 0.2), Math.pow(double.negativeInfinity, 0.2));
  Expect.equals(Math.pow(double.infinity, double.infinity),
      Math.pow(double.negativeInfinity, double.infinity));

  Expect.equals(
      Math.pow(double.infinity, -2), Math.pow(double.negativeInfinity, -2));
  Expect.equals(Math.pow(double.infinity, -2.0),
      Math.pow(double.negativeInfinity, -2.0));
  Expect.equals(
      Math.pow(double.infinity, -22), Math.pow(double.negativeInfinity, -22));
  Expect.equals(Math.pow(double.infinity, -22.0),
      Math.pow(double.negativeInfinity, -22.0));
  Expect.equals(Math.pow(double.infinity, -0.2),
      Math.pow(double.negativeInfinity, -0.2));
  Expect.equals(Math.pow(double.infinity, double.negativeInfinity),
      Math.pow(double.negativeInfinity, double.negativeInfinity));

  Expect.equals(Math.pow(.0, 2), Math.pow(-.0, 2));
  Expect.equals(Math.pow(.0, 2.0), Math.pow(-.0, 2.0));
  Expect.equals(Math.pow(.0, 22), Math.pow(-.0, 22));
  Expect.equals(Math.pow(.0, 22.0), Math.pow(-.0, 22.0));
  Expect.equals(Math.pow(.0, 0.2), Math.pow(-.0, 0.2));
  Expect.equals(Math.pow(.0, double.infinity), Math.pow(-.0, double.infinity));

  Expect.equals(Math.pow(.0, -2), Math.pow(-.0, -2));
  Expect.equals(Math.pow(.0, -2.0), Math.pow(-.0, -2.0));
  Expect.equals(Math.pow(.0, -22), Math.pow(-.0, -22));
  Expect.equals(Math.pow(.0, -22.0), Math.pow(-.0, -22.0));
  Expect.equals(Math.pow(.0, -0.2), Math.pow(-.0, -0.2));
  Expect.equals(Math.pow(.0, double.negativeInfinity),
      Math.pow(-.0, double.negativeInfinity));
}
