/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E value), {Object orElse()})
 * Returns the first element that satisfies the given predicate [test].
 * @description Checks that the method returns the first element of the queue.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(List list, bool test(value), int expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  int actual = queue.firstWhere(test);
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 4], (value) => value > 1, 2);
  check(const[1, 2, -5, -6], (value) => value < 0, -5);
}
