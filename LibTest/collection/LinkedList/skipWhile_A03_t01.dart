/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Every new [Iterator] of the returned [Iterable] iterates over all elements of
 * this.
 * @description Checks that for every new iterator, all elements are either
 * tested and satisfy the [test], or returned by the iterator.
 * @author kaigorodov
 */
import "dart:collection";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a0, bool test0(int element)) {
  List<MyLinkedListEntry<int>> all;
  bool test(MyLinkedListEntry<int> entry) {
    bool res = test0(entry.value);
    if (res) {
      all.add(entry);
    };
    return res;
  }

  Iterable<MyLinkedListEntry<int>> itbl = a0.skipWhile(test);
  
  for (int k = 0; k < 5; k++) {
    all = [];
    Iterator<MyLinkedListEntry<int>> it = itbl.iterator;
    while (it.moveNext()) {
      all.add(it.current);
    }
    entriesEquals(all, a0);
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
