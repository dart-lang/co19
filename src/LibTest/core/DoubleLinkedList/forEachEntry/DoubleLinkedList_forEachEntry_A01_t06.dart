/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterates over all the entries of the list.
 * @description Try to add element to the middle of the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  list.addLast(1);
  list.addLast(2);
  
  list.forEachEntry(void func(DoubleLinkedListEntry entry) {
    if(entry.element == 1) {
      entry.append(3);
    }
  });
  
  Array a = new Array();
  list.forEachEntry(void func(DoubleLinkedListEntry entry) {
    a.push(entry.element);
  });
  
  Expect.isTrue(a.length == 3);
  Expect.isTrue(a[0] == 1 && a[1] == 3 && a[2] == 2);
}
