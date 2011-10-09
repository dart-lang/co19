/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a [DoubleLinkedList] that contains all elements of
 * [other].
 * @description Check that list created with all elements from [other]
 * @author msyabro
 */


void check(List l, Collection c) {
  Expect.isTrue(l.length == c.length);
  c.forEach(void compare(var element) {
    Expect.isTrue(l.removeFirst() == element);
  });
}

main() {
  DoubleLinkedList<int> list = new DoubleLinkedList.from([1, 2, 3, 4, 5]);
  check(list, [1, 2, 3, 4, 5]);
  
  Set set = new Set.from([1, 2, 3, 4, 5]);
  list = new DoubleLinkedList.from(set);
  check(list, set);
  
  DoubleLinkedList tmp = new DoubleLinkedList();
  tmp.addLast(1);
  tmp.addLast(2);
  list = new DoubleLinkedList.from(tmp);
  check(list, tmp);
  
  list = new DoubleLinkedList.from(new DoubleLinkedList());
  check(list, []);
  
  list = new DoubleLinkedList.from([]);
  check(list, []);
  
  list = new DoubleLinkedList.from(new Set());
  check(list, []);
}
