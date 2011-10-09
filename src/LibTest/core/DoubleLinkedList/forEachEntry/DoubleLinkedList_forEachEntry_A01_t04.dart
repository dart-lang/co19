/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterates over all the entries of the list.
 * @description Nested forEachEntry
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  list.addLast(1);
  list.addLast(1);
  
  int count = 0;
  list.forEachEntry(void func(DoubleLinkedListEntry entry) {
    list.forEachEntry(void func(DoubleLinkedListEntry entry) {
      list.forEachEntry(void func(DoubleLinkedListEntry entry) {
        count++;
      });
    });
  });
  
  Expect.isTrue(count == 8);
}
