/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E element))
 * Returns an [Iterable] that skips elements while [test] is satisfied.
 * @description Checks that all first elements that satisfy test are
 * removed, and elements after that are retained.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string, bool test(int element)) {
  var runes = new Runes(string);
  var it0 = runes.iterator;
  var res = runes.skipWhile(test);
  var it = res.iterator;
  var skipCount = 0;

// skip manually
  var hasNext0;
  while ((hasNext0 = it0.moveNext()) && test(it0.current)) {
    skipCount++;
  }

// check that the rest of a0 is identical to a
  var len = 0;
  for (;;) {
    var hasNext=it.moveNext();
    Expect.equals(hasNext0, hasNext);
    if (!hasNext0) break;
    len++;
    Expect.equals(it0.current, it.current);
    hasNext0 = it0.moveNext();
  }
  Expect.equals(runes.length-skipCount, len);
}

main() {
  var a0='\x01\x03\x07\x04\x05\x06';
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
