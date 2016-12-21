/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final RuneIterator iterator
 * Returns an Iterator that iterates over this Iterable object.
 * @description Checks that this method returns true iff [this] has at least one
 * element.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

void checkIterator(string, expected) {
  var runes = new Runes(string);
  var it = runes.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(expected[i++], it.current);
  }
  Expect.equals(runes.length, i);
}

main() {
  checkIterator('', []);
  checkIterator('\x00\x01\x02\x03\u{10000}', [0, 1, 2, 3, 0x10000]);
  checkIterator('just a string', [0x6a, 0x75, 0x73, 0x74, 0x20, 0x61, 0x20,
    0x73, 0x74, 0x72, 0x69, 0x6e, 0x67]);
}
