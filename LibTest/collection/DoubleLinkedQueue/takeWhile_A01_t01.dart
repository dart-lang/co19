/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Returns a lazy iterable of the leading elements satisfying [test].
 * @description Checks that all first elements that satisfy [test] are retained,
 * and elements after are skipped.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0, bool test(var element)) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a0);
  Iterator it0 = a0.iterator;
  Iterable a = queue.takeWhile(test);
  Iterator it = a.iterator;
  
  // check that the beginning of a0 is identical to a
  bool hasNext0 = it0.moveNext();
  int len = 0;
  for (;;) {
    bool hasNext = it.moveNext();
    if (!hasNext) break;
    Expect.isTrue(test(it0.current));
    Expect.equals(it0.current, it.current);
    len++;
    hasNext0 = it0.moveNext();
  }
  Expect.equals(a.length, len);

  // count the rest
  int skipCount = 0;
  while (hasNext0) {
    skipCount++;
    hasNext0 = it0.moveNext();
  }

  Expect.equals(a0.length, len + skipCount);
}

main() {
  List a0=[1, 3, 7, 4, 5, 6];
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
