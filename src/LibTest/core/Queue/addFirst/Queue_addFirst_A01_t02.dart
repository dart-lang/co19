/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the beginning of the list.
 * @description Checks that method does not affect the content of the list
 * @author msyabro
 */

check(List expected, Queue actual) {
  Expect.equals(expected.length, actual.length);
  int i = 0;
  actual.forEach(void func(var element) {
    Expect.equals(expected[i++], element);
  });
}
 
main() {
  Queue list = new Queue();
  Expect.isTrue(list.length == 0);
  list.addFirst(null);
  check([null], list);
  list.addFirst(0);
  check([0, null], list);
  list.addFirst("1");
  check(["1", 0, null], list);
}
