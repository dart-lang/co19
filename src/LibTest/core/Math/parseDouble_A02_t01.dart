/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double parseDouble(String str)
 * Throws a FormatException if str cannot be parsed as a double.
 * @description Checks that exception is thrown if [str]
 * can not be converted to double.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview issue 1929
 */

void checkFE(String str) {
  try {
    Math.parseDouble(str);
    Expect.fail("FormatException is expected");
  } catch(FormatException e) {}
}
main() {
  checkFE("");
  checkFE("string");
  checkFE("1.a");
  checkFE("1 2");
  checkFE("1e");
  checkFE("2/2");
  checkFE("-");
  checkFE("+-1");
  checkFE("0X10");
  checkFE("0xa");
  
  checkFE("1.");
  checkFE("1.e0");
  checkFE("2E2.0");
  checkFE("InfiNIty");
  checkFE("nan");
}
