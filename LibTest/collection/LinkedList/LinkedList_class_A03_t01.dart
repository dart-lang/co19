/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class LinkedList<E extends LinkedListEntry>
 * Because the elements themselves contain the links of this linked list, each
 * element can be in only one list at a time. To add an element to another list,
 * it must first be removed from its current list (if any).
 * @description Checks that [LinkedListEntry] element cannot be in several lists
 * at a time.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list1 = new LinkedList<MyLinkedListEntry<int>>();
  LinkedList<MyLinkedListEntry> list2 = new LinkedList<MyLinkedListEntry<int>>();

  LinkedListEntry entry = new MyLinkedListEntry(1);
  list1.add(entry);

  Expect.throws(() { list2.add(entry); });
  Expect.throws(() { list1.add(entry); });

  list1.remove(entry);
  list2.add(entry);

  Expect.throws(() { list2.add(entry); });
  Expect.throws(() { list1.add(entry); });
}
