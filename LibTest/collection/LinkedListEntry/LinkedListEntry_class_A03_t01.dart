/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class LinkedListEntry<E extends LinkedListEntry
 * An entry can be in at most one linked list at a time. While an entry is in a
 * linked list, the [list] property points to that linked list, and otherwise
 * the [list] property is [null].
 * When created, an entry is not in any linked list.
 * @description Checks that [LinkedListEntry] element can belong to only one
 * linked list at a time.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list1 =
      new LinkedList<MyLinkedListEntry<int>>();
  LinkedList<MyLinkedListEntry> list2 =
      new LinkedList<MyLinkedListEntry<int>>();

  LinkedListEntry entry = new MyLinkedListEntry(1);
  Expect.isNull(entry.list);

  list1.add(entry);
  Expect.throws(() {
    list2.add(entry);
  });
  Expect.throws(() {
    list1.add(entry);
  });
  Expect.equals(list1, entry.list);
  Expect.isTrue(list1.contains(entry));

  list1.remove(entry);
  Expect.isNull(entry.list);
  Expect.isFalse(list1.contains(entry));

  list2.add(entry);
  Expect.throws(() {
    list2.add(entry);
  });
  Expect.throws(() {
    list1.add(entry);
  });
  Expect.equals(list2, entry.list);
  Expect.isTrue(list2.contains(entry));
  Expect.isFalse(list1.contains(entry));
}
