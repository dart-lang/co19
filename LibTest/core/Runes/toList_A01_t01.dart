/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a [List] containing the elements of this [Iterable].
 * The elements will be in iteration order.
 * @description Checks that the returned [List] contains all
 * elements of [this] in the same order.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string, grow, expected) {
  var runes = new Runes(string);
  var res = runes.toList(growable:grow);

  Expect.equals(runes.length, res.length);
  Expect.listEquals(expected, res);
}

main() {
  check('', false, []);
  check('\x00', true, [0]);
  check('word', false, [119, 111, 114, 100]);
  check('just a string', true, [106, 117, 115, 116, 32, 97, 32, 115, 116, 114,
    105, 110, 103]);
}
