/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a new lazy [Iterable] with all elements that satisfy the predicate
 * [test].
 * The matching elements have the same order in the returned iterable as they
 * have in [iterator].
 * This method returns a view of the mapped elements.
 * @description Checks that all elements that satisfy [test] are retained, and
 * elements that do not, are skipped.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(DoubleLinkedQueue queue, bool test(var element)) {
  Iterator it0 = queue.iterator;
  Iterator it = queue.where(test).iterator;

  while (it0.moveNext()) {
    if (test(it0.current)) {
      Expect.isTrue(it.moveNext());
      Expect.equals(it0.current, it.current);
    }
  }
  Expect.isFalse(it.moveNext());
}

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from([1, 3, 7, 4, 5, 6]);
  check(queue, (var element) => element == 1);
  check(queue, (var element) => true);
  check(queue, (var element) => false);
  check(queue, (var element) => element > 4);
  check(queue, (var element) => element < 4);
  check(queue, (var element) => element == 4);
}
