/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int first
 * Returns the first element.
 * @description Checks that [first] is final and can't be set.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string) {
  dynamic runes = new Runes(string);
  try {
    runes.first = 0;
    Expect.fail("[first] should be final");
  } on NoSuchMethodError catch(ok) {}
}


main() {
  check("just a string");
  check("\u{10000}\u{10001}\u{10002}\u{12345}");
  check("\x00");
}
