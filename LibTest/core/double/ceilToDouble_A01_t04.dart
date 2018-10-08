/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double ceilToDouble()
 * Returns the least integer value no smaller than this.
 * The result is a double.
 * @description Checks that if [:ceilToDouble():] is called on a value already
 * equal to a mathematical integer, then the result is the same value.
 * @author pagolubev
 */
import "dart:math" as Math;
import "../../../Utils/expect.dart";

check(double argument) {
  Expect.equals(argument, argument.ceilToDouble());
  Expect.equals(-argument, (-argument).ceilToDouble());
}

main() {
  check(1.0);
  check(2.0);
  check(3.0);
  check(4.0);
  check(5.0);
  check(12.0);
  check(123.0);
  check(1234.0);
  check(12345.0);
  check(123456.0);
  check(1234567.0);
  check(123456789012345.0);
  check(1234567.0E10);
  check(1234567.0E15);
  check(1234567.0E20);
  check(1234567.0E40);
  check(1234567.0E80);
  check(Math.pow(2.0, 52));
  check(Math.pow(2.0, 53));
  check(Math.pow(2.0, 520));
  check(1.0E308);
}
