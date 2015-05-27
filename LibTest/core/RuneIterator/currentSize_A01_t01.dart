/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int currentSize
 * The number of code units comprising the current rune.
 * @description Checks that the correct size is returned.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var it = new RuneIterator('1234567890');
  while(it.moveNext()) {
    Expect.equals(1, it.currentSize);
  }

  it = new RuneIterator('\u{10000}\u{10001}\u{1d111}\u{1d112}\u{10002}');
  while(it.moveNext()) {
    Expect.equals(2, it.currentSize);
  }

  it = new RuneIterator('\u{10000}\x00\u{10001}\x01\u{1d111}\x02\u{1d112}\x03\u{10002}\x04');
  while(it.moveNext()) {
    Expect.equals(it.currentAsString.length, it.currentSize);
  }
}