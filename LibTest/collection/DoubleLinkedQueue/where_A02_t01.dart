/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * As long as the returned [Iterable] is not iterated over, the supplied
 * function [test] will not be invoked.
 * @description Checks that filtering happens lazily.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

bool test(var value) {
  Expect.fail("test($value) called");
  return true;
}

main() {
  new DoubleLinkedQueue.from([1, 2, -3, 4]).where(test);
  new DoubleLinkedQueue.from([]).where(test);
  new DoubleLinkedQueue.from(const[null, 2, -5, -6, 100]).where(test);
}

