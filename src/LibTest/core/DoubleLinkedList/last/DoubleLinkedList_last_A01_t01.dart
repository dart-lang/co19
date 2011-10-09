/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the last element of the list.
 * @description Check that method returns the last 
 * element of the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addFirst(1);
  Expect.isTrue(list.last() == 1);
  
  list.addFirst(2);
  Expect.isTrue(list.last() == 1);
  
  list.addLast(null);
  Expect.isTrue(list.last() == null);
}
