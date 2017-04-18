/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E first
 * Returns the first element.
 * @description Checks that the first element of the list is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  MyLinkedListEntry head = new MyLinkedListEntry("head");
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  Expect.equals(0, a.length);
  a.add(head);
  Expect.equals(head, a.first);

  a.add(new MyLinkedListEntry(1));
  Expect.equals(head, a.first);
}
