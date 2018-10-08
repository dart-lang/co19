/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * This method returns a view of the mapped elements. As long as the returned
 * [Iterable] is not iterated over, the supplied function [test] will not be
 * invoked.
 * @description Checks that the [test] method is not called when [where] is
 * executed.
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
  a.where(test);
}

main() {
  check([]);
  check([1]);
  check([1, 3, 7, 4, 5, 6]);
}
