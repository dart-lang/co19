/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Returns a lazy iterable of the leading elements satisfying [test].
 * @description Checks that all first elements that satisfy [test] are retained,
 * and elements after that are skipped.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a0, bool test(int element)) {
  bool test2(MyLinkedListEntry<int> entry) => test(entry.value);
  
  Iterator<MyLinkedListEntry<int>> it0 = a0.iterator;
  Iterable<MyLinkedListEntry<int>> a = a0.takeWhile(test2);
  Iterator<MyLinkedListEntry<int>> it = a.iterator;
  
  // check that the beginning of a0 is identical to a
  bool hasNext0 = it0.moveNext();
  int len = 0;
  while (it.moveNext()) {
    Expect.isTrue(test2(it0.current));
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
  LinkedList<MyLinkedListEntry<int>> a0 = toLinkedList([1, 3, 7, 4, 5, 6, 1]);
  check(a0, (int element) => element == 1);
  check(a0, (int element) => true);
  check(a0, (int element) => false);
  check(a0, (int element) => element > 4);
  check(a0, (int element) => element < 4);
  check(a0, (int element) => element == 4);
}
