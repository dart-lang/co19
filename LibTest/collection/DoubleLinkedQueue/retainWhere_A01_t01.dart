/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainWhere(bool test(E element))
 * Removes all elements not matched by [test] from the queue.
 * @description Checks that all elements that satisfy test are left, and
 * elements that does not are removed.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0, bool test(var element)) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a0);
  queue.retainWhere(test);
  int k = 0;
  for (int k0 = 0; k0 < a0.length; k0++) {
    if (test(a0[k0])) {
      Expect.identical(a0[k0], queue.elementAt(k), "k0=$k0, k=$k");
      k++;
    }
  }
  Expect.equals(queue.length, k, "queue.length=${queue.length} k=$k");
}

main() {
  List a0 = [1, 3, 3, 4, 5, 6];
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
