/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisfy the
 * predicate [f]. Returns false otherwise.
 * @description Checks that the method iterates over each element of the list
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";

main() {
  Queue list = new Queue();
  
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
