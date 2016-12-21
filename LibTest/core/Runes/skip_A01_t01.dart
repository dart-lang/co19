/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skip(int count)
 * Returns an [Iterable] that skips the first [n] elements.
 * @description Checks that the correct [Iterable] is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string, n) {
  var runes = new Runes(string);
  var res = runes.skip(n);
  Expect.equals(runes.length - n, res.length);

  for(int i = 0; i < res.length; ++i) {
    Expect.equals(runes.elementAt(i+n), res.elementAt(i));
  }
}

main() {
  check('', 0);

  for(int i = 0; i <= 10 ; ++i) {
    check('\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09', i);
  }
}
