/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns an [Iterable] with at most [n] elements.
 * @description Checks that the returned [Iterable] has
 * the length [n] and contains first [n] elements from [this].
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string, n) {
  var runes = new Runes(string);
  var res = runes.take(n);
  Expect.equals(n, res.length);

  for(int i = 0; i < n; ++i) {
    Expect.equals(runes.elementAt(i), res.elementAt(i));
  }
}

main() {
  check('', 0);
  check('\x01', 0);
  check('\x01', 1);

  check('just a string', 0);
  check('just a string', 1);
  check('just a string', 5);
  check('just a string', 10);

}
