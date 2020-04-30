/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RuneIterator(String string)
 * Create an iterator positioned at the beginning of the string.
 * @description Checks that [RuneIterator] is created with correct
 * position.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

check(string, firstCodePoint) {
  var it = new RuneIterator(string);
  Expect.isTrue(it is RuneIterator);
  it.moveNext();
  Expect.equals(firstCodePoint, it.current);
}

main() {
  check('', -1);
  check('a', 0x61);
  check('\u{10000}', 0x10000);
  check('\u{10000}\u{10001}\x01', 0x10000);
  check('string', 0x73);
}
