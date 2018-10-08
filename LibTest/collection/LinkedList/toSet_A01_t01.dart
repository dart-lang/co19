/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * Creates a [Set] containing containing the same elements as this iterable.
 * @description Checks that the result [Set] contains all the elements of this
 * [Iterable].
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(List a0) {
  LinkedList<MyLinkedListEntry> llist = toLinkedList(a0);
  Set<MyLinkedListEntry> set = llist.toSet();

  for (MyLinkedListEntry entry in llist) {
    Expect.isTrue(set.contains(entry));
  }
}

main() {
  check([]);
  check(["1", "2", "3", "4", "5"]);
  check([null, [null], [], [1, 2, 3], [[null]]]);
}
