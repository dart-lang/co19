/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that invoking this method with integer arguments that are
 *              positive and in order results in AssertError.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
 
main() {
  check(10, 20);
}

void check(int start, int end) {
  try {
    AssertError.throwNew(start, end);
    Expect.fail("AssertError expected");
  } catch (AssertError e) {
  }
}
