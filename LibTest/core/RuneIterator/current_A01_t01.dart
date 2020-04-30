/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int current
 * The rune (integer Unicode code point) starting at the current position in the
 * string.
 * @description Checks that the current element of the iterator is returned.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

void check(string) {
  var runes = new Runes(string);
  var it = new RuneIterator(string);
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(runes.elementAt(i++), it.current);
  }
}

main() {
  check('');
  check('a');
  check('\u{10000}\u{10001}\u0001\u{10002}');
  check('\x01\x02\x03\x04\x05\x06\x07\x08\x09');
  check('1234567890');
}
