/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E previous
 * Return the predecessor of this element in its linked list.
 * Returns [null] if there is no predecessor in the linked list, or if this
 * entry is not currently in any list.
 * @description Checks that [null] is returned if there is no predecessor in the
 * linked list and the previous entry otherwise
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
  Expect.isNull(entry1.previous);

  MyLinkedListEntry<int> entry2 = new MyLinkedListEntry<int>(2);
  list.add(entry2);
  Expect.isNull(entry1.previous);
  Expect.identical(entry1, entry2.previous);

  MyLinkedListEntry<int> entry3 = new MyLinkedListEntry<int>(3);
  list.add(entry3);
  Expect.isNull(entry1.previous);
  Expect.identical(entry1, entry2.previous);
  Expect.identical(entry2, entry3.previous);

  list.remove(entry2);
  Expect.isNull(entry1.previous);
  Expect.isNull(entry2.previous);
  Expect.identical(entry1, entry3.previous);
}
