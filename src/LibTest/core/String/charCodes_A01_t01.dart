/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a list of the scalar character codes of this string.
 * @description Checks that the correct charcodes are returned.
 * @reviewer pagolubev
 * @author rodionov
 */

main() {
  checkArrayEquals([0x61, 0x62, 0x63, 0x64], "abcd".charCodes);
  checkArrayEquals([], "".charCodes);
  checkArrayEquals([0x61, 0x62, 0x63, 0], "abc\u0000".charCodes);
  checkArrayEquals([0], "\u0000".charCodes);
  checkArrayEquals([0x0061, 0x1d02, 0xd800, 0xdc00], "\u0061\u1d02\u{10000}".charCodes);
}

void checkArrayEquals(List expected, List actual) {
  Expect.equals(expected.length, actual.length);
  for(var i = 0; i < expected.length; i+=1) {
    Expect.equals(expected[i], actual[i]);
  }
}
