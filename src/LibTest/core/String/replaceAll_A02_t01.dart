/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Passing null as either argument results in NullPointerException
 * @description Tries to pass null as either argument and expects a NullPointerException
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


main() {
  check("a", null);
  check(null, "");
  check(null, null);
}

void check(Pattern from, String to) {
  try {
    "aaa".replaceAll(from, to);
    Expect.fail("NullPointerException is expected");
  } on NullPointerException catch(e) {}
}
