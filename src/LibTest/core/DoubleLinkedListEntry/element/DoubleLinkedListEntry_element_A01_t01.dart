/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The element that this entry boxes.
 * @description Check that element is correct
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  int current = 0;
  list.forEachEntry(void func(DoubleLinkedListEntry entry) {
    Expect.isTrue(entry.element == current++);
  });
}
