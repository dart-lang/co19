/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Passing null as argument results in ArgumentError
 * @description Tries to pass null as argument and expects an ArgumentError
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview Undocumented
 */


main() {
  check("string");
}

void check(String str1) {
  try {
    str1.concat(null);
    Expect.fail("ArgumentError is expected");
  } on ArgumentError catch(e) {}
}
