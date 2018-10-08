/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * If it has only one element, that element is returned.
 * @description Checks that the result is correct for simple functions.
 * @author iarkh
 */
import "dart:math";
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(List<int> list, combine, num expected) {
  LinkedList<MyLinkedListEntry<int>> list1 = toLinkedList(list);
  MyLinkedListEntry<int> combine2(
      MyLinkedListEntry<int> value, MyLinkedListEntry<int> element) =>
        new MyLinkedListEntry<int>(combine(value.value, element.value));
  int actual = list1.reduce(combine2).value;
  Expect.equals(expected, actual);
}	

main() {
  check([1], (value, element) => value + element, 1);
  check([29], (value, element) => value * element, 29);
  check([0], (value, element) => 14, 0);
  check([5], (value, element) => -3, 5);
  check(const[-7], (num value, num element) => max(value, element), -7);
}
