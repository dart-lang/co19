/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<int> codeUnits
 * Returns an unmodifiable list of the UTF-16 code units of this string.
 * @description Checks that the correct codeUnits are returned.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  checkArrayEquals([0x61, 0x62, 0x63, 0x64], "abcd".codeUnits);
  checkArrayEquals([], "".codeUnits);
  checkArrayEquals([0x61, 0x62, 0x63, 0], "abc\u0000".codeUnits);
  checkArrayEquals([0], "\u0000".codeUnits);
  checkArrayEquals([0x0061, 0x1d02, 0xd800, 0xdc00],
      "\u0061\u1d02\u{10000}".codeUnits);
  checkArrayEquals([0x441, 0x442, 0x440, 0x43e, 0x43a, 0x430],
      "строка".codeUnits);
}

void checkArrayEquals(List expected, List actual) {
  Expect.equals(expected.length, actual.length);
  for(var i = 0; i < expected.length; i += 1) {
    Expect.equals(expected[i], actual[i]);
  }
}
