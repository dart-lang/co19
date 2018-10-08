/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(E entry)
 * Add [entry] to the end of the list.
 * @description Checks extendable lists, that [value] is added to the end of the
 * list and the length is extended by one.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  for (var i = 0; i <= 314; i++) {
    a.add(new MyLinkedListEntry(i));
    Expect.equals(i, a.elementAt(i).value);
    Expect.equals(i + 1, a.length);
  }

  LinkedList<MyLinkedListEntry<int>> b = toLinkedList(const<int>[]);
  b.add(new MyLinkedListEntry(null));
  Expect.isNull(b.first.value);
  for (var i = 1; i <= 3142; i++) {
    b.add(new MyLinkedListEntry(i));
    Expect.equals(i, b.elementAt(i).value);
    Expect.equals(i + 1, b.length);
  }
}
