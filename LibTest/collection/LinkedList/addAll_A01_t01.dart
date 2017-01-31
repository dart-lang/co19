/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Iterable<E> entries)
 * Add [entries] to the end of the list.
 * @description Checks that all elements of the [collection] are added to the
 * end of list.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

const sz = 1000;

main() {
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  a.addAll(
      new Iterable.generate(sz, (int index) => new MyLinkedListEntry(index)));
  Iterator<MyLinkedListEntry> ita = a.iterator;
  for (var i = 0; i < sz; i++){
    Expect.isTrue(ita.moveNext());
    Expect.equals(i, ita.current.value);
  }
  Expect.isFalse(ita.moveNext());
  
  a = new LinkedList<MyLinkedListEntry>();
  Set<MyLinkedListEntry> set = new Set<MyLinkedListEntry>();
  set.addAll(
      [1, 2, 3, 4, 5].map((var element) => new MyLinkedListEntry(element)));
  a.addAll(set);
  contentEquals(set.map((MyLinkedListEntry entry) => entry.value), a);
  
  a = new LinkedList<MyLinkedListEntry>();
  Queue<MyLinkedListEntry> list = new Queue<MyLinkedListEntry>();
  list.addLast(new MyLinkedListEntry(1));
  list.addLast(new MyLinkedListEntry(2));
  a.addAll(list);
  contentEquals([1, 2], a);
  
  a = new LinkedList<MyLinkedListEntry>();
  a.addAll([]);
  contentEquals([], a);
  
  a = new LinkedList<MyLinkedListEntry>();
  a.addAll(new Queue());
  contentEquals([], a);
  
  a = new LinkedList<MyLinkedListEntry>();
  a.addAll(new Set());
  contentEquals([], a);
}
