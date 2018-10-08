/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E element))
 * Returns an [Iterable] that stops once [test] is not satisfied anymore.
 * @description Checks that all first elements that satisfy test are
 * retained, and elements after that are skipped.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

void check(string, bool test(int element)) {
  var runes = new Runes(string);
  var it0 = runes.iterator;
  var res = runes.takeWhile(test);
  var it = res.iterator;
  var skipCount = 0;

// check that the beginning of a0 is identical to a
  var hasNext0 = it0.moveNext();
  var len = 0;
  for (;;) {
    bool hasNext = it.moveNext();
    if (!hasNext) break;
    Expect.isTrue(test(it0.current));
    Expect.equals(it0.current, it.current);
    len++;
    hasNext0 = it0.moveNext();
  }
  Expect.equals(len, res.length);

// count the rest
  while (hasNext0) {
    skipCount++;
    hasNext0 = it0.moveNext();
  }

  Expect.equals(runes.length, len+skipCount);
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
