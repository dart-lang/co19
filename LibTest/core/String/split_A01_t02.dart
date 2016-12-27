/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Splits the string around matches of [pattern]. Returns a list of
 * substrings.
 * @description Checks the contents of resulting list
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  checkArrayEquals("1,2".split(","), ["1", "2"]);
  checkArrayEquals("12345".split(","), ["12345"]);
  checkArrayEquals("12345,".split(","), ["12345", ""]);
  checkArrayEquals("1, 2, 3, 4, 5".split(new RegExp("\\d", multiLine: false,
      caseSensitive: true)), ["", ", ", ", ", ", ", ", ", ""]);
  checkArrayEquals("12".split(""), ["1", "2"]);
}

void checkArrayEquals(List expected, List actual) {
  Expect.equals(expected.length, actual.length);
  for(var i = 0; i < expected.length; i += 1) {
    Expect.equals(expected[i], actual[i]);
  }
}
