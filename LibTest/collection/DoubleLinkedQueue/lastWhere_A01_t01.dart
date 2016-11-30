/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E value), {Object orElse()})
 * Returns the last element that satisfies the given predicate test.
 * An iterable that can access its elements directly may check its elements in
 * any order (for example a list starts by checking the last element and then
 * moves towards the start of the list). The default implementation iterates
 * elements in iteration order, checks test(element) for each, and finally
 * returns that last one that matched.
 * If no element satisfies test, the result of invoking the orElse function is
 * returned. If orElse is omitted, it defaults to throwing a StateError.
 * @description Checks that the method returns the last element of the queue.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(List list, bool test(value), int expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  int actual = queue.lastWhere(test);
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 4, 0], (value) => value > 1, 4);
  check(const[1, 2, -5, -6], (value) => value < 0, -6);
}
