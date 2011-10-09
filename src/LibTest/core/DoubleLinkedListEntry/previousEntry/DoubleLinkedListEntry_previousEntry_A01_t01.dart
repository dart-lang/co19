/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the previous list entry pointed to by this entry.
 * @description Check that list can be iterated with previousEntry().
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  DoubleLinkedListEntry e = list.lastEntry();
  
  Expect.isTrue(e.element == 99);
  for(int i = 98; i >=0 ; i--) {
    e = e.previousEntry();
    Expect.isTrue(e.element == i);
  }
}
