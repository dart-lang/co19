/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements are in iteration order.
 * @description Checks that proper list with correct element order is created.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void checkSameContent(List a0) {
  LinkedList<MyLinkedListEntry> llist = toLinkedList(a0);
  Iterator eit = llist.iterator;
  Iterator ait = llist.toList().iterator;
  while (eit.moveNext()) {
    Expect.isTrue(ait.moveNext());
    Expect.identical(eit.current, ait.current);
  }
  Expect.isFalse(ait.moveNext());
}

main() {
  checkSameContent(["1", "2", "3", "4", "5"]);
  checkSameContent([null, [null], [], [1, 2, 3], [[null]]]);
}
