/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the line is recorded correctly when the AssertionError
 *              is raised using [:throwNew():] static method.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
 
check(int errorStart, int errorEnd, int expectedLine) {
  try {
    AssertionError.throwNew(errorStart, errorEnd);
    Expect.fail("AssertionError expected");
  } catch (AssertionError e) {
    Expect.equals(expectedLine, e.line);
  }
}

main() {
  check(-10, 1, 15);
  check(0, 1, 15);
  check(3, 2, 15);
  check(13, 100,  16);
  check(1000, 10000, 30);
}