/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Returns true if the collection contains an element equal to [element].
 * @description Checks that [true] is returned if the collection contains
 * an element equal to [element], [false] otherwise.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  MyLinkedListEntry e1 = new MyLinkedListEntry(1);
  MyLinkedListEntry e2 = new MyLinkedListEntry(2);
  Expect.isFalse(list.contains(e1));
  list.add(e2);
  Expect.isFalse(list.contains(e1));
  list.add(e1);
  Expect.isTrue(list.contains(e1));
  Expect.isTrue(list.contains(e2));
}
