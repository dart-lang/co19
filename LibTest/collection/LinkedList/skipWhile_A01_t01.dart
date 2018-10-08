/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Returns an [Iterable] that skips leading elements while [test] is satisfied.
 * ...
 * It iterates the remaining elements in their original order, starting with the
 * first element for which [test(element)] returns [false].
 * @description Checks that all first elements which satisfy [test] are removed,
 * and elements after that are retained.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a0, bool test(var element)) {
  bool test2(MyLinkedListEntry<int> entry) => test(entry.value);
  
  Iterator<MyLinkedListEntry<int>> it0 = a0.iterator;
  Iterator<MyLinkedListEntry<int>> it = a0.skipWhile(test2).iterator;
  int skipCount = 0;
  
  // skip manually
  bool hasNext0;
  while ((hasNext0 = it0.moveNext()) && test2(it0.current)) {
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

main() {
  LinkedList<MyLinkedListEntry<int>> a0 = toLinkedList([1, 3, 7, 4, 5, 6]);
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
