/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int n)
 * The returned Iterable may contain fewer than count elements, if this contains
 * fewer than count elements.
 * @description Checks that an Iterable that contains the first n elements is
 * returned.
 * @author iarkh
 */

import "dart:collection";
import "dart:math" as Math;
import "../../../Utils/expect.dart";

check(List a, int n, int expected) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a);
  Iterable it = queue.take(n);
  Expect.equals(Math.min(queue.length, n), it.length);
  int k = 0;
  for (var el in it) {
    Expect.equals(queue.elementAt(k), el);
    k++;
  }      
}

main() {
  check([1, 2, -3, 4], 6, 4);
  check([], 2, 0);
}
