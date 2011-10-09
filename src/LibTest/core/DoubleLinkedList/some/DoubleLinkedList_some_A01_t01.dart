/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if one element of the collection satisfies the
 * predicate [f]. Returns false otherwise.
 * @description Check that some() does not iterate over each element of the list
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  int count = 0;
  list.some(bool f(var element) {
    count++;
    return true;
  });
  Expect.isTrue(count == 1);
  
  count = 0;
  list.some(bool f(var element){
    count++;
    return element > 50;
  });
  Expect.isTrue(count == 52);
}
