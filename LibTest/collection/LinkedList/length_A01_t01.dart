/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * Returns the number of elements in this.
 * @description Checks that the getter returns correct value.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  Expect.isTrue(toLinkedList([]).length == 0);
  Expect.isTrue(new LinkedList<MyLinkedListEntry>().length == 0);
  Expect.isTrue(toLinkedList(new List(0)).length == 0);
  Expect.isTrue(toLinkedList(new List(100)).length == 100);
  Expect.isTrue(toLinkedList([null]).length == 1);
  Expect.isTrue(toLinkedList([null, null]).length == 2);
  Expect.isTrue(toLinkedList(new List.from([0, 1, 2, 3])).length == 4);
  LinkedList<MyLinkedListEntry> b = toLinkedList(const[const [null]]);
  Expect.isTrue(b.length == 1);
}
