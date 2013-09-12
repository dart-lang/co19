/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num y)
 * if [y] is zero (0.0 or -0.0), the result is always 1.0.
 * @description Checks the result if [y] is zero.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(1.0, Math.pow(double.NAN, .0));
  Expect.equals(1.0, Math.pow(double.NAN, -.0));

  Expect.equals(1.0, Math.pow(double.INFINITY, .0));
  Expect.equals(1.0, Math.pow(double.INFINITY, -.0));

  Expect.equals(1.0, Math.pow(double.NEGATIVE_INFINITY, .0));
  Expect.equals(1.0, Math.pow(double.NEGATIVE_INFINITY, -.0));

  Expect.equals(1.0, Math.pow(.0, .0));
  Expect.equals(1.0, Math.pow(-.0, .0));
  Expect.equals(1.0, Math.pow(.0, -.0));
  Expect.equals(1.0, Math.pow(-.0, -.0));
  Expect.equals(1.0, Math.pow(0, .0));
  Expect.equals(1.0, Math.pow(0, -.0));

  Expect.equals(1.0, Math.pow(11.11, .0));
  Expect.equals(1.0, Math.pow(11.11, -.0));
  Expect.equals(1.0, Math.pow(-11.11, .0));
  Expect.equals(1.0, Math.pow(-11.11, -.0));

  Expect.equals(1.0, Math.pow(11, .0));
  Expect.equals(1.0, Math.pow(11, -.0));
  Expect.equals(1.0, Math.pow(-11, .0));
  Expect.equals(1.0, Math.pow(-11, -.0));
}
