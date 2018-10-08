/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * The filtering happens lazily.
 * @description Checks that the test method is not called when the [skipWhile]
 * is executed.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

DoubleLinkedQueue fromList(List list) {
  return new DoubleLinkedQueue.from(list);
}

bool test(var value) {
  Expect.fail("test($value) called");
  return true;
}

main() {
  fromList([]).takeWhile(test);
  fromList([1]).takeWhile(test);
  fromList([1, 3, 7, 4, 5, 6]).takeWhile(test);
}
