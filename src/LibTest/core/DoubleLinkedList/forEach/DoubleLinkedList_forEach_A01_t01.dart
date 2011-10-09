/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] to each element of the collection
 * @description Check that forEach() iterates over each element of the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  Array a = new Array(100);
  
  list.forEach(void f(var element) {
    a[element] = element;
  });
  
  for(int i = 0; i < 100; i++) {
    Expect.isTrue(a[i] == i);
  }
}
