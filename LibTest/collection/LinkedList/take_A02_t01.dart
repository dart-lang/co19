/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * The returned [Iterable] may contain fewer than [count] elements, if this
 * contains fewer than [count] elements.
 * @description Checks that if given linked list contains fewer than [count]
 * elements, returned [Iterable] contains all the elements from the list.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List a0, int n) {
  LinkedList<MyLinkedListEntry<int>> a = toLinkedList(a0);
  Iterable<MyLinkedListEntry<int>> it = a.take(n);
  Expect.equals(a.length, it.length);
  int k = 0;
  for (MyLinkedListEntry<int> entry in it) {
    Expect.equals(a0[k], entry.value);
    k++;
  }      
}

main() {
  check([1, 2, -3, 4], 5);
  check([11, 2, -3, 4], 5);
  check([1, 22, -3, 4], 10);
  check(const[1, 2, -5, -6, 100], 21);
  check(const[1, -1, 2,-5,-6], 14);
  check(const[0, 0, 1, 2, -5, -6], 8);
  check(const[0, 0, 1, 2, -5, -6], 10);
}
