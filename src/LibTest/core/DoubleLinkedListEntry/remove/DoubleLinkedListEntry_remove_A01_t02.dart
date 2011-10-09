/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the entry from its list.
 * @description Check that entry itself is not deleted
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  list.addLast(1);
  list.addLast(2);
  
  DoubleLinkedListEntry e = list.firstEntry();
  e.remove();
  
  Expect.isTrue(list.first() == 2);
  Expect.isTrue(e.element == 1);
}
