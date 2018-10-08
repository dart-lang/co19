/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E removeFirst()
 * Removes and returns the first element of this queue.
 * @description Checks that exactly the first element is removed and returned.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

check(List list) {
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);
  while(queue.length > 0) {
    Expect.equals(queue.removeFirst(), list[0]);
    Expect.equals(queue.length, list.length - 1);
    list.removeAt(0);
    int i = 0;
      queue.forEach((var element) {
      Expect.equals(list[i++], element);
    });
  }
}

main() {
  check([1, "2", true]);
  check([1, 1, 1, 1, 1]);
  check([1, "128", 1, 1, 1]);
  check([1, 1, 1, -7, 1]);
}
