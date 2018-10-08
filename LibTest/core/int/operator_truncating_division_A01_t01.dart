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
 * @description Checks that this operator returns correct value.
 * @author vasya
 */
import "../../../Utils/expect.dart";

void check(var expected, var actual) {
  Expect.equals(expected, actual);
  Expect.isTrue(actual is int);
} 
 
main() {
  check(1, 6 ~/ 4);
  check(-1, -6 ~/ 4);
  check(0, 1 ~/ 2);
  check(2, 31 ~/ 15);
  check(1, 32 ~/ 32);
  check(0, 0 ~/ 2147483647);
  check(-10, (-21) ~/ 2);

  check(922337203685477580, 1844674407370955161 ~/ 2);
  check(-922337203685477580, 1844674407370955161 ~/ -2);
  check(0, 1844674407370955161 ~/ 9223372036854775807);
}

