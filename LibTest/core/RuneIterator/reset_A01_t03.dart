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
 * @description Checks that the default value for [rawIndex] is 0.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

check(string, current) {
  var it = new RuneIterator(string);
  it.moveNext();
  it.reset();
  it.moveNext();
  Expect.equals(current, it.current);
}

main() {
  check('a',0x61);
  check('\u{10000}', 0x10000);
  check('\u{10000}\u{10001}\x01', 0x10000);
  check('string', 0x73);
}
