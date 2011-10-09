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
//    checkNPE("string", null);
  Expect.isTrue("string" + null == "stringnull");
}

void checkNPE(String str) {
  try {
    String foo = str + null;
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
