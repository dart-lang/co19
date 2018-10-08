/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where [test(element)] returns [true]. If
 * all elements satisfy [test] the resulting iterable is empty, otherwise it
 * iterates the remaining elements in their original order, starting with the
 * first element for which [test(element)] returns [false].
 * @description Checks that once an element does not satisfy the [test],
 * the iterator stops testing and uses every element unconditionally.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0, bool test0(var element)) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a0);
  bool testPassed = null;
  bool test(var element) {
    Expect.isTrue(testPassed == null || testPassed,
        "testPassed=$testPassed for element=$element");
    return testPassed =! test0(element);
  }
  for (var element in queue.skipWhile(test)) {
    Expect.isTrue(testPassed == null || !testPassed);
  }  
}

main() {
  List a0 = [1, 3, 7, 4, 5, 6];
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
