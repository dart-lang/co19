/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool movePrevious()
 * Move back to the previous element.Returns true and updates [current] if
 * successful.
 * @description Checks that true is returned and [current] is updated correctly.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

void check(string) {
  var runes = new Runes(string);
  var it = new RuneIterator(string);
  it.reset(string.length);

  for(int i = runes.length - 1; i >=0; --i) {
    var res = it.movePrevious();
    Expect.equals(runes.elementAt(i), it.current);
    Expect.isTrue(res);
  }
}

main() {
  check('abcdefghijklmnopqrstuvwxyz1234567890');
  check('\u{10000}\u{13000}\u{1d001}');
}