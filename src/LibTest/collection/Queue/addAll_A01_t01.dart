/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by list
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all elements of [collection] at the end of the queue. The
 *            length of the queue is extended by the length of [collection].
 * @description Checks that all elements of the [collection] are added to the empty queue.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(List expected, Queue actual) {
  Expect.equals(expected.length, actual.length);
  int i = 0;
  actual.forEach((var element) {
    Expect.equals(expected[i++], element);
  });
}
 
main() {
  Queue queue = new Queue();
  List b = [1, 2, "1", "2", 1, 2, "1", "2"];
  queue.addAll(b);
  check([1, 2, "1", "2", 1, 2, "1", "2"], queue);

  queue = new Queue();
  Set set = new Set.from([1, 2, 3, 4, 5]);
  queue.addAll(set);
  check([1, 2, 3, 4, 5], queue);
  
  queue = new Queue();
  Queue tmp = new Queue();
  tmp.addLast(1);
  tmp.addLast(2);
  queue.addAll(tmp);
  check([1, 2],queue);
  
  queue = new Queue();
  queue.addAll([]);
  check([], queue);
  
  queue = new Queue();
  queue.addAll(new Queue());
  check([], queue);
  
  queue = new Queue();
  queue.addAll(new Set());
  check([], queue);
}
