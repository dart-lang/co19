/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double parseDouble(String str)
 * Throws a BadNumberFormatException if str cannot be parsed as a double.
 * @description Checks that exception is thrown if [str] 
 * can not be converted to double.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview issue 1929
 */

void checkBNFE(String str) {
  try {
    Math.parseDouble(str);
    Expect.fail("BadNumberFormatException is expected");
  } catch(BadNumberFormatException e) {}
}
main() {
  checkBNFE("");
  checkBNFE("string");
  checkBNFE("1.a");
  checkBNFE("1 2");
  checkBNFE("1e");
  checkBNFE("2/2");
  checkBNFE("-");
  checkBNFE("+-1");
  checkBNFE("0X10");
  checkBNFE("0xa");
  
  checkBNFE("1.");
  checkBNFE("1.e0");
  checkBNFE("2E2.0");
  checkBNFE("InfiNIty");
  checkBNFE("nan");
}
