/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if one element of the collection satisfies the
 * predicate [f]. Returns false otherwise.
 * @description Checks that the method some() returns correct value.
 * @author msyabro
 */


main() {
  Queue<int> list = new Queue<int>();
  
  for(int i = 0; i < 101; i++) {
    list.addLast(i - 50);
  }
  
  bool res = list.some(bool f(int element) {
    return element > 0;
  });
  Expect.isTrue(res == true);
  
  res = list.some(bool f(int element) {
    return element < 1000;
  });
  Expect.isTrue(res == true);
  
  res = list.some(bool f(int element) {
    return element < -1000;
  });
  Expect.isTrue(res == false);
  
  res = list.some(bool f(int element) {
    return true;
  });
  Expect.isTrue(res == true);
  
  res = list.some(bool f(int element) {
    return false;
  });
  Expect.isTrue(res == false);
}
