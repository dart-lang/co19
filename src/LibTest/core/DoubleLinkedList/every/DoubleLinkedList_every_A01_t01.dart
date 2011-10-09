/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisify the
 * predicate [f]. Returns false otherwise.
 * @description Check that every() iterates over each element of the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  Array a = new Array(100);
  list.every(bool f(var element) {
    a[element] = element;
    return true;
  });
  
  for(int i = 0; i < 100; i++) {
    Expect.isTrue(a[i] == i);
  }
}
