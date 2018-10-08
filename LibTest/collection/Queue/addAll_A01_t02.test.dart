/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void addAll(Iterable<E> iterable)
 * Adds all elements of [iterable] at the end of the queue. The length of the
 * queue is extended by the length of iterable.
 * @description Checks that method appends new elements and does not affect 
 * the existing elements of the queue.
 * @author msyabro
 */
library addAll_A01_t02;
 
import "../../../Utils/expect.dart";
import "dart:collection";

check(List expected, Queue actual) {
  Expect.equals(expected.length, actual.length);
  int i = 0;
  actual.forEach((var element) {
    Expect.equals(expected[i++], element);
  });
}
 
test(Queue create([Iterable content])) {
  Queue queue = create();
  Expect.isTrue(queue.length == 0);
  queue.addAll(["1","2","3"]);
  check(["1", "2", "3"], queue);

  queue.addAll([null, 0, false, "0"]);
  check(["1", "2", "3", null, 0, false, "0"], queue);
}
