/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num y)
 * if [x] is Infinity and [y] is positive, the result is Infinity.
 * @description Checks the result if [x] is Infinity and [y] is positive.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(double.INFINITY, Math.pow(double.INFINITY, 1));
  Expect.equals(double.INFINITY, Math.pow(double.INFINITY, 1.0));
  Expect.equals(double.INFINITY, Math.pow(double.INFINITY, 11));
  Expect.equals(double.INFINITY, Math.pow(double.INFINITY, 11.11));
  Expect.equals(double.INFINITY, Math.pow(double.INFINITY, double.INFINITY));
}
