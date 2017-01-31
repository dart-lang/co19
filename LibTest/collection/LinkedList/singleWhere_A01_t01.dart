/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E value))
 * Returns the single element that satisfies [test].
 * Checks all elements to see if [test(element)] returns [true]. If exactly one
 * element satisfies [test], that element is returned.
 * @description Checks that the single element that satisfies the given
 * predicate [f] is returned.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List a0, test(value), int expected) {
  LinkedList<MyLinkedListEntry<int>> a = toLinkedList(a0);
  bool test2(MyLinkedListEntry<int> value) =>
    test(value.value);
  int actual = a.singleWhere(test2).value;
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 0], (value) => value > 1, 2);
  check(const[1, 2, -5, -6], (value) => value == 1, 1);
}