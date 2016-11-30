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
 * @description Checks that the result of invoking the orElse function is
 * returned when none matches.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class TestException {}

check(List list) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  Expect.throws(() {
      queue.lastWhere((int value) => false, orElse: () {
        throw new TestException();
      });
    },
    (e) => e is TestException
  );
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
  check([1, 2, 3]);
}
