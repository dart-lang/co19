/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get rawIndex
 * Returns the starting position of the current rune in the string.
 * @description Checks that the correct position is returned.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

void check(string) {
  var it = new RuneIterator(string);
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(i, it.rawIndex);
    i+=it.currentAsString.length;
  }
}

main() {
  check('');
  check('a');
  check('\u{10000}\u{10001}\u0001\u{10002}');
  check('\x01\x02\x03\x04\x05\x06\x07\x08\x09');
  check('1234567890');
}