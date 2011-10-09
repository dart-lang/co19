/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisify the
 * predicate [f]. Returns false otherwise.
 * @description Check that every() returns correct value
 * @author msyabro
 */


main() {
  DoubleLinkedList<int> list = new DoubleLinkedList<int>();
  
  for(int i = 0; i < 101; i++) {
    list.addLast(i - 50);
  }
  
  bool res = list.every(bool f(int element) {
    return element > 0;
  });
  Expect.isTrue(res == false);
  
  res = list.every(bool f(int element) {
    return element < 1000;
  });
  Expect.isTrue(res == true);
  
  res = list.every(bool f(int element) {
    return true;
  });
  Expect.isTrue(res == true);
  
  res = list.every(bool f(int element) {
    return false;
  });
  Expect.isTrue(res == false);
}
