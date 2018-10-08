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
 * @description Checks that the method iterates over each element of the list
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  
  for(int i = 0; i < 100; i++) {
    list.addLast(i);
  }
  
  List a = new List(100);
  list.every((var element) {
    a[element] = element;
    return true;
  });
  
  for(int i = 0; i < 100; i++) {
    Expect.isTrue(a[i] == i);
  }
}
