/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator ~/(num other)
 * Truncating division operator.
 *
 * If either operand is a double then the result of the truncating division
 * a ~/ b is equivalent to (a / b).truncate().toInt().
 * If both operands are ints then a ~/ b performs the truncating integer
 * division.
 * @description Tries to pass zero as argument.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  check(1);
  check(-1);
  check(0);
  check(0x1000000000000000);
}

void check(int x) {
  Expect.throws(() {x ~/ 0;}, (e) => e is IntegerDivisionByZeroException);
}
