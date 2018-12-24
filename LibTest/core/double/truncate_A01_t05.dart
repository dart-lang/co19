/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int truncate()
 * Returns the integer obtained by discarding any fractional digits from this.
 * @description Checks that if the value is already equal to a mathematical
 * integer, then the result is the same as the value.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

import "dart:math" as Math;

check(num arg) {
  double argd=arg.toDouble();
  Expect.equals(arg, argd.truncate());
  Expect.equals(-arg, (-argd).truncate());
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
