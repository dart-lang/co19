/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * If [this] has fewer than [index] elements throws a RangeError.
 * @description Checks that a [RangeError] is thrown if [this]
 * has fewer than [index] elements.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

check(string) {
  var runes = new Runes(string);
  try {
    runes.elementAt(runes.length + 1);
    Expect.fail("RangeError is expected");
  } on RangeError catch(ok) {}
  try {
    runes.elementAt(-1);
    Expect.fail("RangeError is expected");
  } on RangeError catch(ok) {}
}

main() {
  check('');
  check('a');
  check('abcdefghijklmnopqrstuvwxyz');
}
