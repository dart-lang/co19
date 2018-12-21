/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * abstract int floor()
 * Returns the greatest integer no greater than this.
 * @description Checks that if the value is already equal to a mathematical
 * integer, then the result is the same as the value.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


import "dart:math" as Math;

check(int arg) {
  Expect.equals(arg, arg.toDouble().floor());
  Expect.equals(-arg, (-arg).toDouble().floor());
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
  check(Math.pow(2.0, 52).toInt());
  check(Math.pow(2.0, 53).toInt());
}
