/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RuneIterator.at(String string, int index)
 * Create an iterator positioned before the indexth code unit of the string.
 * @description Checks that [RuneIterator] is created with correct position.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

check(string, pos, firstCodePoint) {
  var it = new RuneIterator.at(string, pos);
  Expect.isTrue(it is RuneIterator);
  it.moveNext();
  Expect.equals(firstCodePoint, it.current);
}

main() {
  check('', 0, -1);
  check('a', 1, -1);
  check('\u{10000}', 0, 0x10000);
  check('\u{10000}\u{10001}\x01', 2, 0x10001);
  check('\u{10000}\u{10001}\x01', 4, 0x01);
  check('string', 2, 0x72);
  check('string', 3, 0x69);
}
