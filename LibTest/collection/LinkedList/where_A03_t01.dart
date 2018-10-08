/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Iterating will not cache results, and thus iterating multiple times over the
 * returned [Iterable] may invoke the supplied function [test] multiple times on
 * the same element.
 * @description Checks that iterating multiple time over the returned [Iterable]
 * can invoke the [test] function several times.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> list, List expected) {
  bool test(MyLinkedListEntry<int> entry) => test0(entry.value);
  
  Iterator<MyLinkedListEntry<int>> it0 = list.iterator;
  Iterator<MyLinkedListEntry<int>> it = list.where(test).iterator;

  while (it0.moveNext()) {
    if (test(it0.current)) {
      Expect.isTrue(it.moveNext());
      Expect.identical(it0.current, it.current);
    }
  }
  Expect.isFalse(it.moveNext());
}

List res = new List();

bool test0(int element) {
  res.add(element);
  return element > 3;
}

main() {
  MyLinkedListEntry<int> entry1 = new MyLinkedListEntry(1);
  MyLinkedListEntry<int> entry3 = new MyLinkedListEntry(3);
  MyLinkedListEntry<int> entry7 = new MyLinkedListEntry(7);
  MyLinkedListEntry<int> entry4 = new MyLinkedListEntry(4);
  MyLinkedListEntry<int> entry5 = new MyLinkedListEntry(5);
  MyLinkedListEntry<int> entry6 = new MyLinkedListEntry(6);

  LinkedList<MyLinkedListEntry<int>> list =
      new LinkedList<MyLinkedListEntry<int>>();
  list.addAll([entry1, entry3, entry7, entry4, entry5, entry6]);

  check(list, [entry1, entry3, entry7, entry4, entry5, entry6]);
  check(list, [entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6]);
  check(list, [entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6]);
  check(list, [entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6]);
  check(list, [entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6,
               entry1, entry3, entry7, entry4, entry5, entry6]);
}
