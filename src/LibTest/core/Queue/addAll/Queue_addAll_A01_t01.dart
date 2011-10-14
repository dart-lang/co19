/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by list
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all elements of [collection] at the end of the list. The
 *            length of the list is extended by the length of [collection].
 * @description Checks that all elements of the [collection] are added to the end of the list.
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
  List b = [1, 2, "1", "2", 1, 2, "1", "2"];
  list.addAll(b);
  check([1, 2, "1", "2", 1, 2, "1", "2"], list);

  list = new Queue();
  Set set = new Set.from([1, 2, 3, 4, 5]);
  list.addAll(set);
  check([1, 2, 3, 4, 5], list);
  
  list = new Queue();
  Queue tmp = new Queue();
  tmp.addLast(1);
  tmp.addLast(2);
  list.addAll(tmp);
  check([1, 2],list);
  
  list = new Queue();
  list.addAll([]);
  check([], list);
  
  list = new Queue();
  list.addAll(new Queue());
  check([], list);
  
  list = new Queue();
  list.addAll(new Set());
  check([], list);
}
