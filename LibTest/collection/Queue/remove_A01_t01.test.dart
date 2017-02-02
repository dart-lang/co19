/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract bool remove(Object value)
 * Remove a single instance of [value] from the queue.
 * @description Checks that value is removed and queue is still in correct
 * iteration order.
 * @author iarkh@unipro.ru
 */
library remove_A01_t01;
import "dart:collection";
import "../../../Utils/expect.dart";

test(Queue create([Iterable content])) {

  check(List a, Object value, List expected) {
    Queue queue = create(a);
    queue.remove(value);

    Expect.listEquals(expected, queue.toList());
  }

  check([], 1, []);
  check([1], 1, []);
  check([], true, []);
  check([null], 2, [null]);
  check([null, null, null], null, [null, null]);
  check([1, 2, 3, 4, 5, null, 2], 2, [1, 3, 4, 5, null, 2]);
  check([1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5], 3,
      [1, 2, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]);
}
