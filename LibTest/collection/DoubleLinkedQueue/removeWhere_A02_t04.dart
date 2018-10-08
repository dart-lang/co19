/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeWhere(bool test(E element))
 * The [test] function must not throw or modify the queue.
 * @description Checks case when [test] function calls [removeWhere] again
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

List list = [1, 3, 3, 4, 5, 6];
DoubleLinkedQueue queue;

bool test(var element) {
  queue.removeWhere((var element) => element > 5);
  return element == 3;
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
  check(test, list, [1, 4, 5]);
}
