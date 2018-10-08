/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> takeWhile(bool test(E value))
 * The elements can be computed by stepping through iterator until an element is
 * found where [test(element)] is [false]. At that point, the returned iterable
 * stops (its [moveNext()] returns [false]).
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a, bool test(var element)) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a);
  int last = 0;
  for (var element in queue.takeWhile(test)) {
    Expect.equals(a[last], element);
    Expect.isTrue(test(element));
    last++;
  }
  if (last < a.length) {
    Expect.isFalse(test(a[last]));
  }
}

main() {
  List a0 = [1, 3, 7, 4, 5, 6];
  check(a0, (var element) => element == 1);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4);
  check(a0, (var element) => element < 4);
  check(a0, (var element) => element == 4);
}
