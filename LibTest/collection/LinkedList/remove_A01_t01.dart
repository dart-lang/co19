/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(E entry)
 * Remove [entry] from the linked list.
 * @description Checks that [remove] removes element from the linked list.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(LinkedList<MyLinkedListEntry> llist,
    MyLinkedListEntry<Object> entry) {
  int length = llist.length;
  List initial = llist.toList();

  llist.remove(entry);
  Expect.equals(length - 1, llist.length);
  Expect.isFalse(llist.contains(entry));
  initial.forEach((var entry) {
    Expect.isTrue(initial.contains(entry));
  });
}

main() {
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  MyLinkedListEntry entry = new MyLinkedListEntry(2);
  a.add(entry);
  check(a, entry);

  a.add(new MyLinkedListEntry(28));
  a.add(new MyLinkedListEntry(2));
  a.add(new MyLinkedListEntry(2));
  a.add(entry);
  a.add(new MyLinkedListEntry(-11));
  a.add(new MyLinkedListEntry(0));
  check(a, entry);

  a.add(entry);
  check(a, entry);
}
