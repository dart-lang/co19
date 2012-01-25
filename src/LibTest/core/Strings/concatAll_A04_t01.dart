/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws IllegalArgumentException if elements contained in the list aren't Strings.
 * @description Checks that appropriate exception is thrown.
 * @author msyabro
 * @needsreview undocumented
 */

check(List l) {
  try {
    Strings.concatAll(l);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}

main() {
  check(["1",2]);
  check([1, "2", 3]);
  check(["1", 2.0, (3/0)]);
  check([true, false]);
  check([new Object()]);
}
