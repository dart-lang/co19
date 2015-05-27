/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate test.
 * This method returns a view of the mapped elements.
 * As long as the returned Iterable is not iterated over, the supplied function
 * test will not be invoked.
 * Iterating will not cache results, and thus iterating multiple times over the
 * returned Iterable will invoke the supplied function test multiple times
 * on the same element.

 * @description Checks that all first elements that satisfy [test] are retained, and
 * elements that do not, are skipped.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(DoubleLinkedQueue queue, bool test(var element)) {
  Iterator it0=queue.iterator;
  Iterator it=queue.where(test).iterator;
  
  while (it0.moveNext()) {
    if (test(it0.current)) {
      Expect.isTrue(it.moveNext());
      Expect.equals(it0.current, it.current);
    }
  }
  Expect.isFalse(it.moveNext());
}

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from([1,3,7,4,5,6]);
  check(queue, (var element)=>element==1);
  check(queue, (var element)=>true);
  check(queue, (var element)=>false);
  check(queue, (var element)=>element>4);
  check(queue, (var element)=>element<4);
  check(queue, (var element)=>element==4);
}
