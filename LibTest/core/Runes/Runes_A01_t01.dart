/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Runes(String string)
 * @description Checks that an instance of Runes is created.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string) {
  var runes = new Runes(string);
  Expect.isTrue(runes is Runes);
}

main() {
  check("");
  check("just a string");
  check("\u{10000}\u{10001}\u{10002}\u{12345}");
}
