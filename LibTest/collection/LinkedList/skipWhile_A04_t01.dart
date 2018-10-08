/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * The returned iterable provides elements by iterating this iterable, but
 * skipping over all initial elements where [test(element)] returns [true].
 * @description Checks that once an element does not satisfy the [test],
 * the iterator stops testing and uses every element unconditionally.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a0, bool test0(int element)) {
  bool testPassed = null;
  bool test(MyLinkedListEntry<int> entry) {
    Expect.isTrue(testPassed == null || testPassed,
        "testPassed=$testPassed for element=${entry.value}");
    return testPassed =! test0(entry.value);
  }
  for (MyLinkedListEntry<int> element in a0.skipWhile(test)) {
    Expect.isTrue(testPassed == null || !testPassed);
  }  
}

main() {
  LinkedList<MyLinkedListEntry<int>> a0 = toLinkedList([1, 3, 7, 4, 5, 6, 1]);
  check(a0, (int element) => element == 1);
  check(a0, (int element) => true);
  check(a0, (int element) => false);
  check(a0, (int element) => element > 4);
  check(a0, (int element) => element < 4);
  check(a0, (int element) => element == 4);
}
