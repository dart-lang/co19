/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Every new [Iterator] of the returned [Iterable[ iterates over all elements of
 * this.
 * @description Checks that for every new iterator, all elements either are
 * tested and satisfy the test, or are returned by the iterator.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0, bool test0(var element)) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(a0);
  List all;
  bool test(var element) {
    bool res = test0(element);
    if (res) {
      all.add(element);
    }
    return res;
  }
  Iterable itbl=queue.skipWhile(test);
  
  for (int k = 0; k < 5; k++) {
    all = [];
    Iterator it = itbl.iterator;
    while (it.moveNext()) {
      all.add(it.current);
    }  
    Expect.listEquals(a0, all);
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
