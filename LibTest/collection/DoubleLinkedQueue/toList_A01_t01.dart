/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * Creates a [List] containing the elements of this [Iterable].
 * The elements will be in iteration order.
 * @description Checks that proper list with correct element order is created.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void checkEquals(Iterable expected, List actual) {
  Expect.equals(expected.length, actual.length);
  Iterator it = expected.iterator;
  var i = 0;
  while (it.moveNext()) {
    Object o = it.current;
    Expect.identical(actual[i], o);
    Expect.isTrue(actual[i] == o);
    i++;
  }
}

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  List a = queue.toList();
  Expect.equals(0, a.length);
  Expect.equals(0, queue.length);

  queue.addAll(["1", "2", "3", "4", "5"]);
  a = queue.toList();
  checkEquals(queue, a);

  DoubleLinkedQueue src = new DoubleLinkedQueue.from(
      [null, [null], [], [1,2,3], [[null]]]);
  a = src.toList();
  checkEquals(src, a);
}
