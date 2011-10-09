/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns -1 if [other] could not be found.
 * @description Tries to pass null as [other]
 * @author msyabro
 * @needsreview
 */


main() {
  checkNPE("string", null, 5);
}

void checkNPE(String str1, String str2, int idx) {
  try {
    str1.lastIndexOf(str2, idx);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
