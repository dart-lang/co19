/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * The elements can be computed by stepping through iterator until an element is
 * found where test(element) is false. At that point, the returned iterable
 * stops (its moveNext() returns false).
 * @description Checks that once an element does not satisfy the test found,
 * the iterator stops testing.
 * @author kaigorodov
 */
library takeWhile_A04_t01;
import "../../../Utils/expect.dart"	;

void check(Iterable a, bool tst(var element)) {
  int last = 0;
  for (var element in a.takeWhile(tst)) {
    Expect.equals(a.elementAt(last), element);
    Expect.isTrue(tst(element));
    last++;
  }
  if (last < a.length) {
    Expect.isFalse(tst(a.elementAt(last)));
  }
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
