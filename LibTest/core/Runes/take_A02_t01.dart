/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * The returned [Iterable] may contain fewer than [n] elements,
 * if [this] contains fewer than [n] elements.
 * @description Checks that the returned [Iterable] contains
 * fewer then [n] elements if [this] contains fewer then [n] elements.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string,n) {
  var runes = new Runes(string);
  var res = runes.take(n);
  Expect.equals(runes.length, res.length);

  for(int i = 0; i < runes.length; ++i) {
    Expect.equals(runes.elementAt(i), res.elementAt(i));
  }
}

main() {
  check('', 100);
  check('a', 5);

  check('string', 11);
  check('string', 1000000);

}
