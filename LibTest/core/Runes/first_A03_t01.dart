/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int first
 * If [this] is empty throws a [StateError].
 * @description Checks that a [StateError] is thrown if [this] is empty.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string) {
  var runes = new Runes(string);
  Expect.equals(runes.elementAt(0), runes.first);
}

main() {
  check("just a string");
  check("\u{10000}\u{10001}\u{10002}\u{12345}");
  check("\x00");
}