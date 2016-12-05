/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(Object o)
 * Returns [true] if a [value] was removed, or [false] if the queue contained no
 * element equal to [value].
 * @description Checks that true is returned id some element was actually
 * removed from the queue.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List list, Object value, bool expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);

  var l1 = list.length;
  bool r = queue.remove(value);
  if (r) {
    Expect.isTrue(expected);
    Expect.equals(l1 > 0 ? l1 - 1 : l1, queue.length);
    for (int i = 0; i < queue.length; i++);
  } else {
    Expect.isFalse(expected);
    Expect.equals(l1, queue.length);
  }
}

main() {
  check([], 1, false);
  check([1], 1, true);
  check(new List.from([]), true, false);
  check(new List(), 2, false);
  check(new  List.from([2]), 2, true);
  check(new  List.from([2, 2, 2]), 2, true);
}
