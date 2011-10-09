/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the beginning of the list.
 * @description Check that [value] is added to the beginning
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addFirst(1);
  Expect.isTrue(list.first() == 1);
  Expect.isTrue(list.last() == 1);
  
  list.addFirst(null);
  Expect.isTrue(list.first() == null);
  Expect.isTrue(list.last() == 1);
  
  list.addFirst(list);
  Expect.isTrue(list.first() === list);
  Expect.isTrue(list.last() == 1);
}
