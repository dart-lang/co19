/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RuneIterator.at(String string, int index)
 * When created, there is no current value.
 * @description Checks that [current] equals -1 when [RuneIterator] is created.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

check(string, pos) {
  var it = new RuneIterator.at(string, pos);
  Expect.equals(-1, it.current);
}

main() {
  check('', 0);
  check('a', 1);
  check('\u{10000}\u{10001}\x01', 2);
  check('\u{10000}\u{10001}\x01', 4);
}
