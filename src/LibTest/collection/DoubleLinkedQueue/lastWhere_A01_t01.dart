/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E value), {Object orElse()})
 * Returns the last element that satisfies the given predicate test.
 * If none matches, the result of invoking the orElse function is returned.
 * By default, when orElse is null, a StateError is thrown.
 * @description Checks that the method returns the first element of the queue.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(List list, test(value), int expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  int actual=list.lastWhere(test);
  Expect.equals(expected, actual);
}

main() {
  check([1,2,-3,4,0	], (value)=>value>1, 4);
  check(const[1,2,-5,-6], (value)=>value<0, -6);
}
