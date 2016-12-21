/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool moveNext()
 * Moves to the next element.Returns true if [current] contains the next element.
 * @description Checks that true is returned if [current] contains the next
 * element.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

void check(string) {
  var runes = new Runes(string);
  var it = new RuneIterator(string);

  for(int i = 0; i < runes.length; ++i) {
    var res = it.moveNext();
    Expect.equals(runes.elementAt(i), it.current);
    Expect.isTrue(res);
  }
}

main() {
  check('abcdefghijklmnopqrstuvwxyz1234567890');
  check('\u{10000}\u{13000}\u{1d001}');
}