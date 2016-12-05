/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 *  Checks whether any element of this iterable satisfies [test].
 *  Checks every element in iteration order, and returns [true] if any of them
 *  make test return [true], otherwise returns [false].
 * @description Checks that the method returns true if at least one element
 * of this collection satisfies the predicate test.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  Expect.isFalse(queue.any((e) => false));
  Expect.isFalse(queue.any((e) => true));
  Expect.isFalse(queue.any((e) => e == 1));
  
  queue.addFirst(1);
  Expect.isFalse(queue.any((e) => false));
  Expect.isFalse(queue.any((e) => e == 0));
  Expect.isTrue(queue.any((e) => e == 1));
  
  queue.addFirst(1);
  Expect.isTrue(queue.any((e) => e == 1));
  
  queue.addLast(2);
  Expect.isFalse(queue.any((e) => e == 0));
  Expect.isTrue(queue.any((e) => e == 1));
  Expect.isTrue(queue.any((e) => e == 2));
}
