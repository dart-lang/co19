/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E single
 * Returns the single element in [this].
 * @description Checks that the single element of [this] is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string, expected) {
  var runes = new Runes(string);
  Expect.equals(expected, runes.single);
}

main() {
  check("j", 0x6a);
  check("\u{10000}", 0x10000);
  check("\x00", 0);
}
