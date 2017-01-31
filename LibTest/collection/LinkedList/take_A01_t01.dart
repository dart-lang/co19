/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * Returns a lazy iterable of the [count] first elements of this iterable.
 * @description Checks that an [Iterable] that contains the first [count]
 * elements is returned.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List a0, int n) {
  LinkedList<MyLinkedListEntry<int>> a = toLinkedList(a0);
  Iterable<MyLinkedListEntry<int>> it = a.take(n);
  Expect.equals(n, it.length);
  int k = 0;
  for (MyLinkedListEntry<int> entry in it) {
    Expect.equals(a0[k], entry.value);
    k++;
  }      
}

main() {
  check([1, 2, -3, 4], 4);
  check([1, 2, -3, 4], 0);
  check([11, 2, -3, 4], 2);
  check([1, 22, -3, 4], 4);
  check(const[1, 2, -5, -6, 100], 0);
  check(const[1, -1, 2,-5,-6], 1);
  check(const[0, 0, 1, 2, -5, -6], 2);
  check(const[0, 0, 1, 2, -5, -6], 6);
}
