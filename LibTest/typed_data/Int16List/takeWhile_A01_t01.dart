/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Returns a lazy iterable of the leading elements satisfying test.
 * @description Checks that all first elements that satisfy test are
 * retained, and elements after that are skipped.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> list, bool test(int element)) {
  var l = new Int16List.fromList(list);
  var it0 = l.iterator;
  var res = l.takeWhile(test);
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

  Expect.equals(l.length, len + skipCount);
}

main() {
  var a0 = [1, 3, 7, 4, 5, 6];
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
