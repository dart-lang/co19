/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T fold <T>(T initialValue, T combine(T previousValue, E element))
 *
 * dynamic fold(initialValue, combine(previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each element
 * of the collection with an existing value using the provided function.
 * Uses [initialValue] as the initial value, then iterates through the elements
 * and updates the value with each element using the [combine] function
 * @description Checks that the result is correct for simple functions.
 * @author kaigorodov
 */

import "dart:collection";
import "dart:math";
import "../../../Utils/expect.dart";

check(List list, num init, combine, num expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  num actual = queue.fold(init, combine);
  Expect.equals(expected, actual);
}	

main() {
  check([1, 2, -3], 0, (num value, element) => value + element, 0);
  check([1, 2, -3], 1, (num value, element) => value * element, -6);
  check([0, 2, -3], 1, (num value, element) => value * element, 0);
  check(const[1, 2, -5, -6], -1000,
      (num value, element) => max(value, element as int), 2);
}
