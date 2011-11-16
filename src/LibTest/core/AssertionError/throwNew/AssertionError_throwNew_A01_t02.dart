/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that invoking this method with all kinds of integer
 *              arguments that don't make sense (zero, negative, out of order)
 *              does not result in some other error being raised.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
 
main() {
  check(20, 10);
  check(0, 0);
  check(-1, -1);
  check(0x80000000, 0x7fffffff);
}

void check(int start, int end) {
  try {
    AssertionError.throwNew(start, end);
    Expect.fail("Something expected");
  } catch (AssertionError e) {
  }
}
