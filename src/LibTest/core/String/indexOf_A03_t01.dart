/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Passing null as argument results in Error
 * @description Tries to pass null as [other] and expects an Error
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */


main() {
  checkNPE("string", null, 0);
}

void checkNPE(String str1, String str2, int idx) {
  try {
    str1.indexOf(str2, idx);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
