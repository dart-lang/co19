/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> skip(int count)
 * If this has fewer than [count] elements, then the resulting [Iterable] will
 * be empty.
 * @description if this has fewer than [count] elements, then the resulting
 * [Iterable] is empty.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List a, int n) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a);
  Iterable it = queue.skip(n);
  Expect.equals(0, it.length);
}

main() {
  check([], 1);
  check([1, 2, -3, 4], 5);
  check([11, 2, -3, 4], 200);
  check([1, 22, -3, 4], 400000);
  check(const[1, 2, -5, -6, 100], 5);
  check(const[1, -1, 2, -5, -6], 5);
  check(const[0, 0, 1, 2, -5, -6], 25);
  check(const[0, 0, 1, 2, -5, -6], 60000);
}