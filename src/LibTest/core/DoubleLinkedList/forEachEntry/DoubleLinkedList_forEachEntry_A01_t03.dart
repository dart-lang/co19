/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterates over all the entries of the list.
 * @description Try to remove entries from [f]
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  for(int i = 0; i < 10; i++) {
    list.addLast(i);
  }
  
  int count = 0;
  list.forEachEntry(void func(DoubleLinkedListEntry entry) {
    entry.nextEntry().remove();
    count++;
  });
  
  Expect.isTrue(count == 5 && list.length == 5);
}
