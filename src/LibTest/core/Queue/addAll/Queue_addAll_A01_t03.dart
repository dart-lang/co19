/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all elements of [collection] at the end of the list. The
 *            length of the list is extended by the length of [collection].
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
  list.addAll(["1","2","3"]);
  check(["1", "2", "3"], list);

  list.addAll([null,0, false, "0"]);
  check(["1", "2", "3", null, 0, false, "0"], list);
}
