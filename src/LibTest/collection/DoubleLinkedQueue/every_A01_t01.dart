/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Returns true if every elements of this collection satisify the predicate test.
 * Returns false otherwise.
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
