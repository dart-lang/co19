/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisify the
 * predicate [f]. Returns false otherwise.
 * @description Checks that the method returns correct value for various predicates.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue<int> list = new Queue<int>();
  
  for(int i = 0; i < 101; i++) {
    list.addLast(i - 50);
  }
  
  bool res = list.every(bool f(int element) {
    return element > 0;
  });
  Expect.isFalse(res);
  
  res = list.every(bool f(int element) {
    return element < 1000;
  });
  Expect.isTrue(res);
  
  res = list.every(bool f(int element) {
    return true;
  });
  Expect.isTrue(res);
  
  res = list.every(bool f(int element) {
    return false;
  });
  Expect.isFalse(res);
}
