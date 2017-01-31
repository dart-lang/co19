/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(E entry)
 * Remove [entry] from the linked list.
 * @description Checks that [remove] returns [true] if given element was
 * initially in the list.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  MyLinkedListEntry entry = new MyLinkedListEntry(2);
  list.add(entry);
  Expect.isTrue(list.remove(entry));
  list.add(entry);
  Expect.isTrue(list.remove(entry));

  list.add(new MyLinkedListEntry(28));
  list.add(new MyLinkedListEntry(2));
  list.add(new MyLinkedListEntry(2));
  list.add(entry);
  list.add(new MyLinkedListEntry(-11));
  list.add(new MyLinkedListEntry(0));
  Expect.isTrue(list.remove(entry));

  list.add(entry);
  Expect.isTrue(list.remove(entry));
}
