/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Appends an element to this list entry.
 * @description Check that element is appended to the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addLast(1);
  list.addLast(2);
  
  DoubleLinkedListEntry e = list.lastEntry();
  e.append(3);
  e = e.previousEntry();
  e.append(1.5);
  
  Expect.isTrue(list.removeFirst() == 1);
  Expect.isTrue(list.removeFirst() == 1.5);
  Expect.isTrue(list.removeFirst() == 2);
  Expect.isTrue(list.removeFirst() == 3);
}
