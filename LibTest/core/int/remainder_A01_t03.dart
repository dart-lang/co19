/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num remainder(num other)
 * Returns the remainder of the truncating division of this by other.
 *
 * The result r of this operation satisfies: this == (this ~/ other) * other + r.
 * As a consequence the remainder r has the same sign as the divider this.
 * @description Checks that passing a zero (both integer and double) as argument
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
  try {
    x.remainder(z);
    Expect.fail("IntegerDivisionByZeroException is expected");
  } on IntegerDivisionByZeroException catch(e) {}
}
