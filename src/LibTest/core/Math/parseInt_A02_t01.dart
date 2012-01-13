/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws BadNumberFormatException if
 * String can not be converted to int
 * @description Check that exception is thrown if
 * String can not be converted to int.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

void checkBNFE(String string) {
  try {
    Math.parseInt(string);
    Expect.fail("BadNumberFormatException is expected");
  } catch(BadNumberFormatException e) {}
}
main() {
  checkBNFE("");
  checkBNFE("1.0");
  checkBNFE("1e2");
  checkBNFE("just string");
  checkBNFE("1A");
  checkBNFE("NaN");
  checkBNFE("Infinity");
  checkBNFE("1/1");
  checkBNFE("-");
  checkBNFE("1 2 ");
  checkBNFE("12-");
  checkBNFE("+-1");
}