/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the beginning of the queue.
 * @description Checks that method does not affect other content of the queue
 * @author msyabro
 * @reviewer varlax
 */

check(List expected, Queue actual) {
  Expect.equals(expected.length, actual.length);
  int i = 0;
  actual.forEach(void func(var element) {
    Expect.equals(expected[i++], element);
  });
}
 
main() {
  Queue queue = new Queue();
  Expect.isTrue(queue.length == 0);
  queue.addFirst(null);
  check([null], queue);
  queue.addFirst(0);
  check([0, null], queue);
  queue.addFirst("1");
  check(["1", 0, null], queue);
}
