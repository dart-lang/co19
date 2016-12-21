/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool test(E element))
 * Returns a lazy [Iterable] with all elements that satisfy the predicate [test].
 * @description Checks that the returned [Iterable] contains all elements
 * from [this] that satisfy [test], and all other elements are skipped.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string, bool test (int element)) {
  var runes = new Runes(string);
  var res = runes.where(test);

  var count = 0;

  for(int i = 0 ; i < string.length; ++i) {
    if(test(runes.elementAt(i))) {
      Expect.equals(runes.elementAt(i), res.elementAt(count));
      ++count;
    }
  }
  Expect.equals(count, res.length);
}

main() {
  check('', (e) => true);
  check('a', (e) => false);
  check('\x01\x01\x01\x02\x01\x01', (e) => e == 1 );
  check('\x00\x01\x02\x03\x04\x05', (e) => e < 5 );
  check('\x00\x01\x02\x03\x04\x05', (e) => e > 0 );
  check('\x00\x01\x02\x03\x04\x05', (e) => e != 2 );
}
