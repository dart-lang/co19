/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E singleWhere(bool test(E value))
 * Returns the single element that satisfies [test].
 * Checks all elements to see if [test(element)] returns [true].
 * @description Checks that the single element that satisfies the given
 * predicate [test]
 * is returned.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List a, bool test(value), int expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a);
  int actual = queue.singleWhere(test) as int;
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 0], (value) => value > 1, 2);
  check(const[1, 2, -5, -6], (value) => value == 1, 1);
}
