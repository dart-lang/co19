/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * If all elements satisfy [test] the resulting iterable is empty.
 * @description Checks that if all elements satisfy the [test] than result
 * [Iterable] is empty.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void check(LinkedList<MyLinkedListEntry<int>> a0, bool test(var element)) {
  bool test2(MyLinkedListEntry<int> entry) => test(entry.value);
  Iterable res = a0.skipWhile(test2);
  Expect.isTrue(res.isEmpty);
}

main() {
  LinkedList<MyLinkedListEntry<int>> a0 = toLinkedList([1, 3, 7, 4, 5, 6]);
  check(a0, (var element) => element > 0);
  check(a0, (var element) => true);
}
