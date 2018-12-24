/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toInt()
 * @description Checks [:toInt():] on values already equal to a math integer.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


import "dart:math" as Math;

check(double arg) {
  var v = arg.toInt();
  Expect.isTrue(v is int);
  Expect.equals(v, arg);
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
  check(Math.pow(2.0, 52));
  check(Math.pow(2.0, 53));
}
