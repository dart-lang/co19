/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns [false] if any of them
 * make [test] return [false], otherwise returns [true].
 * @description Check that [true] is returned only if every element of the list
 * satisfies the predicate [f].
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> a =
      toLinkedList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  Expect.isTrue(a.every((MyLinkedListEntry e) {
    return (e.value >= 0 && e.value < 10);
  } ));
  Expect.isFalse(a.every((MyLinkedListEntry e) { return (e.value < 0); } ));

  a = toLinkedList([[], [null], [1, 2, 3, 4], ["string"]]);
  Expect.isTrue(a.every((MyLinkedListEntry e) { return (e.value is List); } ));
  Expect.isFalse(a.every((MyLinkedListEntry e) { return (e.value is Set); } ));
}
