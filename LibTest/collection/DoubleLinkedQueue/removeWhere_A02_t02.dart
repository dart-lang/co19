/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeWhere(bool test(E element))
 * The [test] function must not throw or modify the queue.
 * @description Checks case when test function removes some element from the
 * queue
 * @author iarkh@unipro.ru
 * @issue 27920
 */

import "dart:collection";
import "../../../Utils/expect.dart";

DoubleLinkedQueue queue;

bool testRemoveFirst1(var element) {
  queue.removeFirst();
  return false;
}

bool testRemoveFirst2(var element) {
  queue.removeFirst();
  return true;
}

bool testRemove(var element) {
  queue.remove(4);
  return element >= 3;
}

bool testRemove1(var element) {
  queue.remove(1);
  return element > 3;
}

bool testRemoveUnexistent(var element) {
  queue.remove(18);
  return element <= 4;
}

check(bool test(var element), List list, List expected) {
  queue = new DoubleLinkedQueue.from(list);
  queue.removeWhere(test);
  Expect.equals(expected.length, queue.length);
  int i = 0;
  queue.forEach((var element) {
    Expect.equals(expected[i++], element);
  });
}

main() {
  List list = [1, 3, 3, 4, 6, 5];

  check(testRemove, list, [1]);
  check(testRemove1, list, [3, 3]);
  check(testRemoveUnexistent, list, [6, 5]);
  check(testRemoveFirst1, list, []);
  check(testRemoveFirst2, list, []);
}
