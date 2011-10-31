/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the line is recorded correctly when the FallThroughError
 *              is raised using a throwNew static method.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */

check(int tokenIndex, int expectedLine) {
  try {
    FallThroughError.throwNew(tokenIndex);
    Expect.fail("FallThroughError expected");
  } catch (FallThroughError e) {
    Expect.equals(expectedLine, e.line);
  }
}

main() {
  check(-10, 15);
  check(0, 15);
  check(3, 15);
  check(10, 16);
  check(1000, 31);
}
