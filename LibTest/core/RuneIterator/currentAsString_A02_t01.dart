/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String currentAsString
 * For runes outside the basic multilingual plane,
 * this will be a [String] of length 2, containing two code units.
 * @description Checks that for runes outside the basic multilingual plane
 * [currentAsString] returns a [String] of length 2, containing two code units.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

void check(string) {
  var it = new RuneIterator(string);
  var i = 0;
  while (it.moveNext()) {
    Expect.equals('${string[i++]}${string[i++]}', it.currentAsString);
    Expect.equals(2, it.currentAsString.length);
  }
}

main() {
  check('\u{1d110}\u{1d111}\u{1d112}\u{1d113}');
  check('\u{10000}\u{10001}\u{10002}\u{10003}');
}