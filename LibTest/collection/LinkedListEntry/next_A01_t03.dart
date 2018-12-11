/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E next
 * Return the successor of this element in its linked list.
 * Returns [null] if there is no successor in the linked list, or if this entry
 * is not currently in any list.
 * @description Checks that [null] is returned if there is no successor in the
 * linked list and the next entry otherwise
 * @issue 26522
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry<int>>();
  MyLinkedListEntry<int> entry1 = new MyLinkedListEntry<int>(1);
  list.add(entry1);
  Expect.isNull(entry1.next);

  MyLinkedListEntry<int> entry2 = new MyLinkedListEntry<int>(2);
  list.add(entry2);
  Expect.isNull(entry2.next);
  Expect.identical(entry2, entry1.next);

  MyLinkedListEntry<int> entry3 = new MyLinkedListEntry<int>(3);
  list.add(entry3);
  Expect.isNull(entry3.next);
  Expect.identical(entry2, entry1.next);
  Expect.identical(entry3, entry2.next);

  list.remove(entry2);
  Expect.isNull(entry3.next);
  Expect.isNull(entry2.next);
  Expect.identical(entry3, entry1.next);
}
