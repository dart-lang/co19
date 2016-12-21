/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String string
 * @description Checks that the corresponding string is returned.
 * @note undocumented
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string) {
  var runes = new Runes(string);
  Expect.equals(string, runes.string);
}

main() {
  check("");
  check("just a string");
  check("\u{10000}\u{10001}\u{10002}\u{12345}");
  check("\x00");
}
