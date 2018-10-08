/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Returns a lazy iterable of the leading elements satisfying [test].
 * @description Checks that once an element does not satisfy the [test], the
 * iterator stops testing.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a, bool test(int element)) {
  bool test2(MyLinkedListEntry<int> entry) => test(entry.value);

  int last = 0;
  for (MyLinkedListEntry<int> entry in a.takeWhile(test2)) {
    Expect.equals(a.elementAt(last), entry);
    Expect.isTrue(test(entry.value));
    last++;
  }
  if (last < a.length) {
    Expect.isFalse(test(a.elementAt(last).value));
  }
}

main() {
  LinkedList<MyLinkedListEntry<int>> a0=toLinkedList([1, 3, 7, 4, 5, 6, 1]);
  check(a0, (int element) => element == 1);
  check(a0, (int element) => true);
  check(a0, (int element) => false);
  check(a0, (int element) => element > 4);
  check(a0, (int element) => element < 4);
  check(a0, (int element) => element == 4);
}
