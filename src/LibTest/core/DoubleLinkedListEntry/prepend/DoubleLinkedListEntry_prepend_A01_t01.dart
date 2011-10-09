/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Prepends an element to this list entry.
 * @description Check that element is prepended to the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addLast(2);
  list.addLast(3);
  
  DoubleLinkedListEntry e = list.firstEntry();
  e.prepend(1);
  e = e.nextEntry();
  e.prepend(2.5);
  
  Expect.isTrue(list.removeFirst() == 1);
  Expect.isTrue(list.removeFirst() == 2);
  Expect.isTrue(list.removeFirst() == 2.5);
  Expect.isTrue(list.removeFirst() == 3);
}
