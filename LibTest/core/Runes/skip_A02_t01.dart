/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * If [this] has fewer than [n] elements, then the resulting [Iterable] will be empty.
 * @description Checks that the returned [Iterable] is empty if [this] has
 * fewer than [n] elements.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string, n) {
  var runes = new Runes(string);
  var res = runes.skip(n);
  Expect.isTrue(res.isEmpty);
}

main() {
  check('',1);
  check('12', 3);
  check('just a string', 100);
}
