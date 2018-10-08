/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * Reduces a collection to a single value by iteratively combining elements
 * of the collection using the provided function.
 * @description Checks that the result is correct for simple functions.
 * @author kaigorodov
 */
import "dart:math";
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(List<int> a, combine, num expected) {
  LinkedList<MyLinkedListEntry<int>> llist = toLinkedList(a);
  MyLinkedListEntry<int> combine2(
      MyLinkedListEntry<int> value, MyLinkedListEntry<int> element) =>
        new MyLinkedListEntry<int>(combine(value.value, element.value));
  int actual = llist.reduce(combine2).value;
  Expect.equals(expected, actual);
}	

main() {
  check([1, 2, -3], (value, element) => value + element, 0);
  check([1, 2, -3], (value, element) => value * element, -6);
  check([0, 2, -3], (value, element) => value * element, 0);
  check(
      const[1, 2, -5, -6], (num value, num element) => max(value, element), 2);
}
