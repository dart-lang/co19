/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic fold(initialValue, combine(previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each element
 * of the collection with an existing value.
 * Uses [initialValue] as the initial value, then iterates through the elements
 * and updates the value with each element using the [combine] function.
 * @description Checks that the result is correct for simple functions.
 * @author kaigorodov
 */
import "dart:math";
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List a0, num init, combine, num expected) {
  LinkedList<MyLinkedListEntry> a = toLinkedList(a0);
  num actual = a.fold(init, (previousValue, MyLinkedListEntry entry) =>
      combine(previousValue, entry.value));
  Expect.equals(expected, actual);
}	

main() {
  check([1, 2, -3], 0, (value, element) => value + element, 0);
  check([1, 2, -3], 1, (value, element) => value * element, -6);
  check([0, 2, -3], 1, (value, element) => value * element, 0);
  check(const[1, 2, -5, -6], -1000,
      (num value, num element) => max(value, element), 2);
}
