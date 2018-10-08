/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainWhere(bool test(E element))
 * The [test] function must not throw or modify the queue.
 * @description Checks case when test function throws exception
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

bool testThrow(var element) {
  if(element < 8) {
    return true;
  } else {
    throw new Error();
  }
}

main() {
  List list = [1, 5, 3, 4, 9, 5, 6];
  DoubleLinkedQueue queue = new DoubleLinkedQueue.from(list);

  // See issue #27920 for more details. It's unclear from the Specification
  // how result queue should look when exception is thrown.
  Expect.throws(() { queue.retainWhere(testThrow); }, (e) => e is Error);
  Expect.isTrue(queue.length >= 0);
}
