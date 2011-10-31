/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that invoking this method with a positive integer
 *              argument results in FallThroughError.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
 
main() {
  check(1);
  check(10);
  check(0x7fffffff);
}

void check(int pos) {
  try {
    FallThroughError.throwNew(pos);
    Expect.fail("FallThroughError expected");
  } catch (FallThroughError e) {
  }
}
