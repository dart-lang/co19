/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * Every new [Iterator] of the returned [Iterable] starts iterating over the
 * elements of [this].
 * @description Checks that every new iterator starts iterating over the
 * elements of this.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a0, bool test0(int element)) {
  MyLinkedListEntry<int> el;
  
  bool test(MyLinkedListEntry<int> entry) {
    bool res = test0(entry.value);
    if (res) {
      el = entry;
    }
    return res;
  }
  
  Iterable<MyLinkedListEntry<int>> itbl = a0.takeWhile(test);
  
  for (int k = 0; k < 5; k++) {
    Iterator<MyLinkedListEntry<int>> it = itbl.iterator;
    int i = 0;
    while (it.moveNext()) {
      Expect.equals(a0.elementAt(i), el);
      Expect.equals(el, it.current);
      i++;
    }  
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
