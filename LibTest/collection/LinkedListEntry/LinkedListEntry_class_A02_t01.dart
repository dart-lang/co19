/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class LinkedListEntry<E extends LinkedListEntry>
 * The class provides the internal links that link elements together in the
 * LinkedList, and a reference to the linked list itself that an element is
 * currently part of.
 * @description Checks that [LinkedListEntry] elements in the list contain links
 * to the neighbour elements and the list itself.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  MyLinkedListEntry entry1 = new MyLinkedListEntry(1);
  MyLinkedListEntry entry2 = new MyLinkedListEntry(2);
  MyLinkedListEntry entry3 = new MyLinkedListEntry(3);
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  list.add(entry1);
  list.add(entry2);
  list.add(entry3);

  Expect.identical(list, entry1.list);
  Expect.identical(list, entry2.list);
  Expect.identical(list, entry3.list);

  Expect.equals(null, entry1.previous);
  Expect.equals(entry2, entry1.next);

  Expect.equals(entry1, entry2.previous);
  Expect.equals(entry3, entry2.next);

  Expect.equals(entry2, entry3.previous);
  Expect.equals(null, entry3.next);
}
