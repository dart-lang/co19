/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by list
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Iterable<E> iterable)
 * Adds all elements of [collection] at the end of the queue.
 * The length of the queue is extended by the length of [iterable].
 * @description Checks that all elements of the [iterable] are added to the
 * empty queue.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(List expected, DoubleLinkedQueue actual) {
  Expect.equals(expected.length, actual.length);
  int i = 0;
  actual.forEach((var element) {
    Expect.equals(expected[i++], element);
  });
}
 
main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  List b = [1, 2, "1", "2", 1, 2, "1", "2"];
  queue.addAll(b);
  check([1, 2, "1", "2", 1, 2, "1", "2"], queue);

  queue = new DoubleLinkedQueue();
  Set set = new Set.from([1, 2, 3, 4, 5]);
  queue.addAll(set);
  check([1, 2, 3, 4, 5], queue);
  
  queue = new DoubleLinkedQueue();
  DoubleLinkedQueue tmp = new DoubleLinkedQueue();
  tmp.addLast(1);
  tmp.addLast(2);
  queue.addAll(tmp);
  check([1, 2], queue);
  
  queue = new DoubleLinkedQueue();
  queue.addAll([]);
  check([], queue);
  
  queue = new DoubleLinkedQueue();
  queue.addAll(new DoubleLinkedQueue());
  check([], queue);
  
  queue = new DoubleLinkedQueue();
  queue.addAll(new Set());
  check([], queue);
}
