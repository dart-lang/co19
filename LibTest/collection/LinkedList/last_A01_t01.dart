/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * Returns the last element.
 * @description Checks that the last element of the list is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  Expect.equals(0, a.length);
  a.add(new MyLinkedListEntry(null));
  Expect.equals(null, a.last.value);

  a.add(new MyLinkedListEntry(1));
  Expect.equals(1, a.last.value);

  a.add(new MyLinkedListEntry("1"));
  Expect.equals("1", a.last.value);

  a.add(new MyLinkedListEntry(false));
  Expect.equals(false, a.last.value);
 
  a = toLinkedList([null, 0, "0", false, -1]);
  Expect.equals(-1, a.last.value);

  a = toLinkedList(const [null, 0, "0", false]);
  Expect.equals(false, a.last.value);
}
