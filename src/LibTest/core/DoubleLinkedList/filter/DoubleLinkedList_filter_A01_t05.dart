/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new collection with the elements of this collection
 * that satisfy the predicate [f].
 * @description Check that exception thrown in [f] breaks the iteration
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  list.addLast(1);
  list.addLast(2);
  
  int count = 0;
  try {
    list.filter(bool func(var element) {
      throw "Exception";
    });
  } catch(Object e) {
    Expect.isTrue(count == 0);
  }
}
