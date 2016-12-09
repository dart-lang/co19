/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num operator %(num other) 
 * The % operator yields the remainder of its operands from an implied division;
 * the left operand is the dividend and the right operand is the divisor.
 * @description Checks that passing a zero as argument
 * results in IntegerDivisionByZeroException
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  check(1, 0);
  check(-1, 0);
  check(0, 0);
}
  
void check(int x, num z) {
  Expect.throws(() {x % z;}, (e) => e is IntegerDivisionByZeroException);
}
