/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int round()
 * Returns the integer closest to this.
 * Rounds away from zero when there is no closest integer:
 * (3.5).round() == 4 and (-3.5).round() == -4.
 * @description Checks that if the value is already equal to a mathematical
 * integer, then the result is the same as the value.
 * @author pagolubev
 */
import "dart:math" as Math;
import "../../../Utils/expect.dart";

check(int arg) {
  double argd = arg.toDouble();
  Expect.equals(arg, argd.round());
  Expect.equals(-arg, (-argd).round());
}

main() {
  check(1);
  check(2);
  check(3);
  check(4);
  check(5);
  check(12);
  check(123);
  check(1234);
  check(12345);
  check(123456);
  check(1234567);
  check(123456789012345);
  check(1234567.0E10.toInt());
//  check(1234567.0E15.toInt());
//  check(1234567.0E20.toInt());
//  check(1234567.0E40.toInt());
//  check(1234567.0E80.toInt());
  check(Math.pow(2.0, 52).toInt());
  check(Math.pow(2.0, 53).toInt());
//  check(Math.pow(2.0, 520).toInt());
//  check(1.0E308.toInt());
}
