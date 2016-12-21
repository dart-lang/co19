/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int first
 * Returns the first element.
 * @description Checks that the first element is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string, expected) {
  var runes = new Runes(string);
  Expect.equals(expected, runes.first);
}


main() {
  check("just a string", 0x6a);
  check("\u{10000}\u{10001}\u{10002}\u{12345}", 0x10000);
  check("\x00", 0);
}