/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num y)
 * if [x] is -Infinity or -0.0 and [y] is an odd integer,
 * then the result is -pow(-[x] ,[y]).
 * @description Checks the result when [x] is -Infinity
 * or -0.0 and [y] is an odd integer.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 1));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 1.0));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 11));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(double.NEGATIVE_INFINITY, 11.0));

  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -1));
  Expect.isTrue(Math.pow(double.NEGATIVE_INFINITY, -1).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -1.0));
  Expect.isTrue(Math.pow(double.NEGATIVE_INFINITY, -1.0).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -11));
  Expect.isTrue(Math.pow(double.NEGATIVE_INFINITY, -11).isNegative);
  Expect.equals(.0, Math.pow(double.NEGATIVE_INFINITY, -11.0));
  Expect.isTrue(Math.pow(double.NEGATIVE_INFINITY, -11.0).isNegative);

  Expect.equals(.0, Math.pow(-.0, 1));
  Expect.isTrue(Math.pow(-.0, 1).isNegative);
  Expect.equals(.0, Math.pow(-.0, 1.0));
  Expect.isTrue(Math.pow(-.0, 1.0).isNegative);
  Expect.equals(.0, Math.pow(-.0, 11));
  Expect.isTrue(Math.pow(-.0, 11).isNegative);
  Expect.equals(.0, Math.pow(-.0, 11.0));
  Expect.isTrue(Math.pow(-.0, 11.0).isNegative);

  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -1));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -1.0));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -11));
  Expect.equals(double.NEGATIVE_INFINITY, Math.pow(-.0, -11.0));
}
