/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where test(element) returns true. ... it
 * iterates the remaining elements in their original order, starting with the
 * first element for which test(element) returns false.
 * @description Checks that once an element does not satisfy the test,
 * the iterator stops testing and uses every element unconditionally.
 * @author kaigorodov
 */
library skipWhile_A04_t01;
import "../../../Utils/expect.dart"	;

void check(Iterable a0, bool test0(var element)) {
  bool testPassed = null;
  bool tst(var element) {
    Expect.isTrue(testPassed == null || testPassed,
        "testPassed=$testPassed for element=$element");
    return testPassed = !test0(element);
  }
  for (var element in a0.skipWhile(tst)) {
    Expect.isTrue(testPassed == null || !testPassed);
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
