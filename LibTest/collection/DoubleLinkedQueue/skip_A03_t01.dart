/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> skip(int count)
 * The [count] must not be negative.
 * @description Checks that a [RangeError] is thrown if [count] is negative.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List a, int n) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a);
  Expect.throws(() { queue.skip(n); }, (e) => e is RangeError);
}

main() {
  check([1, 2, -3, 4], -1);
  check(const[1, 2, -5,-6, 100], -1);
  check(const[null , 2, -5, -6, 100], -1000);
}
