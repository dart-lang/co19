/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion [yet to be written]
 * @description Tries to pass null as argument
 * @author rodionov
 * @needsreview
 */


main() {
  checkIAE("string");
}

void checkIAE(String str1) {
  try {
    str1.concat(null);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}
