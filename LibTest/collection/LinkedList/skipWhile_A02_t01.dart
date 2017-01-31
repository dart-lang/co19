/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * The filtering happens lazily.
 * @description Checks that the [test] method is not called when the [skipWhile]
 * is executed.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

bool test(var value) {
  Expect.fail("test($value) called");
  return false;
}

void check(List a0) {
  toLinkedList(a0).skipWhile(test);
}

main() {
  check([]);
  check([1]);
  check([1, 3, 7, 4, 5, 6]);
}
