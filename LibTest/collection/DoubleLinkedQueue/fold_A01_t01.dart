/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic fold(initialValue, combine(previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each element
 * of the collection with an existing value using the provided function.
 * Use initialValue as the initial value, and the function combine to create
 * a new value from the previous one and an element.
 * @description Checks that the result is correct for simple functions.
 * @author kaigorodov
 */

import "dart:collection";
import "dart:math";
import "../../../Utils/expect.dart";

check(List list, var init, combine, num expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  num actual = queue.fold(init, combine) as num;
  Expect.equals(expected, actual);
}	

main() {
  check([1,2,-3], 0, (num value, num element) => value + element, 0);
  check([1,2,-3], 1, (num value, num element) => value * element, -6);
  check([0,2,-3], 1, (num value, num element) => value * element, 0);
  check(const[1,2,-5,-6], -1000,
      (num value, num element) => max(value,element), 2);
}
