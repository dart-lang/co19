/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract bool remove(Object value)
 * Returns [true] if a [value] was removed, or [false] if the queue contains no
 * element equal to [value].
 * @description Checks that the method returns [true] if a value was removed,
 * or [false] if the queue contains no element equal to value.
 * @author kaigorodov
 */
library remove_A01_t01;
import "dart:collection";
import "../../../Utils/expect.dart";

test(Queue create([Iterable content])) {

  check(Iterable a, Object value) {
    Queue queue = create(a);
    bool r = queue.remove(value);
    Expect.equals(a.contains(value), r);
  }

  check([], 1);
  check([1], 1);
  check([], true);
  check([null], 2);
  check([null, null, null], true);
  check([1, 2, 3, 4, 5, null, 2], 2);
}
