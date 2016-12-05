/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E reduce(E combine(E value, E element))
 * Reduces a collection to a single value by iteratively combining elements of
 * the collection using the provided function.
 * The iterable must have at least one element. If it has only one element, that
 * element is returned.
 * Otherwise this method starts with the first element from the iterator, and
 * then combines it with the remaining elements in iteration order.
 * @description Checks that the result is correct for simple functions.
 * @author kaigorodov
 */

import "dart:collection";
import "dart:math";
import "../../../Utils/expect.dart";

check(List list, combine, num expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.addAll(list);
  num actual = queue.reduce(combine);
  Expect.equals(expected, actual);
}	

main() {
  check([1, 2, -3], (value, element) => value + element, 0);
  check([1, 2, -3], (value, element) => value * element, -6);
  check([0, 2, -3], (value, element) => value * element, 0);
  check(const[1, 2, -5, -6],
      (num value, num element) => max(value, element), 2);
}
