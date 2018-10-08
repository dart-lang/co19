/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void clear()
 * Remove all elements from this linked list.
 * @description Checks that the length of the list becomes zero.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  Expect.isTrue(a.length == 0);
  a.clear();
  Expect.isTrue(a.length == 0);
  a.add(new MyLinkedListEntry(null));
  Expect.isTrue(a.length == 1);
  a.clear();
  Expect.isTrue(a.length == 0);

  a=toLinkedList([1, 2, 3]);
  Expect.isTrue(a.length == 3);
  a.clear();
  Expect.isTrue(a.length == 0);

  a=toLinkedList(["one", "two", "three", "four"]);
  Expect.isTrue(a.length == 4);
  a.clear();
  Expect.isTrue(a.length == 0);
  a.clear();
  Expect.isTrue(a.length == 0);
}
