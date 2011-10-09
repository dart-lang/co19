/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list.
 * @description Check that [value] is added to the end
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addLast(1);
  Expect.isTrue(list.first() == 1);
  Expect.isTrue(list.last() == 1);
  
  list.addLast(null);
  Expect.isTrue(list.last() == null);
  Expect.isTrue(list.first() == 1);
  
  list.addLast(list);
  Expect.isTrue(list.last() === list);
  Expect.isTrue(list.first() == 1);
}
