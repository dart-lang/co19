/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedList<E> list
 * Get the linked list containing this element.
 * Returns [null] if this entry is not currently in any list.
 * @description Checks that the the linked list containing this element
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  MyLinkedListEntry<int> entry = new MyLinkedListEntry<int>(1);
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry<int>>();
  list.add(entry);

  Expect.identical(list, entry.list);
}
