/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a [Set] containing the elements of this [Iterable].
 * @description Checks that the returned [Set] contains all
 * elements of [this].
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string, uniqueNum) {
  var runes = new Runes(string);
  var res = runes.toSet();

  Expect.equals(uniqueNum, res.length);
  for(int i = 0; i < runes.length; ++i) {
    Expect.isTrue(res.contains(runes.elementAt(i)));
  }
}

main() {
  check('', 0);
  check('a', 1);
  check('aaaaaa', 1);
  check('aaaaaaaaaabbbbbbbbbcccccccccddddddddeeeeeeeeefffffffffgggggggggg' +
      'hhhhhhhhhhiiiiiiiiiijjjjjjjjjj', 10);
}
