/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeWhere(bool test(E element))
 * The [test] function must not throw or modify the queue.
 * @description Checks case when test function clears the queue
 * @author iarkh@unipro.ru
 * @issue 27920
 */

import "dart:collection";
import "../../../Utils/expect.dart";

List list = [1, 3, 3, 4, 5, 6];
DoubleLinkedQueue queue;

bool testClear1(var element) {
  queue.clear();
  return element == 1;
}

bool testClear2(var element) {
  queue.clear();
  return false;
}

bool testClear3(var element) {
  queue.clear();
  return true;
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
  check(testClear1, list, []);
  check(testClear2, list, []);
  check(testClear3, list, []);
}
