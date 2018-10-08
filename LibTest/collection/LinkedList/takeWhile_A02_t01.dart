/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * The filtering happens lazily.
 * @description Checks that the test method is not called when the [takeWhile]
 * is executed.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

bool test(MyLinkedListEntry<int> entry) {
  Expect.fail("test(${entry.value}) called");
  return false;
}

void check(List a0) {
  LinkedList<MyLinkedListEntry<int>> a = toLinkedList(a0);
  a.takeWhile(test);
}

main() {
  check([]);
  check([1]);
  check([1, 3, 7, 4, 5, 6]);
}
