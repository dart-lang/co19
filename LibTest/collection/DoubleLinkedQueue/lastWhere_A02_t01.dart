/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E value), {Object orElse()})
 * If no element satisfies [test], the result of invoking the [orElse] function
 * is returned.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class TestException {}

check(List list) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  Expect.throws(() {
      queue.lastWhere((var value) => false, orElse: () {
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
