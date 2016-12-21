/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E single
 * If [this] is empty or has more than one element throws a [StateError].
 * @description Checks that a [StateError] is thrown if [this]
 * has more than one element.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string) {
  var runes = new Runes(string);
  Expect.throws(() {runes.single;}, (e) => e is StateError);
}

main() {
  check('  ');
  check('string');
  check('\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00');
}
