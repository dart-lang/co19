/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Returns an Iterable that skips elements while test is satisfied.
 * @description Checks that all first elements that satisfy test are skipped,
 * and elements after then are iterated.
 * @author kaigorodov
 */
library skipWhile_A01_t01;
import "../../../Utils/expect.dart"	;

void check(Iterable a0, bool f(var element)) {
  Iterator it0 = a0.iterator;
  Iterable a = a0.skipWhile(f);
  Iterator it = a.iterator;
  int skipCount = 0;
  
  // skip manually
  bool hasNext0;
  while ((hasNext0 = it0.moveNext()) && f(it0.current)) {
    skipCount++;
  }

  // check that the rest of a0 is identical to a
  int len = 0;
  for (;;) {
    bool hasNext = it.moveNext();
    Expect.equals(hasNext0, hasNext);
    if (!hasNext0) break;
    len++;
    Expect.equals(it0.current, it.current);
    hasNext0 = it0.moveNext();
  }
  Expect.equals(a0.length - skipCount, len);
}

test(Iterable create([Iterable content])) {
  Iterable a0 = create([1, 3, 7, 4, 5, 6]);
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
