/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the last entry in the list, or null if the list has no entry.
 * @description Check that last entry is returned
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  Expect.isTrue(list.lastEntry() == null);
  
  list.addLast(1);
  Expect.isTrue(list.lastEntry().element == 1);
  
  list.addFirst(2);
  Expect.isTrue(list.lastEntry().element == 1);
  
  list.addLast(3);
  Expect.isTrue(list.lastEntry().element == 3);
}
