/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies [test].
 * Checks every element in iteration order, and returns [false] if any of them
 * make [test] return [false], otherwise returns [true].
 * @description Checks that the method returns correct value for various
 * predicates.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue<int> list = new DoubleLinkedQueue<int>();
  
  for(int i = 0; i < 101; i++) {
    list.addLast(i - 50);
  }
  
  bool res = list.every((int element) {
    return element > 0;
  });
  Expect.isFalse(res);
  
  res = list.every((int element) {
    return element < 1000;
  });
  Expect.isTrue(res);
  
  res = list.every((int element) {
    return true;
  });
  Expect.isTrue(res);
  
  res = list.every((int element) {
    return false;
  });
  Expect.isFalse(res);
}
