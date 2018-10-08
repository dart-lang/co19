/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class MyLinkedListEntry<E> extends LinkedListEntry<MyLinkedListEntry<E>> {
  E value;
  MyLinkedListEntry(this.value);
  
  String toString() {
    return "($value)";
  }
}

LinkedList<MyLinkedListEntry<E>> toLinkedList<E>(Iterable entries) {
  var result = new LinkedList<MyLinkedListEntry<E>>();
  entries.forEach((entry) => result.add(new MyLinkedListEntry<E>(entry)));
  return result;
}

void entriesEquals(Iterable<MyLinkedListEntry> expected,
    LinkedList<MyLinkedListEntry> actual) {
  Iterator eit = expected.iterator;
  Iterator ait = actual.iterator;
  while (eit.moveNext()) {
    Expect.isTrue(ait.moveNext());
    Expect.equals(eit.current, ait.current);
  }
  Expect.isFalse(ait.moveNext());
}

void contentEquals(Iterable expected, LinkedList<MyLinkedListEntry> actual) {
  Iterator eit = expected.iterator;
  Iterator ait = actual.iterator;
  while (eit.moveNext()) {
    Expect.isTrue(ait.moveNext());
    Expect.equals(eit.current, ait.current.value);
  }
  Expect.isFalse(ait.moveNext());
}
