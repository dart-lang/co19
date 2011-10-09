/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An entry in a double linked list. An entry boxes an element and has access
 * to the next and previous entry in the list.
 * @description Check that DoubleLinkedListEntry don't depend on the list condition
 * @author msyabro
 * @needsreview Should this test be in DoubleLinkedList/firstEntry?
 */


main() {
  DoubleLinkedList l = new DoubleLinkedList();
  
  DoubleLinkedListEntry e = l.firstEntry();
  Expect.isTrue(e == null);
  
  l.addFirst(1);
  Expect.isTrue(e == null);
}
