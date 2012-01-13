/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new collection with the elements of this collection
 * that satisfy the predicate [f].
 * @description Checks that the method iterates over each element of the list
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  Queue res = list.filter(bool f(var element) {
    return true;
  });
  
  Expect.isTrue(res.length == 100);
  for(int i = 0; i < 100; i++) {
    Expect.isTrue(res.removeFirst() == i);
  }
}
