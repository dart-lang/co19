/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addFirst(E entry)
 * Add [entry] to the beginning of the list.
 * @description Checks that method does not affect other content of the list
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  Expect.isTrue(list.length == 0);
  list.addFirst(new MyLinkedListEntry(null));
  contentEquals([null], list);
  list.addFirst(new MyLinkedListEntry(0));
  contentEquals([0, null], list);
  list.addFirst(new MyLinkedListEntry("1"));
  contentEquals(["1", 0, null], list);
}
