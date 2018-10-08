/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num exponent)
 * For doubles, pow(x, y) handles edge cases as follows:
 * ...
 *  - if [x] is -Infinity or -0.0 and [y] is an odd integer, then the result
 *    is -pow(-[x] ,[y]).
 * @description Checks the result when [x] is -Infinity or -0.0 and [y] is an
 * odd integer, the result is -pow(-[x] ,[y])..
 * @author ngl@unipro.ru
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.equals(
      -Math.pow(double.infinity, 1), Math.pow(double.negativeInfinity, 1));
  Expect.equals(
      -Math.pow(double.infinity, 1.0), Math.pow(double.negativeInfinity, 1.0));
  Expect.equals(
      -Math.pow(double.infinity, 11), Math.pow(double.negativeInfinity, 11));
  Expect.equals(
      -Math.pow(double.infinity, 11.0),
      Math.pow(double.negativeInfinity, 11.0));

  Expect.equals(
      -Math.pow(double.infinity, -1), Math.pow(double.negativeInfinity, -1));
  Expect.equals(
      -Math.pow(double.infinity, -1.0),
      Math.pow(double.negativeInfinity, -1.0));
  Expect.equals(
      -Math.pow(double.infinity, -11), Math.pow(double.negativeInfinity, -11));
  Expect.equals(
      -Math.pow(double.infinity, -11.0),
      Math.pow(double.negativeInfinity, -11.0));

  Expect.equals(-Math.pow(.0, 1), Math.pow(-.0, 1));
  Expect.equals(-Math.pow(.0, 1.0), Math.pow(-.0, 1.0));
  Expect.equals(-Math.pow(.0, 11), Math.pow(-.0, 11));
  Expect.equals(-Math.pow(.0, 11.0), Math.pow(-.0, 11.0));

  Expect.equals(-Math.pow(.0, -1), Math.pow(-.0, -1));
  Expect.equals(-Math.pow(.0, -1.0), Math.pow(-.0, -1.0));
  Expect.equals(-Math.pow(.0, -11), Math.pow(-.0, -11));
  Expect.equals(-Math.pow(.0, -11.0), Math.pow(-.0, -11.0));
}
