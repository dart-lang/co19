/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the column is recorded correctly when the
 *              AssertionError is raised using a throwNew static method.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */

check(int errorStart, int errorEnd, int expectedColumn) {
  try {
    AssertionError.throwNew(errorStart, errorEnd);
    Expect.fail("AssertionError expected");
  } catch (AssertionError e) {
    Expect.equals(expectedColumn, e.column);
  }
}

main() {
  check(0, 3, 1);
  check(1, 3, 6);
  check(-1, -1, 1);
  check(1, 1, 6);
  check(1, 0, 6); //??
}
