/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E reduce(E combine(E value, E element))
 * If it has only one element, that element is returned.
 * @description Checks that if there is only one element in the queue, it is
 * returned.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List list, combine, num expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.addAll(list);
  num actual = queue.reduce(combine);
  Expect.equals(expected, actual);
}	

main() {
  check([1], (value, element) => value + element, 1);
  check([8], (value, element) => value * element, 8);
  check([-3], (value, element) => value * element, -3);
}
