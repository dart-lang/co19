/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num remainder(num other)
 * Returns remainder left by division.
 * @description Checks that passing a zero (both integer and double) as argument
 * results in IntegerDivisionByZeroException
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 * @needsreview Undocumented
 */

main() {
  check(1, 0);
  check(1, 0.0);
  check(1, -0.0);
  check(-1, 0);
  check(-1, 0.0);
  check(-1, -0.0);
  check(0, 0);
  check(0, 0.0);
  check(0, -0.0);
}
  
void check(int x, num z) {
  try {
    x.remainder(z);
    Expect.fail("IntegerDivisionByZeroException is expected");
  } catch(IntegerDivisionByZeroException e) {}
}
