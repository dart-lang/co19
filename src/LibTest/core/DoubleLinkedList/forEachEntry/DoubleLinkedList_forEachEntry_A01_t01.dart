/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterates over all the entries of the list.
 * @description Check that method iterates over all entries
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  Array a = new Array(100);
  list.forEachEntry(void func(DoubleLinkedListEntry entry) {
    a[entry.element] = entry.element;
  });
  
  for(int i = 0; i < 100; i++) {
    Expect.isTrue(a[i] == i);
  }
}
