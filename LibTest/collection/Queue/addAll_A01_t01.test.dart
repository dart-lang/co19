/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by list
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  void addAll(Iterable<E> iterable)
 * Adds all elements of [iterable] at the end of the queue. The length of the
 * queue is extended by the length of iterable.
 * @description Checks that all elements of the [collection] are added to the
 * empty queue.
 * @author msyabro
 */
library addAll_A01_t01;
 
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

  List b = [1, 2, "1", "2", 1, 2, "1", "2"];
  queue.addAll(b);
  check([1, 2, "1", "2", 1, 2, "1", "2"], queue);

  queue = create();
  Set set = new Set.from([1, 2, 3, 4, 5]);
  queue.addAll(set);
  check([1, 2, 3, 4, 5], queue);
  
  queue = create();
  Queue tmp = create();
  tmp.addLast(1);
  tmp.addLast(2);
  queue.addAll(tmp);
  check([1, 2],queue);
  
  queue = create();
  queue.addAll([]);
  check([], queue);
  
  queue = create();
  queue.addAll(new Queue());
  check([], queue);
  
  queue = create();
  queue.addAll(new Set());
  check([], queue);
}
