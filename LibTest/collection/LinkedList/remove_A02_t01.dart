/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(E entry)
 * Returns [false] and does nothing if [entry] is not in this linked list.
 * @description Checks that [false] is returned if [entry] is not in the list.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  MyLinkedListEntry entry = new MyLinkedListEntry(2);

  Expect.isFalse(list.remove(entry));

  list.add(entry);
  list.remove(entry);
  Expect.isFalse(list.remove(entry));

  list.add(entry);
  list.remove(entry);
  Expect.isFalse(list.remove(entry));

  list.add(new MyLinkedListEntry(28));
  list.add(new MyLinkedListEntry(2));
  list.add(new MyLinkedListEntry(2));
  Expect.isFalse(list.remove(entry));
  list.add(entry);
  list.add(new MyLinkedListEntry(-11));
  list.add(new MyLinkedListEntry(0));
  list.remove(entry);
  Expect.isFalse(list.remove(entry));

  list.add(entry);
  list.remove(entry);
  Expect.isFalse(list.remove(entry));

  list.clear();
  Expect.isFalse(list.remove(entry));
}
