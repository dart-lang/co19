/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void reset([int rawIndex = 0])
 * Resets the iterator to the given index into the string.
 * After this the current value is unset. You must call moveNext
 * make the rune at the position current, or movePrevious
 * for the last rune before the position.
 * @description Checks that moveNext and movePrevious set [current] correctly.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

check(string, pos, current, prev) {
  var it = new RuneIterator(string);
  it.moveNext();
  it.reset(pos);
  it.moveNext();
  Expect.equals(current, it.current);

  it = new RuneIterator(string);
  it.moveNext();
  it.reset(pos);
  it.movePrevious();
  Expect.equals(prev, it.current);
}

main() {
  check('', 0, -1, -1);
  check('a', 1, -1, 0x61);
  check('\u{10000}', 0, 0x10000, -1);
  check('\u{10000}\u{10001}\x01', 2, 0x10001, 0x10000);
  check('\u{10000}\u{10001}\x01', 4, 0x01, 0x10001);
  check('string', 2, 0x72, 0x74);
  check('string', 3, 0x69, 0x72);
}
