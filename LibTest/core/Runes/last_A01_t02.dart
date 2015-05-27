/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int last
 * Returns the last element.
 * @description Checks that [last] is final and can't be set.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

check(string) {
  var runes = new Runes(string);
  try {
    runes.last = 0;
    Expect.fail("[last] should be final");
  } on NoSuchMethodError catch(ok) {}
}


main() {
  check("just a string");
  check("\u{10000}\u{10001}\u{10002}\u{12345}");
  check("\x00");
}