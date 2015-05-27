/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * Returns the number of elements in this.
 * @description Checks that the number of elements is returned.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

void check(string, length) {
  var runes = new Runes(string);
  Expect.equals(length, runes.length);
}

main() {
  check('', 0);
  check('\u{10000}\u{10001}\u{10002}\u{12345}', 4);
  check('\x00\x01\x02\x03\x04\x05', 6);
  check('три', 3);
  check('こんにちは', 5);

}
