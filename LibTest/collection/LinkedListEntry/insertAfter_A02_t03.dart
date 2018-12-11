/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void insertAfter(E entry)
 * ...
 * This entry must be in a linked list when this method is called. The [entry]
 * must not be in a linked list.
 * @description Checks that the entry inserted must not be in any linked list
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedListEntry.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list1 =
      new LinkedList<MyLinkedListEntry<int>>();
  LinkedList<MyLinkedListEntry> list2 =
      new LinkedList<MyLinkedListEntry<int>>();
  MyLinkedListEntry<int> entry1 = new MyLinkedListEntry<int>(1);
  MyLinkedListEntry<int> entry2 = new MyLinkedListEntry<int>(2);
  list1.add(entry1);
  list2.add(entry2);
  Expect.throws(() {
    entry1.insertAfter(entry2);
  });
}
