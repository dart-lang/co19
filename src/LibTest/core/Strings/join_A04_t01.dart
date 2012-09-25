/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws ArgumentError if elements contained in the list aren't Strings.
 * @description Checks that appropriate exception is thrown.
 * @author msyabro
 * @needsreview undocumented
 */

check(List l) {
  try {
    Strings.join(l, "");
    Expect.fail("ArgumentError is expected");
  } on ArgumentError catch(e) {}
}

main() {
  check(["1", 2]);
  check([true, false]);
  check([new Object()]);
}
